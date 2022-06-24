Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp590918lft;
        Fri, 24 Jun 2022 13:35:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUkAD14R1uLmjh9k+q4SEQT86BYqYHBiYwe//WWK2wa4rgfODdb7zCBQS+Q3q9gamxADnM
X-Received: by 2002:a05:620a:1b98:b0:6a6:c893:d54a with SMTP id dv24-20020a05620a1b9800b006a6c893d54amr868756qkb.374.1656102903681;
        Fri, 24 Jun 2022 13:35:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656102903; cv=none;
        d=google.com; s=arc-20160816;
        b=FI2elNjJzPLNglVBXlo/uwTqhnbVpk/BugIO5n2QIe7S2WO328mnWIrQ7T4t1upZml
         NH5MIqtIlVGt2UcHg10yioLGEGSS80CpQrtpQrZuB7o9iSV4hK5UR5+d35krcAHFMq4M
         b1wqO86PAlIwACdxdk9nBZU2K3vTQfL4MWOWhILZnTDD9z/r3IN4f77x681BxMRnmiFX
         j3V9u0dQHIFSdCYN/W0M3+cwt1dUGLQDQFqwgEnt/q1SwWGcB+NXpuFFryQRWSAnkeqC
         cE1vk4+6N6lth3oK78/6+j9z20WXW44zsJbPdH9VTuWuc/jYWYBUbv+jsE7058WieAgN
         hiEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=5ruO9R316vsfRbm+iQj3wQQK6JtiUbVXfXoOXJNSpBU=;
        b=wFTfa7/pDRkcQOYynFuXthmKyWWyo35KtrKHgKiVGbhdseuZJnNEinvqj3YZBTAHqw
         0FZt+NoVSkN7FjCiKuWdFLysL4iRJfvrRb4+f2lYMEkFuiAAoOZTCf5+sMt9I0ghDedX
         +Yd87FIY8eRlQmIGNckhIj97k87bGNz+ItFscNsGOLfab8FAFqoUMB1IqDENkTtkHLgW
         tadhxf4yM925VhsB6Sehl+BGbEQekZa67zS5GKG5RBGo8rrgNtE/3cpjRDQAwlrZ74I3
         BBZXQF8qSMPkfyh5asBx5/8kyQ4b3MPtoce3GqlC2TH10Ej4a2ri1Huz1oHbsXaCQCnC
         ZbYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=bu63Dd5O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1-20020ac81e81000000b00317c6f3c64csi2284633qtm.65.2022.06.24.13.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 13:35:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=bu63Dd5O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:47252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4q19-00036w-4t
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 16:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4pyP-0002Mv-HC
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 16:32:18 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:28138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=717463a23e=pdel@fb.com>)
 id 1o4pyL-0004GR-DE
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 16:32:11 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OK9sil006865
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 13:32:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=5ruO9R316vsfRbm+iQj3wQQK6JtiUbVXfXoOXJNSpBU=;
 b=bu63Dd5OerfWJl1hvady1IqfQQvcHRmTVsK2/Vd3fj6wN7R2M99tmWLx+BCuxKONqmHu
 uAHmourDxkf3ZbiDK1fwSytloG4Bx4g3AwY3djGFMe627yHg9SyEty7ozpuGFOlAfygz
 p40AJWqJbJXejPIcCmUvELqWzafgCAPiaTY= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gvqnc2asq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 13:32:02 -0700
Received: from twshared18213.14.prn3.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 24 Jun 2022 13:32:01 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id CA9CE8955A9C; Fri, 24 Jun 2022 13:31:53 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <clg@kaod.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm-nongnu.org@devvm9194.prn0.facebook.com>, <qemu-devel@nongnu.org>
Subject: [PATCH] aspeed: i2c: Fix DMA len write-enable bit handling
Date: Fri, 24 Jun 2022 13:31:51 -0700
Message-ID: <20220624203151.2026355-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: IoCUMRNjqN-JE3WYkIlDZbxYHUpjQ5ob
X-Proofpoint-GUID: IoCUMRNjqN-JE3WYkIlDZbxYHUpjQ5ob
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_09,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=717463a23e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
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
X-TUID: j3sePwzBLcR1

I noticed i2c rx transfers were getting shortened to "1" on Zephyr. It
seems to be because the Zephyr i2c driver sets the RX DMA len with the
RX field write-enable bit set (bit 31) to avoid a read-modify-write. [1]

/* 0x1C : I2CM Master DMA Transfer Length Register   */

I think we should be checking the write-enable bits on the incoming
value, not checking the register array. I'm not sure we're even writing
the write-enable bits to the register array, actually.

[1] https://github.com/AspeedTech-BMC/zephyr/blob/db3dbcc9c52e67a47180890ac=
938ed380b33f91c/drivers/i2c/i2c_aspeed.c#L145-L148

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 37ae1f2e04..c4fce7474a 100644
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

