Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2818958ejb;
        Wed, 4 Oct 2023 10:35:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1o8yAlOjAgBFSmcc/rn5rt215A32joFrQVgXmO9uLBXNz0/sK9keqUMUQjq9wWmlBAoYH
X-Received: by 2002:ac8:5d8f:0:b0:418:111e:790f with SMTP id d15-20020ac85d8f000000b00418111e790fmr3174648qtx.65.1696440955716;
        Wed, 04 Oct 2023 10:35:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696440955; cv=none;
        d=google.com; s=arc-20160816;
        b=wBhxDQ2eH8/8ZB4QqCX57+9TuwpOVV7+C8t99kjgt7cb6IzToyCoQpTs/9no7pUfsj
         BmcczcICu++gCJN1r24pyHC5It7nPgMrfDyfjmJk6HHDzTyvQt2tRkqOOdWoSBGVwINM
         IYNkYj7OAq26knsq+3jLJgOH4bFkWZhP1N9WUXWCJiY1unBVrKfs5yybxWIRMPpx+oKe
         +eWM1I40749JTwG6jeA72BWBT5sMRHL7pao8pRlfkvWw7n7zHJS29E4V0FxOY8mbZqWV
         EDk173Ms5QloTEdF1Ou5JHV5/1aZwH0xOQ6eghmW/GYyRBqFHs4LH1jnFhyXYcTZXwwV
         wcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZMzoYshmIKgiyI46JZRTSl2tAoK4bhnefguZfodjbZQ=;
        fh=qzFiq2mTf6+A1Urj7c6RXNxTkCqydwvsp7xKZURtKhw=;
        b=kx2AkTv31j0ATG+YJO4+YYrIyWB5OAiNXHxQjN30er1YBBZyfcrhEMBgKAaSGqksst
         Upety5exEtbY2z9k1t6qSJb8rxtOSne7TcKH2VJPWL/VVkz9u0eq0YPJLpzhT9JI0ByN
         I0++eYZWgmHMtCynY/8wqb7r0jlLq/tPG71J+Xk/40MYC4Rnwt7AtYQLdN8nuZrdOK8k
         CQuVIHCJ4dfZENm7K+YZke6viXVHJAhfw/d2ZpotdSIICabPK1nrp9Zpdvr/Q+tpPJcG
         vYS5YhSiiRIcL1d93MhoGD3CETcdivlt7ApWPVT+0IYZy8vhRvlbei9bMpJdtQYpwdkc
         3f+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SPzsInjl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12-20020ac87d8c000000b0040365c02841si1684967qtd.582.2023.10.04.10.35.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 10:35:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SPzsInjl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo5kz-00057p-2p; Wed, 04 Oct 2023 13:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5kw-00053N-ML
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:33:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5ku-0001Gb-Tv
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:33:54 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32329d935d4so96284f8f.2
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 10:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696440831; x=1697045631; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMzoYshmIKgiyI46JZRTSl2tAoK4bhnefguZfodjbZQ=;
 b=SPzsInjlowfDayG/a8nkQuspKf6w14l0qIKS7blCzN1gGAXtU23Sh/2et7Cn3Bt1fr
 4c9bj5uXVYIN4xG3UbSN0+YTznXSoCfCEX6sGDDHGgHXKnv6k2CcObZNEnlY05u7iB0x
 pj4j45Bt/BltLAKsJ885Pix+3M4e5/jLFmhT+uvfzz2+SXpTThENqGNp0inKPZqstl7p
 QiV+airD+6AT2xZVusRhG0//rG4+YMbbkmOfuwf7oKAGG04Ju7cxQ6cFRlCDHmYCbu6a
 X64u897h+LiJr8ywe3yOwB/2Zj6egGo+67Y2+H5l1AoFDHzXssft/jZTGxkjYp0vJ79I
 z/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696440831; x=1697045631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZMzoYshmIKgiyI46JZRTSl2tAoK4bhnefguZfodjbZQ=;
 b=dRRV2In4QdewbHZYbfhmUHD33CKg13985aD7E5gnzqzss8qP0qQ+XempSdgLj2UIpO
 VDpLdk9IRYy/r1y2Lok9TCVvmHTXtGpVcDp5YXirh+JUvG3DwL9tH6DSYIXoP9Tjvj8A
 ApSXvIFyTFRbC92wfJYz5isugcCBdS5dgFn4/SRCcZOwjiQoYXOV7soG1YW6boiwlDuO
 Zs+Y7qsovM6qBsddRqqT9xsJQjWbmfYr4KZVP1dDBzcjm13573++3oWpF8zQPnDHLa1s
 pGD4bjtVth1KKofbP4kegCIPpck6iT+W8Eae/XVquwJxjpBCAqVP5XIhxGooq69ezVPo
 fEyA==
