Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2645648ejb;
        Mon, 20 Feb 2023 13:50:38 -0800 (PST)
X-Google-Smtp-Source: AK7set+n9FBm18TNERbnOtwmEdvjMbH8N4VpaBjcpaRdVxEh7oKrGprmCXGxZ4S4b+jk7/PdlnBQ
X-Received: by 2002:a05:6214:2246:b0:56e:9cd6:6a7c with SMTP id c6-20020a056214224600b0056e9cd66a7cmr3802237qvc.17.1676929838121;
        Mon, 20 Feb 2023 13:50:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676929838; cv=none;
        d=google.com; s=arc-20160816;
        b=ooRK1Ne558Mp6l/5GAL4NQRAQaF+B4F0PoNy1gqRppcC0o5sNlKGHvWkDV4N8HJWU1
         R+P6kR4K48iqv5Ce+3p0a0Ztg5fll8yeuaznAHJWlJbqNr2yq4oyqUGe2Oqr2JpPpeOE
         ExGKkaPapU5VFdgTQzzmGsMBXHApwlyT87YPE0ptoPkREASlXR/+yi1EP7dYbhxWJAxs
         XesTk/Z+Kd2BzYfsd/GSJws98D7yA8SOA8t3uIDF/LCg3KSM9xU94taHVjVS6hsjr+Vs
         HQX41v/jOMCelX0eyrwgsKqKYEFxjTuI0oAHlVs+f5N28okUh9r/53m8qYQhdbf7MyI5
         BcdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b8yt1tqQzF0RvXWdasWDYs/fQOMU7NMD/kLfPkGlP1U=;
        b=zICZEmuTLA7RFg1q0/YCFbZltUPmdEt/JiIiT1+YPRov4ve3eos6vmH6o22F7ic9Q+
         c1NRXyUEAWsQzUP0HUU154tz+4FrmTB4y4snaZchhwXJ4b2LYTrApH/uhdWTV5nO4/bd
         o67EnTMFv2t12QnuTwlPA7pSmZBWV0+SdCTApTgSjv9L4r5E5euoeuTQETfh2pMyFcte
         n4FZrx6ZlGMHylAU4V8vCo6Kw0X+Js8B5eCdylVl2HbVng+kXBvbxTquHh3sosxGht/U
         CDpeJc6Ekvdjb7vd8dUaqY+79BbmPK22pfCzDBHivzQAPgEVfswUyfbPapR8DfA4yPc1
         AiZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aN8HWrDX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020a0cb189000000b0053775fa4138si8445472qvd.254.2023.02.20.13.50.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 13:50:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aN8HWrDX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUE2L-0003UJ-K7; Mon, 20 Feb 2023 16:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2K-0003SW-5A
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 16:49:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2G-0007xO-FP
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 16:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676929763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8yt1tqQzF0RvXWdasWDYs/fQOMU7NMD/kLfPkGlP1U=;
 b=aN8HWrDX49JXo/ekez9mVinVzZCXzAZjc721cveiTrumxaCGv6KlRz//i9Zo1p3sxgTXyO
 OMTONb6A4JGHy0FZK746HqQKsMlc06OQ5oIGjGF/TsAVseOwOy66v5+f9MYbceyyODwQMe
 7N0dBc/o+B5Exc5S6EHvEPG8Z1WgGzg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-YJgg-RKvPYuLUBcnxDIxfQ-1; Mon, 20 Feb 2023 16:49:20 -0500
X-MC-Unique: YJgg-RKvPYuLUBcnxDIxfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03D6418F0242;
 Mon, 20 Feb 2023 21:49:20 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 400E2404CD84;
 Mon, 20 Feb 2023 21:49:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 04/15] error: add global &error_warn destination
Date: Tue, 21 Feb 2023 01:48:48 +0400
Message-Id: <20230220214859.3792171-5-marcandre.lureau@redhat.com>
In-Reply-To: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
References: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: RcG+Lg3c2jxh

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This can help debugging issues or develop, when error handling is
introduced.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qapi/error.h |  6 ++++++
 util/error.c         | 10 +++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index d798faeec3..f21a231bb1 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -519,6 +519,12 @@ static inline void error_propagator_cleanup(ErrorPropagator *prop)
 
 G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(ErrorPropagator, error_propagator_cleanup);
 
+/*
+ * Special error destination to warn on error.
+ * See error_setg() and error_propagate() for details.
+ */
+extern Error *error_warn;
+
 /*
  * Special error destination to abort on error.
  * See error_setg() and error_propagate() for details.
diff --git a/util/error.c b/util/error.c
index 1e7af665b8..5537245da6 100644
--- a/util/error.c
+++ b/util/error.c
@@ -27,8 +27,9 @@ struct Error
 
 Error *error_abort;
 Error *error_fatal;
+Error *error_warn;
 
-static void error_handle_fatal(Error **errp, Error *err)
+static void error_handle(Error **errp, Error *err)
 {
     if (errp == &error_abort) {
         fprintf(stderr, "Unexpected error in %s() at %s:%d:\n",
@@ -43,6 +44,9 @@ static void error_handle_fatal(Error **errp, Error *err)
         error_report_err(err);
         exit(1);
     }
+    if (errp == &error_warn) {
+        warn_report_err(err);
+    }
 }
 
 G_GNUC_PRINTF(6, 0)
@@ -71,7 +75,7 @@ static void error_setv(Error **errp,
     err->line = line;
     err->func = func;
 
-    error_handle_fatal(errp, err);
+    error_handle(errp, err);
     *errp = err;
 
     errno = saved_errno;
@@ -284,7 +288,7 @@ void error_propagate(Error **dst_errp, Error *local_err)
     if (!local_err) {
         return;
     }
-    error_handle_fatal(dst_errp, local_err);
+    error_handle(dst_errp, local_err);
     if (dst_errp && !*dst_errp) {
         *dst_errp = local_err;
     } else {
-- 
2.39.1

