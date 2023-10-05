Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp71679ejc;
        Wed, 4 Oct 2023 21:57:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDZWNgf00hrkVS9e0epzr+cAwIVOzmh+9eJGHvDSgVsBFkHSjxcZmxwXbIJtsdwzIUofMO
X-Received: by 2002:a05:622a:44b:b0:418:17f3:ccc0 with SMTP id o11-20020a05622a044b00b0041817f3ccc0mr4896861qtx.56.1696481879749;
        Wed, 04 Oct 2023 21:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696481879; cv=none;
        d=google.com; s=arc-20160816;
        b=RjGHN5gg6o2mHu/dLOogBdndpR9BLkLQBYe+Wj5gzKZkMwuLyhmp7qMAo/WZ1d60sx
         c3H0S54b/7EwdZ2ULapuO4OEseqhJvDEl0+ti/P5DKI9YvvERmkYXRNpllrqiCnXnipI
         00HlZi6McdZ4Wws/sjK2P8DFvZ0vjrKvHZNY74CidfyWwREgkRWUuHPaLrAMQyzGHvdC
         lgNZZyeZpWYTfxKWpca9VuUNZgDPVEjvCIIra+uwykQdJirk/e0Eqx58eBTnwV8HMzV/
         P6hzh2NgxePadQ3y0nINbw/wD7sr0Sozbejb1/Ezv8SYiwF0O7sZwpLOQCW1bi5lmelJ
         aQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mQJAMU/w6o8m8TBpb8PzaVjQ4Gp1ZRSyPEWXTvxRp/M=;
        fh=ijKMo1pDu6TtK35CgkV+A4bzObOA/9yc38s67OINvPA=;
        b=JNh64EUNND6YJAbJH38KmwE81QvqxPTt5i+Y0uACpjHG090OkrINjw7QRaBhzlWjm4
         +HNmWlUs5ifOANh4E5VqNJMPlDI/Bmd8n165WN20yRTrELTXLMJ8nEupswybZfvG9NJX
         AuhJDEltwZQnKS/vilslukJ8Ik36wN6Hnk7aeoyFWMDXi7f7mZ59HLwxsuM/AoFKdUmy
         IaPhq4P4wlWxLFrUMgn5AskULJJIO8ieL0UNvfNBUYHKUokgiY/twMJtWGdpHtN4Fykg
         s4f/nAI6qekJ15pSd10saGNssJGclH9RjK5+EJST/1DcMdPq3lfNRZQ6HgSLV9Vc7nRF
         igHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gCE//ubl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t16-20020ac85890000000b00419674b991asi431245qta.505.2023.10.04.21.57.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 21:57:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gCE//ubl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoGKd-0005Z7-IM; Thu, 05 Oct 2023 00:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKc-0005Yj-C1
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:26 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKa-0005Zp-O0
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40684f53bfcso4958485e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 21:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696481483; x=1697086283; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQJAMU/w6o8m8TBpb8PzaVjQ4Gp1ZRSyPEWXTvxRp/M=;
 b=gCE//ublxXWKxHmL7oM6TpQw4h7XLRzAqKeCyu+Y2CJZwe7kfCIKnZ51S10lhg9s3+
 /cnC6SNbEnU5hhcsy0d1bmEWZssgJZvMm/OInpuIPOa+xhJjjt2yhRmHeY/3YUXxfbTf
 yR1TQ6DRlE1ebFirlPj39jSvmE4FtPtDn4Ewh/8wmPcIIBrpgRmGPCttkZfViBDL5sYr
 J0HeljewFvHygE68Tm1MmmsGkFLTcoeXOadXOKDuFTyZrr5Jj0f/d9Wz5ZwBmdVibV5i
 wbjS08sWijIG61FhP035mAk0ewGWpkcN1cJxsdqVX3GodHxX9tcNs0de/HJqxZtQiqMI
 gIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696481483; x=1697086283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mQJAMU/w6o8m8TBpb8PzaVjQ4Gp1ZRSyPEWXTvxRp/M=;
 b=o6nQzRHLY7Jf86tGhV8qcEhrzrF/dsYgvhp0Wzr3ds31PM6Jhejmbsf0/arXIEBsoT
 /R8F7rdmzjo7qhx8E6zt6JF3VGEjM23HT6MTCcFAX2tm1HKFdedErpt2oTxuxe4JDebW
 pLOThGfQHbnDOqTfIsqB2AMAZTaeLxMSM2ETRmtMJt4a94V+V1oHgjSEeAxqTVQdJ0Th
 tpVjwsYTNS/48pYNgsFCJC8dA165+N37AWG99YYM8QROEaiTRKnMv3AYp4x7vzyUrw7A
 GQbXs6TGYwcmZOx4rhjS70aWcPeYvNNJgiFV9DZhYzPvW6Twa/tfGBentbPATyWLkEqe
 meCg==
X-Gm-Message-State: AOJu0Yyf9RElEOlg4feXAl/u8KLaz8chVW+wvWn+gZtN1oVKD8fI/YTx
 6FkEEolE1GiGLRkjbece18unyQ==
X-Received: by 2002:adf:de11:0:b0:31f:f753:9938 with SMTP id
 b17-20020adfde11000000b0031ff7539938mr3660400wrm.58.1696481483506; 
 Wed, 04 Oct 2023 21:51:23 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-211-120.dsl.sta.abo.bbox.fr.
 [176.171.211.120]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d4d0b000000b0031ff89af0e4sm739425wrt.99.2023.10.04.21.51.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 21:51:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 06/22] qapi: Inline and remove QERR_INVALID_PARAMETER
 definition
Date: Thu,  5 Oct 2023 06:50:23 +0200
Message-ID: <20231005045041.52649-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005045041.52649-1-philmd@linaro.org>
References: <20231005045041.52649-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: E60kME1jJcHD

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

