Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD53606A32D
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 12:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y7BxolRy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dyWdGyyw
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOwzT-0004th-UB; Thu, 05 Nov 2026 07:54:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyY-0003ib-VG
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:54:00 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyX-0005pB-DY
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:53:54 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5AhuGl1582932
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 12:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yoNwvm/vPktTltJx6aTHdxbD1eJJY2h0Rz94pXq5sdA=; b=Y7BxolRyqwXyeCJf
 qHGRNnSPgdKAXMrUezMHgjEQYLhI6vM8LkLWAMMqWN02DgPHi9HzltsfZBY8GzLL
 ZxrMRItQ9JtGp8LEg46OZU8Ey0JzPKsMZ0L9oZSBXfDUARwK5rc9g3vvIOfN9iDJ
 rYU4EhrgyBYI8/ZjsHh7kKAhLVxVKBsfpOWLUmnB9/f59UAdyVpbM6mjbPdBHS3N
 k0Mu5g/5/GwKwHVvdx21P9zn5Tc+RfOg0dHEwxe1sTrVGRRvCANKMdEQzCj7iE/d
 bBCgJwOd4St3Ieg4dwgXY58HFx3xFYdsgrx65J2OW+Vu29D2XXqo3UM2wAPyuZb+
 x+7h9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraargsd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 12:53:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93f1f2fafeaso274702185a.2
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 04:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883219; x=1794488019; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yoNwvm/vPktTltJx6aTHdxbD1eJJY2h0Rz94pXq5sdA=;
 b=dyWdGyywoH1hG0VxEXqPy+tt3aN1TiKiPPTSYNniKB+GR1YUs5HCe2O3PZ7LnJ4hpO
 YDeVUg+JBTM+wFjUX7Jzwued7ng7FrdArTWGs4OjDwvA4J44oXfAQ7gKwOwcPTlTHHiN
 WVdZH8V6Q4GazCRT7fBrUG+PCW9OZAeL3tKsgLM4FIxN4X3AnmImxt1lje3xDu48yWex
 YNy6sN3Yc1Muo4vkFyHESQJfWATaIeLOD8NKw3fI0QJ2om0MezysmfxnuXKQPNe+yLST
 z+H6ew2vbKfpy7YzB96SSNRvTONFmPykw2XdE+LPpTnpulpjWAFYvH7aBGy+caa82NLy
 0gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883219; x=1794488019;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yoNwvm/vPktTltJx6aTHdxbD1eJJY2h0Rz94pXq5sdA=;
 b=zxHmdFTzp3oQmV5pyqRl8oik0adHO1MJKiW6scTTJAxcK33gHZxZbhHLy2PWzarwkC
 LobCAMx5pR/IU6YCK43cyvYbWexOHbsulYJgvHAQ63zkY80+wL6OsIkAiVU+L5biYf9y
 SPHH+cK71dUbN2mLzzGRWHNmHrx8moQUeo54cun5laQcdV3iM0dbIDgCtFZ4h4WDbiSm
 dYXDcTrumuv1rpHVQh2Mu/s6zGosASOvLC5JwPfaPYrxVCv1hxNVZ+5hBTocS5YRLN4+
 4ZJY86f+uWq2vTnSQJ0ytSILBit5WlxGLSQRzQrP9G1BPIsAQsf+B4t4Znhiy2SYFvuW
 /VYQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByOJ9SMWfYV3wxEzfEfMThxa3MNMEmysmsUIvvHLw9CF1z8436VEoRkjkR8GkjnLdD3Oa4091/qew==@nongnu.org
X-Gm-Message-State: APuU4Z95EEEZ8vStxPCAFRoBQzx2Z2E0MnaeGl9MlyMApzpbxjJL1SHW
 Q6bYllM8nBJy6va3zzEJ6kdZTwAjtKMrTYjHXKy0cv3yscVlO5eCcUvLyY/r0pP52V2HT9l+z9+
 7oUK3HZOBwhjCrImcgAhSe9MQ1jIbYe4jK2rLrDqLwWuGkg9JPcCogdw=
