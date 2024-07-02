Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1802718njm;
        Tue, 2 Jul 2024 01:01:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFc/84eNONg20TOnV/kfurhrZhxlW0Wuj2x1ljNU8pgJt4TtzGXB/iNCHZe9HiJImJl1Pp5u5fuA+z4VwChx4oCX4tshnU
X-Google-Smtp-Source: AGHT+IHfJZMWBpneUR4NaDUP7fbH1S5BQs/W3BuqPWJyAV8LH+hBgVHnbMl1wuJ7mlFb7nbfUrLJ
X-Received: by 2002:a67:c40b:0:b0:48f:8b56:6c12 with SMTP id ada2fe7eead31-48faf08f75amr9466806137.13.1719907284533;
        Tue, 02 Jul 2024 01:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719907284; cv=none;
        d=google.com; s=arc-20160816;
        b=imyX6OKW2bbDOdMWZKFAFiCYJuAeNBpe7seIyOoRuaggx5vf0dtebziiJMjl2xFvfr
         vTB17pE2Mfp6yRsfLDvZ2wxP8+I1gedJRO4Wzwtr3xgfhCUx+e2tcQ3lvdCOUMPSxXGR
         agohjIqNzaUuqh5XnquVKYK3W8zvNU5tjGRSuEq8jm35LIGjcGPpHyjqiyPhXBSa7s8Y
         VJNn4UwwV/gVj6cwp/TI70udzgQy80UmCEr7ZbxKYOHkfvibR6IGq0hDFiPLOWqspSAb
         m7A1k0XOumIKuh1osPH8En/9ETiOsysfj+KhXhqCriW6MopdreerjQ3Qzk8wvTM69ajD
         jfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dvLCFMy9DiYxmZbtVAEmVqyO0aut3yGWie2WrB5x09s=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=O1ZZGJzNzAl6oJCX5jjOnbaq0iJiN1gz2+sHq5Wf5phFAvLRz9p/by0H718VOijQ7m
         /h8qVGcMXXpoDJTce+bLXrwsOMfakVHbIlQDhh4CQWOUwFv2a2ov+r1AQFAgG54jgQq6
         /QI7hFhuW+ErKSRiNZfJkMi1OOeiGGBHFqrsw8Rkk8PA3zQfNiLI2l30gc98t/QfLdhX
         2PWNeie6ftgJLVoYWCTGgE8z0xaZ15BBOHYRNzoRd0A4cEu4NzRkHUWRk1iKMDAvMtE/
         aETsH1iRBRbs17N/tygiXOCVuoRwn3IA5axXkV/NeUR86wYdAoUd2IEUgd0RAntz6kk3
         tXIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g+juKGPt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d69262b40si958738585a.77.2024.07.02.01.01.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 01:01:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g+juKGPt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOYRq-0006Mn-MK; Tue, 02 Jul 2024 04:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sOYRk-0006L9-Bf
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 04:01:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sOYRi-0005vQ-IX
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 04:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719907262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvLCFMy9DiYxmZbtVAEmVqyO0aut3yGWie2WrB5x09s=;
 b=g+juKGPtGCjA/qpJdv6l5Srz/WtNT9sdq/q6ILSqDT47mnIm0xtm9hh2D00teO6Fp+KAkA
 y2cZN11wIr0TCVhnEUZYL6joNNXfXIQ+eJnlGEKqYdaBY1jC04mCXzK0NWUggO5bIWQuMH
 fOgS2AhRlGvVtDGb0jYDcBlZMLxBC1g=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-120-cz9jK8ygOWCdq3faVNt9xA-1; Tue,
 02 Jul 2024 04:01:00 -0400
X-MC-Unique: cz9jK8ygOWCdq3faVNt9xA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 40A3519560AF; Tue,  2 Jul 2024 08:00:59 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.90])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8B73619560AA; Tue,  2 Jul 2024 08:00:57 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 4/6] aspeed/soc: Fix possible divide by zero
Date: Tue,  2 Jul 2024 10:00:40 +0200
Message-ID: <20240702080042.464220-5-clg@redhat.com>
In-Reply-To: <20240702080042.464220-1-clg@redhat.com>
References: <20240702080042.464220-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TtzWQMly8Ckp

From: Jamin Lin <jamin_lin@aspeedtech.com>

Coverity reports a possible DIVIDE_BY_ZERO issue regarding the
"ram_size" object property. This can not happen because RAM has
predefined valid sizes per SoC. Nevertheless, add a test to
close the issue.

Fixes: Coverity CID 1547113
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
[ clg: Rewrote commit log ]
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index b6876b4862ff..18e6a8b10cae 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -211,6 +211,8 @@ static void aspeed_ram_capacity_write(void *opaque, hwaddr addr, uint64_t data,
     ram_size = object_property_get_uint(OBJECT(&s->sdmc), "ram-size",
                                         &error_abort);
 
+    assert(ram_size > 0);
+
     /*
      * Emulate ddr capacity hardware behavior.
      * If writes the data to the address which is beyond the ram size,
-- 
2.45.2

