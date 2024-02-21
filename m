Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2065436ejb;
        Wed, 21 Feb 2024 09:34:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkL1UKY6pMLAUqURLrfvCoipxwI3tzrF2tFgHwSvHAq0XvnMO2B8eJJMKv3hoTIoFCdGgJRJbq0YrZ/Y+7HGrQAlHfaqkR
X-Google-Smtp-Source: AGHT+IGBeFkhS2vZzMUCFTwFj9P0s1tmtPyrWtckYxIo4qD4xokcDKYzPv38guGvacIT8eiUVG5H
X-Received: by 2002:a05:620a:14a5:b0:783:63bc:3eb9 with SMTP id x5-20020a05620a14a500b0078363bc3eb9mr19181402qkj.20.1708536850414;
        Wed, 21 Feb 2024 09:34:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708536850; cv=none;
        d=google.com; s=arc-20160816;
        b=AbOdSvYEmOgV4m+WvcBEtNgcBGrVVMJdIdzoiab7Iw0MTpCtrxNC79AOrtsaoUwr+K
         xwlZM9D2gI1r5DZiYK7bI0tsP24lRvpYncqQlO05DewiqVKv7I16qojY2pzOk0ApnX4N
         KjP7GK3NIJIVn2zQYoloTT5BTOmCneZARrI8NsK4mcTYN5u2hyFHkQjQBlvhxuhZDTuW
         AK1SKHpJHohHkhbCrS9GrT4GbQCS17qeDf6Qbjjk4n4/3s44g3ROhY+HJDeFQkv7dTSg
         uHClVNTrfTkiZTsstJFfVHNaqJECmKi9OwHR/6SpHkrdc6jsN5/Ey4UE+NK41imOSOkh
         F/aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=EcwbTVhF6/jNkSn+Rl6HkgY4LLv3UGKGBJOpP0BckOc=;
        fh=uaa8ks6tMviNJZL+REatm/ZMC9EMp7Ie+hmqE8al1i8=;
        b=Bsk9mpcM0X4zyRyogTHpQWLCiUxJt660cCpOwerw+35pOfLHs6FRYyp/QIXS42ZqnC
         Cd2/xACrO0s0/rR4td88J9uU94Ol4F88JLutrm2xu/CU6QW0n+J0Dj13nFc+eeVRMxDF
         gdGCOzTcS8BMq2J5J5n5hPoEjkYx78q/ZxPMUEBoDiel66QGLOOj61nMP2xKoxRoTcYz
         acKC2mpkFFMm5SX422WdadwtrQSfTEtvmZmljpnsMkFsQN32qeX/CZ+Ep4R+2FCg0Aes
         K9K9r6IFswOYPt/PeVSQhG97RqrNryGQQe1rvKLfRLY+S/Azps+AZs6JHWBTk05t32+C
         yofw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2g6ftT0n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10-20020a05620a22ea00b00785d9d11423si11061292qki.770.2024.02.21.09.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 09:34:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=2g6ftT0n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcqTT-0000t4-JA; Wed, 21 Feb 2024 12:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <36DPWZQwKCN0M9AHGDRSDE9MFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--nabihestefan.bounces.google.com>)
 id 1rcqTR-0000rD-RT
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 12:33:38 -0500
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <36DPWZQwKCN0M9AHGDRSDE9MFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--nabihestefan.bounces.google.com>)
 id 1rcqTM-0002T5-7Z
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 12:33:37 -0500
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-608886b1a3aso12133127b3.3
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 09:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708536808; x=1709141608; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EcwbTVhF6/jNkSn+Rl6HkgY4LLv3UGKGBJOpP0BckOc=;
 b=2g6ftT0n9W10ghhB5oapRHhPqiTQ/Xcn2r2HW3GizciK44erXLrqcTaKVoiclJPozb
 Ky92/SKflwmh1wkK21G109aBlyrJne5zzLrqQxmKj4ztPUlloIz2IUg9xPTXcWoeT2b5
 hJHejD7DaqgdG60Y9OaRjZCw5Rm+90QPDJhdJgqCuJKyUjWRVjBsBfyOO434iXVAmyqQ
 Php7bt9+SW9WUUJPgPFqXSDhW0dzZxf/PqIwTH4UgstJjY2soJQZteSR6teERZpVRteD
 T3pBOnDZHInk5q2I8eRBWB73GKBN7ktZXf9MRcSKiEWx+kgHhfZ1WBeKFwVbaOdgi3kG
 F3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708536808; x=1709141608;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EcwbTVhF6/jNkSn+Rl6HkgY4LLv3UGKGBJOpP0BckOc=;
 b=qorrP+joEoD137JFrUe8+rnj8bEeFyrkgfvUgnoJer0eu30Y2b8unQrYWRWE4lczNR
 q6sp+hVLBK+f0Z6tFUqgLYdhRFSpURom6ofx6xqMEVDBP+VFeyWgxP2UimA5Pgddri8C
 +lcm8gKHvoqZfPSZ77EgiK2OjMMUvxae5o3/6LENOgZRrjmV4oCo6hE0SUt8BHHblkJd
 CfXEa+jxH+8fOG8l5wFKZYf1r4soA1JpidQaC5ZnANcFxCVMU0RNXhbJmE+BLRmp1CbY
 zLCDHHy3xkJhHcb4mWVGbctS0PjjLITJUga/6ewdO4RR2YGCoPuw64HXnZM9Q9ylLLXa
 M9rA==
X-Gm-Message-State: AOJu0YwMcSz8EAlhrGyDHQmyI+BOv2g3wvTjJPX36tHuGIxU+ZT+MU2a
 WgmNz+B8scIyAvrm0PGaiHiCimf9tN2KmJEioz4CScQ5z8tWval/gVggNWHMDuj6XWg5uNMJ8a3
 jPMIguDjnkEgtPtYVOwpmh9+AoQ==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:a196:0:b0:604:9b11:ff2 with SMTP
 id y144-20020a81a196000000b006049b110ff2mr4882082ywg.6.1708536808694; Wed, 21
 Feb 2024 09:33:28 -0800 (PST)
Date: Wed, 21 Feb 2024 17:33:23 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221173325.1494895-1-nabihestefan@google.com>
Subject: [PATCH 0/2] ARM GICv3 ITS DeviceID modification implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 its@irrelevant.dk, kbusch@kernel.org, roqueh@google.com, 
 nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=36DPWZQwKCN0M9AHGDRSDE9MFNNFKD.BNLPDLT-9QLMNMFMT.NQF@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PrOGjSkWMcPH

This patch series modifies the ARM GICv3 ITS to use the already existing
send_msi virtual function when writing the GITS_TRANSLATER in order to be able
to modify the final DeviceID to an implementation specific version that requires
extra information besides the BDF that comes in the requester_id. This is
achieved by using inheritance and redefinition of the send_msi while the
parent's send_msi could still be used to inject the modified DeviceID.

Roque Arcudia Hernandez (2):
  hw/intc/arm_gicv3_its_common: Increase DeviceID to 32 bits
  hw/intc/arm_gicv3_its: Use send_msi in the GITS_TRANSLATER write

 hw/intc/arm_gicv3_its.c                | 20 +++++++++-----------
 hw/intc/arm_gicv3_its_kvm.c            |  2 +-
 include/hw/intc/arm_gicv3_its_common.h | 15 ++++++++++++---
 3 files changed, 22 insertions(+), 15 deletions(-)

-- 
2.44.0.rc0.258.g7320e95886-goog

