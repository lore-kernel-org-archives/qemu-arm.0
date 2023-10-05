Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp70775ejc;
        Wed, 4 Oct 2023 21:54:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTqsfem+Wp84IUI1Vm14UVK0UQYibKj6EtuvTpG7wZ8me0pweP7PIP2ntQUraf09CaQwhK
X-Received: by 2002:ac8:5a0a:0:b0:418:76c7:52ab with SMTP id n10-20020ac85a0a000000b0041876c752abmr4033728qta.52.1696481699299;
        Wed, 04 Oct 2023 21:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696481699; cv=none;
        d=google.com; s=arc-20160816;
        b=C/9uIZEIr0sTc+69jTc/zCkBuWNJ3p416AiDQBKRr4VIWfCsW+KyfxPVtUxo+HkQfq
         HOYP/L1o8Mw26elteE9TVipNORwnkRwNJe7CcqFBEFngjLxAKjbkNvsSQBp8src82jAi
         YyYM4Jm1SkyhKkhOzo6j5k8V/AV36UTKI7aR1Mi2QpH6MYiW4/ZBtC9vl4CvxMH/T3aR
         tnubxyUWzeRgXDJOpuPvCdNW0ehxTwfY3EZDRmGMEhmuNOkplPolDah6/d95ZFce3aqM
         Yxw2Hd1z60OIArI062RLjZVtFpMSfM84twuwLdKCzJlhFDCak4/4ihHcSAwPXee9C8L1
         CpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Qa4hZwslsMUZLJlwqNVA+27NbdRXcJ1/n/O43TVo9q8=;
        fh=288tj/YA8CeqdsE1IAqipHYy1NJ0ligrxjm8FB2ZG8k=;
        b=lPfndfKbCeGJroLzo1giv8TwN5V47/wydUvwN+Bik4nI+NlAo5RGmOYTs5dSPc7hFT
         xRqTcoGu35/PXHNK8I0lO/up7ZTCR5mWSSSbEyp4xYn6EbXiRJDv729MjKIUWLbr0XR2
         YhvK5UUGbyeQVJ+Ev2FIZoTifkTXIL4aYR0XD+F/+k7QWgooHkN7ptXEXCB7ZiSgXHjE
         /YHqbFU6+vF8nzLAEs9bTMTmugAPgLuFrOJdLkiiM3iT884IssYi9+VtJItldhdHIzdx
         //fbFkBXKHJDZAhjiY1243dSXVNYC/Qld3WkxC43FUgqJHxV6+5t++Btf+rz8GSqJToL
         cgFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOvKOxMl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020ac84e8e000000b00417fa4d4ffcsi436646qtp.104.2023.10.04.21.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 21:54:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOvKOxMl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoGLY-0007DB-4W; Thu, 05 Oct 2023 00:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGLV-00075k-Ar
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:52:21 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qoGLT-0006kA-4q
 for qemu-arm@nongnu.org; Thu, 05 Oct 2023 00:52:21 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-406402933edso4741355e9.2
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 21:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696481537; x=1697086337; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qa4hZwslsMUZLJlwqNVA+27NbdRXcJ1/n/O43TVo9q8=;
 b=dOvKOxMlnpTgaZRj52rzNJP06WYBwpsIZsOELlwMiX6LrdVvjcMlgs3E6NlOJZ87/a
 k96SRBVq1ZFPOZP1YjOJD0Vxj6X0rEBWOi+8tVyd4noHeO6NR4ZQX/4CuL2EvWpYXM34
 MFGvK7HBD1tiSrcvr/hhoz2rzjACBcR78I/ZSBfCJ/yuypVuGB2LMxcizdc+qsed0iRv
 lQj8tYs26Irlk2xohZkXSc874XSiy+CBwUYS/9E7CUxluM0isfs8vVgiJuhOnLsaAVw5
 ZNhYMHKB+LHrKtbvHFFdx624+3TIzT7kHx7eKwX+Wr94boYmFfFibNq/p0m/QnCR84Gb
 +AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696481537; x=1697086337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qa4hZwslsMUZLJlwqNVA+27NbdRXcJ1/n/O43TVo9q8=;
 b=kXlR1BhxJVH5oDHcey9m5F3iho00eMFR5U54y7lPJEJmDEgtGbXnMBuGtBOsJIa+17
 YeDpCQ3sCNwBORmjUa2DGrQCgZzGrpPeNe33OohCvfGEsv/Mw8Mt/SFupPtQRbLgtL6L
 XmT4dfrAFPik4v+CcOy+asGFvlKXTAyl+aePaOXOyiTezC5pat9z6qYbxn0OmelIkO0Z
 LlEaamodrqVY52Hl1S9qctFyAIcwgqD+TT/Xv1b5K5JjyJpio2eSI83FMCUr1+NO0StV
 otkQb0wb1OjOr+GitryyxhoH+uBrRx15YKGpHxlnXPtLZUIZhCf+3MUwiwx6xfiNgRAl
 M97g==
