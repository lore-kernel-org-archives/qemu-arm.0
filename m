Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp880782ejg;
        Fri, 19 Jan 2024 03:41:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVSM533yKXb5gqj+xydallXK/uW+3IQ5vsK8jBBcZxxybQmA+TyWL+26Nl8hBXRG5Vf4Hw
X-Received: by 2002:a05:6214:419a:b0:681:784b:dfd8 with SMTP id ld26-20020a056214419a00b00681784bdfd8mr2274305qvb.7.1705664498346;
        Fri, 19 Jan 2024 03:41:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664498; cv=none;
        d=google.com; s=arc-20160816;
        b=dJNj/dKFdx7n4CP+f6Wh7m3ZGPLxIWsHGWyJP2mP/7CE5i0LqEeX1ZioyDtas3NvWv
         ZLe2KmQrM1dC8kKA6Vwmh+NqNKvfpAxyI69F5YD6U2dHhOsnS+KgIEU4PfK/lx3OdUWB
         zimLpP0bBmx+OOwafXeHagIuZL6OVAgn88f41HSn0ewGuEgEZHXgV8z6wGYcqPqYdI/y
         by0meIeq92v9JS0ijL6hdTh/ial5dg11H9hEZohw2hVBgSwz3yJvT4EEB7jUfJsEvti3
         lsv3DlFA76FMe0Zor1O1iwDj8nX0vDM/ALRYFFa5xIUOg53aVdZAqwQvIEAsr81dUNv8
         zRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aQOkcaUpM1nuG7GogvbsKjXDm4q63jaSl49eYjwL8qs=;
        fh=yQ/y9OmnwFXi95mZAMEr2IiKs0KiIaQjwmU10ttUeGw=;
        b=vmDyS20ukGP/WDPnWxVqo6+oBAvj7km3gs4Qtv/RlHjLMCa+Wi5k7vbtE9rhxsumOE
         PDGABom50J05mrKYR0IGppkTkkL3ypYoqSsIEBlu1MojtwLdvJvP86LkroGQiOSY4lPy
         aRpS6GKxKyWT1PQEGW8v+ZRGWRTetKcpUG6c4/aNY0FQdEKMqd+WvEdhs5PLvWiDAViH
         TuC4SlJEm7wKiyXh+cjTiFIvp73n+G9kJcbnnFEdHo82/HCYz5UywOhFmEsFodhi4q7d
         GbD9BSss4xwcsWQNPAqqD1n7NT6jTq99wXH17ENkZ/W0TSJrUMj02XB9uycK/0Qgx34/
         VW5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWWaWAaF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a05621419eb00b0068174e47acesi7304996qvc.290.2024.01.19.03.41.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:41:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWWaWAaF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQn9f-0001U7-N5; Fri, 19 Jan 2024 06:35:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9e-0001T4-HH
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:22 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQn9b-0007Tp-HF
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:22 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e9101b5f9so7115465e9.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664118; x=1706268918; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aQOkcaUpM1nuG7GogvbsKjXDm4q63jaSl49eYjwL8qs=;
 b=TWWaWAaFUL/aJWTt2pX0vHl/EAjgfFf/ZhlhNBPPGpTtwOXQYfmXs5CY6UTkdcZQgZ
 N5fY4OFJ4vbSdgyqeelKLwBh4td2D8GIvVgJZXBo1tQVprjg07ujGhfagYijBKH0sIlA
 PnDlBAWIu7obPRS4Kr1sTmhKQIsaDo1J1L533oIuSR3ZjbCIzK8LJxTrywZalMl7i+A6
 P2iZFmf9AyeXxtM8BAqG9JP303E/DCMDGEBRysE1DNveUiaPgJMaFBa/CVi3EW55N+G6
 b7BfOdU1g2dpGsBVKGVPlgb+ZtdHmRKKMXxNjYbPEUVx6yMEnj21I+0fgpKeWD0a5a1C
 FBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664118; x=1706268918;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aQOkcaUpM1nuG7GogvbsKjXDm4q63jaSl49eYjwL8qs=;
 b=n3m8HbxwFIqV8ieZ3k5C4NBoh0Nb7ixzrWjw0W17rJY9kMvS1SWiMju+ulvFcaO8Qe
 mmS71qsGVjONyHFwoLRlv0b9xjcesA+PWgQhjhZJNR+5q5nJCx6u/hyMdLN+pv7xmGBF
 Oizu7RZm7QVu5bImI9susTQJNrcog4fvn9fQkEEBZfoEC88WoyZI1mygTccH4ik00H4m
 2ePRYNKG2Mk5eYXSXs/GXPljt5DIoPI5sdVFGSvpsqp/lVwtcRL8igsvTUXv+zxdKbzP
 SEBYs1JdDWCSwOcji3E5Osl494C/QZGsqaeos2O5Q7Yxr0mh5cDo74tNo9tQFfU5sPAo
 9+3g==
