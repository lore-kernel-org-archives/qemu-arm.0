Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2821312ejb;
        Wed, 4 Oct 2023 10:39:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxY+RE29brIEb4PAV0ea3VVsNvUNXIHFw7EqjEtKjSwWe3XRCIOCHGKelW9O4HhLc4aMeJ
X-Received: by 2002:a05:622a:1a15:b0:3f9:d1c3:cc45 with SMTP id f21-20020a05622a1a1500b003f9d1c3cc45mr305684qtb.28.1696441142295;
        Wed, 04 Oct 2023 10:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696441142; cv=none;
        d=google.com; s=arc-20160816;
        b=JVE8OtXRQvrOERXHrF0aOO8Q1PxF0M/1vRSqioMGubGWknRXIr2ksuahubuJRTyZ9l
         h/C8StnNdNZmPaYxHz/6i1AIvhYtJYi7hPC12MBrY8Ywrb4JcmmTZBou4Cb6qUfbhaQG
         qhv1yQ/vuwm6Hfq9+qV489HrBLe++nd+uOWzjn9YO86XzvIeKqEihI2rxoiHzf3P8ztk
         e90al8/1sjJ7RY69vp74SfLSRvi8D1rpgm4D3P8IlIBmYFQBiMFHIiUnMKULdrrp1ltZ
         B5KG9Ad9A46FTbfZpz8MhlYL/ejQDCb3h+g6RlP+3x4A+TrNzavuJ0RQtWArnSUebbpI
         fVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mQJAMU/w6o8m8TBpb8PzaVjQ4Gp1ZRSyPEWXTvxRp/M=;
        fh=rcaroz+2x87l2kfWCiGMnxygPHx3nv6NHGx/TGjFg0M=;
        b=tbul8HmrJGh1dJPtNI4Dhcg8hcftQjjNdOWY+W2AMEEObUKOlLuUnHDKFWDrSZ/I5R
         plZBGdxvOemBSGoYjrJ/ZdDVoWLg6TG7gLTGTi6dNbBAYHCG3N92+MxUS0WJhKEcq46E
         AZtdbQpsMFKno1v7OWf+lIuQ2+HKW4cdOB7CH3rxiaoiVhvUdJNav6KvW93u8THSky8g
         Jt7NkW+C8LVT8O0c1XdkqG4z/GUNXq2HNbcQ9jAdntm0oCmUG5cdKwKUuHAGsedWCoOp
         hIaZZnscxFwiBRoesgHjzy8JWAxL7CDIlBBu9HmWGVd4zA+l7YKqlgJU1LGaqrpNKpVk
         AsRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=muLON2sb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y19-20020ac85f53000000b00419859dfdc6si1647030qta.788.2023.10.04.10.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 10:39:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=muLON2sb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo5jz-0003YV-RQ; Wed, 04 Oct 2023 13:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5jw-0003UZ-Up
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:32:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5jo-00010t-G7
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:32:52 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40572aeb673so613925e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 10:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696440762; x=1697045562; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQJAMU/w6o8m8TBpb8PzaVjQ4Gp1ZRSyPEWXTvxRp/M=;
 b=muLON2sbIUWVkzf7VUfniYMuJUy0UMiFICdEz//KXTbV3lOu/r3v+7kE/cjrdS1yRj
 MdIA/VZFjBuBOrKC5X2XRXrcXUvslOoJofGP/T4uYnpgcNlj3No42wr3Tx8YLXdzldQR
 ICtNBaCT6xTd8Ba4fBhEqakVPF3cet63VHloGN5PyJcXybW9x0GsoE+QmCqdUu5J2/1G
 kujKRErykpENDrZB7nrl0DNBU3AecvAPqC+bzg1w9ySofgEwuSx7QWTI0pjjZDd4y7m+
 1M6oJKW+l3QWPrXmwN5tcly374TroU45q6L4rGVNjw5T96EIpJk3+g5KSW6vaAaJrtKr
 DrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696440762; x=1697045562;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQJAMU/w6o8m8TBpb8PzaVjQ4Gp1ZRSyPEWXTvxRp/M=;
 b=aLGYwGX2FKFALY4OseP3PBYSMMuRyZiNRfsBidfaH6u6AsWGXwmuH4zdCrroif/EYv
 Y+h6YGuIvxtsX4zv5Um1rdb0gpf2z1SHxaFobyRU2zkVlBg4rYdEUcf8guaYaM3tWyq7
 qRgejdgtFeAZ+5Zr75XbX/YvdN18j6aRunUqD3E575FEERzFCK88Hxa7XsxuVVxxb2RK
 36wqTq5iXea/YkkiZqDSS8cLCHV3MpeXJjJYkX2CKJ0YTEh3c9D0VvhE5e7koAdB0Yq4
 0ozCwrgvsgyefaypqabCVxaKH8ib3R2Oj2NQqF19xZMi9NuTi1kN5vptVwWHk+aqIUUi
 aDMQ==
