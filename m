Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp593069ejj;
        Thu, 23 Nov 2023 10:36:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKPJkrsyaK9hDyDtLqW8u4+AV/0HbF2cYVpWP6ev6E3Vv0np2u0MN1abU2VKXyyXlE6/yC
X-Received: by 2002:a0c:f645:0:b0:671:3f49:c8b7 with SMTP id s5-20020a0cf645000000b006713f49c8b7mr405140qvm.51.1700764616961;
        Thu, 23 Nov 2023 10:36:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700764616; cv=none;
        d=google.com; s=arc-20160816;
        b=ZZEq7ME0LMkeOEqKD+SsA2tF1E1vZ+DIWLDFcOKyA30jDSH575F6hoDH3IeZfLTTFN
         d6G8SEjgH0Boytk7yX/vwQ/J6W+63bJ9srQ+IxsTaf4lI9n+vsD95kKRIfPAw2U7xsCN
         i96fe1OkBboy6mpihPPqoHuLqBhpoLvW8EcS7E6r2UDeOn5FTywCm/iaC6N8cwzI0N4K
         2y4W+VzZMR/qqhJ8doPBVogEPzSzQFw3KH2pTA5o+AwGBYBVUG+GRwfQswphHqPxy3tT
         h2CoPAvRENG/KMmTrz2cq56x86d2PYyn+XdlcLvCVk4MLWqdVlJisXlz+79LEjtYbeht
         m4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=jApUa9NwPbQ48ykKJDUlLJN0yCBFVC5cyFHqkJvQSW4=;
        fh=vteyIG+vxxCYuwp1F8LdzHfX6jaUSeyJC9WWnpPrzwM=;
        b=Wv1KXnEjlQn8R5lETAfM/qhLxYWGIFmY3ZKG44CeHlfZajy0keorQFqHiPAJZTBOhl
         MR0kKOMA0zRYeH+FIUdcarsX2KtkEQamt4DMur3pX/XykGrzSjo7XrIbDzdRwwvNWLsY
         bzM3StmYmBTG3VgIBE0129yV+K+vKSiXYAUoHU96QhDyAZNC8eKrBO3qIBcYbuqiJ1JL
         Mqut8jxDuzCs5Klo6vggO/BDp6sIT9FpUiQ0bvg4bJUGXedxKGihrK4mz8aqfS/NzjA4
         E+39IrqkJzYKQQ3nZMaCAQf/9c6Akmlqs0AnDShWLv1LFihxkkrdJiSskPswcqm82lXY
         P/gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r0KyoDmi;
       spf=pass (google.com: domain of kvm+bounces-2385-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2385-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2385-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id h20-20020a0cf414000000b00668de23041bsi1620544qvl.160.2023.11.23.10.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 10:36:56 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2385-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r0KyoDmi;
       spf=pass (google.com: domain of kvm+bounces-2385-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2385-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D9F21C210D7
	for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 18:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925014D587;
	Thu, 23 Nov 2023 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r0KyoDmi"
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB3CDD
	for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:50 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-332e40315bdso490849f8f.1
        for <kvm@vger.kernel.org>; Thu, 23 Nov 2023 10:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700764609; x=1701369409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jApUa9NwPbQ48ykKJDUlLJN0yCBFVC5cyFHqkJvQSW4=;
        b=r0KyoDmiKEjbDZhXrzjeEUL4JxZTN9U45r871EpS5rMZgL3YnhI9CvCdYLqRvgc8UT
         APwyvHPr7tkTMUwGaZAxtfrC8O9I2uMAb1e1ep2P4c4lpyCCl8ib/BKKoClIEyrVkycA
         aNkLMxp+QhcFhuw/vplnL0INVVdPaluB4zou81xhTHrNBEFia5rt8D92FUD8SUzZ1CZk
         pnfeZeAhSb36YnYGPq9v/zzswYlmqHgNxUd7VG2OiYG6U+uVreE6ijNlmn+iBaUWTf+B
         3AThABwZNkyn3XScKE++5c9RR5P9eTBCtRi8KhsrSKKDjK0OTLDFKj95d6YM4SrTJxdB
         V77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700764609; x=1701369409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jApUa9NwPbQ48ykKJDUlLJN0yCBFVC5cyFHqkJvQSW4=;
        b=YQr76cXMnO4zym4KAz+HR/JAuU6Xin6d5r/tsGl+MQngsnMaI76cGZcAAGyaAVFvVJ
         m1Tzo8ocNbjnRY1ChK6dPmcOPCn+XyBsLj764ztM4Lqhpf19v7J4wUNh9rNwzyUeNwBa
         KE5sU8bldJkog5JkBNmc3yocsUmtGqYsUpVSGQ05Luh1LhaDSQsvx6ppvTw4HBMZ8v1x
         4jSt7v7shgDWgN0DbKrweHhHeCemlQbYDVcNDS2ZHckiZFPc5+RD7Jpj3jYx4dk2MhPn
         +mt3UaQJOEwKxk24I2bZpn/wBgeCMAKeUAeEWSXKpkpX25iCJifYR/OUN0YDFIK/vpAi
         6kKA==
X-Gm-Message-State: AOJu0YxQTJWzZLfbCF9U1CurtWpUb3rtMgQC5fm98v162oPf8mBqMYQb
	7de4g1VRsY5PdP5RCJpTzARzyA==
X-Received: by 2002:adf:efca:0:b0:332:cfbc:cb44 with SMTP id i10-20020adfefca000000b00332cfbccb44mr191483wrp.43.1700764609133;
        Thu, 23 Nov 2023 10:36:49 -0800 (PST)
Received: from m1x-phil.lan ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id i2-20020adffc02000000b0032f7f4089b7sm2318145wrr.43.2023.11.23.10.36.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Nov 2023 10:36:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 16/16] target/arm/kvm: Have kvm_arm_hw_debug_active take a ARMCPU argument
Date: Thu, 23 Nov 2023 19:35:17 +0100
Message-ID: <20231123183518.64569-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231123183518.64569-1-philmd@linaro.org>
References: <20231123183518.64569-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: z09ALQPlPesu

Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
take a ARMCPU* argument. Use the CPU() QOM cast macro When
calling the generic vCPU API from "sysemu/kvm.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 1f6da5529f..cbfea689cc 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1455,11 +1455,11 @@ int kvm_arch_process_async_events(CPUState *cs)
 
 /**
  * kvm_arm_hw_debug_active:
- * @cs: CPU State
+ * @cpu: ARMCPU
  *
  * Return: TRUE if any hardware breakpoints in use.
  */
-static bool kvm_arm_hw_debug_active(CPUState *cs)
+static bool kvm_arm_hw_debug_active(ARMCPU *cpu)
 {
     return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
 }
@@ -1493,7 +1493,7 @@ void kvm_arch_update_guest_debug(CPUState *cs, struct kvm_guest_debug *dbg)
     if (kvm_sw_breakpoints_active(cs)) {
         dbg->control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_SW_BP;
     }
-    if (kvm_arm_hw_debug_active(cs)) {
+    if (kvm_arm_hw_debug_active(ARM_CPU(cs))) {
         dbg->control |= KVM_GUESTDBG_ENABLE | KVM_GUESTDBG_USE_HW;
         kvm_arm_copy_hw_debug_data(&dbg->arch);
     }
-- 
2.41.0

