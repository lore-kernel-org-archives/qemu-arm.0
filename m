Received: by 10.25.85.209 with SMTP id j200csp77862lfb;
        Fri, 10 Jun 2016 09:44:40 -0700 (PDT)
X-Received: by 10.200.42.152 with SMTP id b24mr2713347qta.35.1465577080567;
        Fri, 10 Jun 2016 09:44:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t123si6758553qhe.9.2016.06.10.09.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 09:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBPY0-0001CK-1G
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 12:44:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bBPXa-0000vS-QL
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 12:44:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bBPXU-0003cM-NT
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 12:44:13 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:33225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bBPXU-0003c3-IQ
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 12:44:08 -0400
Received: by mail-vk0-x22e.google.com with SMTP id d64so104965387vkb.0
	for <qemu-arm@nongnu.org>; Fri, 10 Jun 2016 09:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XRiIx/a9OoBy+6gcWLGWuPZFeWwNiL3F+bp3QBMyV/I=;
	b=U+1a4yVtg4WkkqaIu9Nk48Id0v8JC2bBrwjgWy4OvPHPE9QRHDS/8D3vE3q0pRkM7S
	emD4fekyM86U1QtgLnQ6s5EImNarOVAKdRbzFEand8/9aiqdLpE2Y81OEMsmmS3/DRVN
	7IC4j5xOzwgN8oNOf/tmepcKidA14M5M4wxjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XRiIx/a9OoBy+6gcWLGWuPZFeWwNiL3F+bp3QBMyV/I=;
	b=kDHjeEGEFTSuLmBjEqOY6nNuV9C3UenmbSnxAfPQpuMLwg15T3HAUWrWYrMkm4TsVt
	N70VHYIBDtCjJC41OK6G8dBOHsnwIS1fsq9Hd/QTEuoKASh+ng2z4zZVhFea4kb/1FYm
	aA+3biFOsGk7zmHJhk6n/t8xooRiapPmhHBHaz3gVB3OXu5qjGfl2TpHjCHS5QIfrvk9
	mfWAHNZ8eFwgDs03T0YeBkzYdy94rxto77O3ht/FFFnzWZDRDaGFOJha4CEnyaU+58Y+
	vdmaN59ERmy1zWwr2abuTyuIk6lBgGk0Ndr+F0Jn9vYvk/r73aG6sOJ8LOWSRSMDSGBw
	ayQQ==
X-Gm-Message-State: ALyK8tJJM7aCYN31Qzva+f65LKwa7k6P2+1otQdtU3ZF5sMAeezVJP6FF06sRwJUKoGuJX0x84KXNOeFzcqOpH+U
X-Received: by 10.176.64.69 with SMTP id h63mr1206003uad.125.1465577048084;
	Fri, 10 Jun 2016 09:44:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Fri, 10 Jun 2016 09:43:48 -0700 (PDT)
In-Reply-To: <4506161465576922@web25g.yandex.ru>
References: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
	<1465575999-3594234-2-git-send-email-afarallax@yandex.ru>
	<CAFEAcA-UqUdkoM2abzNiVstLR9tO_SgaQBTjsm=QHt-Hr6xrzQ@mail.gmail.com>
	<4506161465576922@web25g.yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2016 17:43:48 +0100
Message-ID: <CAFEAcA9wU2=jsfAqDOA=ZhOkAZ2wxmkYFhGDw=OwKFM6-04=tQ@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-arm] [PATCH 1/2] Fix confusing argument names of
 do_unaligned_access() functions
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
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XPZsJjerRXGa

On 10 June 2016 at 17:42, Sergey Sorokin <afarallax@yandex.ru> wrote:
> What if I combine both patches into single one?

No particular objection.

-- PMM
