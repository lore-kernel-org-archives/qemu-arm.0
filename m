Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2969893ejb;
        Wed, 25 Oct 2023 12:13:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3uPUowYdZmIP3vK3qXRTPBQnPkYj4d/szpbGgHBidO9STt8zxPU93cfoFQA73QvqSCMIq
X-Received: by 2002:a05:620a:460b:b0:778:ba73:1650 with SMTP id br11-20020a05620a460b00b00778ba731650mr13507793qkb.30.1698261231016;
        Wed, 25 Oct 2023 12:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698261231; cv=none;
        d=google.com; s=arc-20160816;
        b=gBldWYHCzpPhp+CCRTvFFMMiW8yrX+rq76XtrQVB7yUFN+sBPCWGxzkvgB1s5J4e93
         huPuQffJT4AEKkRI9Z9NI1ZOgrwlohQOLBqztQsTIt9l+FGLxgX8rrdbvVTitoZmWk33
         Yt64HY2WecOAd2Oe2XV4u+fkXAxQ/4pEvDFV9ZaRFHRJwqCLwMolEHRWv6reL6mwShWZ
         iDZAjWLoO8BW/F4hsn6Mf+6/zk0v0puWuufVK8wUrjZLbzAK/tiXgAQoA513pdV+WYgl
         KJrdE/PRGLHQYU/LPKvL9Z0kC/DlNAnkOANZFVMm8Tsln5+C3TJ4TYIixciwG0xNAtXN
         K53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gjhKYVrmUXMpGz2SjWJ5wmLkXqZYNQfoSw4IEKXRdY0=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=I93QsvY0cVCE2kGRfIpShZEeVH/EjsK5zmi6394Hob5ZWwdSWizG1Wfsurs266rZyw
         pRgCdHzBLtNmSsuaXSqY6K3pXkJ0x2GbeKmRxsj+oUdEu+JYvMagjTvuDZEn4s3hYCRz
         5BUxgn7Q+XI4h8CHcD5EMTcp05VCx5bvdUjik37ZCThrd69SYhiANZv5jrr7nwFBCP+Y
         5raGmNoddirk/jhZiOfNH+JQF+a1YGsTJqzTlS3DFEpOLnGtrAOuR3bYtYcoeDl3FaEH
         o3mxCMx46qTJWZFnzGXQDYkdKdqYL06r+FlDwIehPHbhYNVKb34NvmsvIoJhoovNtl86
         B3nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CtzZm9s8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6-20020a05620a28c600b0076f17d9dc1asi5754371qkp.493.2023.10.25.12.13.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CtzZm9s8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvjFo-00051d-TA; Wed, 25 Oct 2023 15:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjFi-0004s7-Su
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:09:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjFg-0000Rm-CD
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:09:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698260950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjhKYVrmUXMpGz2SjWJ5wmLkXqZYNQfoSw4IEKXRdY0=;
 b=CtzZm9s8/tYCGrYSojRSQ/ugpe07fidv9EFTjHTkjOJlc3vOrF6wVzPXoCRPS17rY/L0u0
 faDnFGxQzeVFIAmnG7wr2IcNcIL5cy89ULBbF0S76He85m7i/ybtWRJMklR4ocoIiacxJd
 xxFPMNVD91rvpAJp56UiiAisTbjShzw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-cgpSNhauP1KGXVbFJQNbTA-1; Wed, 25 Oct 2023 15:08:57 -0400
X-MC-Unique: cgpSNhauP1KGXVbFJQNbTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA209101A590;
 Wed, 25 Oct 2023 19:08:56 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2438502B;
 Wed, 25 Oct 2023 19:08:55 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v6 08/23] vl: move display early init before default devices
Date: Wed, 25 Oct 2023 23:08:02 +0400
Message-ID: <20231025190818.3278423-9-marcandre.lureau@redhat.com>
In-Reply-To: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 1/ZfuHFUnoUB

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The next commit needs to have the display registered itself before
creating the default VCs.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 system/vl.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index b07805d476..db4d5ee79a 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1352,6 +1352,23 @@ static void qemu_disable_default_devices(void)
     }
 }
 
+static void qemu_setup_display(void)
+{
+    if (dpy.type == DISPLAY_TYPE_DEFAULT && !display_remote) {
+        if (!qemu_display_find_default(&dpy)) {
+            dpy.type = DISPLAY_TYPE_NONE;
+#if defined(CONFIG_VNC)
+            vnc_parse("localhost:0,to=99,id=default");
+#endif
+        }
+    }
+    if (dpy.type == DISPLAY_TYPE_DEFAULT) {
+        dpy.type = DISPLAY_TYPE_NONE;
+    }
+
+    qemu_display_early_init(&dpy);
+}
+
 static void qemu_create_default_devices(void)
 {
     MachineClass *machine_class = MACHINE_GET_CLASS(current_machine);
@@ -1401,18 +1418,6 @@ static void qemu_create_default_devices(void)
 #endif
     }
 
-    if (dpy.type == DISPLAY_TYPE_DEFAULT && !display_remote) {
-        if (!qemu_display_find_default(&dpy)) {
-            dpy.type = DISPLAY_TYPE_NONE;
-#if defined(CONFIG_VNC)
-            vnc_parse("localhost:0,to=99,id=default");
-#endif
-        }
-    }
-    if (dpy.type == DISPLAY_TYPE_DEFAULT) {
-        dpy.type = DISPLAY_TYPE_NONE;
-    }
-
     /* If no default VGA is requested, the default is "none".  */
     if (default_vga) {
         vga_model = get_default_vga_model(machine_class);
@@ -1937,7 +1942,6 @@ static void qemu_create_early_backends(void)
                      "ignoring option");
     }
 
-    qemu_display_early_init(&dpy);
     qemu_console_early_init();
 
     if (dpy.has_gl && dpy.gl != DISPLAYGL_MODE_OFF && display_opengl == 0) {
@@ -3666,6 +3670,7 @@ void qemu_init(int argc, char **argv)
     suspend_mux_open();
 
     qemu_disable_default_devices();
+    qemu_setup_display();
     qemu_create_default_devices();
     qemu_create_early_backends();
 
-- 
2.41.0

