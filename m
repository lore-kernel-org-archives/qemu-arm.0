Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1773484ejc;
        Mon, 30 Oct 2023 03:49:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbnCCEJfBnI/h5FaBpOjKRzXu0Lrnohun/XiQWr73YdWgBjXl8WZuHQKYWzppXH50OkyGy
X-Received: by 2002:a05:620a:4407:b0:776:fb0c:6b5c with SMTP id v7-20020a05620a440700b00776fb0c6b5cmr11674070qkp.13.1698662987326;
        Mon, 30 Oct 2023 03:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698662987; cv=none;
        d=google.com; s=arc-20160816;
        b=s2A4VgJ2rVjr4726eRAzoKTN8ZLh5EhlSa9Sznd51+SB/EmdTwMaoowkUgJNQ4kRFv
         2944wSKLylpqYTEQ5uvGAUFtiITntTLiz0u4h7mrPxep7WWZBs8GUq2ibYsg+OGcr+MJ
         3EMqZLlVl3PMzmR/SEjQc1y0pqUUGfaQ7kUef1AllHcObRjvvhEjV6Ty/8BT4rLwB/0u
         4dtKBCXhv66RQqFnOu3UBsK2NkEXq0rGr88/Zc7KVsPrYlVLFXO+YFddjjaHIHqNnHM/
         ceOYjkoKnoE5bxPcUaOliJ9XpyTmvFAEEoL0ReeYhQtuLx/MaOvrMjxvtnTW/b0vvedm
         33OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8y5okX3QpysGx0N17ejN+rdipmBjYxxyu1XjxtJ2Ujk=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=GXPLHrQ10Be87lf9EGlFuBCY7DQ9uAw0VdZ3+SIGcovZKOeHi0EaSHBbzhVgI3DNVk
         uwaMAfrez7gStK1swFL21xh0VPkSyPSP+TnzHxllkZ2QsavxKg3mhlRriAyUiD2WXyNL
         j1aMA0qDv4Bw3UGxW3hCPjlcOkKjTUjWHUsjxnKtJaJtWfvVxrOvb0q308gdX71/BFHY
         zETy+fHZbXKDUmn1YxJiINEUq3I1J0KHHpHz+oyV/S2fAvAOppzFUgGL0K1uB2BcpvxZ
         BWmvu5H2dQI8IBtYWrSMECnsNYdlTdTGk3dwInzegfbVLUPQxKVb1zWUi3ge3mtw57mC
         +X9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U0DiZaLy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a05620a254900b0077091864d1esi5465681qko.687.2023.10.30.03.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:49:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U0DiZaLy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxPpe-0003Ix-D8; Mon, 30 Oct 2023 06:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPpb-0003Ae-B1
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:49:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPpZ-0002gi-S9
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 06:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8y5okX3QpysGx0N17ejN+rdipmBjYxxyu1XjxtJ2Ujk=;
 b=U0DiZaLy/SR02bGKRMRaluepwIoMdP2THuxNAq0Rf/yDkA2Fv12QsGY9Nm6XQZ8lFwflDO
 b4yU6ODHeZJbAao8m+MgaRCKUM25UwheffAVJR/O/rZw++khONOlv5dreETmX20ASBrDNN
 Vs2ucKU6zR4hrJ7LH/ci5hmHsLZl7A4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-5Fjq0xswN0ih45s9Rp1b6A-1; Mon,
 30 Oct 2023 06:49:10 -0400
X-MC-Unique: 5Fjq0xswN0ih45s9Rp1b6A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA4461C0754F;
 Mon, 30 Oct 2023 10:49:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A42C492BFC;
 Mon, 30 Oct 2023 10:49:08 +0000 (UTC)
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
Subject: [PATCH v7 14/23] vhost-user-gpu: skip VHOST_USER_GPU_UPDATE when
 !PIXMAN
Date: Mon, 30 Oct 2023 14:47:45 +0400
Message-ID: <20231030104755.124188-15-marcandre.lureau@redhat.com>
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
X-TUID: SCDIJxP1P8A5

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This simply means that 2d drawing updates won't be handled, but 3d
should work.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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

