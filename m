Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A2CC624DE
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 19:39:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2DF2-0001iy-Mq; Thu, 03 Sep 2026 15:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DF1-0001cy-2i
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:55 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEz-0004Pt-Jv
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:54 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-39927410578so273312a91.1
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 12:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788464212; x=1789069012; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=osGTHClTLaBLi3JCE0COpcCCRCh2Va5dTzvXjc97G4M=;
 b=So5Pf7G+LgLVTNZwsLenRxfkN3wO0OHsQXlgvlL353yZ4/PL4ME3+3Aw/M0zeqcdbO
 vX/JO09aMalbGTy//r0bK3u/H1rMr3T0hHZ6bzH+8Pl4HRP/Y9VhJJnP7CikRfGTiGka
 LCCV5ImZX/0SHrkzNf2cSi2gOCmpAxoL9Gcvqr3emow+XMThDnNLlwytlYjvVMpO4AFe
 XoSwotPmMQo8dF4YiuqYcac6DFoKPpx0RywN2yrIloxbSGgjbfcHCqxY1ANIctgiW2fE
 Hvs8/IEea3JhvVn4KD2UZQPjvSdFTYoWIIUPYYl02+SqyNgF4IF63K2iyz8so1A1Z0k6
 O3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788464212; x=1789069012;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=osGTHClTLaBLi3JCE0COpcCCRCh2Va5dTzvXjc97G4M=;
 b=WQewrWxr+nqz7oe/QLpy9OD/fTuMtqiSkQGRZ+85YDE0U+skGSN6hWeC7Ap+GT4TB6
 atIWE7ck9ygbp6ufxuyfC0AH7+atWPPDvPtyNOIE3cSoS4zo9KRd3nDMI64a+ti5hyKa
 GWZi0FG1r38Yx850ZEu4nV3xQ6u/K/06KcqfoHTkbYRUnkJ0vLdaBhY4vKVo5mZ3JC4j
 /tvVVcKdQH+6S3lu3w8YIu9lTqEsyyI5ukEJrBPZow6JNadsXxyntBx/mmYEpKnyVKuT
 4SCFJK05j4c0G728oGgkqx/GgzvYPmHuPeayN4PsjJlzPwzt//c8tIWhlYmVCfqfN+9D
 FHVw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy60M0d4TQ6z89RzCRUc/U6vRNggW+ELH79e/z/MGz/xskeavvclJtfu0Rn5Z1RipLN0rmT7kKkLQ==@nongnu.org
X-Gm-Message-State: AFuF++mjP3eDo6diCfLXUPCzCzZ+L75uTcsqGlqs3tlHwc8AQa0sU2J7
 wvEacze9T2Os/7m1JX1RtGAPUMwCyItWsbl2RozEn92Lb8rIAX9vLTlvc/m6iL2rCtw=
X-Gm-Gg: AYBFou0AdVas4g1b0BLrZAi5tyOWcN3kfDI9tHz/WrjVVN3NYyyn/0dw4b/DYvnLWzo
 00Ba5F9T6MQKnmwJ9V/J3ot8avyywkTA2AMA5nT2kDjZAQhAdIslL6z/o0YEzLNx7yTOrd9TNz+
 bXcsO635i4yGRlihXIMSpu1WeRxBmwOGNhvoSm4we9ej3Hf5RrOzCdceAd9ZOiiS+RAUhIBuHX8
 GTU/zImgbiYwbZgLDS3Vq4xONJfIjRZEr/aROu+8d/6ebE6i2DmK1n83kfb9nWFupdkiqWtN8pM
 EX3m1Il+/+rpOZOHbwMyc0Yhyjx4uGpFjyPbmTeT2S7m/pU1lHJ3p6J478TvsZ7Rfl70cmsAdvT
 Lzaw40bsq3atR7DDpYqLKg/v1BBJNe8TT83PDNC4m70bAqrKS9ICkqs29/+t2LI8YUSkadddiKN
 LvVHKZgTzoRLqWzZcMiaBZyxhEcg/pItwyk1AIAcAhmXAuoR3+Yu9tOu7Mk2Ry+tP07PLEJ7n9a
 EtqSLssdfQjZSg=
X-Received: by 2002:a17:90a:d610:b0:399:1b08:28de with SMTP id
 98e67ed59e1d1-39b2613259fmr1288284a91.7.1788464212290; 
 Thu, 03 Sep 2026 12:36:52 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b083e4fafsm6836951a91.1.2026.09.03.12.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 12:36:51 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v4 22/24] docs/interop/firmware.json: Add arm-rme firmware
 feature
Date: Thu,  3 Sep 2026 13:36:09 -0600
Message-ID: <20260903193611.1058589-23-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102d.google.com
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


