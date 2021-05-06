Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1272147lfg;
        Thu, 6 May 2021 06:38:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylz0lxw8c2GSVzFSclQkGeycL5L68ZUw/EFiOzB3O6kQDljVDYM3B32axb+KPnblYTZseV
X-Received: by 2002:a63:e509:: with SMTP id r9mr4395143pgh.384.1620308314512;
        Thu, 06 May 2021 06:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620308314; cv=none;
        d=google.com; s=arc-20160816;
        b=sbdZb3ootvEgWqbcHkj+JpVbJoKsCpJqWWvuDBQ5dZU/8GLGX6UIMGooWY+fySNqU2
         bDIKpGURBK3d05Iv9MXNgMRd7wStNk4jMRBx6dRIQ7I2yXPSFU82xHyjscif0L9QCkQg
         +y/t3iyVuO58ghCbPmmnmLFta+yYL/x8WW6J0faWmBV5Nz9jYq78fz1ufqaF0aaHrPe7
         NUHEPVxq9/KT7oQPVx/xDQfilxMhW+5W0Me7m6lQkf/Xu7ukDyeQMuZVUjn2iaiEODz8
         3b6AsyBNvrL4wDb2kxrvuylink7xCgmaXlKnJpleGfUDJQRDRF3b6mMLyQKDJ0G6tB4b
         MaKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=dmSw65R373KTKOSFnzTrI/V4leURDKdprV/OcTyehJU=;
        b=ecl0Ax/HP3vM8WyqjmssAsdeto8Mn7IK06Q60mLFl4sw7nF41gWVy1GJbnq7RwGFud
         ORJtzAb+alh4cVZoQdvtbZvEyDxuwhG9i7W70fRAb2PYEdMkqLUbVNIFWxVAjju2wmbQ
         LsIb5yAQnne547zOm3ESz+Qxyptj0pYAi1Vqj3rkGi2ChcNxn8XIAQzOvEmMFbEQo+Pw
         qms8TJBy1TLQ4JZGZ3XhtvGQVBoIcQGbxBkaDKwNhAK1jy7mPNCy0TSeHk4uRJ58Vepa
         KfTMzwY+wJaK/QMXXmbMvbN4NJ3+DYCYayM8KGGJgMEK9OxZIVTXNHPmtY7CM8Jnvq6J
         O+ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DUYvbRdO;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id ck7si5339438pjb.160.2021.05.06.06.38.34;
        Thu, 06 May 2021 06:38:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DUYvbRdO;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234282AbhEFNjb (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 6 May 2021 09:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36519 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233954AbhEFNja (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 6 May 2021 09:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620308311;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dmSw65R373KTKOSFnzTrI/V4leURDKdprV/OcTyehJU=;
        b=DUYvbRdOTNnvbwjouOuuEQ6NUL0/7wOJIn5PcZ6J4moOrAmK3itbU1lhvV++kbf0HmQCM8
        9hVaoBqMpbqMP6eZyYyjL8JOvj6a0A57c0dOPvo6mzg+QdCrpMMICf8/oTUn79aY9RWnSO
        o3mN/1Cb8nUXw/Oz+0HvXyk+dalshUA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-4WEe88tvOiaHNf_OGb5Khg-1; Thu, 06 May 2021 09:38:30 -0400
X-MC-Unique: 4WEe88tvOiaHNf_OGb5Khg-1
Received: by mail-wr1-f72.google.com with SMTP id 4-20020adf80040000b029010cab735fdeso2206938wrk.14
        for <kvm@vger.kernel.org>; Thu, 06 May 2021 06:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dmSw65R373KTKOSFnzTrI/V4leURDKdprV/OcTyehJU=;
        b=TIAx9I/lclYacgqowSOE2GSsZXOrEiFU4dfRPE3gTFNb9dIa/G5Zi+9lNVZixkV5/Y
         xV16ZDEn5ZCh6QXyPNKQvTcjwKXe61QEJB8tSfQAA/i234ieClXbLJFMBtLUNazylMIt
         jPUOgyu+PSFr6rLKFhae8FtZzCx+wuevRw36gb9qJEzq6EPN5pJ4Mdn9LxnbZFMtcWgs
         H7m000kMsQBQMypJU8lepn9C/+FIVcVd9tA0AIKSWZazIq1hU5nu2/+iuM7PGlHdpDDe
         F3W62gZ1WKUtq6ouPnN7QnxN8NEVfn8Ym0KCzAf4K1Ldi9TKBtt0q6fEnq515I+F06ho
         3fQQ==
X-Gm-Message-State: AOAM530LFDNx7OkOXl+1bsdO1T9gXo5KSmKODV6XPbzfuozATXX18BVf
        55Phxwv/UOz60Qg87Xm2LIeiz6E4x00odPRG41m5x+ZSxIv9BWV0DbSvSVlkylkmZV9zoiUfPP1
        UYkHSczUpBqZv
X-Received: by 2002:a05:600c:4f0f:: with SMTP id l15mr15225987wmq.143.1620308309316;
        Thu, 06 May 2021 06:38:29 -0700 (PDT)
X-Received: by 2002:a05:600c:4f0f:: with SMTP id l15mr15225973wmq.143.1620308309193;
        Thu, 06 May 2021 06:38:29 -0700 (PDT)
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id d3sm4089244wri.75.2021.05.06.06.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:38:28 -0700 (PDT)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     kvm@vger.kernel.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
        Gerd Hoffmann <kraxel@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 6/9] gdbstub: Only call cmd_parse_params() with non-NULL command schema
Date:   Thu,  6 May 2021 15:37:55 +0200
Message-Id: <20210506133758.1749233-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: zCpppnipheOG

Move the NULL check on command schema buffer from the callee
cmd_parse_params() to the single caller, process_string_cmd().

This simplifies the process_string_cmd() logic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 gdbstub.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 83d47c67325..7cee2fb0f1f 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1368,12 +1368,9 @@ static int cmd_parse_params(const char *data, const char *schema,
     int curr_param;
     const char *curr_schema, *curr_data;
 
+    assert(schema);
     *num_params = 0;
 
-    if (!schema) {
-        return 0;
-    }
-
     curr_schema = schema;
     curr_param = 0;
     curr_data = data;
@@ -1471,7 +1468,7 @@ static inline int startswith(const char *string, const char *pattern)
 static int process_string_cmd(void *user_ctx, const char *data,
                               const GdbCmdParseEntry *cmds, int num_cmds)
 {
-    int i, schema_len, max_num_params = 0;
+    int i;
     GdbCmdContext gdb_ctx;
 
     if (!cmds) {
@@ -1488,21 +1485,21 @@ static int process_string_cmd(void *user_ctx, const char *data,
         }
 
         if (cmd->schema) {
-            schema_len = strlen(cmd->schema);
+            int schema_len = strlen(cmd->schema);
+            int max_num_params = schema_len / 2;
+
             if (schema_len % 2) {
                 return -2;
             }
 
-            max_num_params = schema_len / 2;
-        }
+            gdb_ctx.params = (GdbCmdVariant *)alloca(sizeof(*gdb_ctx.params)
+                                                     * max_num_params);
+            memset(gdb_ctx.params, 0, sizeof(*gdb_ctx.params) * max_num_params);
 
-        gdb_ctx.params =
-            (GdbCmdVariant *)alloca(sizeof(*gdb_ctx.params) * max_num_params);
-        memset(gdb_ctx.params, 0, sizeof(*gdb_ctx.params) * max_num_params);
-
-        if (cmd_parse_params(&data[strlen(cmd->cmd)], cmd->schema,
-                             gdb_ctx.params, &gdb_ctx.num_params)) {
-            return -1;
+            if (cmd_parse_params(&data[strlen(cmd->cmd)], cmd->schema,
+                                 gdb_ctx.params, &gdb_ctx.num_params)) {
+                return -1;
+            }
         }
 
         cmd->handler(&gdb_ctx, user_ctx);
-- 
2.26.3
