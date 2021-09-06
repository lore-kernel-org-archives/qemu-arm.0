Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3805342lfb;
        Mon, 6 Sep 2021 06:41:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZGfSJwdZLsPWRlsFxm8XQvXHB8ziefxQBKeueTieou96zM5A3Nu1nVq/b6nCMhzHueFkc
X-Received: by 2002:a02:9082:: with SMTP id x2mr10760099jaf.44.1630935696219;
        Mon, 06 Sep 2021 06:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630935696; cv=none;
        d=google.com; s=arc-20160816;
        b=V9gIpEZ/AhDwjHJOVKqGp/5sZmzCYTEnkPjRtcFGKvEKfRJ5koN3IUlQI0fjK4OlmA
         wtYePKjOAryR/PlYosd+V/05wXSAoVrRAkE8sKFGbC8Ky9Qd5PMjoCAUKpKCaA2vQbPj
         TwEFqGZSwBYn/xB7LhpEedeaxKwycZWYHtzbXMjMBBGIE43ZH0ck6ic+oplG1aAIu8WY
         JPS/Ztcnatje3CE2CwX+A1kMBe23tjChn++PgIMGZFkkY5NqFHGmCGvHbVpXtSaLv5xh
         RV6cow+0mRoGNyNGLRzNKpyoHhL52gTk8CyZiwsWnOpj8wCDeelVhgb+HmAh4jGyFVnw
         hYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=8HaapvhSkjDoB5ZM7qj2CnTsEqiDe//himovvdjBXcg=;
        b=OnDbdJtdeRCT80/HjJH+MYXcIc+9uHNLq1d8DMZ4aKIy+f+ChYyVRc20K/UA4mj0er
         M6B5UlfjXZha7sNJGld6MQfcOSlHBfe+3Wc+t6ZVGa11w6GD0JJ7YZM/rBgcs1W3CvNI
         yJ0v9dnzsPjrwTSxaN+0ngsGu2N8ZCjYVFrWyJmmvaeOHMcid2Zs5pEjZDD8vAooG48y
         sO3A/5JwnNFSmmmGpYYPcxsIGurS4n5DWLP4+HBdJWd6iM1QtC8mrOSC4upXyn8VMyxG
         sMtfPEOPshWoPvb84H6HHP/++28IuyG/5vvW4TfiMRyhCmUR6IlnxaZhq2U4BUcPH741
         5ydw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=l4XUFEUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2si7750653ilk.59.2021.09.06.06.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Sep 2021 06:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=l4XUFEUl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:45234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNEsR-0001uT-IV
	for alex.bennee@linaro.org; Mon, 06 Sep 2021 09:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=888312a924=pdel@fb.com>)
 id 1mNErT-0000MA-6x
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 09:40:35 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:7978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=888312a924=pdel@fb.com>)
 id 1mNErR-0006kl-11
 for qemu-arm@nongnu.org; Mon, 06 Sep 2021 09:40:34 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 186Dda68023545
 for <qemu-arm@nongnu.org>; Mon, 6 Sep 2021 06:40:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=8HaapvhSkjDoB5ZM7qj2CnTsEqiDe//himovvdjBXcg=;
 b=l4XUFEUl9UL0NiEJRI3RK6kuGSx9JVAslVmSA3YyTb97notzHFXHiLuR3lVauumavRLW
 37xDiBJL+bTwgUIoCFhDxZR3C6OjUU5ZoGXeje+clc5Oz7qZjByhHtFOqffarYTgdS+9
 su/wEP7gDzVrAce9MeqQ0xUJMgGGsak3y1o= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 3av6b15j3r-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 06 Sep 2021 06:40:31 -0700
Received: from intmgw001.46.prn1.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:11d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 6 Sep 2021 06:40:25 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 025A41ACBBD9; Mon,  6 Sep 2021 06:40:23 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <f4bug@amsat.org>, Peter Delevoryas <pdel@fb.com>
Subject: [PATCH v2 0/1] hw/arm/aspeed: Initialize AST2600 UART clock selection
 registers
Date: Mon, 6 Sep 2021 06:40:22 -0700
Message-ID: <20210906134023.3711031-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-ORIG-GUID: 1TOzsCC7GR1Hq-5kz9JKSkeKLjTldwVG
X-Proofpoint-GUID: 1TOzsCC7GR1Hq-5kz9JKSkeKLjTldwVG
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_06:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 suspectscore=0 mlxlogscore=682 spamscore=0 mlxscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109060087
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=888312a924=pdel@fb.com; helo=mx0b-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: jUqTutOw8ojD

From: Peter Delevoryas <pdel@fb.com>

After fixing some commit log issues in another patch:

https://lore.kernel.org/qemu-devel/2F2F44C6-4817-4D58-A7A0-496446AC77AF@fb.=
com/

I noticed that I had similar issues in another patch I submitted:

https://lore.kernel.org/qemu-devel/20210831142502.279485-1-pdel@fb.com/

So I'm resubmitting this patch with the URL in the commit description
changed to a permalink using a commit hash and removing the test
instructions that I had at the end.

Thanks,
Peter

Peter Delevoryas (1):
  hw/arm/aspeed: Initialize AST2600 UART clock selection registers

 hw/misc/aspeed_scu.c | 4 ++++
 1 file changed, 4 insertions(+)

--=20
2.30.2