X-Gm-Gg: AYBFou2bs+mQVMC/f4arzvyLYExdj6lbh5WQDpy3AgzqEXmYT14n+TwzBS2yV0o3rQF
 MAMbI+b1Yan75pweKc/D8h/hmoR0BC+TJ2v/LrAtsw5t+CDmQTQhCQYUvjDdIk7zUQsXBt0m9sh
 gYDpllCIzXk88NnJV2PCvFPo1SFvNcS40YWxRHX0I8xLFEldN3NXAzEWvreitagbX4amwnLYp05
 Qd3Ay3k8CxjPt/10qjg8AdsMlcbH655XdiqAmIEnIPXDaDSdH4LgKoCe0yxwTpeK5jyt1T5J1Mt
 4iC2Nr9vfE7rK6MloAE2FbpCSVbk9vQUfMLXC4B+vV44OMpTY1OY6FpTlZmD9Cr1vK734C9eO6h
 dye3ljV5DjO6vVXpHn555F4pnI+gOS5uulGbshEl19yZZHjjNE8aVCbKyRrfQNq86K2Bu5f3628
 Ux4KzXxObs+dTu8UX/zv1ctRr/jCU5wg==
X-Received: by 2002:a05:620a:461e:b0:93f:57a3:71ab with SMTP id
 af79cd13be357-944216b1b09mr3300615185a.32.1793883219424; 
 Thu, 05 Nov 2026 04:53:39 -0800 (PST)
X-Received: by 2002:a05:620a:461e:b0:93f:57a3:71ab with SMTP id
 af79cd13be357-944216b1b09mr3300612685a.32.1793883218948; 
 Thu, 05 Nov 2026 04:53:38 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b55ac5afc3sm1647069a12.18.2026.11.05.04.53.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:53:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>
Subject: [PATCH v2 09/17] hw/ppc/spapr: Replace deprecated sprintf() with
 g_strdup_printf()
Date: Thu,  5 Nov 2026 13:51:54 +0100
Message-ID: <20261105125203.40320-10-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX5Jwvw/nLNYMn
 gwC7Q7/E5A9qFzbh9VeuoOgw1gR1YjUGiQS5Bl2F1eaE+QPDzpQE2pVjRoMvOQME/3TeBmb8Bl8
 uPpKIpCC1XaJ6e9pZMXsOzPoyzvQL2w=
X-Proofpoint-ORIG-GUID: OxDW4f7qunVI1RRRYnQdSipJvxejUJAO
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec7c54 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Dq1EaEgxF4OYa5eKYxkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX+Q2bHsnyz8pR
 m35Da6XqMed5QU4xSM18vVs6o5Y24I7n/INY2tXhpw5ZgcwiYTt1KH3OsJrshfF/hryoxhvasmM
 4ya4+ojydPN9AGKplK/lwokYkOfDlLzVylC2wanmQ1c6dxTZztQG5E+dG/pL4TOuS0WBo9bBHzD
 PcTexWtPJy46ijtz4ZnIBN6W+m2x7x0T0lPRy/oM59ad97meWYYuDiEn6SfKMA4De2ptvsqtbNo
 nBQCOqr2GBmIlUl1Tzk1acrA+xmppYSO3S/wxdLggONExXDyp4Wz9FZJRQQqO4j2epHjdWRn21o
 M5J5lJrLDprUjj96nK5zAf9RK2n/hk9Q1kHsGrIl+I7jywRySUCJ7Mg2bjt3ToWQKOBaC9GedCE
 NR86pX3mXFnvJgMVOAqQZ+HvYEJn4arsOqy7arp4NUNu3nXzaBgJeg6AsVwbwp5RykvPME9Dpwz
 S86NepnaoBUgNcl2hPg==
X-Proofpoint-GUID: OxDW4f7qunVI1RRRYnQdSipJvxejUJAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050051
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace sprintf() by safer g_strdup_printf() to format the
node name, silencing -Wdeprecated-declarations produced
by Apple clang 17.0.0.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/ppc/spapr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 54e3cc3cbe42..6f1a046a425d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -352,14 +352,13 @@ static void add_str(GString *s, const gchar *s1)
 static int spapr_dt_memory_node(SpaprMachineState *spapr, void *fdt, int nodeid,
                                 hwaddr start, hwaddr size)
 {
-    char mem_name[32];
+    g_autofree char *mem_name = g_strdup_printf("memory@%" HWADDR_PRIx, start);
     uint64_t mem_reg_property[2];
     int off;
 
     mem_reg_property[0] = cpu_to_be64(start);
     mem_reg_property[1] = cpu_to_be64(size);
 
-    sprintf(mem_name, "memory@%" HWADDR_PRIx, start);
     off = fdt_add_subnode(fdt, 0, mem_name);
     _FDT(off);
     _FDT((fdt_setprop_string(fdt, off, "device_type", "memory")));
-- 
2.55.0


