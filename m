Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp617731ocb;
        Thu, 6 Oct 2022 09:50:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7zBuT1f5lH8PF8MyfJcWbYdH3mrPe5lB0bW5+4bnBNc5P6xPAJLP3jmYyGO809BrITDRtL
X-Received: by 2002:a05:620a:2887:b0:6cf:971e:104d with SMTP id j7-20020a05620a288700b006cf971e104dmr763618qkp.441.1665075014446;
        Thu, 06 Oct 2022 09:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665075014; cv=none;
        d=google.com; s=arc-20160816;
        b=z728DfsrfKvTfd/BCcQLJ4on+/YMXmDVVW1ELveR7eEEUzpGpSrX6WmWVSnJcSB8kE
         2l/rcVwN03BI6oTl+0JGcgS+OIKB67qfr5FiGH1jooj4mKzA8CEjkbRMy+qOm00gml1r
         yjdVkMC0kV22gLK8X1Mj/dm0yCctRbUDZiz1KA6nAUscNEMw2Zc25T845tMlZI+ReLRE
         u7PWjK0vizv2XV52hQHt1ZjPha8WxCe8H5ygCWLQ3T8+72p4OTJHLTOOTdtAE6xRQVPe
         wohp+9m2nZYOpBcGFihDDp9W6bqZ+xvN0goxH4yS9dMrY5dPM9ZrYCfJsMx88i9/S69q
         WNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3ZRyp7UkxaTDSDvUxw8uUazNBUoWOOo6PFrghM0r5L0=;
        b=OPS/CY/UZ6iVHsre1dp4U67LZGpjgC2sdGj0F/KsUcCYYZtzlQODuEe1sqs3s7lb1M
         C3mmpgdp6pZaiT3cYqWYgTEfEmJbWzinCT+RRXStYYfNUsk7tpvnCV/7DatQ3qRzVG+a
         zYRc9YlmHEujmjIOjraWgGcLGsHttBWdoYFBKy5LFNY7ZypdvsD4105AGjTJExlJRnuM
         lRO9V7yjmyWGR6r3u7aZZvhoIbIPQj0xEfmazaJkDBEnx9jXybJbp0KUwmlJprZSO0U5
         csaQR/UcO0TwKv1+VwhLpfttJz/658E6r4kZjIKveV8RX1VA3paobzmwNpW4G8dd3O5u
         kZHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fPHEFNL1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv15-20020ad44eef000000b004ad737aad69si3826684qvb.580.2022.10.06.09.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 09:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fPHEFNL1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogU4c-0007QY-0J
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 12:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogStj-0003XI-Vb
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:34:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ogSti-00009s-Hw
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665070493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ZRyp7UkxaTDSDvUxw8uUazNBUoWOOo6PFrghM0r5L0=;
 b=fPHEFNL1aOWOOnxCqZwRqKuW8BQqXhFupng1QTKVQWhrNZaWOAhH3UltaedxjcJGNnXJvN
 DBARDLBlp8rtNmzsKkfFixa5XW1/OPu8ojfzJqoGbRyO2x91eeh1ZFJcUZfiIU0Db1AIso
 VxCkmGW+jai3EUrOjkrirD7B/dzb+VA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-RZxaDvWSMZySUeajtMEfVg-1; Thu, 06 Oct 2022 11:34:44 -0400
X-MC-Unique: RZxaDvWSMZySUeajtMEfVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E551129324AB;
 Thu,  6 Oct 2022 15:34:43 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2779A2011567;
 Thu,  6 Oct 2022 15:34:42 +0000 (UTC)
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
Subject: [PULL 02/10] dump: Rename write_elf_loads to write_elf_phdr_loads
Date: Thu,  6 Oct 2022 19:34:21 +0400
Message-Id: <20221006153430.2775580-3-marcandre.lureau@redhat.com>
In-Reply-To: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
References: <20221006153430.2775580-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i7APuct32viY

From: Janosch Frank <frankja@linux.ibm.com>

Let's make it a bit clearer that we write the program headers of the
PT_LOAD type.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
Reviewed-by: Steffen Eiden <seiden@ibm.linux.com>
Message-Id: <20220811121111.9878-3-frankja@linux.ibm.com>
---
 dump/dump.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 4d9658ffa2..0ed7cf9c7b 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -490,7 +490,7 @@ static void get_offset_range(hwaddr phys_addr,
     }
 }
 
-static void write_elf_loads(DumpState *s, Error **errp)
+static void write_elf_phdr_loads(DumpState *s, Error **errp)
 {
     ERRP_GUARD();
     hwaddr offset, filesz;
@@ -573,8 +573,8 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    /* write all PT_LOAD to vmcore */
-    write_elf_loads(s, errp);
+    /* write all PT_LOADs to vmcore */
+    write_elf_phdr_loads(s, errp);
     if (*errp) {
         return;
     }
-- 
2.37.3

