Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp229495ejb;
        Wed, 31 May 2023 13:36:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5DNT9opSr3MvVf2Zs7V/zQKyDUWz+YeeVebbZ7qziRm6AQx6CSwTdrmcQYlh//q0M1jGIU
X-Received: by 2002:a05:620a:688a:b0:75b:23a1:8310 with SMTP id rv10-20020a05620a688a00b0075b23a18310mr7300151qkn.11.1685565413244;
        Wed, 31 May 2023 13:36:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685565413; cv=none;
        d=google.com; s=arc-20160816;
        b=ZNbH6ByrPnLPP/8F8+Th5ZRjAlN5jT3KQfdNP5xrRvBRXW9ZOCqnljADLMXX4NcJlA
         GeoRAFczj+tgJ0TDuvI9QGnPM4cchuVSiHG1gOmWbZx+i93ZiIPIYxBY2JQa4yrACyQS
         zFbnvL02EWAVpdyg7GXA16vPmNrg0hrmGHh4kBusJQv8egyl+HhfFpJLjBktey2ePD+k
         p+fiWm9wq7W5WokusaABkd+85hyE4PpkbRwDJHjVuChvO2BnZ9vZj6Jzxls7FnjxqE+9
         tYa9RZZNEOMba6VBCQiTEmMZkrk7n0uKHpo2v1tPeYWAb1uE+1tgJr39t63q5g4+qo5y
         gaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=C6ZS1kmk8mZOQBkFwaVnQN91jrsnv+kxH/BK7lbOklA=;
        b=pZMJruy0vPO0HvfdFFVeHdM4FiAXslZJx6uRcbUYj8mYj1vsTOQ95+lOWKFVb66GL2
         G/X+BsgJz0fXh8NKFNcO3cSTRkdNuEJDVzPZgToaYGHspulifpJSJsDlXaI+D5Uzb1UK
         CzfC6MUo+ckFHRB+gUJk8bMm1fRfj3cDfxW5GiM+DjlDBYI0kkDCkWHdEb4r0t2ZZF4i
         s3qXlyfTcJWRwpKTiE3smn1j7HT5LIdyeWfTza4K7PvNMsZ2CgUlMaZw9Uc8Q66oI0YZ
         61iaDfzVcAbXyPwxSnsmw20DYFohTnruPKxeW35aocdAEpZg5aJY92FKYglST4ormHIO
         Xdjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LAa9SCOi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19-20020a05620a16b300b0075c9b5d1ab6si9036262qkj.457.2023.05.31.13.36.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 13:36:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LAa9SCOi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q4SYX-0007QP-KZ; Wed, 31 May 2023 16:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYM-0007AH-Im
 for qemu-devel@nongnu.org; Wed, 31 May 2023 16:36:19 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4SYJ-0003CR-U3
 for qemu-devel@nongnu.org; Wed, 31 May 2023 16:36:18 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f6dfc4e01fso996565e9.0
 for <qemu-devel@nongnu.org>; Wed, 31 May 2023 13:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685565374; x=1688157374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C6ZS1kmk8mZOQBkFwaVnQN91jrsnv+kxH/BK7lbOklA=;
 b=LAa9SCOiPODw2fs1xd3Iw11oZalGADGbhZsRgQKGaYN8cy8EeYESCeRTchLpDlKFVP
 wPCc7lJgGgitq+x9pMGPgcp/tKfCeKeRl+6/43mXgI5P5WVdgn947ZulNo+j0c9mV5eX
 D9aTlsyb1jetl08tS/yZnFQeBiueBtDVGnhsr+PaKzNaYGjfbT1ZpHbu52PUq12KQLHL
 abdMnJTF6a7GgYjhi8dXigo7O+OlLO+NjFjtyyViBM/Crzi5BxEy+K/6aqlBSqqXA9XR
 klY/mGDOqqAC9KFcQXLJPrOfpWNHRhCOhvzb99VepwJTwpudF13uKk8q7Ohxt9EmqpS0
 vpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685565374; x=1688157374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C6ZS1kmk8mZOQBkFwaVnQN91jrsnv+kxH/BK7lbOklA=;
 b=MoQhCQnjPfjN17FUeiuJWskbUbQuoKerumUVYTXr/jdsMTRokWM3HSuh/0A3UgLuts
 0t07XHKONuhNTO8BbyqZ7z2QCZKATwkhNWQTSW1gmWTlQgj22dItVZ/XcHoTBI235c4x
 Tbpxal0q3haekCBsYUrRQUyuZzi5+fXBRzB/Q9bU0YBBomUR9v6u8LLibnOAyJ3937Gv
 FUlNApzXnM5CttaIsffku8vqrTv0dfZvhNYV5GTRLB0p2OCgNq5BUfqIqzg5mygFjX/K
 SiwTRotBxgZgRhT/9dOZcd1DM8+MM0YCNFTxwBSAz7DmeZoIN4liyG3kikc501GJcENc
 bDgw==
X-Gm-Message-State: AC+VfDw1dL5oZryzh7fIIh50+0hXROiDpDXSRtUJ/WZoVzvc7tuSEVSH
 HIFWkRzct3BtbP+H9aoALXyQDwSI6ddbJi2OgWI=
X-Received: by 2002:a7b:ca59:0:b0:3f4:f7c2:d681 with SMTP id
 m25-20020a7bca59000000b003f4f7c2d681mr355070wml.29.1685565374223; 
 Wed, 31 May 2023 13:36:14 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b003f18b942338sm22087120wmc.3.2023.05.31.13.36.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 13:36:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/15] hw/timer/arm_timer: Move SP804 code around
Date: Wed, 31 May 2023 22:35:46 +0200
Message-Id: <20230531203559.29140-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230531203559.29140-1-philmd@linaro.org>
References: <20230531203559.29140-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BPjl0ri820YJ

Move sp804_properties[] and sp804_class_init() around
with the rest of SP804 code code. What follows the
"Integrator/CP timer module." is strictly ICP related.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/arm_timer.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index e410b37a23..36f6586f80 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -309,6 +309,21 @@ static void sp804_realize(DeviceState *dev, Error **errp)
     s->timer[1]->irq = qemu_allocate_irq(sp804_set_irq, s, 1);
 }
 
+static Property sp804_properties[] = {
+    DEFINE_PROP_UINT32("freq0", SP804State, freq0, 1000000),
+    DEFINE_PROP_UINT32("freq1", SP804State, freq1, 1000000),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void sp804_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *k = DEVICE_CLASS(klass);
+
+    k->realize = sp804_realize;
+    device_class_set_props(k, sp804_properties);
+    k->vmsd = &vmstate_sp804;
+}
+
 /* Integrator/CP timer module.  */
 
 #define TYPE_INTEGRATOR_PIT "integrator_pit"
@@ -380,21 +395,6 @@ static void icp_pit_init(Object *obj)
        save themselves.  */
 }
 
-static Property sp804_properties[] = {
-    DEFINE_PROP_UINT32("freq0", SP804State, freq0, 1000000),
-    DEFINE_PROP_UINT32("freq1", SP804State, freq1, 1000000),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void sp804_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *k = DEVICE_CLASS(klass);
-
-    k->realize = sp804_realize;
-    device_class_set_props(k, sp804_properties);
-    k->vmsd = &vmstate_sp804;
-}
-
 static const TypeInfo arm_timer_types[] = {
     {
         .name           = TYPE_INTEGRATOR_PIT,
-- 
2.38.1

