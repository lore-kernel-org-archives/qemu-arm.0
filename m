Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp231556lfp;
        Fri, 22 Jul 2022 05:05:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vEutZpBo00y02ZzziCQsCWfyTR9Iin98yNVPwy6DP7lDCx68oKHpcQmEsqs3Xf+/bIKmSn
X-Received: by 2002:a0c:800d:0:b0:474:19c:f0af with SMTP id 13-20020a0c800d000000b00474019cf0afmr118881qva.74.1658491537839;
        Fri, 22 Jul 2022 05:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658491537; cv=none;
        d=google.com; s=arc-20160816;
        b=ockG9rhvXQ+ca9OY9sDtZlfk2FGLQKBBzCOWcqvt1H7ozgdlvN139uQ6u8qH0KMzfN
         6ZN4agDPCLXM+fmAHKgUuPjg65mYB0WWIP+svsBt+VIYxSCMPnJBJukTiH8ssOzfszoU
         Smq8pvFCmReX8ol/BDbKFr8D6hNSClZMENcKELd5xjFQgfGghc4Py8mEVcyfQhfU2kbD
         2LvTimnVNACCRPbLaF+jD8jxbsI4ehBtSeVagOMjayl2Wq7bsQK0GIm7V7Gnm6xr1zbv
         sBUf54FmlVR7Uu1bDeniVBlA/RpMesVYQXpw06/VWU5ujtU8RbvIWe/9GxgsNtTEjAN8
         L7Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xZKA16DD5aXsXwHfgNpLOQiVvBMGOsruRHXElQl5fw8=;
        b=ToeUAGaDhkY/LV5HlL+1Pff0eR0uivOiDQIUbyEDzypnG15rTtGsa4d3qLwI4veJIr
         48Qz3pxkHsdDIk+dMvK0v/qJNq9PGX6CNQwm8nHFkvJSl6qs/MTnVvhy0ggwQD1S94zi
         tNA9R6UyP/fn3GZjHS7dcRBU+nfJ1Wtsuyc7q4oqEyHoNSTsk7WUt0JTNnIhp2ZkFxNb
         6ErcsARGa4mXB0PI1Wik3+IpXIrkkJw5hWaZDYE/1+rV7x3NaAWeNb8ZdIz8ixbG+enC
         UTRS4ABjfDYGgohXFNKdVXGDC6WXP39Q/1APKY0FlchV3uAbgGAUxMtSIy3luGQsGup9
         0dBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T5m2IiNm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8-20020a05622a05c800b0031ec9fbb959si3586478qtb.338.2022.07.22.05.05.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jul 2022 05:05:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T5m2IiNm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oErPV-0003R4-Br
	for alex.bennee@linaro.org; Fri, 22 Jul 2022 08:05:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErMb-0008Nu-4j
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 08:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oErMX-0006GJ-LC
 for qemu-arm@nongnu.org; Fri, 22 Jul 2022 08:02:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658491353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xZKA16DD5aXsXwHfgNpLOQiVvBMGOsruRHXElQl5fw8=;
 b=T5m2IiNmqomNsiioLHZIYSU9RSH4w5npJwOpIC+P9hPwFBHOQdUgvHUq5dWO8ZYZkYxMVr
 mCCjn2URo8ZP/pf72/Ml7oG7APAcTBzoCct2WBDK/SZE7I2qYT3gX/tXSgenPJ2t6u1rVJ
 GYO4hxosE2h6l3WalzywsvVl5BZ8LUQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-2IdAds_4P4Cixdf3RmrnNw-1; Fri, 22 Jul 2022 08:02:31 -0400
X-MC-Unique: 2IdAds_4P4Cixdf3RmrnNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56625811E75;
 Fri, 22 Jul 2022 12:02:31 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20D831121315;
 Fri, 22 Jul 2022 12:02:30 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 3/3] target/arm: display deprecation status in '-cpu help'
Date: Fri, 22 Jul 2022 13:02:24 +0100
Message-Id: <20220722120224.2311982-4-berrange@redhat.com>
In-Reply-To: <20220722120224.2311982-1-berrange@redhat.com>
References: <20220722120224.2311982-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: nTdw24VkEdzJ

When the user queries CPU models via QMP there is a 'deprecated' flag
present, however, this is not done for the CLI '-cpu help' command.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1a8b06410e..ef4e33f309 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8185,12 +8185,17 @@ static gint arm_cpu_list_compare(gconstpointer a, gconstpointer b)
 static void arm_cpu_list_entry(gpointer data, gpointer user_data)
 {
     ObjectClass *oc = data;
+    CPUClass *cc = CPU_CLASS(oc);
     const char *typename;
     char *name;
 
     typename = object_class_get_name(oc);
     name = g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU));
-    qemu_printf("  %s\n", name);
+    if (cc->deprecation_note) {
+        qemu_printf("  %s (deprecated)\n", name);
+    } else {
+        qemu_printf("  %s\n", name);
+    }
     g_free(name);
 }
 
-- 
2.36.1

