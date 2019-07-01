Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2604173wru;
        Mon, 1 Jul 2019 05:33:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzVAutDPzlQZna/PLFNsG1jGPz3RV7rIkGvkUWsbDOAM9BubeET5n/rWDwocVJusr2ibn0s
X-Received: by 2002:a50:b147:: with SMTP id l7mr28728607edd.65.1561984433266;
        Mon, 01 Jul 2019 05:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561984433; cv=none;
        d=google.com; s=arc-20160816;
        b=g+AKlk6PLxuL8jvSY0m5MHxMS33xsgmpEeCr64qN8Ji/NNzg5uleuWvnHLE3/RJNk7
         XRuVIluq5pdy8OQiiGE8vWcNYVm54Q3veFJ9pzSz0jHB9rVQeiWk3XtLLkFemw2sIjW3
         g0qO/0ZTtj0iQdve2gffXl+/XDfT8XRq9RGPDJW5YCjRl1ZvkzQlsPTnmVgn7CuAi6FY
         2zuaKMoAKMwRaVvlf4Z9RCoSEKebu4i/mUF+/fapd3I0l32nUH0r5O+bs+mny8I174lh
         zMp4hWBv35LJcI7ZX3axuBDisWPDMiHgQDzZDwsQl2iA7WytFTesNqmawrDFLGDGCpdX
         Cwkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=FezsFqbp1yWJjUDvYFhYnXdMlcCbSoPlhTsPSL5mtgM=;
        b=zX7WgxbxZCOssop4CkTx/2Cq1P6uCaiQxkzTuplT3iUmmKR1aTXfEASLfC8U1q9F2E
         YE9HQ0eOqbHZNI1vEqFGPL8JSVUwpFgJPwU5gGNCaDV8iAGe8x7nAnlJnGZh+lDZud0Z
         WG157DPxesGMEGQ8A56LqK0k6YM0h5RldJSq0GnE8Vh3b4xHNqJMpta16EVqHRw1rZbt
         HIaU9ZfyEatPxesTPA3myfS2Ucb6UlOqClIGUVs7I4J2omCavviASSGYSuvAE/bYe6lv
         YGZwO1yx3L6APueDBi+bwklEU2QMNKOFqZ/iHJpBxLVhNgPck737bacgT9e8nSJZ5WsR
         O+dA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10si7201774ejn.365.2019.07.01.05.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 05:33:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhvVI-0006iO-A7
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 08:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57744)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hhvTQ-000682-O7
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:31:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hhvTO-00033h-L8
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:31:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47532)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hhvTH-0002kR-09; Mon, 01 Jul 2019 08:31:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CFC213082A8F;
 Mon,  1 Jul 2019 12:31:38 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B68917D32;
 Mon,  1 Jul 2019 12:31:32 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 14:31:05 +0200
Message-Id: <20190701123108.12493-4-philmd@redhat.com>
In-Reply-To: <20190701123108.12493-1-philmd@redhat.com>
References: <20190701123108.12493-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Mon, 01 Jul 2019 12:31:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/6] hw/arm: Use sysbus_init_child_obj for
 correct reference counting
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OjOm8Ns7Yfm2

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and object_property_add_child()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now object_initialize_child() instead to get the
  reference counting here right.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/exynos4_boards.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index ac0b0dc2a9..5dd53d2a23 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -129,8 +129,8 @@ exynos4_boards_init_common(MachineState *machine,
     exynos4_boards_init_ram(s, get_system_memory(),
                             exynos4_board_ram_size[board_type]);
=20
-    object_initialize(&s->soc, sizeof(s->soc), TYPE_EXYNOS4210_SOC);
-    qdev_set_parent_bus(DEVICE(&s->soc), sysbus_get_default());
+    sysbus_init_child_obj(OBJECT(machine), "soc",
+                          &s->soc, sizeof(s->soc), TYPE_EXYNOS4210_SOC);
     object_property_set_bool(OBJECT(&s->soc), true, "realized",
                              &error_fatal);
=20
--=20
2.20.1

