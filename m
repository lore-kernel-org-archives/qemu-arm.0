Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95FCCA5FE6
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:32:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLJg-0006Qq-QB; Sun, 04 Oct 2026 08:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJd-0006Ow-0t
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:41 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJb-00076D-55
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:40 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so8634655e9.0
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116858; x=1791721658; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jrujhK11LCtm9muJjC0W7Qf58NaA06JJ6MzYAoTq2fg=;
 b=eiS+/kEuxx0SRqN3T6mI64d4v5yCqCyQcJ3Wfp2nxt327O37EWQ68NOYR9trR0WaMP
 rC71X0C02b5RBV6tsw3s3LWaIB2hc23+o1sGMrragIX23Zb2XTK+k1PNjF4SHjfczu3Z
 ioU3N/tSw9ojlwLTnkIEBm25wp2uQRpZPzABa/Fd+bO/DuTtn9nTi9zK0g98anMVJYwL
 M4SKCaJsMxoBzW059XROBR9u1uZgokMUGIoQJ4B5ys2yX0HE3v3qH6qbc5QIf5pczFIe
 +IH6yTWwVCxuj4sTUqb1BjPl0T8zQY97mjLk3LAqnEXNJZaPye++aVxXTw26EqN8tQsG
 NKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116858; x=1791721658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=jrujhK11LCtm9muJjC0W7Qf58NaA06JJ6MzYAoTq2fg=;
 b=uf/kho76QJ8D+9DUoLUq3TrRFa44+Sexdn+gzOXoQkF5z2xcmr+kINX9iln9Y8s5aB
 nBC6L4WMnV3m5FebvoWAmmTF4GTDXjjwT7bs2X/7re81A/afM1FO6ij2l6sjq7P3ntP+
 rOcquXP/Pgv8dfkenSiDtRUMjeXOAMzsBsDV1u1iOTEjCb9VDlSC6MRNDpqunwWIHPl+
 EF1yMbzS1DXNDiLTSsKZiNtgSLwBQDz0A2Ek4cY93dBsKBgkgPFXuPCAiZwWoN7rndud
 y/Gc3AOAbh2m+185ZhmLt5KVgMx+blVffmBBXWAotvjjcJ5oxTQXWqaWGkzE7b3m52Am
 Jg2w==
X-Forwarded-Encrypted: i=1;
 AKwUvBxibbTNeBVCj1UfjU7wYG9/BspMAmSo3Nee0o97+egISio/Glujv3LYk4wTaMSENsG7mWlbZ/Ga0w==@nongnu.org
X-Gm-Message-State: AFuF++k4THq0rG4P6RSG4QK8XcSIN/y+EKrbmIhIBzW7f8DASbjjmMew
 s/P3RB4dE2Z8IFRMu5R3VZrZqyfH/Nd9+H9ta/SUZwFr0FG8a7F7eQuE
X-Gm-Gg: AYBFou1earKVi4Q1WJpb2leG9JVZrmAKWaCZIb6uLY22qnqypPEKlgVrywylOD/6zpX
 dGKhJ5zYYAvcrKaOXL+butX+LqeSgayajXPw7HR66N3JAMrlsO8FAVPERYoyEVrRPWMz/j8qaga
 PFQH5Zd20FKDeXwWLlYqVr+BJ205vjf1jejoJJdgigyhE4gB69fzIwB3bh3pULX8TElQedFNJSt
 enGYzRibZhKQW4VRqK5y8d95VkdmoDBi3YwBmxFAUvh1iOE9LNAuJh2zcjhwBf55s1+TVH5WTU+
 Tqg+4MFI8UJ2AoOM+0DrUFnDKMNd8Umrbt8nHVIiKijS5JfcFuXQ856A6s3Gs9sc0QEMUpcA/li
 FEiWIf6gIwCOqC4nHW1exA7fkWRt6PJ6Xa5sOONNZydhmhA2xvQXkWhaWmA83QmOjBN+TsIvdq1
 H6keIqEOV+HimKmSN5H/wEc2MInxbXJgvPHi3VXLebufsxKshabL1FVsclyN4CzF/g6uwHJxa3Z
 FfoBZfkjQx7u7hg+RPYiWJYgqJOjW2tcfvpWA==
X-Received: by 2002:a05:600c:6287:b0:4a0:f4:1c76 with SMTP id
 5b1f17b1804b1-4a1680b53bbmr78164315e9.4.1791116857381; 
 Sun, 04 Oct 2026 05:27:37 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:27:36 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 04/30] hw/arm/imx8mm-evk: Fix reference count of SoC object
Date: Sun,  4 Oct 2026 14:26:20 +0200
Message-ID: <20261004122647.3913-5-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Using sysbus_realize_and_unref() requires object_new() rather than
object_new_with_props(), otherwise the initial reference count is
subtracted twice, i.e. ends up being one too low.

board")

Fixes: 7bcd1f30bc83 ("hw/arm: Add the i.MX 8MM EVK(Evaluation Kit)
cc: qemu-stable
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/imx8mm-evk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/imx8mm-evk.c b/hw/arm/imx8mm-evk.c
index c3215b11cb..6de0d9c4a2 100644
--- a/hw/arm/imx8mm-evk.c
+++ b/hw/arm/imx8mm-evk.c
@@ -83,8 +83,8 @@ static void imx8mm_evk_init(MachineState *machine)
     ims->bootinfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     ims->bootinfo.modify_dtb = imx8mm_evk_modify_dtb;
 
-    s = FSL_IMX8MM(object_new_with_props(TYPE_FSL_IMX8MM, OBJECT(machine),
-                                         "soc", &error_fatal, NULL));
+    s = FSL_IMX8MM(object_new(TYPE_FSL_IMX8MM));
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
     object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
 
-- 
2.56.0


