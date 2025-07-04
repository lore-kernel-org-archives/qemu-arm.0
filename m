Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1250673dyc;
        Fri, 4 Jul 2025 07:23:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXklfkyVenbXl1hpB+pAl0RBU/mFIWpyY1wE9BDwTP1qva1Ds2/E/6rJvdaCYwqPLjLs42FLXWdunAdFw==@linaro.org
X-Google-Smtp-Source: AGHT+IHajQrwrZpZBQydZwyQr46To+Ih2TQmKtw6uny9P0n6jjgvMyFw4dLZxJfApGEHh1s0Kez/
X-Received: by 2002:a05:620a:27d6:b0:7d4:27ff:b7a7 with SMTP id af79cd13be357-7d5ddc7bdc4mr341686685a.48.1751639038883;
        Fri, 04 Jul 2025 07:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639038; cv=none;
        d=google.com; s=arc-20240605;
        b=HhrOkylViZq7V/EU3rw5wh1qasSkDTorizzsws++uEumvwF8qwyfQIvAG5QGjl5FGf
         ZRZZm+FWjPE4HIDv5R8I5VLpgyis3L1DLhwiOq7bpMhHvMPI/ng3lIz35KtwUSeNy/XL
         J/PkVquP3fD/aaxqUBKIcfowODLVMPFkL3CJl5eY56F5B0fIyOEbsU0nKBUqCcrmAK1V
         7UmavaqwgYD4uHqg9fKsnn3KvHiocphjyGT1/LfJJ2bWv6ZWxtiytjbWs7okgm0f6Uak
         99g85iT5Pq6NN8SVirIMUw8nfKnNMiXotNb+MO/LAgNetAM3Mq29pyoRxuR1AfUQlXOH
         6/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uH1n1AAhtH6sgiTrUxsUntCDDF+ojb2NWa6yE2aObVo=;
        fh=s400U+Tx6cQDhtn+2Oey97pyo8KpW6wmR0wxZgTa8vk=;
        b=VWLLOup8CtdutMwJtLnmJru1fsphem4TklFpSi7Ib1hvBBvr3CVF/iOntuV9tG4b4J
         M6d7FbEe8yEIfiEXPMWdFGBdSIwx6ZYY/n3HlfQfWqBuEiGZkXwGyycKyJzG9YM6cZIB
         HcXPUBnrqiis4uqm/7mFZHo8iBXDyqlezyR/wpiPBUttt2vWJtVj1nh6glg6eTcJEZlx
         OdJnud5o1nfNOCbIPMytzdGbY+rCvYMubXSEOdvV/6zRSqmvyRss4ZVGp6t3/EoEkpG2
         xBYpfOlrAcXNDGK6IG2uXhlw3dCiOerkvQevh0VPOi1a44LH7PxJ5bzS1+PCGZGDT322
         +E/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYmBLvUQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbeca4f9si228798685a.400.2025.07.04.07.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYmBLvUQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhIZ-0005xa-Pt; Fri, 04 Jul 2025 10:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhI0-0004lE-Bf
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:20 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhHy-0005Eb-8y
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:21:19 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-2f78ef10832so690832fac.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751638876; x=1752243676; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uH1n1AAhtH6sgiTrUxsUntCDDF+ojb2NWa6yE2aObVo=;
 b=HYmBLvUQdwZiUqS9/rpH8/zYJNiDXV0X7VO31VycZZGhCJo6/gdKw2briqvmNRkDX/
 QPIBmSZWX7dmiFxW2/AUKxof57dLoUI99uH+Vqnn67qGa5MPNcKm/kzzvWur9aKB9zT8
 YQyb/cpeX/IoWWYL6/n/xOlYtZnIBo8JxuLA41Teq4c1jQCLzksdV8nRNMA6+J8+1AKO
 sqh4HI+t8kX+Mq1oXq8LWvlJUzyEQSh80te78upSd3/piGtkwFlRnaSF2JOIzBtlCJib
 mulseBCz/a+1tmIwMOziG2j2GhkJ58z4MMPBTAGtvVbaCyQUvwMQ+vNuI60P7rx5TQMd
 9gHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751638876; x=1752243676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uH1n1AAhtH6sgiTrUxsUntCDDF+ojb2NWa6yE2aObVo=;
 b=aWmTK2U3PdWFWTWuaqAA3lcLFrRWvpusBhxzNQaUvJcYGoj/LNi5LN61UJM6v/3LpZ
 c8t433/v0YFTpimLIQetUIBjLdNABVW2vl0FYqkRr1uiTLyxfQ5orjY+RNupZ57QTLto
 63fqmpmIXsbsxc7bCYFJ7/r3kolvcX8QID+LFg6AsRcjxzuFutrwminxS4GcMefO1yRK
 6dFMZNnwkeYXgUt89fsX3GwDlP1bKK6lJfcAajfFetMxMnP3bsVxfv4Eia1RhGV63OKb
 pEqufzYdkjUEMEVXtLX0z7haUWl5E/zyuqVT/WcQmynoGjvb/zODNHq4dtXOYiD1qrZd
 +Q3Q==
