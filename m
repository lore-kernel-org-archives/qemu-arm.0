Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp373373lfk;
        Thu, 21 Apr 2022 06:57:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzf+4gr668sjaDQ517qOlLXdznt5doFVrzS9EGdOeXDtggLkvjwYBAgx5sYcrXxGoB6nd0
X-Received: by 2002:a0d:e6ca:0:b0:2f1:c960:763b with SMTP id p193-20020a0de6ca000000b002f1c960763bmr13787596ywe.307.1650549424727;
        Thu, 21 Apr 2022 06:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650549424; cv=none;
        d=google.com; s=arc-20160816;
        b=vVwjR4/7XZ05Nr5v1qvzFW+/c//0/DdDKY+S6tlNzKXTs3edDzOuejfL8o0zrihsb/
         wssR6wyIlv3fC1l2ZT+q1gOaCHs2kM8w433bAHWcEPZXcvG18TSm5hlfyi0IwVnHqHSR
         i/N1B0fBzRNAk7IF8pjJX0IqUgMxeswv8Tpv4qadm9mC92nKO0c0gH4PfHjh894ESE+G
         1F9dcHSJBttrCoipTp8kIbvJ7ymcz9OpyEqvnZqK/wNg/CmczImj88cJf6BQ9RB3e50w
         Z69UQzrf9FvUCaaLdQUDCS8UKxeryO20/QWhTB1iRligtkKHfAl919mrIC9hSiog1U3O
         mZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dRsFK91bi/ARhkoGWMMbjS3alRaIXl3VJNiCxhocyjE=;
        b=t2CTpxWJa5/6HkrOXa60VYQ/5AGYS8GK3rlAWCryoB7qn7dRqwCkRjtO003/u1m+kY
         xTbIHu5M/Z4p4dEgeBjJfyVHk/ioj6Y3YyK2C8K9GCul7uvLmZMQEHZOqPbfljxmxo/L
         EnNsHCs68EJtrNfsMmgdEjA7aDBD0Ll5j+K73LWOWB0/LsPQYeZI3r0U5q5hwG+FG8tx
         2tT6zlz9cCSLSGipBpZuBvoieCGfz3TXe45VBnZ+r1kWI29STmxxPbGHrBhVvejWdjMe
         VJr9v7T/y5bEz59lHZNzMN68evSL9g0ZhTi+HUi87U6TmIB5CQA4PIyL6cPLn6NkBsNV
         mAxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="dp/GPXLL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f128-20020a811f86000000b002e5bb9dc98fsi2397639ywf.24.2022.04.21.06.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 06:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="dp/GPXLL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhXIu-0007Fl-52
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 09:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXCT-0002dI-Pb
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 09:50:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXCS-0005zZ-AT
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 09:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRsFK91bi/ARhkoGWMMbjS3alRaIXl3VJNiCxhocyjE=;
 b=dp/GPXLLENURrfaMtpbImPgEsSGizbYsbdcR7wlqGM5IMdiQ+cfOqnuM2GBjsIR32IxouF
 tfiNI/ZIfmsq4HIZgPAdIxnAszrWTTvhxnRG+kw5tR5Fxy+FmbH6qkB4j5L6UwCdlLB0bN
 dW1TLYkj3TwrLi35nnYKF8VJSpkmk9c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-cGjG5ng8NPe1Ngabq8iQhw-1; Thu, 21 Apr 2022 09:50:20 -0400
X-MC-Unique: cGjG5ng8NPe1Ngabq8iQhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC26C85A5BE;
 Thu, 21 Apr 2022 13:50:19 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0126A145B99C;
 Thu, 21 Apr 2022 13:50:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 08/30] arm/digic: replace snprintf() with g_strdup_printf()
Date: Thu, 21 Apr 2022 17:49:18 +0400
Message-Id: <20220421134940.2887768-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "open list:Canon DIGIC" <qemu-arm@nongnu.org>, richard.henderson@linaro.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oZTsm84XgP+e

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Also fixes a GCC 12.0.1 false-positive:
../hw/arm/digic.c: In function ‘digic_init’:
../hw/arm/digic.c:45:54: error: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size 5 [-Werror=format-truncation=]
   45 |         snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
      |                                                      ^~

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-14-marcandre.lureau@redhat.com>
---
 hw/arm/digic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index 614232165cdc..6df554797734 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -39,10 +39,7 @@ static void digic_init(Object *obj)
     object_initialize_child(obj, "cpu", &s->cpu, ARM_CPU_TYPE_NAME("arm946"));
 
     for (i = 0; i < DIGIC4_NB_TIMERS; i++) {
-#define DIGIC_TIMER_NAME_MLEN    11
-        char name[DIGIC_TIMER_NAME_MLEN];
-
-        snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
+        g_autofree char *name = g_strdup_printf("timer[%d]", i);
         object_initialize_child(obj, name, &s->timer[i], TYPE_DIGIC_TIMER);
     }
 
-- 
2.36.0

