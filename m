Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2403722lfb;
        Tue, 7 Jun 2022 13:38:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSTJwyBQSUt5dWzfuo+G601Ese0F0m50RmkxE+D+cuJ7uas4XkJK2eDVYMiPLcs5v9g897
X-Received: by 2002:a37:e11a:0:b0:6a6:abff:f83 with SMTP id c26-20020a37e11a000000b006a6abff0f83mr12940971qkm.781.1654634280711;
        Tue, 07 Jun 2022 13:38:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654634280; cv=none;
        d=google.com; s=arc-20160816;
        b=jwvh+NqYxSqDQvivOde4P7c8UBlCiAaSl3e1hMYDwNviifBdwlMMsnM9wcXlnMr7Mm
         yy2sbA9I55lluNasnjMyi/5RUD4IDIcShiqDXmitVPw9j3qA5dZ++E9g/ZFMCcGY8XR7
         X6edCcETaTRSnlnS3JXi7prp64+2tMBAkE/ahdICsz7/oca1zVBdyqj0oxJYgdjgxSNY
         EQ8j5QAjc+ypJ1NaK9X/lDGC2X2siQim4EYmRQM6yskaw/Mj98UAXk/G8+T/QvR1KbEa
         A73ss7sSbLse/6fcTCUCbBMqFCCu6gocA6ktzM5NxUrNreA09l90jvp7yw/C4dNoFa2I
         O6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=swxajT381TgS1/Nf3oQ+qlH3g7Wj94ec884EPLSXaF4=;
        b=ZbSrn7tm8QAwtDc5870SOHylRv6EuQAQBzq6P0cPGpJScnM8abHX4w84pNIB+J78bh
         L7GobR7qgHjooVIh1vQ8y02tUgow/dfEBbCAGNDPARLhjJCA7xCQ2IvpYfrNwFxmBun+
         vbBB0yr9N2HVlB43zeyKeoynTdd2Zyff1w9oUYKQcuREVK6oRRC/4mKjB7xhrYO3oArT
         1iPZ5MOBkAb/+5gB2e6YxtVj0BiM62Q7hqk4pWeVv60eJFmfwNZNodP82SDwYGXqzKCe
         zJFd2Cae8wWRqx2RkbYBVOP4pWkuhw5fHCwbYmjFIJgtdGTqqe8VAEmDDWTsVkP1CkCO
         h2cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n1DpIQ/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy11-20020a0562140f6b00b004644b74cd94si9320529qvb.477.2022.06.07.13.38.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:38:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n1DpIQ/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyfxg-00087u-4S
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftD-0007U1-62
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:23 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyft5-0007EH-OD
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:22 -0400
Received: by mail-pl1-x62c.google.com with SMTP id q18so15770248pln.12
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=swxajT381TgS1/Nf3oQ+qlH3g7Wj94ec884EPLSXaF4=;
 b=n1DpIQ/LMVvrHA7TxsZMtqrtiALLahHuP9JVkFGEowc7tRrlaYPvxF4UgSRTkYyo4a
 gWjC+qX4Pl3A0ZXRdO9nHtBA+4Gtmb3ELx8CKd2tWsBdoTYGABfltN7xLfMR4lAJtxf7
 H61D3ix54qmq2gVqgaYmogV2ABu6odj0bir6m+yrkq1OcX7V6KhvjJ9wL7k6OZH+Qfmn
 5QlpJhDmf38sLEnkIE7lgx/pAvqCY7d4Aek4hUoPcU5bL74RIdwNm5R0H4NAsp6FtNZ3
 F9AQCU9H325+VFZGay/wuDOZRVFvjfc+vj29+O3u4CfBwx0MAjhWZg/oUnrsyxzFfxmy
 BUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=swxajT381TgS1/Nf3oQ+qlH3g7Wj94ec884EPLSXaF4=;
 b=kvTmOIliix7leE35IN8TDL4ietrPOR0kFuEaZ2iOIzRsBQI04ofXR9eRXAaWxDjD2t
 yTlebpKocyquxJloJG0MZgSAKrz+U5RRQZ7k/kHSls39UzeHVCssdsrSoPG5tramIpEy
 3nUsKxHX6uw2sUVkwYQ15q17KIEk/8/8PBpV4bYVOch7tOH3PMrn3pYYjLlurv/vZX4u
 dsPFvUKIN1MQm7SJvSDOIMpgPMmGslPj7j0QwYS5U8HfmwGE8Jxm/+Yjp9sd9bMZE7rB
 V4BgoSoZ38kpT58hI3SmKz1msOrDUAHLmKRhDjBoxsocBMZoPp5lkEZodpNFZcfHYs/E
 k96Q==
X-Gm-Message-State: AOAM532xbP3zfI/xDp6O0KcxRJCqG3zOmwoL086fwN0G7cefmzaJJcI5
 gnKc+rapBUV5ayh9Ilm5Q3PoQPshRX3BPA==
X-Received: by 2002:a17:90b:1b01:b0:1e3:421c:90f with SMTP id
 nu1-20020a17090b1b0100b001e3421c090fmr41869910pjb.59.1654633993906; 
 Tue, 07 Jun 2022 13:33:13 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 07/71] target/arm: Use el_is_in_host for sve_exception_el
Date: Tue,  7 Jun 2022 13:32:02 -0700
Message-Id: <20220607203306.657998-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KyAIo5aDUZqQ

The ARM pseudocode function CheckNormalSVEEnabled uses this
predicate now, and I think it's a bit clearer.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 135c3e790c..7319c91fc2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6180,9 +6180,7 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
 int sve_exception_el(CPUARMState *env, int el)
 {
 #ifndef CONFIG_USER_ONLY
-    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-
-    if (el <= 1 && (hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+    if (el <= 1 && !el_is_in_host(env, el)) {
         switch (FIELD_EX64(env->cp15.cpacr_el1, CPACR_EL1, ZEN)) {
         case 1:
             if (el != 0) {
@@ -6199,6 +6197,7 @@ int sve_exception_el(CPUARMState *env, int el)
      * CPTR_EL2 changes format with HCR_EL2.E2H (regardless of TGE).
      */
     if (el <= 2) {
+        uint64_t hcr_el2 = arm_hcr_el2_eff(env);
         if (hcr_el2 & HCR_E2H) {
             switch (FIELD_EX64(env->cp15.cptr_el[2], CPTR_EL2, ZEN)) {
             case 1:
-- 
2.34.1

