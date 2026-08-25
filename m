Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C1FC61DB9
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:03:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzEb-00076C-E6; Tue, 25 Aug 2026 18:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzDP-0004GM-4k
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:55 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzDN-00021d-7V
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:54 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-c96b08cdd1cso244631a12.0
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695312; x=1788300112; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=osGTHClTLaBLi3JCE0COpcCCRCh2Va5dTzvXjc97G4M=;
 b=hIskFb4/F3DGeYNOaBsE0W/9qAkyqmwpzQGujPqrKkJOk4liSd3T8npzbhFtK+3c+W
 zDvpsuzRGaft824c3UT7sY40QtlIPQiLI7CI8vMiQfMwZxkQy0O40eAVwW8NGJ2VB+l+
 RzrrUC10m9M81fde5nZUXsp0ULGVLRat5z/RSONoCdBi7IhogFB5Lf3+QZFMirRLuMAi
 f5tZ0clRkzsafXGtypyBAEu82KtTnN8Gf9r1sdL3h0aCwcAWT+ZBIvruae44hQtA+BYs
 pb7OqzNYnS0ckdkmJeoz6JBAp050Otwjt+3i9+nYRIXVTmtNyGpwl0x+OQjEhdvfiBGw
 it6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695312; x=1788300112;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=osGTHClTLaBLi3JCE0COpcCCRCh2Va5dTzvXjc97G4M=;
 b=SS4EAGuZmIHuylY4tSHVTY2qQcZsDYaxOSLVPVHqDISAdnH4NgLdfIEFSOb5He5HKO
 rVQmIpymxFUkEQfgYfJuLlkyGxn3pHxB6fHmCQ7vczFQf7cJKncaXsyDUBTLMT6E5Gso
 YHDKrYM/yJR+ds6I55v3Nw7ObERcS/pj9SUh+4KRcBHVcxIDy/u9Td1t8HNSYi9oxRyF
 upq+a77dyPaBkd42WA6wmrAi9dk+0Up2NYoD6F86FXbGZiXhKEY2NTZ2CMKHrs/nzQgs
 9HmmV7L/RXyU84xzvk02VvIfhag7PYm99Ibacop6g8EVBuQApqQZAQ4MidAcjI+sUgks
 qcOg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrnkfYp3eVQmhM+05xHHgXx8giF7wnheF3Ia36vLVbJAeZBqh9jzQBL/XCXKLx0wk5iHS4Y+3qTPA==@nongnu.org
X-Gm-Message-State: AFuF++kT88DUH4HDDFQPowzRmr0hnDFS/aZhUWGqwTXhw8+IlkWleguC
 iyKo3XjzQqk3uOpKd8FMnjBnnppPX8qANLWDGSnVGzPVPhglzDtr4gixupyI+YTHeBE=
X-Gm-Gg: AR+sD12oZ6aAwigrHMAE0xupEfRSGq4FNyMDnWBFVANGq+PQ8nQQBiY3cwCaQErt4Oa
 QpAmEivr+yT3EyEUiRyeBmee9yVyTw11o3oBaU9nNiClM/eA7BW/xgQrsy/oCtAMn4CIUN1pkwW
 MYuAXInq1DtgPSOA0huvAYL5L0TT3+mcHm6KMQS+dnDNN9MkcYhrgd81hnZ1p3SwEVpQTz6E2u9
 huZn72yLJghLZoR0imx+5OrRgffUl6BO/uHQlOfq+x/m3b+74ejqUH74jEinVWHiIrzc/ClJLvo
 CMegPQCvnx8hBBtZfJGSS0PyOkWHp+bDlCn09mcXuLP4GBym/5ccTZDVPO8nK825NP9iiEvlkAq
 1uh0a/zzhXFEiXKWYNkEtIlpdBO7QMmZFxhwTnU8+t3q1bR/X1NkVa0pGb4QW6XB0336DExtUAp
 9eE/cszWtr4Jjx4YRWtaNPxnNCLpOUZnsK3osbZ9sCMZLoRWmqZA8YUz0GgoVi9bCjBlxwoDL2a
 8Sfsd7gux3EjuQ=
X-Received: by 2002:a17:90b:4acc:b0:396:5c22:b1f1 with SMTP id
 98e67ed59e1d1-3966d413283mr4235262a91.8.1787695311886; 
 Tue, 25 Aug 2026 15:01:51 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:51 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 22/24] docs/interop/firmware.json: Add arm-rme firmware
 feature
Date: Tue, 25 Aug 2026 16:00:59 -0600
Message-ID: <20260825220101.3443954-23-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pg1-x52a.google.com
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


