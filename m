Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2516417ejb;
        Wed, 4 Oct 2023 02:12:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjEbRqeX7HkrkV5LI4EItCBc6rH2y0Piji39ek+QuHfmw2mUgxtJVUak6FH/dZL+8DaQnS
X-Received: by 2002:a05:620a:ed6:b0:76f:1318:d7d1 with SMTP id x22-20020a05620a0ed600b0076f1318d7d1mr1575066qkm.75.1696410727043;
        Wed, 04 Oct 2023 02:12:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696410727; cv=none;
        d=google.com; s=arc-20160816;
        b=pL84H9+chcx2JK21FoeQuZ1GbSPisEw8O1563lW6Su/GJgJvNvi67xy5Vhfcy5TJtU
         ZdVBADelPycX34NU5SO9ctrKA0sutGQFzSV7Vmp1D1BdV/9LEI/CYvmUPrQSsnxwZ/wS
         Iwq5zS0+O36PJWyVGN07FM4sF5wxZvhnUoTbYErd8JmUHymXzFso01o0N9Lq+nHUXZ8+
         JAfHY3577Yajl0NoNn3IMeRrmhgolFVH/cAK2tzsRSFxFfUD1bH6raVNL5Yn5Ya8Esmi
         hMJ0h5f3q6iS56lPKIpk1Rk/D4puKqltYg8Q1RPgIxVFZids39lWwIKZUIg+iGkMaJ5D
         WH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CmcEZ4BojpksyjPshqc9VPV/X5+Y6Dg/MjyjckpWMK8=;
        fh=kTw5FEav0wBQL17Nthmup4l4cFFI5+KsuRpV2gSpdGM=;
        b=N5CZZeVa4ZBB7W+DE/yLkWbga10hJ+HAzkDWKpuk4LrdxBQrBPuX5iucdak+TGoLa2
         3TSO0m5dQsK0SujrJsoyuKG3cxs0CIUgjKLK8uooyvydVmEtRk/Lzg03kHOKY3H/ViM4
         GPc/5TpclO6KuUeWgYmti8pIF7VDm12NJWANVq4h2dhI0tPRDKTuisXFgP7/nMQufv8O
         1SpsIZM+iON8Wzytgjbk3ZdAj/OJsTmXgFwHP5uO0Vt1JwOF9/TLKFCHMl4bDRc4v7Zx
         EqAoM6NRyqgjhSuiZ7eL0UJ6EMyvaL5S0HBZR3+JUmXv9zoQ7a9MNwZvpSsLE1RE2uk+
         wd6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MCrcRibS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15-20020a05620a0f8f00b007740ef01f40si1308556qkn.200.2023.10.04.02.12.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 02:12:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MCrcRibS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qnxr2-00032W-3U; Wed, 04 Oct 2023 05:07:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxqV-0000ZH-8h
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 05:07:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnxqN-0007Oa-Ix
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 05:07:06 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3247d69ed2cso1866816f8f.0
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 02:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696410415; x=1697015215; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CmcEZ4BojpksyjPshqc9VPV/X5+Y6Dg/MjyjckpWMK8=;
 b=MCrcRibS4vd8xD/2AU7y+351I2H/eoRinypn3OMtJC4i22796r1PSBk8kCHmqHI7Xo
 SFak2AeI6jkPJslPDUBbmYcOftzCUz3NQtFUBMR17DGTLojZTsIVjSzLS8zuLRDZHru2
 5eIxXJ59rOuhXpjmU6VkezFcWTMAH9h04NaoeiyZCdsfopUjx6ckF7IJF0N94BVZdkZF
 BaAGCLyriZePNSNrnFjo3GfYLv+ZuKAHmbhC4XabtdVH90WziQb03wnf9M74LgD5j1Ja
 Ma5igiPrPHOxSkXKgjq7WHkIntFprWy93QO85CWi3NPHIp0FHahuI6jbuUlukpa2nYYw
 5FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696410415; x=1697015215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CmcEZ4BojpksyjPshqc9VPV/X5+Y6Dg/MjyjckpWMK8=;
 b=odittwkLwM30+a2+LzHI5xcthA6Mr2COx240Us12/nRDux42bEcBewGKauXNAaHd56
 4ecKYICrrKDMJmmeNL8NAlJTzc4Y9851s53h9lWx4tg2M8jhnLm3EjM5XEXUWWu4pBm6
 Ci9VucPdyjWMdwo60+37kT4TQD+uSqGHt4I9RI6KjZ5SOmM8qAzCMWFUyMFxHs6ee9s7
 Z+YrzIEysUseNdueOUIug9Ag0DtvB9NxuAPG66w8BMqifGQC6eikjvyaYcnvM0c2KxcV
 fW5Iv4NAhUHW4B6uGUOjyf/lwTcIL2GUGYnJode536ov4gS6gRGGbYEvKWq+Obwig9HR
 5crw==
