Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp69835ejc;
        Wed, 4 Oct 2023 21:52:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmxwDhR475CfWVa+j1Ri4BNmNq0qhI4P4sQ5Z4OPywWtrfGM5V4yJ/KDdJxeie41QFMPTH
X-Received: by 2002:a05:620a:404a:b0:773:b543:5989 with SMTP id i10-20020a05620a404a00b00773b5435989mr5176552qko.2.1696481527537;
        Wed, 04 Oct 2023 21:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696481527; cv=none;
        d=google.com; s=arc-20160816;
        b=BF0w59Gcu6WB5P40vcT0nzZXHl7i9fJ9rv0+SfiVS608NXt0M8Ftoh2Ew2ofvs9BH5
         1Z1Tyx28FGiABafURhM1CP93+7X6a1cKuMrF7fSpdkxnBCvHCz46k1Cqp3ZTxHqABCHS
         175dMxtrREoT0VdClvtqbZzCWCgdSnDbiqP5RKSvqtz7UpOg3e4YVK1kkCKeOJiZkUOz
         w2nPrjScMmgnbSnDkQj7gFK7X+0FY5Tr5gqlpFdd8Rk7ODH/RL3W6KsS1aTkyG4jNocq
         LicGk1Wlnmsz8veFA5dk90nh0rcZysb1A6+e9sgVw8Ng+Pb6cA3zjJ5bBAGBDDhFsU8M
         nqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UnezdLBVjvZnCdXX1V4kutiq/Z6kzmSrGXxXnwF1wNc=;
        fh=mOvKa1oMAvPR5RjPR5ofPIt1a9Xhg06cYPysM5IEYtQ=;
        b=IiG/KY+E3ADmx3E+Zgdw16CBkP4NgPpzZpt3Kyio/5UPt5qINxQL2MbhJK/eZZelIw
         VMW4lPNuAMGklErgHa/xpvQgfb+isiEd1Rs3H3sU9b9rzb6dIUF2f4sSjYsLBu1NA0+g
         WGRm3lXkOVigWcI+p2Dk4Xg2x8dUAip/FcpcqWSZrXP0fODRqPoklM0Qp4Plyf8jUU++
         zX9TymCPO2w85FphFHxZeS/s0OKfEvG3lvQVLekfEkJV/INNrcSn3Qxx71QGDtUZr1aM
         rq1M5L/s1rl6ZhB10IYLBL+HBmEaLpO6T43/568UADKR1iqbyTbWsR7SbULYiUq+JLx6
         wDZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xkT+6lGn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a05620a214a00b00775b341e4c3si410883qkm.103.2023.10.04.21.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 21:52:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xkT+6lGn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoGL0-0006Cu-6H; Thu, 05 Oct 2023 00:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKv-00067q-QS
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:47 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKp-0005c2-WA
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:44 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3248aa5cf4eso590994f8f.1
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 21:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696481496; x=1697086296; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnezdLBVjvZnCdXX1V4kutiq/Z6kzmSrGXxXnwF1wNc=;
 b=xkT+6lGnrWf8t0VNKfPpz+M+5K1VLK0wpzL8JqGVok+mUg9utPE3LeS6VqH/0vwnWp
 QeQo4fxqS0sakUvOZV1GI9d8BGMpRYSmvMJ96rGf5pYooU8DW8x8q16iEC4igOm1pco5
 ckFC9Uuo3U3huD6D+jf+z6WVCU1Qnb9UgWwhF7XELc+rT+WWCKYkchXtaOn0lZPT80GY
 p9mo8XlsO/6nrPYup8Mck49Bs182oZVHta6y1pQHZOIddUHSRxhjadAzJc95FhuT2JZi
 nJ0GfiX3ESr9vGGBNn1eJxYCf7PIdCWQzwHmF6BCfAsqD86IKuPxWaewd/p5El+illT7
 p0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696481496; x=1697086296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UnezdLBVjvZnCdXX1V4kutiq/Z6kzmSrGXxXnwF1wNc=;
 b=G/NYL9iF0z4lE6W2KUU/x5PjWT8VVWozhiWD2n+plWI62tjYVA3dX3am8ZR3LVAFHL
 93A6s+0mj3WI+qY58sMsP8U/1Fi5UWmJ29jvueanT1yAOXSQ+h6+igrmYjlXv+38FofY
 QA3bTbCiD2wl5oHXu/bXTvNI9qv/DNqxhMQkUKQj4+fDmjnJeikRyG56tIS+ZQ3jKtM7
 qUGUoiTgkU9jvUSup7T1A4O1OP0tLgbo7WUioTE7rs0kly0jN+PlKb727iIYYynLl5YR
 xUNR6o7RdcCBtdumAVonctdksdwjyEzK70FGgMkekIiIyCGrLARWTAEjc995CU/lUlZr
 xZhA==
