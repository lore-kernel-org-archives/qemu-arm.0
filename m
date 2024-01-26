Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp1026031ejc;
        Fri, 26 Jan 2024 09:38:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJSos3CBIPBJLSEo40Siw3U9W8udY+4pmJd+2OL1rNuDxCXXRMPEufIWvgGtYhOfaI7WXu
X-Received: by 2002:ad4:5ba6:0:b0:686:aa82:a222 with SMTP id 6-20020ad45ba6000000b00686aa82a222mr233787qvq.83.1706290707726;
        Fri, 26 Jan 2024 09:38:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706290707; cv=none;
        d=google.com; s=arc-20160816;
        b=SAtQxmNHj0EobJXIoX/Isu/uOceVsft+ENShYBCqPxRy+Pwmw1jitP2jL6yhlIlXSr
         Cz+VGZOuUSWYSL+FfS+5ne+yWRVcSceiE0Wi+oWqtF1XTJscLvUlnrU6TI5umyeIb+VX
         i8BT3oJzG3YOsQkopie6HZ+aYIl6hDNQoab+SRYjuWjDhAkT5Hp8/XV870IAyupQ2osb
         TUd6zURihH15d0A782MolxCihx9FabmgjNh7bIIHE69WSXAjLeIkO0KFwy+bAiA7cktI
         xRj9mWwWGFnx9a56e4w+vLlGzGCAuQgFOgEDSmBFeil2rYxowDbfQ1j+6mx1DODxwanK
         oiZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DVny/j77ulUUleAP4xxt8G+Z0haYgB9hlZ/h/9Yyrxg=;
        fh=LeOBNGHwoQQCylLh9v89P/OdTUx8jmDchZ7fstdYfbc=;
        b=Up2Sltpf7291sIumoUlb1IiXi1tlu3+BkTBoWLW5J7WonFHmaMNmxgwEuZBh2gm8wW
         7lTaxFJPBAbOBzmfbXh3mtVMNbW5N8wJfbV31P+ykdhnXHIzYKk/yDPQyun1t+sDVtNM
         fP3fh+7FrXCYAuc+so//AnD52OwTE0HgMIvg7OkMMH4SYzaXp2XIF9RGB94Oc+He+Iso
         ijqVfJLDUgj0rqDJs5a2DQin+iRBZB+/dJtPgDR+SWVwJNbCUrf3Jx2WhS7ijl99chOv
         4k6nMv8T1KeW4vvZvhJEyNIjF3OMVKQ2IhHrP+h+a5ncK2UWqcctUgOYn8/hqVnFUEH+
         X1SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=DlRBjExj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a05621420ce00b0067f8dc03511si1808160qve.80.2024.01.26.09.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 09:38:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@infradead.org header.s=casper.20170209 header.b=DlRBjExj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTQ61-0002Br-Di; Fri, 26 Jan 2024 12:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rTQ5E-0008HS-AG; Fri, 26 Jan 2024 12:33:40 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1rTQ58-0001ca-Is; Fri, 26 Jan 2024 12:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=DVny/j77ulUUleAP4xxt8G+Z0haYgB9hlZ/h/9Yyrxg=; b=DlRBjExjlAWl+S+PBC+lla3Kef
 FuduYJJNw+3RIesEwWQ06DsltvkZ60y4rdBDynv1/T8B8x6xYBKa7PlEA43FRHSnvrqK/kcNkt6f4
 AKgmjbjlKqGsJ84ajqCs6o7Jt1R1IOYfpeRTOLvC0msw3643izcxMzr+Odu1lE9tB9En31J5J+Ypk
 d0u8RGMG34ZZ8sOqjEKpjBpG7mOPpvBL29eQY1NJhRu6nd9spHxshDeDiPi+PK0c6r0n7KVyMUZnL
 LLM1YbMTN37dL7+Qf2lYlh93U3q+exZBv4S3jTbCbNeVVNWqcCGAsr5gT2azI7+Gwixra42hQAhbq
 dj4A4AkQ==;
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rTQ49-0000000EKUx-1uSO; Fri, 26 Jan 2024 17:32:35 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rTQ4A-00000001eng-14GT;
 Fri, 26 Jan 2024 17:32:34 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Song Gao <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v4 37/47] hw/net/lasi_i82596: Re-enable build
Date: Fri, 26 Jan 2024 17:25:14 +0000
Message-ID: <20240126173228.394202-38-dwmw2@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126173228.394202-1-dwmw2@infradead.org>
References: <20240126173228.394202-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+7caeb094913322f6f00d+7460+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-TUID: dy7F2+X4GoBu

From: David Woodhouse <dwmw@amazon.co.uk>

When converting to the shiny build-system-du-jour, a typo prevented the
last_i82596 driver from being built. Correct the config option name to
re-enable the build. And include "sysemu/sysemu.h" so it actually builds.

Fixes: b1419fa66558 ("meson: convert hw/net")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/net/lasi_i82596.c | 1 +
 hw/net/meson.build   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/lasi_i82596.c b/hw/net/lasi_i82596.c
index 6a3147fe2d..09e830ba5f 100644
--- a/hw/net/lasi_i82596.c
+++ b/hw/net/lasi_i82596.c
@@ -14,6 +14,7 @@
 #include "qapi/error.h"
 #include "qemu/timer.h"
 #include "hw/sysbus.h"
+#include "sysemu/sysemu.h"
 #include "net/eth.h"
 #include "hw/net/lasi_82596.h"
 #include "hw/net/i82596.h"
diff --git a/hw/net/meson.build b/hw/net/meson.build
index 9afceb0619..2b426d3d5a 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -33,7 +33,7 @@ system_ss.add(when: 'CONFIG_MARVELL_88W8618', if_true: files('mv88w8618_eth.c'))
 system_ss.add(when: 'CONFIG_CADENCE', if_true: files('cadence_gem.c'))
 system_ss.add(when: 'CONFIG_STELLARIS_ENET', if_true: files('stellaris_enet.c'))
 system_ss.add(when: 'CONFIG_LANCE', if_true: files('lance.c'))
-system_ss.add(when: 'CONFIG_LASI_I82596', if_true: files('lasi_i82596.c'))
+system_ss.add(when: 'CONFIG_LASI_82596', if_true: files('lasi_i82596.c'))
 system_ss.add(when: 'CONFIG_I82596_COMMON', if_true: files('i82596.c'))
 system_ss.add(when: 'CONFIG_SUNHME', if_true: files('sunhme.c'))
 system_ss.add(when: 'CONFIG_FTGMAC100', if_true: files('ftgmac100.c'))
-- 
2.43.0

