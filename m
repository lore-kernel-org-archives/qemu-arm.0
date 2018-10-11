Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1814385wrt;
        Wed, 10 Oct 2018 19:23:25 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63foKqF5TEYlRq1R4uBwzWUVUSTgV4x+ydl0TkTEB0BaN/FycsaqbV31lQZl7xukY4/Yhud
X-Received: by 2002:aed:2d86:: with SMTP id i6-v6mr28887111qtd.279.1539224605897;
        Wed, 10 Oct 2018 19:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539224605; cv=none;
        d=google.com; s=arc-20160816;
        b=p5xG44smWYGm0wQTPjrCmj6t3u3li0h5RQqg9inTFYKh8aw8gFiN0rdcSvTCTA7Laf
         pqZaYa+iujaPpbhXWSE2La5cI5tDJDcgqMTBJHs8j4566wcWBuF4HBVaXGSushtf/PGp
         l73/7oE7EVre8Ld/DOIs37sLYzRRixO15hMJjl/VOOb8Omjb6rDa6s9NuYtblEXJycd+
         iRSD1yD+K/4elUVp/x9m9uPbEgpv2dMcNSoq28hlWGM7RrcA2CQ9Ww9PxjLczZ8QQJw5
         OTvUbGW3gCQrv2Ke2DXPmJ7NHZeKej7FwHbMP83o2g0uEY3Yhf1b3cIeGCcin+ApGDnR
         BliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wQ033kISS2KsCWH3vuSZoNhCRQlAdDq8kj54pJg4qpA=;
        b=ezltOF+m24WO4uhU47eIifxQ3CWVIcg4uG2EFFDKNvWPas0CXzlP71kTfGDQrWdWVi
         ZC08w/EfN6dIiTwWRhtSavsmzHrkEfz0h6vVdeH4V8sDeZ+0amF99ibZtql85HV3rWB9
         7Nf/yXPPnSVf4VcuhYjzkl3tKU5xi6XEFvHszfcInVx9u2ePM5YqGan8eeOF7IZRhOON
         pjeaACP4lGz79sjtt2AYgTrK1ekAA1c7op4bG+CKO6P4A0seaUrVMa+qoiL7Fu6pxa+2
         k7ixehX+X7+l0nlrQFUv07ToSq8bbJ+rzTlPRvldoV+8czesYkSXVWeXQyE8mg2uiNdj
         Y+Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PPNmK3Kj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n12-v6si1257647qta.256.2018.10.10.19.23.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 19:23:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PPNmK3Kj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAQdJ-0004e0-CM
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 22:23:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZg-00028m-4o
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 22:19:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gAQZd-0004KB-Pi
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 22:19:40 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:35899)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gAQZd-0004Jd-He; Wed, 10 Oct 2018 22:19:37 -0400
Received: by mail-lf1-x144.google.com with SMTP id d4-v6so5480780lfa.3;
	Wed, 10 Oct 2018 19:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wQ033kISS2KsCWH3vuSZoNhCRQlAdDq8kj54pJg4qpA=;
	b=PPNmK3KjrNmGLAl72WRFpP/1ckZiW5TutFPQhQJNb2JkJWprW4s6Ir/Ew4AyyyvLjh
	3vISyjUXRwaii0DdMAWtw02jzff8ht/C9WMShRraNixWYQXfaO/BZANrna/tic093yMG
	hZjX2luOPhA/uTxPu10ABHMpY1U1PA7bmOssXTX4F4s/zj6k6tr0Jm5wETW5ZgRVNQhe
	jyVkGZFZg6HBWa/3IMRccduOeEuouvNpGYMcE9vyCO+NULR2pRbMlPcwRI5+YOMxzGBB
	hNejH8Bq/TyAspBdUqvtlGB+eC3Aq+n90hCqa42MDAyFxvvl5oigRl8mfoh9iQWG7CFs
	q1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wQ033kISS2KsCWH3vuSZoNhCRQlAdDq8kj54pJg4qpA=;
	b=LGwubprJpiXpvArYc1+FExz2beGh+jiTyzv1RTquVgPzC/zAse2i2Msseec5ayW50w
	49Pp0gvbXNEzazz6jAv8A62owQ+QWTv61vzD3y0I8xZzhraoIrPTcoUv6UL149enWQtj
	wM9t9rvPAlh0lQtZ+y+1Fqp5mPHqvqxLuYxLneCefm5yyc8B2cy3mkK4gBz99rsc6alH
	KL2qAzox9He0eAgOkY+qWja8k3Q4aUP5wHpJBAYrOADVRsQviWjc+BMoCCUJjtPScLq2
	v0NwZ54T/CvwxvLuJpRzUwJoX0baUJok+ptlW/6ri+xaZHz8Yvc8zGtvvTbkvfZB/Ec+
	Bc4A==
X-Gm-Message-State: ABuFfohNaoZXCu4f5+8yekBEtsudtVelmVm9SZncxAt4+0jkG4+P8Me3
	oDBEtnroiJQdYkUaH7fhYvJufD6p/BM=
X-Received: by 2002:a19:3bcf:: with SMTP id
	d76-v6mr18989086lfl.126.1539224375885; 
	Wed, 10 Oct 2018 19:19:35 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	k23-v6sm5691008ljc.49.2018.10.10.19.19.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Oct 2018 19:19:34 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 11 Oct 2018 04:19:21 +0200
Message-Id: <20181011021931.4249-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011021931.4249-1-edgar.iglesias@gmail.com>
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: [Qemu-devel] [PATCH v2 02/12] net: cadence_gem: Announce
 availability of priority queues
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yHutW1pngdRh

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Announce the availability of the various priority queues.
This fixes an issue where guest kernels would miss to
configure secondary queues due to inproper feature bits.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index e560b7a142..901c173970 100644
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
2.17.1

