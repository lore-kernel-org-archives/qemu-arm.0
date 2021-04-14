Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5855823lfr;
        Wed, 14 Apr 2021 06:43:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcKuE/qzA1JSExaip1i1a1pqDUwoeIGrdB51kIqgJDFr/HmnUVDPsq9EzOWDA+c78BCZFD
X-Received: by 2002:a05:6638:10ee:: with SMTP id g14mr26516468jae.61.1618407801922;
        Wed, 14 Apr 2021 06:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618407801; cv=none;
        d=google.com; s=arc-20160816;
        b=XVwoT8XaGI47Nrydj0xXbZBwNHBGDSPnibnRLK1RPVn/3EngTEKn+PBKmi8Ahd9dvO
         ZmnoztFpFI+VzFhBA1q3oybBbwaCE+9uhFh0RWAyeMYts4IeB5SrRMBCNusCEIYIiLdT
         LYu295wD6Et/sMxaG6eS3VQ5Djk5uPNiRnzyX0PGJFTwIbCUBix2tDsEewf2rZ/4GR85
         bWDEshqrJMokjQB1CEMNDV8PZe00oLiN8ujveoyhbEvcU//XmPxcHms51QaMduRosGMI
         tD2WbDGOILq0CHMBorOUNai9nvz6Q7FFDJzxzQNYJBOyEnEpsknRAupTbxl+hHLRmwqp
         vP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HN6gi2waTXJ3xm3yRDbOv4zXp826T0uvvOsNIUyUuHA=;
        b=F3f1QjWkQiE7HLGazol3d/F0AdDSwTTZ5fpbr0xSLVWZs//pWSO9axCOUyfMGNw/Ig
         HNZho70di8KbmNezIAY6jW2PgKe+d71FFISfDGIncfiBRMFENLyqPIXAebQdPsGPk6Rx
         osnWMjrC71piKPWn+nXXXml9F4RYxIzuuwQhPsA1wT7UqQnWKNqcHIllktjuzMauQZA+
         bXWVWF5/dOw6z8xf/Mr1mtdZOKc2JtAzj+FZ0Gwq3sAQkoLabxkoljMIVUL0sCXLPbLo
         Wjzd9DmHnU2w9nK9w6CAgouSYdb5EmBuyB8ZBo9krML2Vok5SZnQ+zQguEHF3eZWIztX
         qlxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=favHEisn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si8944296jar.51.2021.04.14.06.43.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Apr 2021 06:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=favHEisn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:37836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWfnd-0005K4-6u
	for alex.bennee@linaro.org; Wed, 14 Apr 2021 09:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWflr-000402-0L; Wed, 14 Apr 2021 09:41:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60440
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWflk-0003Bh-SA; Wed, 14 Apr 2021 09:41:30 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13EDY6nD072260; Wed, 14 Apr 2021 09:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HN6gi2waTXJ3xm3yRDbOv4zXp826T0uvvOsNIUyUuHA=;
 b=favHEisnlbK63p/eP/x+FjXJezEA2nbh2na1xNYo865CFfUMChNhxgTu1Y7n6Aje6Mex
 ElHxGchXYyhAsB20p7X0IWpIGpeepHjsFdGNyIA4a4y6nG/bmm6OzKFmP6Y4zpyjFjfM
 0FJsKoJ6fnPbZSHYqvrn7usaZ8E98pEW5mVt0t2NBIARPFhTpp9JTEa+Hd0W0CX+4bDR
 KszU1NcCf77uEYw90lHrz7eFk71wg7hIGjf4xt60syFfyYdEFKwytXV2FLDmcuSyi6w2
 L6JPRWnI1e/GMUHhlrYb601haRe2QdI0ssuLP3OrVXP8hwVCK40XlPcZcEsb5m1AV8dF ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37wvvy82ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 09:41:21 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13EDZ1MX075741;
 Wed, 14 Apr 2021 09:41:21 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37wvvy82e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 09:41:20 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13EDc836027577;
 Wed, 14 Apr 2021 13:41:19 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 37u3n8ub2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 13:41:19 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13EDfGqh49152480
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 13:41:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AFDFA4054;
 Wed, 14 Apr 2021 13:41:16 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAB0AA405B;
 Wed, 14 Apr 2021 13:41:15 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Apr 2021 13:41:15 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 2/3] target/arm: Make sure that commpage's tb->size != 0
Date: Wed, 14 Apr 2021 15:41:11 +0200
Message-Id: <20210414134112.25620-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210414134112.25620-1-iii@linux.ibm.com>
References: <20210414134112.25620-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FFWdwE2--_gdT_qe1xF-GdpPlz3nHUVk
X-Proofpoint-ORIG-GUID: _y2-rl2qPileUDQLqJbGu_t1fmXeIg1V
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_07:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140093
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ypmAhx+oOBRP

tb_gen_code() assumes that tb->size must never be zero, otherwise it
may produce spurious exceptions. For ARM this may happen when creating
a translation block for the commpage.

Fix by pretending that commpage translation blocks have at least one
instruction.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/arm/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 62b1c2081b..885f69b044 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9060,6 +9060,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     unsigned int insn;
 
     if (arm_pre_translate_insn(dc)) {
+        dc->base.pc_next += 4;
         return;
     }
 
-- 
2.29.2

