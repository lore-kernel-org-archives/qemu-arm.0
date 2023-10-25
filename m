Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2968349ejb;
        Wed, 25 Oct 2023 12:11:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc9v1LENHsT8fQrwTSVkdUN029TBE/kMZ6+NI7vr2hVHnQUfkzlxiJopjHP/oeVM1iiDoE
X-Received: by 2002:a05:600c:1f83:b0:406:411f:742e with SMTP id je3-20020a05600c1f8300b00406411f742emr12170124wmb.34.1698261072149;
        Wed, 25 Oct 2023 12:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698261072; cv=none;
        d=google.com; s=arc-20160816;
        b=SbUjgEwlQmNu8xO64zNvTbaRNef+Y3NF1oVFnDIUhTsoTziVu9rR/EgYX0DotvGbln
         wvOD9uzeETT4CtQdBglmneqYys2C8akDIhXiVZmgyCAiAb1lc8uiFjZH2o+WhpKqAjK9
         V0Nkz2cCWVmaUOsvrxKaVtd2G4lzYk2Ar2+dLnVbCP9RZyrTc95817G00ifuM24DlI3i
         5Uk2kmlOHYJLeOvQDaQ/D/EmstuLNsX+XpzdJSzeyG0D9j81duNNrP1PyxEHKlr0wiTE
         W7WsR/185nSjr7FjUSK1l0i7Q+hLiFSLhnHeKvcuSCspT25ZsrS8jYKsZx+1hv+6yzZO
         TPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FVzDTsXd5QyMtpPb6c5mbwdCotGhvC31n5l8K5iZ0ik=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=FTt6hk8N33Wce94HmxpIMCik7bA29ApD1IJd4RAk+14jtAkNwEG7ExojuAQ3KNNQHO
         +PzcVc2DT9stF7L5v4UGOgh11LsRzT0oIDLE9/zaZZm8MrPpUBsMDtnIInaKIbfQnOv/
         e5KF4WaW8MNbLc/yV93onuS65tahX1DEnrvOMKhvcsc+9gFRYIm2m62o0dzwmrIb61WC
         uQH8jxZ4+Afzmz1G/l4VD8VlyRLjRKDQWGQoiVLEG542x0auXu5QZpDybmeCFHthQ7us
         Eda47ok+expQq3eAlpr+jejUsjFHB2dgkOs26A4mgu3AcCpWRub7sw4wAA/67wMUGwIA
         ZeHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Z/5c6Evb";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020a05600c474800b004063e52f935si398325wmo.58.2023.10.25.12.11.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:11:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Z/5c6Evb";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvjGk-0007Cb-CD; Wed, 25 Oct 2023 15:10:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjGi-0007Bk-HI
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 15:10:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjGb-0000wL-FC
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 15:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698261007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FVzDTsXd5QyMtpPb6c5mbwdCotGhvC31n5l8K5iZ0ik=;
 b=Z/5c6EvbLN8qpbM2dFIMmBPJifi9G6wqTDplEk6dNQtpVXEXzVpY29m9rus3MlSalhnPen
 WAJFD55zu4hAqgozD9OXyx50t2YpgobUCV+RcjLfByp+OTzHcDzdAGRTKAYz6VaR2HNmUL
 M3l6h+IjcCNowwSXQARoTGDH3mPWjpg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-182-aTfRCCo9PdCt6URMfKau0A-1; Wed,
 25 Oct 2023 15:10:01 -0400
X-MC-Unique: aTfRCCo9PdCt6URMfKau0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CB2E28004ED;
 Wed, 25 Oct 2023 19:10:01 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23E5240C6F79;
 Wed, 25 Oct 2023 19:09:59 +0000 (UTC)
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
Subject: [PATCH v6 23/23] build-sys: make pixman actually optional
Date: Wed, 25 Oct 2023 23:08:17 +0400
Message-ID: <20231025190818.3278423-24-marcandre.lureau@redhat.com>
In-Reply-To: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
X-TUID: sJeguwTkhY/Y

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meson.build b/meson.build
index ad1e0155ee..a35cd860aa 100644
--- a/meson.build
+++ b/meson.build
@@ -817,9 +817,6 @@ if not get_option('pixman').auto() or have_system or have_tools
   pixman = dependency('pixman-1', required: get_option('pixman'), version:'>=0.21.8',
                       method: 'pkg-config')
 endif
-if not pixman.found() and (have_system or have_tools)
-  error('FIXME: pixman is currently required')
-endif
 
 zlib = dependency('zlib', required: true)
 
-- 
2.41.0