X-Gm-Message-State: AOJu0Yz55Lvt7dxhHwtqn6j4KJ+7TACqvsbZjNXhDmEqclYfVUAYcb8Y
 wUbn1BHe6EVTVaRpp2DNFTXanQ==
X-Received: by 2002:a1c:6a03:0:b0:406:535a:cfb4 with SMTP id
 f3-20020a1c6a03000000b00406535acfb4mr4040816wmc.1.1696481537733; 
 Wed, 04 Oct 2023 21:52:17 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-211-120.dsl.sta.abo.bbox.fr.
 [176.171.211.120]) by smtp.gmail.com with ESMTPSA id
 z7-20020a7bc7c7000000b003fee567235bsm2891894wmk.1.2023.10.04.21.52.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 21:52:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 14/22] qapi: Inline and remove QERR_IO_ERROR definition
Date: Thu,  5 Oct 2023 06:50:31 +0200
Message-ID: <20231005045041.52649-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231005045041.52649-1-philmd@linaro.org>
References: <20231005045041.52649-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: uFdRuL25re4t

Address the comment added in commit 4629ed1e98
("qerror: Finally unused, clean up"), from 2015:

  /*
   * These macros will go away, please don't use
   * in new code, and do not add new ones!
   */

Mechanical transformation using:

  $ sed -i -e 's/QERR_IO_ERROR/"An IO error has occurred"/' \
    $(git grep -wl QERR_IO_ERROR)

then manually removing the definition in include/qapi/qmp/qerror.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 include/qapi/qmp/qerror.h | 3 ---
 block/vmdk.c              | 8 ++++----
 blockdev.c                | 2 +-
 dump/win_dump.c           | 4 ++--
 migration/savevm.c        | 4 ++--
 softmmu/cpus.c            | 4 ++--
 6 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index ac727d1c2d..d95c4b84b9 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -17,9 +17,6 @@
  * add new ones!
  */
 
-#define QERR_IO_ERROR \
-    "An IO error has occurred"
-
 #define QERR_MIGRATION_ACTIVE \
     "There's a migration process in progress"
 
