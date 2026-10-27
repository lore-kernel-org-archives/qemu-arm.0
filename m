Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FF8606A31E
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QGYwC0oJ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLf8q-0006C4-8a; Tue, 27 Oct 2026 07:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf8F-0005a4-VU
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 07:14:20 -0400
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xLf8D-00035Q-3A
 for qemu-arm@nongnu.org; Tue, 27 Oct 2026 07:14:19 -0400
Received: by mail-dy1-x132d.google.com with SMTP id
 5a478bee46e88-36a1947498bso104453eec.1
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 04:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793099655; x=1793704455; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0IQAi57jN1cEgT7N+5TROR/iAJg0rEO9lljzD+3FUDI=;
 b=QGYwC0oJb0HdNGxCxw49uxDpWYKfAJzrUiuICwIjf/NXIm3hTUajw4/r6lVmBxV/o0
 v+9puuMrEqRW5qTNeYAn2A5Fe4++twzkg4GSj0VL6xwK69AxlHgRH73+iZwH6rnMLmNr
 rwGAB1Y10dqoct7PfFprUxOLVKKN7auyuzWNy/ofs6a3lUHxFzIXuy7OWlVUqZr9ka/s
 sl2JV3zAMB3Ifrz15SoYDpPsSHL4ptg+ODAnPzfam2SNZ8C4klCyh91TJlCFXe3dM72T
 U1SNKu7uA/RnayUKZ+qtRsc4wB83dHO06hJtPTVbsU+Ckdd4KWQlw7BRrjzzMMXjVruL
 8oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793099655; x=1793704455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0IQAi57jN1cEgT7N+5TROR/iAJg0rEO9lljzD+3FUDI=;
 b=oaHVzsO0wbku0L97dSmw88CbZw0SBYaOyFGwZOdkcqvWrdhWfgx6UidFuhHBHSdhOa
 youdAE4fTYmgIWpmPqM7/H9obhll2xMtLuQGwxWFTD1qnPIfkWeAJEKaakI4siBLy+04
 0H1emTKiPqQKsBM+/rWWJT1DzfypuPWcBXwGu3QZM14apfUKYqPy1cFscJcFlahFwrLl
 Y48WpVdXFV4+r0Q9AL9LhgnQYc1lKWZQoczKsXmtYt8uRAKzEqieZk84V2G3tsWyvrcR
 T/9GbKPuEr3xT+azd/Hwri4rFxmvDPGWDbxzY4e1aLdapTVo20JYCNFwSARjnoqg8Fq1
 1oNg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx4BTg8X1E4Icy+4mQzsRqomDH1Gt7x6vkcQJfwIhCI4MXJXaiyF7tS3yBllQl3xAYHyRXRPM02ng==@nongnu.org
X-Gm-Message-State: AFq9FYJlrlX6xH0Ai9a3MdVL90CCR8Bh4qPgR+LBvPk3Tb2yMm8DjSRN
 DfjlyfoyXAuQhenYnSyK7zDEnnSdacMKFAq0hMWT2O3mDvMGE3ZAKxDW
X-Gm-Gg: AYBFou1OVFujO0IhfX1SLvqpfUZLXua4ZDhY3hGpr7srQGPYLFt6EUF6clTdt28Qaa8
 BCdskCiX791pRcGCjdvi+YxcfMPl/mfQavkYOp09gKVIOX/CCGhKVhxpxGFsodyrnDGTwDVhWxb
 mZFIkNespwbvuEWCZySi8uN3NJJJhxfz0u9CGtOsIJekTKWFjQntcNFY0eT1PlItx4MVHuqP/av
 5uspslAg7Gi+R2ER+ocoZMcuG7bKZjebwyLcCZSXeCSIu+J1K4FLlqsWjRZMPoyQdQwOWNvQ34v
 or+sKPXaYJHeRJhqFqfjqdoFpops/V7Z8gokp4TeLI0fSyshipjD685dzAyZYHW8Lti3mobimYG
 GVuKCsJUEzHMdIaautKItsPTdBWtT9C8+tRxV+//8MIjZwF207GSlH6sByxbBH7MovrIqlWxdGI
 5sfZ+qXNjPFy7QX4rwSCAjMJSjsfNbtWT98hCbchOIa1Y8TmJKjlNNt1+77OVHNbZuHkefNb8md
 EbLcgC8AC/31oWAB9t/2ojXZf/Pxyz3nCxnGVsTFPTq0zH19bKNiZbrbiMxA1yGZeRYlYvmyoEo
 3Vjc/ugLeoI9i50b0NQ9aIQHs9RZsQ9pa76mhnNfuOgTAqo79MJFZp5nAoq8Pg==
