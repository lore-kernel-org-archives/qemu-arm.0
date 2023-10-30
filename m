Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1774886ejc;
        Mon, 30 Oct 2023 03:52:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL/TD2Z2+KI6SET+cH8SkvY8BNE6wcBkzUPfcQIcpRBNpXhULt2m4XLNh1y4sdY5nt2R4C
X-Received: by 2002:ae9:e207:0:b0:779:d0a6:2e4c with SMTP id c7-20020ae9e207000000b00779d0a62e4cmr8293217qkc.34.1698663170201;
        Mon, 30 Oct 2023 03:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698663170; cv=none;
        d=google.com; s=arc-20160816;
        b=t/ih3NqhN5C5kCYybA1Nu9frJz+abk+b1eeI2V07LfNv5PNsDB45MPthlKiqvOJzdQ
         6smJEet4pTc41NstBZGqdSZ0d2dxO71zXIlbEHmvtzSE56+aZXPK1fWE/Vxxuj4SNTig
         nc8feTnF2Il3pLjnCdxfrM/10Vx2t7fyyCs6RCCutA06EGdrAIyYGIK2DsLuy5kEf5AW
         AQ3nAHBmoiyjJePJQ+/1rPNNxtQwMV2ZvOvJNUMUTAm2jABUqpEzDwnOcpdu9/FYNI4L
         kvgXLRNhJuMxYwlY8BcGJ/UhH0/1xyeacmVoQzdK/jbK5917j3hEKF+5cnWS3OBmKtyL
         Nh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=p215YJfBCgBuS+AJUxu3e1OmUp7cHqzC4FcP7j4krGM=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=otm7ZPBZgzhM8xyqkqMkh4X9mlhLw+mXwf2MDbJ3Bn6PHLN9HWE4WZoU5PABJspldR
         ZbRFBJDKn2EUkGG/DZXERUpTIzhebnPRmmHDftQiTmMHOWBjK4yisoe3k1OwkRhsWbt+
         jCcDcx5JX+uMKJDaK9jfy9sz1HEdQ71QVb3+uBBTSPPGljj1ljHVaRGh0p3O5s0/Ab1l
         h3PRaR86uN5ldCiNt/5h2SyBBW9hDBrCV0u24VJvPMVHVwH97R1zGbmF+LBxkRtr+NOr
         h0iFPNDHNBlmyrKjuv6foIgycW/CzTpkgJylru5Lx1Dtx4F6vS153Qbh/C+mYzb+16Fu
         /10w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZQA+ABN8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16-20020a05620a0c1000b00773b3e7fda1si5147207qki.555.2023.10.30.03.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:52:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZQA+ABN8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxPp1-0001e1-CM; Mon, 30 Oct 2023 06:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPox-0001cs-MY
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 06:48:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPov-0002Y8-4r
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 06:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p215YJfBCgBuS+AJUxu3e1OmUp7cHqzC4FcP7j4krGM=;
 b=ZQA+ABN85V4pWMoW/FoE3PYZqLNYkRmH3mXekt5wuydltSVafKbx484mOXSOXQaCXf/JbJ
 DwfHxyRwVXFlvTabg/IqiKhP/Gu8WuzmSmpXRS1O7/Xi8SMYCeWZGvP8mhAdWkcX+K0DVM
 j5LD+GOYEAzwA7N9ASfK2ZdLpqHymoo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-B0HgQSSZPruAz5HLhsBsMQ-1; Mon, 30 Oct 2023 06:48:31 -0400
X-MC-Unique: B0HgQSSZPruAz5HLhsBsMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B924580F83A;
 Mon, 30 Oct 2023 10:48:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D80110EA4;
 Mon, 30 Oct 2023 10:48:28 +0000 (UTC)
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
Subject: [PATCH v7 06/23] qemu-options: define -vnc only #ifdef CONFIG_VNC
Date: Mon, 30 Oct 2023 14:47:37 +0400
Message-ID: <20231030104755.124188-7-marcandre.lureau@redhat.com>
In-Reply-To: <20231030104755.124188-1-marcandre.lureau@redhat.com>
References: <20231030104755.124188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
X-TUID: b+GVY1Eee7rZ

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 system/vl.c     | 13 +++++++++----
 ui/vnc-stubs.c  | 12 ------------
 qemu-options.hx |  2 ++
 3 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index 3be1a78a9d..de6df188da 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1095,13 +1095,14 @@ DisplayOptions *qmp_query_display_options(Error **errp)
 
 static void parse_display(const char *p)
 {
-    const char *opts;
-
     if (is_help_option(p)) {
         qemu_display_help();
         exit(0);
     }
 
+#ifdef CONFIG_VNC
+    const char *opts;
+
     if (strstart(p, "vnc", &opts)) {
         /*
          * vnc isn't a (local) DisplayType but a protocol for remote
@@ -1113,9 +1114,11 @@ static void parse_display(const char *p)
             error_report("VNC requires a display argument vnc=<display>");
             exit(1);
         }
-    } else {
-        parse_display_qapi(p);
+        return;
     }
+#endif
+
+    parse_display_qapi(p);
 }
 
 static inline bool nonempty_str(const char *str)
@@ -3344,9 +3347,11 @@ void qemu_init(int argc, char **argv)
                 machine_parse_property_opt(qemu_find_opts("smp-opts"),
                                            "smp", optarg);
                 break;
+#ifdef CONFIG_VNC
             case QEMU_OPTION_vnc:
                 vnc_parse(optarg);
                 break;
+#endif
             case QEMU_OPTION_no_acpi:
                 warn_report("-no-acpi is deprecated, use '-machine acpi=off' instead");
                 qdict_put_str(machine_opts_dict, "acpi", "off");
diff --git a/ui/vnc-stubs.c b/ui/vnc-stubs.c
index b4eb3ce718..a96bc86236 100644
--- a/ui/vnc-stubs.c
+++ b/ui/vnc-stubs.c
@@ -10,15 +10,3 @@ int vnc_display_pw_expire(const char *id, time_t expires)
 {
     return -ENODEV;
 };
-void vnc_parse(const char *str)
-{
-    if (strcmp(str, "none") == 0) {
-        return;
-    }
-    error_setg(&error_fatal, "VNC support is disabled");
-}
-int vnc_init_func(void *opaque, QemuOpts *opts, Error **errp)
-{
-    error_setg(errp, "VNC support is disabled");
-    return -1;
-}
diff --git a/qemu-options.hx b/qemu-options.hx
index e26230bac5..edc8ca6e30 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2424,8 +2424,10 @@ SRST
     OBP.
 ERST
 
+#ifdef CONFIG_VNC
 DEF("vnc", HAS_ARG, QEMU_OPTION_vnc ,
     "-vnc <display>  shorthand for -display vnc=<display>\n", QEMU_ARCH_ALL)
+#endif
 SRST
 ``-vnc display[,option[,option[,...]]]``
     Normally, if QEMU is compiled with graphical window support, it
-- 
2.41.0

