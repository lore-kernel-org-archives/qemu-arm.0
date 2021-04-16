Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp513122lfr;
        Fri, 16 Apr 2021 08:58:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaHxcpwJh8GJyg0amawt0+B/CmYnt0FylZ8E5dZuUBzQgP6pHPtKaZt8dTiV8EAfCUSue+
X-Received: by 2002:a92:d74c:: with SMTP id e12mr7528405ilq.13.1618588729794;
        Fri, 16 Apr 2021 08:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618588729; cv=none;
        d=google.com; s=arc-20160816;
        b=b7OfVQnvNKQlDPerzr0RKa4/Al5ITtyAQkQ94EIDLEIb874vldnFeVplMfzTw/zOlQ
         RBblpjwn8Q+vR86jKTHMACALLsclNVxOoyINv9Wm6sxymrC8fR/phA6j1kn4PtyRsosG
         I6OovgxA6GOmcOFy+oj2hqx/BBSZfz8FJ5NYwiB2q2ROyyq55Gmq247FYMmaWJTqM1hN
         ei+cB8n8JeFC3KmNHAESI2ha1ntjgqkGCJROQlQVwu0mwbYA4q0CgRqEh5tYgKiRiDuP
         HrQBSvTXvunOzIvzVCS6VcU6PbZKowJcChlJ3vdkpDb93zRMAYG2eHuuXC+MicgqmHd+
         b6Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aIH+K6nY0M5Tr83uVAnya+jMs4dVBoGuCziova4IDT0=;
        b=qCyTxJabXa0dtixR86JIaALPnkmZRzCO1nIzX5SffS/sbMc08Yr4e25ScL7esocrp9
         qo6+WMLiaf4R4sX9YARvffSL2MSYa0dTE1BIXfnbaw+fBFgshacLqOATe5+b5om5mI5W
         yur4YyTCV5Fl8PTXpA+tnDEpmD/S2B3dv8Wsn2FZ3TTBMaYlWO9R+sge4X9fr/Uf6IBD
         2hl3vsj430douHH8mm+JC4OyCHXS2Dzy3gnuN5YgICF9M6XPNE5g6ufGzqOPTgagsK5I
         Ihewj6k2Ltq4uKh+6U27CW5YnqwaEusY++5EvR7FGV1jtdP4eNibAWGRueKIfiVvYzJX
         BUFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=f81oEnCU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n126si1993476iod.105.2021.04.16.08.58.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 08:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=f81oEnCU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:44600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXQrp-0003Zk-3Y
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 11:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXQjB-000375-TH; Fri, 16 Apr 2021 11:49:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5010
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXQj9-00008C-4z; Fri, 16 Apr 2021 11:49:53 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GFY0Xj065507; Fri, 16 Apr 2021 11:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aIH+K6nY0M5Tr83uVAnya+jMs4dVBoGuCziova4IDT0=;
 b=f81oEnCU39RArElfgWZnBeKMkN/JTy6hEsrI4pLcJ9oVBMjfGHraPXnrXrMNkIWSc9an
 KtIUSqga3oq79PA8YRxmWZJjkcIQIfiwYoQi3kyQfZ9GpDzD4eh5JIaGqOmbZ7OWCKMb
 63ktaHL5mAlKHGXaNXLAaKoZ0AiZJ/nBpOzxhPGdvTwxeuMZWgb0+W8wEkpDUb7u58Kn
 aAx+a9aEarT3+070QWeuhNFvB0+I+200rwOs92j3Ouhs6rfBr1MbxL1ztiYkzVk8ZtKm
 7MeTfEkxp1mQT5UmKHIOWooi2CM6rNFlqvUEvME4lPxBSr+NCWbFCG5tHpVv4VzSJuM5 rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xxnpq9rr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:49:49 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13GFaD7n073332;
 Fri, 16 Apr 2021 11:49:48 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37xxnpq9r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:49:48 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GFdZpm011719;
 Fri, 16 Apr 2021 15:49:47 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 37u3n8af9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 15:49:46 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13GFniKx51577332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 15:49:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15B1E11C050;
 Fri, 16 Apr 2021 15:49:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7878811C04C;
 Fri, 16 Apr 2021 15:49:43 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 15:49:43 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v5 3/4] target/xtensa: Make sure that tb->size != 0
Date: Fri, 16 Apr 2021 17:49:38 +0200
Message-Id: <20210416154939.32404-4-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416154939.32404-1-iii@linux.ibm.com>
References: <20210416154939.32404-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lGGMW3XrmXZ0P2quwYlERV-qi7_veL5d
X-Proofpoint-ORIG-GUID: i6OE4pETpKl-BvmMDWhilPH0zVbdCxJV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_08:2021-04-16,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160113
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
X-TUID: 5x5FXNzSjk9m

tb_gen_code() assumes that tb->size must never be zero, otherwise it
may produce spurious exceptions. For xtensa this may happen when
decoding an unknown instruction, when handling a write into the
CCOUNT or CCOMPARE special register and when single-stepping the first
instruction of an exception handler.

Fix by pretending that the size of the respective translation block is
1 in all these cases.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Max Filippov <jcmvbkbc@gmail.com>
Acked-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 0ae4efc48a..73584d9d60 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -917,6 +917,7 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
                       "unknown instruction length (pc = %08x)\n",
                       dc->pc);
         gen_exception_cause(dc, ILLEGAL_INSTRUCTION_CAUSE);
+        dc->base.pc_next = dc->pc + 1;
         return;
     }
 
@@ -1274,11 +1275,13 @@ static void xtensa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     if ((tb_cflags(dc->base.tb) & CF_USE_ICOUNT)
         && (dc->base.tb->flags & XTENSA_TBFLAG_YIELD)) {
         gen_exception(dc, EXCP_YIELD);
+        dc->base.pc_next = dc->pc + 1;
         dc->base.is_jmp = DISAS_NORETURN;
         return;
     }
     if (dc->base.tb->flags & XTENSA_TBFLAG_EXCEPTION) {
         gen_exception(dc, EXCP_DEBUG);
+        dc->base.pc_next = dc->pc + 1;
         dc->base.is_jmp = DISAS_NORETURN;
         return;
     }
-- 
2.29.2

