Received: by 10.25.0.147 with SMTP id 141csp648830lfa;
        Tue, 21 Feb 2017 11:34:04 -0800 (PST)
X-Received: by 10.55.16.67 with SMTP id a64mr27200455qkh.226.1487705644700;
        Tue, 21 Feb 2017 11:34:04 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si15783173qtr.89.2017.02.21.11.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 11:34:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48097 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgGCI-00055T-77
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 14:34:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgGBB-0004Zs-MT
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 14:32:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgGBA-0004qu-Sf
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 14:32:53 -0500
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:36499)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgGBA-0004qd-Kp
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 14:32:52 -0500
Received: by mail-wr0-x22c.google.com with SMTP id 89so83972265wrr.3
	for <qemu-devel@nongnu.org>; Tue, 21 Feb 2017 11:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jJ0Naq/B+96m9Re8s3/C49gzkRhhVukYTSlpc//uuCk=;
	b=DKrxdghP29o0iWbAYm38czwcw+Dvghk5P83rUcuBXPnrjf0kgAouLsvjonPcx2Z6Eb
	AhWeNBrH6Di4Ju/ASkCe9jbEjNb0UC+JLQ0nFXPreoDQ77sYxdJyIVAEgwhRLY2DjDHG
	9EYt2ZAQgyyLP+IcnsLI2jnJkxiJ/2nUZlECs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jJ0Naq/B+96m9Re8s3/C49gzkRhhVukYTSlpc//uuCk=;
	b=gOr8evHHJAzpOpUyKSauVhEBjHglZ10l5FSRq4rLmNVd3lxLIvHXHV3/+CjVwYllSw
	3XzLFAqCJCRUHdCDHkvKvGCp4Q6P1o0ecaUcazpte8WQeimR9p8T1g5GRJY05Y4HhMRP
	3DUlkcotBKtcuoJk53EkJVBZNibl6096SnlSSvLfYloB+MLjKPQppNpaFqFlH1WOpXFd
	a6gqr88Sbiv5zCx+Ua1Qj2DRAiIC2Dm9x2IgKN0Zn8cHK745FDTg2nyfgu+aR5OUyGwy
	xT8Eb/sfypFN11yHGe2EvUI90f02X+H8bpEOcl224Uv1bxJhvqzbkRZTn0uXKZaIOhlk
	LmPQ==
X-Gm-Message-State: AMke39kuMPGwgeUjB6d96O9ezDFkcvaSCp5yTZzpVMwfqPgjCjcouMiz/sY5Rj6O2wpHHEF+vKfsM29H/UWpRjfI
X-Received: by 10.223.150.209 with SMTP id u75mr4175764wrb.195.1487705571518; 
	Tue, 21 Feb 2017 11:32:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 21 Feb 2017 11:32:30 -0800 (PST)
In-Reply-To: <20170221182859.GH2778@thinpad.lan.raisama.net>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
	<20170221182859.GH2778@thinpad.lan.raisama.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2017 19:32:30 +0000
Message-ID: <CAFEAcA9eBdjWTU975LrpAMihM5wMagL4G9bOORc0ypqpmLb=5w@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-devel] [RFC 0/3] generalize parsing of cpu_model
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "patches@linaro.org" <patches@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zxGlzq9IKhb8

On 21 February 2017 at 18:28, Eduardo Habkost <ehabkost@redhat.com> wrote:
> Peter, do you think a wrapper for parse_features + object_new()
> would still be necessary to avoid too much code duplication on
> arm boards in 2.9, or can we live without it until we apply
> Igor's series (probaly after 2.9)?

2.9 is very close now. I don't think we need to change any
of the existing board code. Though there are quite a lot that
don't accept -cpu foo,feat=on syntax because they use
object_new() to create the CPU but don't call parse_features,
they've been that way for years (eg since commit 223a72f1179dc0b
from 2014 for versatilepb). We should figure out how we want
to handle this and change all the boards just once, for 2.10.

thanks
-- PMM
