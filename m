Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2647984lft;
        Mon, 27 Jun 2022 13:10:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sufuplJJWzm3iTDQ6vODqIJHVgw5haLUbU/anElveezQNoj75zoHTCoezoI9Sw+2plmIMQ
X-Received: by 2002:a37:a85:0:b0:6af:ab2:9d1e with SMTP id 127-20020a370a85000000b006af0ab29d1emr9000006qkk.695.1656360616941;
        Mon, 27 Jun 2022 13:10:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656360616; cv=none;
        d=google.com; s=arc-20160816;
        b=VopF8swQAl4bKPFmBiX1mZNAF0RhazpAZU55mc/BVv11eOLiPdP5QenpdMWJgw+ngn
         pHVhBidMfFSEyJWTaTvkNNuQc4coM+YBU2qLTF2dzfCoR3gJElGu2K1EhevlgSdTtW4y
         Cd5kTGZYXOWJQ4LoNEIJWvyKSOLuGbNukOAkxVjti++dWpQ1rFJWLEO1nOw4W2dHs47q
         8hJxdtV+KwoJpe9duikZLmQ40Qm5jesKV9+CcBiN4Sa0/PdM7c3SI+3dahaoH4+emK2v
         rxtcJGrxW2iRrpdDIKTQJvyJ4moLf+gM8Y2IthGphIgEr26F340YE8axUXO2R3ReoycR
         jNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1jx48crsXIOgcbA/0+X5lFA6B2+CGgtif5yn9hnS9ko=;
        b=GhoSfubnDOHOC5Pu3+Tf2bkNavnjSZ4Vv1v8IhbRUNdwXa0d3SROl3JUM+/XF/jynl
         RaZSB3s6x9WD/bf0KRm1I4iufCjUqIKfkeC9AxyRoUgoUTCK/6K3S032ctQoDnKqQKmx
         0A1L0lZU2WT4bg5mhuGhJRZdnta/XzGDQhrsA7vf53dPc6HjvbMZBPxRkH01RLQiRQFh
         /AUH/YV+jpIcNojxtqNpvFU1jtRkydMY28oHCn9qLoNND7yoTjFLuE+M6e6yb6/OPwXJ
         MqKHte7S0J7u43DBiUcAvRiHgNItIITOWREsm/T9A22poAnXyJaWqLkjc+PJfgIIa01H
         n8gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=SYf4N79A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a37640e000000b006af1389a8efsi1929920qkb.230.2022.06.27.13.10.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 13:10:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=SYf4N79A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:46974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5v3n-00085k-Pr
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 16:10:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upT-0004Ld-GT
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 15:55:27 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:1770
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upR-0000cA-UQ
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 15:55:27 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1RJ9015444
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 12:55:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=1jx48crsXIOgcbA/0+X5lFA6B2+CGgtif5yn9hnS9ko=;
 b=SYf4N79ACVmXdOV5Me+nJ/EDsowMTSQUzuYK6oxTMT5Ep6tWLiSUkcCy8Dhuu6HEQTD/
 HbbaNdJnc+Ozk35BzO6c/4RHf7dL0eWtEC2f8X8cErbIUSzygXFoHs4RLkqOtNM5pOK3
 M/srif3rS0ImhnEMDd5raRDfK9Vwcq/75ZA= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net (PPS) with ESMTPS id 3gwwv756su-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 12:55:24 -0700
Received: from twshared18443.03.prn6.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:21d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 12:55:23 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id CE5648D206E9; Mon, 27 Jun 2022 12:55:07 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <zhdaniel@fb.com>, <clg@kaod.org>, <qemu-devel@nongnu.org>, 
 <qemu-arm@nongnu.org>, <komlodi@google.com>, <titusr@google.com>,
 <andrew@aj.id.au>, <joel@jms.id.au>
Subject: [PATCH 05/14] aspeed: i2c: Fix R_I2CD_FUN_CTRL reference
Date: Mon, 27 Jun 2022 12:54:57 -0700
Message-ID: <20220627195506.403715-6-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: Qfy0PnPB6O6RbMuoEkNHyKo0sXLoarnt
X-Proofpoint-ORIG-GUID: Qfy0PnPB6O6RbMuoEkNHyKo0sXLoarnt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0zFh/y3vkdZB

Very minor, doesn't effect functionality, but this is supposed to be
R_I2CC_FUN_CTRL (new-mode, not old-mode).

Fixes: ba2cccd64e9 ("aspeed: i2c: Add new mode support")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 6c8222717f..6abd9b033e 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -552,7 +552,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bu=
s, hwaddr offset,
                           __func__);
             break;
         }
-        bus->regs[R_I2CD_FUN_CTRL] =3D value & 0x007dc3ff;
+        bus->regs[R_I2CC_FUN_CTRL] =3D value & 0x007dc3ff;
         break;
     case A_I2CC_AC_TIMING:
         bus->regs[R_I2CC_AC_TIMING] =3D value & 0x1ffff0ff;
--=20
2.30.2

