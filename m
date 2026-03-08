Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A2CEA8541
	for <qemu-arm@archiver.kernel.org>; Sun,  8 Mar 2026 20:37:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzKqc-0007I0-Fl; Sun, 08 Mar 2026 16:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqa-0007Fr-TE
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 16:35:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqZ-00045R-Hc
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 16:35:32 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439b9b1900bso5417327f8f.1
 for <qemu-arm@nongnu.org>; Sun, 08 Mar 2026 13:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773002130; x=1773606930; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGa+Qk9w7jO0yb09YCUU3MEUEX2jrREiC7pzktGBq9g=;
 b=WpeSB+xPA7eTCjTbiNfNBL5Nl2d3gfJWuT1Osj8ZBhl4D57QmnWV4uGcLnL2CGDzJh
 JB6KDJ1vdFsbQna+x/34y2actYmKAkb5pArxuPjFWOOzcRgVpX4JIFLTKbiG/dy4GNiL
 ZAdmZEOgau6AYTORViBYtxFNsPKT8SrFBnnRbZErokzyuArelOoQmCH8bEsRrEhDbrHS
 IZbXG9pIgoHj4Q+cwfpblrd1agJR1qTgZgKBEaKz6BbwbvZsIxg7jI8XNUDIoAlq4QlF
 M/xh5UMz4beJap0vuBJta9SPX9qRsieAv7+4h72dCBdSlEDFxsyY1btFBacDKF5QIl64
 fj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773002130; x=1773606930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rGa+Qk9w7jO0yb09YCUU3MEUEX2jrREiC7pzktGBq9g=;
 b=WB1QrD8KStnHTpVZdaTtYvlMg02N18xusIw8xKij0H1mVLg2AZOFghiy34eTnhEB5W
 OPhFLHjrt14LOYipdXyXbcigXJ4gYxQ8nufYo3DDLcXlM0Hr8ClopilF7J5eUOkAELw1
 uPKrey3oYwoK3Wbnj2k/3oNhBvRxBSFpaZmHaTvWSRsVCuFbY31T1RE9hncGhS7Sx60Y
 ZZycxq9L4SEt9jsAJ4TSOThbUqs9cNucxQ1dP/SZwOCHyJLZHW07m34hUs//XyasQwyz
 eZF+3EKUDmwYetpeRx16pnS935W4lqcLrdZ51GN/TZLsh+Zc6mI/jvwkfkRwHPYaA4f4
 Ti/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUQoylVI47oiIx316KQSbCJC4g715kvsmAs0NDiVTC08d9WFr7M+hrzUaTgj12j46uWJr5j6Gybw==@nongnu.org
X-Gm-Message-State: AOJu0YwSmMLhSKe5NlQc0FfzFPZFqvw43NmhODtC4brUz4xYAnBIZQgo
 xF8uzCAvGlFLgP6qj2iwjaY/rCRYjtdT0gmMYQd5pcV7StpkQ/1/Qyg2
X-Gm-Gg: ATEYQzwM2m9EIcwr1zjfCji88HRUA3hs9Mp+m6kcB4Xbi1WR2rb9O8uisZnJlmhVGDF
 E4I7Z/0/stfYty55KRI8NvyHCsJLyC+UEKQ3ExXePKuhg0SGnQgpUgeiv7MHKUWZscBVE1cXTsY
 MB6NL6uetv7iRGeUhJyKIOhY8LvCM2UNRO0qZSqAnnDifx0gFEs+tZ8yEOe2jSh4JJR1mtk0ws4
 VkszVojLnm99SnWLBiGMfw9iW5R41Fxr3dXXJ28GM0p0jEgTOdH+n7TxX7tsokXOjOanqkfg+5+
 9Mff/vLwqJ75swC76HrHH7mfDLLju5iJKaaTWqTiCkAU+JzAaLuqf2Ok2wAdtRTqeObWUZ9g0aL
 AEK3eMd2RdMToPCoX3KzHca+gvPGf4/yGU08akAz6Huf/9DD+Zk74FeniSLtotFTiGHZMStaZV5
 vFZCqpKZlLQdZhIo3c98OS+5rhC5yURrSzfBu3KLVp33ox6JHxPdbz2C/taI71m5oitlHTxfc3o
 fBtFxOFIBUYUqkVVdblLEm5CbSHslM=
X-Received: by 2002:a05:6000:4313:b0:439:a95b:3c43 with SMTP id
 ffacd0b85a97d-439da65e31amr15851395f8f.21.1773002129604; 
 Sun, 08 Mar 2026 13:35:29 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-25c6-8f00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:25c6:8f00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2bdf8sm20995508f8f.25.2026.03.08.13.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 13:35:29 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/5] system/vl: Fix reference count of machine object
Date: Sun,  8 Mar 2026 21:35:15 +0100
Message-ID: <20260308203516.160103-5-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308203516.160103-1-shentey@gmail.com>
References: <20260308203516.160103-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

object_new_with_class() and object_property_add_child() leave a reference count
of two while the QOM root is the sole owner. Fix the reference count to be one
by calling object_unref() once.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 system/vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/vl.c b/system/vl.c
index 38d7b849e0..91b390dafd 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -2197,6 +2197,7 @@ static void qemu_create_machine(QDict *qdict)
     current_machine = MACHINE(object_new_with_class(OBJECT_CLASS(machine_class)));
     object_property_add_child(object_get_root(), "machine",
                               OBJECT(current_machine));
+    object_unref(current_machine);
     qemu_create_machine_containers(OBJECT(current_machine));
     object_property_add_child(machine_get_container("unattached"),
                               "sysbus", OBJECT(sysbus_get_default()));
-- 
2.53.0


