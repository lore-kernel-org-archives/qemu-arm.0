Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8688EC43602
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 22:46:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whEWE-0001af-Ub; Tue, 07 Jul 2026 18:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEWD-0001Xg-D4
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:57 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEWB-0004Fj-RP
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:57 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2cad4170e8eso1053795ad.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 15:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783464234; x=1784069034; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EnMMO6XRJvcdXze8ZNpj726nr1qkqlMgc3hRmwu5zpY=;
 b=Go0yhxWBWqFiJe4snu8lkvfxWh8FkYjMJoCzgDHU3gkzHlp8A9Cr6OlctPc0OhITD6
 71jWGcW4coz5EZVzCg7mSKedOKamcQAPpGqimZ48qQdChHei1D7E4NoSEcl1LlxJedTG
 Vm+0wo+QWEcbu0zlnK0n4qBQjUQE0zsMjqQvzY2wIfTlvLItMMjzUUUMeHMhOt5uGoFx
 /LvaLpjhoNJr1JCXtC6YNCL4014i4REcHOrHrejiBJOAUYAgRTZRZHUiCmbrnh1gDAou
 IOTTkUUtDbSaAkUKXlADFTOQqSSDpRRg7sNoNQyu5Mw/v9kslyDCzkDsjKSOvnkeuMZN
 Tr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783464234; x=1784069034;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EnMMO6XRJvcdXze8ZNpj726nr1qkqlMgc3hRmwu5zpY=;
 b=EeNj0wVSzq5bTlgxxm++FfwkYry4QVti+Xbv6zj5GBOu1HY1xGTtXpxWLRqqjaZ+Vd
 gLWpZoL6g9Vu5hgcwf6CbthZ1gg5wxLU9/2QqpGvXxqOv9ROQVU8I4T3UQ814W2dTq0x
 bTCKXFZwBxgsJ3mH2yZH94m7JDoj2xFPDzQKIryisoAIWREHIIeX3U99Hfw+Y60YBHZp
 DWDP8VecqfSR4zczB5VaiudTypltsyixpr5JnpZKmJnc4a1AUNklY5f8hP9DzvzeSawx
 eEXdaa5LPEd3r40M323J78QspGB2Dtspu6tPebHqxsk9c124wCpx2qfBM1VPxKRKi8uE
 AOww==
X-Forwarded-Encrypted: i=1;
 AHgh+RpPHatcGs/NiPMOzW13AV0+VST2PKUz71AxZwLEEAKPvBiwucOI6AEBaaq1RKWf7PfZQqi/YsWyYA==@nongnu.org
X-Gm-Message-State: AOJu0YyWUdqGhxysxILo618auFSI1jJCdakgzIGX1ZAX449yTS0hzC4K
 KMktZLIQHjB7Xz9h8Rm22Isn4uWgVo2HyDUOcGm5+CEex9sz+DkL8soRvhkymM01wq0=
X-Gm-Gg: AfdE7cluvMT8PZeiWHeUZw9+mVMFPLQUHnZT5QfFpmPVVwbeM4ADKnCJ2ghFowjP09v
 zHmVPqL4sBKOT/64z/25U48YE20EYIhZNiHrr3KNteuj3D0RZKH6JMOmhqeEQI3IkcT3VIPLzMx
 1/LVHeklkv11B0/dNksIDUd5cchAutz9sz8E9MdD3kteze/84b3e0c7BRnuEL9F3GHed8dlBude
 yQggS+ShNLEZg5KaO5J1G8/y1vtR0aL4jYgE8J9fu6EkhxCuju3qbQXlVimuRmZ/Du1Q099BIQ5
 ottxR32fPKIV4xoft1IlZ9f2mUKXXRberN4bnqaaDxGzrb8ZKv9obvVl6TJk7IH0HFFyC2wZtrz
 Vba6ijUWeF7Vb3w/1MioEzE2s8efg34CmtLRPG38rVHwftFotxR0062gGePUQJSPWkvY5GegtOp
 W/pFJt8KfkrT83q9yaHCduWEiumCHc6EXyL54ceoM=
X-Received: by 2002:a17:903:2344:b0:2c9:de53:f84f with SMTP id
 d9443c01a7336-2ccbe728bb0mr63110775ad.19.1783464234442; 
 Tue, 07 Jul 2026 15:43:54 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:46c8:dda7:40fa:8958])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bbaesm18183805ad.57.2026.07.07.15.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 15:43:53 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, jpb@kernel.org, lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v1 23/25] docs/interop/firmware.json: Add arm-rme firmware
 feature
Date: Tue,  7 Jul 2026 16:43:04 -0600
Message-ID: <20260707224306.1202330-24-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 docs/interop/firmware.json | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index 421bee0e5ed4..c68d7f5013f8 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -161,6 +161,9 @@
 #     options related to this feature are documented in
 #     "docs/system/i386/amd-memory-encryption.rst".
 #
+# @arm-rme: The firmware supports running in a Realm, under the Arm Realm
+#           Management Extension (RME).
+#
 # @intel-tdx: The firmware supports running under Intel Trust Domain
 #     Extensions (TDX).
 #
@@ -229,7 +232,7 @@
 { 'enum' : 'FirmwareFeature',
   'data' : [ 'acpi-s3', 'acpi-s4',
              'amd-sev', 'amd-sev-es', 'amd-sev-snp',
-             'intel-tdx',
+             'arm-rme', 'intel-tdx',
              'enrolled-keys', 'requires-smm',
              'secure-boot', 'host-uefi-vars',
              'verbose-dynamic', 'verbose-static' ] }
-- 
2.43.0


