Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4645632ejc;
        Wed, 18 Oct 2023 06:40:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWLsJA46OXPgPSCSVwYD51KxD8TLptkckB1Da05MUvHkIZsRpjLqKXnCHmCeKWi9oknK4U
X-Received: by 2002:a05:620a:c44:b0:778:930c:1e09 with SMTP id u4-20020a05620a0c4400b00778930c1e09mr1938846qki.15.1697636420684;
        Wed, 18 Oct 2023 06:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636420; cv=none;
        d=google.com; s=arc-20160816;
        b=ZSOb5P3jhXIFiUS3aiW93goSxXLmxaaVR1QeC8aHgM9IStrR2TQA/vnX3V/8jn4bwc
         N1yGwhmL/VHmyonj990XaB9E+rL/cnDJbDfSAfOXkhpu+NmmmS32XASf2yi28EVSWhmc
         v8NzL1gIhcm7gbiPz6FnmAIDLjONmPqUHywbzbOicpm06UNGXwlGNzKsNZAqpgTlj576
         kaiRFC0E1OBsnQOshtTS0Mrq5z00kBN3iUacLrJrVTofiXAVsc3Z2N5pwC3q/gngrGMN
         LF3MLTBUmX+Rw6XhFdnvkDzTyrN+jfg2x7I7yY+CZpvse5Rn3A6z+ZTEVJU/zIK2tmDe
         LyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kJiPpvjKWBAnBlGP3KkhDI2+e8BdQyJQjN7KhYL75jw=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=fJVHuDk2wI795nOR/gH2hUkSuH5KBMbp1KetG4Fe34pvRqT2fBIULb5Y2NiSDEUKet
         Ya8FmEdfXiXKcxcIinmB8tw6YTQSnB2JuxZsZagFuF2fYkcfn5+W/A+pdupr2++dm/Ik
         GBGkPq3ycf/2zQTgHFF/7p28YWxZc7i9tJPHNandcG/l0GaI04YPtJrVF99oEXCgNUBv
         v4jiMzmg40uaDII086SbCSscX551dUV+vH4y1ARJKFYShOIqZk5jXoIHC+E40NUE9Q7U
         NoO0H3Dwf2cYdSq76Lo85hPY7OOIKs8Hw8xHGvvno71+Yri5kwZ+SLASRP99OPIYA5eS
         DCMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i+ndxv6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020a05620a12f600b00770e0f570f8si2717200qkl.442.2023.10.18.06.40.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:40:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i+ndxv6I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6lY-0000Yu-7f; Wed, 18 Oct 2023 09:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lW-0000Tt-SX
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:39:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lV-0006Fo-En
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJiPpvjKWBAnBlGP3KkhDI2+e8BdQyJQjN7KhYL75jw=;
 b=i+ndxv6IyWSsleWkbk3DVD4r3I1b8a/JlY7SewN92dhxeelUzGc8nuC9c3XmILgk3dgoWw
 tRvMXP0Wzjiw6HVudfH6eX+ZX+qO4tP3ppP2wyTK66QQ9FWbz1baAu0RawNASVZ/y6HzKc
 1rCGStXkh6vlG/NE9s+yc+oDKoGQ4pw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-8i2HQ7E1N2uOJw0jyR7uyQ-1; Wed, 18 Oct 2023 09:39:09 -0400
X-MC-Unique: 8i2HQ7E1N2uOJw0jyR7uyQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35C003822556;
 Wed, 18 Oct 2023 13:39:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 760D5492BFA;
 Wed, 18 Oct 2023 13:39:08 +0000 (UTC)
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
Subject: [PATCH v4 10/19] vhost-user-gpu: skip VHOST_USER_GPU_UPDATE when
 !PIXMAN
Date: Wed, 18 Oct 2023 17:38:11 +0400
Message-ID: <20231018133820.1556962-11-marcandre.lureau@redhat.com>
In-Reply-To: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
References: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
X-TUID: lAIlgQuNDiPe

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This simply means that 2d drawing updates won't be handled, but 3d
should work.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/display/vhost-user-gpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 1150521d9d..709c8a02a1 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -307,6 +307,7 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
         dpy_gl_update(con, m->x, m->y, m->width, m->height);
         break;
     }
+#ifdef CONFIG_PIXMAN
     case VHOST_USER_GPU_UPDATE: {
         VhostUserGpuUpdate *m = &msg->payload.update;
 
@@ -334,6 +335,7 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
         }
         break;
     }
+#endif
     default:
         g_warning("unhandled message %d %d", msg->request, msg->size);
     }
-- 
2.41.0

