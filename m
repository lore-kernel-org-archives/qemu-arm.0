Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1434408lfg;
        Sat, 15 May 2021 10:50:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN1zuiy2oc7V5skT4cH8T1NT7YgyjSydrsbRAvkpv1TLuYi8ouNiNRp622dm6AqZQTCPmS
X-Received: by 2002:a92:d481:: with SMTP id p1mr38557598ilg.57.1621101010774;
        Sat, 15 May 2021 10:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621101010; cv=none;
        d=google.com; s=arc-20160816;
        b=K2FLKa7vFMyqHvG/SvB5OeFdC8AE4n2EBV6HmSnLw+fHIvIdPme749Qr/j6CW1m0Rr
         8noAjbLgGSuOo/uqNdop7Lcow081N9y10DuVYwvAbgrSVO+PR9NatBb7QuydlE705FmU
         cATVWoygt21zW9AUWRl05/cQlI1HGKDNCajw3461ZKVgX0d0s0kbi5t7r8NKT/kd/OX4
         /ocIQGW1OOOIs23yHOysg6cCS8StS1DbJTIWR89QpaI33yACYN1joOZCH0HV7rzD8y7f
         Ejt+4VC/ITnPzaKzn5s64K2JB9Mstf8sL8tgjnCLTeqR7WN3twvXZJgNUWB0glY8sFDi
         A7vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RV1lQVu+Z0RzwUnAORV2pR221f9eeMJn1YWrVW88UbY=;
        b=tt+Imsgmb7iqaIelYt8Xwll/vCAoOrno7OOfSrLjyHNTUhAufigybWxMiMsutT8qAA
         XfpyVzOFRbp0JTMU4ktcQMAdG4uO6w4EtEQPY07F38U5u0DBFNm40c1cYlKPnVlNuJK+
         q6JDVk06o+OYy9n3/LGt2QQthACkLGgqA5YJotYZXeUc9kTmZnL5yz/hRmimSiI9jmg+
         HOAjy7Fdf9ZDcYG2v1ZduzmYszOuxXhoKYwS8qBJOtOpNf5TJ29eV2WnMHQ9/TX117nK
         kFV8bK2d7N5++XthQB6pJ/1D9WHcCebwY0Ld5kP9jLNUyq8xdqwhh7MYEvz3TSQuftbB
         BORQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BoOXzhht;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si12267330ili.90.2021.05.15.10.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 10:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BoOXzhht;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhyQU-0004qp-3g
	for alex.bennee@linaro.org; Sat, 15 May 2021 13:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEk-0000yb-Vr
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:38:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEi-0006Nm-SV
 for qemu-arm@nongnu.org; Sat, 15 May 2021 13:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RV1lQVu+Z0RzwUnAORV2pR221f9eeMJn1YWrVW88UbY=;
 b=BoOXzhht5sk/LyL60CmbHxij6vC5wMIBR4TfUw0ygEZq8MdRCAkdbBAjwZ+vGDy1+967XU
 wYX+koUZGp1qBUsbPGOWX6dKFzO4pfUYTAPGXnU/DHGgGZSwrHTxdZl+K+UasLcPgUEzsm
 D5OQK+IqsKP2rwAWwjkyeJxGRZO8ANM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-6U6DhfJyOTiXchyjYiP9ug-1; Sat, 15 May 2021 13:37:58 -0400
X-MC-Unique: 6U6DhfJyOTiXchyjYiP9ug-1
Received: by mail-wm1-f71.google.com with SMTP id
 r15-20020a05600c35cfb029017373d9f318so446531wmq.4
 for <qemu-arm@nongnu.org>; Sat, 15 May 2021 10:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RV1lQVu+Z0RzwUnAORV2pR221f9eeMJn1YWrVW88UbY=;
 b=s3aAfAuQVsjLtQXOR7Fsjl6ShHmWPnTrvl2HsS0ogk0VvQ6UPa83YKIonAtlAGPUoI
 LGEEK29TRF4Xg8F85NkTOCxmHo8mmKG872Ph/kjSHs7Rk2MdI05CmTUHM2OAHTY6QEdN
 u6GrstfBcYX1q/i9+A6KDOPAO3Dfp1OGX7KTIkMQXvGhAzYmHirKzLjXfywQVk3vN6hz
 wFJ86nJDWV6jueKI/yHPwU1qDyvIzmw8ZUIs3hIc1CiwWfRKTFg/U3DCZft5aUVCJ2ND
 V8t1W9zddp1PzFVtgfdqRQzeO5wUgL/XCULBc2N4Aay2ufQCea/3zpvCpd3ss7cPS+6P
 HJug==
X-Gm-Message-State: AOAM532M9ZgiMZIa7OmMqYyXcwSjBRJMDSMGtZI0jKNhM8CDunaZJiRm
 9U0Au0BG+dTi/YljBfQP+qc2PRXbP6ry5i271hkt3cXki2MmhP1dpevQXY1osJPARlgmNJ3Ctin
 tTfrcHYXNpc2t
X-Received: by 2002:a5d:4cce:: with SMTP id c14mr67329380wrt.29.1621100277258; 
 Sat, 15 May 2021 10:37:57 -0700 (PDT)
X-Received: by 2002:a5d:4cce:: with SMTP id c14mr67329371wrt.29.1621100277148; 
 Sat, 15 May 2021 10:37:57 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c206sm3495060wmf.12.2021.05.15.10.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/12] hw/ppc/Kconfig: Add missing dependency E500 ->
 DS1338 RTC
Date: Sat, 15 May 2021 19:37:12 +0200
Message-Id: <20210515173716.358295-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Greg Kurz <groug@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VfGce/E0bXHU

Commit 7abb479c7ab ("PPC: E500: Add FSL I2C controller and integrate
RTC with it") added a global dependency on the DS1338 model, instead
of a machine one (via Kconfig). This gives trouble when building
standalone machines not exposing I2C bus:

  The following clauses were found for DS1338

      CONFIG_DS1338=y
      config DS1338 depends on I2C

Fix by selecting the DS1338 symbol in the single machine requiring
it, the E500.

Fixes: 7abb479c7ab ("PPC: E500: Add FSL I2C controller and integrate RTC with it")
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 default-configs/devices/ppc-softmmu.mak | 1 -
 hw/ppc/Kconfig                          | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/default-configs/devices/ppc-softmmu.mak b/default-configs/devices/ppc-softmmu.mak
index c2d41198cde..5a7f99d1e45 100644
--- a/default-configs/devices/ppc-softmmu.mak
+++ b/default-configs/devices/ppc-softmmu.mak
@@ -1,7 +1,6 @@
 # Default configuration for ppc-softmmu
 
 # For embedded PPCs:
-CONFIG_DS1338=y
 CONFIG_E500=y
 CONFIG_PPC405=y
 CONFIG_PPC440=y
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 66e0b15d9ef..2e4c56eb770 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -128,6 +128,7 @@ config E500
     select SERIAL
     select MPC_I2C
     select FDT_PPC
+    select DS1338
 
 config VIRTEX
     bool
-- 
2.26.3

