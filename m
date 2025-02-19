Received: by 2002:a05:7022:983:b0:97:989a:5032 with SMTP id bt3csp1282090dlb;
        Tue, 18 Feb 2025 23:16:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUOt5fq8oO7EOUmONo0xvDzoGbYooel8eNOr6Z6BAy9D95t3Pu2aHnglL+IVCfVgrYDwRMPWLNxYIQ5xQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFxP/hy0HLfg2FQ+Uy+gOHA+0e6iOBEGhGwj6hdiKvOM/AYXkIYlQfMjcPqB7vtsV9e8770
X-Received: by 2002:ad4:4ea6:0:b0:6e6:698f:cafc with SMTP id 6a1803df08f44-6e6975bd273mr33085696d6.42.1739949370434;
        Tue, 18 Feb 2025 23:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739949370; cv=none;
        d=google.com; s=arc-20240605;
        b=Yf18AHx/o4YdtTbm8Bau25OzWDuob6RUIRKzrZve1dKvgWB71jsdu/NitE2hM1IqVf
         jsbw8C1Ih/w1418R9Z4doHIuU1XPASNTYUueLGSOsvswJ5D3dlz4fIbMjILj/t1BoBur
         YygWNE1pWGyqODWPRCmdYuw1VIEsFow3QqK0gZXS4dxIXmLxPDpaGCtnwraBDK+CL29W
         /gGYNRPhFZQYakODO7Gmy1BlXwv5uW1f2DOvuWav0sxul0wte1YheE3tfOgacI23yJBk
         NDh7IE120y4oXT7BaSCmT53rVS6ZuQkmVNWU8ISmkPWkn15t9b/8pFFm8l3sSEJXgNNC
         YnVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wOer/6VbqiVqzLTMzfoKp9zAj6wgPpc1uo9nDs4+w9o=;
        fh=cuthRgrtQnrpj+H2e/uqRPX/krZkAep2AlIC2a7xIzg=;
        b=FeMGaPPpldlM7GKLckYMr716Habmb4kpvKoWB2leO4HPg5G4TB2mkY13wC6CnOpgNs
         sOLnkAFrKnqqPuKH1E8wIiQ4g+AEsahNdkrW/5K6Z9gBfzSbWmLir7tiLsjL+cpsW9LS
         fKPtw8BU2jw00sXCwXeOiMocWWY9JrRCZkmvGjm+gEAGmVNvf9GW9FIDfDMQlZmu0Jph
         ZSke2Sq8/1e+kVB0cJXVATwZp/XDAKuT5DrssWK1rG3ZW0kSEHNgRWSB8jDEB6emwTUr
         69CaD5VWsujF94ynnphfGNksvr0NbUWQA2pLUN+zIP+ntHJwTlryBWIqVdltN1HahHeP
         D3DA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WqIB7my9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d74206dsi125565126d6.122.2025.02.18.23.16.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 23:16:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WqIB7my9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkeJF-0002yA-0t; Wed, 19 Feb 2025 02:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeII-0002FY-Ld
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:14:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIF-0004z3-Tg
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739949289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOer/6VbqiVqzLTMzfoKp9zAj6wgPpc1uo9nDs4+w9o=;
 b=WqIB7my9AbQEVLH1LfxlrGnYEepNEJ1Zgkawww2eU/Xl/8/rUGRpY6Q2SzhPrLzFWoGDxQ
 uTutFU5wPpb5CumdmdDf2NIFO52Wr5Xtq0C9s0ZyhJ1DC9mtbW9PjxSfyOG6fA0qSUH0Ub
 D5hX3Ug0rODl5Jkm5bOxuMeu+omS+jo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-KkyxvBhfMKivRDUDTbtQmA-1; Wed,
 19 Feb 2025 02:14:43 -0500
