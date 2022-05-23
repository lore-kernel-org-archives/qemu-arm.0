Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3758093lfh;
        Mon, 23 May 2022 13:59:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh/BPhMcyBJkOs1Ehb/cS1GkByyEVWTAtjPv79TKbe/i3M6V9B/+6MyPg8vk4larFwzMWF
X-Received: by 2002:a05:622a:170a:b0:2f3:bc1c:bd0e with SMTP id h10-20020a05622a170a00b002f3bc1cbd0emr17948683qtk.133.1653339562074;
        Mon, 23 May 2022 13:59:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653339562; cv=none;
        d=google.com; s=arc-20160816;
        b=zzopvWBOcfbO5XzFioA2ux9vOvC5qWukJX4y9rZ+SmufrK8+G4TulhrxdSRq+gSKLP
         GvB1IWfwuJCLq1EhZ5akBEAJ3A7nTqXmpmYKdRNjqPn0fNO4OYEeZv9LcQ5bUxHqocYU
         y5yev2ZdBZYnkJKvu5USJ6ybGraPVmHW0H4j9I1R2J4pw3zmQbgEplvOiRSjIhxc0/gz
         7gVVLjOZVXHmFefq8rbxqo1KX0Ryx92ECuP07/uqWEGVRTMwr5t5Atxd/hznXpqvpw0U
         vop7+ig0jbraaBzjvgdQF6pdTkzHRYy7h3i4JaTT+cUP/+UYZ+5Wq/p3NKMiqc2Gbz7d
         2DWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Dt8CbxTVDB+ShnUD/KaNguE181rKbT/m4QnA7xOaLPg=;
        b=E02JnvwFAwbZT816eJcp9ViIYQt1UvAdq+sfGetFlyIAHDeWyb59x/cgIfZ/zPGbJP
         F/rKehXNXlypfd1ZDjmSyA7mS/XAAH10SqSFkwViXjjCCW/tWjb7TmSoHbgEy50TqTvY
         rDs0kgey9rEwIffSPK3ybAoKcnggntRd2WAvCiKpZZ+7g9LQv1/pExdhrG2O9rsiwXwD
         L7zxu1mKxZ5FYhtFsoX510w57icoGB/mJmd8BNCWDSS7/Gml4xq4UMhK+Rf2VbyvpXuW
         x73WIjIoi5oGal5zq2Xavghn02RkkVHCU0Kn1J+iMxjw351AwfmvStX3VjKIJX7Z6arq
         GnJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fG4pX36Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020a05620a248d00b006a01b4b9f44si3494588qkn.17.2022.05.23.13.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 13:59:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fG4pX36Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntF97-00078O-IO
	for alex.bennee@linaro.org; Mon, 23 May 2022 16:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy3-0008LO-Pp
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:55 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy1-0004zC-4x
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:55 -0400
Received: by mail-pj1-x102f.google.com with SMTP id gg20so15065555pjb.1
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dt8CbxTVDB+ShnUD/KaNguE181rKbT/m4QnA7xOaLPg=;
 b=fG4pX36Yf8/hRDRO2f5GBI2/9XQPsgkU7OGc21rMw49eRDW8u1QkdRWkx5i51NN4u1
 tSfHqKB2ZhBZXRi+fYS4xiJUGvXHtFWLIG8tRdE7UwcSNQJk5YHtjrLQq+mjcYE5TVnt
 rInEtTwyDsu/+JRHPPHV+cyokdvx+nmdLxk1z+eXCT6HxdgH7mYxky1x52lQmPv0RjR7
 KwFskHuL2Dp7UWS+cPIuZx3EIty6yAMRP9YGDSTT/RVwwsxpHRJ93oCQp9oOI2pKo4oC
 zDIAM+QX0ZEQUw3aYq4Hq7wgyD25k3nO155gpOpB6CujRKXbmDqGKBsgn2MgEWVc6ihH
 IDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dt8CbxTVDB+ShnUD/KaNguE181rKbT/m4QnA7xOaLPg=;
 b=S+sz0RZ8uRZOPI+jDXFQJQzqXFA09syyCKg/kz79bVmvlW3DNrAZa8gBSMqFkiN1mM
 2KkyvXEEctXjXkyvzZPdjiC7cPYQRh/QzECaRg8H4ngSpKQRjqhOpe79aL1++DYqW3i5
 1oVq31HQbRph4hu7ftHD8gwSn/KJ2pQG3ZAf6X7biEXjgnLZ05bq9MDwlIlD/gltrsMN
 X7Po2AmTZhuFLWpiPGU7Knjri3JpQqQQZ7WHQr8uNQl7eo6/zgTBYTT/BYyvKmNPVWU5
 myRT6uR4jf49h4jgcIl0f/nh5+zyZZJ7RhvTDvie9rj02Zp8iCEjXivSthEDrndDMLdj
 L8Ow==
X-Gm-Message-State: AOAM531bND8QRjSuaEiEcC9CELRfoT7nBGtEalzcuqNy4+gcv7zyxyGe
 g+jiz1oskBmlxsFwizmS1/hkd7RuUHgohQ==
X-Received: by 2002:a17:902:d2c7:b0:161:9c9f:35b8 with SMTP id
 n7-20020a170902d2c700b001619c9f35b8mr24474771plc.81.1653338872386; 
 Mon, 23 May 2022 13:47:52 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/18] target/arm: Use is_a64 in arm_generate_debug_exceptions
Date: Mon, 23 May 2022 13:47:32 -0700
Message-Id: <20220523204742.740932-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: VVTjAinP60FQ

Use the accessor rather than the raw structure member.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/debug_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
index 2bbf065b3a..3a86901779 100644
--- a/target/arm/debug_helper.c
+++ b/target/arm/debug_helper.c
@@ -98,7 +98,7 @@ bool arm_generate_debug_exceptions(CPUARMState *env)
 {
     int cur_el = arm_current_el(env);
 
-    if (env->aarch64) {
+    if (is_a64(env)) {
         return aa64_generate_debug_exceptions(env, cur_el);
     } else {
         return aa32_generate_debug_exceptions(env, cur_el);
-- 
2.34.1