X-Gm-Message-State: AOJu0Yw3VT8srzt1mt0n76JIzJSyOHr+a7bRh2QbY2Cbie0Hb0cLYuhA
 ZT+roiZ7M2ryaSgfPjiX1RFroA==
X-Received: by 2002:adf:ecc3:0:b0:319:7c0f:d920 with SMTP id
 s3-20020adfecc3000000b003197c0fd920mr2875094wro.57.1696440831513; 
 Wed, 04 Oct 2023 10:33:51 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 v22-20020a1cf716000000b003fefcbe7fa8sm2013488wmh.28.2023.10.04.10.33.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 10:33:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH 16/21] qapi: Inline and remove QERR_MISSING_PARAMETER
 definition
Date: Wed,  4 Oct 2023 19:31:51 +0200
Message-ID: <20231004173158.42591-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004173158.42591-1-philmd@linaro.org>
References: <20231004173158.42591-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 5ds39tbOE7xo

Address the comment added in commit 4629ed1e98
("qerror: Finally unused, clean up"), from 2015:

  /*
   * These macros will go away, please don't use
   * in new code, and do not add new ones!
   */

Mechanical transformation using sed, manually
removing the definition in include/qapi/qmp/qerror.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qapi/qmp/qerror.h    | 3 ---
 qapi/opts-visitor.c          | 2 +-
 qapi/qapi-forward-visitor.c  | 2 +-
 qapi/qobject-input-visitor.c | 2 +-
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index cc4dae1076..b0f48f22fe 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -17,9 +17,6 @@
  * add new ones!
  */
 
-#define QERR_MISSING_PARAMETER \
-    "Parameter '%s' is missing"
-
 #define QERR_PROPERTY_VALUE_BAD \
     "Property '%s.%s' doesn't take value '%s'"
 
diff --git a/qapi/opts-visitor.c b/qapi/opts-visitor.c
index 844db583f4..bf0d8acbd6 100644
--- a/qapi/opts-visitor.c
+++ b/qapi/opts-visitor.c
@@ -218,7 +218,7 @@ lookup_distinct(const OptsVisitor *ov, const char *name, Error **errp)
 
     list = g_hash_table_lookup(ov->unprocessed_opts, name);
     if (!list) {
-        error_setg(errp, QERR_MISSING_PARAMETER, name);
+        error_setg(errp, "Parameter '%s' is missing", name);
     }
     return list;
 }
diff --git a/qapi/qapi-forward-visitor.c b/qapi/qapi-forward-visitor.c
index e36d9bc9ba..3fb2c954aa 100644
--- a/qapi/qapi-forward-visitor.c
+++ b/qapi/qapi-forward-visitor.c
@@ -49,7 +49,7 @@ static bool forward_field_translate_name(ForwardFieldVisitor *v, const char **na
         *name = v->to;
         return true;
     }
-    error_setg(errp, QERR_MISSING_PARAMETER, *name);
+    error_setg(errp, "Parameter '%s' is missing", *name);
     return false;
 }
 
diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index f5fa6c1878..17e9f3b638 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -168,7 +168,7 @@ static QObject *qobject_input_get_object(QObjectInputVisitor *qiv,
     QObject *obj = qobject_input_try_get_object(qiv, name, consume);
 
     if (!obj) {
-        error_setg(errp, QERR_MISSING_PARAMETER, full_name(qiv, name));
+        error_setg(errp, "Parameter '%s' is missing", full_name(qiv, name));
     }
     return obj;
 }
-- 
2.41.0

