Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp297119ejb;
        Tue, 10 Oct 2023 00:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGom0DMISJ1iDdkDun585nrzYk/PAZENl+pK+QOjpxcST57g2NVzr4QlN9Koc9IWAUabjJ
X-Received: by 2002:a05:622a:1898:b0:417:f9a4:b169 with SMTP id v24-20020a05622a189800b00417f9a4b169mr18503798qtc.26.1696923638542;
        Tue, 10 Oct 2023 00:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923638; cv=none;
        d=google.com; s=arc-20160816;
        b=mYJYoS93roD4l5wwXkyRQ3UGeEgAJRXYJGhYnCrgLfJT25FVjsT+LXnEqABbM1Jmni
         I1vlX7iLwC8Il7zbZ1Fxm/USOXO9skdeUhFZahQncr+ZFMmIom5SubAvDcUMLQWEWn3S
         kC/WMZUQ9Ll0pvyyAXK8lWNUVvVnkwY2Hn2nCLWz8oeA7o9nQBCRXCGuKa3mbFyeaZ92
         8JB8iIVDzpygAsxkufhcAcZDBUmiSbiGM/GVEsNrzfzb5UnEEc377vnnExTDCIFFfa+S
         faD/q5pT01mST6effdkaTqGqdKz58RvPPlco8QdUlS6AGXR2bKKvY3IHaE2Tkd+kZAX4
         /ynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t2z+Jyqs3B+QrIMXiV5YUpL+rrIemvToEH1MmhrX9vA=;
        fh=46wv1No7OOLuZCRbeGSaV31Ktmo6cwaISz6jgi4/xrY=;
        b=ZFGnhL6wdKgvWT5MNcZDSZJgW3cLG7Z8GS27CRC7zYNRiXrJNdRy0P9tDmcA2gqmRL
         f7eCCFBPVxTP2TVBNY02dDPwM5/0fCiN2bGIxB1tga/hiqo20nAsDIbKs5u+OaEXFaD5
         l9TZkDEtb0wrsoahmMFi0jbEHrnj6GaXbBZ7qhGxv6vobliYKDomZZFp9wWbIV7obaEP
         rfKtz9h2ue5GqaNPSou6QYHRv41MCyI0fSQgZXfU36ngNyUlC9AZtFisvTBAq2CbFYt9
         cgUq+6r40ijA8HXf3a8f2r9p00o4/ieq9leKrtKcYzaeba161m38s4lai8RhC8FP5tO4
         K34A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BcDJ5vdp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4-20020a05622a188400b004108cbf61cfsi7280265qtc.175.2023.10.10.00.40.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 00:40:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BcDJ5vdp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq7Kp-0000fI-AY; Tue, 10 Oct 2023 03:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7Kn-0000dX-A5
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7Kl-0001jB-Vj
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696923555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t2z+Jyqs3B+QrIMXiV5YUpL+rrIemvToEH1MmhrX9vA=;
 b=BcDJ5vdpEIbhPGL1fNtpWXTQ2MBoxuGDmfD59zavXO7HJbpAHOHMucyirEdL0o+ZVEAMKh
 zcpsMerqkR8ejkx0siCHFLELYDRtXK7JCVbiZKRddx1myKdHrFabWmt7MOgGV6OPaVULrc
 W562zNJFYpY1PAeqrtA5Lu2fMWCiJ0g=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-F-Qp26oaP1uTu0rBBox6fw-1; Tue, 10 Oct 2023 03:39:01 -0400
X-MC-Unique: F-Qp26oaP1uTu0rBBox6fw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C8283C40C0C;
 Tue, 10 Oct 2023 07:39:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C4E149BB9A;
 Tue, 10 Oct 2023 07:38:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 06/18] qmp/hmp: disable screendump if PIXMAN is missing
Date: Tue, 10 Oct 2023 11:38:18 +0400
Message-ID: <20231010073830.606570-7-marcandre.lureau@redhat.com>
In-Reply-To: <20231010073830.606570-1-marcandre.lureau@redhat.com>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-TUID: f2rcv0ywzeOt

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The command requires color conversion and line-by-line feeding. We could
have a simple fallback for simple formats though.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qapi/ui.json     | 3 ++-
 ui/ui-hmp-cmds.c | 2 ++
 ui/ui-qmp-cmds.c | 2 ++
 hmp-commands.hx  | 2 ++
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 006616aa77..e74cc3efb6 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -200,7 +200,8 @@
 { 'command': 'screendump',
   'data': {'filename': 'str', '*device': 'str', '*head': 'int',
            '*format': 'ImageFormat'},
-  'coroutine': true }
+  'coroutine': true,
+  'if': 'CONFIG_PIXMAN' }
 
 ##
 # == Spice
diff --git a/ui/ui-hmp-cmds.c b/ui/ui-hmp-cmds.c
index c671389473..26c8ced1f2 100644
--- a/ui/ui-hmp-cmds.c
+++ b/ui/ui-hmp-cmds.c
@@ -437,6 +437,7 @@ void sendkey_completion(ReadLineState *rs, int nb_args, const char *str)
     }
 }
 
+#ifdef CONFIG_PIXMAN
 void coroutine_fn
 hmp_screendump(Monitor *mon, const QDict *qdict)
 {
@@ -458,6 +459,7 @@ hmp_screendump(Monitor *mon, const QDict *qdict)
 end:
     hmp_handle_error(mon, err);
 }
+#endif
 
 void hmp_client_migrate_info(Monitor *mon, const QDict *qdict)
 {
diff --git a/ui/ui-qmp-cmds.c b/ui/ui-qmp-cmds.c
index debc07d678..d772e1cb7f 100644
--- a/ui/ui-qmp-cmds.c
+++ b/ui/ui-qmp-cmds.c
@@ -212,6 +212,7 @@ void qmp_client_migrate_info(const char *protocol, const char *hostname,
     error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "protocol", "'spice'");
 }
 
+#ifdef CONFIG_PIXMAN
 #ifdef CONFIG_PNG
 /**
  * png_save: Take a screenshot as PNG
@@ -391,3 +392,4 @@ qmp_screendump(const char *filename, const char *device,
         }
     }
 }
+#endif /* CONFIG_PIXMAN */
diff --git a/hmp-commands.hx b/hmp-commands.hx
index 63eac22734..c343d82fbc 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -252,6 +252,7 @@ SRST
 
 ERST
 
+#ifdef CONFIG_PIXMAN
     {
         .name       = "screendump",
         .args_type  = "filename:F,format:-fs,device:s?,head:i?",
@@ -267,6 +268,7 @@ SRST
 ``screendump`` *filename*
   Save screen into PPM image *filename*.
 ERST
+#endif
 
     {
         .name       = "logfile",
-- 
2.41.0

