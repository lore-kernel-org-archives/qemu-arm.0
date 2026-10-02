Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59101CA5FE5
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:22:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjkm-0007dl-Rx; Fri, 02 Oct 2026 16:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkj-0007b0-PP
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:09 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkh-0005qz-So
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:21:09 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-38e42560ebcso2089769a91.1
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972466; x=1791577266; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=osGTHClTLaBLi3JCE0COpcCCRCh2Va5dTzvXjc97G4M=;
 b=P6bs0dn0uBumYgQKRmMCsuYYUw6gL4dDh/Woy7r6Ht08a2ay7xa5ujAY5YMeu/gUBi
 gisJs9Qc2G/HYT9kNkgE+4+UIyrhr5iwbu34NBdF1RGSfxb3Swm1c6661XGdNN0e4T0j
 HcQgxer/xM4+DRNEn2v4er2V4MPnBMp8bEY3oaP59sUuUwtTxZxf3E1LrKDu6h6z9bvZ
 Dt6Isp87e/SeQvVCANvf8KHvZMVR2REBEYdVKQcUNtx95e0FIaMa81WnerEePVkWN+rC
 3J4JTVpukUm4ujDBW96sIJ9/qfLR1Kn9BuoijT3NP2q60BJ6RTWI4D+AfLwyY5IkekgV
 uGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972466; x=1791577266;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=osGTHClTLaBLi3JCE0COpcCCRCh2Va5dTzvXjc97G4M=;
 b=VOzE915f23SlXqjee+NRporG6N9eqPJldsNXade9ejOSYIc1NpbXdZ6wis/HcQi0pj
 YqBK7kmIHNZnUw19voHpFDY3WOXJnsi9Cbk/mHDBt8tdlOM3peBdSHSYtl8QbK3mjVet
 sz6dg75qdSe9aXf+0kJk7WYpNdL6IRCdUNMeOgmyrnatc3pXyNWrdgXhKia7DEzsLf8N
 RTIbnPHda74p0tWwPzj0kN2X8T4AamZ5JOCrvP2NnRWvMElmR7X/x1xJYs7gJEQj/H+O
 sXm1yS5Std8S8eJIWhfz6P2iEOxsoC36V3s2ofzqunJ1NTXn8c2BzxkCRwnIHqYxMrP7
 BlKQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy5stbHlvQwXSVKhy0xphjATD/QI23DBr1BJx6zgCuv1xJ8F6WNoNerq7iNw6aCDvACRIJ3trnMuQ==@nongnu.org
X-Gm-Message-State: AFq9FYIQG3bVUKefb3taNJwDt5MJ/OPEucZppogF3gwCO6TghruV5AMR
 JiL2I0Omu597pxXuJdF++2FR/7Bg+NMH2TGxAD0ZZBXBuwD4AYWYRY/804223t7afBI=
X-Gm-Gg: AYBFou08VaL0A4B/TqzX5ymPhbDZxPeyZJ60JXXw4qUO9Vq+ZsKLvhskRpN5oOR1gVQ
 EkrmiJMTX0ATKkQvkTxEM2rtT25jXU/TZiyL0WqLdyMjaFl5EeDpenV8qh0OhZQ/127zbwr90vk
 l7jwb/9+0t4qwuyoPqbrgibM7ZaV5H/XwMg+dpQpTdf2OSRtUEtxucItK2aB5XWe2jdtPjuONqA
 KaRaTHXzEcHt0FqOZTJZEOxmKS3ZJA8Py5hw9eai/tHQf/OeDirXyMHp+x0XOIxMRhunUj8xQLf
 P7w8TVpTCXuX/mcQ3BwCfIdWHjHENeGX6xO+0Tgs/uFTSIi6v/6VR7mgA3XogVd3L23YuCbkDA0
 jhPfJTDD/O9DjFvzccmCDxeHo72n9mK/fuopR50l0fC6vWAWZSU47yu1yOYjFKOIRDjpAo3X8xr
 DmTJl2pP5NwvCcOOphNtQ3xCFBbY0BaA8bFEdFMyml8kwN11tmMrOdLPQ/8LtEMvabPYlj9ZSr7
 Fwg9WwOVZ0ZIDuUcA3k1+n8
X-Received: by 2002:a17:90b:1d43:b0:3a4:c028:fd6e with SMTP id
 98e67ed59e1d1-3a7872b30fcmr245268a91.30.1790972466350; 
 Fri, 02 Oct 2026 13:21:06 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:21:05 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 20/22] docs/interop/firmware.json: Add arm-rme firmware
 feature
Date: Fri,  2 Oct 2026 14:20:24 -0600
Message-ID: <20261002202026.1204110-21-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
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