X-Gm-Message-State: AOJu0YxogN5lMK/8nU7gekEMNU6AgB0PpB2d9lRqbrgqJxuzEFF0gcsu
 2njZgUIaU/zVv8vONqsx/VD3UpNpxKp+TcPlPSk=
X-Received: by 2002:a5d:5591:0:b0:323:1d06:38e5 with SMTP id
 i17-20020a5d5591000000b003231d0638e5mr1656889wrv.55.1696410415277; 
 Wed, 04 Oct 2023 02:06:55 -0700 (PDT)
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 bl40-20020adfe268000000b003233b554e6esm3528654wrb.85.2023.10.04.02.06.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Oct 2023 02:06:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 04/13] fuzz: Correct invalid mentions of 'softmmu' by 'system'
Date: Wed,  4 Oct 2023 11:06:19 +0200
Message-ID: <20231004090629.37473-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: <20231004090629.37473-1-philmd@linaro.org>
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
X-TUID: zpDv3SwiT7/H

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/fuzz/fuzz.h | 4 ++--
 softmmu/memory.c        | 2 +-
 tests/qtest/fuzz/fuzz.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/fuzz/fuzz.h b/tests/qtest/fuzz/fuzz.h
index 21d1362d65..7da0bc3d7e 100644
--- a/tests/qtest/fuzz/fuzz.h
+++ b/tests/qtest/fuzz/fuzz.h
@@ -49,13 +49,13 @@ typedef struct FuzzTarget {
 
 
     /*
-     * Returns the arguments that are passed to qemu/softmmu init(). Freed by
+     * Returns the arguments that are passed to qemu/system init(). Freed by
      * the caller.
      */
     GString *(*get_init_cmdline)(struct FuzzTarget *);
 
     /*
-     * will run once, prior to running qemu/softmmu init.
+     * will run once, prior to running qemu/system init.
      * eg: set up shared-memory for communication with the child-process
      * Can be NULL
      */
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 234bd7b116..fa1c99f9ba 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3638,7 +3638,7 @@ void memory_region_init_rom_device(MemoryRegion *mr,
 }
 
 /*
- * Support softmmu builds with CONFIG_FUZZ using a weak symbol and a stub for
+ * Support system builds with CONFIG_FUZZ using a weak symbol and a stub for
  * the fuzz_dma_read_cb callback
  */
 #ifdef CONFIG_FUZZ
diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 3bedb81b32..9b9c9f9c36 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -207,7 +207,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
         fuzz_target->pre_vm_init();
     }
 
-    /* Run QEMU's softmmu main with the fuzz-target dependent arguments */
+    /* Run QEMU's system main with the fuzz-target dependent arguments */
     cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
     g_string_append_printf(cmd_line, " %s -qtest /dev/null ",
                            getenv("QTEST_LOG") ? "" : "-qtest-log none");
-- 
2.41.0

