Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp178802ejv;
        Tue, 7 Nov 2023 01:04:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1Tl3DzqdK/qc+SOhdrHFHybVvBjOr9qcf5pdtoURAWPPpHemj4xFT8FJqjI564nngOGZr
X-Received: by 2002:a05:6512:3e0c:b0:507:9e51:a6c7 with SMTP id i12-20020a0565123e0c00b005079e51a6c7mr30699862lfv.58.1699347867320;
        Tue, 07 Nov 2023 01:04:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699347867; cv=none;
        d=google.com; s=arc-20160816;
        b=BDX984a3YXqU6eOIV5TbVE6rZlOflUCRWyFIZCWBh06DSNCa/21d/8xD7ki3U6yp7q
         C3C70cmygPG8AfAhSdYgGJ6CgiTSlqzPAKiZY4TBifArnr+wMPs3VXNkCoBrzGG8LJ0E
         V7s3FvEI7eK4lN06b2Be+fQvbTItvZPGwi650QpvL1sfarERtH7BszNS02hOPbwJPbJY
         FCdtmc8nJLvvzTLYdKdRDZGwK+eT8qga/RP3PB/hGGaGI++Q/Ol6G9Ne/ws4q5xeidAW
         6XJS7eCMOK5Nl4Fyc9QtVa8shNMCrq8Vpm/A5P9TDPVPh+pPjob/z6i6Kv31HEjuJyDM
         sUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=p0ehF2yy0jm+EJ+7YfcN8Cr9TdK4WqIf7aAQHmwJErg=;
        fh=wB/RMfg3jM68Bg799dUevEWe8lc743Noow2v7CyjF1g=;
        b=x3xJepiEpw0ub8U/Rr0HV6vgEwZJbsuJssE/vZbwmqhmHWIrQ0EnE6R2yc4fxOA/lW
         enYB2CRJZcAcEDSmC6F13xnnL3QS0Z9Qj67yRYk1ZhTGsXyxT/ckAgX/SDDh/Bwb3+gY
         hlTGih5gXsvEOs6LLCWgXXYLvFSaAqRyVFdfSxIQbUpbDsJyQgj/xCVOHakcrlv4qLkC
         ekHRrvbADVRoKywO5zWc9heBe8OAf8vMlxQr5apPl2FeezWWfM3ts79mSvM2K+MOqHgB
         capsC+7pEPTrKDY2tzXysCQjIp70PcqnsD16bYblWpKcWwZwU+y1gM5FwKNWstetMLbd
         5Gag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gU1lunaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bx14-20020a5d5b0e000000b0032d9335cbf1si1545023wrb.384.2023.11.07.01.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 01:04:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gU1lunaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0I04-00040v-SY; Tue, 07 Nov 2023 04:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1r0I03-00040S-F3
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 04:03:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1r0I02-0005i4-3p
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 04:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699347833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p0ehF2yy0jm+EJ+7YfcN8Cr9TdK4WqIf7aAQHmwJErg=;
 b=gU1lunaKGuFkmOF5PqiLBOpzcEkpneTBivo1zDCjNBb3T3qxDrwpg3jUjL5Jfik+QQAph+
 vbaj3BZyonUsYTKWbh6cHZ3B0JAXnsf5j8CQaRheYVsCsL7WPNI5h9mLEfkPFZ4Px1yKQx
 IFL5B9EZbGYK7cXJPUrUM97T27momqE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-i2DhXMjGMmWKqeSkfjVW_w-1; Tue, 07 Nov 2023 04:03:50 -0500
X-MC-Unique: i2DhXMjGMmWKqeSkfjVW_w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B22B185A786;
 Tue,  7 Nov 2023 09:03:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91B2F492BE0;
 Tue,  7 Nov 2023 09:03:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH] hw/arm: XLNX_VERSAL depends on XLNX_CSU_DMA
Date: Tue,  7 Nov 2023 13:03:45 +0400
Message-ID: <20231107090346.2614924-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: lrSFX7KqIwe/

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8ce288a40c..fef992a402 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -484,6 +484,7 @@ config XLNX_VERSAL
     select XLNX_EFUSE_VERSAL
     select XLNX_USB_SUBSYS
     select XLNX_VERSAL_TRNG
+    select XLNX_CSU_DMA
 
 config NPCM7XX
     bool
-- 
2.41.0