X-Received: by 2002:a05:701b:4517:20b0:14d:cb67:afc4 with SMTP id
 a92af1059eb24-1993fe816e3mr13105975c88.41.1793099655362; 
 Tue, 27 Oct 2026 04:14:15 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-198a0f83cedsm40453042c88.13.2026.10.27.04.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 04:14:14 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Song Gao <17746591750@163.com>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Philippe Mathieu-Daude <philmd@mailo.com>,
 Chao Liu <chao.liu@processmission.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Eric Blake <eblake@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v4 17/17] machine: match the versioned virt example to arm virt
Date: Tue, 27 Oct 2026 19:12:15 +0800
Message-ID: <20261027111216.392-18-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261027111216.392-1-luoyonggang@gmail.com>
References: <20261027111216.392-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x132d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The comment still showed MACHINE_VER_TYPE_NAME("virt") and left out
machine_class_set_name(). Use arm-virt only when
target_heterogeneous() is true. qemu-system-<target> keeps virt.
Keep the -M name as virt-<version>, and name the latest helper
DEFINE_VIRT_MACHINE_AS_LATEST.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/hw/core/boards.h | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/boards.h b/include/hw/core/boards.h
index db2d0137fc1..b77a618ba1a 100644
--- a/include/hw/core/boards.h
+++ b/include/hw/core/boards.h
@@ -474,28 +474,37 @@ struct MachineState {
  * For example, a macro that can be used to define versioned
  * 'virt' machine types would look like:
  *
+ *  #define TYPE_VIRT_MACHINE (target_heterogeneous() ? \
+ *                             MACHINE_TYPE_NAME("arm-virt") : \
+ *                             MACHINE_TYPE_NAME("virt"))
+ *
  *  #define DEFINE_VIRT_MACHINE_IMPL(latest, ...) \
  *      static void MACHINE_VER_SYM(class_init, virt, __VA_ARGS__)( \
  *          ObjectClass *oc, \
- *          void *data) \
+ *          const void *data) \
  *      { \
  *          MachineClass *mc = MACHINE_CLASS(oc); \
  *          MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
- *          mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " Virtual Machine"; \
+ *          mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) \
+ *                     " ARM Virtual Machine"; \
  *          MACHINE_VER_DEPRECATION(__VA_ARGS__); \
+ *          machine_class_set_name(mc, "virt-" MACHINE_VER_STR(__VA_ARGS__)); \
  *          if (latest) { \
  *              mc->alias = "virt"; \
  *          } \
  *      } \
- *      static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = { \
- *          .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
- *          .parent = TYPE_VIRT_MACHINE, \
- *          .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
- *      }; \
  *      static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
  *      { \
+ *          const TypeInfo virt_machine_info = \
+ *          { \
+ *              .name = target_heterogeneous() ? \
+ *                      MACHINE_VER_TYPE_NAME("arm-virt", __VA_ARGS__) : \
+ *                      MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
+ *              .parent = TYPE_VIRT_MACHINE, \
+ *              .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
+ *          }; \
  *          MACHINE_VER_DELETION(__VA_ARGS__); \
- *          type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
+ *          type_register_static(&virt_machine_info); \
  *      } \
  *      type_init(MACHINE_VER_SYM(register, virt, __VA_ARGS__));
  *
@@ -503,7 +512,7 @@ struct MachineState {
  * whichever scenarios need to be catered for with a machine:
  *
  *  // Normal 2 digit, marked as latest e.g. 'virt-9.0'
- *  #define DEFINE_VIRT_MACHINE_LATEST(major, minor) \
+ *  #define DEFINE_VIRT_MACHINE_AS_LATEST(major, minor) \
  *      DEFINE_VIRT_MACHINE_IMPL(true, major, minor)
  *
  *  // Normal 2 digit e.g. 'virt-9.0'
-- 
2.52.0.windows.1


