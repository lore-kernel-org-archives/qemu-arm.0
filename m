Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D98E606A326
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 09:30:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOtm7-0006yw-FH; Thu, 05 Nov 2026 04:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtm2-0006so-E3
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:28:46 -0500
Received: from mail-pg1-f180.google.com ([209.85.215.180])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xOtm0-0006xO-NI
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 04:28:46 -0500
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-cc4c02ddd62so1071730a12.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 01:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793870922; x=1794475722;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1BfKbNBFOgpv4Y4gegCRNCEDAhIiNTLP3qGg6/c2kSc=;
 b=FQbzuveHMz6jiI86AY4KsjFE2Cv2QRjzm12NjGWmeNZJjiMkKskhydIoqVEzTvwAgh
 H3NqqsP+Ed6N1h7Hf3HEn4vW3Kc9ruJCfNRzpPNu9atfM6SHzeIIBHc8IIyGxOHLRu78
 qPT5h3MsJocKyRG0KxcYc9X4vSweTlDM05xDblb4jekn7CaPejdFuaou9NoO93FfJZcY
 1NWK2kKb6vGdnRyOJ8XdDEaAVi+8MYXPXqQCIUr6zcF9xXEQobyAisumJvbdCITTrnk7
 e67+jYwOlqlHK8YmmEz7L8ZUGlqYCsXuQjEFGSwNMAEqDcGNYqcQK01hO5EQzUKl0OpW
 xP2A==
X-Forwarded-Encrypted: i=1;
 AKwUvBw8EoaeizPPM9iYr0xRzLktSWSRKX85ZI/NwcEFXsfzIses/PkMRWDghk5YdhRPIu811gEfBWEDKg==@nongnu.org
X-Gm-Message-State: APuU4Z9FpUHN5GmDxS904sjCphiXDV0rW2HGBjHzQjemiwlB3EFVHzkB
 /IgkrBtIS89bXoruBFiClFSwbKWXCGETqs7SM04bZbWjmX/oIcyK48RM
X-Gm-Gg: AYBFou0UdPz7rui75I6Fke/m4i8/zH9uyIZh20iey29vlR2ta1eDxfCmaLK6ZF+WFF0
 Y+vJ+w6lN+Z2KWX1bTnluHzI7NJ+M/t93I0xr5MrlrMZ46Qx3iNdFQooBiwHUpC9pbaTXO9iXjn
 3FaubLXiLDEZVDrCj38fpe44ETdvqY0jD6UaF+VxC8iHZwqB5GKxAgtbtb8o5oDUiimWwwfIazC
 MZSTLTdBwyoG4bV3f1jeP+7C8d5nEkxlRQEPUiGzvkZALpbwdI6F9sZCnKYqOiCfGRI0lE08yRd
 BfwtQPY4YGXI/Jd0lM9uO6ot6p+bEjkFBqCpb2VIvq+qpXqytAaxyQKpy/n+TyJpOg0sb7kJ1pu
 3Kz9u+Ik4EykXnl3xxlQrVdM05Xqhs1b90v+VpB22i9scG/L38Wrm+THMi5QamkauA5GNxXlrYZ
 0d7M1BOgo8oWVirQ0W/l6W+nWEMAuy/8d5otvQeS9lzLmSb9/Uq/Bnzm15xJAfIR4YHdXlRQTeF
 x65SLdzJjslEEt9bjvL0ePKQ6w6/jgksUfAdu5RN0I6LvT1cM4gwCB+5bXfnwoJDAgj/SGxGdsW
 HEUP8BZJXELQsp/6hseS9IzYzxA/37XFGDiEqYD6zgnlN8xFulsGzH6c/3irO35baW4Tt2/Gjwq
 a
X-Received: by 2002:a17:90b:2d04:b0:3a7:82ef:bcdd with SMTP id
 98e67ed59e1d1-3ae898392c2mr15401312a91.41.1793870922455; 
 Thu, 05 Nov 2026 01:28:42 -0800 (PST)
Received: from localhost (118-163-122-149.hinet-ip.hinet.net.
 [118.163.122.149]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b0b32812a6sm2905960a91.11.2026.11.05.01.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 01:28:42 -0800 (PST)
Date: Thu, 05 Nov 2026 17:25:46 +0800
Subject: [PATCH 07/16] hw/sensor: tmp421: describe the temperature properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-sensor-tmp421-v1-7-c46853f5e1f0@free.fr>
References: <20261105-sensor-tmp421-v1-0-c46853f5e1f0@free.fr>
In-Reply-To: <20261105-sensor-tmp421-v1-0-c46853f5e1f0@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, eblot@meta.com, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793870743; l=763;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=rdU7Q4ra6hFL/RukQf2lAq3++tTLRvjIbFGIs0BPyVk=;
 b=gHy6jygsujU3TkBwYzMUu50wtfF+0PSbeqDLhd0/lsBaXVnEZGGP/k3MIVvZKNgBcC9+ifQ6w
 wpEcfwTeFETCkS9fdzKjI7Gmk2xAE6pr84pjXYLOScuNQT6fOGoFhfD
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.215.180; envelope-from=eblot.ml@gmail.com;
 helo=mail-pg1-f180.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Attach a description to each temperature property so it shows up in
qom-list-properties.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 hw/sensor/tmp421.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/sensor/tmp421.c b/hw/sensor/tmp421.c
index 8c789a2a09..87cbd9dd4b 100644
--- a/hw/sensor/tmp421.c
+++ b/hw/sensor/tmp421.c
@@ -394,6 +394,8 @@ static void tmp421_initfn(Object *obj)
         object_property_add(obj, name, "int", &int_type_info,
                             tmp421_get_temperature,
                             tmp421_set_temperature, NULL, NULL);
+        object_property_set_description(obj, name,
+                            "Temperature, in millidegrees Celsius");
     }
 }
 

-- 
2.53.0-Meta


