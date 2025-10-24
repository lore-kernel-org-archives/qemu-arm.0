Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D98CCD1BF
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 19:14:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCNEJ-0006Yv-B8; Fri, 24 Oct 2025 15:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNEH-0006YP-CP
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:13:37 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCNEF-0006TO-IZ
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:13:37 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-475c696ab72so19266325e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 12:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761333214; x=1761938014; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BU4cbGt91bL/zj+kwzBNgRzNipaoran6iEGhQUMuavI=;
 b=nScXO1oh+5vH7pGCrPGUM3VWImgdJhqmzucTYq7nkZAawJO9TPO8F5KMTAPpSQRfsA
 +hMX1JTAmJ7FTisN4PkPaz1aRAKKO8tY44eqS5yZY9IlW8eZwDGlX/AqXczOwT/0QBTB
 F+XRlTInHgrNeiL4z07Qxbp9hsz96kJkVqVwtRpvKve+JldjUJ8ea4TmTfJuMQ0jhHy2
 tFp7OkWmB2Fi+OANOaupNeX33FhIcurEiG0krPyaUzY3TDnhdAgLFjmaO3pM9PJ0I/90
 AHusnYu6v3ry/mctm0Bm/vufufu0sGmp3/pmiJUtwOogUELmytwt8cICWYG89gnatCfu
 W/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761333214; x=1761938014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BU4cbGt91bL/zj+kwzBNgRzNipaoran6iEGhQUMuavI=;
 b=RNMy7FIaVGMwpiTj+hG1hBA7zfnnsyiHnEpy4gvtnsa1uMWOkJQPuHrTN3VixzQyGX
 EbQnAPhFPHFF5Qs0cPGvd7cRRpA56RcgpXOEHeV87zcTIUYUvyeh5pV1DrVeDC8pDtu3
 r/RQCGPDfBLZGCohDxjjqC0u3YT7xT701mohIdj5s+SgcBIdA0C5uZqltbJnHsYjh82N
 lNfZzi4UDc0a1btJSa8rOagXWtI4Yp+nYUDOHti+RSn5N7rjC2anaNJnTxqCAnhX10Nf
 wTuY2/ujE9MUI+EIaPjuEoJfeaD1nM4NZA41MasvKXW1QCVQym0QryOFW7bQg0p356mP
 RnHQ==
X-Gm-Message-State: AOJu0YzpSace/sNg6TaNfznjvRCDFJdlafJpG4RxKtlBxxZf0zTkRTJp
 zIyD/TqXFk1nxsOsgPfMLk8N4+/e5sBBiZWQ2Tke9+O7driKEtx8AnNM36ftTXwQ35gjOXBKTzl
 6Y9xafIQ=
X-Gm-Gg: ASbGnctf8psM//NDBXwtTtil/vGnYKlnV2SSnKknmRyXxAgIAN+Byln1Sw06YiTZ1Dd
 Qcm5tJYgF7f4jz8dq7WEWO23ToeJdnS3IUzSUOjwiPPvC0Z8Ekd2KYUrN96hPIJSs6OCxBVIrRs
 K1v/+uU3QxgVbUoeByducFD/t38MjeTCPPGgChOT8iGKQh4qE8GJVw7SyiK61AfJsmNJfJRlfeB
 IPgBd7Rn5LvhqjOtoSmXLFbXnOvsTIE74DFLlRlISYeGIVfO+HY0MeLyYrtEM7arI6WzsJkgg1H
 LWwfGDIfoXgovKnYiAQnooISiDvSEEZgJz5p3etMgqlDEFQpPybs+aDklm2HjvpaT2xYYGeTK9u
 r+9w+8ZE3kE0lXFnCx14xq20bgSEdQWpMlwITDUgTW2pf9q6Tc9qvVwomJ2hLQPDFHTINE4VQE3
 hwddd+wqHHc/AB+Z8vB+JHMW7Xr8wHNiZc5HZ4EeNhG5aiXcbdKIj68UdHhmPW
X-Google-Smtp-Source: AGHT+IFSsXIxX6llpAhGhSYeM+hD8DUuvMTxsZCEuOzNR6zYQR2rzMerbQM3grL44mSCpeu8+m4jmg==
X-Received: by 2002:a05:600c:6217:b0:46e:394b:49b7 with SMTP id
 5b1f17b1804b1-475d2edf1d5mr27915525e9.37.1761333213906; 
 Fri, 24 Oct 2025 12:13:33 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428f709sm165198185e9.8.2025.10.24.12.13.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:13:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Subject: [PATCH 06/27] hw/acpi/cxl: Use proper SysBus accessors
Date: Fri, 24 Oct 2025 21:03:53 +0200
Message-ID: <20251024190416.8803-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024190416.8803-1-philmd@linaro.org>
References: <20251024190416.8803-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

SysBusDevice::mmio[] is kind of internal. Use the proper
sysbus_mmio_get_region() accessor.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/cxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index 75d5b30bb8b..77c99dfb184 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -104,7 +104,7 @@ static void cedt_build_chbs(GArray *table_data, PXBCXLDev *cxl)
 {
     PXBDev *pxb = PXB_DEV(cxl);
     SysBusDevice *sbd = SYS_BUS_DEVICE(cxl->cxl_host_bridge);
-    struct MemoryRegion *mr = sbd->mmio[0].memory;
+    MemoryRegion *mr = sysbus_mmio_get_region(sbd, 0);
 
     /* Type */
     build_append_int_noprefix(table_data, 0, 1);
-- 
2.51.0


