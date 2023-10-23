Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1292652ejb;
        Mon, 23 Oct 2023 04:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ+tff/CzVRXhLklgouNTi/b1jXO1kb+nIY9twS//KNjc1o6qnsZh9sS1q856ObiYNXrJl
X-Received: by 2002:a0c:b254:0:b0:66d:138f:95df with SMTP id k20-20020a0cb254000000b0066d138f95dfmr8938504qve.56.1698060849395;
        Mon, 23 Oct 2023 04:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698060849; cv=none;
        d=google.com; s=arc-20160816;
        b=hbrQsrIjE/b+IlW2VCsJRgR4yGbDS0+NPGSzW5SoMqT2gtGiyQwkBvfYUq7Wxfjvpc
         blhAwx29PTvp52mFpIgBckstTM69qiWb8YvGJPhMpMAxSc0/CElYGEHjdmq5YKhAlt2g
         7FPr+AdRYBLFCjJNY7QXPycWp3L9kya3sZAIEd+YP8kFZW5MmJhfbAv25Sb0L/lRU+/R
         oypjTxGdYbgFE8iGZWruNqzBrb6bhdvpVrM8CR73+mfKj6hcWw7tipG0J6O/8bKKzQW+
         gLatJ1Tb8x6JQGoTGEOoYUOkDoHVt3duaS6K47pz7G7BTZMtp8IoegHkNcvLoPQ5Ia5P
         lPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t2z+Jyqs3B+QrIMXiV5YUpL+rrIemvToEH1MmhrX9vA=;
        fh=r4fz3Foqx0ggjO5oI8v2vjNw5kzcdWLA6oCTkzfSTUk=;
        b=icwB7YTByCPP7LynsEKogKtzyJCb8fw2UJnnHtMtiDsVI+xGegRZWW8Ih/ZiQC685N
         OQC0HryZwIgp1vnRfi5nrXkpccA5NZv9bAzmWZF9JrsmBhB484JRBis399Jh2TyzaA9Q
         1acFt7ShgyX+8E6lwVkpzpxsGLx5vKGi+5DdGhTtmzmjJYukU2KpHt39VJRIooYfATus
         FDBHykEQnXR62W4Vs+uB3eCX8r9H1zmWA9GJQ8pVK0mB4yGMpeMhcFKBH+/eZg2YrCGK
         UPoCMImHsw0ge6msZ8UAGOtgncTuwMynJ0CPpjTATpsEkZuxlOMcSmGofH0cUVuPVnSR
         sIGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P6UUrWlG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020ad442b4000000b0066d15c73fc0si5265352qvr.120.2023.10.23.04.34.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 04:34:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P6UUrWlG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qutA2-0008RU-6S; Mon, 23 Oct 2023 07:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qut9c-0007jX-RN
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:31:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qut9b-0003ZN-9O
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698060686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t2z+Jyqs3B+QrIMXiV5YUpL+rrIemvToEH1MmhrX9vA=;
 b=P6UUrWlGtqEPYXmEkSY3x4AoyJkni0+speO1l4QFH2l3PkoX8dBy71tu9uvli9KtfO3yGE
 6E2Z/54EFwtHPOAXo2W1auTIbMlNB8yup1qb0ITCGT37vN7RPsm9ql8axGOFwuVXw3S9zR
 QrWeftxe2Rvsz++JpEaNDmg0eFxZcsM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-up_zgFQjNlWUDtoipxY0XQ-1; Mon, 23 Oct 2023 07:31:24 -0400
X-MC-Unique: up_zgFQjNlWUDtoipxY0XQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10941811E96;
 Mon, 23 Oct 2023 11:31:24 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBF6D8C0A;
 Mon, 23 Oct 2023 11:31:21 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 07/19] qmp/hmp: disable screendump if PIXMAN is missing
Date: Mon, 23 Oct 2023 15:30:34 +0400
Message-ID: <20231023113047.2572137-8-marcandre.lureau@redhat.com>
In-Reply-To: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: Td7CxTnNvN+d

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

