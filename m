Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B88606A326
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v3hydFN7
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXuK-0005aB-8U; Mon, 09 Nov 2026 17:32:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXu6-0005LB-FG
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:54 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXu4-0003yI-Rh
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:54 -0500
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-886e61fa30fso588570b3a.1
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263510; x=1794868310; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8gAMKO+bBoKDKwjxX1fSr59h7XZItuue3T5wyjTtfu4=;
 b=v3hydFN7sXM6JfMJnnp1IcD/47ZzfPkxD5vUclUiwjuXnHOJkdRgBMYdCMer3hIuDa
 yKeIWH9h4iMq3ejj6Z5WYvDT/VcP1d7ua3b2XUWJquK6AKdQizKXdOjeHKkgWKCzVbp0
 L3sAstNDwmDVfNnpA9NS/85KqTXSugWedlbjRsWXbTBrewsmMVo+YIl0gGjyt99YyTqz
 tXqHZLDu9KKyt+Z1uDPjkeIbBLZeKV7QGRnhrJJMqxxR0F9qggWOEciKBJUfhpHDTxdx
 NWoenxx4aDdHvPOpyRMsDCvKayIwZ4dVVDrlc9BV91kCs5ecdVhoNCFqBbAO0D3ul6vt
 aHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263510; x=1794868310;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8gAMKO+bBoKDKwjxX1fSr59h7XZItuue3T5wyjTtfu4=;
 b=IKMQFxNUNIdX99c37gUTl/Rje+bahWyWelhYP1bQhT45KQ7DwlbR8VjoOo5DjSuKSE
 2Vdv6QENc8myNNsoxefjT35HjtuWHgOca8/uDMmOaRI3WKHMVtu7j6fUG4HGpCJDxQa3
 OOwjWqtuw/xEBuTnt4Bn5eW8XqEL3pqe4oYZY/YNxwpRjCKNS/vz6YYYb0AkVIlkAg3I
 P99rz5OrlM3JtiMqmivEEQDezpezPWRNXY08Orcr7flKDCaBZjoL+a3JQC5TmesB368t
 wcC7nH85NrCPvwfLjXw3rqqVvVZ886yJLhf9OVKbmCVharpNnomMZePSADGBaHjpFl4j
 fvzw==
X-Forwarded-Encrypted: i=1;
 AL+hErF/z6SiM/Unp8oPv8sXEKeUpqQbsTTqS03f2oqtdDJMCNTXXZJ8DDQeVrrbGjw9TE68p1Z1PaVPsQ==@nongnu.org
X-Gm-Message-State: APuU4Z/IssnniOQQb+NpkPxTWDwA3w4KuZIkbhY1u1mtOls3jG8NPOla
 tC6PUgjFod/V/nYLxZsg3zyrU/9lheVtVk3SPOActSCxl3GXEMa04A+jeGRoj50Enxk=
X-Gm-Gg: AYBFou3dvTy05ZfLNq/MzYukKeXlbrTPUV0LM4g8jnPyG2BnYSWQt5+asDzzDB81jsn
 ffQKKU2VTzDKXgLGZ6rg84nUJhxvrCE0RGt9w4xjWBVzckflgIuDnYaqHqTPqZOjhx9zPKJ7Jtg
 GtruyHoyOwkl0T1yBbBg38p3qUCkHXQn3+SiGIH9PndKyEsFeRhfk3CRKGHpeQVFi8juV9ynS2o
 HGZ89H/wE6dtGgCdRZGTItfKVfI69GxZTqXjIwJy6NNClKbUGlty1rn7c6WCmiCEQX8k5zR8qBu
 L7BT5ffi6JfHAYWnLPcig4tdZFBAFX0xNWkCxNgwY+kvZbs1a236ImWD3kJ4XvZvgHTZMuAMQp2
 FZFFmQ+ERo+hz0HNNHxQcsG828mZIhyZXsb6ldNR8ip7eaHYH7PHLlJtvA5ux2Lyt9cO9Uzu1uu
 ci4fX3gfxAzOGGmSRpIB/pyPl2QkXCSNGx7/FBN0NDMacwx0s2G77KMxlPCYvT9nkZ6LBHdvF0+
 I6AhafV3C5etoFaQarwVBWeI+z0keUrF2ATmjq2Y5Wue2skN+85qcN0Cc3C+mzWZQKC0m4b9sCk
 QvftsnUFj4e9QxcP10qxqijbjx91KJ0Mcfn42CpTILzT4ovnaagLjw==
X-Received: by 2002:a05:6a00:18a8:b0:89e:7bfa:f86e with SMTP id
 d2e1a72fcca58-8ba885c7a6amr951177b3a.13.1794263510381; 
 Mon, 09 Nov 2026 14:31:50 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:49 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 21/23] docs/interop/firmware.json: Add arm-rme firmware
 feature
Date: Mon,  9 Nov 2026 16:31:08 -0600
Message-ID: <20261109223110.1619504-22-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x435.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Some distributions provide packages continaing firmware to be run under
QEMU, such as "qemu-efi-aarch64" or "edk2-aarch64". Those packages also
contain descriptors in /usr/share/qemu/firmware/*.json listing the
firmware features, so that environments like libvirt can figure out
which firmware they can load.

Define an optional feature for arm64 firmware to indicate that a
firmware supports running in a Realm. Firmware implementations need
extra support for running in a Realm, in particular to distinguish
shared from private guest memory.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 docs/interop/firmware.json | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index c8bf0ef1a1bf..a5e36de8db6c 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -156,6 +156,9 @@
 #     options related to this feature are documented in
 #     "docs/system/i386/amd-memory-encryption.rst".
 #
+# @arm-rme: The firmware supports running in a Realm, under the Arm Realm
+#     Management Extension (RME).
+#
 # @intel-tdx: The firmware supports running under Intel Trust Domain
 #     Extensions (TDX).
 #
@@ -224,7 +227,7 @@
 { 'enum' : 'FirmwareFeature',
   'data' : [ 'acpi-s3', 'acpi-s4',
              'amd-sev', 'amd-sev-es', 'amd-sev-snp',
-             'intel-tdx',
+             'arm-rme', 'intel-tdx',
              'enrolled-keys', 'requires-smm',
              'secure-boot', 'host-uefi-vars',
              'verbose-dynamic', 'verbose-static' ] }
-- 
2.53.0


