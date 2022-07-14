Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp716102lfp;
        Thu, 14 Jul 2022 08:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vcXteKv1yToW9Rdi09G7qRxDVT8r99WCh0JvCBb9EwlU/ZUMEqbJvtR5AnINUsQ5Tyoqo8
X-Received: by 2002:a05:622a:13c7:b0:31e:c36c:8d3d with SMTP id p7-20020a05622a13c700b0031ec36c8d3dmr8614597qtk.348.1657811831179;
        Thu, 14 Jul 2022 08:17:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657811831; cv=none;
        d=google.com; s=arc-20160816;
        b=pSWPbYJANKAKx55yg28lzsOBzRUGxcMgNJQphARSbnXgiNfF9rS6qzTrDVM4CVjXAJ
         hl09q4rES0VuWzqyJYz/rgKSqlFxOgTt9SMRIBZFdUKWNf1IXYJWqsVxJxO6B2dagOoz
         XLsjSTF10OP29uLxpuKdQ1iMU0A92uHD3ZV8DEqiIMFvB3xBUSc9bEr+FF6iizBy3CI8
         MnmpDuEquNVQAo/QFUeVU6wgm/SQrdH5b/ORzdCC27N57Oh3GVFYzjh6qWCPf8gVliRK
         fUEiE61QlMUF0a78QfnEj/ag8pH1B24W+Z+v81TULtVIF+NrNUQ6mLb+xoc8eBET0uCF
         3Jlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dColUxJGXatxAW9Q/XH5UGoAXbui4Yt+06VbLyvRHCY=;
        b=0Gz6oTTvzEshU82OEaV7PL6IBkxicXlJR0OgL/NY+gUEtLvM6hlmdcPuLRqorFHXIa
         Z4PKGXNxFUtUe0rs2EqV6+xEI9vu0opU1Xw4829hMT9ZmDPohm4SLzuV/mL0i4t/9ruP
         ejwjx+zI5u3y+9YpNXbeqHSeIPhqX6A4sLTouUFjNzOzgxepzEWyNmLXHR4mA+135bA1
         AFDBJOWKXs8vEvwoozlzwXK+NCZqp09S76axl9x7JQi48Jtt6gJCIyKjSyyoEv4cqlRy
         9GzrLR589M8xeVwWH9188PitBOf4CU1q2VfoKSnB0WngGv8bNVKokEyjsj6W23kyW5Hf
         zwig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MEIuNs7F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c79-20020ae9ed52000000b006aed58aa82dsi1019680qkg.302.2022.07.14.08.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 08:17:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MEIuNs7F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC0aU-0003x0-LJ
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 11:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oC0Rj-0005zz-BU
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 11:08:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oC0RS-0000SD-S7
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 11:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657811270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dColUxJGXatxAW9Q/XH5UGoAXbui4Yt+06VbLyvRHCY=;
 b=MEIuNs7F/AmIkkl3VggKRE2ebck0cOL6B3qPP/aQse0w+pw30MmtVq+SXeMlxI/m4yZaPa
 G2fHAyPuAYN2Rko25gavH3uTL4YT8pds1BRGNMJci+XMWMDSgmPDqB6Jhk83Z5zNHmZMLi
 zbkV+teD/33FylbD+v5zONcc1VNCwUs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-JoSsyUByN6KKKiywZqlCjA-1; Thu, 14 Jul 2022 11:07:47 -0400
X-MC-Unique: JoSsyUByN6KKKiywZqlCjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 548AD85A589;
 Thu, 14 Jul 2022 15:07:45 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 907CB2166B26;
 Thu, 14 Jul 2022 15:07:43 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/3] target/s390x: display deprecation note in '-cpu help'
Date: Thu, 14 Jul 2022 16:07:34 +0100
Message-Id: <20220714150735.1835166-3-berrange@redhat.com>
In-Reply-To: <20220714150735.1835166-1-berrange@redhat.com>
References: <20220714150735.1835166-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eRxYZyMnxsDG

The deprecation notes are currently only displayed at runtime when the
user activates a CPU. The QMP query displays a simple flag for
deprecation, while '-cpu help' displays nothing unless the deprecation
info is duplicated into the 'notes' field.

This changes the code so that deprecation notes are explicitly shown
in '-cpu help', to assist the user in deciding what to use.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/s390x/cpu_models.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 1a562d2801..a04375896d 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -334,18 +334,36 @@ const S390CPUDef *s390_find_cpu_def(uint16_t type, uint8_t gen, uint8_t ec_ga,
 static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
 {
     const S390CPUClass *scc = S390_CPU_CLASS((ObjectClass *)data);
+    CPUClass *cc = CPU_CLASS(scc);
     char *name = g_strdup(object_class_get_name((ObjectClass *)data));
-    const char *details = "";
+    g_autoptr(GString) details = g_string_new("(");
 
     if (scc->is_static) {
-        details = "(static, migration-safe)";
-    } else if (scc->is_migration_safe) {
-        details = "(migration-safe)";
+        g_string_append(details, "static");
+    }
+    if (scc->is_migration_safe) {
+        if (details->len > 1) {
+            g_string_append(details, ", ");
+        }
+        g_string_append(details, "migration-safe");
+    }
+    if (cc->deprecation_note) {
+        if (details->len > 1) {
+            g_string_append(details, ", ");
+        }
+        g_string_append(details, "deprecated: ");
+        g_string_append(details, cc->deprecation_note);
+    }
+    if (details->len > 1) {
+        g_string_append(details, ")");
+    }
+    if (details->len == 1) {
+        g_string_truncate(details, 0);
     }
 
     /* strip off the -s390x-cpu */
     g_strrstr(name, "-" TYPE_S390_CPU)[0] = 0;
-    qemu_printf("s390 %-15s %-35s %s\n", name, scc->desc, details);
+    qemu_printf("s390 %-15s %-35s %s\n", name, scc->desc, details->str);
     g_free(name);
 }
 
-- 
2.36.1

