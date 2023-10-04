Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2817780ejb;
        Wed, 4 Oct 2023 10:33:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4j2MoopxxW1/CBCbInyIaUPkiEO5Q4IzpBtysK0V7hpAOGuZL2uG3S4QsNgr0mNZIMfhG
X-Received: by 2002:a5b:a86:0:b0:d0a:8973:b1c with SMTP id h6-20020a5b0a86000000b00d0a89730b1cmr2518735ybq.12.1696440833227;
        Wed, 04 Oct 2023 10:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696440833; cv=none;
        d=google.com; s=arc-20160816;
        b=rNqGQqaqaIiD7Mv2NS3pQxA2aNjWgZm9v1ViHPoqQD2H7fUZaNP2KPo1oHEYd9yjaf
         XTHPcbV2J3DX+4QgHHLaKoCZMemjd6WXvwnfza45ixx9LLDxCw/yzemVV1Dj8DCFi4A0
         w5RYBFfYJJWoOWzRw5MUG6Nz1y+VLj1IeBgewq4AKLRqykB7EzPQH+XIX3hfD6fWmtKL
         ICHDwOzz5fRTsL9f42m7AJ+7JmYhsrwiM3CT1NcBLCIuk67M6zm6kNYOJRX+ZIXRHJT0
         QZgtMYx4uTu+r2/Sx1yk5vWMnnlQKOTkqKMeg6aFyFYx/jqIgBoC37dzYATXEdVO/l4B
         ZcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UnezdLBVjvZnCdXX1V4kutiq/Z6kzmSrGXxXnwF1wNc=;
        fh=oggtvQaTdWTID53pH2t6Wdz9m2bY86px6PvbJgoQX10=;
        b=FFGKfBP0VFWFuBjnh8vz6c3Ck3mHfYpEpT6XoGGWhtrrGYhAzrmQZsJx9kFW4FGC6O
         OToOzGMsZ9AbbohsA597MGX9LlwVY7IOderZpJbWTcCG7BWEvKDWj7Df8DAS2PE+h+nQ
         6jqab9M/mpHLnXGCa7k/b65nAQbXjoZ3SRLZwBvaTUd+R3mqHChlf14yEQm8ebEQwfV8
         7I8KxoofHfXHkZb0ujq5qUpOzl9ze+Z2mL7sqzJDi0suBeY+erA67Hyu+Res6w/qsEjJ
         wTV20eTz6ehw+NRtp6coAtKfC1PcAtRVka8N3oHdzpr2l/1UaZkqhPk8oG3R2mTg5vEf
         xc+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sg+KkrzB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19-20020a05620a0e9300b0076c81b9cd8csi1649247qkm.739.2023.10.04.10.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 10:33:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sg+KkrzB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo5k6-0003dj-SN; Wed, 04 Oct 2023 13:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5k4-0003c0-Rv
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:33:00 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5k2-00013u-BG
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:33:00 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3248e90f032so111813f8f.1
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 10:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696440776; x=1697045576; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UnezdLBVjvZnCdXX1V4kutiq/Z6kzmSrGXxXnwF1wNc=;
 b=sg+KkrzBZvXNnOdTztj47iSk9z4Dgm9B+9T1GXmei67Cv3nxjpkmI073fVUQthxCOG
 q0a9UEnV03XAayvjbuGrDOQOZ4cSDwo3HU0zE74/7Ppyv27ortP0eLBj21WbCaPid5Ew
 WclSn8SX0FyZ60NPExSsFenIfykTC7PB08lGGux/rR3X4ZMcmauxV4PBg5i7HmR1U+Ec
 Yksd/qShqkdx2H6S7VFq8sU3jNhLhVcDzWauddlD/Hr/uQJ4W0nCXAtie7qj2J3r+P+5
 K5L9ntTSvusLHZlE4NNMJJgvegp8ggedUnyYsqakeWcVB1UwYBIp5oqe3iuwYpq7DACG
 RK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696440776; x=1697045576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UnezdLBVjvZnCdXX1V4kutiq/Z6kzmSrGXxXnwF1wNc=;
 b=OPW2i7Cg9mWbkkm5uRIPRUaFB1UDvS1VnVajpU1JLmobRIMZQ1RxDquDjXOnnSH3p1
 VX7BQVl5VyvqUdIWyx4SLSPHsAvWnnwFy7EVEnvZi6FYJ18zO11XC9q0EUekEda87Hl7
 WaVthSAlpBltcOgm68cuXlBJRoixdk4UBWeL653jQVuzb9YqgBJ64cwtkAsepGEBXyiY
 53tn3LKPFGUif/vsy2BioHubdtBoeYeKU4slr4oWUXjaCsLfKePv5Zh/4WTsNNSD146i
 AgHhtMXdIvxJJIIOk58jGSDWa+vuWojvdyKeU7aAqdEKazJsnZHGXBmURQmRHIhy2WrK
 WOOQ==
X-Gm-Message-State: AOJu0YyTHh75IgyHX0GMIAFivWRT35zTx11WpYs9MGf+Soey0axF85kq
 x/bCpsoCa7ic428SCVYQ+BveSA==
X-Received: by 2002:adf:f407:0:b0:323:2d1b:eaf6 with SMTP id
 g7-20020adff407000000b003232d1beaf6mr2866207wro.67.1696440775855; 
 Wed, 04 Oct 2023 10:32:55 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 da4-20020a056000196400b003279518f51dsm4540235wrb.2.2023.10.04.10.32.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 10:32:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 08/21] qapi: Inline QERR_INVALID_PARAMETER_TYPE definition
 (constant value)
Date: Wed,  4 Oct 2023 19:31:43 +0200
Message-ID: <20231004173158.42591-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004173158.42591-1-philmd@linaro.org>
References: <20231004173158.42591-1-philmd@linaro.org>
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
X-TUID: 8TTdtjYMVumO

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

