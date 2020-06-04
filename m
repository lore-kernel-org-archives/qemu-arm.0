Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1426457lfc;
        Thu, 4 Jun 2020 05:55:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiJEyDqW/EEzQ/FNoSF57dkViZJqADqSEnBk/cfoEu5KDB/ydPQbHHvVhkIEh6YFe2fMxo
X-Received: by 2002:a25:ad56:: with SMTP id l22mr7621210ybe.383.1591275358297;
        Thu, 04 Jun 2020 05:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591275358; cv=none;
        d=google.com; s=arc-20160816;
        b=BuUPTWsZeJNgqeCK6zBeKWHyTUp3rfDDkIXb6lzKHabbBcd+l1TSN2zlPZjcY/KNrK
         KQioPb27meY9RphBYX/Js1iYNHfwjUtqSqlKmnTUMlokXz1YPp4Jqy+p3X5Fxjzyf/I3
         zIGkf2hpQuiUKPPbCKpUlWBnaauR4wtaeClJenwYj9PwTiKH4JEjqlH0n/ARNOxcU4co
         zSMC4BJWHGqEYknWl0RSdOrwlaqXi56/04nQGVzFfrLk15spFVwPWy3sLJ0HO3glOHUm
         x1YhKTRWyC4WigTx1pnmS8nK3Dnw/vL5tRRMwjp/Mx2ntwLjc2w2y81hY5/fFSY3dt4x
         Hkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:content-disposition
         :mime-version:message-id:subject:to:from:date:dkim-signature;
        bh=rUu6a9rJHGf3ex3AMdBdG2Vh97Xd8nCLDS9SYciVjVo=;
        b=XUKv3lUkBoEXSekLgEdIADvD+JwvcUQ1IBIEP0gGbzGQCAw00fpK77YjQ+cckQb00d
         H0QB0OMcYyTNVVv3AHVsn9Mr64IDwhVLPfWbgdRVrYhlffFqLcnu2c2F3dZhSXFQNJHp
         KfP00gTYricEbKNRYFFzs1dfyyAVX/P47QDgrT2wGFN0yYXAW7rbe/0RUpu6CM1cunKm
         Q6cCyqSk7wsNLVRrsIf097qJGHndASC1IwYtJxDgqEAAqOBF61Tka7dipEMrqtJzHZLk
         oi6wM56KnNT4m8M04Qof7XLTbPVB9coihC1vJ5KKPgSgghbACjizPX5P81qE57kSWqId
         A2QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=aSTdigRb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 139si3963714ybn.306.2020.06.04.05.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 05:55:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=aSTdigRb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgpPZ-0004SF-Ln
	for alex.bennee@linaro.org; Thu, 04 Jun 2020 08:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jgpPS-0004Ru-GC
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 08:55:50 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jgpPR-00058l-FV
 for qemu-arm@nongnu.org; Thu, 04 Jun 2020 08:55:50 -0400
Received: by mail-wr1-x442.google.com with SMTP id e1so5998326wrt.5
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 05:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=rUu6a9rJHGf3ex3AMdBdG2Vh97Xd8nCLDS9SYciVjVo=;
 b=aSTdigRbk0UwqIv6Dk3LEI947Z7u2w5LKNa5ZCrnGqpoxynUfbmljSCGJR9AyrRe32
 3Myvvz4rsQqpHpDE2i1A4d0IIZJTMqjTAdBO2L0EFpTfVK7rrVN5OuNFwunmJFxE/AzH
 VIXx8ai5BcX804SU0zZ4iahNM7++RuZ9bXLzdRnHEf4NQf4KMaaxSMC8X/2tgLsQkMm6
 wW+ImzwY6WUaY6hHIrnnuSxTgUEEpei2SFYPDP1OCzA7inTHKCsBc8jTyqwTY32nACUB
 Q20NvwbipnBOLaTPeqW6C4VUDkh7CT+NPnWdufNIuOkHA4iGAxPwzk3Q/HLi72Ju/Aoe
 Zyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=rUu6a9rJHGf3ex3AMdBdG2Vh97Xd8nCLDS9SYciVjVo=;
 b=ZJUNw1OMf/bWvsNH7gPufX9SV0Cm0lGxiDCooGlVDGbcpPa0OnsB61PyvXmWCOoFNY
 il8FiNbBhvxXE7Rpp3z1Ar+CFCmLmXyTvrySCBds9qO/IPs+dy0Hc7oJMn5QBmmXi2ng
 NAnyB1103QwtHlyb8tJdc7isbfKB2isPb3hqW2LhC7p0qt+A02a8d9cyDa6Aa5ToWtaS
 f8LOonkY2xNftHBwq1tyH2G5OQ5cJeMAE6qk8Ba0d33Uffmh98HcMg+c+CN/1NC5nylB
 kibo5adKpQ099zGTkiD7MZaZspyccqNKO/CYuuF4jAQXnA5w0DHWGCXk3zu5SJyqvo0V
 BVUA==
