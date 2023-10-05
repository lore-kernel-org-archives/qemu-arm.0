Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp69813ejc;
        Wed, 4 Oct 2023 21:52:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkeVq39dI80sHBp83Uy31zyO5Q4Hp7/l5oS+6nhh+fClpD6vjCw3vkFCYveZRUerX03d7G
X-Received: by 2002:ad4:5949:0:b0:64f:51fe:859c with SMTP id eo9-20020ad45949000000b0064f51fe859cmr5124367qvb.43.1696481521312;
        Wed, 04 Oct 2023 21:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696481521; cv=none;
        d=google.com; s=arc-20160816;
        b=y+7btWG5VjfUpBD+pPHro427AY9wX9q/Y7TixqJXuReDXJKPBWGPqUYYDiBba9DeWO
         dOXK/5474nHakiDA7JSRUzffjS6PoBqoX2fFzZ8oAk0nBU4coAdO9J9gnaR+rVCjxs3f
         oQZOaHBa7yOLMXmBSGi24c4jiUQrGDC+Uj7h6SRA28PTyHqecDv8F+hipOn0v5wRwQR1
         Ct0u6P3aVzThqBKgp1S6Ip+Y1gndlh+92+vOFBmfrCrmOut+kaS+MQBUd2r8LHjke03w
         QcqSTkf3u+/jf2yUBfLk026a+V6FJwIKjeEUWxM/+NN65uWkRZcDVoPfZLS+X0/eOcG8
         pfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i0f/S9sk5n4iTXtNvEpxFckitQTJsYOjTpjl0/I1BCA=;
        fh=Z7Pv+eyhTL5wOgIfxY9/3/BHWOZWo37vnRD3FWoic8E=;
        b=qITNOQqiqBukHlwA+1oWa/PPAx5/xLbGMk0yb8q8jO5Z7q3B9uEENFby/LW8oMBdGn
         DGCCpHuCqahOiEEpjtryzgp3Yo/01hKlX6S2RKX+uTh35XnXaqzOj+JqTtbaM7jj08mM
         XufcEyqqNV/X7o3phRifLgHgyzs+XLyllkHh2FBxwPs7qH+hA8FQuzhEkRzb0yLsFF3M
         YUELeAIiv4BvS6fgPdiX6QNPCh80k86r1c5L+4kdjZL9n0/InFtmBspe3IkqIhU9vcWw
         0KbGGvENHF59NJeEmi/qDfaBTPZvK26oylVp/3crougz8gRakkQIbQgNoueRyL8XC2eo
         PBSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="reKEUX/E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sk6-20020a05620a3a4600b0075cb23ee1fesi392830qkn.602.2023.10.04.21.52.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 21:52:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="reKEUX/E";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoGKZ-0005YZ-RQ; Thu, 05 Oct 2023 00:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKX-0005Wu-M3
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:21 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGKU-0005X2-KE
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:51:21 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-405524e6769so3034835e9.1
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 21:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696481477; x=1697086277; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i0f/S9sk5n4iTXtNvEpxFckitQTJsYOjTpjl0/I1BCA=;
 b=reKEUX/E5S9dXFUpMCzT1K/QIvP9KkZ5kyXP6w9VMwXm/jsRSZYWyRBnglh4q8LF9P
 Kh30Y197bawa6rHG7npdnA0zJz6Jfc2tRy4mwKjESgIim0vGG6J/yJLAd2vEHI4VReIl
 pT4No/0bqeXV+ltRjd4hEki/o+8Nlre+Z9+JGpdWkcddiVhzEqBi35+eut55BK/83mvR
 h9syXsb2htdzDSIhTAY855lt5CZ3G/IaxVoDAc+GjDvyd6fn4l14/ra8OHnJeVlZVc9z
 5GBUVFlHgLrMtkgTuORCUQ37DnEbQA2eOmCP/c2vJUgGsoOJkNkqd/rerEB8SaMneFz0
 2jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696481477; x=1697086277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i0f/S9sk5n4iTXtNvEpxFckitQTJsYOjTpjl0/I1BCA=;
 b=YPPg2vmnFQaQql7evIAMKVJEPL+3oQup0g9D4s1Grz3n7q+q4NcmI0MP0iTIcTaiLy
 Q7t7aQmuFosqeyw5glH5jJGc6q9Ij7/HKTEuUb8HFkNEEW9/uTCRLxSqhXJjJ7vedRSO
 r2aiAdvG96nWt0Cj1H9A2zqjsnInE+0YeyaqBlyrr8NCt1+jdjAuLmhDuA405u71CPo4
 vTP4OKuyhRkwT9CSyk3rQ+h43QTIHb0cImKE/tJxlq7x/VFGcpeRTsCwqSBryz227ZqV
 7q8qYv+XZrFWH9OELwdJPGfGJAUO7Ai0GZ6Az81lNMq5mLbZ0AJzKzJfmZnku73mnedf
 v6Sg==
