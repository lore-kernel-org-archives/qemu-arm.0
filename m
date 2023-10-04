Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2514727ejb;
        Wed, 4 Oct 2023 02:08:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFPL9woNo9xjMcyt7QN37vHU3BZ39pgrdL75ffzHYaMMMQav0f9MYQt26leq+CVq4lwSt7
X-Received: by 2002:a17:90b:1d81:b0:274:84e4:4ef8 with SMTP id pf1-20020a17090b1d8100b0027484e44ef8mr1732646pjb.32.1696410523352;
        Wed, 04 Oct 2023 02:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696410523; cv=none;
        d=google.com; s=arc-20160816;
        b=aLp1qT/rWa3Diu3ij92N4uFPOUDHSvgF2i+65esQuXupvnWoZX2voIVND9CaAtJOrF
         TiEEM/k5AAD3bxmyVi0uhQWBDWtYLkfZvqFWd/V4IGf6Qn8VXKl2HV2EkLnQi0GW5/1+
         8I0pQghRim/1XwWiGOcSqjYw0kdSRGpMOomDIMxlz1KOT6k2HLq9IRkR49OLa563l7xz
         HwRPHUqiRyUTvGjgXNV21hgWhUG/B/CvhlKPvC8zp0TOMhdYM78HTFAMaycotnO92XXR
         9np88+eEjAxjNcYnIKYsmyj7uk8ZpGkJQIZUitjrxNWrc8PfbGPK/Bs6WCyuTpEM1XZc
         pm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=vfazF5twtKQ3eFwn5to3we5c0wVkZ7UGB4/AdEoPOtw=;
        fh=2SS31IegaSPnFc1K9oZY2TcNWfkzHkadjv7+bY9Zdcs=;
        b=IG5RFcjVxCU9UhGSMuRnsDvJpxpdPWlvGsn3gDRGwrhTPYFfs2QdEBMDuoXuOnG/2N
         YF0BF+yGEyS7gz+F2dsKm6+V7SZfk5eXW3mvl/6p8SruhbqDiZpTKSLJGyt1AAHGwVRI
         1hoHaUD8TsQSMfUDnzUArpI35viktAbv3IFa8br6HM8b1wWY1Vn3e3lwyV61GvPKX/4P
         P9azPKoDdAGHOsQHByligm88OMKraJ0SeTfDF8IJsi4LIAZdniCOOs11u2yuWPKVR1Wk
         boyPiYsizuDoVXu1n5Gonnom2H2OFeGRf08/6+JHEdmCyRPJkb4GFYe9maqU1dlCPOwb
         nXEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k1KoiLYP;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.35 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from groat.vger.email (groat.vger.email. [23.128.96.35])
        by mx.google.com with ESMTPS id t14-20020a17090a448e00b00277651787f1si1087787pjg.145.2023.10.04.02.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 02:08:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.35 as permitted sender) client-ip=23.128.96.35;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k1KoiLYP;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.35 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from out1.vger.email (depot.vger.email [IPv6:2620:137:e000::3:0])
	by groat.vger.email (Postfix) with ESMTP id 17DE880BF4D3;
	Wed,  4 Oct 2023 02:08:39 -0700 (PDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.10 at groat.vger.email
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241908AbjJDJHm (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Wed, 4 Oct 2023 05:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232881AbjJDJHb (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 4 Oct 2023 05:07:31 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE207BF
        for <kvm@vger.kernel.org>; Wed,  4 Oct 2023 02:07:27 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3231dff4343so395980f8f.0
        for <kvm@vger.kernel.org>; Wed, 04 Oct 2023 02:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696410446; x=1697015246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfazF5twtKQ3eFwn5to3we5c0wVkZ7UGB4/AdEoPOtw=;
        b=k1KoiLYPHm/cXwHDFd5JMP7vHjcaZpJW1FhYRO0vD1zqIqhUq5iWHZmd4cxGopAFcV
         I2DJgKHfc2KytqpYBNxC2twt+jMZ0CsOkgVOYsXd7MhmHGF6lFYQ/DD9WBTKPbbqBl9y
         +cInuWGev8gZsq7KnCkysfwdPD7nbtziTtJUfjnYbepq+p/e5Yfg7U3KJqK0wMFTZK3q
         EBEHCFv41jK4auCZG1IsIRmapARdtYyITtZtmJ2Gy+lXv8+IkC/Lur3hT7etmJ4pgSb9
         wiU0OM91ZaPG8WWpMXcs0OuSsp+KlbetAER+fwMFTJAWzlP9X63xjkCTWb5MO7T8C5Zt
         V7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696410446; x=1697015246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfazF5twtKQ3eFwn5to3we5c0wVkZ7UGB4/AdEoPOtw=;
        b=YWQFywPYY/rHAHZzJ0jbc/kbUYNhGzLhN2vIrEm/xMOuk0hvQyaOOq/uDKGb4eA55C
         s0310QSAwtjK0jGlpgBCl2ZzN5Hvkcbnq9EaIDN0V4zcjEkkU2gLGVwC/2aHy4ZqmGZP
         GPMdtKiMj/xjsucLxcIG5k+DGyugmgejU/IolGSRDwzZFoV7S28nT8BiO7F+7ZLib61Q
         gwEBBwRONNXDNpgUFFLmCJ1LeqLkGXZISM58yJBa9/lwD2Yqo5/RGgr/if/BYJdxcMo+
         2d8Text20uqmz7IRFKryuKOcjhzsK6j5oWURTUjCYN0El2HaSVbyB6njs42DRkDpQirM
         Wh8w==
X-Gm-Message-State: AOJu0Ywyz3jdtH4ofxWIxwv5M1M1CA2DVskE7hvCkw/c8D89xFpXJzG0
        4fE0Ga3bnZub1ASfcnU+muwnpQ==
X-Received: by 2002:adf:fe0e:0:b0:319:7ec8:53ba with SMTP id n14-20020adffe0e000000b003197ec853bamr1273272wrr.14.1696410446239;
        Wed, 04 Oct 2023 02:07:26 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr. [176.173.163.52])
        by smtp.gmail.com with ESMTPSA id f14-20020adff44e000000b0032318649b21sm3511716wrp.31.2023.10.04.02.07.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Oct 2023 02:07:25 -0700 (PDT)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To:     qemu-devel@nongnu.org
Cc:     qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>,
        qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org
Subject: [PATCH 09/13] target/i386: Rename i386_softmmu_kvm_ss -> i386_kvm_ss
Date:   Wed,  4 Oct 2023 11:06:24 +0200
Message-ID: <20231004090629.37473-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: <20231004090629.37473-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on groat.vger.email
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.4 (groat.vger.email [0.0.0.0]); Wed, 04 Oct 2023 02:08:39 -0700 (PDT)
X-TUID: e74GaZDL4D2G

Software MMU is TCG specific. Here 'softmmu' is misused
for system emulation. Anyhow, since KVM is system emulation
specific, just rename as 'i386_kvm_ss'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/kvm/meson.build | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
index 5d9174bbb5..84d9143e60 100644
--- a/target/i386/kvm/meson.build
+++ b/target/i386/kvm/meson.build
@@ -1,14 +1,14 @@
-i386_softmmu_kvm_ss = ss.source_set()
+i386_kvm_ss = ss.source_set()
 
-i386_softmmu_kvm_ss.add(files(
+i386_kvm_ss.add(files(
   'kvm.c',
   'kvm-cpu.c',
 ))
 
-i386_softmmu_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen-emu.c'))
+i386_kvm_ss.add(when: 'CONFIG_XEN_EMU', if_true: files('xen-emu.c'))
 
-i386_softmmu_kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
+i386_kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
 
 i386_system_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
 
-i386_system_ss.add_all(when: 'CONFIG_KVM', if_true: i386_softmmu_kvm_ss)
+i386_system_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
-- 
2.41.0
