Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2817194ejb;
        Wed, 4 Oct 2023 10:32:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyxTSco2RS7gXsMFEM39U63IbjLOcomitPB964S1/8H4y39AkAaJoROGFcoJe1pOndfnRX
X-Received: by 2002:ac8:7d95:0:b0:418:a80:4529 with SMTP id c21-20020ac87d95000000b004180a804529mr389396qtd.16.1696440774829;
        Wed, 04 Oct 2023 10:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696440774; cv=none;
        d=google.com; s=arc-20160816;
        b=rMDKFKCKaCo//20VG8piS31g1QUsQPW7EEve8j5Gky4ocMhaPZARO09eMSZ6YpCDFF
         4+4du0XOxGNZATvLVzLJWyH2fwTwLJ7Sn1mcMhwYgtmmq5Lz2mg3NDpXCEJGEx9mz4UG
         0Gf0CCFKhPaS4D4m0iKlJyBXDlhk/JTq2jqDdSGnLB9WZ7Uqe/qsnD03jxeVlagF5wxc
         Yw/hcX1Ru2M2ZpAeE+UrAovo3pZr3/PK/JhJYlNNEnMYWp4uGOoVN6/DVWFfLbyr7oF5
         6F0oSOXj0do2QAPD41UO9IVdWzhD6/4dzay6sHSLeRpbgI/Uj9RXggUsk1rsSmu3TAs6
         xaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i0f/S9sk5n4iTXtNvEpxFckitQTJsYOjTpjl0/I1BCA=;
        fh=LJ2Kf/jEc2fkEK0FWLmdYcGWhKtwH3HvKcK8+B2E6ls=;
        b=k67BMIsg1Md5Xv25fNCRjexBd49y3Qd/nliBAWCnHha28SQRQB0WyhEcjrQ7lOWkEW
         h5rpj9k4JARW8GLFCnfM14UY3kgOXjpMFvF1u0JdX8G1Kojpaudy+EIdal/3NlBv1c9T
         LactWYqCXQHQotco8JYFZk1v2nzpqOYqxPrhU5j5Fs4I5AxCFRQMkP8/wM001mM2VlYR
         EdKhE0n/jsCqqldmdjmQ6n/3Wz6wXwPu+LnKmJhAdtZqO9Qa1LMcOZXlocmnFcTv5ZRr
         1d+ieL0Zwo/hRrQ+BGyXB4v/Yjr4GJ/u0Ayy4rIxRaBn3vuCssP4nbXKjfYcTIgAuqoy
         ctgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PmqwI1mT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020ac8584d000000b00417bc62d18esi1681323qth.231.2023.10.04.10.32.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 10:32:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PmqwI1mT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo5js-0003Q7-E3; Wed, 04 Oct 2023 13:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5jr-0003Pj-PC
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:32:47 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qo5jh-0000zu-Eo
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 13:32:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3231df68584so111263f8f.1
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 10:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696440756; x=1697045556; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i0f/S9sk5n4iTXtNvEpxFckitQTJsYOjTpjl0/I1BCA=;
 b=PmqwI1mTj7JMI2SxH81d4YYnLWp5gevd4JSRKqgkEmuJAr3oBEUXQnduWReC14Wvhp
 iWML/SAKHzI4H+YxidQM0MMBjo9ti/nuk2csQSNwvSofFKr16VRTQHC9LdlmobptxNiA
 coFD6jynmjbhOqN5vRm/D/LbHpJ1COYPZUBNncYaP5X62uBJ4DIALCKhfjo3Ys2fl0f0
 iMz2tjGhI+5RvA3bc1aPv4BcUVXQcM5ryu+uobH8EYqrDTgUxhepXskfhffUVHJVKaPW
 +dWzaCqlZx5mua+un7N0UceFS6fcKFS6PwXkGj3reyeX/cKLjymsHH/QEh9s91ZOT0ZK
 u0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696440756; x=1697045556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i0f/S9sk5n4iTXtNvEpxFckitQTJsYOjTpjl0/I1BCA=;
 b=QMkrHopM4YfueB3LqBf8zbuH/NxWB7mzUrk39WJtMGM7WzNac+mfPlzEjUkwEdencN
 WRuKi9/MUb/WXi7GQGLzTJdApWd3X1auw67MaRrln4GHuDWKPaO5sr+OyKoW8UB88Chn
 Ui6KKNWF/iEzb4jDNJfd5HrysJGkhx6r+heYfui6KUXFyienFFbX0MCEAvKxGPZ744Nu
 E4ZXvcFRvNzy3Uaw0OcbWNFoImtkQS6nuQ35sdHFCcVYsLUiA7zmG5xBpV2sKp4Wx2L5
 gQUCFEn5uZkeiVo0w3vG1mn/6DgK2uaF6D94StC+0kP86ka5S0dYOx5ZeuMvO0+HoXRd
 VXJw==
X-Gm-Message-State: AOJu0YxccNt9SdXsqj7UpASZrgZnrkItLC/b6XAtGbbA0yuUPI0khHOY
 C3R7bWVDKl8VmBMszC9kf3DtbA==
X-Received: by 2002:adf:efd1:0:b0:31f:fc96:9af1 with SMTP id
 i17-20020adfefd1000000b0031ffc969af1mr2729111wrp.59.1696440756089; 
 Wed, 04 Oct 2023 10:32:36 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 j6-20020adfff86000000b0031423a8f4f7sm4508086wrr.56.2023.10.04.10.32.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 10:32:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 05/21] qapi: Inline QERR_INVALID_PARAMETER definition
 (constant parameter)
Date: Wed,  4 Oct 2023 19:31:40 +0200
Message-ID: <20231004173158.42591-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004173158.42591-1-philmd@linaro.org>
References: <20231004173158.42591-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: e56mMm0kEOi2

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

