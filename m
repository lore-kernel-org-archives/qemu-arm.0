Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5858940lfr;
        Wed, 14 Apr 2021 06:47:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz24TItvYTkYjtXXH+oVMMVlyRgePwTeGvRaw3ezBQVGdmyNtFcXgFoE1hJhB1JPIH7BAOY
X-Received: by 2002:a02:308e:: with SMTP id q136mr26804413jaq.47.1618408023499;
        Wed, 14 Apr 2021 06:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618408023; cv=none;
        d=google.com; s=arc-20160816;
        b=eUHnvgPvL4UYQcyyH6Du1Z0bGV4+HSTk24HAm2HSBRZsPQLkYMBgGf1BwmdRvbO6Tw
         lU1xKFPcFHnNf7pSlwpWdW5RTlpfobRxFlsH+LRve2IDHRdCz4iBCcn4LGQT8xDG8s19
         EA/rlqPMB3ShA5aulh+Nm8dK7CDNApeH7rlEY2DOcVovG1lFyCIPrXpuu6wHOTo0u2Ia
         fxyjHQz2kvzAP4jzl8H3KI0oEB82PTzxhtnUkYb0+rj4TnKWOuLRgvcP7BtJ7h+R2Wl3
         Ic8P5ooEp2vcNKSWSUySb4tRItMwan8kdXHK0G6kNRBVs+FZQR5BwnFf+xWbozm1QKJ4
         k86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KRVNpWKDpLitXJ1fRoogzUtyha1ZP7A2RxagvaiWGP0=;
        b=0EcikQLcHkvsktgA3cA4lmxmM/W50gO675yIKVZZELnhRZYtvh1Ocw9yNDiS3L6q3s
         prQizC9uTLhz/E+r+oeA8rwsi0JQv33Z6wsN3NZ1lGSbMv+T3tVzHeMJk9dsFhsFbweh
         KX/hRSAB6wOUuPXhFZ2ArX0zVlFd+ti4YmcMvtzBXkCx44cjimfhlGnKYlA9ojMYQxgZ
         2xbZns3KwSxiXIz12s69d5dvnJ7whJ0bGWyF818AX6MrfrGNIFt0BNxCSCsVRgA5MRnm
         /VgPf8Sm0vGn9yTtCQUda1AFX7AkH9XvicORQgrgPN8LO1ghZ6JwCkaA+ahknDwTXEFa
         RgJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=F2piDxOE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si21594061ilv.101.2021.04.14.06.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Apr 2021 06:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=F2piDxOE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWfrC-0008Rx-NI
	for alex.bennee@linaro.org; Wed, 14 Apr 2021 09:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWflr-00040N-JB; Wed, 14 Apr 2021 09:41:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lWfll-0003Bk-4X; Wed, 14 Apr 2021 09:41:31 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13EDXGoL194085; Wed, 14 Apr 2021 09:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KRVNpWKDpLitXJ1fRoogzUtyha1ZP7A2RxagvaiWGP0=;
 b=F2piDxOErvhpt+8uxMaTTnRmJ8FLMUFJeoBTcGwp4cukUKaPK+sWHVjsfJg1ehOetOyv
 u2gxI9tMANAC/DbnvbTYvTD/4GOhUT+jUAg3FE+aW1sKfS8eTalBa/afM1LzImWc5pTg
 MaS9e9kxd+6zG8faumIf3hFepFCRpK0HZSL+0gLZnZCslGoae7Qle5cEUQEWiv4qDaZo
 r10NPPF8wkwJmOC1m2FVnQT05ohVXhaeX0wGp1uGfxzQzBjk0Bw5xsJcWoM8b1fRmFnY
 L5RYh7w6gMdC0yIBdz9fX2qsegpmV1kH3mNxBaK3JjnHoFky6/3OUEEQLFG5BmezqcfX +A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wwn1xtxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 09:41:21 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13EDXUXZ195602;
 Wed, 14 Apr 2021 09:41:20 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wwn1xtwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 09:41:20 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13EDbjkf022963;
 Wed, 14 Apr 2021 13:41:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 37u3n8bawj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 13:41:18 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13EDeriQ35979556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 13:40:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29845A405F;
 Wed, 14 Apr 2021 13:41:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86C61A4068;
 Wed, 14 Apr 2021 13:41:14 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Apr 2021 13:41:14 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 1/3] target/s390x: Fix translation exception on illegal
 instruction
Date: Wed, 14 Apr 2021 15:41:10 +0200
Message-Id: <20210414134112.25620-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210414134112.25620-1-iii@linux.ibm.com>
References: <20210414134112.25620-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a028IOKkZXaO9vTyAp9aVjEL8zoj8wo_
X-Proofpoint-ORIG-GUID: po06ZRRCdfxG4uupOcRL_kKNTLKPS5XA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_07:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
X-TUID: RGXhw04JNTmD

Hitting an uretprobe in a s390x TCG guest causes a SIGSEGV. What
happens is:

* uretprobe maps a userspace page containing an invalid instruction.
* uretprobe replaces the target function's return address with the
  address of that page.
* When tb_gen_code() is called on that page, tb->size ends up being 0
  (because the page starts with the invalid instruction), which causes
  virt_page2 to point to the previous page.
* The previous page is not mapped, so this causes a spurious
  translation exception.

tb->size must never be 0: even if there is an illegal instruction, the
instruction bytes that have been looked at must count towards tb->size.
So adjust s390x's translate_one() to act this way for both illegal
instructions and instructions that are known to generate exceptions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/translate.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 4f953ddfba..e243624d2a 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -6412,7 +6412,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
         qemu_log_mask(LOG_UNIMP, "unimplemented opcode 0x%02x%02x\n",
                       s->fields.op, s->fields.op2);
         gen_illegal_opcode(s);
-        return DISAS_NORETURN;
+        ret = DISAS_NORETURN;
+        goto out;
     }
 
 #ifndef CONFIG_USER_ONLY
@@ -6428,7 +6429,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
         /* privileged instruction */
         if ((s->base.tb->flags & FLAG_MASK_PSTATE) && (insn->flags & IF_PRIV)) {
             gen_program_exception(s, PGM_PRIVILEGED);
-            return DISAS_NORETURN;
+            ret = DISAS_NORETURN;
+            goto out;
         }
 
         /* if AFP is not enabled, instructions and registers are forbidden */
@@ -6455,7 +6457,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
             }
             if (dxc) {
                 gen_data_exception(dxc);
-                return DISAS_NORETURN;
+                ret = DISAS_NORETURN;
+                goto out;
             }
         }
 
@@ -6463,7 +6466,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
         if (insn->flags & IF_VEC) {
             if (!((s->base.tb->flags & FLAG_MASK_VECTOR))) {
                 gen_data_exception(0xfe);
-                return DISAS_NORETURN;
+                ret = DISAS_NORETURN;
+                goto out;
             }
         }
 
@@ -6484,7 +6488,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
             (insn->spec & SPEC_r1_f128 && !is_fp_pair(get_field(s, r1))) ||
             (insn->spec & SPEC_r2_f128 && !is_fp_pair(get_field(s, r2)))) {
             gen_program_exception(s, PGM_SPECIFICATION);
-            return DISAS_NORETURN;
+            ret = DISAS_NORETURN;
+            goto out;
         }
     }
 
@@ -6544,6 +6549,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
     }
 #endif
 
+out:
     /* Advance to the next instruction.  */
     s->base.pc_next = s->pc_tmp;
     return ret;
-- 
2.29.2

