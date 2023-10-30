Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1774568ejc;
        Mon, 30 Oct 2023 03:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaIP8uFCzYSLJliC2GQ4bMFCiNP9a5t4M8am3QLgYp/ooEz4ueUT3oeI49bZeUT5lJvB3a
X-Received: by 2002:a05:620a:4244:b0:77a:8e1:8413 with SMTP id w4-20020a05620a424400b0077a08e18413mr10720282qko.50.1698663119926;
        Mon, 30 Oct 2023 03:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698663119; cv=none;
        d=google.com; s=arc-20160816;
        b=jFlAtHRsOhGkodJM28t4c5QqL2otOvylpn6ZF9U4j4LU7YwG5KNpuNZ/TW2ihfVFRy
         /ryNd95ahLK0SlC6Qczck06MS7rTDt9lRUuKv1yfrsBWwpghFIwTJjclItjdiYJYPrxm
         ZuTMBMyANkxrrZDt/X/JI0DYteMHI4doy2nugkMXLMxCDyvWYEZxDdq3pRuKgeb83FVe
         mJTibyh8kIW1UEWDAQwf3leC6/VR+S93iRkeWaY72XxEN5PklYzu8VlZoIfEahsQ2FHw
         dmDFmtBfDk/qIRzDclJI7QFliDq6EzyBHWABWl4Qq8Qz8NP1p30FgBRr6PG5BaXI/Nsp
         aeZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6kBUA9yGxtLPPI3qJQwdmQleDbF7xoQOdD4TcKeoWhI=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=SIM0U2BnZsPz60ulAi4Kqs6AshHVP+LCGH/NkuweSzLnanINGyqqy1EV4b/jMOse7n
         8z+XscW4E40leGlwk4h/n90vhAYlCMcN/7CyMeUYr64ZLAxYk5v5fOsE3V7BZw4kKPVC
         FOE/zoWXJTqjbA/PGzMSbEGjQh8WTofyelhqP70w7gRoSwbC+zXCSO7WlKPCnHjErMr3
         G4NNHWGIIOQoOFCB27daYm72io3FLqKnQgMAks6wYBeslvwskxoIfzECnmvIa5pg32kD
         0hvJeaWaciJfsoLFPifgioCi/tWggGJ3PWf7RFNztCyV33UH0aqjXAaGGNf2rCPLAVr6
         waUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ayvV7eS5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c28-20020a05620a201c00b0077a0cb448a4si5325287qka.95.2023.10.30.03.51.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ayvV7eS5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxPqM-0007ME-OC; Mon, 30 Oct 2023 06:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPqK-00079n-Cv
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 06:50:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPqI-0002nw-RM
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 06:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6kBUA9yGxtLPPI3qJQwdmQleDbF7xoQOdD4TcKeoWhI=;
 b=ayvV7eS5g7AyX2rcQm3AYyyjnnVoQLMI35ejohqPBt9713k/1vzQ66oWYGJodzgiQuqRXv
 2as/nmvnCqMtKucBAx4yVYJ2kTCBku338c2AsJs0FitR6oaSmUbM6sQq998WNnrGKFn1Oj
 NctLHvBPpY/srZ1od6i6UNvG2VhbeBw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-55-zmeCfCnWPUiParjc2x7q_A-1; Mon,
 30 Oct 2023 06:49:55 -0400
X-MC-Unique: zmeCfCnWPUiParjc2x7q_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 848A53826D23;
 Mon, 30 Oct 2023 10:49:54 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 939D040C6EB9;
 Mon, 30 Oct 2023 10:49:53 +0000 (UTC)
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
Subject: [PATCH v7 23/23] build-sys: make pixman actually optional
Date: Mon, 30 Oct 2023 14:47:54 +0400
Message-ID: <20231030104755.124188-24-marcandre.lureau@redhat.com>
In-Reply-To: <20231030104755.124188-1-marcandre.lureau@redhat.com>
References: <20231030104755.124188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.478,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RddQs1hdQ8nw

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meson.build b/meson.build
index ad1e0155ee..a35cd860aa 100644
--- a/meson.build
+++ b/meson.build
@@ -817,9 +817,6 @@ if not get_option('pixman').auto() or have_system or have_tools
   pixman = dependency('pixman-1', required: get_option('pixman'), version:'>=0.21.8',
                       method: 'pkg-config')
 endif
-if not pixman.found() and (have_system or have_tools)
-  error('FIXME: pixman is currently required')
-endif
 
 zlib = dependency('zlib', required: true)
 
-- 
2.41.0