X-Gm-Message-State: AOJu0YwQ94E4cQVMgruaOXwoeXlwRA6OU/5coEvladiRTotoRFiFCDq+
 42WTrmMyVsW7tcNrWkUpBfe+gO6+uzlYKfr7wa644OFZ3NVnS2Vg9RVkMcMyIYmMsGOIhcH9k47
 KbavfOA==
X-Received: by 2002:a05:600c:3317:b0:40d:7c42:5de9 with SMTP id
 q23-20020a05600c331700b0040d7c425de9mr1478936wmp.126.1705664118017; 
 Fri, 19 Jan 2024 03:35:18 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 m26-20020a05600c3b1a00b0040e4c1dade4sm33037802wms.36.2024.01.19.03.35.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>,
 Gonglei <arei.gonglei@huawei.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PULL 02/36] backends/cryptodev: Do not ignore throttle/backends
 Errors
Date: Fri, 19 Jan 2024 12:34:31 +0100
Message-ID: <20240119113507.31951-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +jx9Bozx9+O/

Both cryptodev_backend_set_throttle() and CryptoDevBackendClass::init()
can set their Error** argument. Do not ignore them, return early
on failure. Without that, running into another failure trips
error_setv()'s assertion. Use the ERRP_GUARD() macro as suggested
in commit ae7c80a7bd ("error: New macro ERRP_GUARD()").

Cc: qemu-stable@nongnu.org
Fixes: e7a775fd9f ("cryptodev: Account statistics")
Fixes: 2580b452ff ("cryptodev: support QoS")
Reviewed-by: zhenwei pi <pizhenwei@bytedance.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20231120150418.93443-1-philmd@linaro.org>
---
 backends/cryptodev.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/backends/cryptodev.c b/backends/cryptodev.c
index e5006bd215..fff89fd62a 100644
--- a/backends/cryptodev.c
+++ b/backends/cryptodev.c
@@ -398,6 +398,7 @@ static void cryptodev_backend_set_ops(Object *obj, Visitor *v,
 static void
 cryptodev_backend_complete(UserCreatable *uc, Error **errp)
 {
+    ERRP_GUARD();
     CryptoDevBackend *backend = CRYPTODEV_BACKEND(uc);
     CryptoDevBackendClass *bc = CRYPTODEV_BACKEND_GET_CLASS(uc);
     uint32_t services;
@@ -406,11 +407,20 @@ cryptodev_backend_complete(UserCreatable *uc, Error **errp)
     QTAILQ_INIT(&backend->opinfos);
     value = backend->tc.buckets[THROTTLE_OPS_TOTAL].avg;
     cryptodev_backend_set_throttle(backend, THROTTLE_OPS_TOTAL, value, errp);
+    if (*errp) {
+        return;
+    }
     value = backend->tc.buckets[THROTTLE_BPS_TOTAL].avg;
     cryptodev_backend_set_throttle(backend, THROTTLE_BPS_TOTAL, value, errp);
+    if (*errp) {
+        return;
+    }
 
     if (bc->init) {
         bc->init(backend, errp);
+        if (*errp) {
+            return;
+        }
     }
 
     services = backend->conf.crypto_services;
-- 
2.41.0

