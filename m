Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp98763ejb;
        Wed, 31 May 2023 09:56:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uin1MgHA+SkcYWN2qPTNdJfbkAOQIaX5jYP4Zc4rQ7eLITAiJDdLWgoFVNJg9/2so2n6X
X-Received: by 2002:a05:620a:2a13:b0:75b:23a1:43e with SMTP id o19-20020a05620a2a1300b0075b23a1043emr7934266qkp.4.1685552216148;
        Wed, 31 May 2023 09:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685552216; cv=none;
        d=google.com; s=arc-20160816;
        b=YncQcW1+s2f9p+fHE/bYhV2J18wqRHd/Cs9xQhHk8kclj+qZNAFJ67HfCX3ipWl9sc
         x++eFBqozdyNZdti88T1/zLtjNPzB8MAmm6YGBChnIKYJj/q9li22qWk0NLTnkp363hP
         jTyiATpIotyQOK+XaYLzWRNWZlFJcrKlWbqHQ39SXFIplQe1j00hUwkR5JSiMEyo+xUz
         ZcjN5qD0VV4aCDf9/w3SwY2qBUICXmWpN6ILxynpItgPkZj/zf4jaDjkUl1yrybRzC/q
         zupZX2kurTVlYT5G6Jg+xrTEnpyIwV4vqo2rpq2JcVS6EcAq7HGmWLGTIJZopoqK2em9
         +RPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=9UxaCveLchjB1J54SLS5xWSzhe+jT/IDvcJurWbgNqs=;
        b=h3qdnyVbcPQ46w+juSS+cPCs0VpN7V5Lv8jJ2ODKE2BOX/SnOvvezAy46dCJTzvOmK
         jopjAOBWM+9TZdzMePzGv152jQowVIUB+UZzgtBn9yQW/UWfPdDusXOpZD5jIDY3MnWD
         GxKEICDl8rQnyZzltDy0lc6i8I29OyEx1HWX0Gx0QIcHE7WoLaCIcXA4BNmCv+izWUSy
         ublZUU5oGwVkreL3oyn9Y5DSe7bF8xfC4sTBrztasDBQQofxbbV10sEm7EFa65gvwXoC
         BoKBy/nuVHACGLuIkTjq1JC2tUQaR4ipsK8axegCOBSn4pJjWcLfJKSnfGQT3U064Zis
         NWQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=bt6ChfnS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19-20020ae9f013000000b007590d551ca4si8115102qkg.550.2023.05.31.09.56.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 09:56:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=bt6ChfnS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q4P74-000151-Ej; Wed, 31 May 2023 12:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Enx3ZAQKChMy4FDz77z4x.v759x5D-wxEx4676z6D.7Az@flex--flwu.bounces.google.com>)
 id 1q4P6z-00010A-8M
 for qemu-devel@nongnu.org; Wed, 31 May 2023 12:55:49 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Enx3ZAQKChMy4FDz77z4x.v759x5D-wxEx4676z6D.7Az@flex--flwu.bounces.google.com>)
 id 1q4P6x-0002ft-JN
 for qemu-devel@nongnu.org; Wed, 31 May 2023 12:55:49 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-ba81b238ee8so10937581276.0
 for <qemu-devel@nongnu.org>; Wed, 31 May 2023 09:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1685552146; x=1688144146;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9UxaCveLchjB1J54SLS5xWSzhe+jT/IDvcJurWbgNqs=;
 b=bt6ChfnShYxzN0yrjPceA5leU9TqNtrSrTRWdks8mG+qR36InNiPYdZAhHwy63vCPg
 ol18xNEdXKfngFzAEg21lr0hvzjvbdMKYEYWhR6Ku9Pb8v3btjdGaWa+75dw7jpqGwVh
 aI7T/CaKem/1Qq4CGj0fgsZvcwibL7wDQv9oCnK1KD7gT0YxPd31REDbY0nFCa4rl+7U
 UPfkBqD1zwZtY8mD7jeOfgrHJFzzzjA5wArt+EqAQiTPmsNmYs6/kfCahs+BU9w/x+LN
 3u77fRsMb9JXJ5Zo3bzrYFK2iWUdmr1ZkjT2wtxuqUE1pqO6ehwAXx7ciqvBQwx2bpnI
 T+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685552146; x=1688144146;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9UxaCveLchjB1J54SLS5xWSzhe+jT/IDvcJurWbgNqs=;
 b=IZebjeJ2in1FTMIcpr32B2KWCD9o4AaNS9TmJbxR8TW1J2iGNjfcVu7fRbappGdwaS
 19qMr4bGw2e+mTP5pFih0Pa5LYKxrXUn6Vxx1FCmiYNKgdDg/7yLabTjW1WL5Du7uBn3
 npmbHiEr85btkDwgIn4sv1vxqpFKBKs+kabTd9xtH0guoxh8fId/LbZVSs6vLO0Wiyni
 OrJA/zeV0uIUcnCcVzZmbRLxhjofiGP/pipkLOUaMPcuGY/Ba8UHEljXdXb/m6XW8Z1a
 QF1s8/eSZHCj8iIP9JpQ8zGk4fqwPquyKY1GGpUb9SKeBCH0eOG8kk4r1uKc383je0tw
 0OCA==
