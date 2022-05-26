Received: by 2002:a0c:fd46:0:0:0:0:0 with SMTP id j6csp5624921qvs;
        Wed, 25 May 2022 19:12:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznd/mwZj4dIubNWCwTTxifdStT7+57kAuOOcf8cTXHrDDLlvHKgOimMEInc64JMWIqXe2D
X-Received: by 2002:a05:622a:1056:b0:2f9:37d8:674c with SMTP id f22-20020a05622a105600b002f937d8674cmr13740854qte.501.1653531163045;
        Wed, 25 May 2022 19:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653531163; cv=none;
        d=google.com; s=arc-20160816;
        b=onPyp3Sm+pR9FRBv2o/huJTI+iiyffFhGru40PrWbBfilPMPbd67vTK//1RN7P6E1S
         8kyRvkrCRtexkNJs6cTcuw7WAf+ecNeU88Z5dE1/cYMiF7wQ5RzwtUf5xiGaDqU/Qt2g
         QVBl77Ty0nvvDirgSR9ohwMb3D58xZ8OiZx1hySiXEcxU3rrMXN8MqwxeDi9Wpu158Re
         2Oo9+3cgQcIRfVT1ZYTppxKzFwrEAZhtpkYmrgedDM9NWJ87EMR6Q5gDEGAIgtyk5bbp
         6cEgBgfVdJyWn2hWDVWFhIOoFM/sak1sVnBYnIrPhquqNqorxAPuiH/JcUnTFUaJsJVb
         Aehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0tDtY0iho28AtwSUQp0oSDDM1KX4yoxs5pcq2ac9pyg=;
        b=FwvEP5DRWBdRwQC6EwvEwvIII6NtaupailgDG+TAZBHW6acvjBN0HqEhbQO/AOWB00
         1kyS1y0qyP43rZGJIP76TpA7yPfGN5DnIK31lXB0Ilj1SqOuD/mkIFlX/opoVQ5qTorW
         yXYoB54RImxtwbg6l5nFp2DYBJrRXzlEqkdffYxWaRbySVfV47W7Qm00EV6fo+8rp1QP
         y2Nv/MRsJsK7Yqpu7J8l+fmMzFsLEetxDCyvvWAFFTo7ojWxjzR4urArXbKMQxRK9CGh
         yW7KP+zO5CD3D+ICEITQtrhxpr1vT373f3MJLYGvEDAbAy8U0UDGKx812U3QPEJ+viBI
         wtTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=BziqZQ+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020a37ef09000000b0069fd2bfe472si292049qkk.129.2022.05.25.19.12.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 May 2022 19:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=BziqZQ+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:49824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nu2zS-0001zY-Cr
	for alex.bennee@linaro.org; Wed, 25 May 2022 22:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6145f87153=irischenlj@fb.com>)
 id 1nu2yw-0001yw-JJ; Wed, 25 May 2022 22:12:15 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:37024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6145f87153=irischenlj@fb.com>)
 id 1nu2yt-0005Zw-O7; Wed, 25 May 2022 22:12:09 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24PGtbrP029208;
 Wed, 25 May 2022 19:11:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=0tDtY0iho28AtwSUQp0oSDDM1KX4yoxs5pcq2ac9pyg=;
 b=BziqZQ+RBdvdZ4BiqcRnj5eEK+NfAXr5hsX9jzuLmFPYR/abDgks3gPugmHZYrXWgCfI
 3ireZjl9CWtpdycP9ujDwJsDXtKvIdHAgrO1sQhoErxehZ3nmXJQsu5RMg8hA1ZL54rK
 vai5RJYaPhxbEQ6TcryrasUkAu+RrcDRr94= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g9puakxvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 25 May 2022 19:11:50 -0700
Received: from localhost (2620:10d:c085:208::11) by mail.thefacebook.com
 (2620:10d:c085:21d::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 25 May
 2022 19:11:49 -0700
From: Iris Chen <irischenlj@fb.com>
To: 
CC: <irischenlj@fb.com>, <pdel@fb.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <clg@kaod.org>, <patrick@stwcx.xyz>,
 <alistair@alistair23.me>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-block@nongnu.org>, Iris Chen <irischenlj@gmail.com>
Subject: [PATCH 0/1] hw: m25p80: add W# pin and SRWD bit for write protection
Date: Wed, 25 May 2022 19:11:42 -0700
Message-ID: <20220526021142.1030127-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <irischenlj@fb.com>
References: <irischenlj@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c085:208::11]
X-Proofpoint-GUID: 1qorHmWyrcktnYUOKxcdQgbDDb_Gn9G9
X-Proofpoint-ORIG-GUID: 1qorHmWyrcktnYUOKxcdQgbDDb_Gn9G9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-25_07,2022-05-25_02,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=6145f87153=irischenlj@fb.com;
 helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: WqcGChlTjKJd

From: Iris Chen <irischenlj@gmail.com>

Hey everyone, 

My patch adds the W# pin and SRWD bit which work together to control the
status register write ability. 

Accordingly, when W# is low and SRWD bit is high, hardware protection
mode (HPM) is initiated. All other cases result in software protection. 

Acceptance tests have been added to verify all four scenarios: it tests
the ability to write to SRWD depending on whether write protection is
set. 

Thanks, 
Iris

Iris Chen (1):
  hw: m25p80: add W# pin and SRWD bit for write protection

 hw/block/m25p80.c             | 72 +++++++++++++++++++++++++++++++++++
 tests/qtest/aspeed_smc-test.c | 62 ++++++++++++++++++++++++++++++
 2 files changed, 134 insertions(+)

-- 
2.30.2

