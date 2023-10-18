Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4645212ejc;
        Wed, 18 Oct 2023 06:39:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8Cp9+AoRQMro+ZPsacy1ZnrlHKe6RUY81ZTwwDB7ePIaMvj/Ph2VMVoZdT5/Ox8WHP6j5
X-Received: by 2002:a05:622a:1308:b0:410:9af1:f9b2 with SMTP id v8-20020a05622a130800b004109af1f9b2mr7108471qtk.3.1697636380468;
        Wed, 18 Oct 2023 06:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636380; cv=none;
        d=google.com; s=arc-20160816;
        b=ePhvIB0VWRLtGzUvLo7PouEIJE7n7YtRHQjxHaKOrBp1H9pCIshsJjc8In7qg/Vlib
         pYuAmjB2SftQOjdVi6D8RLeyXVquMg/Q72coUhUtSHzfEqDDN+x1P6sVW/aAuZHoUDtd
         hT6kdt3NeehTbUTCcc9BzXX5bhra5hCji25ODYC1kYuoZc348p5wDU1hLspPtIz840LE
         +FR71czDws+B9rQlQMcJgD542FIrW8+nVCR8ApqbSh27qs6wFvpZFT8QVku9fyuk1V2I
         +WSVbiyBpiepJ0Cp2i90gG6pU2Z4A/mj8BwDkkaF3wy9ZKbN149Sr0VvziT1rbjFjmmB
         mZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4SZ/OasRCxgbsCQYI36rdtboQkh+0BPjMMpQl7MHELU=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=TPA9eaPuu6jBcOaGfZc57Rei+ZZ5n+HySnRekDY3VUaCNiwjYyp/MJsoZ/PEE9XG3W
         gruYDDRj68E06ImuJ/5nUyc4T2m745fNWC+uGkk+yucYUf2erS/PQEfL8tLeFQSXNxGq
         IgdFc6T9MZ2DCkaQWankIQFyDn9JSfDeYpVdDu/SVTzYq5w/MTh5M7FEHzMMgQE9h6DX
         rLwacSqPzg9fLdwxCGzYISCz0bHEQV6rAR+M3NFQeqOQ3nVCIeToC5JNvrit27F++f5b
         EXp1T8bWweDdQuf6/bYIq4BmZzBLU/1LVbt7zBHkdV39/hq0PAC6lgl64AkKLCskbzw2
         yQvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LNNKYJ9W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5-20020ac84e45000000b0041cbeb04d29si867143qtw.437.2023.10.18.06.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LNNKYJ9W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qt6lc-0000hK-OX; Wed, 18 Oct 2023 09:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lb-0000fU-Dt
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:39:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6la-0006GU-1U
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SZ/OasRCxgbsCQYI36rdtboQkh+0BPjMMpQl7MHELU=;
 b=LNNKYJ9Wg/414up2MJl6bKhBxbuad76httG+JZNI0FJ6uuW0xG58lgG/yPXvf9oo4ZqXM9
 BvAPdpd+lr4dHcMOh4+U25AmkyCoVZXMugOMCf4iRd92IuTgO2+VdEkcHw5LwIJV0B37HA
 n9GqRURI3Mnd3Dr77Y7815A++JxLonI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-D_qAgDXyOCeEUCtIF0O1tA-1; Wed, 18 Oct 2023 09:39:14 -0400
X-MC-Unique: D_qAgDXyOCeEUCtIF0O1tA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2EE0800C7F;
 Wed, 18 Oct 2023 13:39:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A63C81121314;
 Wed, 18 Oct 2023 13:39:12 +0000 (UTC)
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
Subject: [PATCH v4 11/19] ui/gl: opengl doesn't require PIXMAN
Date: Wed, 18 Oct 2023 17:38:12 +0400
Message-ID: <20231018133820.1556962-12-marcandre.lureau@redhat.com>
In-Reply-To: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
References: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
X-TUID: JL9qtkRbJpv0

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

