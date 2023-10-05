Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp69911ejc;
        Wed, 4 Oct 2023 21:52:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS27B6O69ryc+sns47EpsR7Ss2sA+cAEbYBML4fzmJ3d7PIN5che5z8g48lz8kltUG5OD0
X-Received: by 2002:ac8:5c82:0:b0:419:5c43:9d1a with SMTP id r2-20020ac85c82000000b004195c439d1amr4303216qta.68.1696481541389;
        Wed, 04 Oct 2023 21:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696481541; cv=none;
        d=google.com; s=arc-20160816;
        b=1HlPpI5FAqb3XXDZu3l3v9+/pMmYecMaZ7trYUQ2S0/DQDEUyOBUm/RCUISG8fjDxf
         G+0u60k1ag69Eb5o3y/Wn0PpEHujj+mOU+tjzCFUqkbY5Z+y5dY3ucbdw2c6XIwM9kSt
         FJ8XMThM/iniQX4c1k7qNE/30wF1RRwLTRrjFNgMzDk14BrawPWsI0RIPNj+ZE0k+aCa
         xU1VFE/JtVUJrCJy5ahxJs5K6IW6SjgHkC+Agu5EvtYwzwpmdbvhKlxxutlA4yuJsi6C
         8E6qA3ZILqXSbu69azR6ijNBm/Fo0BQ3WS3ueUXQRaRo6TF7woiWDS/16LSVX6cPJTx7
         DBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1SNFnHlL4hvCYTsSAUCxKg7fEKq/31KjVEaRB5Pubfs=;
        fh=8kPojgz0Lj/kINi+7TLymFEExDOI5/Rymkq8qHUApi4=;
        b=YiiSrpyX6TyBVJy6L5Mzd45Dl1QraXvJollhnkIoeC7g6S/9Zm6ueF/EXah03zA4wi
         eUDGXrj0EYYf/Yj30B39l6tYcWf2RbEAI/mRo7LkVw2AgqtL5i1Ba+8B+7j48s3kFikN
         0A0V2DhpjC9Tq3MMB2R9irOIhA0+/ztnb/BzXIhi+51sMBc9LoYTlcJh2k3+CkaGgJeH
         pl0fsMQxy13q1VyBg1F1grRV6byAFK1+dBlIDcWCgZWDhsi/pkCAmyxVYWQyl06EMfGT
         QmuxHa/XVxQpyh4ZUrZ9QdapIOZwXg42d+h/qJOn77GIZhZZGULv7G9O9GuL45tja9Yr
         0VzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xf6XmpCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020a05622a145300b004196dcfc3d0si427079qtx.248.2023.10.04.21.52.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 21:52:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xf6XmpCm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoGL5-0006KA-Qo; Thu, 05 Oct 2023 00:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGL4-0006J2-Rm
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGL1-0005jG-IT
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:52 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3231dff4343so315391f8f.0
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 21:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696481509; x=1697086309; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1SNFnHlL4hvCYTsSAUCxKg7fEKq/31KjVEaRB5Pubfs=;
 b=Xf6XmpCmohYv++AKHPstdOGLlht5RJPKVY47+f8QCMsQ1wruQTY2nKOYxtyeki05dE
 Y+DiYTV7ZfGiDRi0xk+AuH4eTREWPj+XcplZe9UveAn69JCeJZr4ipljD5BFzZiHid54
 OiIiLdxTEhya4brN9GzeK2Zs21QZjXVsukerZSDS1aWEPrYRCqhEeW6PidqlOBCpna7f
 HJufYL1wGzFdEtkY9yUnMZ9VEo4OB9K5WHqT6Y+7Wr/MVDX6Awrhqv2jBZXoP+5lqhbB
 4n2tLRqumupXzEpYlIkJyJxMJzr+HYAMHXrhxYgi3ts2xRsqOzbsv+Eh3zDNSno2t/wU
 aW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696481509; x=1697086309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1SNFnHlL4hvCYTsSAUCxKg7fEKq/31KjVEaRB5Pubfs=;
 b=bBDDrJmNoztepgK2FbCwjqggaj7/N1jtKuV2yYpJlt/qJb6DgI1FV79xVZXPxz0UYz
 erShp3/cHvVps6UC12c0uRB6fKIKhTSacqVxoXj2HNNNmVSoibAXjq1KhCiGgmF9hAvQ
 Ktbdcunfb5YEJiOQxtNmDGgxcwzb7SYQ3b0rzZUZ3qIT0TaLeeE5h0KeZza2P3NkOa1v
 O3iUT5hxQEK/qX10oh2lxVxerqjZBWRdGjVF6x5+VBdXOjc5wHyqkoyfo+qpj99zKU7m
 SskD+8xaLAbX4b0vQfZxb52wPdWOHHnVHf5eetCP7Cm3rjjScSOd4/l49b5RJS5dpjQl
 Gouw==
X-Gm-Message-State: AOJu0YzHlsxhU5MsmxqDU0yKCKPxvgFY7KOzCbN1SN4S83/y7w+vslKU
 Il3zR7kc3h8QNb/OqZelELld4Q==
X-Received: by 2002:a5d:4dc9:0:b0:321:f74d:ade3 with SMTP id
 f9-20020a5d4dc9000000b00321f74dade3mr159772wru.32.1696481509352; 
 Wed, 04 Oct 2023 21:51:49 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-211-120.dsl.sta.abo.bbox.fr.
 [176.171.211.120]) by smtp.gmail.com with ESMTPSA id
 s4-20020adff804000000b00327db11731csm753246wrp.22.2023.10.04.21.51.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 21:51:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH v2 10/22] qapi: Correct error message for 'vcpu_dirty_limit'
 parameter
Date: Thu,  5 Oct 2023 06:50:27 +0200
Message-ID: <20231005045041.52649-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005045041.52649-1-philmd@linaro.org>
References: <20231005045041.52649-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: lE4wsBuMB1Eh

QERR_INVALID_PARAMETER_VALUE is defined as:

  #define QERR_INVALID_PARAMETER_VALUE \
      "Parameter '%s' expects %s"

The current error is formatted as:

  "Parameter 'vcpu_dirty_limit' expects is invalid, it must greater then 1 MB/s"

Replace by:

  "Parameter 'vcpu_dirty_limit' is invalid, it must greater then 1 MB/s"

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 migration/options.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/migration/options.c b/migration/options.c
index 1d1e1321b0..79fce0c3a9 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -1163,9 +1163,8 @@ bool migrate_params_check(MigrationParameters *params, Error **errp)
 
     if (params->has_vcpu_dirty_limit &&
         (params->vcpu_dirty_limit < 1)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "vcpu_dirty_limit",
-                   "is invalid, it must greater then 1 MB/s");
+        error_setg(errp, "Parameter 'vcpu_dirty_limit' is invalid,"
+                         " it must greater then 1 MB/s");
         return false;
     }
 
-- 
2.41.0

