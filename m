Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3349543wrt;
        Mon, 22 Oct 2018 10:36:26 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cr42EG0n7FiVoSnNd8diSDDFlR4FtC1gAPTBdyzXSjWzf5NALk47sIBF/DoN8FjcXngeF6
X-Received: by 2002:a37:1a94:: with SMTP id l20mr2514105qkh.248.1540229786448;
        Mon, 22 Oct 2018 10:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540229786; cv=none;
        d=google.com; s=arc-20160816;
        b=TN1wGfxfqCsh/U6/pHhSfCQ7UVvZXi9itlwbB6gkbF9hgjQ089P0w0uGMYfxYRlueU
         lte2W6RurKDTe4NATdW/yteyYUN8CZLJhu2pDPSda7MExNGDZ09/sStlqL/QX8KwHsBL
         sVyT16HDsorQO2Zw+5h9PS9/5w39njCzYBrez5wzEbZGO3xtiCAn1I5RuiIpVIWLrpej
         RtkS5hrj4fFEFm8raxXugWnQ9Tvyqk4k5v3rGmo5pbQSdp56PYC4FlxcKEiAoPus5LFb
         PLT0IUMzAuZ7ZQ3H2MX9Yvw21ZFjS0cyK37K6yCnHP15zBhozTZYCb2z1ox4cyjrnfFQ
         A6pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=9Y2gDLBxWq1i3BIXhcd34BHU8AEwLyYWTDyAu3LCjj4=;
        b=Fr0CN0FuILQherkFWFWEznptt2wp7RKZNjrpDkt9Stl/NqnHU8WuaCG7XjH7SNmySJ
         tJ+XiJfM1fKJtXfxOq8x8jxyIrqESMyXMH1y5ZDAVRdtXsGkuyjnKjbQe9/IFv77BDqj
         DwcqxFdg26PU4p9AYruBmAxZvdcIipz4JdbdLg5qlbjiZ2M9o1rQEM0rvhLzdTXW+xhY
         8avW1JCGHPLOz8Tg/LudgpcBWw+iLXljGRxGYmAPLbtSHhn2dqhz3cwySbpdvEwpCjsw
         NNvTWAiaZbWmcCz8cjgqTiZUi+L6WS0pILJUh8Lz6UhK/Mx0k8G/qYy3eiLT5MLSiz1v
         uv9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qLSABUtB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t37-v6si2396428qta.353.2018.10.22.10.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Oct 2018 10:36:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qLSABUtB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEe7u-0005uX-0m
	for alex.bennee@linaro.org; Mon, 22 Oct 2018 13:36:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gEe7e-0005tS-1T
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 13:36:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gEe7c-0002Xn-UD
	for qemu-arm@nongnu.org; Mon, 22 Oct 2018 13:36:09 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:40393)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gEe7b-0002VT-6x; Mon, 22 Oct 2018 13:36:07 -0400
Received: by mail-lj1-x242.google.com with SMTP id t22-v6so297247lji.7;
	Mon, 22 Oct 2018 10:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9Y2gDLBxWq1i3BIXhcd34BHU8AEwLyYWTDyAu3LCjj4=;
	b=qLSABUtBp9Zbjv/3JbgQaVLkgjY6+iKAusZwEnGzsDtwSx7VecT+t31/fXjqaLO0r1
	X0535IDDoAzn0wNiQ24QnomXPxXeqbjSGj6ahv1D5vxFCJGpwKVjyTQz7brk6RFMzh3M
	Pvwul/VfpV/Ojc9fYgq6ov6Sg0GIivw9f3rtu9dxEiqwsSDUCL7L4EnMssT79wCCwW7F
	a3Wd3+6K0KYkj2cfnCBszrnd+rFrjTBrm195pKx7/BOszZbGKOCQVu+zy7PhSHWYVF6H
	Q1ssI0LRyDmg9K7XmBo6OzW4NT23Hl4sE49J+cJWzgtUDbA/Ejq6jLnfnRdYhibRbPDF
	I2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9Y2gDLBxWq1i3BIXhcd34BHU8AEwLyYWTDyAu3LCjj4=;
	b=obqoeRF6DXtOMA3tVHt9hSHeATckoQjeB5YzkQZ+jzvWJEikrXjhYt4B/q9Ep8P06B
	mD8PpID+FYctGWgAwYgIfzdFUu0MvDg4oerdos0UCwk74s0U/z60N0XiWiOZRWo8ZdbB
	7If6WRZlxN8Tu4nrBJ/3VqWeL0KGNB+nsyQ34bPJf48p6k3UETm39zaTXrmrZOqku15l
	CZdGtKUV2G2g7P4cjjD2FHPdmNBg1vXgy/DxEdy+oxvPJwUGsfj6wRbZAz7ikSKL3rCZ
	4Yql6MWr4+xl3u7dqmO8xSpEoRz/i9QoKEvvux51z5u1ZOtLTu/dc+4ClJgQvuj6symm
	5OxQ==
X-Gm-Message-State: ABuFfoj3paZipAGKSKalBTR2d0/iGy5Mk/l3NnpzonCRny0SW89Pyhch
	Bb1PHyq7iq39U2ypwpgYnckSkpP/
X-Received: by 2002:a2e:9955:: with SMTP id
	r21-v6mr13159211ljj.5.1540229765797; 
	Mon, 22 Oct 2018 10:36:05 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	a2-v6sm6775636lfi.23.2018.10.22.10.36.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Oct 2018 10:36:04 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 22 Oct 2018 19:35:57 +0200
Message-Id: <20181022173559.17111-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181022173559.17111-1-edgar.iglesias@gmail.com>
References: <20181022173559.17111-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: [Qemu-arm] [PATCH v4 2/4] net: cadence_gem: Announce 64bit
 addressing support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wu6qRnDeWT33

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Announce 64bit addressing support.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 16a8455128..d95cc27f58 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -142,6 +142,7 @@
 #define GEM_DESCONF4      (0x0000028C/4)
 #define GEM_DESCONF5      (0x00000290/4)
 #define GEM_DESCONF6      (0x00000294/4)
+#define GEM_DESCONF6_64B_MASK (1U << 23)
 #define GEM_DESCONF7      (0x00000298/4)
 
 #define GEM_INT_Q1_STATUS               (0x00000400 / 4)
@@ -1300,7 +1301,7 @@ static void gem_reset(DeviceState *d)
     s->regs[GEM_DESCONF] = 0x02500111;
     s->regs[GEM_DESCONF2] = 0x2ab13fff;
     s->regs[GEM_DESCONF5] = 0x002f2045;
-    s->regs[GEM_DESCONF6] = 0x0;
+    s->regs[GEM_DESCONF6] = GEM_DESCONF6_64B_MASK;
 
     if (s->num_priority_queues > 1) {
         queues_mask = MAKE_64BIT_MASK(1, s->num_priority_queues - 1);
-- 
2.17.1

