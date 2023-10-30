Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1773834ejc;
        Mon, 30 Oct 2023 03:50:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC3dsfT56uOViXQ77bLMdvX5bRm6MvAP9sBOzN86IzdSPhDBKjdTtPGo9JMzBBH7T3m+B+
X-Received: by 2002:a05:622a:15ce:b0:417:a514:72cd with SMTP id d14-20020a05622a15ce00b00417a51472cdmr12821415qty.19.1698663024655;
        Mon, 30 Oct 2023 03:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698663024; cv=none;
        d=google.com; s=arc-20160816;
        b=u2nydG4WihwAVKc6uxtzJWPyaudfn+MJnoVQ7Y3mwoRMOMeeIJRZ5BDkHaYAbuEdhq
         VTciN5ZCxRNTJs/ehaUiWOv6HptME6NB4NQMDYwSjqDrqpY7BuAIbnHWy/KRPa0czf0H
         zDnd8nnaBsZh/hAJdWq2L7DeeicpMGyN/uInvnFpwFmmzwrg2Jv5MS2UInuesf7fH/cK
         MYqvrUY5YNolEahXm44w7PCqZpjwl6tQK8fydzuLLfxqjKGP9735O9X+WZnN3iOzuRw/
         QqiJB20FAfCxjZtiCZ4NwqHFAgf5EbunvnK+cE5+5MRKsjhqj1N8htW1NGWvf58ZZi6w
         iqEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LW9Q6HUwTBSWEYBKDcnLAGqV7TDghC3wekacCLuoge8=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=qSnioj2otLjsbCMU5IFK6SsonrLXIodlCNzkRN5E4BLiwt0ctzodCgydxBIQo83jTI
         qoBfELOeraNb6tokKQS6nBpOpo224z6uvnEjSvjvwabITeR8swpXYfn1r4+M6QdkrStL
         X05SWC2crdkgSqnksw9dR9JKg36t8x7Ip/d/5N8ZdbWcf58IQmIYymIF//otcaIkdeO/
         lB5NxhrYfP5w27dSKjxQXT8x8a9kzZNvrGJqvm2ff2+VVRGH9Dy/lp94pV7P5RGxzsrT
         FO3DS4PA9OyZlK/lK34LmS2rYFguzfHQ0qnLZWg8W0op6rVw+fAUragoyfacOQ7LLSim
         kkvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="a0YW8lc/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21-20020ac85755000000b0041cbeb04d29si5240541qtx.437.2023.10.30.03.50.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:50:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="a0YW8lc/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxPod-0001WH-Hk; Mon, 30 Oct 2023 06:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPob-0001Vk-Pf
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:48:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPoa-0002UJ-Aj
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LW9Q6HUwTBSWEYBKDcnLAGqV7TDghC3wekacCLuoge8=;
 b=a0YW8lc/BYufDWlPpbppdfrGXSFuwWKGv+tH/RamkB2XyUbtRKUScaheURqxsksRAauk+5
 et/gq5qn+61hJQwY+0jsWwhVCscESmToZNmrop6DMaV6f9/wfa6O3fkyxTgm6T5OKp6oNz
 KMjQESTClhGhjxt75b99EHiAvKoS5mg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-pbJW1nGjP06z2ryRFRVjAw-1; Mon,
 30 Oct 2023 06:48:10 -0400
X-MC-Unique: pbJW1nGjP06z2ryRFRVjAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A944E3C000A4;
 Mon, 30 Oct 2023 10:48:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8401F2026D4C;
 Mon, 30 Oct 2023 10:48:08 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v7 02/23] build-sys: drop needless warning pragmas for old
 pixman
Date: Mon, 30 Oct 2023 14:47:33 +0400
Message-ID: <20231030104755.124188-3-marcandre.lureau@redhat.com>
In-Reply-To: <20231030104755.124188-1-marcandre.lureau@redhat.com>
References: <20231030104755.124188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.478,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: k/KjfsI4tDw3

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit 236f282c1c7 ("configure: check for pixman-1 version"), QEMU
requires >= 0.21.8.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/ui/qemu-pixman.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/ui/qemu-pixman.h b/include/ui/qemu-pixman.h
index d37feb5e3c..4bfa8fae0c 100644
--- a/include/ui/qemu-pixman.h
+++ b/include/ui/qemu-pixman.h
@@ -7,11 +7,7 @@
 #define QEMU_PIXMAN_H
 
 #ifdef CONFIG_PIXMAN
-/* pixman-0.16.0 headers have a redundant declaration */
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wredundant-decls"
 #include <pixman.h>
-#pragma GCC diagnostic pop
 #endif
 
 /*
-- 
2.41.0

