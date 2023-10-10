Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp297094ejb;
        Tue, 10 Oct 2023 00:40:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTrz9eOiUtfHH5x2deq6JqTKdhpmhtbJ6UwWdzVMggMwDEwzXRzyd0IR/F784Ljv+ozsBZ
X-Received: by 2002:a05:622a:1388:b0:418:1194:42f2 with SMTP id o8-20020a05622a138800b00418119442f2mr20914801qtk.46.1696923632512;
        Tue, 10 Oct 2023 00:40:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923632; cv=none;
        d=google.com; s=arc-20160816;
        b=HJYP0dqVQnBYedYLt5vlMSxLgfqJuOj1LXGBTf2WAqXDhe/BaSPm6EtV/+ulpv1dkj
         rj+ssZi5rz00TNGjJF4yKMRvES5qHxmv9vXv0G9gvfhbqq/cnXTV8iCa56Pq6MsQeZgO
         KZMJoDvP2c6RzlTka9C1jAzSv9TApHiyQc23FhUmKiyJPB8RsNXyWY+9vTgV1mIoqNEu
         +TdYef66KcEXJkwGTfI9svEMVgoA85npVoB5wRUul0CJyoVyqbKIJnJsfXjUNnF0q1/u
         Ymo5LD2jznIKwTnBrHwxaBi88QI3hB4zE8vZuJyyC0p4ayFFHd6JLZnjr0ylWY6vOVPB
         vrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Hbsn4rTGgQj0//AeZ8bh7v4t7ojgUd1qBUk6GwwIL1Q=;
        fh=46wv1No7OOLuZCRbeGSaV31Ktmo6cwaISz6jgi4/xrY=;
        b=ciLYDKB10RxcaKKV7HWAro2tKkfSr7J0VgXu5g6z7f3d0zzxDeNZjvZ4oVz62/psjc
         vWQQrCiHhjawvsfDvntBgp2Dl+XxBv6W+s1Zl8HQ2Yk+ws2+EtnfazgmQy1zm9rzQwvL
         jODF3f6xK5tp26gtyhVsBtZmtnh2/NVL5H0vC1NeA1ulBhPyX2ye9o1bt7GHdBW6AOv/
         GhtwbfZIM0n9hy0sGb2uVIUl4qIqgGEjfzgOI/nFNB6Yk1kvexcl0pzjCBNOJ2gvMHMx
         bGP39zM+L5F3bTTyypMcFrRXBwaAbzavowIkx3mrO1dx2TXhFH2cSOhQwMc34KcJ/REO
         rBMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fTRZL4Qj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a05622a00d200b0041996c8044dsi7193475qtw.307.2023.10.10.00.40.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 00:40:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fTRZL4Qj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qq7L0-000198-UA; Tue, 10 Oct 2023 03:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7Ky-00013e-OR
 for qemu-devel@nongnu.org; Tue, 10 Oct 2023 03:39:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7Kw-0001mI-FH
 for qemu-devel@nongnu.org; Tue, 10 Oct 2023 03:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696923564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hbsn4rTGgQj0//AeZ8bh7v4t7ojgUd1qBUk6GwwIL1Q=;
 b=fTRZL4Qjhp9WHTyjCbuD5LnzbnKYJ2nJLlm6FR3kbaPRbWDsQPtvXSVRlmJlWOQphwd77B
 KgY6Kmvql/WRtTlYvK/PTKS+Q87vvmpk4kuISIyiye5qSuZAc24vS/WvZzYYC7t/O5srXy
 JgFJ6apNCwMTdV2RpXXvAoLkSuUldmc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-RhjS6utfPcSkjAygSjrcog-1; Tue, 10 Oct 2023 03:39:21 -0400
X-MC-Unique: RhjS6utfPcSkjAygSjrcog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BFFA817050;
 Tue, 10 Oct 2023 07:39:21 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A84D1C060DE;
 Tue, 10 Oct 2023 07:39:19 +0000 (UTC)
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
Subject: [PATCH v3 11/18] ui/vnc: VNC requires PIXMAN
Date: Tue, 10 Oct 2023 11:38:23 +0400
Message-ID: <20231010073830.606570-12-marcandre.lureau@redhat.com>
In-Reply-To: <20231010073830.606570-1-marcandre.lureau@redhat.com>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: h51Fv0p5qgUN

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build    | 6 +++++-
 ui/meson.build | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index c30da15ce6..291c2f1301 100644
--- a/meson.build
+++ b/meson.build
@@ -1530,7 +1530,11 @@ endif
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

