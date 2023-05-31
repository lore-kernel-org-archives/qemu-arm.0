Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp230795ejb;
        Wed, 31 May 2023 13:39:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4THY7ZNGSa4DGopjLMz1TRnhudLofhmN9j59lzqZ6Gdk2aACqgQnXv1CekP9ke4YIFMrg0
X-Received: by 2002:a05:622a:1ba0:b0:3f3:8057:9587 with SMTP id bp32-20020a05622a1ba000b003f380579587mr7457576qtb.20.1685565577632;
        Wed, 31 May 2023 13:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685565577; cv=none;
        d=google.com; s=arc-20160816;
        b=av4217TMqQamXxk/TQURP8LBl0CnZ2r258M75zFVhf0b8TAKp2+KOulS88PuOO5F1Y
         SdsHw2xFgMOl7DSn1iviakuKQTtuOsJMx7AC3fK/F6pGpQs+0f6xLfXK3RPEmMmhtEyx
         rc/PBIp9SFprX+P2xJ3h0XNHz9hrMjNckH4q4J3xmsgkBUEybjbIwR1U4DuwOblvPU9C
         urYxOZQdmaOgSsXCVIn5/MPaP2pk2cJ0cvdg86SgB4834WkOxmpr5y8+RD1RgJxPpegf
         Psb0KNThOImyINRd1Ct3G/HHCZxXrUNuWc+byS7NYJZURHHDBxMWOJWCuUXNpYZkx46a
         VEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+bApdHpHvphQGH6iJkkAkav6K47Z8aVKSZsLKgEzGjI=;
        b=0VkLQK8EZ6H7JltruIsuPUn14W8yyYkL9m5GgMqMClz8C31HIWWMYgWCEOICQ0TY2e
         twIS20Hj2GA/woahXeu+GM+dG/unpBvgSHkDKJCtmyrVR4n7Z8Xfkvpa9+8ZNh7U51cb
         FNqL0I7e0Bwsr+KNQEkyEGZCNNv7/eGWj8L3wwPq7B/JQN3PTwaySqyGTl9talLoEmR2
         1HSfwwW+3dd/Q9neo2JmLgvnJ7AYal7RX7PeQjTsxJPNDFu1QZQ+TE+q0BPlmpcobMeG
         44lr0P42eE8IwfdRSo7Et9GDC6Nvp5wdwu0yocdgEiGyGPeTUauxFgTGPMMY+Ec+RhHw
         Z7Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SjC2KJW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020ac859ce000000b003f6b9e32596si9060044qtf.747.2023.05.31.13.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 13:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SjC2KJW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4SYg-0007jf-0Y; Wed, 31 May 2023 16:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYc-0007W0-MN
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:36:35 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYa-0003IM-DG
 for qemu-arm@nongnu.org; Wed, 31 May 2023 16:36:34 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f6e72a1464so921145e9.1
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 13:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685565391; x=1688157391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+bApdHpHvphQGH6iJkkAkav6K47Z8aVKSZsLKgEzGjI=;
 b=SjC2KJW26ls1HD58kz7BecXkM9dZ1U5aqRtnlE3a8cX3dLlv10QWAO5aBM5LhxY6Bx
 Vr7E3QsiG+GmAb5ODU9i7ZhRbmF8ZlGzfQQjqsyX8Ay654cpOdtqoKSVquN81hhbVV01
 u2Ymvw/N5Dyg0l2n3R7guL1BbiB18b1OI2FiBrlRKh6TOASo593nt7qg6FuxVKs2FB5G
 38rWFyguhjusV/ZcSjnEO+3v34GaU+DLtVmWbrBhZ0XhuVYFsJwS6eNtBa/xWnOaRaKT
 14KiOLb3cSjf5QuzWlK99B+tW8PmJGkmEPrUD4h09Bk6D+QQ/0N11ZjaZZzbIktelvgm
 ViBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565391; x=1688157391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+bApdHpHvphQGH6iJkkAkav6K47Z8aVKSZsLKgEzGjI=;
 b=bdnso/VnjHFAPbUtHry2Fhg0JsD5WndKYbHDqn8HOJJgriMPuKSwYij/alHZN3KcbE
 of2qQLXPw6ztydGnAbAKK8BYN6hgHg/1HV+lCex/nSQMJ/vE0PfqpQLqMTnCGxee9PnV
 lmGV3wH55Xh3hM7gZp9uonbex2DZYEOBCDL0qtQfaEMniDy1pbLod/0jAnm4yoZGsPQH
 0fd1LlGCCxmIrmGCve35A8Fn/96GuWAbHnT8pz0TM2UhwD1vVttKbal6JmaaiIm9bo7s
 nFkhHbx5IwPqtBuk8lW5RMOyFDoTUT6566/FPOS8NNONFLhlIlbUOlWR9bcngL8ihuba
 7uaw==
