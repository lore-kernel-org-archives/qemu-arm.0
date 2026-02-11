Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68397EB271F
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Feb 2026 15:31:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqCBH-0007KR-WC; Wed, 11 Feb 2026 10:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vqCBD-0007Jn-Be
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 10:31:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vqCBB-0008Ak-UY
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 10:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770823861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4uMBqfdZsQbe7YIFKz45QFjnUCRjbkXzgrDvDI+qPJ8=;
 b=ML4BygmdBp7iX8wOsQ3F6MHrutvG2CphHLe2TjV8hPJSLbGe7WfPx/A7mCaxndDREzpXyS
 QlSvB7a8kYq22wXXttK5583xlCc8O7nAnttxVwu/80KzOcpvg3QEtAuO8sGqVoD8JpXsM5
 n47FEw4UwUCSiPxaUR0nvIkLJdL3/PE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-pnxQUMe9MKu0taJRQ3AO8Q-1; Wed, 11 Feb 2026 10:31:00 -0500
X-MC-Unique: pnxQUMe9MKu0taJRQ3AO8Q-1
X-Mimecast-MFC-AGG-ID: pnxQUMe9MKu0taJRQ3AO8Q_1770823859
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4806b12ad3fso68901495e9.0
 for <qemu-arm@nongnu.org>; Wed, 11 Feb 2026 07:30:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770823859; x=1771428659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4uMBqfdZsQbe7YIFKz45QFjnUCRjbkXzgrDvDI+qPJ8=;
 b=LwVj601w1yCzQF7WCW8aM9c3yJgVfFGDMDzAeX0DxbGkMvXktk4WLMPSwaOLS2SYUS
 aSKJaqlgKPs8FF2UX6MlC6+dcXBNtbEMIL4pJ5BFocWyUfFumU/vkNuIoC7YiyLItcGR
 L1JN3/WsmfFO7/s8SQswHKu185ZTKo/6HsAOM9wbFRB3OvTH1zdrilLFzzsAmrl1bZCE
 /LUNkRah0uDiyaeEFk9KWQGM5Nd9bxHzhuOrRMdpAFAryKNw6bIwPxAZ5F8+mgtNtFRV
 IB5RjNxiAUpQITJ7CNTYskwttpLmW6xAk/etsYr6WpGzOknIyjHjemUeh802nxFQc0oY
 NCeg==
X-Gm-Message-State: AOJu0YxfQdQQHgUQxKeQW/1UqhBysgbuYfsNCsKypCaTt/eJ9LUGS4BL
 EfbTslL5RdPrnZqv617mtuuWjUBrZqVGYa7lyOwOvAwsQuKAr9ZCwED5r+0Sf7VWBJpfjxb91WE
 HxBgNZyKRg3H42c+cTCDLjnmipnUxYq+Mdes2qHLoweTFIWWlcOg79Q==
X-Gm-Gg: AZuq6aLI3ry99+D1+sF2H9F44FnXEdHDuVoimJLMzN+1ieZrtUdLpmXUeOws6/LlqQl
 TzNx+gU+8QNU9e3IHygZXDhSmXJehJmNZ2W3yCt5V9WVq7B+/8Ed0IZOumHer3ZPaRzoIhMKkRs
 owDuMXIYDdx4UM1HK60cgJA/VFJi6PSvvWizEeRGWGjq3WXkNwaQBAervWJxhbs0IeEZCs6j92L
 qtGZbRAw+k2deayqYNXDMrhwoqJ4ChJLyDeIR2W7FXXoClcEsP4zixPgYTXEGFSx327S33yo4AH
 DObnjh+mrpWZRHUYMV4J22kZB7bJ3rm/FT7PNTQtyNAxE1wu+Kmjfc1gPefsOZrT79c5+vhIjG3
 3UcQfhJXngFGhx0fnxjE3WpVeNYPBpZUjDQ0q3Ox+kPByKCAYezEQdwv3UAIX4CIKIDaQIh9hFE
 Yv62yh7ss+
X-Received: by 2002:a05:600c:46cb:b0:483:ea6:8767 with SMTP id
 5b1f17b1804b1-4835e2cd408mr35512145e9.36.1770823858859; 
 Wed, 11 Feb 2026 07:30:58 -0800 (PST)
X-Received: by 2002:a05:600c:46cb:b0:483:ea6:8767 with SMTP id
 5b1f17b1804b1-4835e2cd408mr35511455e9.36.1770823858114; 
 Wed, 11 Feb 2026 07:30:58 -0800 (PST)
Received: from rh.fritz.box
 (p200300f6af2d8700b4c2d356c3fafe63.dip0.t-ipconnect.de.
 [2003:f6:af2d:8700:b4c2:d356:c3fa:fe63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783d34657sm6448511f8f.6.2026.02.11.07.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 07:30:57 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Sebastian Ott <sebott@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 1/2] target/arm/kvm: add constants for new PSCI versions
Date: Wed, 11 Feb 2026 16:30:31 +0100
Message-ID: <20260211153032.19327-2-sebott@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211153032.19327-1-sebott@redhat.com>
References: <20260211153032.19327-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GU29oVKTIWGH8MT-_HHGv2M6uMo3Dx4RinQ5IrxLywk_1770823859
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add constants for PSCI version 1_2 and 1_3.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 target/arm/kvm-consts.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index 54ae5da7ce..9fba3e886d 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -97,6 +97,8 @@ MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES, PSCI_1_0_FN_PSCI_FEATURES);
 #define QEMU_PSCI_VERSION_0_2                     0x00002
 #define QEMU_PSCI_VERSION_1_0                     0x10000
 #define QEMU_PSCI_VERSION_1_1                     0x10001
+#define QEMU_PSCI_VERSION_1_2                     0x10002
+#define QEMU_PSCI_VERSION_1_3                     0x10003
 
 MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
 /* We don't bother to check every possible version value */
-- 
2.52.0


