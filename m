Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6431715wrt;
        Wed, 3 Oct 2018 08:09:30 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60hgVoyLenIcm9GGaX8zqlZB0Bcj5L06Hz0yeQJdsY4agGguZOPanJOaQumEsNmpoNPqpk5
X-Received: by 2002:a37:cbc9:: with SMTP id u70-v6mr1506978qkl.139.1538579369943;
        Wed, 03 Oct 2018 08:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538579369; cv=none;
        d=google.com; s=arc-20160816;
        b=ICqzPNAh+m1a5MveaeD8bm6zuKyexhkbGr6bFw1umLqvusd8iWs8OsKILcSwv1NEP0
         5oLdNg/ypzTcg6KuVNRS6/csoliBHuyhLqyZmgAFCoj1JdmWNEKZJ1YDJm/6KwTp+/j2
         KTGVy09tvtBxc14gZzg00gm4kcSxj3vXjm/LrvVabldpUqwvOV5L3r5wA1OCxWpiZGS5
         +SRwM2CvSG6Ksm4Mul4XMRZ2mm1dZUpcV1KRP7Nvq5BGX0+yVXPsywpZt+ZbW46v5HLO
         OzvygL/ciHQ+cTZnZ8i/edORufnesyCIRA/nCF0Zc3yBtyvAS5DvWzjhZnh5lcLZ/gav
         P67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=XNRrhUSKw6Our9SaiQsbulGGdRPGI+Mkwoe40VigXv0=;
        b=rPr+au2FOvZzrseuMhmFn+Uh+/tpDp0H8GhV3uc4h5dp2rsdlb+kcXsb3FcItnht0M
         GmWUM5FcSI5MXRWdr/hDYL7tF1DRIVUg+k0HWUBTVqKYYaOoNt0/rqzJ+nFI6DTXZJRL
         rAKBMVIrTjOZ0rsPs5RP74MUWBoLolnVGgVsknTZL6B0SMtOoZ27MWYL2mJnVPw95eUM
         knAg2zj0inq6K+B6gzENhHNSbVtN8fRucYpmG3bDiI43MC6gUpw/SfVvy3f95txHEZVP
         R+Ngpzk3W3lip25tTd+EtbIxd22TrCnUhG+QZeWP//DhAFdujeXM6JvRnPvu03nXZq6y
         gi3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JIutbVJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15-v6si1122336qku.267.2018.10.03.08.09.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 08:09:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JIutbVJr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49213 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7imH-0004LK-BY
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 11:09:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7ilt-00049p-HR
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:09:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7ilr-00041i-62
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:09:04 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41309)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1g7ilj-0003zq-RE; Wed, 03 Oct 2018 11:08:55 -0400
Received: by mail-pf1-x442.google.com with SMTP id m77-v6so1824450pfi.8;
	Wed, 03 Oct 2018 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XNRrhUSKw6Our9SaiQsbulGGdRPGI+Mkwoe40VigXv0=;
	b=JIutbVJruEuO8tZweWmNwRVDgthLF8wT+j/mwVexkmnQTnsevhQTADjtpuvG2Rq3pE
	uZjwaB1iFU7VsoRAUjcxSvW3LTKiRgUqb7YaGQU+sfnEJdBkvDb9UxmmP6QbKVqc0D6D
	N7NQOhOczAmVI03qnGaojr3TZWwasSCQcuIzBJn49jQCoLB2IWf2VXo7ItEEqMdPdIHS
	id80EqCfue3uz0HoT/UZ5+sK9ieW8zFyIylBzuOh+CxyMzlFjSCmwNJsrwEsqwMAeVPE
	Iqkt5tb9ei+LvopQuNZueXikk6dq+gTdZ2xy9/pRwOgLdUjCY1cwlvN+FKq7a0ce/PTX
	9P/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XNRrhUSKw6Our9SaiQsbulGGdRPGI+Mkwoe40VigXv0=;
	b=TZmnu8cMWQ9zUEERqwHMs5+zrU1o/3cCOdrd137fjYqnUr+a98iiiaM/RW68cu0Pb6
	Q0PGjCGhgHYv3Jfh4NQMjJvR5p/RQuS/2tLz0pmbYvMToCx53dO8FmWcDZ/C2lA0zJF4
	JLry4EF8x4ujz/yuSIHZos0tPP7lRM+My/HHemZDXqYLO29SEz7Tom1/97RfTAyPF1f5
	6zx3aAcb9syA4PGfeugh1S1e3+KJ7R50JNnoVBNRgwPGNNsz1VjdDbpxO0YeLu7ELaWY
	Gv/VN0szduOJL9xdq620utgd4WQKK0aU820MAJpngKAHf8jUWCxawf189biSjb1vto95
	T2IQ==
X-Gm-Message-State: ABuFfojIEM2U9Co+h/CrDJVqK0R2jJR7vKT44oXapnq4y3ZVPIQLytb6
	QFWX4u8n0XSOy/BQMgpGAuoic8eadPo=
X-Received: by 2002:a62:3541:: with SMTP id
	c62-v6mr2055150pfa.45.1538579334373; 
	Wed, 03 Oct 2018 08:08:54 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	k71-v6sm2779490pge.44.2018.10.03.08.08.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 08:08:52 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  3 Oct 2018 22:07:35 +0700
Message-Id: <1538579266-8389-2-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-arm] [PATCH v1 01/12] net: cadence_gem: Disable TSU feature
 bit
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
X-TUID: 0LdZQibhSTAH

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Disable the Timestamping Unit feature bit since QEMU does not
yet support it. This allows guest SW to correctly probe for
its existance.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 0fa4b0d..e560b7a 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1228,7 +1228,7 @@ static void gem_reset(DeviceState *d)
     s->regs[GEM_MODID] = s->revision;
     s->regs[GEM_DESCONF] = 0x02500111;
     s->regs[GEM_DESCONF2] = 0x2ab13fff;
-    s->regs[GEM_DESCONF5] = 0x002f2145;
+    s->regs[GEM_DESCONF5] = 0x002f2045;
     s->regs[GEM_DESCONF6] = 0x00000200;
 
     /* Set MAC address */
-- 
2.7.4

