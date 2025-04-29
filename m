Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp255218njm;
        Tue, 29 Apr 2025 06:25:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7/GQVCSdOBy6WTnjJ/6DsnciWzKRAQxv1TwdP9pBodqIE9a87Mlcjii5R02nkeGIq0R/sPRalEhantQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEu3onAjZtTv2DIn+K/M/XQRJeyBi0PAEgOB5tZNO3F9jRx4X2E01St0E3ZQ7DPgTJq5Fpl
X-Received: by 2002:a05:622a:588c:b0:476:8f9e:44af with SMTP id d75a77b69052e-488135486a6mr55985461cf.29.1745933115844;
        Tue, 29 Apr 2025 06:25:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745933115; cv=none;
        d=google.com; s=arc-20240605;
        b=IMo57crz7uxia/lsE6u4YkPJvCvvD1e8S2eDc5u4e8IbnXoZ3SkIdIv6LaICmGkxcY
         qh5ytQE5zijUS+tP7/W28DntJrwWV6R+CUYp+kgurybhMK76lCLiGoKgoGvbFQ06EQa5
         tzCMJMac6A7F1Vhk2kMHy6zCCKHoHybqC4YFBbSpUTNDeIKJYdm8REGLztt0rPPF6K9I
         4FVkj9yC+JwMXM95mvbvYN3uOKdZXxZEVs/c9s1TgT9ETs+tneoM5spEGEFV69FfyfTG
         JcuXVcTzgPSSu/FJIOs/fZkMTCvGsGeVqaNKivqgQcuSB6nrQZ4o+egGg0gI7ITSySDY
         eFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=U0MilJhhj9cXGSYSZ37HStWvLOYbPls0FXWBsHGtjT4=;
        fh=nRN/HwZLv7p7vwbUbsQ3NLtY4n8ciXv+fZlCB9sP1S0=;
        b=KkULiMRZXO/Lc4d8g0P3nD8E53yAIVRl5e2QXWFZmPymnjrCwD6s4jad3FNzcBIFlm
         acPa5l17NXLtbYAwBImXgPFr8+mCEnbiYuE9hZ8WevsAp4aiBEFmY3W29kHUGdy07l3j
         f/bUF5t0QeRT0UNcaxjjGvzSZU/TzdTjQAZQjb/hCoyh5dfq6VpCeRuP6b3HVaYu37ZP
         X0TZSuW7cx2aK3L8SolTPt0+627NxGpZlJRJJz0xJrphMErhgyk/RsQlcvYvc6yeiR/x
         yWEBn5jtzM6LEjNt34iR1TZmtZeu3oDcb1R0+ltdrtv4NWgO/DZYQF9jFYzs6VGYNBrK
         pI8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Gs5Zr8t/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47e9f3c0474si130399051cf.28.2025.04.29.06.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Apr 2025 06:25:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Gs5Zr8t/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u9kvZ-0005Iu-0W; Tue, 29 Apr 2025 09:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1u9kuj-00056q-W3
 for qemu-devel@nongnu.org; Tue, 29 Apr 2025 09:22:24 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1u9kud-0005dD-Ur
 for qemu-devel@nongnu.org; Tue, 29 Apr 2025 09:22:21 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394a823036so59061655e9.0
 for <qemu-devel@nongnu.org>; Tue, 29 Apr 2025 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745932926; x=1746537726; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U0MilJhhj9cXGSYSZ37HStWvLOYbPls0FXWBsHGtjT4=;
 b=Gs5Zr8t/S9Ve30mxy9D98FKHnZlNYKoLwGp2rHQldECcnrrVqyezIsOhA6wMdhEz5J
 kdwcjIMBeKZnz3KekCo+s/SYFi8zsSsU65qhc3Vv0PV1JrV3xKMMJv5wKOyMTECHwkBP
 N3xCxi66Msx9vd6T4/AJb8mZznFUkURZYBS6+G9uh/0T6sR+v6e79JcCumCUAyeIUXWK
 MEOHP3pMCoSpV06GmaNRDxzTWX0fbQOSFr7d5gEM/5CtkvcBjTFY3V0sLSrSmmlnH9y+
 T4f7AhVK2qOjJ5EVP+Nz24Bd6bfuRdhApFRw43LuHDGi3KkNNnRx32VxTSienR89UMj9
 +T9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745932926; x=1746537726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U0MilJhhj9cXGSYSZ37HStWvLOYbPls0FXWBsHGtjT4=;
 b=iI38cbbBcz6FThdcmH02+VFaD3xWbntV+StGAY9KZTfFIMM+zkukB1nacd33aAimPc
 h7uTSrQctck8HmXHyoOBw0oRbeXD/ae6g7pQzqI7mG8DRE0vwbizKkFgojytgIj2J7Mw
 ePRvUGRD4+/8FaeNj9Rkxvy66emxBIR0DL3wKeJZpzgsLvHd6yVNY7nzfTIAFlZI9ih+
 bfhTaJE4seASr6lki0shtCs7GrIjX4b6u+PdQGhKr7hUWMfzdWu+MadyMm9dn7y8MOu6
 +4bhwsJPNJ/rHWaY2y/OwPK2UHHDl03Cgd95Ij2Z6pDznoYGddbhPjvPzMJd3TgzPb+w
 if3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjcijRO3ykpUahsiX0rOwVfLzjGGOLDAT1/bFiyGAKQK4M0VDUKZZK1uz1KG+q4gIrWwMOuKK5qheq@nongnu.org
