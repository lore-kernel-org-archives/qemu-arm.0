Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp2115738eji;
        Wed, 20 Dec 2023 03:47:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsY1v+hCc7WGdRjU1RchKD7JCUvCxIH2o1ey6+Te0MC1u0Z2OksX+V3FuZSUSKXKjQnU59
X-Received: by 2002:a05:6808:3995:b0:3b9:b8ee:8380 with SMTP id gq21-20020a056808399500b003b9b8ee8380mr29102353oib.37.1703072830498;
        Wed, 20 Dec 2023 03:47:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703072830; cv=none;
        d=google.com; s=arc-20160816;
        b=ZOI/dDbarKN6mcqAeFjvQAtzl4DuXwY/d3oK41PYxELVB5zQsxxR8isu6waFfTj2BM
         FC9Xr+Up4UYCi+iCfDwWSomYscP2MlXYdpSLwv6nob9yVeL3pbVhh/BhwC+tfz1OIst7
         /yHw02sW7P4uEOsRIGTdeet8CvbTfBeoOaV2ZfaRSyepgohSnL1EjzOIkcBNazGOnowL
         IptlftslMPfHHr4aluNdHUHmzzXPYza0KVhB/7rs/7LxnDd36o8ZFfuHAgmvav+d/2Z+
         ElILi0fwC7kKzQcUuCVxiv7P37bYChqEs0achQOarig2H1ENFGXSv82cFzhk6pcuB66R
         fOLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=MAIYRTB8Rqd8m9xruK/seC6pxzmjTJLImtUPc7KNg+0=;
        fh=HeUTNkHb3Z0fPQaUFNMh9IhXKcWms9ioSHgtHmzZrzc=;
        b=vKaia0SxDGyTwcngaJyz02KgF9Fb+yjTjyxTaCRGFLUKh6R+SRumH02OJS17jYSAw8
         vz9rR3kQ5Yq5QTNkl99MR+TFWEAlzJPSjqnlLxek0QvE7diDxF+F0uAVUT+f8aJZ/abX
         Vxs//P7bHT+CqS68hUV43lHlBYbWaO8u1oGjY+1u+LD/vog4fltV/BKl7HbUd6uK7aEU
         tWfLKhFQUWBWiz7cQxCF9Ad1Q1NZ00YBy5w8+WG4vucdy2QSVrl0wT7YU7DMoWWnmykh
         LCmIcLP3P+ECLteX1lVq7jBLxPXN+lBGTyi6LbHkgSHSc8ba9usfpaFkPJ/nzY4rWBjm
         GJ2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@immunant-com.20230601.gappssmtp.com header.s=20230601 header.b=ZMaXEcf9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13-20020a0c8e4d000000b0067f34c74eb7si7981346qvb.186.2023.12.20.03.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Dec 2023 03:47:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@immunant-com.20230601.gappssmtp.com header.s=20230601 header.b=ZMaXEcf9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFv2S-00006J-2f; Wed, 20 Dec 2023 06:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ah@immunant.com>) id 1rFqMq-00009H-Iv
 for qemu-arm@nongnu.org; Wed, 20 Dec 2023 01:47:44 -0500
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ah@immunant.com>) id 1rFqMn-00025r-5m
 for qemu-arm@nongnu.org; Wed, 20 Dec 2023 01:47:44 -0500
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1fb33059466so3645207fac.2
 for <qemu-arm@nongnu.org>; Tue, 19 Dec 2023 22:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=immunant-com.20230601.gappssmtp.com; s=20230601; t=1703054859; x=1703659659;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MAIYRTB8Rqd8m9xruK/seC6pxzmjTJLImtUPc7KNg+0=;
 b=ZMaXEcf9kVKGjdflA6J38IN+yeVdfi5nPFAkwguDFy0sGfvQvmNWlf4tM89zX6fjF4
 f/dvqJXsuZxTLFICYbw9KoRh8nWTXGZgGJRkuGx8riI3b+KicP4mZ1IX1HUvVq6jGjHV
 T0jdOZKrxsbc6egBmgtbTqo+e8wN7bqkwmt00KmkqswsrxaMoT7WXlVZqBKkC+6aG3b7
 6t4u2KzZUFDZEEkWFOjNExsNYjt5qZVaw9CFaEimsOP+dnH4RFkwhxwctUU9YJHE4LT2
 h7HLE8+XDHAgn7uW3yt3NZIL3hpM9kSM1jVQNTZ5PhmqvlIQgqvApyrA/Hqz14RHENRk
 Gi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703054859; x=1703659659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MAIYRTB8Rqd8m9xruK/seC6pxzmjTJLImtUPc7KNg+0=;
 b=Qk7tMFdD6rYU7Ds0kw+Tnw9om21aDkNtWrdGmpinNwaFOg+9vgqq/cNoPkpJngp6Xe
 6dK34d9Lt22Qf5uEQkFPaLuD3H8kxHusu8Zf4cxyiSBwFBf+Bg1QYviXWPUEnyqj7Z/F
 zfpnMu1Sk3Gki3d15qX12AF8AzNyHeW3qKIhSLoCy7Ii+3XzsPPIskJTy8h856HEGSVQ
 InPEz5G4JlkSNiUfiqB1Jwk+KdMcuownoDKmIfZBTlv9foljKDIinAKhiGiWqq6F6T/T
 y8Wx4S30APUVXZN+UvKJe0NNzpFAz/FfTGBO4jdGn10u8YsCWwIR1N0Wva11h4VKLCMM
 LIsg==
