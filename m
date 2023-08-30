Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4241561ejc;
        Wed, 30 Aug 2023 02:43:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzmzGWBj7v7og+kzp62wL5st40Kgbi/LkLcVBUPYePELjI6UUyiJG/H71FGxo8KskHWImT
X-Received: by 2002:a05:6214:1847:b0:649:7b67:14d3 with SMTP id d7-20020a056214184700b006497b6714d3mr1566792qvy.32.1693388608507;
        Wed, 30 Aug 2023 02:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693388608; cv=none;
        d=google.com; s=arc-20160816;
        b=oI6kOa/PMj6ROAwZH5QRtNMbiik4IoKVy/4E5EadILVDp6Vq4ypKCXRhu2zl9Mfab8
         /CsTDQv4NsUqGXQKB1KwJEoecVrbtfgOkadxzOZWV9qkIM8CrcDztIsG9qBCpw6J1Nd1
         vh3Sff1hNMZeSLAYngw8DLzZRibTvjKZDoB/HXBoOjEbHD1yBzTrMyFOMN6uvuXPUVxC
         TRI7NMlHuSezY34iYHb2Xu1OsqRvl1xoE0Kwy5Ja5jAjaQanoNZapGE2QpIWt8gY63tO
         68RNoc9IrihQ42zHuehPdMxBp6HpiAvebJ03Uvz4DjE9hSKHqMbwBV/lZpaWyhTYnfv5
         4jyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UYesKtA6jfy2sWtJA6CnyeGVhZOa1Dz1Cc7bonagla0=;
        fh=VPXweq9SOBjaS5jDnF/VuzDyU7wewDsKWqu15AKXz68=;
        b=mfzFrGauusjIAFpev7nxF6cX3gQQJVtCgxZdaQcHFcGfvuBYp6jSL2RPzgmF+28ywa
         Cfdi4nBdeWh31p8aLxmh+GHnO0fzMZFE83Og4YSnQIdjIdJ9ibxIPWPhNhR6ypO7kHm/
         txykqMYPKXXQqF1ZFowfUtQyvTeCK1x4WjdupsAep58QGcvudfZh+GFFwptMMuBf80kN
         RQh0X7Fx1VoNw+At5Snbk5zmXFL52jZ3vRmO92mk1jq+6/7PFWa+KwPVzH3pdCrxVBta
         yNpakogMrUoDyTLwByuzFj9ltq8zW3b/xAkM0rCFPgb1ZuB0h0sO1WPyetQFAT8VPn3p
         ixpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZU2Techc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7-20020a0cf287000000b0063d27387dd5si6917902qvl.331.2023.08.30.02.43.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Aug 2023 02:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZU2Techc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbHjD-0007cU-2R; Wed, 30 Aug 2023 05:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qbHjB-0007LJ-8g
 for qemu-arm@nongnu.org; Wed, 30 Aug 2023 05:43:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qbHj9-00022p-19
 for qemu-arm@nongnu.org; Wed, 30 Aug 2023 05:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693388582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYesKtA6jfy2sWtJA6CnyeGVhZOa1Dz1Cc7bonagla0=;
 b=ZU2Techchc2uIJoK2HuOGFmJXh7hXcLFdd1cWD95lzOqusndAcTQ+NUf+BkDMFBkZjmI3u
 dCbYlss2aLwRYwEzhTN0xPnDwLuGM3pGFw9yTBuJdoxaMbQEDj2KmMDvFQCLhfnbuWgTfn
 tfTo3C3y32hor3F1tVLPxv66ydPu+Lc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-uW9BwA9lP4KZj7wpw2uwBQ-1; Wed, 30 Aug 2023 05:43:01 -0400
X-MC-Unique: uW9BwA9lP4KZj7wpw2uwBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B32B7101A53C;
 Wed, 30 Aug 2023 09:43:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA0F640C6F4C;
 Wed, 30 Aug 2023 09:42:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH 64/67] arm/kconfig: XLNX_ZYNQMP_ARM depends on PIXMAN
Date: Wed, 30 Aug 2023 13:38:38 +0400
Message-ID: <20230830093843.3531473-65-marcandre.lureau@redhat.com>
In-Reply-To: <20230830093843.3531473-1-marcandre.lureau@redhat.com>
References: <20230830093843.3531473-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-TUID: qy2f9btMMiFV

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The Display Port has some strong PIXMAN dependency.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7e68348440..7ea956b286 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -451,7 +451,7 @@ config STM32F405_SOC
 config XLNX_ZYNQMP_ARM
     bool
     default y
-    depends on TCG && AARCH64
+    depends on TCG && AARCH64 && PIXMAN
     select AHCI
     select ARM_GIC
     select CADENCE
-- 
2.41.0

