Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2641399lft;
        Mon, 27 Jun 2022 12:59:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1shj8+88B8vj8SwAjJFOvcpd0E1rB7764pKhaga6klqzqAu48vAC4NQYDCxUOb8saAYfAk5
X-Received: by 2002:ae9:f808:0:b0:6af:dfa:a290 with SMTP id x8-20020ae9f808000000b006af0dfaa290mr7968186qkh.741.1656359963096;
        Mon, 27 Jun 2022 12:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656359963; cv=none;
        d=google.com; s=arc-20160816;
        b=E2YipWKFsX94tw8iCBnUHtJOOi3vDi6iUCaNU+lWGsfhfatkaSyi1eNG+HQkBcpZKV
         ovZBlSnlLmrR4KxEo8hrSh3MHGweuPoVxHV5auPkMGFHv9gbfU9UUeBv1IQgEXnyLVIK
         DOY1U1M82cZp0BYFXr1jpFMniYClCGwXirVrvwLeR/TzsCIYkCg703hvKXb36nFCO+vl
         H0uSM/is+w2N9+9+866hK9vs1PWDN4MFkhP27AV7LiRl3G9mYbsLKJhMqgwmQEd9Q8on
         bAESIvY8Tnb4Q4c7NCbf6qXeu/f05hAl/6gDP+LSQ39ORErntS5O5Babk/MGD6gtEvTG
         J+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:references:in-reply-to:message-id:date
         :subject:cc:to:from:dkim-signature;
        bh=YnSoyQOrwBcMGgkMZvl1ogHCeNgy/jX5OX+hBxDpfZs=;
        b=bPKCFl4BDqETSd4n2EedwFUTcHZteun4+N9vE5EHUi7sEDpDCC5a+BTanKjHM19l3d
         yPtBfbJfmZH2nvEIRFDlvD+N1p1o+sNvAXTZoSEukANApNZM5DjC4JwDkn10zwWR/Abm
         SE8fbmJ+O40oYT+fwAj1MjCuKPEn8lq5Agnns/l4eK7RbZ4vd2zKVFP6i/Ybo5uMKtxw
         qL666K69dI6cvjjoUJJ9AXckGl4roW6YxS6UMmO4zPDjk1poYych7w02Y78vmS8QfqjL
         atJIR3UB7Q6UZVdk5+p30h1fSiexCTlH7T4xhsWUQTfAejFjAbTLbCwMHZ/PRMy3PCib
         2/+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=kABmYFBN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a05620a29c900b006ab96ea40f1si7076159qkp.643.2022.06.27.12.59.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 12:59:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=kABmYFBN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:36386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5utG-00009e-In
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 15:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upa-0004eb-QN
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:55:34 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:10412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upY-0000fH-U8
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:55:34 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1QtM010903
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 12:55:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=YnSoyQOrwBcMGgkMZvl1ogHCeNgy/jX5OX+hBxDpfZs=;
 b=kABmYFBNyFI049/kzjUO88nA7uZkzO+TJjqsguOfg4kS+miqJUGeYSZu5eM4E5EvK8Mt
 A8DjCbu2WAPof6YG+D2suKbPVfWXBwInLSJCcqLkiHMIYchD/1Hv8n9MvLd5iezLPRbF
 TY8SJusG7Lku1XnrkO+b3HJ7HgpI0o0YCZo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gwyvyp71n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 12:55:32 -0700
Received: from twshared13315.14.prn3.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 12:55:30 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id C7B7D8D206E7; Mon, 27 Jun 2022 12:55:07 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <zhdaniel@fb.com>, <clg@kaod.org>, <qemu-devel@nongnu.org>, 
 <qemu-arm@nongnu.org>, <komlodi@google.com>, <titusr@google.com>,
 <andrew@aj.id.au>, <joel@jms.id.au>
Subject: [PATCH 04/14] aspeed: i2c: Fix DMA len write-enable bit handling
Date: Mon, 27 Jun 2022 12:54:56 -0700
Message-ID: <20220627195506.403715-5-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: F0GLFGE5SkbaJOeyoaj3R9G3H6ESDVJg
X-Proofpoint-GUID: F0GLFGE5SkbaJOeyoaj3R9G3H6ESDVJg
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qniMw/zlBFzC

I noticed i2c rx transfers were getting shortened to "1" on Zephyr. It
seems to be because the Zephyr i2c driver sets the RX DMA len with the
RX field write-enable bit set (bit 31) to avoid a read-modify-write. [1]

/* 0x1C : I2CM Master DMA Transfer Length Register   */

I think we should be checking the write-enable bits on the incoming
value, not checking the register array. I'm not sure we're even writing
the write-enable bits to the register array, actually.

[1] https://github.com/AspeedTech-BMC/zephyr/blob/db3dbcc9c52e67a47180890ac=
938ed380b33f91c/drivers/i2c/i2c_aspeed.c#L145-L148

Fixes: ba2cccd64e90f34 ("aspeed: i2c: Add new mode support")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 2cfd05cb6c..6c8222717f 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -644,18 +644,18 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bu=
s, hwaddr offset,
                                                      RX_BUF_LEN) + 1;
         break;
     case A_I2CM_DMA_LEN:
-        w1t =3D ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T) =
||
-                   ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1=
T);
+        w1t =3D FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
+              FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
         /* If none of the w1t bits are set, just write to the reg as norma=
l. */
         if (!w1t) {
             bus->regs[R_I2CM_DMA_LEN] =3D value;
             break;
         }
-        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
+        if (FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
             ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN,
                              FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN));
         }
-        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
+        if (FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
             ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN,
                              FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN));
         }
--=20
2.30.2

