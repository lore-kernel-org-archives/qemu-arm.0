Received: by 10.25.0.144 with SMTP id 138csp1271000lfa;
        Tue, 11 Apr 2017 05:07:40 -0700 (PDT)
X-Received: by 10.200.51.215 with SMTP id d23mr11397571qtb.55.1491912460812;
        Tue, 11 Apr 2017 05:07:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x93si3701082qte.181.2017.04.11.05.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Apr 2017 05:07:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxuaA-0006ip-7F
	for alex.bennee@linaro.org; Tue, 11 Apr 2017 08:07:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cxua4-0006i6-89
	for qemu-arm@nongnu.org; Tue, 11 Apr 2017 08:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cxua3-00036l-FG
	for qemu-arm@nongnu.org; Tue, 11 Apr 2017 08:07:32 -0400
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236]:36333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cxua3-00035E-8r
	for qemu-arm@nongnu.org; Tue, 11 Apr 2017 08:07:31 -0400
Received: by mail-wr0-x236.google.com with SMTP id c55so93820372wrc.3
	for <qemu-arm@nongnu.org>; Tue, 11 Apr 2017 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Se1aQt6sybcmUQKQ+tQ7GqynxaGbX4jZsLGBnH3Jv3A=;
	b=PjeAW5tuGTEkamAf4I0utFyhQbydZ+AwVk9/Tr+nmgDf0l4GtR0q+QvH66Otkv/7og
	5MSD5b0rQpDoBAlOQcC2YhQbtAyAOf2CS3UY/2iu7phJKXP7zKExgJnfW0I3C4o2Zb0V
	mW75FavOt/0t6IZmCfdNNEEvwn6ZqlxBL2IlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Se1aQt6sybcmUQKQ+tQ7GqynxaGbX4jZsLGBnH3Jv3A=;
	b=AYP0BS7HJeCMBFiCsoU1qcsd8AhTTneJNjy1HvB1bcGgSmCHbUX0xXil4MiDYQUAWg
	hJVBtj410sdYvipFQkS8vWzZ+peE7wTGpN5se3U2SLRlY2Tkt+EGiQHBoSrdBdk439tB
	cAUp9UO935HYODfl7gjXlrXBmleWab0GwYciSDR7gfvPeU6Nb6t6v9Z+xs0DCwhqnCLz
	Z1Ifs+kl0j/qf4GhGTEXq9FciUuw4wTzR4SUA0KcZpGc7BsQ861MOzZHSiORCzzOODGE
	QQ8GjDYWKnyjxtYwhlSu2joUOU1auQ86hIwMsDyE0T94XltCyFuUeWJM46q2n1L82GFy
	+cMA==
X-Gm-Message-State: AFeK/H3Nvyvaj4hOO/A/arf5MxBC1x6+q53h5hoMMwR4PdtRXPb+SRZ6SRIqmmxhcOG3JsGR/0o4H5mwOPanpySi
X-Received: by 10.223.150.149 with SMTP id u21mr32383120wrb.195.1491912450228; 
	Tue, 11 Apr 2017 05:07:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Tue, 11 Apr 2017 05:07:09 -0700 (PDT)
In-Reply-To: <CAJKOXPecitJXUxfzPut-nt+TzMEfncNpHHshCbAeZ-4pe_S4Xw@mail.gmail.com>
References: <20170318192509.15499-1-krzk@kernel.org>
	<CAFEAcA8WGoa=DYXRH4MHfnHmUR_5-xERdmcuqrsk=bmS7GBCmg@mail.gmail.com>
	<20170404134402.GA4196@kozik-book>
	<CAFEAcA9UGEVVUfL3--goP4mVU+ezegWPcoka41XM8d_E2yyJkQ@mail.gmail.com>
	<20170404143121.GA6421@kozik-book>
	<CAFEAcA_DaW_DdcYweHPGpJrMNMP+Sd-Bw6W_OM7tCF5cMyh4aQ@mail.gmail.com>
	<CAJKOXPecitJXUxfzPut-nt+TzMEfncNpHHshCbAeZ-4pe_S4Xw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2017 13:07:09 +0100
Message-ID: <CAFEAcA-FTFQMa_O24R7BWSorroCXrfQkDtqjrmty88A0fiLLHg@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::236
Subject: Re: [Qemu-arm] [PATCH v2] hw/misc: Add Exynos4210 Pseudo Random
 Number Generator
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: svPRm1ZnGVCK

On 11 April 2017 at 13:02, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> But first I need to setup proper booting image + rootfs instead of
> only initramfs. The sdhci node is failing (missing regulators or
> capabilities) so essentially there is no storage now.
>
> How do you access any kind of disk image in case of other boards?

Depends on the board, some of them have SD controllers, a few
have PCI controllers that can take a virtio or scsi controller.

thanks
-- PMM
