Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5855830lfr;
        Wed, 14 Apr 2021 06:43:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB4UyLNAdvIzVgvX0+5IcXbxPvOySTqEah3Svk/j/M0uYx9slUQXthdykbJcSlgtnxZRsA
X-Received: by 2002:a05:6602:80d:: with SMTP id z13mr30311910iow.17.1618407802191;
        Wed, 14 Apr 2021 06:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618407802; cv=none;
        d=google.com; s=arc-20160816;
        b=uJdXke9HoradV494wiErcGCE2aesJ4XLbpdNhKdsRmlIQ5Si1V7f8GHOiynCOF29ic
         GFBfx0+3aXnJoTXV1Eb0WE37DM0bnO8I16moH0lb07Vq8o5T2bB17qSrviAm/4EIfPas
         sYlBs8Xu1PUO31fHyaJFXdyr7N/i0Yn284j5bD5OeAtmFMj/gV3cR5mKQukNEzaSpOrZ
         NMKzuPuYAajP/6W10BgCQLzqCstVVTlEL0QDgmDA7pxPoW5KUJ3MLqAt5I3zPMHfAmGq
         +9uaDf8Vyg+3qM2s9Xos2BrWUzaCCWZcPDTboBBeRVlJS3RQtSuhCjba2k1V01tqAS5B
         nygA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Nm0EveWClpCAV/C4SCzoXVH1PQom2Cgmvk2fkNN9ghk=;
        b=ejjDo0cMzxFo2Z5+Ta0Ex+4LUAiDMTk73w55O7gKWycA8GV3nX6JClFv6GbzZKPVLQ
         BI4IxMW0g4EYj25mJ6xSmR9QZtJ1WpHLdITMUMZDwWYbdRq9CVa7yWHyeYoG+qtK6mzC
         Q3am5ewTrCjnOJW8RfEu1YhijmFYNIa3P0elusdYusMQDKrcJczcYzGCUEnf4CqnzCHH
         mdGzdO5tfTJML0vkG6yz+UtTiWNMOLX1dPdzOVdTDYNhtqdhagF14adaafVqKTtC6ogZ
         IyCKG6FaT18rwUoDdiaXuy1JHssUnt+RrrNz6rk4ivNKF5ge3rurkzk1u3Bn+bXbvcKT
         hmpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=OHyqeeQC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si19223173jap.7.2021.04.14.06.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Apr 2021 06:43:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=OHyqeeQC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:37892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWfnd-0005LR-He
	for alex.bennee@linaro.org; Wed, 14 Apr 2021 09:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWflr-00040W-Uk; Wed, 14 Apr 2021 09:41:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWflm-0003DL-9v; Wed, 14 Apr 2021 09:41:31 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13EDecjk048335; Wed, 14 Apr 2021 09:41:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Nm0EveWClpCAV/C4SCzoXVH1PQom2Cgmvk2fkNN9ghk=;
 b=OHyqeeQCngQumJHcvxg+VQV80XszWBsz6bf53rOCOQ6kgrDYkuYPUKh4p2Xz2d7dYMa/
 MNHJYVHFJDKyUUmfY6+5TPLFk6GjbW9pMz5qyvkgXTdJrjy7Sy+NKKzBrTZaCvp4vlJX
 +Rd1e53LHsAnUnDU3TsFDj1eFaCjGqXUG0RxDicNnYkn0DpIvxvWjqDseLIkyqn668aY
 iOzG080ohDoG08Goxc6VKEaxRaXhu+yPocG20pSPzTFK0A2Fxp9jgO8bkv+ggz0KJz/L
 nIKL9SGJv2I4H7iC78JSvoLBoxC271QW0K8Nv+cO3JiXyjGUs+80S/fI7d5jZ2j1ishv Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wykr3bgq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 09:41:23 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13EDfNio053272;
 Wed, 14 Apr 2021 09:41:23 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wykr3bg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 09:41:23 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13EDcs92013118;
 Wed, 14 Apr 2021 13:41:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 37u3n89sfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 13:41:20 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13EDfHBq44761412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 13:41:17 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DF65A4054;
 Wed, 14 Apr 2021 13:41:17 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C48EDA405B;
 Wed, 14 Apr 2021 13:41:16 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Apr 2021 13:41:16 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 3/3] accel/tcg: Assert that tb->size != 0 after translation
Date: Wed, 14 Apr 2021 15:41:12 +0200
Message-Id: <20210414134112.25620-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210414134112.25620-1-iii@linux.ibm.com>
References: <20210414134112.25620-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WWi6Ae18nIGEudMgZTwSLnwLn1rApS4p
X-Proofpoint-GUID: E4kpZITWflGC-SeIK_YdII7RlzmZ1Bal
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_07:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140093
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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
X-TUID: 9Td9LtXOEabW

If arch-specific code generates a translation block of size 0,
tb_gen_code() may generate a spurious exception. Add an assertion in
order to catch such situations early.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 accel/tcg/translate-all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ba6ab09790..93b2dae112 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1913,6 +1913,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
     tcg_ctx->cpu = env_cpu(env);
     gen_intermediate_code(cpu, tb, max_insns);
+    assert(tb->size != 0);
     tcg_ctx->cpu = NULL;
     max_insns = tb->icount;
 
-- 
2.29.2

