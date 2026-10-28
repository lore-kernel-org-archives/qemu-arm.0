Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A84A606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AklGrNVy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMAUl-0008TF-LR; Wed, 28 Oct 2026 16:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eballetb@redhat.com>)
 id 1xM8Q3-0001SV-0C
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 14:30:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eballetb@redhat.com>)
 id 1xM8Pz-0003pC-9U
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 14:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793212230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=thLyieOpPvLCoW9ANXvYnVKzM2/+Buze1ELJljt++oI=;
 b=AklGrNVyHjgIOHYD7xIf+VcK0w/seqQBfivcxAnxecvNnzbebeN/i/7xyd/fQXmyNiRBJ4
 4hI8e9h4xx2vLgOEnaTg9cjimg8p+igZNiSGm8NYqndkXe0R5bUL9e3X35vWD3dn42dmoO
 AVq9TAP/idUp6yPFTqMpXLT1NmvT2D0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-5CjUw2QaM32m-PYGCA0LQw-1; Wed, 28 Oct 2026 14:29:22 -0400
X-MC-Unique: 5CjUw2QaM32m-PYGCA0LQw-1
X-Mimecast-MFC-AGG-ID: 5CjUw2QaM32m-PYGCA0LQw_1793212162
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4a47047a7daso1285395e9.1
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 11:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793212162; x=1793816962;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=thLyieOpPvLCoW9ANXvYnVKzM2/+Buze1ELJljt++oI=;
 b=AyhSDJydzdsbQjN9eJ1SEyYIt4V18/eWJqlq4MHWGXvjgxmvE9q9F1lio0UsLqmPTh
 NR9Sf9ldlwMDAlfY/twHeFsEPiXmJY0kneOqqoObJ2YLLg+wZy4ITXEJ0qi5YNo09v7b
 kCs0Ryw36+8tNOtIm/Y21I6w6ljcb37AuTKt3yb08ufZmG8vREMIy62JNP6vsqByyION
 zJyTj2AGsMpvtw5N+WGxN2YVC1s6giilDNH/XIHvxBg3hrG1h/oBhrDei5+v7yhm0ZMx
 vRGizg62v8tqLkXYnZmUIVQVmutFMhNe10B8NiEBiF2gtWBm2LEZZfGZxdae4FWs8nyI
 KQxQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByo5zGMqii7DttwFyPdA8dKj589NygslElmxh7gsTwA1V4SCy1lABXZm8Iy8g3Nc4n5SlNHkCeYxw==@nongnu.org
X-Gm-Message-State: AFq9FYK8zQNKcNQldjkeLIY0hJsTN1ejUCzQaqcq8/Rxdt1e+ijDAx45
 s02g+S0Hblmb79BOl4XrB/gsCESen4QMaR19C//i2lpTMBxSjjwZX0DTtYF9+fM1jf8kF4yaEif
 +5td9z5xWg8P5a5XlSN/4+QI0X8RRMZqd+39MblaE6uxrmlCkl5ov4g==
X-Gm-Gg: AYBFou1Mg+YZ4wiuLlul30l+0imUd6p9dbopzcnh+Pimo+xpUlhMcvkQgBbLlp/NI1X
 KuVA2hTNozZzDE5i5bnno0+tU98UVskENJhPjfNj/JXEdyvcZiVV+cvb3cixOFXUR30lw+l+Q/i
 3FUGjnbBtR97OBZ+RSfNvy587p0sp3jPCk1e7WULBgQO4J8Vq8veldCAlwU9uD/r+oFTxNT+u0d
 LXj6RYYk+pobgjnB0Jx6aJL/pNDHiIK7LQQ2xB90dYZhdRJdAjPoIgbABjqwTyM75QEIn4TMDbO
 9EvXT6p+UZf9LjMgc4cUs3F4HR5ujX5xffX3ARxPXH5EI5B7DrwE6P5Jw0RooSn626b8sTnCZMo
 GWwRk5rKPZy08U6DzJPTWoziK1t7mW9WixU9hRvudNc/Qxv6BD6vLmDrTenbdMEvNVnwRDMg9Kn
 nx178kfJS0+Mdnmw==
