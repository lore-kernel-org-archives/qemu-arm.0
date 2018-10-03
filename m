Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6432198wrt;
        Wed, 3 Oct 2018 08:09:52 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63e5XA6E6bteCDfXopdtT9WCQM9lb4tlShT+br7QftfSr7s8TdPDRYOUueOODSbN8c/Y5Mn
X-Received: by 2002:a0c:d4c3:: with SMTP id y3-v6mr1651554qvh.106.1538579391984;
        Wed, 03 Oct 2018 08:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538579391; cv=none;
        d=google.com; s=arc-20160816;
        b=ky1mmiJvwRR3FgqJK1M1d4do1zpa5aoS88k3LzaYIv4Hl9bl001jgM38LL0fR8/LUa
         eFnddAKJkQKyo8tEg8CMdpqOQU154HTnto2+oTNLQ2P89nuY4UrU6BduYjUb/TXz/tmt
         Rg2X4VSUmr2+JD4iEXb7iBIIxlW0PVGa7RnD0cChWt1qu0RMsVMR3N8kaa3bZTtanACq
         VnKdhHbvU7OsD6MJNJ5zPvJ7LM4r8zjzoBaPXVEerRpB14rtlcWceRjukYFed6a7All1
         eV5lKFX1o+Dd1PB/OlZjWZMd+FY3nZ4zbNch5zw2/PMQeEUhd/2+N3FxgAlX2/jGGBU/
         O/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=/QSgLiZ6Mt5wNumXwgkvPtIKbRFYHokm59Wo18j6NoI=;
        b=bSkD7OxaVxryBVLgJVdajIcN+uch/DHg/T54OGxWG2y6U18uGc634oiUKU8JP0atNN
         vgrdhR0pZg3eSiVWu8bJZ4QyDcl8SeHKTz4j0esb5ZZqPylreVw1PE+M72syq5WIfueB
         6gRTo9K8Q2fbbhjjZHHHgrxoU4kPyoGENj5rn3UTccsEm+klIFOhKfnCkybeBCddE42G
         xaEohlYoL6Ea0xkA4xg3Vus9LfPa+2kMbZp5jFlKceOhRDfp7kN0tUUFWgWc8b52Qmla
         VC0dldCNTAmMIOrRe/3S/FMlwSO4JE7BERhuVxzmFqVwa3s7wsgRV1RojIAXKWZ7rDu/
         Q/QA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HK8kfcAC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m6-v6si1011907qte.33.2018.10.03.08.09.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 08:09:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HK8kfcAC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7imd-0004lf-CF
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 11:09:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7imN-0004d5-Cg
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:09:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7imM-0004SL-Je
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:09:35 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40039)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1g7imI-0004QJ-CK; Wed, 03 Oct 2018 11:09:30 -0400
Received: by mail-pg1-x544.google.com with SMTP id n31-v6so1705400pgm.7;
	Wed, 03 Oct 2018 08:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/QSgLiZ6Mt5wNumXwgkvPtIKbRFYHokm59Wo18j6NoI=;
	b=HK8kfcACtI+MUBGCb95vlfazjnMmXHuzR0lW6Z9GTitwbo5EBRuBR7sX5om2aKnn84
	SgMdgjPl/SjBZRiwFzK9wdYhxHQUNNYNqyaRhGLaFinWU7pRM55B7YK0SVdbwrNDRGyy
	16XjbBRpEvYPJH+SPRrepzo2lleXCpufMDkljO3GOUhSoudD7/jozbJSh+J17UINbJeJ
	8TXfQopE59AY0BEUlG3h11rKl3AvqzCRQaANXbqaRSLhsSCAzkUTvuPFqCjUPzzQthNU
	i5NtT9PRci50i/sEFp881A1st/4+xVeYjJiYWPUiGGBHTTXrS+2njqYVP07s8thoypWk
	9p5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/QSgLiZ6Mt5wNumXwgkvPtIKbRFYHokm59Wo18j6NoI=;
	b=eqQ7XW0tysp/2d7tD97CeCquAIoRBcb2QqarfTgtVJpHsdejZWWdzCI8JjkE2k9AtP
	zMY9n39VdUJKBqeCMB73btQ1BL3qmlEg4NA3Vw1JzoS70Ac3o8dHyR8imVZEKV6lcDS6
	2RGY23c+2kg4NJ8eczva/V9LxdyJi8/iEHXTHZJuLFvIYeJFqON/p/2Azs/gIVLjPeXA
	N1HWqZFxpMHQiYAMMY4VQxblRiJJuGHALVlznAf9gATdOcww2lvuj3KJPI8aSNzZ/gS0
	O9dfDjLaFVP+3E+DQos+ihq36ZhfsBaNPPU67EYso2f7eSoQcHTbhZm8BzJGSY0bvRUi
	es9g==
X-Gm-Message-State: ABuFfojY92Qf3eVKyODt+Nz5KB4K7DGWTD1GwQsdxY+JG+ze78TRVth9
	LUYya+ZCoR3W+nNglWMy2r9KbdvnWL4=
X-Received: by 2002:a63:4658:: with SMTP id
	v24-v6mr1774331pgk.425.1538579368687; 
	Wed, 03 Oct 2018 08:09:28 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	v189-v6sm3868926pfb.54.2018.10.03.08.09.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 08:09:27 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  3 Oct 2018 22:07:36 +0700
Message-Id: <1538579266-8389-3-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-arm] [PATCH v1 02/12] net: cadence_gem: Announce availability
 of priority queues
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
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jpcj5N6+3kHk

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Announce the availability of the various priority queues.
This fixes an issue where guest kernels would miss to
configure secondary queues due to inproper feature bits.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index e560b7a..901c173 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1213,6 +1213,7 @@ static void gem_reset(DeviceState *d)
     int i;
     CadenceGEMState *s = CADENCE_GEM(d);
     const uint8_t *a;
+    uint32_t queues_mask;
 
     DB_PRINT("\n");
 
@@ -1229,7 +1230,10 @@ static void gem_reset(DeviceState *d)
     s->regs[GEM_DESCONF] = 0x02500111;
     s->regs[GEM_DESCONF2] = 0x2ab13fff;
     s->regs[GEM_DESCONF5] = 0x002f2045;
-    s->regs[GEM_DESCONF6] = 0x00000200;
+    s->regs[GEM_DESCONF6] = 0x0;
+
+    queues_mask = MAKE_64BIT_MASK(1, s->num_priority_queues - 1);
+    s->regs[GEM_DESCONF6] |= queues_mask;
 
     /* Set MAC address */
     a = &s->conf.macaddr.a[0];
-- 
2.7.4

