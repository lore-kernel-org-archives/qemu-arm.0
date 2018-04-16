Received: by 10.28.4.212 with SMTP id 203csp2506536wme;
        Mon, 16 Apr 2018 03:59:04 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48p+Wc8di2wqVXGyeHNG5d2S/DskcS10+oV5wt1sDqiIrPgvQSCMCkIfD5EAXoMtvicF3FD
X-Received: by 10.55.4.12 with SMTP id 12mr3659338qke.277.1523876344148;
        Mon, 16 Apr 2018 03:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523876344; cv=none;
        d=google.com; s=arc-20160816;
        b=TbpR1bsmdvTbNWHiu3NUH2lYs82a94vyeJmCeSxHoLnuv79gj/6mgkhaPw4nWUTqR5
         AQ+j5D3IxID4jt+NiQJZ0oaK4e4wCu2eXRY6V7dTiARZak9J4RNHlYHie05AjQwhczvf
         NTHLoXlRaP/4YYyEnr5W7U7hn+JVPBgE0JzGjnRQ0mRrrdBh/gS1eqip7s4y3ilo8PoI
         /SUVjUFNvE9L/yhHbRpI2ySf5if+agJj8LT5mkA0hRcI1z9/Nnmly+BRQatG6q2ETkUa
         G6krxlpgM72GisS0NcwkTICT3eet1pzd/RmV3TYMDEfSedA4smPG5ehY5J7P+i2HDwuu
         Og1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ep9eerTLI7rtTD0oZO8E+KmuaHNtotKtkr7W+poZrf4=;
        b=gc0OUjuvpvr/T0Kvw2Mk4UtW3rukUhqqCxoEqqiho21ruueZvaX4s4Pja7dXpDghWF
         RHSIFIP5cOMERgTAfUL5JkYr0GKdASOy40FD33ymXTF/zzu91vjk/EqmusQRAmQVo7MJ
         8w+/j79fZi20vb0Zll0XpoViAv6FhvaY82QFqI0KbNlzAV/dS2tTkIwJaKLky6Vl0Lkl
         t9TMUauY7BhryuHqaT7+cQ4wXTg/A0K1uoDyz3fy0XbYw6rSW8WdCwxT/BeQ59JUl1xd
         abm9JGMWp99l+89neqwlc9MTAyHkRaV51mzVuZ5f/kn3BIWfnOFDwwdRbBDItsduY5Nw
         oxmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=avNQHsH2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o13si1900835qtg.131.2018.04.16.03.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 03:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=avNQHsH2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f81qh-0004XN-N3
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 06:59:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f81qT-0004Wf-P3
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 06:58:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f81qT-0008Dw-0C
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 06:58:49 -0400
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236]:35441)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f81qS-0008DI-QP
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 06:58:48 -0400
Received: by mail-ot0-x236.google.com with SMTP id f47-v6so16859749oth.2
	for <qemu-arm@nongnu.org>; Mon, 16 Apr 2018 03:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ep9eerTLI7rtTD0oZO8E+KmuaHNtotKtkr7W+poZrf4=;
	b=avNQHsH2VLyHoAx5YFb518remI4ZSqdh8Hn/0Qldnk4UtIRmF4jdOi48kSWxDJt5PE
	xOijOdsNEyb9nVcM3tlnANTtnIzGwpwzrj8qsgpSn/VGM6TpDjLsABtCAx78HeIEM1TV
	Kxo56vQbTrb+WbvxDYDXANNFT18wri9NsN1TI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ep9eerTLI7rtTD0oZO8E+KmuaHNtotKtkr7W+poZrf4=;
	b=hizNJkrvttt2m3jIIR/Pw8t4zZJwo9erOQ4rMQAiiO/kFFcRME/G0KZHUGijqLydKv
	d+lzJ2yF4vkvxab2THqmCyx/Ykdw53LmI0z10CDggqKkYEufc5YV7qPiLiOdgtn0aR2V
	5cs+VMIM/f7MpMYzPo8fXnCwEQ29MNy4lT+f0JUeelu7XzpgCylAEA3q8OFhcTvtKua3
	mcx7zRMAt8b32WDjkKG9Dqy/cN9iV6OMgbeGLFIio3yjKwzzJAypOb+qEpkl2m+x3wle
	hv9DiO9QxzVDaL/wzTyyuWpSqKgG2Sj5Dp1uNtzRkivfRs05GONznfRq1ueOutItBp5z
	dupg==
X-Gm-Message-State: ALQs6tAY9w+ef6Ix3Jvh2ehqMyMT5gGylzwVpSg9EczTxeZPzMQx/g29
	mWtJbtbHwgeOXfTolNXCa6VUm9tqv6Rya+NP39Eljg==
X-Received: by 2002:a9d:3a45:: with SMTP id
	j63-v6mr9571216otc.126.1523876328088; 
	Mon, 16 Apr 2018 03:58:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 03:58:27
	-0700 (PDT)
In-Reply-To: <20180416091941.7n24dd3qjyuqh4h6@kamzik.brq.redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-9-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_O3QK0t5DHfnAFEOHv_yyxvL9HZX+0geHs0ibVVwTbNQ@mail.gmail.com>
	<57b01152-1179-9735-eb6a-a9dbfc933a6c@redhat.com>
	<CAFEAcA-wT8vERbkjq_HoROi1ymPauAe+y3oc16zoCJXsHKqBoQ@mail.gmail.com>
	<94299045-3027-517c-d634-4613f78de163@redhat.com>
	<20180416091941.7n24dd3qjyuqh4h6@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 11:58:27 +0100
Message-ID: <CAFEAcA9dVuki+ZL7d6_LecZX03hrW3PxOdcpUZ8WkcDwKw1-cA@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::236
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 8/8] hw/arm/virt: Allow up to 512
 vcpus along with KVM VGICv3
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
Cc: Christoffer Dall <cdall@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7vs3IB8TEtw3

On 16 April 2018 at 10:19, Andrew Jones <drjones@redhat.com> wrote:
> This is the cleaner choice, but I wasn't opposed to the max-vcpus
> query getting double-duty though. While the backporting argument is
> a good point, I'm not sure we've ever really cared about what
> issues backporters have had to endure when they cherry-pick features
> before.

Well, mostly I didn't like the entangling of two different
features, so we look for the presence of one by checking
for the other. That's confusing going forward as well as
awkward for backporting. Plus if we have a difficulty with
detection of new kernel features like this we're probably going
to run into it again in the future, so we might as well sort
it out now...

thanks
-- PMM