X-Gm-Message-State: AOJu0Yz6EfWUxjqoILXzsGw6FO2TAxILJkEKl2UTsrIjv8kkwXqMM50y
 NVdSFhWyP4exZReLUj8GseikS3lyHxc9h1ZuwTHK0dxdHCEA+iY914t++7E9JHR6WN0=
X-Gm-Gg: ASbGncuHfJgLxfo68UlMKsBIMtvg9TYIIcyPscw9OHXnsRqRkZMWVGLELEhgLrRiQpu
 PWyuapOCnJTcpKErQvW2NayBGqsY+V+3z6ZCOnccOSWuXigCMBp3W+SaPmiuMfUEoPpQu4huEUq
 IXCC8KGhJ4EVbijr+NwOliWQTk+jROGBOSl/BXFABLM7vzDRXn5zgSPFvVuRR7t+lSSLxBQeh6I
 PVdicQ1tyJiIdWwjs5mBHhl2we8eyY1Opr21Ove6gMTkK4Z5vCKhi8KWk0EV7dOLGtK2w/SVhrX
 t4dOO7P8co54cdRgtBd+i/rOXkC9lxGFtWowpnUxI81Ew+5w66BVCJ7tPJ08/M/P+FKNAqwgXDw
 CNXd+2KvBjmJSJna1PhywRfOMRQujCd+sILti5IYqGr0NPcd4
X-Received: by 2002:a05:6870:e394:b0:2cc:3603:f05f with SMTP id
 586e51a60fabf-2f796e07cacmr1772449fac.35.1751638876543; 
 Fri, 04 Jul 2025 07:21:16 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff0471esm528016fac.3.2025.07.04.07.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:21:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	qemu-stable@nongnu.org
Subject: [PATCH v4 002/108] target/arm: Fix sve_access_check for SME
Date: Fri,  4 Jul 2025 08:19:25 -0600
Message-ID: <20250704142112.1018902-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x34.google.com
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
X-TUID: AeyU3PVijmH+

Do not assume SME implies SVE.  Ensure that the non-streaming
check is present along the SME path, since it is not implied
by sme_*_enabled_check.

Cc: qemu-stable@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5c44a5dece..b0caccca46 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1381,11 +1381,8 @@ static bool fp_access_check_only(DisasContext *s)
     return true;
 }
 
-static bool fp_access_check(DisasContext *s)
+static bool nonstreaming_check(DisasContext *s)
 {
-    if (!fp_access_check_only(s)) {
-        return false;
-    }
     if (s->sme_trap_nonstreaming && s->is_nonstreaming) {
         gen_exception_insn(s, 0, EXCP_UDEF,
                            syn_smetrap(SME_ET_Streaming, false));
@@ -1394,6 +1391,11 @@ static bool fp_access_check(DisasContext *s)
     return true;
 }
 
+static bool fp_access_check(DisasContext *s)
+{
+    return fp_access_check_only(s) && nonstreaming_check(s);
+}
+
 /*
  * Return <0 for non-supported element sizes, with MO_16 controlled by
  * FEAT_FP16; return 0 for fp disabled; otherwise return >0 for success.
@@ -1444,14 +1446,24 @@ static int fp_access_check_vector_hsd(DisasContext *s, bool is_q, MemOp esz)
  */
 bool sve_access_check(DisasContext *s)
 {
-    if (s->pstate_sm || !dc_isar_feature(aa64_sve, s)) {
+    if (dc_isar_feature(aa64_sme, s)) {
         bool ret;
 
-        assert(dc_isar_feature(aa64_sme, s));
-        ret = sme_sm_enabled_check(s);
+        if (s->pstate_sm) {
+            ret = sme_enabled_check(s);
+        } else if (dc_isar_feature(aa64_sve, s)) {
+            goto continue_sve;
+        } else {
+            ret = sme_sm_enabled_check(s);
+        }
+        if (ret) {
+            ret = nonstreaming_check(s);
+        }
         s->sve_access_checked = (ret ? 1 : -1);
         return ret;
     }
+
+ continue_sve:
     if (s->sve_excp_el) {
         /* Assert that we only raise one exception per instruction. */
         assert(!s->sve_access_checked);
-- 
2.43.0

