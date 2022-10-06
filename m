Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp630344ocb;
        Thu, 6 Oct 2022 10:07:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6QXVmCGrkS6Y92lZQkHtUm3gcinneZc1lxcPGCMZfs7Sa/MZ6NfCQwDiByhp6eQFzVv0HN
X-Received: by 2002:a05:620a:f88:b0:6e0:15aa:72e0 with SMTP id b8-20020a05620a0f8800b006e015aa72e0mr904485qkn.40.1665076068396;
        Thu, 06 Oct 2022 10:07:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665076068; cv=none;
        d=google.com; s=arc-20160816;
        b=rrritsUpOaLbkgTjSZqEfGuQD21q4WY0iO05lTqPaYw3euzmupNQY1nCRLhhkFSsJZ
         MT3O6WuWNHpk8D9WVmW5wzUeEWhSl2vDlBbmsXeNBSxAFVOSSNPo+Cm/Dzubycv2+atp
         x9AZCbOj28yXnvRNRhMsQkcnMhgaHeabQLM7BPJz4L39II1FFZQKLi63o6VHN4xpeWi9
         hf3fUpUN3Uo9Yd+7zP/MisZJ6RANCT8NKVVkzm0gdwvFoX1v55Von5J3maZPJUwDHkbw
         uEpR9QxDKWz9P4XPsHidO9RD1WIqh+/KJJjW34wsoc45dQlaBFGoIy5qL4qr3WqwoV/d
         iVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dYjFVacFjH6LqJJ9EJvSjq1YMwNsnAVKlF4tFx1Ppyo=;
        b=Dbg9WEw/4eUu/BoduTAEIc3lhyQ8G5onnUvmMcT3KsgwiHPxI8r8IgjaCZNBeNphqI
         qUmwCEq5iNDY0LPTR4cbaFxW+Psu04bzNOkiG0VeVH+zfgJ9jMG294NSdJJPI0uvswOY
         JSUDxu9Fsme5GUMrH2Elo2LvivpzzEgo6pU6M1qlZGhjnhRF7sFyHiQTOKwj9gFTIrUQ
         Uo2t0E0WLEahbvZL8Ujtp9LDbVWFk9/oyUMhuM4LzLnieXpUkvOAak6vU63g4tHRurmV
         wmIX3k4dJmIIvbx8qqUjA+oTKvXIJw+kctHvgz7ZCGbc0QLC3BLu/Hm/F779KF+CpD7z
         RrfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZVwYvnoY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a0562140dc700b004ad2883e413si4183994qvt.469.2022.10.06.10.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 10:07:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZVwYvnoY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogULb-0002N6-Si
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 13:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSu0-0003be-N5
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 11:35:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSty-0000Q6-E8
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 11:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYjFVacFjH6LqJJ9EJvSjq1YMwNsnAVKlF4tFx1Ppyo=;
 b=ZVwYvnoY7PvvYriEO5CHfzLqCZgxIW03vMVuOWcxuivl85e7Wa6CBQedq4pvawW/1oG+KW
 MCzD2fKyFWCbnPXAxzhyhlUJdqwNBNUF0Mf7klDGkjwelwLzz8rDZYjCLYa5L8/iLDLaez
 5fnimOx3OMKyHrm1iMDZgtd4HfrHOR4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-2kTzssJPNbKu_7bUYId_Fw-1; Thu, 06 Oct 2022 11:35:06 -0400
X-MC-Unique: 2kTzssJPNbKu_7bUYId_Fw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46D5E3C10688;
 Thu,  6 Oct 2022 15:35:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D04B2166B2F;
 Thu,  6 Oct 2022 15:35:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 viktor.prutyanov@redhat.com, Greg Kurz <groug@kaod.org>,
 frankja@linux.ibm.com, David Hildenbrand <david@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 07/10] dump: Split elf header functions into prepare and write
Date: Thu,  6 Oct 2022 19:34:26 +0400
Message-Id: <20221006153430.2775580-8-marcandre.lureau@redhat.com>
In-Reply-To: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
References: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M7OqYiu+bxyI

From: Janosch Frank <frankja@linux.ibm.com>

Let's split the write from the modification of the elf header so we
can consolidate the write of the data in one function.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220811121111.9878-8-frankja@linux.ibm.com>
---
 dump/dump.c | 100 ++++++++++++++++++++++++++++------------------------
 1 file changed, 53 insertions(+), 47 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index d82cc46d7d..8a2a97a85e 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -131,7 +131,7 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
     return 0;
 }
 