diff --git a/block/vmdk.c b/block/vmdk.c
index e90649c8bf..6779a181f0 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2246,12 +2246,12 @@ vmdk_init_extent(BlockBackend *blk, int64_t filesize, bool flat, bool compress,
     /* write all the data */
     ret = blk_co_pwrite(blk, 0, sizeof(magic), &magic, 0);
     if (ret < 0) {
-        error_setg(errp, QERR_IO_ERROR);
+        error_setg(errp, "An IO error has occurred");
         goto exit;
     }
     ret = blk_co_pwrite(blk, sizeof(magic), sizeof(header), &header, 0);
     if (ret < 0) {
-        error_setg(errp, QERR_IO_ERROR);
+        error_setg(errp, "An IO error has occurred");
         goto exit;
     }
 
@@ -2271,7 +2271,7 @@ vmdk_init_extent(BlockBackend *blk, int64_t filesize, bool flat, bool compress,
     ret = blk_co_pwrite(blk, le64_to_cpu(header.rgd_offset) * BDRV_SECTOR_SIZE,
                         gd_buf_size, gd_buf, 0);
     if (ret < 0) {
-        error_setg(errp, QERR_IO_ERROR);
+        error_setg(errp, "An IO error has occurred");
         goto exit;
     }
 
@@ -2283,7 +2283,7 @@ vmdk_init_extent(BlockBackend *blk, int64_t filesize, bool flat, bool compress,
     ret = blk_co_pwrite(blk, le64_to_cpu(header.gd_offset) * BDRV_SECTOR_SIZE,
                         gd_buf_size, gd_buf, 0);
     if (ret < 0) {
-        error_setg(errp, QERR_IO_ERROR);
+        error_setg(errp, "An IO error has occurred");
     }
 
     ret = 0;
diff --git a/blockdev.c b/blockdev.c
index ed90365329..228cebf9a2 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1433,7 +1433,7 @@ static void external_snapshot_action(TransactionAction *action,
 
     if (!bdrv_is_read_only(state->old_bs)) {
         if (bdrv_flush(state->old_bs)) {
-            error_setg(errp, QERR_IO_ERROR);
+            error_setg(errp, "An IO error has occurred");
             goto out;
         }
     }
diff --git a/dump/win_dump.c b/dump/win_dump.c
index b7bfaff379..0115a609e0 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -67,7 +67,7 @@ static size_t write_run(uint64_t base_page, uint64_t page_count,
         l = qemu_write_full(fd, buf, len);
         cpu_physical_memory_unmap(buf, addr, false, len);
         if (l != len) {
-            error_setg(errp, QERR_IO_ERROR);
+            error_setg(errp, "An IO error has occurred");
             return 0;
         }
 
@@ -459,7 +459,7 @@ void create_win_dump(DumpState *s, Error **errp)
 
     s->written_size = qemu_write_full(s->fd, h, hdr_size);
     if (s->written_size != hdr_size) {
-        error_setg(errp, QERR_IO_ERROR);
+        error_setg(errp, "An IO error has occurred");
         goto out_restore;
     }
 
diff --git a/migration/savevm.c b/migration/savevm.c
index bb3e99194c..41c7f39ef5 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -3099,7 +3099,7 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
     object_unref(OBJECT(ioc));
     ret = qemu_save_device_state(f);
     if (ret < 0 || qemu_fclose(f) < 0) {
-        error_setg(errp, QERR_IO_ERROR);
+        error_setg(errp, "An IO error has occurred");
     } else {
         /* libxl calls the QMP command "stop" before calling
          * "xen-save-devices-state" and in case of migration failure, libxl
@@ -3148,7 +3148,7 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
     ret = qemu_loadvm_state(f);
     qemu_fclose(f);
     if (ret < 0) {
-        error_setg(errp, QERR_IO_ERROR);
+        error_setg(errp, "An IO error has occurred");
     }
     migration_incoming_state_destroy();
 }
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7fc70f9166..f7c743b0ce 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -773,7 +773,7 @@ void qmp_memsave(int64_t addr, int64_t size, const char *filename,
             goto exit;
         }
         if (fwrite(buf, 1, l, f) != l) {
-            error_setg(errp, QERR_IO_ERROR);
+            error_setg(errp, "An IO error has occurred");
             goto exit;
         }
         addr += l;
@@ -803,7 +803,7 @@ void qmp_pmemsave(int64_t addr, int64_t size, const char *filename,
             l = size;
         cpu_physical_memory_read(addr, buf, l);
         if (fwrite(buf, 1, l, f) != l) {
-            error_setg(errp, QERR_IO_ERROR);
+            error_setg(errp, "An IO error has occurred");
             goto exit;
         }
         addr += l;
-- 
2.41.0