X-Gm-Message-State: AOAM5301/Oslp2Koue1rv364mgO55DUrnsll5pdT/EsMek2ypJNQaiY+
 Z2sEiJf5ovn/LgqLBAkSVg4ziw==
X-Received: by 2002:adf:f812:: with SMTP id s18mr4147864wrp.28.1591275347408; 
 Thu, 04 Jun 2020 05:55:47 -0700 (PDT)
Received: from vanye ([2001:470:1f09:12f0:b26e:bfff:fea9:f1b8])
 by smtp.gmail.com with ESMTPSA id f9sm7627646wre.65.2020.06.04.05.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 05:55:46 -0700 (PDT)
Date: Thu, 4 Jun 2020 13:55:44 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: kvm_target, QEMU_KVM_ARM_TARGET_GENERIC_V8 questions
Message-ID: <20200604125544.GW28566@vanye>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nymXTRU4ogln

Hi there,

(all this done on current HEAD: 66234fee9c)

I was looking through the definition of the aarch64 "max" cpu, and
noticed it invokes aarch64_a57_initfn as a template, followed by
overriding some feature and ID fields to enable additional
functionality.

I then noticed it does not override kvm_target, which hence remains
set as QEMU_KVM_ARM_TARGET_CORTEX_A57. Of course, this only happens on
the else side of the if (kvm_enabled()) branch, so doesn't affect it.

However, while looking at this, I noticed aarch64_a72_initfn doesn't
initialise kvm_target at all.

Then I looked at the definition of QEMU_KVM_ARM_TARGET_CORTEX_A57,
found there was also a KVM_ARM_TARGET_CORTEX_A57, and then I noticed
there exists a KVM_ARM_TARGET_CORTEX_A57 (in
linux-headers/asm-arm64/kvm.h), and *then* I noticed there exists a
KVM_ARM_TARGET_GENERIC_V8 definition there as well - plus a comment
saying "please don't add any more targets unless you really need to".
Then I noticed there isn't a corresponding
QEMU_KVM_ARM_TARGET_GENERIC_V8 in target/arm/kvm-consts.h.

So, then I decided to actually test things, and found that
(with -enable-kvm):
- on Cortex-A53 hardware
  - "max" kvm_target gets initialized to 4 (KVM_ARM_TARGET_CORTEX_A53)
    by kvm_arm_get_host_cpu_features (as returned from the kernel for
    vm_arm_create_scratch_host_vcpu)
  - cortex-A72 fails to start with "KVM is not supported for this guest
    CPU type"
  (fair enough, it's later than A53)
- on Cortex-A72 hardware
  - "max" kvm_target gets initialized to 5 (KVM_ARM_TARGET_GENERIC_V8)
    by kvm_arm_get_host_cpu_features
  - "cortex-A72" fails to start (umm...)

However ... if I haven't managed to confuse myself somewhere in here
(which is completely possible), would it be OK if I submitted a set of
patches that:
- add a QEMU_KVM_ARM_TARGET_GENERIC_V8 to match the kernel one
- set kvm_target for Cortex-A72 to QEMU_KVM_ARM_TARGET_GENERIC_V8
  - alternatively drop the explicit settings for A57/A53
- drop the call from aarch64_max_initfn to aarch64_a57_initfn, and
  copy the relevant bits into the former for the !kvm case

?

/
    Leif