X-MC-Unique: KkyxvBhfMKivRDUDTbtQmA-1
X-Mimecast-MFC-AGG-ID: KkyxvBhfMKivRDUDTbtQmA_1739949282
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E850B180087E; Wed, 19 Feb 2025 07:14:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.78])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 40EAD19560A3; Wed, 19 Feb 2025 07:14:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0F9D91801A8C; Wed, 19 Feb 2025 08:14:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Ard Biesheuvel <ardb@kernel.org>,
 Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 graf@amazon.com, Markus Armbruster <armbru@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Subject: [PATCH v4 02/24] hw/uefi: add include/hw/uefi/var-service-api.h
Date: Wed, 19 Feb 2025 08:14:04 +0100
Message-ID: <20250219071431.50626-3-kraxel@redhat.com>
In-Reply-To: <20250219071431.50626-1-kraxel@redhat.com>
References: <20250219071431.50626-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: E//ycLTq58+j

This file defines the register interface of the uefi-vars device.
It's only a handful of registers: magic value, command and status
registers, location and size of the communication buffer.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
---
 include/hw/uefi/var-service-api.h | 48 +++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 include/hw/uefi/var-service-api.h

diff --git a/include/hw/uefi/var-service-api.h b/include/hw/uefi/var-service-api.h
new file mode 100644
index 000000000000..0d71638f3efe
--- /dev/null
+++ b/include/hw/uefi/var-service-api.h
@@ -0,0 +1,48 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * uefi-vars device - API of the virtual device for guest/host communication.
+ */
+#ifndef QEMU_UEFI_VAR_SERVICE_API_H
+#define QEMU_UEFI_VAR_SERVICE_API_H
+
+/* qom: device names */
+#define TYPE_UEFI_VARS_X64       "uefi-vars-x64"
+#define TYPE_UEFI_VARS_SYSBUS    "uefi-vars-sysbus"
+
+/* sysbus: fdt node path */
+#define UEFI_VARS_FDT_NODE       "qemu-uefi-vars"
+#define UEFI_VARS_FDT_COMPAT     "qemu,uefi-vars"
+
+/* registers */
+#define UEFI_VARS_REG_MAGIC                  0x00  /* 16 bit */
+#define UEFI_VARS_REG_CMD_STS                0x02  /* 16 bit */
+#define UEFI_VARS_REG_BUFFER_SIZE            0x04  /* 32 bit */
+#define UEFI_VARS_REG_DMA_BUFFER_ADDR_LO     0x08  /* 32 bit */
+#define UEFI_VARS_REG_DMA_BUFFER_ADDR_HI     0x0c  /* 32 bit */
+#define UEFI_VARS_REG_PIO_BUFFER_TRANSFER    0x10  /* 8-64 bit */
+#define UEFI_VARS_REG_PIO_BUFFER_CRC32C      0x18  /* 32 bit (read-only) */
+#define UEFI_VARS_REG_FLAGS                  0x1c  /* 32 bit */
+#define UEFI_VARS_REGS_SIZE                  0x20
+
+/* flags register */
+#define UEFI_VARS_FLAG_USE_PIO           (1 << 0)
+
+/* magic value */
+#define UEFI_VARS_MAGIC_VALUE               0xef1
+
+/* command values */
+#define UEFI_VARS_CMD_RESET                  0x01
+#define UEFI_VARS_CMD_DMA_MM                 0x02
+#define UEFI_VARS_CMD_PIO_MM                 0x03
+#define UEFI_VARS_CMD_PIO_ZERO_OFFSET        0x04
+
+/* status values */
+#define UEFI_VARS_STS_SUCCESS                0x00
+#define UEFI_VARS_STS_BUSY                   0x01
+#define UEFI_VARS_STS_ERR_UNKNOWN            0x10
+#define UEFI_VARS_STS_ERR_NOT_SUPPORTED      0x11
+#define UEFI_VARS_STS_ERR_BAD_BUFFER_SIZE    0x12
+
+
+#endif /* QEMU_UEFI_VAR_SERVICE_API_H */
-- 
2.48.1