X-Gm-Message-State: AOJu0YygDrbgjLRKkuRvR87j4Xw490GSZQF0QennnwQ9/2Dr0u5S6rZ4
 yEod5o1+YTqUW1O38RwGjzAY6A==
X-Received: by 2002:a5d:6a07:0:b0:321:7844:de44 with SMTP id
 m7-20020a5d6a07000000b003217844de44mr3618406wru.45.1696481496706; 
 Wed, 04 Oct 2023 21:51:36 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-211-120.dsl.sta.abo.bbox.fr.
 [176.171.211.120]) by smtp.gmail.com with ESMTPSA id
 e15-20020a5d594f000000b0030ada01ca78sm750316wri.10.2023.10.04.21.51.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 21:51:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 08/22] qapi: Inline QERR_INVALID_PARAMETER_TYPE definition
 (constant value)
Date: Thu,  5 Oct 2023 06:50:25 +0200
Message-ID: <20231005045041.52649-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005045041.52649-1-philmd@linaro.org>
References: <20231005045041.52649-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: oS9mAqk7tKcx

Address the comment added in commit 4629ed1e98
("qerror: Finally unused, clean up"), from 2015:

  /*
   * These macros will go away, please don't use
   * in new code, and do not add new ones!
   */

Mechanical transformation using the following
coccinelle semantic patch:

    @match@
    expression errp;
    expression param;
    constant value;
    @@
         error_setg(errp, QERR_INVALID_PARAMETER_TYPE, param, value);

    @script:python strformat depends on match@
    value << match.value;
    fixedfmt; // new var
    @@
    fixedfmt = f'"Invalid parameter type for \'%s\', expected: {value[1:-1]}"'
    coccinelle.fixedfmt = cocci.make_ident(fixedfmt)

    @replace@
    expression match.errp;
    expression match.param;
    constant match.value;
    identifier strformat.fixedfmt;
    @@
    -    error_setg(errp, QERR_INVALID_PARAMETER_TYPE, param, value);
    +    error_setg(errp, fixedfmt, param);

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qapi/qobject-input-visitor.c | 32 ++++++++++++++++----------------
 qapi/string-input-visitor.c  |  8 ++++----
 qom/object.c                 | 12 ++++++++----
 3 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/qapi/qobject-input-visitor.c b/qapi/qobject-input-visitor.c
index 3e8aca6b15..f110a804b2 100644
--- a/qapi/qobject-input-visitor.c
+++ b/qapi/qobject-input-visitor.c
@@ -288,8 +288,8 @@ static bool qobject_input_start_struct(Visitor *v, const char *name, void **obj,
         return false;
     }
     if (qobject_type(qobj) != QTYPE_QDICT) {
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE,
-                   full_name(qiv, name), "object");
+        error_setg(errp, "Invalid parameter type for '%s', expected: object",
+                   full_name(qiv, name));
         return false;
     }
 
@@ -326,8 +326,8 @@ static bool qobject_input_start_list(Visitor *v, const char *name,
         return false;
     }
     if (qobject_type(qobj) != QTYPE_QLIST) {
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE,
-                   full_name(qiv, name), "array");
+        error_setg(errp, "Invalid parameter type for '%s', expected: array",
+                   full_name(qiv, name));
         return false;
     }
 
@@ -405,8 +405,8 @@ static bool qobject_input_type_int64(Visitor *v, const char *name, int64_t *obj,
     }
     qnum = qobject_to(QNum, qobj);
     if (!qnum || !qnum_get_try_int(qnum, obj)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE,
-                   full_name(qiv, name), "integer");
+        error_setg(errp, "Invalid parameter type for '%s', expected: integer",
+                   full_name(qiv, name));
         return false;
     }
     return true;
@@ -494,8 +494,8 @@ static bool qobject_input_type_bool(Visitor *v, const char *name, bool *obj,
     }
     qbool = qobject_to(QBool, qobj);
     if (!qbool) {
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE,
-                   full_name(qiv, name), "boolean");
+        error_setg(errp, "Invalid parameter type for '%s', expected: boolean",
+                   full_name(qiv, name));
         return false;
     }
 
