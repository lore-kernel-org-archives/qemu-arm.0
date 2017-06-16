Received: by 10.25.0.23 with SMTP id 23csp1324510lfa;
        Fri, 16 Jun 2017 07:51:52 -0700 (PDT)
X-Received: by 10.55.132.69 with SMTP id g66mr12738666qkd.36.1497624712516;
        Fri, 16 Jun 2017 07:51:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497624712; cv=none;
        d=google.com; s=arc-20160816;
        b=Ct++8En1Z2wGYAsRaCROpcUiiUfpILuph8wrxoQZlcsINfLGQO0k7gpCs8OWCo9OG+
         U6q/w2XyYiZANR3smCmvrfHq3vKZkCEXQuApijyZM5UVnr6V7qrL0F4Lh89DIc3qlud1
         mMNBWPagLS7vxVIbkAdM/RoXk7Z3iPvj0MV/HxP1VCHJT36dRj+QOik5DDDEqYjqcfQo
         KhXKt99RMa7ZGG4cCnYMMC/wAbXS0Dgstj5tDE9bnWsnZ/Xl0hdV1cDOXMPsbgEoK7rG
         RGlM3em5PzdC8yaT/4WtKI5Tm+CtiZ16jhUMB1Nwovm37QFeTU0gwVDBQvTFBtbzhJhg
         voHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=/UBE9Dg+fpHL59gEhYByGOxrOTCa7H2u0/voit6EH/4=;
        b=aBI0aQm1WT0rMNazuK6awU0xRpsS06EVr62RNS9HsQi5oy0J4C2oCEQ+inHZX0IYu8
         f5mFTWhaCBF+Vj9sTWwn9NJc2CQBDPza4I2G7HcD5eyNHoUGvCinqJVY8hQoGddu9iKO
         aTahgxQMi0UF+NK9sqrRDWX9psAw0ooXHJ/2nEgskSnWM/Q0dtypg9jqeVajvWwE6BBD
         AQrYe5RY+MwvNA71OaV+xf45yB0qGda/fZDV2be4Ap6il8RVH9GAHB0nibjjz6V7qkrx
         Ee+dHOptKj2TaGVROPC5t2jRBUGXl52y7Mqo19TgSsrSZDG0JD4Wk26Wx5z3fT1Yucx0
         9Ebw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=F4NLvde4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s34si2177759qtd.18.2017.06.16.07.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Jun 2017 07:51:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=F4NLvde4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dLsbF-00079x-QL
	for alex.bennee@linaro.org; Fri, 16 Jun 2017 10:51:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dLsbB-00078f-CJ
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 10:51:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dLsbA-00035P-In
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 10:51:45 -0400
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236]:36062)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dLsbA-00033b-DJ
	for qemu-arm@nongnu.org; Fri, 16 Jun 2017 10:51:44 -0400
Received: by mail-wr0-x236.google.com with SMTP id 36so39640070wry.3
	for <qemu-arm@nongnu.org>; Fri, 16 Jun 2017 07:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/UBE9Dg+fpHL59gEhYByGOxrOTCa7H2u0/voit6EH/4=;
	b=F4NLvde4unKLUgJ4BmQ0emBgoRfq1R4aH66V0omDjZd31Jr99j0B07Yr1NDjfvCxe4
	z8IUSwltfHDtsj+n5F2Ej0vX8F/s2usWHEqlrwWAapkklFR9l6FFrK4baT+t++FJg1qu
	jNEsdSeApKbgqsgBgO/K6QSzNqwSMt3LgHKoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/UBE9Dg+fpHL59gEhYByGOxrOTCa7H2u0/voit6EH/4=;
	b=id5ulPhE3lWcm9wbDQYrTOAp5GY6rXdw9/InNd8ZC6VTg+jxGwbJwL6glIwivepviS
	M4LYv9Lj5QZaDxhcuQSbnswe2Apj06PAY9ufB0PktpbW+Nq0x/U5RSQww21riDiG0gvQ
	uqCAim7l31/J7p2QywXvwhpfI82o03Y3kRA8CYmX/uWfyqE6WDhDkoR0KrlJ6bC7Lhru
	ZVn3yJl+kzGHIg/n4WOvM/exONThJIVXzUBGY4XzvocgylaQBXPlY0vLbWHjCgrrMdsI
	JPlpW/5jnZiNGJXJ1e009Gpy4BF9G20UEQpVkBwwjzkwT/uKr6l4uwUaaP+ZFeGMFUJw
	Ie2A==
X-Gm-Message-State: AKS2vOxZEA4Rx0/J9cIY5go87g9GELEO1WE/Em1Z+CfPt+2WmyRK5/En
	uZHdgJ0mWxshyujAGxWhkHuw8NeRaZ4T
X-Received: by 10.223.150.163 with SMTP id u32mr7763853wrb.195.1497624701499; 
	Fri, 16 Jun 2017 07:51:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.55 with HTTP; Fri, 16 Jun 2017 07:51:20 -0700 (PDT)
In-Reply-To: <1701daf4-b2de-a9fb-7337-7aa791676516@lauterbach.com>
References: <1701daf4-b2de-a9fb-7337-7aa791676516@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jun 2017 15:51:20 +0100
Message-ID: <CAFEAcA_+rS8gjjU+g1e71vBBioxaWX94+SvMqVh=Ta37ZhYGjA@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::236
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Bug fix in filling
 the cp_regs hashtable
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vHQW3y3ijF3R

On 16 June 2017 at 15:42, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> Check if the CPU supports AARCH64 before adding  the 64bit view of
> the coprocessor's register to the cp_regs hashtable.
>
> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
> ---
> Bug description: if a register has the .state = ARM_CP_STATE_BOTH, its 64bit
> view will be added to the hashtable even if the CPU is not 64bit.

This is deliberate and required. Where the AArch64 and AArch32
states both have a register which shares underlying architectural
state, QEMU chooses to implement migration of that state usually
via the AArch64 version's ARMCPRegInfo struct. If the AArch64
version is not included in the hashtable for an AArch32-only
CPU then the state of the 32-bit register won't be migrated.
The AArch64 register is of course invisible to the guest because
it is only accessible via 64-bit instructions, but it's used
during migration.

thanks
-- PMM
