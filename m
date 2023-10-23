Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1292103ejb;
        Mon, 23 Oct 2023 04:33:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENLeH599iLOe3K6Jbq0UkMNX0ffvvY/FcTHgcYAQcjrMKi7BuaVspTpg7wy2mK84iHKCZP
X-Received: by 2002:a05:6830:22d0:b0:6bf:df7:10e9 with SMTP id q16-20020a05683022d000b006bf0df710e9mr8513466otc.36.1698060791715;
        Mon, 23 Oct 2023 04:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698060791; cv=none;
        d=google.com; s=arc-20160816;
        b=NRSUL1nUeXMpBuGfemv+8Npvq+qSYAqHj1xkiEvupCuGbcEiyn4tNozIsTux7IaPtM
         i2F+fnySylDTes2YnLmbkvsqqYSZ0BxRC0QaLpWRIOAg3aZCm3Bjl9OZW5WoiEwM9Oy+
         fJ7lnuF3wTM0qnLYkdJ/d1s/ChIAeyutX1aKLVOnFVxD3JHU/m6OpBnDxkGGu5lB29q4
         oJQIyCW4/J8kh2dkkZZa/eIs7cExad0TpNEHAMEy2kSAM5eM5R5kSx6ieFgmTJOJEJkA
         wy8eUs3eiG1wUI3sKcT/8iBEaxtzGRtCZ7LNeOHtBHXp3KvOAm3uf+ORNClCfGxH0yxT
         NoDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7pFx8OjbRdAHlpNrklCTgs/z7S8EcxiTChsaP+7sE6o=;
        fh=r4fz3Foqx0ggjO5oI8v2vjNw5kzcdWLA6oCTkzfSTUk=;
        b=eyKjLzRmVW82kuKlBSTlCPPkNSn+eDkmlbpDRpexXjMaBJC/7hucun0zfaItxkrCq2
         S3xl6PpcE4+SFTCyvgZz/I3c9W7aN9bH8tA6WqQw/avDROI7o02/dV0/hw07UgAHwicz
         NKqI/WjQzIfNgnUrD1myh9Wsxsu1ITGFI8xYgUR8XHdFdCXJCof3fVvo2rmUN7iEnIxn
         IjT92RrcaFL1gMKi+t90OYJmk/fcFICh1XHtZ0oOoML0DgLw5AxgMamENVwkNdOlwjic
         1IL6BrKl8mBxqAemw3kkh/y4Xxjf94Sb5AOYcu6AbfCsiZwl4hXN9lzVwhUAbAzzTxcn
         Kirg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QMGYOh9f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id nh19-20020a056214391300b0065b21835750si5492973qvb.91.2023.10.23.04.33.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 04:33:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QMGYOh9f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qutAJ-0000cG-Pi; Mon, 23 Oct 2023 07:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qutA6-0008TG-Gs
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 07:32:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qutA2-0003fu-QN
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 07:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698060713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7pFx8OjbRdAHlpNrklCTgs/z7S8EcxiTChsaP+7sE6o=;
 b=QMGYOh9fcb5tRT97RU1eR5hBOMwudzwLCHsebmO8ZaeIMKik7VfOjz2fs2tLBcMCGiQqHU
 mhCfQnLiLbyN10N5d8I+jCvFS9xpIHl2t6f8bWulPzoVPbhqUE/XgOXz5/T0oEKCIleamP
 5M7diqZtR+lQUAARDrxuXbFhZlQXN8w=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-t6NlI3QPNjurIiz10Y9Pug-1; Mon, 23 Oct 2023 07:31:45 -0400
X-MC-Unique: t6NlI3QPNjurIiz10Y9Pug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F01093C14904;
 Mon, 23 Oct 2023 11:31:44 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D85740C6F79;
 Mon, 23 Oct 2023 11:31:44 +0000 (UTC)
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
Subject: [PATCH v5 12/19] ui/vnc: VNC requires PIXMAN
Date: Mon, 23 Oct 2023 15:30:39 +0400
Message-ID: <20231023113047.2572137-13-marcandre.lureau@redhat.com>
In-Reply-To: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
X-TUID: 1sIhhE9SNUbM

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build    | 6 +++++-
 ui/meson.build | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 395d7155f6..c4dd9e01ea 100644
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

