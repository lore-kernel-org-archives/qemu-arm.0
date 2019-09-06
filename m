Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp507773wrp;
        Fri, 6 Sep 2019 03:15:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyH6SYCNinsqsfQ/QCbcj6ywL8hFrcMrFp5siJKw0prxMXP/j1fMc5Ma3cPm+uVKTxWDwB6
X-Received: by 2002:ac8:47cb:: with SMTP id d11mr1917676qtr.365.1567764950671;
        Fri, 06 Sep 2019 03:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567764950; cv=none;
        d=google.com; s=arc-20160816;
        b=Rsp5zlKm8PYNIUIf6CW45jUMuUIPuXN8NUQy0QOXfamF1PwBMndKnApQsdAYovVqHI
         9rqOS8xuMphu2fxNV62/JKqdCCZ6mGlvDON14T3BaHs/Q1XRSeaG4sBc3iOwDkC2hxz9
         beqPGvfzQTOnROhRZknQaG9WoZ5cLZe547rbrxu3vnVRDenduR/GmhghffWNxtlI5ajd
         hiFIzzguKmyDii91cbNSiyi5cmDIvek67Bm68p2NANGaiCUZy9KY/Oig1Yl2rSzyXAAK
         iFE/HM3RTW/4oz/qehCm2dWobLJ5k7LItE1LbUViyt8b0pFAI3rEOVUY62ksmJTl+LHF
         xpCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WEnueH3OYCFrf9LIgd88/cny1qkF/Qf5i/wDCMtXRrA=;
        b=jhP/uHWo34ALPSonT0a8VOx6WyyTs+rDA43e947l6upoWADNf5UgRQWmcuAVkyQc5U
         XbapEkqVBETafstePQHX9NCfbIX5+cLlL+hEbpA83s/TtdP89ls9h3NyC9VhU1rwOsaJ
         AgA9vFkQwgolsKzUUVGzequZyUdCiPuifECPrziNApDy+XwQLKwdT20htQEwJ7iNCpEL
         yULzAmdEHH6lbsLOvoUjcnzKFxRLZvOOMnaTqPywBpdLUf/IScOE9+XQOQ9mRFBzw8sx
         JKaVBFY2WNeLsvg8LxPFM350yU2/2BO5/EajmYJJNczaSdPIM3lWPQq4zL3HjlzHeK8z
         lIhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C78RHKDM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b50si3611373qtc.62.2019.09.06.03.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2019 03:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C78RHKDM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i6BHS-0000Fh-4T
	for alex.bennee@linaro.org; Fri, 06 Sep 2019 06:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45532)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i6BGV-0008BU-JL
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 06:14:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i6BGU-0006Ix-6Z
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 06:14:51 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33528)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i6BGT-0006Hr-Ui
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 06:14:50 -0400
Received: by mail-oi1-x244.google.com with SMTP id e12so4221591oie.0
 for <qemu-devel@nongnu.org>; Fri, 06 Sep 2019 03:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WEnueH3OYCFrf9LIgd88/cny1qkF/Qf5i/wDCMtXRrA=;
 b=C78RHKDMOO02oduj9+AJA6gcuLSYiBoCqpSn0conxZxkJNN3Btnu6gWphmTheqK2TF
 qcRBNK1ckpq3TkcLFzvstW4r5Ex0RXEmKBKTWclc6QzqOEAvy5tYbyJLiIu9gf0ptl6N
 VxGctMMyb8WutdfDJAfidsjDH/1rWtbmMTqSh/nHfZUuKnnQwge3SLyZoN1dLEKgMDSB
 /CzSU3CsG4rcul2TnEfvTVOhNbLFK+ymKNDzdFqEa8mUR+F19wb/u5jBN44BeY/0QCQz
 TFW4AEyN0aGRqXW0D/tsIsBi8kTpPaPMKKnPQ3lKd3t3x4eJnfMIuKBVwS7HRy6takCH
 XcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WEnueH3OYCFrf9LIgd88/cny1qkF/Qf5i/wDCMtXRrA=;
 b=caWKbAgT1WfVJ1ixZ7j5gpAVUDSpn/hyber3yGqghhbGOpikYwS4PzQRLKWXGGbgGI
 8vhND6ycBF5ZwsTuM3KCK8fa5W+w37tMvdYTTrYA55V5AdIQPnNgisx2pRD+3wrfOwWR
 6anEpwT8AUyDFbqthRac3IyYDAs2djzyp8q/1gU02UN+Aa5nJFRfi4TLy8xXUec65BKF
 HxtWc4Q/eP0pX8sCDx7T33brF73zXB1XjwXG6MkNgyo+fD6TI749XBKES63VuAxKBoOw
 y6lAt7VSRlCtDC2Beq+J1VI1x42Z8EA7U/q38PUQebakJkzFF0rV8k9QHCumeiIZ82S9
 L61Q==
X-Gm-Message-State: APjAAAXo2WpGBVPG147HjWHeOlZEm1GBfYIaMJ10zkk1rPYPywMehdmR
 5KF+Kr9iiFZvaMh4DQf+9LB8gXzwQqpxKzre8pK84g==
X-Received: by 2002:aca:281a:: with SMTP id 26mr6315714oix.163.1567764888790; 
 Fri, 06 Sep 2019 03:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190827160554.30995-1-eric.auger@redhat.com>
 <20190827160554.30995-3-eric.auger@redhat.com>
 <29520007-f3fd-ed8d-f52b-2839f991556a@huawei.com>
 <0dd3bc89-8f91-0f8e-8908-18712240a115@redhat.com>
 <CAFEAcA8u3Qe9zx=4QxW_Bb8a=JQ7kUmiAO5H-cwAU4i3R+Nf8w@mail.gmail.com>
 <9bd0a5b8-ad15-d19f-2bcc-8b605afb5b78@redhat.com>
In-Reply-To: <9bd0a5b8-ad15-d19f-2bcc-8b605afb5b78@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Sep 2019 11:14:38 +0100
Message-ID: <CAFEAcA9LzvGzpsKMZjG7f1GaHLLyMto2enGrQ_dUPTwiPNA-Gg@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [RFC 2/3] intc/arm_gic: Support PPI injection for
 more than 256 vpus
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>, Marc Zyngier <maz@kernel.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pf1bT6QgehD9

On Tue, 3 Sep 2019 at 09:40, Auger Eric <eric.auger@redhat.com> wrote:
> I guess arm_cpu_kvm_set_irq attempting to inject IRQ/FIQ into KVM is
> used with userspace GIC emulation, which is not supported along with
> GICv3. But anyway, I guess it does not hurt to set vcpu_index2 in
> arm_cpu_kvm_set_irq?

Having now got up to speed with the kernel patchset that goes
with this one: yes, we should set the vcpu_index2 in the
arm_cpu_kvm_set_irq function as well.

Given that we have two callsites that now need to assemble
the value for kvm_set_irq() and the cpu_index field is in
two pieces, maybe we should define a utility function that
takes cpu-index, irq-type and irq-id as separate arguments
and assembles the fields into the right places and calls
kvm_set_irq() ?

thanks
-- PMM
