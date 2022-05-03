Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1746254lfj;
        Tue, 3 May 2022 16:04:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQQ4cCe1IgkEDxXXmvB+8hVtn87wuf+D1mDAh4xCHCt8j5Ft7YCwqTN6TZ7qSHWrMwASHe
X-Received: by 2002:a05:622a:1009:b0:2f3:b432:19fb with SMTP id d9-20020a05622a100900b002f3b43219fbmr2539526qte.87.1651619057333;
        Tue, 03 May 2022 16:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651619057; cv=none;
        d=google.com; s=arc-20160816;
        b=hP0FPYi/Z5QDFrfakjszBi8b2pMHtpsxgXMl5rbmtj9R/SSPl/vfQC5GSSKVNo2tE7
         8/Ksba/TRa3zBF55a4ZIrvQup18ptOu7Kwy2mFNXAGrTf+kMmYkwG7LimYqFW2oWXfTL
         So0RwCZpfRq4utyoCEwPvf27DNdTAgRjt/JLSq65yPHlUxpRIKqH+isMKXLQIq/jJo0t
         wYOikbR2WSniY0ylV1oK2uQdMspbjaAKrelJT5BcHTkRVtr+LYz/KwlBgYplEn1akbMa
         ToBdRe1lcNNctDo7lQOQKU40QuUYjRamDnKWghm64tcQRlPvn43a59PBjJeGf+ImO9Nq
         JFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=bj/WqHqnfs09t2tHU95tZilutWm9MRxE7SPIGfXBlfM=;
        b=S98LYDZiM7O2PlLOma/2TKnfh3wbXBuMtBtNcQXZVD5kE2sgtP46ZBPwGp0sdOJDT9
         Y8WBNDzRT40evFfIcPepQuaaYPfhF3ex5P0wBprG4MwtkiIZMx9m5ZK/Ep19/nXrsxqs
         GH3o2jxHlrOCnqLv+gid7Xrc0Ar9sQq8TrYefCNF6e8xw18WxhP2rYEeyWI5lVW8+2hc
         XblgxZdkqV3ORXvQlSQcFybX+3amhuqCw3eUIYnw8iTgIyReDQjIfP4LosZ2cwfLpg2u
         Qc/IOog8kdJJxwzmCwBKjxuiGiUMihuYBGbZQrwSQnLYRcxSoXjMiQsbi5khLX0caZUn
         0YDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b="C2/cB3fu";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12-20020a05620a440c00b0069fa5a3b253si7855576qkp.287.2022.05.03.16.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 16:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b="C2/cB3fu";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nm1Z1-0000U0-77
	for alex.bennee@linaro.org; Tue, 03 May 2022 19:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61228a338c=pdel@fb.com>)
 id 1nm1W2-0005ub-8g
 for qemu-devel@nongnu.org; Tue, 03 May 2022 19:01:10 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:52984
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=61228a338c=pdel@fb.com>)
 id 1nm1Vz-0007al-E2
 for qemu-devel@nongnu.org; Tue, 03 May 2022 19:01:09 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 243HFtkO002616
 for <qemu-devel@nongnu.org>; Tue, 3 May 2022 16:01:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=facebook; bh=bj/WqHqnfs09t2tHU95tZilutWm9MRxE7SPIGfXBlfM=;
 b=C2/cB3fu0mmOsUVSM5HH16oOPSQ6mDx+Z2mK96OqlDpYskUo9xnUyLS2aa9+me7juldd
 rkxZ7bc8jkZSnSBFSU3nH4LG0XR/kstOVw/l78P6RStRPeNVYPKIsMndkpydyyx8NPw3
 yCl7vkvyBTQEbCD1qgp+8c4Qt1vlhlIGPfo= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net (PPS) with ESMTPS id 3fs0m7vg8s-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 16:01:06 -0700
Received: from twshared6447.05.prn5.facebook.com (2620:10d:c085:208::11) by
 mail.thefacebook.com (2620:10d:c085:11d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 3 May 2022 16:01:04 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 4A5525ADE899; Tue,  3 May 2022 16:01:00 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <patrick@stwcx.xyz>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <clg@kaod.org>
Subject: [PATCH v2 0/1] hw/arm/aspeed: Add fby35 machine type
Date: Tue, 3 May 2022 15:59:26 -0700
Message-ID: <20220503225925.1798324-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: sg8i5WLMwptIGaV8heqdJahKCQDGY7X1
X-Proofpoint-GUID: sg8i5WLMwptIGaV8heqdJahKCQDGY7X1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_09,2022-05-02_03,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=61228a338c=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: cpbo1K08c3CT

Resubmitting this patch without an avocado test since it takes too long. =
A
big part of the boot time is just due to the design of the Facebook OpenB=
MC
machines, but it might improve in the future, and I'll consider resubmitt=
ing
the acceptance test at that time.

I added a link to the releases page and an example of booting the image i=
n
the commit message, since it's no longer included in the test.

Thanks,
Peter

Peter Delevoryas (1):
  hw/arm/aspeed: Add fby35 machine type

 hw/arm/aspeed.c | 63 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

--=20
2.30.2

