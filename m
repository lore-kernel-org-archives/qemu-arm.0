Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp97518njm;
        Tue, 4 Mar 2025 04:51:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVWEV20la4XNMMmVRXWk3ptx4/z9TggsYyqhiBSW9a/YyAbo815YTMqspnBCDZOHjHW3PodYmXVNFGQCg==@linaro.org
X-Google-Smtp-Source: AGHT+IFfaiL1d/uLVkwcxLcDjamr2d3VXuPctURrwjPJ9dLEzInwMoAT593w3MfSkfHwGip/Z6r3
X-Received: by 2002:a05:620a:f02:b0:7c0:ab10:1125 with SMTP id af79cd13be357-7c39c67f36cmr2926086085a.55.1741092667779;
        Tue, 04 Mar 2025 04:51:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741092667; cv=none;
        d=google.com; s=arc-20240605;
        b=NDJ6loLRtIjl4bPev2WHZYDnGqq2JgJlkedxk6TDx5buFjiBEt9q6WldxWXouvKswD
         aDwtaBnQ3cgawI+/0K9xSRopcwPkunn9UsBiC3Lv6gWq1eQ/pYoyY2/MLijV7DEK81JE
         2mm3u5G7pM2X6Ok3ep4wY9ezEFst4yxlaXXctGPs7j5aBOiBhBm8NDpfLisH0lttMPLb
         9aZPZNIa7IjWg3fRdRUTdD899uUxDRj2fDWik7h38Y+1Gb6UpKOe7610BDQvSKYPIiFn
         e4d2w7SjJ/KXO0buxazNSIy2raFOf76cNw+o/I0hvxCw+O0IElIUoqZN2oVaNtfuccZI
         n+2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=K/GFtp0QO6yu6/4mr5Mp0qNucr+nmJ7SLkaVqL01H0Y=;
        fh=wHvVPe+xbnI+lO6FhqG9Td3cj4EmF7boTNfdZkaDiXA=;
        b=YZV9uPb6vFQumqR62O5kOibW4u7WCgga9SHPYZO6/CFPIMtk3bIVtgkk8Sg8XmzZhD
         AwztDL6cT7HnyP/KHM4H3guO7vufzJjnofv1OxwP2CiuMpEuG1cw5kYBdsiMtqbWmNiX
         Xbhw4ptepnQAYepVX90SPHA9VHjrGotWOuu2Pu/+Vl0N4eA+hvNhMzByC8hqeynOG1KK
         03f+0hzPOlmlirRK2aPaatH2GlrskhyUUDLXJdEVvOkFyNg7jqD8cZ6oCyoeBSjVqKMK
         i2vjG05eCoPEBa0qRM711CUqZH6AizDoc224xDN6Mz3xcPd5H8lbQY6xGPio/oYjyr95
         limA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aPg8gblu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3ca26b65asi199245485a.568.2025.03.04.04.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Mar 2025 04:51:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aPg8gblu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tpRhh-0004sv-Nz; Tue, 04 Mar 2025 07:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhU-0004iK-MK
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:48:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tpRhT-0006lC-2R
 for qemu-arm@nongnu.org; Tue, 04 Mar 2025 07:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741092522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K/GFtp0QO6yu6/4mr5Mp0qNucr+nmJ7SLkaVqL01H0Y=;
 b=aPg8gbluaw6kPQNrRyXcNupD3lUkkAdw42iaNjqQdohhvNMhQmFJP2PvAP1lKTttoyp3Z2
 8QsWHWSpeb8I8MMKk61ufQRnQT2MaVJFbV4RYWWqXA/0xqtizHc1ytEnk5E/YzW6c88YCe
 vWaRXZ+9t9eTTKaKu+wQ/Hj7CQ1lirc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-emFkRSd3MQuaCOEaCoM7tA-1; Tue,
 04 Mar 2025 07:48:24 -0500
X-MC-Unique: emFkRSd3MQuaCOEaCoM7tA-1
X-Mimecast-MFC-AGG-ID: emFkRSd3MQuaCOEaCoM7tA_1741092502
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8CBA21954200; Tue,  4 Mar 2025 12:48:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.122])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CB275180087C; Tue,  4 Mar 2025 12:48:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4B3941800396; Tue, 04 Mar 2025 13:48:15 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Subject: [PULL 02/24] hw/uefi: add include/hw/uefi/var-service-api.h
Date: Tue,  4 Mar 2025 13:47:50 +0100
Message-ID: <20250304124815.591749-3-kraxel@redhat.com>
In-Reply-To: <20250304124815.591749-1-kraxel@redhat.com>
References: <20250304124815.591749-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: BbemPqh4SgLD

This file defines the register interface of the uefi-vars device.
It's only a handful of registers: magic value, command and status
registers, location and size of the communication buffer.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20250225163031.1409078-3-kraxel@redhat.com>
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

