Received: by 2002:a17:906:3750:b0:a44:3ba0:e9d1 with SMTP id e16csp333241ejc;
        Tue, 5 Mar 2024 07:00:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVoJSwVZMEJlroI15PhLi7fhwsu2Nt5vVuFgupT4muCSefD3Zw3O8C+UcDXIoxP9lB7qPDvDhk0B8mQfWYxuyO8saIpp0mH
X-Google-Smtp-Source: AGHT+IGbnKv13aamDqzsTcKLT+X7+JwyejbGwPYRNxb9M0kpJrrLNlqWF+Nqt7pUa1ePEGY4Wq3v
X-Received: by 2002:a05:6102:2371:b0:470:4716:70ca with SMTP id o17-20020a056102237100b00470471670camr1957133vsa.6.1709650818370;
        Tue, 05 Mar 2024 07:00:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709650818; cv=none;
        d=google.com; s=arc-20160816;
        b=v0Vwe9ogZYiDSTwWsKFE2RRKtTl6EMHNS5ZkaMb+Qh0Wwcwt0Z6rIrWCQP1FGZWjM1
         XLfhXGICXm4kbW9JhYljXBFlpE7sQNT1T3SWgzVpFE0Z4+ic6jfDjOWG/LF6LiMInLTY
         udtYQV6AqpvFBX8WCeheaRIV2olxwh4WyRMvML2fpb+3YyRuRmII8tMpdg5nuYy0ECJf
         g6UDrAqlAGyLN926W0vsn2DKA/8vnbg8HXg7vT1OtqsnxLk5qFhgA6Uw8W5IlpQW1dpr
         ZXbWoVtKX8FVJhgALl/oZrxfMUnH4dWocXCn55swI8hLlEepHUJ9P1UCcGHsp53ON1dP
         Ag4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JN/aaiSWygVR5weABBpFTY22hwpBCOu4fYNLdy0WinE=;
        fh=OwtIYMY0+00dD+0OYwGlMmiEzgLSCX0RGHgJTct538Y=;
        b=d0gYO4YcpkZGh59zgcIeCtvLgxrTwuQvj315wHEDpsfLa0fP8fSP4go5P5QI33zBRm
         PEOj/cNONxFOhazyY8AHDPxT+r0DyagpeQiu81823SqEnlOqsHCAQQXQmLHsYhPk4rKi
         90eGNSy6tOnwzmT6G4ajbLGTI3l/S8eqzptvhDehN6TglHULCxk+xMseHJ43rcSkpL9x
         k98lfafBXTzFNEylwDzg+h62tVkkSGymNaStXbsbD4GSIAFIoSxaWuFR3kw6Kca6yn9G
         7CUguxrGLofFso0Wdx9yFdsc4Ef7ggcCmaceTW+41k5YMqYnUomIwU3ZGgYVOdjrWaXC
         SVTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EJh/BnA8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17-20020a0561023f9100b004706e76ef1dsi1936187vsv.641.2024.03.05.07.00.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 07:00:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EJh/BnA8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rhWGb-0003L7-Vy; Tue, 05 Mar 2024 09:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rhWGU-0003Ae-IW
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 09:59:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1rhWGM-0004Kl-Py
 for qemu-devel@nongnu.org; Tue, 05 Mar 2024 09:59:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709650765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JN/aaiSWygVR5weABBpFTY22hwpBCOu4fYNLdy0WinE=;
 b=EJh/BnA8r8JWcOm7j2HWbxvFO8ZCAaYto2Qe0zgkalxV2Yq9H+v9E6mdh/YSBTEUnp9Kow
 ZU4glXrRp2Xz+Cxjtd+NPYVcdgcmOQEVlqF0kaL3zeZpT4feAz7yBhk4GaV4gfOmM7XNdL
 kPD2jUfvuTRikcFXebLjH5nkmZDLKcQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-UdLYpeQLOXah_aW4kI5jFg-1; Tue, 05 Mar 2024 09:59:21 -0500
