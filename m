Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1106928lfg;
        Fri, 5 Aug 2022 08:20:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6hsCNuon9ILUX4kHrjLQRHaqHWmDBnrDAt+ky/4A1s9LEOv3ON+UOX2Fa8TzGoh/yMPq3e
X-Received: by 2002:a05:6402:1d4c:b0:43d:debb:5667 with SMTP id dz12-20020a0564021d4c00b0043ddebb5667mr6988059edb.140.1659712845170;
        Fri, 05 Aug 2022 08:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659712845; cv=none;
        d=google.com; s=arc-20160816;
        b=wSHtEcly4Wrms2Hru64jMWotWDH1BxOigW5IoydiHJwkeHee4Ct+ZKMf6Ko0GheORk
         cfQxZsQM8MlHsCZrWXtrd+tAz4u0TjBzRQDfd2KSEvH5Imn2lD9lgbq4JEUj4USI08rV
         k3tWayo7Zy5Cfp1ZglHrl5CT03i52Qb2+LXnXiyOQbIAmKOtCkPLhRHnhwAyNvrZc7ya
         B3dgkK4F800aahsUlX9tw3xANAcj3PjWX5b1JaldMzf+/LtzZPDOxYqRx3Eq1YPNxZfh
         ptaPsSpWWYoz9LDU5fHOWcuPNfkwYok7dBlStSOxWBSwpk2vUMdeESzOS2XLjdBvBHYS
         LmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zbkrAPg+IoDH3/j0b+xGddH732Y0wt599nfHSMm17i4=;
        b=z0zAhl/pc4UaNBbRvjKtFzn/LLa+GiY5fw9ToymO8oAKenuGi0XHXmgaDvHhyXIz+b
         QkhLzOkgj+8QKgTbkYuH6X9ptosvEHU3406FfHI0PuQ8u9J1eqISjANK/TejxGUT8ITK
         gMJT6pD3Dd4DZAk9Kda5OT+zp7anQt0xo0ZBwVWXzancZ/n1w/07KYPJuKLZfj4RLmhs
         JQxGZUqKwb9PfjWsLGe8UZJVKwy3WaFN2iFDf3QdTnZZBfa671gquLh9dj25wB4muVHY
         TcNa96tKDCDb+PWLHgEzRc3gyuZl8cNgBHZxw5USAXw36U2TN/xklTCVbvHZiJm6zgYJ
         kZ2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AnLkyJZY;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t13-20020a170906178d00b0073094d10c95si3472238eje.706.2022.08.05.08.20.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Aug 2022 08:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AnLkyJZY;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659712844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbkrAPg+IoDH3/j0b+xGddH732Y0wt599nfHSMm17i4=;
	b=AnLkyJZYcHZKs0I+r0eFHZlv+aDhCkBUHQtU2OGObLtH9U9nVWNpJHulr6hCXJfIevaFbi
	YclhcgneWi8qAcyKmgkO0slAPC8zrEZjzSpvvpa6PwXAs9sWZ3zZvxIuX2pchLy41EHe7c
	O012bkflHV3yjnR0GFHpm0d2KiVspCU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-c6eRGdMCPLCa5b0kyNqdHQ-1; Fri, 05 Aug 2022 11:20:40 -0400
X-MC-Unique: c6eRGdMCPLCa5b0kyNqdHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E9CE802D2C;
	Fri,  5 Aug 2022 15:20:40 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B5B12026D4C;
	Fri,  5 Aug 2022 15:20:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL 5/6] target/arm: display deprecation status in '-cpu help'
Date: Fri,  5 Aug 2022 16:20:13 +0100
Message-Id: <20220805152014.135768-6-berrange@redhat.com>
In-Reply-To: <20220805152014.135768-1-berrange@redhat.com>
References: <20220805152014.135768-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-TUID: /RSE7NZ2tBfu

When the user queries CPU models via QMP there is a 'deprecated' flag
present, however, this is not done for the CLI '-cpu help' command.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e1bdc80c35..d7bc467a2a 100644
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
2.37.1