X-Gm-Message-State: AOJu0YwwirfKIJ1y2fdbY83jKimRToPph9A2NVvzETrKD/+U9cYvAKKU
 kl8s6WH3cEt03E3In76/98OmDM6lynRH9xfVJ3+2kPw5KAAeB1X8+A6fKrgXVWM=
X-Gm-Gg: ASbGnctgfY9xWIk/H03X4/WLgdRcx/+5F0c3R0k+2l7UxjkDNMj/5U4VsQ/0sdqVbzt
 23MoD0F4qqxwBi4oK7Up+GeOyVCBj9ft44ygDcEihx+31dvKtuGQSQmu6Pmixtc2TNMc9zZnYC/
 5mDUq9bX+amefG5QJOb4jFlcRLssbm/WSqA30PPzsN8ZiF5iBwzrKZg8T7+fhlTzKz6osqVpXHL
 mqdhUbbiLyToo920DzYs68ZbrNczKLOmRZ3CGXxUH+WZT8Ku0KODc41GCXI99S3nuC340dgeQXD
 XP44kopdWKDmpvBxB5QeQUNHD+N0eIycNHRGCHXUJ1125Gc=
X-Received: by 2002:a05:600c:c17:b0:43c:f332:7038 with SMTP id
 5b1f17b1804b1-441ad4e7ddamr22686315e9.21.1745932925711; 
 Tue, 29 Apr 2025 06:22:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca5219sm13729371f8f.27.2025.04.29.06.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 06:22:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v2 3/7] hw/core/cpu-common: Don't init gdbstub until
 cpu_exec_realizefn()
Date: Tue, 29 Apr 2025 14:21:56 +0100
Message-ID: <20250429132200.605611-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429132200.605611-1-peter.maydell@linaro.org>
References: <20250429132200.605611-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 23vu/36SqugO

Currently we call gdb_init_cpu() in cpu_common_initfn(), which is
very early in the CPU object's init->realize creation sequence.  In
particular this happens before the architecture-specific subclass's
init fn has even run.  This means that gdb_init_cpu() can only do
things that depend strictly on the class, not on the object, because
the CPUState* that it is passed is currently half-initialized.

In commit a1f728ecc90cf6c6 we accidentally broke this rule, by adding
a call to the gdb_get_core_xml_file method which takes the CPUState.
At the moment we get away with this because the only implementation
doesn't actually look at the pointer it is passed.  However the whole
reason we created that method was so that we could make the "which
XML file?" decision based on a property of the CPU object, and we
currently can't change the Arm implementation of the method to do
what we want without causing wrong behaviour or a crash.

The ordering restrictions here are:
 * we must call gdb_init_cpu before:
   - any call to gdb_register_coprocessor()
   - any use of the gdb_num_regs field (this is only used
     in code that's about to call gdb_register_coprocessor()
     and wants to know the first register number of the
     set of registers it's about to add)
 * we must call gdb_init_cpu after CPU properties have been
   set, which is to say somewhere in realize

The function cpu_exec_realizefn() meets both of these requirements,
as it is called by the architecture-specific CPU realize function
early in realize, before any calls ot gdb_register_coprocessor().
Move the gdb_init_cpu() call to there.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/core/cpu-common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 92c40b6bf83..39e674aca21 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -234,6 +234,8 @@ bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
         return false;
     }
 
+    gdb_init_cpu(cpu);
+
     /* Wait until cpu initialization complete before exposing cpu. */
     cpu_list_add(cpu);
 
@@ -304,7 +306,6 @@ static void cpu_common_initfn(Object *obj)
     /* cache the cpu class for the hotpath */
     cpu->cc = CPU_GET_CLASS(cpu);
 
-    gdb_init_cpu(cpu);
     cpu->cpu_index = UNASSIGNED_CPU_INDEX;
     cpu->cluster_index = UNASSIGNED_CLUSTER_INDEX;
     cpu->as = NULL;
-- 
2.43.0

