Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8BDC87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:49:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLoh-00067Q-AW; Sat, 02 Aug 2025 19:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLmM-00032K-OD
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:36:46 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLmL-0005k8-23
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:36:42 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-73e810dc4cdso1197152a34.0
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177800; x=1754782600; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yp6GjOVr5sFSu+DGzVCc+heSPSS1fAAC7M3WZ7lFas=;
 b=t2G21qyD6z3sJtMIcRkgALemGiZDl86Cbx+2aN5SJ2YxHvbbne8onvriflDH4vjaMu
 ff+4HX2SFvEIIxxo1fba6c6997hJxVTw8Ch/ylaLphiHwZFOkuYBW0Vqc039xN3mibpl
 YfufyHih6+4D0ySFnqJrkMAPTOwCIlA10JT5UlSjU1XoINVCyUR2JRlUpgngS5WR0+le
 HXkS0v+GmT7XOoqLm5yyo0xYY6NAl0tMTkMuN0SssxA29kio4rdhEvpHFAS9OypfOaOX
 uNr2PLKt/ghKzw0mG553rmRpSPhEq0vbeJfZU9RYZV7gFuCuy7G99cT1eBYKLvuSFng4
 MhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177800; x=1754782600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6yp6GjOVr5sFSu+DGzVCc+heSPSS1fAAC7M3WZ7lFas=;
 b=gXoRwXbggUt31buYAKscY6O1KmDoSp0VVGNcJxNCg8rZUHfktEccfTkRkwO3ZOgvwo
 /7R4y9bKTgpdC6Ff5FiyIPcyI+iaxhoYoycR1JreeFD4+ZJOzLkfR7YyRdXY6rAoSnyc
 dG8+ooLASoq/7CA5nGcxQcAshyuw6DV3IFBg0VBNbSEN5zn/HzudxSvCVWr/wC1UBAR9
 ZB8JljLcjFHIFdkrQErKKyaDSV6avqUgvWh6rOeaYi3mGFAPmMNtyr06N5gkp9wXVBU4
 qd0/NZRWJ5yDrztBNd3wdfqfEi7cQImqjNO5g6qGfgN8MqSrtOSFbT2B5jQjU9sHTSBc
 uH8g==
X-Gm-Message-State: AOJu0Yw8J6drq6wKyObHDXrdNL8jKz6ZBzwomX4XYbeyMEoW37GxL+Mz
 Mji8Dea9Vpe9q+aaOWff2DYCeA5ZAPvKDIl1Uwa1JlI++gd4rmlet93QR4SdTX44AK0=
X-Gm-Gg: ASbGnctdm4AZ73FmpbPavz6HehD6Kl6S9T/EY25wMXwbiiuJ+zNDqDo+pAi1fCiFwYB
 mh3Eay2q0StSh4WDUSyvmYZeXOUN0yhTz5SMJdXN6Lv0xVMXwq9rAP4GIOwSs7/fJMFRzTQFBBO
 2kBwOltD70mk6AY6fgV1G9GvrdN6KRwSHsE1/lER3cN7DVcJ/0pew7MiWcpGD87i4ZdSuc2QvzT
 ysvk5skPqmn1JDWcp992stCia0jACq9Lb3vnMMWgMeigLY7JzmX3kh3UuWppKkZYpmBs6LH5AGq
 Xka7VbvECinF8RUhkhox0MGVvjfftDqEdE097B7QsECsivwDXz1ytyJu0TVX/Q7eW03a61h3Asd
 81KcsSx7TIISXisxjZm3Np9WHXOWJZDVIaniQeg20LNTs4ToetURgFRtTK5LlRVI=
X-Google-Smtp-Source: AGHT+IEivDBOTGrUqtjbaUTfs4h1AUX7M7oii1pwKBAEuNKV+Qq2kwLGsXHhwpn1JzXgzPzCB8QDaw==
X-Received: by 2002:a05:6830:411b:b0:73e:5710:cfa with SMTP id
 46e09a7af769-7419d1ff199mr2563144a34.15.1754177799740; 
 Sat, 02 Aug 2025 16:36:39 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:36:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 45/85] target/arm: Support page protections for GCS mmu
 indexes
Date: Sun,  3 Aug 2025 09:29:13 +1000
Message-ID: <20250802232953.413294-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Take read and write from the s1perms.gcs bit computed
by the Arm pseudocode.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index ee887d9a02..3c84f0f024 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1584,12 +1584,16 @@ static int get_S1prot_indirect(CPUARMState *env, S1Translate *ptw,
         }
     }
 
-    if (perm & PAGE_WXN) {
+    if (regime_is_gcs(mmu_idx)) {
+        /*
+         * Note that the one s1perms.gcs bit controls both read and write
+         * access via AccessType_GCS.  See AArch64.S1CheckPermissions.
+         */
+        perm = (perm & PAGE_GCS ? PAGE_READ | PAGE_WRITE : 0);
+    } else if (perm & PAGE_WXN) {
         perm &= ~PAGE_EXEC;
     }
 
-    /* TODO: FEAT_GCS */
-
     return perm & PAGE_RWX;
 }
 
@@ -2236,6 +2240,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
              */
             prot = get_S1prot_indirect(env, ptw, mmu_idx, pi, po,
                                        result->f.attrs.space, out_space);
+        } else if (regime_is_gcs(mmu_idx)) {
+            /*
+             * While one must use indirect permissions to successfully
+             * use GCS instructions, AArch64.S1DirectBasePermissions
+             * faithfully supplies s1perms.gcs = 0, Just In Case.
+             */
+            prot = 0;
         } else {
             int xn = extract64(attrs, 54, 1);
             int pxn = extract64(attrs, 53, 1);
-- 
2.43.0