X-Gm-Message-State: AOJu0YxodyID0wZ4xPtk/jxE+LVMOE6rhzCcS1+8QmisR50f5K9qO3h2
 bfpov+yYcKvjKDssQqATnDsDQw==
X-Received: by 2002:a05:6870:2327:b0:1fb:75a:6d31 with SMTP id
 w39-20020a056870232700b001fb075a6d31mr22289403oao.88.1703054859110; 
 Tue, 19 Dec 2023 22:47:39 -0800 (PST)
Received: from clara.immunant.com ([205.209.28.226])
 by smtp.gmail.com with ESMTPSA id
 3-20020a630c43000000b005bdbe9a597fsm20262222pgm.57.2023.12.19.22.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 22:47:38 -0800 (PST)
From: Andrei Homescu <ah@immunant.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, armellel@google.com,
 jansene@google.com,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Matthew Maurer <mmaurer@google.com>, Andrei Homescu <ah@immunant.com>
Subject: [PATCH] arm_gic: Implement GICC_AIAR, GICC_AEOIR and GICC_AHPPIR
Date: Tue, 19 Dec 2023 22:47:35 -0800
Message-ID: <20231220064735.387346-1-ah@immunant.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2001:4860:4864:20::2b;
 envelope-from=ah@immunant.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 20 Dec 2023 06:46:58 -0500
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
X-TUID: AqTxt+4XOBxq

From: Arve Hjønnevåg <arve@android.com>

Implement aliased registers so group 1 interrupts can be used in secure
mode.

GICC_AEOIR is only implemented as a direct alias to GICC_EOIR for now as
gic_complete_irq does not currently check if the cpu is in secure mode.

Upstreamed from https://r.android.com/705890 and
https://r.android.com/859189.

Signed-off-by: Arve Hjønnevåg <arve@android.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Andrei Homescu <ah@immunant.com>
---
 hw/intc/arm_gic.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 074cf50af2..d0e267a4b2 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -854,7 +854,8 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     gic_clear_active(s, irq, cpu);
 }
 
-static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
+static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs,
+                             bool ns_irq)
 {
     int cm = 1 << cpu;
     int group;
@@ -922,7 +923,7 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 
     group = gic_has_groups(s) && gic_test_group(s, irq, cpu);
 
-    if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
+    if (ns_irq && !group) {
         DPRINTF("Non-secure EOI for Group0 interrupt %d ignored\n", irq);
         return;
     }
@@ -1647,6 +1648,22 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
             *data = s->abpr[cpu];
         }
         break;
+    case 0x20: /* Aliased Interrupt Acknowledge */
+        if (!gic_has_groups(s) || (s->security_extn && !attrs.secure)) {
+            *data = 0;
+        } else {
+            attrs.secure = false;
+            *data = gic_acknowledge_irq(s, cpu, attrs);
+        }
+        break;
+    case 0x28: /* Aliased Highest Priority Pending Interrupt */
+        if (!gic_has_groups(s) || (s->security_extn && !attrs.secure)) {
+            *data = 0;
+        } else {
+            attrs.secure = false;
+            *data = gic_get_current_pending_irq(s, cpu, attrs);
+        }
+        break;
     case 0xd0: case 0xd4: case 0xd8: case 0xdc:
     {
         int regno = (offset - 0xd0) / 4;
@@ -1724,7 +1741,15 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         }
         break;
     case 0x10: /* End Of Interrupt */
-        gic_complete_irq(s, cpu, value & 0x3ff, attrs);
+        gic_complete_irq(s, cpu, value & 0x3ff, attrs,
+                         gic_cpu_ns_access(s, cpu, attrs));
+        return MEMTX_OK;
+    case 0x24: /* Aliased End Of Interrupt */
+        if (!gic_has_groups(s) || (s->security_extn && !attrs.secure)) {
+            /* unimplemented, or NS access: RAZ/WI */
+        } else {
+            gic_complete_irq(s, cpu, value & 0x3ff, attrs, true);
+        }
         return MEMTX_OK;
     case 0x1c: /* Aliased Binary Point */
         if (!gic_has_groups(s) || (gic_cpu_ns_access(s, cpu, attrs))) {
-- 
2.42.1