X-Gm-Message-State: AOJu0Ywwi131ICDwNesrF7YPqwAP7gFG1s63wMxZEJbwpi4rOgFADNXh
 K73mPPeYXsBQHE3kUXCzsAq73g==
X-Received: by 2002:a05:600c:c9:b0:406:3fda:962c with SMTP id
 u9-20020a05600c00c900b004063fda962cmr2753663wmm.31.1696440762533; 
 Wed, 04 Oct 2023 10:32:42 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 s21-20020a7bc395000000b004064cd71aa8sm2001402wmj.34.2023.10.04.10.32.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 10:32:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH 06/21] qapi: Inline and remove QERR_INVALID_PARAMETER
 definition
Date: Wed,  4 Oct 2023 19:31:41 +0200
Message-ID: <20231004173158.42591-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004173158.42591-1-philmd@linaro.org>
References: <20231004173158.42591-1-philmd@linaro.org>
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
X-TUID: 8C+8u/M5Wd+U

Address the comment added in commit 4629ed1e98
("qerror: Finally unused, clean up"), from 2015:

  /*
   * These macros will go away, please don't use
   * in new code, and do not add new ones!
   */

Mechanical transformation using:

  $ sed -i -e "s/QERR_INVALID_PARAMETER,/\"Invalid parameter '%s'\",/" \
    $(git grep -lw QERR_INVALID_PARAMETER)

then manually removing the definition in include/qapi/qmp/qerror.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qapi/qmp/qerror.h | 3 ---
 monitor/hmp-cmds.c        | 2 +-
 qapi/opts-visitor.c       | 2 +-
 util/qemu-option.c        | 8 ++++----
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index e93211085a..63ab775dc5 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -17,9 +17,6 @@
  * add new ones!
  */
 
-#define QERR_INVALID_PARAMETER \
-    "Invalid parameter '%s'"
-
 #define QERR_INVALID_PARAMETER_TYPE \
     "Invalid parameter type for '%s', expected: %s"
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 6c559b48c8..9d6533643d 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -138,7 +138,7 @@ void hmp_sync_profile(Monitor *mon, const QDict *qdict)
     } else {
         Error *err = NULL;
 
-        error_setg(&err, QERR_INVALID_PARAMETER, op);
+        error_setg(&err, "Invalid parameter '%s'", op);
         hmp_handle_error(mon, err);
     }
 }
diff --git a/qapi/opts-visitor.c b/qapi/opts-visitor.c
index 8f1efab8b9..3d1a28b419 100644
--- a/qapi/opts-visitor.c
+++ b/qapi/opts-visitor.c
@@ -184,7 +184,7 @@ opts_check_struct(Visitor *v, Error **errp)
         const QemuOpt *first;
 
         first = g_queue_peek_head(any);
-        error_setg(errp, QERR_INVALID_PARAMETER, first->name);
+        error_setg(errp, "Invalid parameter '%s'", first->name);
         return false;
     }
     return true;
diff --git a/util/qemu-option.c b/util/qemu-option.c
index fb391a7904..201f7a87f3 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -498,7 +498,7 @@ static bool opt_validate(QemuOpt *opt, Error **errp)
 
     desc = find_desc_by_name(list->desc, opt->name);
     if (!desc && !opts_accepts_any(list)) {
-        error_setg(errp, QERR_INVALID_PARAMETER, opt->name);
+        error_setg(errp, "Invalid parameter '%s'", opt->name);
         return false;
     }
 
@@ -531,7 +531,7 @@ bool qemu_opt_set_bool(QemuOpts *opts, const char *name, bool val,
 
     desc = find_desc_by_name(list->desc, name);
     if (!desc && !opts_accepts_any(list)) {
-        error_setg(errp, QERR_INVALID_PARAMETER, name);
+        error_setg(errp, "Invalid parameter '%s'", name);
         return false;
     }
 
@@ -554,7 +554,7 @@ bool qemu_opt_set_number(QemuOpts *opts, const char *name, int64_t val,
 
     desc = find_desc_by_name(list->desc, name);
     if (!desc && !opts_accepts_any(list)) {
-        error_setg(errp, QERR_INVALID_PARAMETER, name);
+        error_setg(errp, "Invalid parameter '%s'", name);
         return false;
     }
 
@@ -1103,7 +1103,7 @@ bool qemu_opts_validate(QemuOpts *opts, const QemuOptDesc *desc, Error **errp)
     QTAILQ_FOREACH(opt, &opts->head, next) {
         opt->desc = find_desc_by_name(desc, opt->name);
         if (!opt->desc) {
-            error_setg(errp, QERR_INVALID_PARAMETER, opt->name);
+            error_setg(errp, "Invalid parameter '%s'", opt->name);
             return false;
         }
 
-- 
2.41.0

