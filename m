Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp395353ejb;
        Thu, 1 Jun 2023 05:19:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4iyEk05fXPY6ILDSyHGFaBs6nzb2Ko8Bf7yFzvRiM3HbrEwPq6di8sVo+OgwvpxZ4/qGny
X-Received: by 2002:a5d:4cc8:0:b0:306:31fb:1c3e with SMTP id c8-20020a5d4cc8000000b0030631fb1c3emr1616388wrt.26.1685621963160;
        Thu, 01 Jun 2023 05:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685621963; cv=none;
        d=google.com; s=arc-20160816;
        b=vAZWOalvAnrNw0vAZpiAOZRoUil5pr9f1sjxkygbrBnUrgKWg09Wr/FOMLdFklEk01
         0lyGmqtaSM8CJcP4Zm94PyJeYY9aglw/vwffop7kq95JWmnJjPzhf3WYK6i7Td+62ThX
         Ih9L69HGFdQTwi9lFf5M6LKGG82VnR2L/uG17nxVorPqkD+LgRFDL3lg33vdpdFYGrIt
         nQLk+QgtK8gK3Ib1V1doWjEz8R5JhpsctC+fpt7nEZQ8BuYMGMNlvJYSIwv9M/gH+1zB
         Va1n+9GTU+Nds0TS/UJp90ZSmHDoBtHjgpbGo7rZYn4jW06ZTrNDw9dP0xFclMeEI1Gl
         nn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0RKhtCL6G/zGQJCk7r406voVsLgpFKg3xhqMOecRflU=;
        b=0GgWMqSfqDgwwekeTh4qPGe3xb4V0pMqnVZ1XvjFvDaTE7vc55N7DOuJHRMaCJX+Xb
         aKXC8LPaPjWKyB/Y/jWCe5sgpZ2/g0mYHXJuoSPkn1IJpvvZBvvfp+njLk7o7FABXNCg
         ssl4Q7zQ1jiIX01G8XIU/d5EXTdi/pMiHfLRB1nQgwoPyp8gLIcl1OhVG8xzeb/XcvpI
         AiLn197HHQrwsY5KURUlXoSaQGPrDT32X0QoKPiq9ZxVdWxN5owCrC5unylc9lqDP3Rr
         XQEJOc/jKA/NwGsMZmTaCHjKdR9Sb/zrpyT3QVEvChVK8VYUt10Bb79aaLwgrUOYj7el
         mNRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d2WNp2C0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13-20020a5d54cd000000b0030aebe55a03si4350005wrv.905.2023.06.01.05.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 05:19:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d2WNp2C0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4hEY-0002NU-HC; Thu, 01 Jun 2023 08:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q4hCs-0000bq-Gq
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 08:15:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q4hCq-0006Rv-QU
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 08:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685621703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0RKhtCL6G/zGQJCk7r406voVsLgpFKg3xhqMOecRflU=;
 b=d2WNp2C0SpmGGQj89TgMR2J93ZU5bg3c2PSZu4StW+dhTodp+1f9BuyT60haUbh64PSmvt
 3+fAFaNTPkpafrYSOFEjZCcgxDWZs76wUa75JyEH7y+KUtTdlYYOt2zrfxZ0e/hmSkUT4k
 8KlwrbAsp/XO+KPVD9EY3jE14kdHjVE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-Jc30OZYRM26HyIR9saF5Pg-1; Thu, 01 Jun 2023 08:14:59 -0400
X-MC-Unique: Jc30OZYRM26HyIR9saF5Pg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC2158028B1;
 Thu,  1 Jun 2023 12:14:58 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.8.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACAE52166B25;
 Thu,  1 Jun 2023 12:14:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>
Subject: [PATCH v3 05/10] hw/loongarch/virt: Use machine_memory_devices_init()
Date: Thu,  1 Jun 2023 14:14:42 +0200
Message-Id: <20230601121447.272487-7-david@redhat.com>
In-Reply-To: <20230601121447.272487-1-david@redhat.com>
References: <20230601121447.272487-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.166,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 6qDakmBZNSF0

Let's use our new helper. While at it, use VIRT_HIGHMEM_BASE.

Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/loongarch/virt.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index ceddec1b23..c1327a51c4 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -805,8 +805,8 @@ static void loongarch_init(MachineState *machine)
 
     /* initialize device memory address space */
     if (machine->ram_size < machine->maxram_size) {
-        machine->device_memory = g_malloc0(sizeof(*machine->device_memory));
         ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
+        hwaddr device_mem_base;
 
         if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
             error_report("unsupported amount of memory slots: %"PRIu64,
@@ -821,14 +821,8 @@ static void loongarch_init(MachineState *machine)
             exit(EXIT_FAILURE);
         }
         /* device memory base is the top of high memory address. */
-        machine->device_memory->base = 0x90000000 + highram_size;
-        machine->device_memory->base =
-            ROUND_UP(machine->device_memory->base, 1 * GiB);
-
-        memory_region_init(&machine->device_memory->mr, OBJECT(lams),
-                           "device-memory", device_mem_size);
-        memory_region_add_subregion(address_space_mem, machine->device_memory->base,
-                                    &machine->device_memory->mr);
+        device_mem_base = ROUND_UP(VIRT_HIGHMEM_BASE + highram_size, 1 * GiB);
+        machine_memory_devices_init(machine, device_mem_base, device_mem_size);
     }
 
     /* Add isa io region */
-- 
2.40.1

