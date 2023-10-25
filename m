Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2968192ejb;
        Wed, 25 Oct 2023 12:10:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMzmVYaoQF2VdSz2HesvMpIk0lBqopJoYSr+MoZcy1yFubHVEVpueoGahPETyLc3okz1M0
X-Received: by 2002:a05:600c:548e:b0:403:31a:77b9 with SMTP id iv14-20020a05600c548e00b00403031a77b9mr13417132wmb.37.1698261058419;
        Wed, 25 Oct 2023 12:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698261058; cv=none;
        d=google.com; s=arc-20160816;
        b=smqzHDI8Y/8z8RGjA+sJPSOp0ys++opg9rscquIDC3dnip/ESE82uqCi3eol+/JKaf
         nP/pr/38RxKNbbAjEvxUVmXCV5qmDaPu8a2oDnXxX198RDyaEjcn/QROEpCkrm7tOizN
         qw37dZn5s6UB0AJxt0GV9Vhg+Vtd8zHdIrlTlWcbwuG9dMQoDjIUWJUh2M20Hlq4Gv5G
         wSpLieghwWZ5qgkYUycObMNVhi1vZ4oi/fARgeynRkSGMx7Cy+RB0rKHC+UsEl8Mly+U
         C5sS0G/q7zi2cf0gKsZqe8WopLV2l/I0oN36FAlayYS1/LwCI04bmHqgR3apxUKvh7m2
         youQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kXBvunPNrtg06diJOiQZetGkZ0nZzpANDn4oLzaJinM=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=lC2cCcighvYHVBSNiQmq8dZim2puGFYb/j+/O4OVhwZdL52Ws3GVsWRHjlGQsy/9qy
         Av3QN/lLZbcGlpRgluRWM/kUgwenh7Q6Vd5s+CuKmwStccykAZKHWfdsshDsKmSMHRCi
         SdEvqgeJo8vKmG40bYVqIige61YJnCEBiy6KQhibJ/6EeHBI9jrKMfrCGPHrp5EABBPb
         rnddYy4RIcs95T2tVNRRWbeNco3iLhjRdqbNhCHVIVWrGlbIMMLrcO6B6G0qZpTk/OPW
         3Lh4A4XbpkXCZhDEw5HkMlQ8yXDVPQz3OuIYxysq+0KFvDHm0g2bacjHbdxuQSuxIHNb
         SDqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fQMjU5s4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4-20020a05600c34c400b004053008812bsi390584wmq.118.2023.10.25.12.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:10:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fQMjU5s4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvjGB-0006IG-9G; Wed, 25 Oct 2023 15:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjG6-0006Cg-7B
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 15:09:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjG3-0000ax-Rd
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 15:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698260975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kXBvunPNrtg06diJOiQZetGkZ0nZzpANDn4oLzaJinM=;
 b=fQMjU5s4j8V80yRsEvLnQTQFxu9zbbsZMIItSUTMuaCDxAi3oVryW8Pm3QikVCCzu2Erqf
 aMfSW0n5YHyL2N9mWA8FBH+SrrXkyKaDqk6LmHDEEvQuHx01FYDf4VpGXvwIzsZbga2mEY
 s2uhrNKkmtg98cYapNMKxfWDEbl5g/0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-495-82FhSQ6cMbmXCKstktR6ig-1; Wed,
 25 Oct 2023 15:09:31 -0400
X-MC-Unique: 82FhSQ6cMbmXCKstktR6ig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D43E28004F4;
 Wed, 25 Oct 2023 19:09:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A49F3502A;
 Wed, 25 Oct 2023 19:09:30 +0000 (UTC)
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
Subject: [PATCH v6 16/23] ui/vnc: VNC requires PIXMAN
Date: Wed, 25 Oct 2023 23:08:10 +0400
Message-ID: <20231025190818.3278423-17-marcandre.lureau@redhat.com>
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
X-TUID: t5lkmv6GDknP

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build    | 6 +++++-
 ui/meson.build | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 2d67cbf6d6..f3fc1ba68d 100644
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
index 7c99613950..19723188b5 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -46,7 +46,7 @@ vnc_ss.add(files(
 ))
 vnc_ss.add(zlib, jpeg, gnutls)
 vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
-system_ss.add_all(when: vnc, if_true: vnc_ss)
+system_ss.add_all(when: [vnc, pixman], if_true: vnc_ss)
 system_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
 
 ui_modules = {}
-- 
2.41.0