X-Gm-Message-State: AOJu0YyUFSnFcHx7l/RzZj17W4i2Bin7zaCgDytI/FDMS/qY6/7TOLBH
 Z9lUP7Iu/dRoGdI9TzRxYTTnIw==
X-Received: by 2002:a1c:7505:0:b0:405:3f06:d2ef with SMTP id
 o5-20020a1c7505000000b004053f06d2efmr174242wmc.4.1696481477187; 
 Wed, 04 Oct 2023 21:51:17 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-211-120.dsl.sta.abo.bbox.fr.
 [176.171.211.120]) by smtp.gmail.com with ESMTPSA id
 y4-20020a05600c364400b0040472ad9a3dsm623215wmq.14.2023.10.04.21.51.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 21:51:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 05/22] qapi: Inline QERR_INVALID_PARAMETER definition
 (constant parameter)
Date: Thu,  5 Oct 2023 06:50:22 +0200
Message-ID: <20231005045041.52649-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005045041.52649-1-philmd@linaro.org>
References: <20231005045041.52649-1-philmd@linaro.org>
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
X-TUID: VHWEUaO9z+Ky

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
    constant param;
    @@
         error_setg(errp, QERR_INVALID_PARAMETER, param);

    @script:python strformat depends on match@
    param << match.param;
    fixedfmt; // new var
    @@
    fixedfmt = f'"Invalid parameter \'{param[1:-1]}\'"' # Format skipping '"'.
    coccinelle.fixedfmt = cocci.make_ident(fixedfmt)

    @replace@
    expression match.errp;
    constant match.param;
    identifier strformat.fixedfmt;
    @@
    -    error_setg(errp, QERR_INVALID_PARAMETER, param);
    +    error_setg(errp, fixedfmt);

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump.c        | 6 +++---
 qga/commands.c     | 2 +-
 ui/ui-qmp-cmds.c   | 2 +-
 util/qemu-option.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index d4ef713cd0..e173f1f14c 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1810,7 +1810,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
 
     s->fd = fd;
     if (has_filter && !length) {
-        error_setg(errp, QERR_INVALID_PARAMETER, "length");
+        error_setg(errp, "Invalid parameter 'length'");
         goto cleanup;
     }
     s->filter_area_begin = begin;
@@ -1841,7 +1841,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
 
     /* Is the filter filtering everything? */
     if (validate_start_block(s) == -1) {
-        error_setg(errp, QERR_INVALID_PARAMETER, "begin");
+        error_setg(errp, "Invalid parameter 'begin'");
         goto cleanup;
     }
 
@@ -2145,7 +2145,7 @@ void qmp_dump_guest_memory(bool paging, const char *file,
     }
 
     if (fd == -1) {
-        error_setg(errp, QERR_INVALID_PARAMETER, "protocol");
+        error_setg(errp, "Invalid parameter 'protocol'");
         return;
     }
 
diff --git a/qga/commands.c b/qga/commands.c
index 09c683e263..871210ab0b 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -154,7 +154,7 @@ GuestExecStatus *qmp_guest_exec_status(int64_t pid, Error **errp)
 
     gei = guest_exec_info_find(pid);
     if (gei == NULL) {
-        error_setg(errp, QERR_INVALID_PARAMETER, "pid");
+        error_setg(errp, "Invalid parameter 'pid'");
         return NULL;
     }
 
diff --git a/ui/ui-qmp-cmds.c b/ui/ui-qmp-cmds.c
index debc07d678..41ca0100e7 100644
--- a/ui/ui-qmp-cmds.c
+++ b/ui/ui-qmp-cmds.c
@@ -44,7 +44,7 @@ void qmp_set_password(SetPasswordOptions *opts, Error **errp)
         assert(opts->protocol == DISPLAY_PROTOCOL_VNC);
         if (opts->connected != SET_PASSWORD_ACTION_KEEP) {
             /* vnc supports "connected=keep" only */
-            error_setg(errp, QERR_INVALID_PARAMETER, "connected");
+            error_setg(errp, "Invalid parameter 'connected'");
             return;
         }
         /*
diff --git a/util/qemu-option.c b/util/qemu-option.c
index eedd08929b..fb391a7904 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -612,7 +612,7 @@ QemuOpts *qemu_opts_create(QemuOptsList *list, const char *id,
 
     if (list->merge_lists) {
         if (id) {
-            error_setg(errp, QERR_INVALID_PARAMETER, "id");
+            error_setg(errp, "Invalid parameter 'id'");
             return NULL;
         }
         opts = qemu_opts_find(list, NULL);
-- 
2.41.0

