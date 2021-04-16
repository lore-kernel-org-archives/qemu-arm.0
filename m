Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp822475lfr;
        Fri, 16 Apr 2021 17:00:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+QNNNH3DohccfOUvqBxMkQCLd1t4pEowkac6z1GTQ9Ob7PnQH3Mwiwe+IHmuq2ctScyQ6
X-Received: by 2002:a05:6e02:168f:: with SMTP id f15mr9777653ila.264.1618617640587;
        Fri, 16 Apr 2021 17:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618617640; cv=none;
        d=google.com; s=arc-20160816;
        b=zsEeSELT0D2xVMWHjAunBc84FTt55JrTN3AGtqTQ9d48y80QbvmnyVYqrGuwU4xB+S
         Ecf//HHr0Kbf9gZCjVOaO4GhuONqiJ8MtjyVrGddgVtl8EN8DQEF3TKkq3lpZ4RLkeGI
         oipnFIVmlF5mF1/MghKvmYpT5ItXgBew/s8MiqTsoM9JL533DTZGwhVa9D/5Ivy4k/VF
         KPq6Cr0Ois07nkhTCchyNA4l1XYBSKmy7gikw+ZnxAD7k0H5aKB6SVVqD7bmfN7fkv2n
         E7g1qazv2cERxYTUfKlS9zVDArqspSopme0emmWXO7GDpZdkO0/9KzAWG9/mSVmAsIvq
         lipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/N6ThJ9lpoodnukC32bBD9hHhS8zuwX7N8aEvzIih5o=;
        b=MWQ1lVZkUgohKV/vepNLZiF/tjL0DYNnoEBdOCp+bxLRxiprnVQ9HCUSM7FHMEpazB
         YeVNqGa1I5I/JKQExYv7qu/j3ysHgNtckNBDCMhcstPrhfyF8RdK/uWRK0mwgo4pTb4L
         pX3oc8Ph9USnGSp+huhHXG7weO1jR93fWFUIWj8UouTUP61HDG5HNPVbbqMSZ4Xd2H6w
         wCBwgHBw8R5ezDWlg4tuBha/xI7LOwSJ4Qo55+gRGkHJZVeqHJIvXu/YW+Ao7s+BmTcm
         RacI5Gta8NlUvCmAxwmmG6dq+KUSw6gNkeI/VEsmjbM1DPvaV0MjEL9OlpftPpzSA5kl
         oHUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DIlY8w0T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si4178667jat.120.2021.04.16.17.00.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 17:00:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DIlY8w0T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXYO7-0006xr-Rd
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 20:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN5-00059Y-Lw
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 19:59:35 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN4-0005b2-0x
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 19:59:35 -0400
Received: by mail-pj1-x1036.google.com with SMTP id lt13so5990557pjb.1
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 16:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/N6ThJ9lpoodnukC32bBD9hHhS8zuwX7N8aEvzIih5o=;
 b=DIlY8w0TzDz7sSwpPz0Z10wMUhe4PIfaFC/qPi5eceXtGXYRhLvFYPkJyzTKSFRnct
 /2rQIZ6S6qev8XKbRX7kcxHPoKzWzoGZTgwHiTLVGmhuCsv/MZKkVy1JCphrFVqz/9Wv
 oJo48UN0PqhblcO6rVIZlF7FtgCM6D1/KgBH6nQWjTBybefUU0uFQc2KnqbH7SNpvAQA
 6d0bl4EgD5dSEBFwnFiKT2ClFlbHwmv8kaVJwZpGh5bJvc3E0mXH0cyYo9NNG1rjXLtE
 5TKiyuxq1qqBYD9YZGi7i4moaIPJaZ1u79VIhj+62H6aOHnmq5pzOdWrSBeHpth6tyYy
 sePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/N6ThJ9lpoodnukC32bBD9hHhS8zuwX7N8aEvzIih5o=;
 b=lXtx+ppCp4gwJ5FuCCeHGGRW+AqinnkuqtaE1f2FH7AvFfr7ZjY8Zc14ozqrWWNEiE
 2AmrNmIYLChSanvZtpw8lpXTyN5bmWshOBVXn91tQvFz5SaxqOXMjt6aPGgFJmyxsAAi
 nZ7f0dTfAjS2Ardp1/vyJTH4Rf84BwuzhHpT4OHNVeWeRn2KmobStY+7qQY69xvH9szw
 Sd0MY56T0OQtAEpIOZizzKiAskq5Nyy0rMusx37Vj+AWc4r31XzqUYmA//YXbJA6xigl
 d9pGgLdm5MFZXJen1LTdZeg5WQDmkGrjZTmaJ5xXQmhwjI6C8Rd3zc+CPLAgHQ02V0Hp
 q9+Q==
X-Gm-Message-State: AOAM530Run+oPPxoR33XmAqey4zSyJq1nmU4NUXxbirAm39bSs8DppS7
 +XnlOAleKjgw8xnznKxHbmaUgA4Qy0Io5A==
X-Received: by 2002:a17:90a:4f41:: with SMTP id
 w1mr10603836pjl.231.1618617572489; 
 Fri, 16 Apr 2021 16:59:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 02/11] target/arm: Unify unallocated path in disas_fp_1src
Date: Fri, 16 Apr 2021 16:59:19 -0700
Message-Id: <20210416235928.1631788-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZBy8aT7WE1Z0

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 668edf3a00..d8ec219bb2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6509,8 +6509,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
     int rd = extract32(insn, 0, 5);
 
     if (mos) {
-        unallocated_encoding(s);
-        return;
+        goto do_unallocated;
     }
 
     switch (opcode) {
@@ -6519,8 +6518,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
         /* FCVT between half, single and double precision */
         int dtype = extract32(opcode, 0, 2);
         if (type == 2 || dtype == type) {
-            unallocated_encoding(s);
-            return;
+            goto do_unallocated;
         }
         if (!fp_access_check(s)) {
             return;
@@ -6532,8 +6530,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
 
     case 0x10 ... 0x13: /* FRINT{32,64}{X,Z} */
         if (type > 1 || !dc_isar_feature(aa64_frint, s)) {
-            unallocated_encoding(s);
-            return;
+            goto do_unallocated;
         }
         /* fall through */
     case 0x0 ... 0x3:
@@ -6555,8 +6552,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
             break;
         case 3:
             if (!dc_isar_feature(aa64_fp16, s)) {
-                unallocated_encoding(s);
-                return;
+                goto do_unallocated;
             }
 
             if (!fp_access_check(s)) {
@@ -6565,11 +6561,12 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
             handle_fp_1src_half(s, opcode, rd, rn);
             break;
         default:
-            unallocated_encoding(s);
+            goto do_unallocated;
         }
         break;
 
     default:
+    do_unallocated:
         unallocated_encoding(s);
         break;
     }
-- 
2.25.1

