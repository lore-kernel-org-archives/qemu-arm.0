Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1774871ejc;
        Mon, 30 Oct 2023 03:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWismu/ks71EjWwriM/3ttmgz/bumYfj0dOjUF1s5B4dEbS/wH5GmX6TnIf80dV6bCFiJ7
X-Received: by 2002:ac8:7f83:0:b0:41e:204b:f931 with SMTP id z3-20020ac87f83000000b0041e204bf931mr12813576qtj.42.1698663168320;
        Mon, 30 Oct 2023 03:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698663168; cv=none;
        d=google.com; s=arc-20160816;
        b=BYBAeRtYzCSUlQs/+UlrxPg4xozy/+FUfw1SvOWxablhM3Aq2z6qhrEOezYGs+2Itw
         6B0oi0EpaT6ZFx7DLKlJvXwiunw6GKSVqJXP01etMONerHPzjQheyFH0OC4j1lWNFPFd
         QcRtHvnxzUgpeHNSynTGKSemCLb0DBdAwKZu5cKCHYx+0z+aFh8apuShfisMbWbYC6lT
         e60fl+4X24CJ3r3JDHaQhQSubHWcQab/qGFjo5Y7jSoKl9BZn81ZezLWSwZ2d9lL6Mip
         rrLwhH2yJeD6LwDI1JuooojzOjpHhbc8/FB1AcHzPAHZJxPdeL3aZETEBcELTDiWoLae
         kmqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lJbN66is0rq3NleJYaE0Jf3JCOZlcB7xHJzQcJyNAwM=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=pTgvYd/srcbrKdTyTgbsbsfxcLuWAKOqc16Yc5KNEsLziDgHBZCrGJrQdxqBtt4R0F
         i8U+3aupCTI5JODm7PhNoc69p3p1wCkDX49/b0ntx5aA1GJ0SMXZ3WR2a9I9QrdP1lMe
         6p2iV3ZAPpYyKqVfte6CwK0rzdnNCR+sDsB7oVhmSXXxk3M7T4MX4c6dN917gaWwuuTM
         pz063NrDBXPxuFUj6x213035FWoSx0egmpYHS49xEgsRxqgDehcUih48cFQQFBONi/J3
         t98C91USdbIzHeBtMVyIZ2f+2ePB+AFQ+wBB6SzuaVLxJmz7jsx4jM2j5to34ZAlQP8z
         PPhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MhcQMoBO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020a05622a119100b00403ea9c5354si5319971qtk.435.2023.10.30.03.52.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:52:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MhcQMoBO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxPpr-0004NP-R6; Mon, 30 Oct 2023 06:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPpq-0004GA-Bh
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 06:49:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPpl-0002iA-NS
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 06:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lJbN66is0rq3NleJYaE0Jf3JCOZlcB7xHJzQcJyNAwM=;
 b=MhcQMoBOxgNa4uN4J0Yz+Ya5jabqFvagNFVqMWdUZ++wo8aJ9BHNEOlduRyuDyrerbrGyx
 MvWlIqEk6CX1O7NPncUmm/lloTMi84YRzCb/n4K8EVLWJt2Yt3uHInQpLRzzvO8pCrLzgP
 I7j2Ioo6YM96EL1zViv1Rz2N9FSsYBM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-SzMYJDXINgWKXMhTRe3n6A-1; Mon, 30 Oct 2023 06:49:20 -0400
X-MC-Unique: SzMYJDXINgWKXMhTRe3n6A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42DF4811E7E;
 Mon, 30 Oct 2023 10:49:20 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F258940C6EB9;
 Mon, 30 Oct 2023 10:49:18 +0000 (UTC)
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
Subject: [PATCH v7 16/23] ui/vnc: VNC requires PIXMAN
Date: Mon, 30 Oct 2023 14:47:47 +0400
Message-ID: <20231030104755.124188-17-marcandre.lureau@redhat.com>
In-Reply-To: <20231030104755.124188-1-marcandre.lureau@redhat.com>
References: <20231030104755.124188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.478,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: N42yxT+8YpjM

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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

