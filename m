Received: by 10.25.21.156 with SMTP id 28csp363451lfv;
        Tue, 12 Jul 2016 05:59:55 -0700 (PDT)
X-Received: by 10.55.109.198 with SMTP id i189mr2848299qkc.140.1468328395371;
        Tue, 12 Jul 2016 05:59:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g44si2320157qta.105.2016.07.12.05.59.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jul 2016 05:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMxI2-0005bj-Qb
	for alex.bennee@linaro.org; Tue, 12 Jul 2016 08:59:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMxGq-0004jY-Kf
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 08:58:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMxGl-0006Nb-Lr
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 08:58:39 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:36044)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMxGk-0006NF-Dm
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 08:58:35 -0400
Received: by mail-vk0-x231.google.com with SMTP id f7so20143499vkb.3
	for <qemu-arm@nongnu.org>; Tue, 12 Jul 2016 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K96MWfr2SkxKxcaJkqGw8rJXAytC6JbimQaWoizcQ/s=;
	b=kdVhA7rap7NtNK4z3gWvzzQGkhGmIplxOirPbNmjSFsmckoqDork+PB2zdOGeEeDEO
	ZG1Vv6669U0rYEcUvrmxjADOad+KN5cgpQj0sOzNvi4NXDz2v+9NbAOFOGTPp2yUgRIc
	3mi/Wh36yKGpKyUIf32c0AOOq9IiZHc0uFP2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K96MWfr2SkxKxcaJkqGw8rJXAytC6JbimQaWoizcQ/s=;
	b=KjfOqw58h7T0V/jEggUKAvYw8UnJNVHxccSr7DZA+x/VqGzP3AO3CpL0hTxlnbhxYH
	nKKH42ujjpPQ3+FO8lanmcvXt/ZuTn10Rhu9yyBTWw7GRYinmEr40ubCenXCiyARHeyv
	gF6BfJHGWu9fibJFOeMLf/qLzYmf/GurXS8ju453A8lV1ztEK3E0qAaMaMKVdEiNP3WW
	CJszeBVLefMmLixv1V5/mCE5tbdiTy5RfCEhQY0CM4q/61bMCRXCuTRpR89AwTMB53DL
	0LOKns3y9TOi+aFgWpO6bBFlDSsyOUk/jbEsl325oULlY9UqAIKl7cnfml8Km8hmtsi6
	I4ww==
X-Gm-Message-State: ALyK8tLDkvGcJJBKqjF04GUN7h/KVRnvPkQWj+AP6qsDMu7n//KhnKP/XiMV8E3gIuQfL1U/z+Y/DkXHY7jO2bXJ
X-Received: by 10.31.152.85 with SMTP id a82mr934894vke.47.1468328313868; Tue,
	12 Jul 2016 05:58:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.69 with HTTP; Tue, 12 Jul 2016 05:58:14 -0700 (PDT)
In-Reply-To: <1465907177-1399402-1-git-send-email-afarallax@yandex.ru>
References: <1465907177-1399402-1-git-send-email-afarallax@yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jul 2016 13:58:14 +0100
Message-ID: <CAFEAcA_AmVXO+YKXmWTE75sqezubLzP0Q9SuxDV2+fv4+Gp4vQ@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [PATCH v2] Fix confusing argument names in some
 common functions
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
X-TUID: KXx8zQNEkBIE

On 14 June 2016 at 13:26, Sergey Sorokin <afarallax@yandex.ru> wrote:
> There are functions tlb_fill(), cpu_unaligned_access() and
> do_unaligned_access() that are called with access type and mmu index
> arguments. But these arguments are named 'is_write' and 'is_user' in their
> declarations. The patches fix the arguments to avoid a confusion.
>
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---
> In the second version of the patch a type of access_type argument
> was changed from int to MMUAccessType. To allow it the declaration of
> MMUAccessType was moved from exec/cpu-common.h into qom/cpu.h
> The series of two patches was merged into one.
>

Applied to master, thanks.

-- PMM