X-MC-Unique: UdLYpeQLOXah_aW4kI5jFg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B71F18172C2;
 Tue,  5 Mar 2024 14:59:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07DAD2022C24;
 Tue,  5 Mar 2024 14:59:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C68A21E691E; Tue,  5 Mar 2024 15:59:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, gaosong@loongson.cn,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 david@redhat.com, iii@linux.ibm.com, thuth@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH 2/4] target/i386: Fix query-cpu-model-expansion to reject props
Date: Tue,  5 Mar 2024 15:59:16 +0100
Message-ID: <20240305145919.2186971-3-armbru@redhat.com>
In-Reply-To: <20240305145919.2186971-1-armbru@redhat.com>
References: <20240305145919.2186971-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: XpSDozxRL3GM

CpuModelInfo member @props is semantically a mapping from name to
value, and syntactically a JSON object on the wire.  This translates
to QDict in C.  Since the QAPI schema language lacks the means to
express 'object', we use 'any' instead.  This is QObject in C.
Commands taking a CpuModelInfo argument need to check the QObject is a
QDict.

The i386 version of qmp_query_cpu_model_expansion() fails to check.
Instead, @props is silently ignored when it's not an object.  For
instance,

    {"execute": "query-cpu-model-expansion", "arguments": {"type": "full", "model": {"name": "qemu64", "props": null}}}

succeeds.

Fix by refactoring the code to match the other targets.  Now the
command fails as it should:

    {"error": {"class": "GenericError", "desc": "Invalid parameter type for 'props', expected: object"}}

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 target/i386/cpu-sysemu.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 7422096737..df91f97827 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -25,6 +25,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-visit-run-state.h"
 #include "qapi/qmp/qdict.h"
+#include "qapi/qobject-input-visitor.h"
 #include "qom/qom-qobject.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "hw/qdev-properties.h"
@@ -129,20 +130,35 @@ static void x86_cpu_to_dict_full(X86CPU *cpu, QDict *props)
     }
 }
 
-static void object_apply_props(Object *obj, QDict *props, Error **errp)
+static void object_apply_props(Object *obj, QObject *props, Error **errp)
 {
+    Visitor *visitor;
+    QDict *qdict;
     const QDictEntry *prop;
 
-    for (prop = qdict_first(props); prop; prop = qdict_next(props, prop)) {
-        if (!object_property_set_qobject(obj, qdict_entry_key(prop),
-                                         qdict_entry_value(prop), errp)) {
-            break;
+    visitor = qobject_input_visitor_new(props);
+    if (!visit_start_struct(visitor, "props", NULL, 0, errp)) {
+        visit_free(visitor);
+        return;
+    }
+
+    qdict = qobject_to(QDict, props);
+    for (prop = qdict_first(qdict); prop; prop = qdict_next(qdict, prop)) {
+        if (!object_property_set(obj, qdict_entry_key(prop),
+                                 visitor, errp)) {
+            goto out;
         }
     }
+
+    visit_check_struct(visitor, errp);
+out:
+    visit_end_struct(visitor, NULL);
+    visit_free(visitor);
 }
 
 /* Create X86CPU object according to model+props specification */
-static X86CPU *x86_cpu_from_model(const char *model, QDict *props, Error **errp)
+static X86CPU *x86_cpu_from_model(const char *model, QObject *props,
+                                  Error **errp)
 {
     X86CPU *xc = NULL;
     X86CPUClass *xcc;
@@ -187,8 +203,7 @@ qmp_query_cpu_model_expansion(CpuModelExpansionType type,
     QDict *props = NULL;
     const char *base_name;
 
-    xc = x86_cpu_from_model(model->name, qobject_to(QDict, model->props),
-                            &err);
+    xc = x86_cpu_from_model(model->name, model->props, &err);
     if (err) {
         goto out;
     }
-- 
2.44.0

