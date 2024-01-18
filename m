Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp519630ejg;
        Thu, 18 Jan 2024 12:08:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4U4KlviGqmt76lkiXzxxrpw1/YgvWibG4LfKlKsbZ88FdforyuPJafK1fZkNZAietY28a
X-Received: by 2002:a05:622a:1ca:b0:429:cbe7:c3 with SMTP id t10-20020a05622a01ca00b00429cbe700c3mr1344074qtw.117.1705608509515;
        Thu, 18 Jan 2024 12:08:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705608509; cv=none;
        d=google.com; s=arc-20160816;
        b=Rk251OFc/+lgVpwvFaZipgqa42z0+XDSSuhITEi50jKPtc3tQgWOC1FEId0NTS1fOI
         CGx+NooqF1Twr1bLO/i0Rnuhaqhgiig8+rgiNWUuQ7Qc2bKirQ6X+5ivOfhJN8Q/hoVS
         XN7FPCE0G3EwYenStK6gUhuFiVdPxStDeAerGCTQqXFbgPuYcpZAay04iwE/Sm4udbjt
         +Zqx38Flepm0ARb3IFWaS8UsTmYS7FllE2BVp6n3weKEDCBQWLqPdeEaU1rEiVYU+MZu
         aCyvQW3rW0sBAgc3Bjl8YrzUZIP1tW/VAzzwS72uSAKL3ukAKgNlXYn0wilCrZ3OsyGW
         UA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NepvwILR8saXQ0DwpYtr1EjRADd2IuMlIDWFe0pCcHE=;
        fh=cUgEM3TMHOIH70RmHTmTZxZmItZJnKfBWHSaci49aLY=;
        b=N1SqXW8HbKCkTRsjeuYVFrG63Ou+iwT6MRNPYi0L8vndoJ1w5gytizm6Hu1nlgEyD1
         jyzfyqvX+Utl//3Ev931i4twcOqJykS11i/JpacR78veXAjZLHRGaDwVGt+zToz2RGBj
         dunahjjfH+3DO9HR6vRYBYxl6PWnnf+yi12ZykLomJqUUjBm5Xb43yOgerA9/H94cUJf
         ja+fiWUdde5GtBtYP9hg1eMu3t2kQKlMhrMdNWjUbJb4l+3DDgcL5im5oG97b4+hx8jq
         zqWNXFdLF/WEDEDBCaHCCuJs3EFbGf8bmhohhGY9ZvctR4SveOi7vdPtxy76Cood1JE7
         7jsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lz9U6aLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a05622a145100b0042a1558dd43si2695557qtx.571.2024.01.18.12.08.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jan 2024 12:08:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lz9U6aLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQYgB-0004xH-1l; Thu, 18 Jan 2024 15:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQYgA-0004r4-0Z
 for qemu-arm@nongnu.org; Thu, 18 Jan 2024 15:07:58 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQYg8-00070f-9R
 for qemu-arm@nongnu.org; Thu, 18 Jan 2024 15:07:57 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e586a62f7so241315e9.2
 for <qemu-arm@nongnu.org>; Thu, 18 Jan 2024 12:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705608475; x=1706213275; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NepvwILR8saXQ0DwpYtr1EjRADd2IuMlIDWFe0pCcHE=;
 b=lz9U6aLvrSKJBl62+ubSLFWpv3647QJDh2a09i+LPxxy7PwOfwyE215iuG5g3M3aLj
 o8HRUIBaIDvw0UPYWAaCFFqqCOLnipEY16Ls38IcI+hGFgls3DUPBrBJrgOPzJA0658w
 g5I4+W2yX7k1nuNf6cnR7cooPjyGT/KcvtCXNNcZE9oa2sXkHyLnldTjZfnZCNSNSvRO
 IAi9YA3gf4JCuf7xS/C8iXcb5u3DooYVKJfmawTdU7kqTF5s6Loazs6rdBXER6lx322I
 n0w7oO+Wohe+R1dPoYsCa2IlAuWbeiWDRdt5eIGRiJk5MtCDAn5NicIcv9iFP/+oTMel
 s2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705608475; x=1706213275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NepvwILR8saXQ0DwpYtr1EjRADd2IuMlIDWFe0pCcHE=;
 b=ftF5vTIhW/PfD3KjNIZSoPHweGNvaiYz6FYbhTGzgxicS/kVpdO0To0WFdS/yzd0Ce
 aei/inLysPk5gqVVW8RUtdKsuv6oL5qsCouHNCQDCb7t9h6ylvvRfYm15szwvwPSnvmw
 B/itu/7cBDwCbvIZjOGqrkAAdJN2TiMsRm01voysmiNIUzBZRx74/j44YaZFQcJupWHo
 xAM61YwQYDmAavLfWg7RJWadi77BraPxfgC169uWcf+BUYUYkokg27pAl/4mrr4BxpMt
 tZhht4fzywrvZxghalbKdTDjyjPBnFEwfSg22OCOt7ucV+gFTJJeYEj11vN6ChiZ/YxG
 yayA==
X-Gm-Message-State: AOJu0YwoZCki78n4Cu6aB0m9JQtDn7EWAQTca+1guSgarq54ug8SlLSZ
 aIiUaAz4ROoEVYtAbTemD0YPdJ3EvsXsa7FrEFyAqrxPbOZsIKpzKGld1zV3Z08=
X-Received: by 2002:a1c:721a:0:b0:40e:85fe:b00d with SMTP id
 n26-20020a1c721a000000b0040e85feb00dmr911900wmc.97.1705608475040; 
 Thu, 18 Jan 2024 12:07:55 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 iw7-20020a05600c54c700b0040d604dea3bsm26301559wmb.4.2024.01.18.12.07.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 18 Jan 2024 12:07:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eric Auger <eric.auger@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Rob Herring <robh@kernel.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Beniamino Galvani <b.galvani@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Joel Stanley <joel@jms.id.au>, Hao Wu <wuhaotsh@google.com>,
 kvm@vger.kernel.org
Subject: [PATCH 12/20] hw/cpu/a9mpcore: Build it only once
Date: Thu, 18 Jan 2024 21:06:33 +0100
Message-ID: <20240118200643.29037-13-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240118200643.29037-1-philmd@linaro.org>
References: <20240118200643.29037-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: QL3hZAay+Al5

hw/cpu/a9mpcore.c doesn't require "cpu.h" anymore.
By removing it, the unit become target agnostic:
we can build it once. Update meson.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/a9mpcore.c  | 2 +-
 hw/cpu/meson.build | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index d03f57e579..c30ef72c66 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -15,7 +15,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/core/cpu.h"
-#include "cpu.h"
+#include "target/arm/cpu-qom.h"
 
 #define A9_GIC_NUM_PRIORITY_BITS    5
 
diff --git a/hw/cpu/meson.build b/hw/cpu/meson.build
index 6d319947ca..38cdcfbe57 100644
--- a/hw/cpu/meson.build
+++ b/hw/cpu/meson.build
@@ -2,5 +2,5 @@ system_ss.add(files('core.c', 'cluster.c'))
 
 system_ss.add(when: 'CONFIG_ARM11MPCORE', if_true: files('arm11mpcore.c'))
 system_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview_mpcore.c'))
-specific_ss.add(when: 'CONFIG_A9MPCORE', if_true: files('a9mpcore.c'))
+system_ss.add(when: 'CONFIG_A9MPCORE', if_true: files('a9mpcore.c'))
 specific_ss.add(when: 'CONFIG_A15MPCORE', if_true: files('a15mpcore.c'))
-- 
2.41.0

