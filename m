Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4647849ejc;
        Wed, 18 Oct 2023 06:43:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENDGeegdkCveDskgvWL7suXLeO/OQgewzdUmAy72rH3dAeyJpRysyQQxVRlnjWZ1jD9TtC
X-Received: by 2002:a05:622a:4e:b0:411:616a:4bde with SMTP id y14-20020a05622a004e00b00411616a4bdemr6809036qtw.18.1697636618662;
        Wed, 18 Oct 2023 06:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636618; cv=none;
        d=google.com; s=arc-20160816;
        b=X3Af7erXG4Ff0t4ME3zIYBozZ31J2ZlbFaPup6VhbGI2Lyper1waa/5xmo2YsOSapB
         /dSSomYlu2bhs77IzpvK9kFwm3TfUZuFqYiAAQ7TuxvJapXfag6J7kDU2BuTmGg6P/2L
         VdHDz++s5lWns6QV9So6eL6u66y8h4zodFb2feuN2kfQn89z8UxRog6/oZPMt3CWUIbS
         StaZUo8b0iMr4YBXd2Bu7camImoLe2WcXuInAfBHyxDbP4KYRVnlZjCYn7l9qQ/omDFv
         LsTVcTp9F2OVLDZTG+05onuGQoYkgBTUoWmzi4zPhvD+R8Sp/0KhsPTsMzVHowq369e0
         Gmvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9xiPkDwW4YkG7ODTMfUJxlrZqpvsyeqmc2HYAjzgiAs=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=BFUa/qLvXNGNBpt/bEW9tz3djDrUERfi/Zcoh+d1f2XLmhQrMqna5ou/S8cvNXhjMl
         iBxKmBrJB8NeNcjQo2TM/n8XeqTiwtX+Y3yHpPUpsR8ZdufoM14YpyY8RZD+t+w1ex5X
         ZKpWO2vaHmG/jE3qTnurRs55bh9GsR3i9BwViJfV3BQCCc/ogFz9nSFAOVtXzhTLqJ+0
         emA4broxolFX9zayV6ZUyEaW1SkbcsfWVnvfL2SvBLbg4N6TyDHthOgv+isJq9wBJD3Z
         9chInpw5M+9PT6BRTi+ueEngbJ7x95zEcGMzTwnkjPys8sODPdySoV0cpnHLuFEHHfxH
         3GWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CHwvFeef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020ac84e86000000b004197ddb7c46si2978333qtp.764.2023.10.18.06.43.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:43:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CHwvFeef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6lh-0000mZ-QL; Wed, 18 Oct 2023 09:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lg-0000jO-IC
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:39:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lf-0006IH-4Z
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9xiPkDwW4YkG7ODTMfUJxlrZqpvsyeqmc2HYAjzgiAs=;
 b=CHwvFeef1HdhQG/MIvk8AmegvvLOp7ZyUf1mvmW+PPCQ7tSWasRkehX9I6ArdofdMVCORX
 2p7hl8ctn4SXC69MylRiL96EbZxPZIPVZK7+UovCo8cw0ttCjNsiHZTbBJescj42Jemg7t
 YbWtFkyAAQcI4PzpUUuWO10ms4891pA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-8iC-RyPZOAWFjAbbvTtK8Q-1; Wed, 18 Oct 2023 09:39:18 -0400
X-MC-Unique: 8iC-RyPZOAWFjAbbvTtK8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E394917701;
 Wed, 18 Oct 2023 13:39:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B78C31C060AE;
 Wed, 18 Oct 2023 13:39:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v4 12/19] ui/vnc: VNC requires PIXMAN
Date: Wed, 18 Oct 2023 17:38:13 +0400
Message-ID: <20231018133820.1556962-13-marcandre.lureau@redhat.com>
In-Reply-To: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
References: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: GRBj954K+Csw

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build    | 6 +++++-
 ui/meson.build | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index ca17c213d3..87036496af 100644
--- a/meson.build
+++ b/meson.build
@@ -1536,7 +1536,11 @@ endif
 vnc = not_found
 jpeg = not_found
 sasl = not_found
-if get_option('vnc').allowed() and have_system
+if get_option('vnc') \
+             .disable_auto_if(not have_system) \
+             .require(pixman.found(),
+                      error_message: 'cannot enable VNC if pixman is not available') \
+             .allowed()
   vnc = declare_dependency() # dummy dependency
   jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
                     method: 'pkg-config')
diff --git a/ui/meson.build b/ui/meson.build
index 7c99613950..b3525ef064 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -46,8 +46,8 @@ vnc_ss.add(files(
 ))
 vnc_ss.add(zlib, jpeg, gnutls)
 vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
-system_ss.add_all(when: vnc, if_true: vnc_ss)
-system_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
+system_ss.add_all(when: [vnc, pixman], if_true: vnc_ss)
+system_ss.add(when: [vnc, pixman], if_false: files('vnc-stubs.c'))
 
 ui_modules = {}
 
-- 
2.41.0