X-Gm-Message-State: AC+VfDzYapVdy1zpg0x3eAHx2ZN7hIZwBTnxEfkLKZXifAMz64hiZd4h
 aqu21sRLmRfQB8k5CqOFUQDhMzyxBo3yNX7Tm9w=
X-Received: by 2002:a05:600c:3658:b0:3f4:2328:b5c2 with SMTP id
 y24-20020a05600c365800b003f42328b5c2mr260494wmq.35.1685565391086; 
 Wed, 31 May 2023 13:36:31 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 9-20020a05600c028900b003f42a75ac2asm22049206wmk.23.2023.05.31.13.36.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 13:36:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/15] hw/timer/arm_timer: CamelCase rename icp_pit_state ->
 IntegratorPitState
Date: Wed, 31 May 2023 22:35:49 +0200
Message-Id: <20230531203559.29140-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531203559.29140-1-philmd@linaro.org>
References: <20230531203559.29140-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: XmURr29vyJh1

Following docs/devel/style.rst guidelines, rename icp_pit_state
using CamelCase as IntegratorPitState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 3dda3a73f8..fc8d25b0dc 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -337,9 +337,9 @@ static void sp804_class_init(ObjectClass *klass, void *data)
 /* Integrator/CP timer module.  */
 
 #define TYPE_INTEGRATOR_PIT "integrator_pit"
-OBJECT_DECLARE_SIMPLE_TYPE(icp_pit_state, INTEGRATOR_PIT)
+OBJECT_DECLARE_SIMPLE_TYPE(IntegratorPitState, INTEGRATOR_PIT)
 
-struct icp_pit_state {
+struct IntegratorPitState {
     SysBusDevice parent_obj;
 
     MemoryRegion iomem;
@@ -349,7 +349,7 @@ struct icp_pit_state {
 static uint64_t icp_pit_read(void *opaque, hwaddr offset,
                              unsigned size)
 {
-    icp_pit_state *s = opaque;
+    IntegratorPitState *s = opaque;
     int n;
 
     /* ??? Don't know the PrimeCell ID for this device.  */
@@ -365,7 +365,7 @@ static uint64_t icp_pit_read(void *opaque, hwaddr offset,
 static void icp_pit_write(void *opaque, hwaddr offset,
                           uint64_t value, unsigned size)
 {
-    icp_pit_state *s = opaque;
+    IntegratorPitState *s = opaque;
     int n;
 
     n = offset >> 8;
@@ -385,7 +385,7 @@ static const MemoryRegionOps icp_pit_ops = {
 
 static void icp_pit_init(Object *obj)
 {
-    icp_pit_state *s = INTEGRATOR_PIT(obj);
+    IntegratorPitState *s = INTEGRATOR_PIT(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     /* Timer 0 runs at the system clock speed (40MHz).  */
@@ -409,7 +409,7 @@ static const TypeInfo arm_timer_types[] = {
     {
         .name           = TYPE_INTEGRATOR_PIT,
         .parent         = TYPE_SYS_BUS_DEVICE,
-        .instance_size  = sizeof(icp_pit_state),
+        .instance_size  = sizeof(IntegratorPitState),
         .instance_init  = icp_pit_init,
 
     }, {
-- 
2.38.1

