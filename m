Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp716155lfp;
        Thu, 14 Jul 2022 08:17:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uAaND8y+clR5r8yA7jxW2FYRO85kunBvwDhuSVTzho8TPp8zxNR3+Yhu4DxjSOIwxbdl+o
X-Received: by 2002:a05:620a:1102:b0:6b5:5fab:8f20 with SMTP id o2-20020a05620a110200b006b55fab8f20mr6422884qkk.560.1657811836197;
        Thu, 14 Jul 2022 08:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657811836; cv=none;
        d=google.com; s=arc-20160816;
        b=nghtquRjL7TrqPRLExQ1lYQTNsxWND35a1P3KH7Be+0oP0RKX4d6A3oP/ljxY2VjsV
         1/BLLsq9OkiouquwUC2nqL5CkX9JCo4vthym31t/5tecMT6HS/lfF4IKFrz42FYgp4mE
         dhgvT110xbrJIvry3ax0g8YsOqQe7IcNHnoZBEYZRgkS0Evu6ItTlLEKtZudOgdXVdQq
         6ku5NwAJ5o4CTEHw857VCPqY3uFCIP4BCGnTqEAXo6k+J+J1X/ynz+QVNLX+TfFzRRKj
         Du85OCTDSXA5yr+oRyGfC8rvVAMlj72BOWDg3ycwoSe6FhJF+AJtY83rlBAqGuOmnkvq
         RsOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yIEKp4A/euRwpuaAoyZCuunfabQKRWXCvWPVhNg11Os=;
        b=U4C3cK+Ht+4cXMlVzuaagpbuAwasTTttlcVvbxDirdOmrMzb4wh/7zB1t5qSVCDCrf
         NkEvZQEyPpGCUAuAW5C3QhHftNHuDvOn1+bq7XxHvQhhPoWqpd/lAeRWFOqibvol2WD8
         Vn2R3x7FIdKVtyaJQS4Q/qXVu5xjGK8Uxh4Qn/ZXhXZWEjs57DSiOeAKrMWN27P7t+64
         ak6egmBHxXHtJkMSMu7IkrzZNCyyy87U+6EIzr2Wy8QavDi12BCZpKSiLMq+nO41ZNRU
         gw1eXBKenvn/j5RyrDKN7k/sPTWOSlDjNkl1im8AY2ZxrnJu9r+Y0armEY+w0hbBtthe
         RegA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F/4pcUsi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020ac80502000000b0031d4c04b66bsi1112524qtg.409.2022.07.14.08.17.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 08:17:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F/4pcUsi";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC0aZ-0004Lw-Ms
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 11:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oC0Ra-0005X0-23
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 11:07:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oC0RS-0000S7-5V
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 11:07:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657811269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yIEKp4A/euRwpuaAoyZCuunfabQKRWXCvWPVhNg11Os=;
 b=F/4pcUsinmr5FRBKvjKpAyU6m9rxMDp1FR0+82XK9dtmSHtOS0bdrimOQoOCzGgJG3L0kP
 el1xiXOGvSMzt9MT2KHML1WxT/+2InQArOVm6gCwYsaXyWpKfFJuev1RLp+Ye2IDtXrwEo
 6kP359zmKXmlPmpfNie+SAenORcKQeY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-GFH_VTacMpaoLRqyq5-QQg-1; Thu, 14 Jul 2022 11:07:47 -0400
X-MC-Unique: GFH_VTacMpaoLRqyq5-QQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E48C31C05AE0;
 Thu, 14 Jul 2022 15:07:46 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C9E02166B26;
 Thu, 14 Jul 2022 15:07:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/3] target/arm: display deprecation note in '-cpu help'
Date: Thu, 14 Jul 2022 16:07:35 +0100
Message-Id: <20220714150735.1835166-4-berrange@redhat.com>
In-Reply-To: <20220714150735.1835166-1-berrange@redhat.com>
References: <20220714150735.1835166-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: uswuXsq4OIWT

The deprecation notes are currently only displayed at runtime when the
user activates a CPU. The QMP query displays a simple flag for
deprecation, while '-cpu help' displays nothing unless the deprecation
info is duplicated into the 'notes' field.

This changes the code so that deprecation notes are explicitly shown
in '-cpu help', to assist the user in deciding what to use.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/arm/helper.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cfcad97ce0..1a0988d8fc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8222,12 +8222,20 @@ static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
 static void arm_cpu_list_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
+    CPUClass *cc = CPU_CLASS(oc);
     const char *typename;
     char *name;
+    g_autofree char *details = NULL;
+
+    if (cc->deprecation_note) {
+        details = g_strdup_printf(" (deprecated: %s)", cc->deprecation_note);
+    } else {
+        details = g_strdup("");
+    }
 
     typename = object_class_get_name(oc);
     name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
-    qemu_printf("  %s\n", name);
+    qemu_printf("  %s%s\n", name, details);
     g_free(name);
 }
 
-- 
2.36.1

