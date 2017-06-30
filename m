Received: by 10.25.227.6 with SMTP id a6csp5650841lfh;
        Fri, 30 Jun 2017 06:56:44 -0700 (PDT)
X-Received: by 10.55.115.69 with SMTP id o66mr24709642qkc.120.1498831004780;
        Fri, 30 Jun 2017 06:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498831004; cv=none;
        d=google.com; s=arc-20160816;
        b=F7DjadupNITnPQpRMsQiGtnosRYOClibei7DH7wltUgLLzHJgcOWsErskv7yn8ZHvY
         qh420krCzQebwtcYCPBhB2OVn37ClPdB/FFrL3Kv6HvW4IFB6SnwUi6WgKcJlrzqpyzo
         bvqNdLVg6Em4B8F/LlDEOxslYWr0aYWeuMClSdwHcif1fcjxi7C/EAANiK2oo0qilRd3
         wSZ5zWqgwV69p4FUQQWypyg5er/GyO7t43mz3EhLpgSHdk4u+wTL32TWk65mdaq1EAjb
         gBfQgW9g8LwOCm0BpbgT56dyx0x79OYzmVixfQFoXx838x3lHDaufYu4eU/x+6rl39aQ
         SHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=lE4sYugzm1a+N25UdQOeAs+6tDwjKPaweoqmYRnNCyE=;
        b=ZS/KQWmGO5q05SGZq+vw3p7v3AR+0n+Q/hs40Fc3VzM6mqk/sx/kwYeJMzpAsMJL2E
         jB+Ze0LWRKh3uDAW+d9BPw0oundfjz1LiNEnnJPNAmAYb0tsxqZcZ+rAjWEhYjdI30V4
         g1VtRP2jh7oBDORTTSRUqB8bjqRUOT6IV0y4s+7n3xfRSvCLsH01TbC93F7IGatpbhjk
         8E1PZsw+BWQ0Umd+2lnRbETNMl6fGZH3yBApfEl1loYZgHHFsBcIaOgsN3T3D2TpP5hx
         YzAoZNJ9K2sGHNmoC3BNGPT0Q7t8GPOruCe/V7sf1zOCX+mVNH5rMELVDVmrWiQFTBuJ
         sf/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=n4FopeoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c185si7373610qka.342.2017.06.30.06.56.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Jun 2017 06:56:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=n4FopeoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dQwPa-0007t2-2g
	for alex.bennee@linaro.org; Fri, 30 Jun 2017 09:56:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dQwOm-0007My-Nf
	for qemu-arm@nongnu.org; Fri, 30 Jun 2017 09:55:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1dQwOl-0005iQ-Uu
	for qemu-arm@nongnu.org; Fri, 30 Jun 2017 09:55:52 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:34055)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1dQwOh-0005bW-6r; Fri, 30 Jun 2017 09:55:47 -0400
Received: by mail-lf0-x241.google.com with SMTP id g21so10145588lfk.1;
	Fri, 30 Jun 2017 06:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lE4sYugzm1a+N25UdQOeAs+6tDwjKPaweoqmYRnNCyE=;
	b=n4FopeoGRWbZwfH8+XvdWVT3SupOiyuEnP9/PcID14vQVBi5QmYE9/LDTaoZ9FkrkA
	DJVIf3q9dU5o9GQitOCxdBm/Cw/ji9SB/jNmaVGhtI+t/0MOyfyi1I0Bxr4Bo0pu5a3w
	MEMKF5HD67aIGhs1gIBlqzC+Vb6nKYWWqwJgxTGT6PHjMPIiYyUeojGn4MonQAmjBJ26
	eKxqESHmN+5+Cu4NeQdVRLDet1XecOZ3LvhwCNdTO9Axlbv5RcZaNNWOO0JpLcN9nJsr
	HnNhKLjtGkRJqdWphme1Tf/+g98ghQGJPp1CGiYoz51zyX4k+eQl0LF+TWwpaCQkqYZK
	MXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lE4sYugzm1a+N25UdQOeAs+6tDwjKPaweoqmYRnNCyE=;
	b=QAmeaVAEhDD4B5nfM/lmCkf6Jh5fNCcuhrrUtJE5DfFKN45pzovwLM71/5hiu7d1e5
	Ho6QCOjeObu/khY0LZV/Ow37Ib54YDSASnxBsLn+qeKGv0BHolZ8H2w37V05hRSEXtlN
	XryvJ2VZ/lqSpgNmtnNBILK12rB1ACA7UL3llTWnoXeROlrD58LGhz6+rGy9bDW9Y5oq
	X88NwjnjvTPRrMTz1aRWucA8zaaH9cRGt0lGQrGAn6sxMGG7Qx/JVhXHCuWOIK2xSmi7
	zGTQ99/kFNHHf31JySBtqo7ah9fu8Mfqi2C9zQ05w3ALdZeqR9G6xl3wznolvvKWWp42
	0zcg==
X-Gm-Message-State: AKS2vOy4h9XStTh8leQMO661lX/O/9gpJvM7Ywh2mugsVpmoylaUgWhs
	2Aaw48L/Qtwfrsad
X-Received: by 10.25.209.2 with SMTP id i2mr2655327lfg.119.1498830945537;
	Fri, 30 Jun 2017 06:55:45 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id z25sm1632710lja.2.2017.06.30.06.55.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:55:44 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Jun 2017 15:55:44 +0200
Message-Id: <1498830944-26857-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-arm] [PATCH v1 1/1] xilinx-dp: Add support for the yuy2 video
 format
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
Cc: sai.pavan.boddu@xilinx.com, edgar.iglesias@xilinx.com, qemu-arm@nongnu.org,
	alistai@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ON8r6+WMwUC

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add support for the yuy2 video format.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Acked-by: Sai Pavan Boddu <saipava@xilinx.com>
---
 hw/display/xlnx_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index f7b7b80..a77d7db 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -624,6 +624,9 @@ static void xlnx_dp_change_graphic_fmt(XlnxDPState *s)
     case 0:
         s->v_plane.format = PIXMAN_x8b8g8r8;
         break;
+    case DP_NL_VID_Y0_CB_Y1_CR:
+        s->v_plane.format = PIXMAN_yuy2;
+        break;
     case DP_NL_VID_RGBA8880:
         s->v_plane.format = PIXMAN_x8b8g8r8;
         break;
-- 
2.7.4

