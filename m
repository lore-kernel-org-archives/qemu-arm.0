Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBB9CC6B1F
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Oct 2026 09:34:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGvN2-0004Km-WB; Wed, 14 Oct 2026 05:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvN1-0004Ec-09
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:33:59 -0400
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvMz-0000Y7-1q
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:33:58 -0400
Received: by mail-dl1-x122b.google.com with SMTP id
 a92af1059eb24-16079d54c17so4958215c88.0
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 02:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791970436; x=1792575236; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yB3NWO2pJlVWPSGtlDu3f8MOoC7RbZF39joZfz1c1og=;
 b=mVYC+Ti1k+9o6cByT419DUh/KOz9tLGXc/2PSBVNdlImw4vaKMRdW9jqTWJOGEaMzv
 putafJy8sTueT+LRqjDT7CmBlZXnACeExk09iTxGS4vjEJx4gH4C0bTFw+wOyQ7lJjCF
 ZgV6PRRBRPPr2WCQzfvL2/i38sQsBtuzwlBEAufLnGpFOifxPh+QuME4Cdm/LBp6GiHP
 3MhC7qjhoipT5FytPQLF61Fjol1B8tIuEiArGegPncXX6BmabtP8lBHuTEU02rg9OcHP
 AdnCW8pyQ1SxUg0gWOjiIXLucCVw2Dqs6FBkBbi7HoCdV9gz/31hG7fb0CN7MAAgPw5c
 /SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791970436; x=1792575236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yB3NWO2pJlVWPSGtlDu3f8MOoC7RbZF39joZfz1c1og=;
 b=eQu+FtlYaYmMD02ciwwziWf2YlgoVMS9N/XqOUQPAF/tLQ5g+9gEHjs6Ni0bzRcEfk
 VIKNTiM0hEoKV3oXJH3BvGXsTbt8QOYaP9JRW5cHUgAPSTSmIeiOZ264P7Lxmh/71m+r
 zp2G+I+gIRLWjyHWdP6utpFlKobtxl20/S0ZzLbV67vSz5l805lk0ldQyG8GmhnqfY+j
 emNl5igLIHqQsrzWS0sqmZMN4SIRtwwGlINMar97PdyYC46URTLjPcDpb2CuBYx4sXRd
 cruCFjbSYViVEQVG17Hxcxcp95Boy5ZaBJttCxwl7K037J2pbklVWq6x+50OfxiHebqJ
 LXrw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzq9Ugg7TKn/VpKFBMJubhTjngMzxEAjIrl7UuTk1J96iAAspf0ucEk5YH0QWCiUmG9YcGw+tktbQ==@nongnu.org
X-Gm-Message-State: AFq9FYK2jQMYJppPpiTv6bfU5qKoOWCYKZ6+T5zRUCOxryuqYqtocS0A
 Cv8uwQrNzwEiyGodw1WMK8ixhpKQEsiJQkrDYhbUhUzCElIpzkrnwZJI
X-Gm-Gg: AYBFou2uzAcqAE/EvPqZ8wp+lytOxOx2kIxlRJ1LmPgAviYMvJp+fkKSaKlDqUwVjfS
 DQl0MxzEj/3luCaI7U6nb7/Ir/WycuhJY01nJQHy9xnPdf8ogN5WhA4YvyYnBWyuwYfzQ1WlEhV
 Io3PJZzT41kWa5Jey798QYqZJ9nUUgfsI5YR0zf8bKT20PBE+PhchphSiXkMrnG5ZoVf6KBrMN0
 MOHWQlF9IKCee22pQuMlPvJmmw2GgxLn+uGLq71A+KYBY5p/kwScCwU9OWjamTaeRoVrM5ffzGL
 Tg6xZpOowD8BXZrmTgRPbPshFSAPq67lHZzm5ZSJ2j8NHkqx5NsIQYEH75IaJH2dKrmzHXaWN0m
 yZcz3y1/W8ooLZELIfxBK+5mclcGQ0IAbNTqYx+fGu380hpCP7B0ycRy35KoxYU0Qg7u45eFA2y
 3OKW4ciejsls97mbZh5twCW32Nq/5/qX87uFhGaO/jO+oXXgwnZnTeOs/Dso/reAYuJyJozkofo
 tBQ/KGsDa2tIn3ieg==
X-Received: by 2002:a05:7022:1706:b0:144:c122:6cc6 with SMTP id
 a92af1059eb24-16a5ec48b8amr22398014c88.32.1791970435513; 
 Wed, 14 Oct 2026 02:33:55 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1698de65af7sm48769303c88.0.2026.10.14.02.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:33:54 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <17746591750@163.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Chao Liu <chao.liu@processmission.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 11/34] module: Add module_allow_all_arch for allow all modules
 be loaded
Date: Wed, 14 Oct 2026 17:31:21 +0800
Message-ID: <20261014093152.834-12-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014093152.834-1-luoyonggang@gmail.com>
References: <20261014093152.834-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122b;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

In multi-target qemu, we want all modules to be loaded without condition.
So add this function for latter usage.
Add this independent function for decouple only

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/module.h |  2 ++
 util/module.c         | 10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index fccf017bf9e..6268c3a8d75 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -100,6 +100,8 @@ int module_load(const char *prefix, const char *name, Error **errp);
 int module_load_qom(const char *type, Error **errp);
 void module_load_qom_all(void);
 void module_allow_arch(const char *arch);
+/* Allow every arch-tagged module without selecting an architecture. */
+void module_allow_all_arch(void);
 
 /**
  * DOC: module info annotation macros
diff --git a/util/module.c b/util/module.c
index 8f8e6994f11..b7253fbd065 100644
--- a/util/module.c
+++ b/util/module.c
@@ -119,6 +119,7 @@ static const QemuModinfo module_info_stub[] = { {
 } };
 static const QemuModinfo *module_info = module_info_stub;
 static const char *module_arch;
+static bool module_all_archs;
 
 void module_init_info(const QemuModinfo *info)
 {
@@ -128,11 +129,17 @@ void module_init_info(const QemuModinfo *info)
 void module_allow_arch(const char *arch)
 {
     module_arch = arch;
+    module_all_archs = false;
+}
+
+void module_allow_all_arch(void)
+{
+    module_all_archs = true;
 }
 
 static bool module_check_arch(const QemuModinfo *modinfo)
 {
-    if (modinfo->arch) {
+    if (modinfo->arch && !module_all_archs) {
         if (!module_arch) {
             /* no arch set -> ignore all */
             return false;
@@ -400,6 +407,7 @@ const QemuModinfo qemu_modinfo[] = {};
 
 void module_init_info(const QemuModinfo *info) {}
 void module_allow_arch(const char *arch) {}
+void module_allow_all_arch(void) {}
 void qemu_load_module_for_opts(const char *group) {}
 int module_load(const char *prefix, const char *name, Error **errp) { return 2; }
 int module_load_qom(const char *type, Error **errp) { return 2; }
-- 
2.55.0.windows.3


