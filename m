Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp717167lfb;
        Thu, 9 Jun 2022 14:47:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn/6ig4b5TWAErQGdAxE2YLFkIld7M6rEDfdJSY5jkLyZwocesXeHiAL4wP1yLHHIBtVgg
X-Received: by 2002:ac8:5bd1:0:b0:304:efba:972d with SMTP id b17-20020ac85bd1000000b00304efba972dmr17310807qtb.635.1654811249269;
        Thu, 09 Jun 2022 14:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654811249; cv=none;
        d=google.com; s=arc-20160816;
        b=fhV//JJHCDm9G7Vn3HUOlXGtyQSNxlMm9H/4leVOVG46b8rAXA/CQUJOCgt+tgYL8j
         4indvbjocIubG1j/9auIXM0Xs4xHq7b9SMVR5x6rMkbA3ldAWdzNOpwdTYHMnMo6ELTw
         s0JKZtzqXB5pQxRVJuQN3ndJVUUA6uuL8AF1gKn9U1gBimSJEsRv6aov38wGCdGdpVkq
         fdkLiYWR6i1iJ9wE0O6vs3xCBTOrShgWgWO6paxM9FZFX3zhccr8fUgVL+9aX1jq1ri9
         Z+cFy1UYrn6mm7B3r2Pc8WjAkduSDiAvpov+mAuubph+SuZb8FInEQQe5TyPM00ZnzVg
         8oLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z2nY90WUsKFnNetakqOAHrGjM16SH+ECu66ryRheE1s=;
        b=S4OSEjixpb5DtpUdivmZ7RJKYmd/NxtgJKaRtsMuq0nsvKlvbxlhwJRivkGjXox+xM
         9Qr6cos19uWB6SFNqWjpMqKu6luHeZhfzNgyHZc3WZr31N0MUlG34TvT2AeMcOcXmYsZ
         DQKkuc3cUuLX5khLc29JDtIBWivBGIbh4u2qzoL40NqWYZehlWU2Way0OaTSMovjJJ2L
         ctx6a91LBZaKEVWp1wsMJBTsyV6SyY5rZqHcg5e8D6UvNAWL8Xxf34HROl1MQAfb7D4q
         xvjH+0JOslXY2ZzEnsDhmNDTv7aXg2QAECnlfWETED1bcuuLBLGMi2EjceATUHHjbtm3
         3kPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cPMe0a3l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a05622a118a00b002ff738a9414si13790299qtk.260.2022.06.09.14.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 14:47:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cPMe0a3l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzQ00-0001x1-N0
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 17:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzPzd-0001ti-0Z
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 17:47:05 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzPzZ-0003og-DI
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 17:47:04 -0400
Received: by mail-pf1-x434.google.com with SMTP id w21so22240099pfc.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z2nY90WUsKFnNetakqOAHrGjM16SH+ECu66ryRheE1s=;
 b=cPMe0a3lZu/7Ifu8djXBN8HWj8JP5bMk0ioF0HFRfkghojF215SJG1I8IfvudChrAV
 dL0h2/DhI5/UkNV0OXHHnTd7ZOZqtx/Uwg7BV8VOPbIW8BCfPu5qT11LCzKWDG4KHIxW
 /C0iw1616xIzvQcVL3tk7UHe5iFQ/1/DXk5nl7YCULOG6ym2toHX03HEPYkjDvUvNWTx
 M9RziZS3royCbwrhlxNXKgNkbh82fYnfMTMgPPlpVFjh+WaF1JSwPaJ8VSrPRy0fzgk5
 ecrbI/ie5ClzEige/0g8QQ8sNCwtexEBe7canNFcacjlN9Iq2peZ8IBsrM6pOVxDgAWw
 NeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2nY90WUsKFnNetakqOAHrGjM16SH+ECu66ryRheE1s=;
 b=ir5goep1crpqIQnbWFG306z1iMpEEQW0sq5dwSIWg65RttL3BztKN/Hukd6gjIUSGX
 cFnDf0IZodJmzEPhKv75zUvtyZXwJJARwWO8yRDd+BsvBkhuDszXPJoWv+KveoSSQMYM
 AfJsPORgw7yguKui5Y2MZWwE6gKn3eJZ5KuMGmjeoZTckWwauyaBnoHZ2Nqmd2GdcVHA
 gxqGxWS5XuCl2+FOfQEGDHX8HBrTnTPps6UJJFFYlB3x1niMWcAVRdbco53VKICvfS6R
 gcVebZ27PegbI4Mwx3CMM4IpXWsZg3NCgankvj65v+pRnVwkASIU9uEe4kSUTk7jknQ7
 TyCg==
X-Gm-Message-State: AOAM530HCbBOLpJYECzxDXGoVDF9Owt7puODDHQ5aQbhPcNpSgoVODnV
 SHWHAZixjnZCFnCstB7hOOMYZ3x+gFnJoA==
X-Received: by 2002:a05:6a00:2349:b0:51c:29c0:82f6 with SMTP id
 j9-20020a056a00234900b0051c29c082f6mr20155487pfj.32.1654811219207; 
 Thu, 09 Jun 2022 14:46:59 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 gw9-20020a17090b0a4900b001e2f6c7b6f6sm179167pjb.10.2022.06.09.14.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 14:46:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 1/2] target/arm: Adjust format test in scr_write
Date: Thu,  9 Jun 2022 14:46:56 -0700
Message-Id: <20220609214657.1217913-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609214657.1217913-1-richard.henderson@linaro.org>
References: <20220609214657.1217913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
X-TUID: /rB4HQhXFr7x

Because reset always initializes the AA64 version, SCR_EL3,
test the mode of EL3 instead of the type of the cpreg.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ac9942d750..d6818f281a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1738,12 +1738,14 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     uint32_t valid_mask = 0x3fff;
     ARMCPU *cpu = env_archcpu(env);
 
-    if (ri->state == ARM_CP_STATE_AA64) {
-        if (arm_feature(env, ARM_FEATURE_AARCH64) &&
-            !cpu_isar_feature(aa64_aa32_el1, cpu)) {
-                value |= SCR_FW | SCR_AW;   /* these two bits are RES1.  */
-        }
-        valid_mask &= ~SCR_NET;
+    /*
+     * Because SCR_EL3 is the "real" cpreg and SCR is the alias, reset always
+     * passes the reginfo for SCR_EL3, which has type ARM_CP_STATE_AA64.
+     * Instead, choose the format based on the mode of EL3.
+     */
+    if (arm_el_is_aa64(env, 3)) {
+        value |= SCR_FW | SCR_AW;      /* RES1 */
+        valid_mask &= ~SCR_NET;        /* RES0 */
 
         if (cpu_isar_feature(aa64_ras, cpu)) {
             valid_mask |= SCR_TERR;
-- 
2.34.1

