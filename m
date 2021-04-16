Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp513748lfr;
        Fri, 16 Apr 2021 08:59:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2FfKxgnvm+LuXT7uZiXF/OsYqdPEOXqtnvWA1zjN9iEDFX7ibXnBGDCzmqV+/VdRSX6w/
X-Received: by 2002:a02:cbcd:: with SMTP id u13mr4689424jaq.67.1618588773874;
        Fri, 16 Apr 2021 08:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618588773; cv=none;
        d=google.com; s=arc-20160816;
        b=jBDncmEyUS5yC+C5D5yjdmoYSb+sECAdMLa9GZy+hxu/7jHLXqy2nUrnymSwd0HJVm
         eY9SoMStqq/GE95mCxyFPwL1ePh7icYKuggHkwHHN6//nTVpXCFEKOUISYw6wyAx5Y74
         4+cLM/98pCipt7Lq83n1YCr569WnA0WBuvo3ZS2R9zL7phx6JinxFnUy6YGG3/LT8VUI
         wVDXVebQYi66xhJEvtcZI3Mn+KRbvgzFeOpcuvnuWkRKG0kmZEnEnyTidGZgeRAIqYu6
         PPnW4YVOZMQHS8pEJWH59VdjU2SVri802DOupEDtfdbt3m2AhsNcHRvePZ8Z/QqQ0/dl
         h7qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BW7u4WcPkobkkMRidYkYfR+F2b4Woa8iJkWP89Rsaw0=;
        b=wRV5SISEBZrn4Fo38ziiDytAVVfi/bNXCSfMvwJoIsUnT7t6MTIOnSK4eMIH1RTAbe
         ekv+E452s0wXR5x3E8UPQ9DCbxg4vqr1/TZvWq7hcGXVS/ffIz38VjB9WV2KAcjF0wH+
         RvJdeyJiXenVdlXY6pCB2qD+Hwzh7EcWVyrvmhnGsMxL1fr6fLMiCW0wrVHUl5XcSEVp
         Oi2thRGMubSvb9x35t5dP5ze9aYaG5tKS0o6VKeIZBOlUIfPfcBOA0w36jZ7dy8TPBqm
         Z67lfubysDVjpmjQmfA846+KpFucovKceHpvXQXN6tPKjAvxQ6fga/fMAk0/3VI+VCIX
         REEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=rhmZSRad;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si6526479jan.58.2021.04.16.08.59.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 08:59:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=rhmZSRad;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:45704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXQsX-00042m-5G
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 11:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXQjE-0003Ci-D4; Fri, 16 Apr 2021 11:49:56 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1lXQjC-0000AL-L2; Fri, 16 Apr 2021 11:49:56 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GFYH3J053283; Fri, 16 Apr 2021 11:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BW7u4WcPkobkkMRidYkYfR+F2b4Woa8iJkWP89Rsaw0=;
 b=rhmZSRadD7SxyXstfcChiE0CWc8PebalfuVyct+eGWEFuzPREaK8B+pyVyN9/BAmTJp/
 4yoe7yDMT/EyNMZ4jnGQsoal+XinlDMjAHrIzpzbRiGp5f5aprr0Gl7ptrceknwSRQT+
 oI4NMCrvHdrr4NcIi9Qw5GSkKb7cqf8VI+C7+hILkam8gPIllOHvBchQ5aEzCe7h09nI
 o+2l06UDYSrVyvMK/Qz5B2cBYVx3pv5L1P1YK9sH0aH2nV9E1j3BRl3ytsDPapJS0Nnt
 mCqAYUmMDgJL6pryrXn+lEyYmDqW6xni3OfvCTMLQzc9qoUkGvJhKJL0r/mgHmniI5+S Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xtt557v3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:49:51 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13GFZrsN057861;
 Fri, 16 Apr 2021 11:49:50 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37xtt557uc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:49:50 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GFbxE7006087;
 Fri, 16 Apr 2021 15:49:48 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 37u39hmjcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 15:49:48 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13GFnjBL41156866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 15:49:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E96511C04A;
 Fri, 16 Apr 2021 15:49:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F77311C04C;
 Fri, 16 Apr 2021 15:49:44 +0000 (GMT)
Received: from vm.lan (unknown [9.145.157.105])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 15:49:44 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v5 4/4] accel/tcg: Assert that tb->size != 0 after translation
Date: Fri, 16 Apr 2021 17:49:39 +0200
Message-Id: <20210416154939.32404-5-iii@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416154939.32404-1-iii@linux.ibm.com>
References: <20210416154939.32404-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J43xLxcyno3JKawLUFbfMJnbOCA4Pm7t
X-Proofpoint-GUID: A_0AMjkrKDxv1E7V4_Suz2htj5rdtSqp
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_08:2021-04-16,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104160113
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 0m/n8rd+fpiI

If arch-specific code generates a translation block of size 0,
tb_gen_code() may generate a spurious exception. Add an assertion in
order to catch such situations early.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
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

