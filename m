Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp510757lfr;
        Thu, 15 Apr 2021 06:09:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUOYqV4rLfJdB9+a38240TypO+NFxTEb+GmOvjC76mykWVYJGzCG0ymnIGVPL5uxe2HA9d
X-Received: by 2002:a1c:80cd:: with SMTP id b196mr3159858wmd.30.1618492175028;
        Thu, 15 Apr 2021 06:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618492175; cv=none;
        d=google.com; s=arc-20160816;
        b=KYhG9JPxfWG0sUrQmQKi17jR7Sx5GRtJR88SpuWhgvrIxtiE1eWGqIaqw4nYJ6ILRr
         CZpEtRYnzLy4Ml5cNXyIOL6OVeYrP0TCfayyJhG7pAQa8yd0wcayXZQ5RYojXgrkTJ65
         BXp1nfFxyup6LHp7A2glQp5Co2mhj20WlIxiEj5Y/a8g3yNBdHklE2FlL4MrZS6P436g
         XZXdp9QpKiKsd97tuAbrguiPxUeNWzgEZtQioldY8T1DVTXJ689EvYByrcCe3SOJ6qmW
         5ASxVWfpnkgsAx1asmwzwlfExo/w45GHCHVZYlhPgQw2v5+pP3g7n3jvzQaPWJrz+XOm
         TN9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HN6gi2waTXJ3xm3yRDbOv4zXp826T0uvvOsNIUyUuHA=;
        b=BcTQWilnTtyJdGpPP5a1ztGYoW+8AFLoyDJHT5e9m8dShk/ASLOwjKU6UN1u5XS4BH
         1GBoWNmREO2fwCfp/2wz6N1iUGZXTmV0fyt7Ub1aIaJ7yloBfuD98Ez9mXNAcM2Xqzje
         5rYSKBnv5zi+tx+20/owu4iBgUddWeMsu8SjuOShGeZe25YKOKvnE9LJayjHoDHtk8dQ
         niKOBcGWEvBSM4Jw79SpIVMAcv6DiNUB81MbXC0DA7DbHgzHPkl9788UgcT8e5tKmN+A
         SAXbkvfQoXwXFzU48uX9l4J+hFZWqalAkVLisSiKrvwoQpePcZybFcqFGiYHPTdlh9bh
         B7OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=BkVeh67l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12si2882571wmq.60.2021.04.15.06.09.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Apr 2021 06:09:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=BkVeh67l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:48774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lX1kU-00040q-5h
	for alex.bennee@linaro.org; Thu, 15 Apr 2021 09:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lX1eZ-00064E-UD; Thu, 15 Apr 2021 09:03:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lX1eX-0001IW-Qf; Thu, 15 Apr 2021 09:03:27 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FCYMKG141710; Thu, 15 Apr 2021 09:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HN6gi2waTXJ3xm3yRDbOv4zXp826T0uvvOsNIUyUuHA=;
 b=BkVeh67l2JIuTfRFll55SylGhLtwrF4RLUC1Gmy4LUWLpClVvBlZYWMIYJZCkvTTcWuS
 Tn8WlIU7UkSRo1/bBCQOYl7j7zBZxvqNYQ4zpYN7o9Ifhj0H5FwPN0194KsNhE5xMK4u
 UBhd9LsJrFR4n3HKPxv+cavRIJsKvD3EEO7e+X6a6hPMkuAtXCAR7Uo3RhG9+X+oY6rZ
 /9K9kKacobwqHYtHVrtSbC7RtGW4RP2RMRoEIzkwP3VB/eLTPLYBOFnvabcFT/QjRkSd
 U7yq43kqDbb35wCww7a7sqx/Op2BmJLaQIJzaaVBjkaTKSTBvv8HqttKpXqG7u2kCl3n xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x0ffjbmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 09:03:22 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13FCZco1002024;
 Thu, 15 Apr 2021 09:03:19 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x0ffjbfs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 09:03:19 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FCsfvX015584;
 Thu, 15 Apr 2021 13:03:12 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 37u39hkwdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Apr 2021 13:03:11 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13FD2k1331588652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Apr 2021 13:02:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED069A4069;
 Thu, 15 Apr 2021 13:03:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F0DEA4054;
 Thu, 15 Apr 2021 13:03:08 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 15 Apr 2021 13:03:08 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v4 2/4] target/arm: Make sure that commpage's tb->size != 0
Date: Thu, 15 Apr 2021 15:03:03 +0200
Message-Id: <20210415130305.28640-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210415130305.28640-1-iii@linux.ibm.com>
References: <20210415130305.28640-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: E3pmUiU8JJxDr4rB9X68LwuB_96icghf
X-Proofpoint-ORIG-GUID: AHLd3UN9jFJpn17D9uBpFDhR__nzoR-Q
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_04:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104150084
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Js3v9KxIkGQy

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

