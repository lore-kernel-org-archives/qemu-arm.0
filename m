Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1918003lfj;
        Fri, 6 May 2022 09:26:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBXn9DD4D3BAjkndZK553lvEx6C/40RwgwmgIO1rczcwdQb8StL4hlBrsC2rt/h+xLVPsA
X-Received: by 2002:a0c:d7cd:0:b0:432:8df8:94e2 with SMTP id g13-20020a0cd7cd000000b004328df894e2mr3174997qvj.90.1651854402755;
        Fri, 06 May 2022 09:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651854402; cv=none;
        d=google.com; s=arc-20160816;
        b=FFiaE14QMhNqho9lUBr7jnI/z1heNjypE2sNyZDst/IJQYkhiWKBEloWP5VyaCWuI0
         GLFbvKn6tZ14+P4C00LdnCah3oawh7xK2RdlXtsWxnx1YsGTLlH0vyvBQfQWHYBhfjzL
         3EirSEd3flcMqTr539u2esOuJetnLDN447zdOb/kZYQ9301mAQBR8ctkQF8UVGprTHxq
         RYholEZib7u3igFuaHrb7kjRPjO2051vupPcl5EIDJeD4/lN3mxQWEpyU9K/HohG/Z0d
         ZICO/brOVsuA2PW8xa8QEPVd2d4bMIQsKeGkqtYeb3GF7Koqqq9Z6leO6Isud+HPI9VX
         orRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rznGUlqhm1e5gkG+nuwND08zKHXTaunZHlwOXJp3GXs=;
        b=OppZh+Kx8a42xIkauhumz5S8gEy5BGJVfrbbgkqOGCyb5H927gCppCj9oj+8JtkryR
         MBfwKOWk3yWciLL2RBi481v1/zL/V9vFqpW97QAUad0cfccH9nIrr+7sLROkliZpnfcp
         VqV3rzfeKaOyxQV7sk+1N1doFx0CARjjzZYVE//B180jjsM6R+QPS2621XFmc5TiGWgI
         YJ3BZQG+jSok9i+kQNogS0034bqCB0vxzMBO67O8jTCGjZ8num75a1h2I7wxrXcKTCi4
         oeB+FWmDrLEOgKaLOuoktsrmJdw35TftitIlX1IMEkM9gs+kajqzuEa6FUNPJds9VZZg
         RvVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FwrRa/Tv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp36-20020a05622a1ba400b002f3cbec40a5si448716qtb.652.2022.05.06.09.26.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 09:26:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FwrRa/Tv";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn0mw-0005Oc-8p
	for alex.bennee@linaro.org; Fri, 06 May 2022 12:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0i4-0005PB-Ii
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:21:41 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0i2-00056x-R7
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:21:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u3so10710938wrg.3
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rznGUlqhm1e5gkG+nuwND08zKHXTaunZHlwOXJp3GXs=;
 b=FwrRa/TvxVORlHBkmC27VQUTCDLeyyslUHXesXwBr6jkQd1og5PR1BVvKTGLlipVJn
 aHd4g7shJbWXBKxZNGmV2PFaYA9rK3AYiurZPnT3AfQaZcwzi2PwM80b7JX6W8TJYYHH
 F1bLaDJ95pc38JeppYeggie45O2qfNkxDamxYTB5aLou04Xrd6rl65/ueaHDVdlEXFCP
 qIfWhe8bYAlU/dDBJc8usEBxm7XAQhdsobONUcefAUQrI6UWN3+tb53CC51hrpYvz0Wk
 Tfd3PA0QDX2WRqMc30iK6i+9z9QzgCkFmyg9bOx7lQPkENc0ls2lHm6JCrLAzlhDaBUf
 Okfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rznGUlqhm1e5gkG+nuwND08zKHXTaunZHlwOXJp3GXs=;
 b=wDWJt/AdtzedNt0XbfHaXuNdnUqOJ9tiE4R3J3mxgf1SC6vGUR0bM0ivKjhJ69KxoU
 dOopYpOnesk+WJTg0Pm5eXlhPcUrSXbXwz/ZuEZirxKvtXOz3+L6rDARlogeC5KzW6ms
 b21pzq4MQgSXmXV65bsBGko7CDBrUQwQsrKTIihEq0fvcygB6/u1a4XeKW7uK5o/52Vv
 RD/fMJQxLFS9/odnspA2DZ+8ujS2JR+aFFNg340XQ0EIZon6bLyPmi1VjjPsUiIihO4W
 jxkDMhNVDqGdlH1gm7ditQ3rW+bR447aw9PBFA8dCrMZ6O7Wf6Odki6s9mEyg6n6IORr
 CDDQ==
X-Gm-Message-State: AOAM531tNAgSXAsZOZIdpfM1v5naDS0H8hAdGtZ/kZkVjXwlX6XK8TFR
 oNVj/AO27H4dX38hUCXsCHIOmg==
X-Received: by 2002:adf:eb87:0:b0:20c:a5b5:6731 with SMTP id
 t7-20020adfeb87000000b0020ca5b56731mr3383751wrn.199.1651854096235; 
 Fri, 06 May 2022 09:21:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4482000000b0020c5253d926sm3782082wrq.114.2022.05.06.09.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 09:21:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw/intc/arm_gicv3: Provide ich_num_aprs()
Date: Fri,  6 May 2022 17:21:29 +0100
Message-Id: <20220506162129.2896966-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506162129.2896966-1-peter.maydell@linaro.org>
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u8D5Q2fCODsD

We previously open-coded the expression for the number of virtual APR
registers and the assertion that it was not going to cause us to
overflow the cs->ich_apr[] array.  Factor this out into a new
ich_num_aprs() function, for consistency with the icc_num_aprs()
function we just added for the physical APR handling.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index e277a807bd5..5418ad9bbc5 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -49,6 +49,14 @@ static inline int icv_min_vbpr(GICv3CPUState *cs)
     return 7 - cs->vprebits;
 }
 
+static inline int ich_num_aprs(GICv3CPUState *cs)
+{
+    /* Return the number of virtual APR registers (1, 2, or 4) */
+    int aprmax = 1 << (cs->vprebits - 5);
+    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
+    return aprmax;
+}
+
 /* Simple accessor functions for LR fields */
 static uint32_t ich_lr_vintid(uint64_t lr)
 {
@@ -145,11 +153,8 @@ static int ich_highest_active_virt_prio(GICv3CPUState *cs)
      * in the ICH Active Priority Registers.
      */
     int i;
-    int aprmax = 1 << (cs->vprebits - 5);
 
-    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
-
-    for (i = 0; i < aprmax; i++) {
+    for (i = 0; i < ich_num_aprs(cs); i++) {
         uint32_t apr = cs->ich_apr[GICV3_G0][i] |
             cs->ich_apr[GICV3_G1NS][i];
 
@@ -1333,11 +1338,8 @@ static int icv_drop_prio(GICv3CPUState *cs)
      * 32 bits are actually relevant.
      */
     int i;
-    int aprmax = 1 << (cs->vprebits - 5);
 
-    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
-
-    for (i = 0; i < aprmax; i++) {
+    for (i = 0; i < ich_num_aprs(cs); i++) {
         uint64_t *papr0 = &cs->ich_apr[GICV3_G0][i];
         uint64_t *papr1 = &cs->ich_apr[GICV3_G1NS][i];
         int apr0count, apr1count;
-- 
2.25.1

