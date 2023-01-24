Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3294429ejc;
        Mon, 23 Jan 2023 16:02:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtNW7XoGcdSdDv8kLgimNuFFsfEt1o9mYnVlYV3eFvlouofxhcql1YoeowCzCZ7gpnoeUpS
X-Received: by 2002:ad4:5c46:0:b0:536:ba5e:6a8d with SMTP id a6-20020ad45c46000000b00536ba5e6a8dmr26668229qva.22.1674518519909;
        Mon, 23 Jan 2023 16:01:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518519; cv=none;
        d=google.com; s=arc-20160816;
        b=xvmYcjrUqhRRN35TmEWrnnXRv/jH4lE1JN0XMN6wfJ7oPKRrvKqwV82b+KjM6NM1JP
         h/lq3BWScfA1HalpCHGVwLfSCxBpsbGha1kvBYXHccfLQiK2McOcyejR3a2oRR9xqv6B
         1ZrtjcDeP0Wa4MnBuJZ/bnXUPOvRodLn1TID5u4m9ll405rv3dIrR6CpnwWES6hbuJ60
         0NQqHmPni3G0cC600JDbk/u5SJ7g+oJ/D7VJ2QIO/Gs4FFkUvywOgIRa6T8RnOBuo6Ox
         8D9X/MvnoMWUepdgd8OoL7oQp7FQiCt7H5gbK1/TP3wma1PG+SHU4Xfz1IYrM42bPFLc
         Tuvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iCmbkLa0yYr0QBg1CfQR5sNbcMWAWJk89TMhy0bc8HA=;
        b=HqVidtMBL2GkVFx+gPOETZHyJodVFEWwNW+oR2g6gzbJnWhf0W0whvf0TU01IDFZrj
         8EtpVT8Ed44+l89J+/9k+kQtGVYhU22ghNhD/cTRf063IvWB/e8zLlR9USaTCIk5YdyE
         GJTOBmBt6FwhKlv5yBlfwsTimTkd8o+ixxh6W5RpvaarumE0soMs1t8QK9BXN5Ij0S8I
         1BT1kyKPqO3dm4D9Fr6aQKZ1wBZOOEOAOVajNLfU1C/C6pIJKtLAmv9ZoRmRCpHJaKuR
         omNk0iVjXHFcQXGDKq5sx3RnAxmwk0xuDm0MbaUxNb7ou0P3qfmeEys8SXncILEY17Te
         y8eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W1QFLQHU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p12-20020ad452ec000000b004b1b507ce87si257436qvu.130.2023.01.23.16.01.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:01:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W1QFLQHU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pK6kZ-0000ru-1q; Mon, 23 Jan 2023 19:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kV-0000bp-Li
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:16 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kT-0001qY-9O
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:01:15 -0500
Received: by mail-pf1-x429.google.com with SMTP id s3so10083060pfd.12
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 16:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iCmbkLa0yYr0QBg1CfQR5sNbcMWAWJk89TMhy0bc8HA=;
 b=W1QFLQHUNk4auQyvGViV6iqYI7eysC7CXKLkFOJFx0wc+v8K6cqxnFf5WJ2Xif9tdd
 cNApj9VkWMtNMeV9obPZwB//Hjahx62jn9hGY/knjuPi1C26E+1yKAlrQKJ1ANvtVjaV
 Tuy6OZnV6H2gNV8sMqi2zpWDZ0ISD5GyNjyr4WryiO+pnFPjA8jFiSlPV7Y8pqgVX8A8
 K0iSfdBmgHK7VuVdVhZhMmcJayycmXjqQ840R53TihEASppUWa3RnRFOhRQV5mp/1ZyU
 iA44pNlcOH6xX07Q0iJnhYbRC/4UlBBCGekES3vV4NZ7LDq6/becB5VWTukxT6iItn3D
 iPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iCmbkLa0yYr0QBg1CfQR5sNbcMWAWJk89TMhy0bc8HA=;
 b=OIUpLT4P4qQdRElvytOaLDQqRP6FF9WyR+mIXG2XcFiN3gcxcaXZw7hlsE93ER6+r9
 GAWZ1NjAhoRYNIvcdZsOSz3mGKM6TFZYwv8BxH+6T04/mYiJBNifNnX0R+e69gbucfTL
 RMOKU229vTWwdeWV8LdJ5KRi1pVUBN9rHRQ2ClwAfDgCw08B0ojcpSZUhiD3xsa8Yaqc
 8+NIh5shJDgjmffgLOelkw8HJKAQI52vXGBuTNuLmPUc7/VJpTFS99EJ+M8f9yVob/Cm
 VIdTsMVlI1SVa9CLM0GAE19UnDsRx6FhK8T7M8940+c+Kn1RAsS3nRzaBhtptO31HHkS
 3OUw==
X-Gm-Message-State: AFqh2krUQ88ohQrKCoKijpmp1aNi3QQY/vneDfjDyzmriCWJ+3lYokkr
 MUjQ2trzE4/BEI4nyX1sVZauXQ==
X-Received: by 2002:a62:1ac9:0:b0:57a:7b74:4ec5 with SMTP id
 a192-20020a621ac9000000b0057a7b744ec5mr26366412pfa.13.1674518472501; 
 Mon, 23 Jan 2023 16:01:12 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 15/22] target/arm: Use get_phys_addr_with_struct in
 S1_ptw_translate
Date: Mon, 23 Jan 2023 14:00:20 -1000
Message-Id: <20230124000027.3565716-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
X-TUID: hPHCAoGay+VZ

Do not provide a fast-path for physical addresses,
as those will need to be validated for GPC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6b6f8195eb..37f5ff220c 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -234,29 +234,22 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
          * From gdbstub, do not use softmmu so that we don't modify the
          * state of the cpu at all, including softmmu tlb contents.
          */
-        if (regime_is_stage2(s2_mmu_idx)) {
-            S1Translate s2ptw = {
-                .in_mmu_idx = s2_mmu_idx,
-                .in_ptw_idx = arm_space_to_phys(space),
-                .in_space = space,
-                .in_secure = is_secure,
-                .in_debug = true,
-            };
-            GetPhysAddrResult s2 = { };
+        S1Translate s2ptw = {
+            .in_mmu_idx = s2_mmu_idx,
+            .in_ptw_idx = arm_space_to_phys(space),
+            .in_space = space,
+            .in_secure = is_secure,
+            .in_debug = true,
+        };
+        GetPhysAddrResult s2 = { };
 
-            if (get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
-                                   false, &s2, fi)) {
-                goto fail;
-            }
-            ptw->out_phys = s2.f.phys_addr;
-            pte_attrs = s2.cacheattrs.attrs;
-            pte_secure = s2.f.attrs.secure;
-        } else {
-            /* Regime is physical. */
-            ptw->out_phys = addr;
-            pte_attrs = 0;
-            pte_secure = is_secure;
+        if (get_phys_addr_with_struct(env, &s2ptw, addr,
+                                      MMU_DATA_LOAD, &s2, fi)) {
+            goto fail;
         }
+        ptw->out_phys = s2.f.phys_addr;
+        pte_attrs = s2.cacheattrs.attrs;
+        pte_secure = s2.f.attrs.secure;
         ptw->out_host = NULL;
         ptw->out_rw = false;
     } else {
-- 
2.34.1

