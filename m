Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2839396ejc;
        Wed, 15 Nov 2023 07:13:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFr6vlUEZ0dGJUpkjCnlPJgv7+p3zvJ8wsg8TVg9kxBBG/uXzd/rZLocbxQ1lOaSsT5l9DS
X-Received: by 2002:a05:622a:a:b0:412:1e4c:e858 with SMTP id x10-20020a05622a000a00b004121e4ce858mr6177410qtw.36.1700061224383;
        Wed, 15 Nov 2023 07:13:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700061224; cv=none;
        d=google.com; s=arc-20160816;
        b=GlXKmEU3f5JDU11KNR0c16Puu9wh4dd+Fd2T16S8Wr7oGRzF/N73r5sbdEWbxAPQRw
         s06ilrktC2Ivy4zbLVkz7UmNK983QiLLnKIB4WEcg4NKrTsLJCu7KgEPVG9J9+2W7Le6
         SHcuIRbm1zasxmG2yr/Ibc8s1Wp4YMcR1leAV9eztQpARIZfjmefWYtn254fRIw9DLll
         7ThxnHjh4rZhQouMy99w5QkSo/G+kfoeI/ay3IK5+/dDxW8geND6ZACFnTZhuNhOuY0U
         d7wRgzPCSTbT74agYZfpN3s27kkD0BAzrmpAkdo6QH3QJYk1/N+Oc4OEsOAXwMIUzjAI
         CrPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3HjbIQIXvlNjSa0gvdvOx/3peo6nOqkjgT0g3BYPEDw=;
        fh=aH4SF+xuSHrUGtnSFxtFTCUyBE4iqqHq5kYhw/wkcgk=;
        b=ZUNrlyOL5xO3IfFPbJME09Nx1Xm5kUpMuGNEusH94fsyKkVDcQe+7ztYqNe5o2ac+4
         RBxFcTqA/ksH6G9BHC0TmeAhZ5QszafpqQ+q0iGLssc1pkjJHFbxKu6d4RO8o/NkCnJi
         1GVIQn6kfd0Olc9sMI3yq/FlR9C2NK+lTYF6ZaIKa51RjSjcpehp5OepqNMg8wgOxqPu
         Qeci4rwTB7Jew9hEc8pWieap0STqMd45SdcH0u7Z8y6+oG2c7kfnRPONhbJ89VaOqOIw
         w5eWNAyd+npJISp8WUaOGAuQGWvmZvZUnSWscrLFmVr9Ej/TuFR47AooRAvvJutN3Unb
         hTBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=akK99qAB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20-20020ac85754000000b00421bd62ff7asi9572923qtx.682.2023.11.15.07.13.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 07:13:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=akK99qAB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3HZv-0003yw-0S; Wed, 15 Nov 2023 10:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZW-0003t8-RX
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 10:12:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1r3HZQ-0003Ec-7E
 for qemu-arm@nongnu.org; Wed, 15 Nov 2023 10:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700061165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3HjbIQIXvlNjSa0gvdvOx/3peo6nOqkjgT0g3BYPEDw=;
 b=akK99qABIXcPNomhEctmw32nOc7AIYJ273L1AbXOlxxy83v0Iq6DtqM2wYTRx9vG25QrMX
 T86QNUfB7TWmaC+3zbwDMVBNBZ0FtB00QBrnBDRawE6o7VE/9o5a6boyXPEhAW/8XI0gc0
 u20Ak3gBNGyUZZNvTDTEwbgGv+9H8jM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-473-384p8qH9OIOesBzJxg7MqA-1; Wed,
 15 Nov 2023 10:12:44 -0500
X-MC-Unique: 384p8qH9OIOesBzJxg7MqA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 073733C000B4;
 Wed, 15 Nov 2023 15:12:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADDFE2166B27;
 Wed, 15 Nov 2023 15:12:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6F844180AC07; Wed, 15 Nov 2023 16:12:42 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 graf@amazon.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 01/16] hw/uefi: add include/hw/uefi/var-service-api.h
Date: Wed, 15 Nov 2023 16:12:23 +0100
Message-ID: <20231115151242.184645-2-kraxel@redhat.com>
In-Reply-To: <20231115151242.184645-1-kraxel@redhat.com>
References: <20231115151242.184645-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 2JVGOSQEJC0O

This file defines the register interface of the uefi-vars device.
It's only a handful of registers: magic value, command and status
registers, location and size of the communication buffer.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/uefi/var-service-api.h | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 include/hw/uefi/var-service-api.h

diff --git a/include/hw/uefi/var-service-api.h b/include/hw/uefi/var-service-api.h
new file mode 100644
index 000000000000..37fdab32741f
--- /dev/null
+++ b/include/hw/uefi/var-service-api.h
@@ -0,0 +1,40 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * uefi-vars device - API of the virtual device for guest/host communication.
+ */
+#ifndef QEMU_UEFI_VAR_SERVICE_API_H
+#define QEMU_UEFI_VAR_SERVICE_API_H
+
+
+/* isa: io range */
+#define UEFI_VARS_IO_BASE                   0x520
+
+/* sysbus: fdt node path */
+#define UEFI_VARS_FDT_NODE       "qemu-uefi-vars"
+#define UEFI_VARS_FDT_COMPAT     "qemu,uefi-vars"
+
+/* registers */
+#define UEFI_VARS_REG_MAGIC                  0x00  /* 16 bit */
+#define UEFI_VARS_REG_CMD_STS                0x02  /* 16 bit */
+#define UEFI_VARS_REG_BUFFER_SIZE            0x04  /* 32 bit */
+#define UEFI_VARS_REG_BUFFER_ADDR_LO         0x08  /* 32 bit */
+#define UEFI_VARS_REG_BUFFER_ADDR_HI         0x0c  /* 32 bit */
+#define UEFI_VARS_REGS_SIZE                  0x10
+
+/* magic value */
+#define UEFI_VARS_MAGIC_VALUE               0xef1
+
+/* command values */
+#define UEFI_VARS_CMD_RESET                  0x01
+#define UEFI_VARS_CMD_MM                     0x02
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
2.41.0

