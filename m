Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2641369lft;
        Mon, 27 Jun 2022 12:59:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uqxRsCx3sqU4GWz8j7XWoSm4B/39X/KyDiW4JYjhjwVeJq9PDrfM23XCx0L9b64Dtw40j8
X-Received: by 2002:ac8:58d2:0:b0:305:116c:de96 with SMTP id u18-20020ac858d2000000b00305116cde96mr10743162qta.14.1656359959252;
        Mon, 27 Jun 2022 12:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656359959; cv=none;
        d=google.com; s=arc-20160816;
        b=E/Qa89S4dd0H2NPNbMja1KXApOXWlY5w9FvhHb80QWSMp335/DL8DZVy7L7IG8dyrS
         AV58zlvtdEjoA3crk4NaFydL85b36ld527cjKBrxB4dFMbs8DPiuN+yz02f2Zq0pVzM0
         wicfiVuZIrSXfAQv3T0JhvnkMl/4jy3tF/ma1eTm36twiCuLSSM99WQhZCew05jG0l+x
         y5UBchu4wMDcbV//ZoRiWJ9/JIZL8bJS3zyALPgUF7nEX3mPzvuYamYUx5QXangcxsIm
         TaL9/pNZGUW0QwbX5ZqDgtx7GLvb8KNN8AJK0nJh8qso5JL/60rX0AshyqR2P0ifPtsV
         jhFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7l94AJzGpEl+mfRpKdCEzIfcu3P/FVmtjbjsE8Kbp4Y=;
        b=pK2oCna5v5ujp/1L0DRCec3Jz+cq8CG9qQFdKih1NOTkzlDlVUxarAksclznHIbU21
         saXQj/Zmbv2bAXoKiogRTln4yRknjS7Ri80OEXuTQ9ZUw8TTk9GSjbF6E1CB3Ls3cXlg
         BOBkD9EnboUc6OUrNqtlC/Pw4yI4ZDhUFyVHoTuwpCYusO4u7Rrxw2fHVn/dl7nuP6nj
         awPxwTDbjTOJa3WyW4WCmxIaVdP/FRJwYzbNQGf8dllwA97t9l4uQUI2wuo+SQuE1hVG
         hJVbMCvWv1ADdfDEJOCVZOluyPr+RQUpNnwaPkAfmytQ22+SC83m4NOjaK2jiL6eJwYu
         TLDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=IXXvx0AQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if8-20020a0562141c4800b00453c887d73csi6282319qvb.413.2022.06.27.12.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 12:59:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=IXXvx0AQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:37428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5utC-000119-Lr
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 15:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upg-0004rU-DR
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 15:55:40 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:57424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upc-0000g5-VY
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 15:55:40 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1O5Q024530
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 12:55:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=7l94AJzGpEl+mfRpKdCEzIfcu3P/FVmtjbjsE8Kbp4Y=;
 b=IXXvx0AQEC40ijyKRANREd8jf5k5AyyKEs9LWQfUomw6kEtnIQOROoi9ThrX5lwq6AH9
 u93zszw3RZoBdOnW7KqH7dx/hnRjAYTuTdQsD4dN0iRfHWW6nFQghr4ZQtf6aeFrATsf
 BrFAO9C6PUPtSdkL8i+PDANHZ8Pv4f6ETkc= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gwyfsdaxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 12:55:35 -0700
Received: from twshared18443.03.prn6.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:11d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 12:55:35 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id E9ECA8D206F1; Mon, 27 Jun 2022 12:55:07 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <zhdaniel@fb.com>, <clg@kaod.org>, <qemu-devel@nongnu.org>, 
 <qemu-arm@nongnu.org>, <komlodi@google.com>, <titusr@google.com>,
 <andrew@aj.id.au>, <joel@jms.id.au>
Subject: [PATCH 09/14] pmbus: Reset out buf after switching pages
Date: Mon, 27 Jun 2022 12:55:01 -0700
Message-ID: <20220627195506.403715-10-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: CbskaIz-xpQezmCKIwg4KJa-1cawi4IJ
X-Proofpoint-ORIG-GUID: CbskaIz-xpQezmCKIwg4KJa-1cawi4IJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
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
X-TUID: 5pXZNeTa4U/O

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/pmbus_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 62885fa6a1..efddc36fd9 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -1088,6 +1088,7 @@ static int pmbus_write_data(SMBusDevice *smd, uint8=
_t *buf, uint8_t len)
=20
     if (pmdev->code =3D=3D PMBUS_PAGE) {
         pmdev->page =3D pmbus_receive8(pmdev);
+        pmdev->out_buf_len =3D 0;
         return 0;
     }
=20
--=20
2.30.2

