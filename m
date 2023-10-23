Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1291849ejb;
        Mon, 23 Oct 2023 04:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/UVe4QcDl/x9fmwJDPTDIF84zbNpfLDVKTzfWaeT4inAZ+9NB+JqcE3eD6RckK1tRR7GF
X-Received: by 2002:a05:6830:719d:b0:6b8:9483:35ba with SMTP id el29-20020a056830719d00b006b8948335bamr12974907otb.24.1698060762332;
        Mon, 23 Oct 2023 04:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698060762; cv=none;
        d=google.com; s=arc-20160816;
        b=VfTF1PiUI4z2jAtlyOhi4lfOnSTwgFtZrygt2bUz2x4IVlLOumyIkgV56edJTb9TMk
         KJH/i1d/61pQuCxQwiz6bOAnefw+XCyObZJS2AVWfoPj0hdHOIolSFemww0JLxNu5M+3
         TrYIMyGczJCCd3HS1+xY9e6Tyz86F2SgpQ3iGO2IBRxepelmqSb4HSLuyvvG1WDkI9rh
         gcNf3ecF3eU9JKKTMY7yWnlPOu1zQC/yKB8CqwPmQSQUIles33kue3+T1WQkmHm6cyYR
         DpPTQR4SvYp2C18t7xqDkNl1b96kd7m/82ii/ZlFmqbsXNnEHY6p0XYsdjwOEDtyj08t
         kIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kJiPpvjKWBAnBlGP3KkhDI2+e8BdQyJQjN7KhYL75jw=;
        fh=r4fz3Foqx0ggjO5oI8v2vjNw5kzcdWLA6oCTkzfSTUk=;
        b=Mp9dp9X8ez2/1cs4BqI9j9LRcaqM36Fgv+i9IpSZRE6Mf5kZlH76BLXPzJSPQlkvFx
         AC5V/CAuDEOS0i06tsTyBg0XT9LAJ9SSHxQu0EGKFfsqfAuqqrrr/xCMxq4omLyYFUF9
         l5Lw2wSqDisu8otGsdC1EclwKU422YuTbvOjSGO+NYxQk2+PjRW15SIAFIcj5tHhVALp
         vSkVVVs5KXuiwIRd3vu5J/3AuuPQADRTFPrJOp4fLP/bnuj0yvDukGxE8dLT+HHSEThK
         yKhW+LL6AVfVJ29ZUyrezVic4GtpyKz/v7DqzlV0xGQ3YPvJH1OXTVKEC58g/UfmhGAe
         B3Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YQ9AtFAj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mf9-20020a0562145d8900b0065cffe26762si5497352qvb.319.2023.10.23.04.32.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 04:32:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YQ9AtFAj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qutAM-0000k1-4b; Mon, 23 Oct 2023 07:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qut9w-0008Fy-0g
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 07:31:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qut9u-0003eP-Eg
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 07:31:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698060705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJiPpvjKWBAnBlGP3KkhDI2+e8BdQyJQjN7KhYL75jw=;
 b=YQ9AtFAjAJ9KVnYVGbDSBo6s8e0KDdROe64JvwmC7SIl9zCOgPkib1F5UD1R632hjulG9k
 QPiX08M1aKZw0Ve0BjtQFjfJrIWdBVO6+GY6ndMoxDUrGUww1MRseKDe49xFXrb2VD7oD0
 8enjGYLU89R4kOrlOm66tjq4oAxrxNs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-7ZxFKvUtNsqGt3yKOBWORA-1; Mon, 23 Oct 2023 07:31:37 -0400
X-MC-Unique: 7ZxFKvUtNsqGt3yKOBWORA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 196353C14912;
 Mon, 23 Oct 2023 11:31:37 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5563240C6F79;
 Mon, 23 Oct 2023 11:31:36 +0000 (UTC)
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
Subject: [PATCH v5 10/19] vhost-user-gpu: skip VHOST_USER_GPU_UPDATE when
 !PIXMAN
Date: Mon, 23 Oct 2023 15:30:37 +0400
Message-ID: <20231023113047.2572137-11-marcandre.lureau@redhat.com>
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
X-TUID: ZLnzOqZBYHo+

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

