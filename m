Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEED1D6E2D1
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 18:20:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWIau-0006Ux-Q2; Thu, 18 Dec 2025 13:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWIaV-0006PA-8n
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 13:19:03 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWIaP-00031D-AD
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 13:18:54 -0500
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-43246af170aso567184f8f.0
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 10:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766081924; x=1766686724; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bvj1AJund8BJzCKIAsZJhSHjk28uN32H7UcwVRZ2KTY=;
 b=v33p0i4VKUWoTrO5d25jBdmpuJ/6wkvkpqkZpouGO52lZpi6RRDN3mPlsMxjhehcu5
 JXv+3BTR6qsS3Q+YXKOGNtY85jciKbHGbdYJEfTg8GqiJl9aGBpfc3wKj5GwlbKOnsvw
 FoDUOE/N2gD+lkMsquR279yJiloaNjZ0eOio5poMBokTxvtzUQCU9/ZW2AwZD2sFh+SX
 MTmaaRLVZCi3zHg2dE6ug+5TSEFJX71Nfb6H2cUDqjbkm9ptrv62S9oamIo+p/49OpV2
 vdhSDaKE52miIfGdOI5HhaUU/xYTBIBLpSkc+rfIyKf9wlF3inXo1kRB5Aze5DXGc10/
 HDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766081924; x=1766686724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bvj1AJund8BJzCKIAsZJhSHjk28uN32H7UcwVRZ2KTY=;
 b=w0V8pvkctgHXQ0YrzkwUmQ6D5S2td4etiErrvums6E96xxopLP5R+NZuTlczy1hL8Y
 ZkpdztB9GFHRbuxQOoQBq0ivdcJ1RyNUk584RMT8S3wGgCq+mqmY5tqVW5DpRkqtvAhn
 dgdDVWX5SGu1XQuhHylG86izVeCpdvFKvJVmer39sR7YN/JPIzZ9SQz1wTP99RAvwhrZ
 iRKrOscoMlraK1aoYv0wGRvnmtz9mZpUNXbjTTBOMqokEkGLS64etUPfFYinyEjt2P1t
 1sM1EI/2cHV9Zi6DBAi4znGh5eckLVr1RfwCP5RHmcFtcjENRbLDUDY1vT9ElfAVzn0k
 G0hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8+V/yeSSdPZ+0NnAy/jLSfxf2cEjIuOobfZGDAFb5lhZ5+zjFWG18euxfrEK6wZMZSNVvHgVRzg==@nongnu.org
X-Gm-Message-State: AOJu0YyXO6UvdyeynMdoNl4l4jN1XX2B+csWyjJexiat/AgSoNcqtDnb
 BtdJDaq3ivpShxbG4kfCrl37YZ7aDoeVGQLjcc72z3bBvQa96pJ7NeozwlHxGay8JcY=
X-Gm-Gg: AY/fxX5awwaczUqA/cSZUxONroloCJU5iqL8qnvXq2CWon6Z9149TMbuKD7E4XgCQN2
 i1Vx0RpA2Gumm6986dhSBl0rxw0DcIOVjpp4BVeuK7DYrP5Az3PWu4GGWiCpMMga0cdGqbJOCZ9
 crH1UVRiR8+om5k7+yEV++SqSmcAX6MO/Krd3Bm7pkrYKHtCPOsUouoWb4oM7csHiVqBPEtxZUQ
 tw9U8nvs/ad/xQjPWHEjrXy+ZnzI8uIVsS5i2Brd8hkgraYjDIMo5ParnrTZPM2Ei2dqJiMr+Ap
 +VL1XUeqU8wDTYkV3gdq+o7UqE874ZmS0vnIw/4LQAtliFrLiqXl0AJUTcJkvD8KKIK6bwG9Db6
 MGqHBvb4jFCCeAo/zifb5kQTi6+MYXsr96VofM8F2wmo9TnY8pYrAmP+4r1FqNwjbWVWlzc0Ale
 z/dzxPmyep9T+Fvg2t3URlfAsUtL2m0KRFbAzeB/MRQEwwcjNi90L3IR0n89lX
X-Google-Smtp-Source: AGHT+IHHuTTKYx9RGCYajCMCUuN820Kiap/GpFsIBYAXwUF34Sg0U5YEuJQg4DCduJdHoGUzZRCizQ==
X-Received: by 2002:a05:6000:250d:b0:430:fa12:3b6e with SMTP id
 ffacd0b85a97d-432448bf55emr4584653f8f.24.1766081924100; 
 Thu, 18 Dec 2025 10:18:44 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa08efsm199771f8f.29.2025.12.18.10.18.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Dec 2025 10:18:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-rust@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/6] hw/timer/hpet: Mark implementation as being little-endian
Date: Thu, 18 Dec 2025 19:18:09 +0100
Message-ID: <20251218181812.58363-5-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218181812.58363-1-philmd@linaro.org>
References: <20251218181812.58363-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x443.google.com
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

The HPET component is only built / used by X86 targets, which
are only built in little endianness. Thus we only ever built
as little endian, never testing the big-endian possibility of
the DEVICE_NATIVE_ENDIAN definition. Simplify by only keeping
the little endian variant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/hpet.c                  | 2 +-
 rust/hw/timer/hpet/src/device.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 1acba4fa9db..bfad626d5e1 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -648,7 +648,7 @@ static const MemoryRegionOps hpet_ram_ops = {
         .min_access_size = 4,
         .max_access_size = 8,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void hpet_reset(DeviceState *d)
diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 3564aa79c6e..4f4be84115e 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -708,7 +708,7 @@ unsafe fn init(mut this: ParentInit<Self>) {
             MemoryRegionOpsBuilder::<HPETState>::new()
                 .read(&HPETState::read)
                 .write(&HPETState::write)
-                .native_endian()
+                .little_endian()
                 .valid_sizes(4, 8)
                 .impl_sizes(4, 8)
                 .build();
-- 
2.52.0