X-Gm-Message-State: AC+VfDyKAATEzSHb8eWBpHM3ib322O4h9/1I87oYo/snR6jpgdMVR1Wg
 czFcggnEuahrUwU24HjN5OSZd0ls
X-Received: from flwu.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2200])
 (user=flwu job=sendgmr) by 2002:a05:6902:729:b0:bb1:445a:6f05 with
 SMTP id
 l9-20020a056902072900b00bb1445a6f05mr1564704ybt.4.1685552146440; Wed, 31 May
 2023 09:55:46 -0700 (PDT)
Date: Wed, 31 May 2023 16:55:36 +0000
In-Reply-To: <20230531165537.3721999-1-flwu@google.com>
Mime-Version: 1.0
References: <20230531165537.3721999-1-flwu@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230531165537.3721999-2-flwu@google.com>
Subject: [PATCH 1/2] hw/gpio: Add property for ASPEED GPIO in 32 bits basis
From: Jingbo Wu <flwu@google.com>
To: clg@kaod.org, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Felix Wu <flwu@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3Enx3ZAQKChMy4FDz77z4x.v759x5D-wxEx4676z6D.7Az@flex--flwu.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 1PQNz+rAntm8

From: Felix Wu <flwu@google.com>

Added 32 bits property for ASPEED GPIO. Previously it can only be access in bitwise manner.

This change gives ASPEED similar behavior as Nuvoton.

Signed-off-by: Felix Wu <flwu@google.com>
---
 hw/gpio/aspeed_gpio.c | 56 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 1e267dd482..e4fa5c1c79 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -951,6 +951,56 @@ static void aspeed_gpio_set_pin(Object *obj, Visitor *v, const char *name,
     aspeed_gpio_set_pin_level(s, set_idx, pin, level);
 }
 
+static void aspeed_gpio_set_set(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
+{
+    uint32_t set_val = 0;
+    AspeedGPIOState *s = ASPEED_GPIO(obj);
+    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
+    int set_idx = 0;
+
+    if (!visit_type_uint32(v, name, &set_val, errp)) {
+        return;
+    }
+
+    if (sscanf(name, "gpio-set[%d]", &set_idx) != 1) {
+        error_setg(errp, "%s: error reading %s", __func__, name);
+        return;
+    }
+
+    if (set_idx >= agc->nr_gpio_sets || set_idx < 0) {
+        error_setg(errp, "%s: invalid set_idx %s", __func__, name);
+        return;
+    }
+
+    aspeed_gpio_update(s, &s->sets[set_idx], set_val,
+                       ~s->sets[set_idx].direction);
+}
+
+static void aspeed_gpio_get_set(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
+{
+    uint32_t set_val = 0;
+    AspeedGPIOState *s = ASPEED_GPIO(obj);
+    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
+    int set_idx = 0;
+
+    if (sscanf(name, "gpio-set[%d]", &set_idx) != 1) {
+        error_setg(errp, "%s: error reading %s", __func__, name);
+        return;
+    }
+
+    if (set_idx >= agc->nr_gpio_sets || set_idx < 0) {
+        error_setg(errp, "%s: invalid set_idx %s", __func__, name);
+        return;
+    }
+
+    set_val = s->sets[set_idx].data_value;
+    visit_type_uint32(v, name, &set_val, errp);
+}
+
 /****************** Setup functions ******************/
 static const GPIOSetProperties ast2400_set_props[ASPEED_GPIO_MAX_NR_SETS] = {
     [0] = {0xffffffff,  0xffffffff,  {"A", "B", "C", "D"} },
@@ -1061,6 +1111,12 @@ static void aspeed_gpio_init(Object *obj)
             g_free(name);
         }
     }
+
+    for (int i = 0; i < agc->nr_gpio_sets; i++) {
+        char *name = g_strdup_printf("gpio-set[%d]", i);
+        object_property_add(obj, name, "uint32", aspeed_gpio_get_set,
+        aspeed_gpio_set_set, NULL, NULL);
+    }
 }
 
 static const VMStateDescription vmstate_gpio_regs = {
-- 
2.41.0.rc0.172.g3f132b7071-goog