@@ -534,8 +534,8 @@ static bool qobject_input_type_str(Visitor *v, const char *name, char **obj,
     }
     qstr = qobject_to(QString, qobj);
     if (!qstr) {
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE,
-                   full_name(qiv, name), "string");
+        error_setg(errp, "Invalid parameter type for '%s', expected: string",
+                   full_name(qiv, name));
         return false;
     }
 
@@ -565,8 +565,8 @@ static bool qobject_input_type_number(Visitor *v, const char *name, double *obj,
     }
     qnum = qobject_to(QNum, qobj);
     if (!qnum) {
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE,
-                   full_name(qiv, name), "number");
+        error_setg(errp, "Invalid parameter type for '%s', expected: number",
+                   full_name(qiv, name));
         return false;
     }
 
@@ -587,8 +587,8 @@ static bool qobject_input_type_number_keyval(Visitor *v, const char *name,
 
     if (qemu_strtod_finite(str, NULL, &val)) {
         /* TODO report -ERANGE more nicely */
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE,
-                   full_name(qiv, name), "number");
+        error_setg(errp, "Invalid parameter type for '%s', expected: number",
+                   full_name(qiv, name));
         return false;
     }
 
@@ -623,8 +623,8 @@ static bool qobject_input_type_null(Visitor *v, const char *name,
     }
 
     if (qobject_type(qobj) != QTYPE_QNULL) {
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE,
-                   full_name(qiv, name), "null");
+        error_setg(errp, "Invalid parameter type for '%s', expected: null",
+                   full_name(qiv, name));
         return false;
     }
     *obj = qnull();
diff --git a/qapi/string-input-visitor.c b/qapi/string-input-visitor.c
index 197139c1c0..3f1b9e9b41 100644
--- a/qapi/string-input-visitor.c
+++ b/qapi/string-input-visitor.c
@@ -353,8 +353,8 @@ static bool parse_type_number(Visitor *v, const char *name, double *obj,
 
     assert(siv->lm == LM_NONE);
     if (qemu_strtod_finite(siv->string, NULL, &val)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE, name ? name : "null",
-                   "number");
+        error_setg(errp, "Invalid parameter type for '%s', expected: number",
+                   name ? name : "null");
         return false;
     }
 
@@ -371,8 +371,8 @@ static bool parse_type_null(Visitor *v, const char *name, QNull **obj,
     *obj = NULL;
 
     if (siv->string[0]) {
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE, name ? name : "null",
-                   "null");
+        error_setg(errp, "Invalid parameter type for '%s', expected: null",
+                   name ? name : "null");
         return false;
     }
 
diff --git a/qom/object.c b/qom/object.c
index e25f1e96db..890fa0a106 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1443,7 +1443,8 @@ char *object_property_get_str(Object *obj, const char *name,
     }
     qstring = qobject_to(QString, ret);
     if (!qstring) {
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE, name, "string");
+        error_setg(errp, "Invalid parameter type for '%s', expected: string",
+                   name);
         retval = NULL;
     } else {
         retval = g_strdup(qstring_get_str(qstring));
@@ -1504,7 +1505,8 @@ bool object_property_get_bool(Object *obj, const char *name,
     }
     qbool = qobject_to(QBool, ret);
     if (!qbool) {
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE, name, "boolean");
+        error_setg(errp, "Invalid parameter type for '%s', expected: boolean",
+                   name);
         retval = false;
     } else {
         retval = qbool_get_bool(qbool);
@@ -1537,7 +1539,8 @@ int64_t object_property_get_int(Object *obj, const char *name,
 
     qnum = qobject_to(QNum, ret);
     if (!qnum || !qnum_get_try_int(qnum, &retval)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE, name, "int");
+        error_setg(errp, "Invalid parameter type for '%s', expected: int",
+                   name);
         retval = -1;
     }
 
@@ -1606,7 +1609,8 @@ uint64_t object_property_get_uint(Object *obj, const char *name,
     }
     qnum = qobject_to(QNum, ret);
     if (!qnum || !qnum_get_try_uint(qnum, &retval)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_TYPE, name, "uint");
+        error_setg(errp, "Invalid parameter type for '%s', expected: uint",
+                   name);
         retval = 0;
     }
 
-- 
2.41.0

