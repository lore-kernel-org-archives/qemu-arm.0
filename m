Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1774942ejc;
        Mon, 30 Oct 2023 03:52:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhPpekN7qSxiUOS0ZmJmbt3bkOPER6BqPs8o63UmUJd5gFktrRIJcb2qwER8bEfwrWzABN
X-Received: by 2002:ad4:4d11:0:b0:670:b0a2:42b5 with SMTP id l17-20020ad44d11000000b00670b0a242b5mr6883782qvl.0.1698663178406;
        Mon, 30 Oct 2023 03:52:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698663178; cv=none;
        d=google.com; s=arc-20160816;
        b=zFlEUXIckFQHayci1utS9BDr7oXE+b4sgFieYxGr+Ngq5Doo8k5vaRldAjGTAlFEcw
         VNcNqm+lI8y+XwOPuSlU3zCEml3iueTivizNX8x/dRle5pDqHdHWWYa2gSl0mSp0YAOu
         x99BNOiazLZE78QIb/lpvliFdruDvZ88lqKqp77+7FqgxIwc7AM7tZAhS1k2COQGqxJe
         4FFJqEjNUSVn5DQ6h2+V9blhFl6JkGYs3CuGWcA2zGtsZVjaW+EYrBKRoK11T2dAM6KT
         oSYxW42EROb8nvxoKgP0Uz6FkIPmZveMgmyhz3qYgQycYanWD1xn0V1Qbc6DIiIDgVDy
         qD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4SZ/OasRCxgbsCQYI36rdtboQkh+0BPjMMpQl7MHELU=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=eEL1NYNnvk1tM/R0WiuSMDidQEC5S3nHIzsCYJTQ6McLkS6/+GcYEiUo1rVuSNaEdy
         USgRnK6UC6yFV+GjUNEWdj3fA6J7trT3rovFR9H/XVkp6eiVrG8oyzSyHTX+74Vlvgrf
         wym2fk0vzpGETbWDReh75NjIfIGvY2KWkUuHDsb3hFAWYxBhM+Als+EhHnu5twAU8zge
         rr4YjYjBRC3Chu+any7rND7r36oss+kDhdc/ZQMRHSGX/ZZwEKQJmvT2K45rfIyiacbO
         dxU3bQzdknCF4XjMwn3ekG8lcEf0T/z1OPQHSqaVHWdYM9mSl+TJo6dF5RIi42zqfmzE
         TZMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RLlBw9jX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a0cd60a000000b0065cfed59386si5360592qvj.338.2023.10.30.03.52.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:52:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RLlBw9jX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxPpr-0004M1-D4; Mon, 30 Oct 2023 06:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPpp-00047j-NF
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:49:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPpo-0002iv-8p
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SZ/OasRCxgbsCQYI36rdtboQkh+0BPjMMpQl7MHELU=;
 b=RLlBw9jXr9PROOqOGGnD1lP3dbmkeVxPBeYye1xGCOCI1GPE9tnAcXVcIEJP6HZzOWgkrQ
 IopTzkMAg1V005i4D2vZhwr3ptYsgnc2xe7H8pAtQT4HoVeQNzxbVoI1t6YDBgnixoSzyK
 +8HDJX+8jcoxhwonySyFevRfFXtIt3k=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-350-1qId2aLuPeunESTc5LjOpA-1; Mon,
 30 Oct 2023 06:49:15 -0400
X-MC-Unique: 1qId2aLuPeunESTc5LjOpA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 503063C000AF;
 Mon, 30 Oct 2023 10:49:15 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDD39492BFC;
 Mon, 30 Oct 2023 10:49:13 +0000 (UTC)
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
Subject: [PATCH v7 15/23] ui/gl: opengl doesn't require PIXMAN
Date: Mon, 30 Oct 2023 14:47:46 +0400
Message-ID: <20231030104755.124188-16-marcandre.lureau@redhat.com>
In-Reply-To: <20231030104755.124188-1-marcandre.lureau@redhat.com>
References: <20231030104755.124188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
X-TUID: 5j0Hsd8+PDA2

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The QEMU fallback covers the requirements. We still need the flags of
header inclusion with CONFIG_PIXMAN.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/meson.build b/ui/meson.build
index 3085e10a72..7c99613950 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -60,8 +60,8 @@ endif
 system_ss.add(opengl)
 if opengl.found()
   opengl_ss = ss.source_set()
-  opengl_ss.add(gbm)
-  opengl_ss.add(when: [opengl, pixman],
+  opengl_ss.add(gbm, pixman)
+  opengl_ss.add(when: [opengl],
                if_true: files('shader.c', 'console-gl.c', 'egl-helpers.c', 'egl-context.c'))
   ui_modules += {'opengl' : opengl_ss}
 endif
-- 
2.41.0