-static void write_elf64_header(DumpState *s, Error **errp)
+static void prepare_elf64_header(DumpState *s, Elf64_Ehdr *elf_header)
 {
     /*
      * phnum in the elf header is 16 bit, if we have more segments we
@@ -139,34 +139,27 @@ static void write_elf64_header(DumpState *s, Error **errp)
      * special section.
      */
     uint16_t phnum = MIN(s->phdr_num, PN_XNUM);
-    Elf64_Ehdr elf_header;
-    int ret;
 
-    memset(&elf_header, 0, sizeof(Elf64_Ehdr));
-    memcpy(&elf_header, ELFMAG, SELFMAG);
-    elf_header.e_ident[EI_CLASS] = ELFCLASS64;
-    elf_header.e_ident[EI_DATA] = s->dump_info.d_endian;
-    elf_header.e_ident[EI_VERSION] = EV_CURRENT;
-    elf_header.e_type = cpu_to_dump16(s, ET_CORE);
-    elf_header.e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
-    elf_header.e_version = cpu_to_dump32(s, EV_CURRENT);
-    elf_header.e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
-    elf_header.e_phoff = cpu_to_dump64(s, s->phdr_offset);
-    elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
-    elf_header.e_phnum = cpu_to_dump16(s, phnum);
+    memset(elf_header, 0, sizeof(Elf64_Ehdr));
+    memcpy(elf_header, ELFMAG, SELFMAG);
+    elf_header->e_ident[EI_CLASS] = ELFCLASS64;
+    elf_header->e_ident[EI_DATA] = s->dump_info.d_endian;
+    elf_header->e_ident[EI_VERSION] = EV_CURRENT;
+    elf_header->e_type = cpu_to_dump16(s, ET_CORE);
+    elf_header->e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
+    elf_header->e_version = cpu_to_dump32(s, EV_CURRENT);
+    elf_header->e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
+    elf_header->e_phoff = cpu_to_dump64(s, s->phdr_offset);
+    elf_header->e_phentsize = cpu_to_dump16(s, sizeof(Elf64_Phdr));
+    elf_header->e_phnum = cpu_to_dump16(s, phnum);
     if (s->shdr_num) {
-        elf_header.e_shoff = cpu_to_dump64(s, s->shdr_offset);
-        elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
-        elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
-    }
-
-    ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "dump: failed to write elf header");
+        elf_header->e_shoff = cpu_to_dump64(s, s->shdr_offset);
+        elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf64_Shdr));
+        elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
 }
 
-static void write_elf32_header(DumpState *s, Error **errp)
+static void prepare_elf32_header(DumpState *s, Elf32_Ehdr *elf_header)
 {
     /*
      * phnum in the elf header is 16 bit, if we have more segments we
@@ -174,28 +167,45 @@ static void write_elf32_header(DumpState *s, Error **errp)
      * special section.
      */
     uint16_t phnum = MIN(s->phdr_num, PN_XNUM);
-    Elf32_Ehdr elf_header;
-    int ret;
 
-    memset(&elf_header, 0, sizeof(Elf32_Ehdr));
-    memcpy(&elf_header, ELFMAG, SELFMAG);
-    elf_header.e_ident[EI_CLASS] = ELFCLASS32;
-    elf_header.e_ident[EI_DATA] = s->dump_info.d_endian;
-    elf_header.e_ident[EI_VERSION] = EV_CURRENT;
-    elf_header.e_type = cpu_to_dump16(s, ET_CORE);
-    elf_header.e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
-    elf_header.e_version = cpu_to_dump32(s, EV_CURRENT);
-    elf_header.e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
-    elf_header.e_phoff = cpu_to_dump32(s, s->phdr_offset);
-    elf_header.e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
-    elf_header.e_phnum = cpu_to_dump16(s, phnum);
+    memset(elf_header, 0, sizeof(Elf32_Ehdr));
+    memcpy(elf_header, ELFMAG, SELFMAG);
+    elf_header->e_ident[EI_CLASS] = ELFCLASS32;
+    elf_header->e_ident[EI_DATA] = s->dump_info.d_endian;
+    elf_header->e_ident[EI_VERSION] = EV_CURRENT;
+    elf_header->e_type = cpu_to_dump16(s, ET_CORE);
+    elf_header->e_machine = cpu_to_dump16(s, s->dump_info.d_machine);
+    elf_header->e_version = cpu_to_dump32(s, EV_CURRENT);
+    elf_header->e_ehsize = cpu_to_dump16(s, sizeof(elf_header));
+    elf_header->e_phoff = cpu_to_dump32(s, s->phdr_offset);
+    elf_header->e_phentsize = cpu_to_dump16(s, sizeof(Elf32_Phdr));
+    elf_header->e_phnum = cpu_to_dump16(s, phnum);
     if (s->shdr_num) {
-        elf_header.e_shoff = cpu_to_dump32(s, s->shdr_offset);
-        elf_header.e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
-        elf_header.e_shnum = cpu_to_dump16(s, s->shdr_num);
+        elf_header->e_shoff = cpu_to_dump32(s, s->shdr_offset);
+        elf_header->e_shentsize = cpu_to_dump16(s, sizeof(Elf32_Shdr));
+        elf_header->e_shnum = cpu_to_dump16(s, s->shdr_num);
     }
+}
 
-    ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
+static void write_elf_header(DumpState *s, Error **errp)
+{
+    Elf32_Ehdr elf32_header;
+    Elf64_Ehdr elf64_header;
+    size_t header_size;
+    void *header_ptr;
+    int ret;
+
+    if (dump_is_64bit(s)) {
+        prepare_elf64_header(s, &elf64_header);
+        header_size = sizeof(elf64_header);
+        header_ptr = &elf64_header;
+    } else {
+        prepare_elf32_header(s, &elf32_header);
+        header_size = sizeof(elf32_header);
+        header_ptr = &elf32_header;
+    }
+
+    ret = fd_write_vmcore(header_ptr, header_size, s);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "dump: failed to write elf header");
     }
@@ -564,11 +574,7 @@ static void dump_begin(DumpState *s, Error **errp)
      */
 
     /* write elf header to vmcore */
-    if (dump_is_64bit(s)) {
-        write_elf64_header(s, errp);
-    } else {
-        write_elf32_header(s, errp);
-    }
+    write_elf_header(s, errp);
     if (*errp) {
         return;
     }
-- 
2.37.3