X-Received: by 2002:a5d:6dc1:0:b0:48c:6611:82 with SMTP id
 ffacd0b85a97d-48e5d2e44a3mr6665161f8f.1.1793212161662; 
 Wed, 28 Oct 2026 11:29:21 -0700 (PDT)
X-Received: by 2002:a5d:6dc1:0:b0:48c:6611:82 with SMTP id
 ffacd0b85a97d-48e5d2e44a3mr6665115f8f.1.1793212161179; 
 Wed, 28 Oct 2026 11:29:21 -0700 (PDT)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net.
 [83.42.172.119]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e6419e05dsm1202034f8f.19.2026.10.28.11.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 11:29:20 -0700 (PDT)
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 28 Oct 2026 19:29:05 +0100
Subject: [PATCH] hw/arm/virt: use alias and baudrate in stdout-path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261028-stdout-path-baudrate-v1-1-34281c1f34ad@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBtQI5OuEi1Mx5xNhVoE0d2Tl
 m/x/wOZElOGsXkg0cWZ961Ctg24aLeVkH01KKG0FMpgLn4/Cx62RFzs6ZMthM71ndE6DMFIqOm
 RKPD9b6f5fT/h6ShkZgAAAA==
X-Change-ID: 20261028-stdout-path-baudrate-cc53866f7f81
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Enric Balletbo i Serra <eballetb@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793212158; l=1685;
 i=eballetb@redhat.com; s=20261026; h=from:subject:message-id;
 bh=OSD5BQa16kgwy6Y1nCOcGx3BOmhoSm+lOpuNAc1Wqho=;
 b=laNukuk51bYDmeCnjME8LnC4Q9iwILT3OJck/bePOj2KrLwFKgSfkDDZybrDMpi70zIRMnKaE
 Fy19DH0tk5iDsIKHXsy1AKp8FKyQYPO6NdgO5SjJBnCCfjGPFJBq9r+
X-Developer-Key: i=eballetb@redhat.com; a=ed25519;
 pk=5zh6xuAxTiQwglL2NXQFqWuyRPmCE8T5KPXLbNXhnKI=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cZRpEY5_Vwm7_hTg-Me6LexK_odyqa6EiOA-57Gwspc_1793212162
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eballetb@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 28 Oct 2026 16:43:36 -0400
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Set stdout-path to "serial0:115200n8" instead of the raw device node
path, so that Linux can automatically configure the console from the
device tree without requiring an explicit console= kernel argument.
Apply the same fix to the secure UART stdout-path using "serial1:115200n8".

Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
---
 hw/arm/virt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0d56197dacee..d93850feafa4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1529,8 +1529,9 @@ static void create_uart(const VirtMachineState *vms, int uart,
                          clocknames, sizeof(clocknames));
 
     if (uart == VIRT_UART0) {
-        qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", nodename);
         qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial0", nodename);
+        qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path",
+                                "serial0:115200n8");
     } else {
         qemu_fdt_setprop_string(ms->fdt, "/aliases", "serial1", nodename);
     }
@@ -1540,7 +1541,7 @@ static void create_uart(const VirtMachineState *vms, int uart,
         qemu_fdt_setprop_string(ms->fdt, nodename, "secure-status", "okay");
 
         qemu_fdt_setprop_string(ms->fdt, "/secure-chosen", "stdout-path",
-                                nodename);
+                                "serial1:115200n8");
     }
 
     g_free(nodename);

---
base-commit: 29b1dc631d6ac6bfc39464e0be8bf4cad556a591
change-id: 20261028-stdout-path-baudrate-cc53866f7f81

Best regards,
-- 
Enric Balletbo i Serra <eballetb@redhat.com>


