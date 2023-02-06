Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4122027ejb;
        Mon, 6 Feb 2023 04:17:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+FzL9c4uipCcHkG+ezHx8JwAh7xjNX5j+4ZAvSQ5pUtAlejkS4y9/Gw11+MEpIhR8Wun0p
X-Received: by 2002:a05:622a:1195:b0:3b9:b2c3:9d2a with SMTP id m21-20020a05622a119500b003b9b2c39d2amr35476120qtk.22.1675685874319;
        Mon, 06 Feb 2023 04:17:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675685874; cv=none;
        d=google.com; s=arc-20160816;
        b=buOAgY6V/zwnpQIDJ04UE7QNjttVapMukZpzeYAT8xZROZOfr4ZJRFwwnsczlTrJL4
         pjoRLxQHzsQ4n47j4trmUMuY+aizcpcX9nVQDTGwJmBszbosqCIjBk1IUc9c1yPXOh/X
         dQgcwscSkd7vLwqRXJveegNM+7keHTrda3GdPPI8x4rC6Mh/ET03//35k1TizaajIGGK
         IYtc8PV/wykshUuhZ+GvJGGi3wWWmiY5f05jFvhyXnpJvR67KrBB49GHFWsRlOTogTEy
         NxZbx+JwDeIvGTFo7PoXqEkONeZhTTdL74g5Wa/bu6OSfKDH13cnsWA6yi3a7e09ZEeL
         Qa4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=oLH2N/w79VptGJTqWIiiTK47yGtiakTQYhWs+w0Tnzs=;
        b=vjMbiqhVAAxTkA/XnW7Ge5e/eZVy83EZuPkcJDdiDqhAkSFDnzvOUHcei7J2WUfxvr
         slqhhSHlioLTZIttlW2LVuUJcAm+aTAShbeoYOvLvHoOgswaGYCylbYCldYhwpufGLZW
         /OzIxKQW5YG8kZ+gR87I6sU7SyQcAUtxN9xkdi3BiuXiQNhujP0ypiDSaGl0Nf5j0v7H
         ZF2mY1eoSkpLeIxPkPN2acFdm7/PT81rXiuONsgaDirvszgcGU2I7VYauRY34NaLUHhC
         vQUofinEIB/IAL3Z7An5ENde7VsV3QkBP/XS/Kq2/1vwk8E/uuy2oUCg7M7tHF5ADDdS
         uHVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vpTBjOrh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4-20020ae9dd04000000b006fca63f5c9bsi7729411qkf.108.2023.02.06.04.17.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 04:17:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vpTBjOrh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP0R0-0007LE-Hl; Mon, 06 Feb 2023 07:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0Qy-0007Fz-R0
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:20 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0Qx-0005lE-0y
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:20 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso10607584wms.5
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 04:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oLH2N/w79VptGJTqWIiiTK47yGtiakTQYhWs+w0Tnzs=;
 b=vpTBjOrhoP2eho/wxD9qI1tCjBwca/09Ay0iqfQjYvmcmhO73JFKmsrDqk+BN2cW05
 qfEs3FcwTCX3a7RAuRHR33lSANEDHVE9HFza6Ko9Rkd4cgPWQTUE9uzgxr2H2FZS7yBR
 +vLX0XwMc0fWgbAJcp0CynrtTNLORtBYxjYQzWpb0ecAqrxQsrThkcSVJ2QrOc9Vixuc
 69lozeg9ZkJvejwI1aOulC7LTQGnSLBxli/p4AhqJ0kaJ5fX9yTNBjSkU4Is+Zz8qa/r
 kxNjlSx8bk5g980ZJdAcGbgLTB8s8HK23q0J3DEF15G/eY3v15Yi3BiG78ATun42gEKw
 mfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oLH2N/w79VptGJTqWIiiTK47yGtiakTQYhWs+w0Tnzs=;
 b=ckCKDOeTkW623Q1bEhjvnNbRYRRME+VheRjaBN/HPpWM+ICc0/iwDOAtWugUGcSZN+
 ZVxWppbfJcfCJCR9VM5AMp8Oj/M8OvfKejBcfdDnM5hfjWsDWSuixQJ6RwVqDrBbDi6w
 E5HMInCSnaiyE/X4sglQLu4Lnr2PzDx5OOTYKH9pXncArfrh+htyt/UDZ7R13X3WhNpM
 ZpSvjgEl0ZmZJA2GfKq5QkgI0rCWnywa2rh7aT1dwl1CKbVPexcp00gxkIZ7j8KF/Llh
 sS7nLF3jSrZi/2knKaynMY+K9m+LuShcwXS7/i9RvaplxM8e/Ay4IREC9vb/cstwOMLN
 WwcQ==
X-Gm-Message-State: AO0yUKUahw+YkGImxzlehmu+JVvBxUW5eOYujP6BDVstpP5caBOsKB9y
 37a55TkklJMiDXzCzFGJCatcmg==
X-Received: by 2002:a05:600c:3caa:b0:3da:270b:ba6b with SMTP id
 bg42-20020a05600c3caa00b003da270bba6bmr20362007wmb.41.1675685837267; 
 Mon, 06 Feb 2023 04:17:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b003cffd3c3d6csm11698690wms.12.2023.02.06.04.17.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/9] target/arm: Housekeeping around NVIC
Date: Mon,  6 Feb 2023 13:17:05 +0100
Message-Id: <20230206121714.85084-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: E1goT80/Ycht

Few cleanups while using link properties between CPU/NVIC:
- Restrict code to sysemu|useremu or tcg
- Simplify ID_PFR1 on useremu
- Move NVIC helpersto "hw/intc/armv7m_nvic.h"

Something odd occurs when an ARM CPU is realized, the
CPU reset handler is called, ending calling
armv7m_nvic_neg_prio_requested() on an unrealized NVIC.
I kludged by checking whether the NVIC is realized, but
this rather looks like a code smell...

Philippe Mathieu-Daudé (9):
  target/arm: Restrict v7-M MMU helpers to sysemu TCG
  target/arm: Constify ID_PFR1 on user emulation
  target/arm: Avoid resetting CPUARMState::eabi field
  target/arm: Restrict CPUARMState::arm_boot_info to sysemu
  target/arm: Restrict CPUARMState::gicv3state to sysemu
  target/arm: Restrict CPUARMState::nvic to sysemu and store as
    NVICState*
  target/arm: Declare CPU <-> NVIC helpers in 'hw/intc/armv7m_nvic.h'
  hw/intc/armv7m_nvic: Allow calling neg_prio_requested on unrealized
    NVIC
  hw/arm/armv7m: Pass CPU/NVIC using object_property_add_const_link()

 hw/arm/armv7m.c               |   4 +-
 hw/intc/armv7m_nvic.c         |  44 +++++------
 include/hw/intc/armv7m_nvic.h | 128 ++++++++++++++++++++++++++++++-
 target/arm/cpu.c              |   8 +-
 target/arm/cpu.h              | 137 ++--------------------------------
 target/arm/cpu_tcg.c          |   3 +
 target/arm/helper.c           |  14 +++-
 target/arm/m_helper.c         |   9 ++-
 8 files changed, 179 insertions(+), 168 deletions(-)

-- 
2.38.1

