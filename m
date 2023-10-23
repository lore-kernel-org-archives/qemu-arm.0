Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1291999ejb;
        Mon, 23 Oct 2023 04:32:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF8yR8O6NtE1sRaBHjru6DKwGGDS1ZA6hA3lypVJGMbw/tJOcNYsvAMkGUAqqAZ9r+kYmF
X-Received: by 2002:a05:6870:f146:b0:1e9:d158:7e85 with SMTP id l6-20020a056870f14600b001e9d1587e85mr10899498oac.30.1698060777680;
        Mon, 23 Oct 2023 04:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698060777; cv=none;
        d=google.com; s=arc-20160816;
        b=ZIWECBmyHV9SYvQu+DEht9ZHB871n+o+KqvTnqzN9Y6hV0Pvww3syO7GYDqlUePB1l
         J3LAj62myYmJY+txKVv0gYTF3Yr7AFwJpLKlANJukE73ofRtZTzdpWrdZqgj8dpGRrOK
         9oJNk+hhmrDItZ9U+EFb5FG3mCy1OV53MzqHHK9zJUuw3Gd4l1bUX0HMOOE+j1mNssts
         XrstIyMFMMOH8QbCM/FzHq+/QlkprIjJMDKBR1uRPJkQIbwwTSWoHvlUpWPu7+HPH5Nb
         VBjAFuCQMrrRJZJVEDgLv3D7Ef6vNd2kO9GivcYeO098VwVW1tcoPB0u5/Mrl6YQuZus
         G9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4SZ/OasRCxgbsCQYI36rdtboQkh+0BPjMMpQl7MHELU=;
        fh=r4fz3Foqx0ggjO5oI8v2vjNw5kzcdWLA6oCTkzfSTUk=;
        b=GcLEhCw+6Tvm5WlknsxjEg9DxvYCJb+ylEQh0nn1gDzhPp4ZM7QvizNydXome7ayOR
         TjVHO9tPmbDHl8c+WFSAOU9iDIWOxtc+rJZUoNYy7lyuuizg+4EQFo8S0MYZvjbfwPIa
         ys93XmC08bUjcj8kpt9Lpg7cgPRW6k1/BQckZ9QKpoNBLaSM1sMEvoRd2H7iKvtumkWn
         uUXMcGigK+lXvFk2VU2XBWFecCaxOoL0kEqcM+qxB07Vm7c/OsAcptfyaZXCQHp5VEIJ
         jt01mEt6HrGTrMuRoTl4Mt9cHwb7OW44C/x037zLxD02ZeUgrXe25bdBKM+RbZ0+Lksz
         OqQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a6Yi+dSh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6-20020a05622a14c600b004199296c9fbsi5036254qtx.713.2023.10.23.04.32.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 04:32:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a6Yi+dSh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qutAJ-0000c2-82; Mon, 23 Oct 2023 07:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qut9w-0008HX-Cl
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 07:31:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qut9u-0003eb-Lm
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 07:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698060706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SZ/OasRCxgbsCQYI36rdtboQkh+0BPjMMpQl7MHELU=;
 b=a6Yi+dShfR4YZVNtQVfPqUQLcGxkami2DqAJzrF/f/bvXuxJI0uOal0PQtHkyFMbkVF/wS
 lWwGemiRRBtRa9UvwawAizk+5AW4AYVzjpTwVdOFaEwrTGNj2yZYO4Py+XJy52o4ZR+zF3
 SGHP1eUQ13FqHBSTXmGO8oXKJgNFiMo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-EgcZDVAlPMuHBPMmQmcERQ-1; Mon,
 23 Oct 2023 07:31:41 -0400
X-MC-Unique: EgcZDVAlPMuHBPMmQmcERQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E1E41C0636C;
 Mon, 23 Oct 2023 11:31:41 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87061503B;
 Mon, 23 Oct 2023 11:31:40 +0000 (UTC)
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
Subject: [PATCH v5 11/19] ui/gl: opengl doesn't require PIXMAN
Date: Mon, 23 Oct 2023 15:30:38 +0400
Message-ID: <20231023113047.2572137-12-marcandre.lureau@redhat.com>
In-Reply-To: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
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
X-TUID: 7qcVJWHeWWil

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

