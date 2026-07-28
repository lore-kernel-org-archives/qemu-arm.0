Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEDEC54F5B
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 19:29:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wonUC-0005M7-7x; Tue, 28 Jul 2026 15:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonSY-0003cF-3Z
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:27:29 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonSW-0001db-1c
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:27:25 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-38a0c7e841fso221883a91.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 12:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785266842; x=1785871642; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=osGTHClTLaBLi3JCE0COpcCCRCh2Va5dTzvXjc97G4M=;
 b=aA461d18SCgxJJPLdJpLmuedoq8/77lD+ZTGHV92ZIUr2ok8EZlJAHK9K08Le6vy1d
 ZbuYi1m/OBmMf7qkJSiblzt3OcMzqejZ9fN/+EWMcJxuYYoX+Aci+sd06lNRrN826LaX
 tECLnSZMkHcNfPJsrwKc+/RsG0/WhcxXduSD6TskeCAywyW67TfzIOfKJXviAB6tmmbT
 ftxwe7Q/GCZQs4t3XAUrJSe4RZTs2clSMc5vGaFL5AiraxdE9mYvRdXFHXFby2WQRSAe
 K9TQzpqrAGjaHnHuk235Nc7l3HWg309NRtJaSF5zj20x81p7tpDHGGTdyLF3ofZmhE7j
 m6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785266842; x=1785871642;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=osGTHClTLaBLi3JCE0COpcCCRCh2Va5dTzvXjc97G4M=;
 b=ZaAf+fTrkTZbQn65izfpxRmTwn4/ZgZf7v2j2w5ndZtNGtOgw4557vF6vo8lWE3/Ec
 3xvG6ERTsmLt354csoj9Z1ltZ7TRhMVACHKPka92uPv49+JDP0mwOZndZz52Uo83OF2P
 8PAZaSy47/X0Y7Nw3x4BAOQILFq2cAKmeGD9uIY5U20ES6indVvkGH8H13rRInX61Hsh
 lkDBJEm30gyUd+M4bVQYBhx3BxV427EkSqkI/0c95xvDKjXA59qSgBzteueOeo/i+wPL
 Ndj6ooPIcCq31tXfKEUH6Cs9wvDmFXxOcQEaVRIbiVn6MPJloZ7JnPY5Cevu9wlDENJp
 tzWg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpFhgBBkqpuiXvVet3FVHzWoMN0zpHKNo6S/T8DnFISVi0A4gT3szUC5H9OLGtVh/EK1m/Y/Uil0Q==@nongnu.org
X-Gm-Message-State: AOJu0YzI2El3PJOoU2xG5TxePeK6HdrxNmKz9w//rE/knCgNpCcdpBzr
 ZyCMqwtv3iduis4boppe4+pVaPaZaDqrky2LftY3MLB1uSYXERud9vkHViNzOJo4tzM=
X-Gm-Gg: AR+sD112u67mlBg8MIBBRT6hSRv9zzulZZttkw2YkHI7Ss0PkHYVkP5U9byIxM1Vu37
 1KgVnKTKd9upOwgZzsUDMLAUb/v56snK/pY2sXZ7fgYt6cOOLh0PCvcjP1IoyLkq9la83Vy4qI0
 lCCTI3+8aUHI5ek9draktNGpOnyCzELwXfw/65snVNTtSj3fPpBs6GoNosvR3oholq+uEyK6K8R
 SbG6ZzPVmKbClROwJcGEs/IJl5u03NDLsSNGZNiQ9snm/E7O1mxImDibc92a/gsRqK0I0b2+cog
 YdwPfOKhm4t6PtSI6Hf0QS4k4n7x358egt2vjSLln0synnd3GgZonZz+BO1z5vM3Seb0RtLVR4u
 V0wn/SdRYGY5AXs/7cR4Po3FaPkigxgPiDvR622XLJIp8vn/Pj+sr+iNs0SSxijdfx326oOv8mq
 S+qfjZOJ0VRtuLSNZKztktb2CZn9Dh
X-Received: by 2002:a17:90b:390b:b0:38e:2f21:3bb5 with SMTP id
 98e67ed59e1d1-38f6a4e3667mr4131018a91.21.1785266842244; 
 Tue, 28 Jul 2026 12:27:22 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:b9d1:87c9:a085:86c9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f7f1353fdsm372650a91.8.2026.07.28.12.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 12:27:21 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v2 22/24] docs/interop/firmware.json: Add arm-rme firmware
 feature
Date: Tue, 28 Jul 2026 13:26:28 -0600
Message-ID: <20260728192630.240375-23-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728192630.240375-1-mathieu.poirier@linaro.org>
References: <20260728192630.240375-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102a.google.com
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
index 421bee0e5ed4..2850b91078d9 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -161,6 +161,9 @@
 #     options related to this feature are documented in
 #     "docs/system/i386/amd-memory-encryption.rst".
 #
+# @arm-rme: The firmware supports running in a Realm, under the Arm Realm
+#     Management Extension (RME).
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


