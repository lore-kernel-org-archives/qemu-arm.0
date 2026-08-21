Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E018C5DF7D
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 10:55:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxMp3-0003lz-3I; Fri, 21 Aug 2026 06:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMp1-0003j3-Oo
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:50:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMp0-00035G-3T
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:50:03 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9MPLv1572264
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RXSFdJhduuq/vV0dSoh2i7hiqI/DLrn0WKuxvW2l1mE=; b=jSHD2uT9+Uu7LLDr
 c5rFt2uITfugowPNazmZYv4w0L9T2Qczp6qzcWHvWIQ/zxhOELgmw4ttom4w0Nht
 +UIjgjXFUgW0t9RGfK+a/Z2tAOQzflBd6vpdzq/jwOfF/eA98uMiPDOBMvZOPID0
 qqRhxtrOS8vUB8o55F/JmXJObsWUc8sNfKdg7J0asNRLeKbXE77+D0x5qwctvi4I
 8tsMEqMgfbTUtH+3frundZyGm6pPLN6l/LvR5rpQ5Kb3aVZpviHA3HwHVrcpNHK2
 E5BJNBmXpbbQs7sNGu0QkeD6RSTBzaznZN4wsoGdAQOK0ucTybO0QHpTKvlCSw+g
 /iuGJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fue18vs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:50:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5174a23afcbso13770161cf.3
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 03:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787309400; x=1787914200; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=RXSFdJhduuq/vV0dSoh2i7hiqI/DLrn0WKuxvW2l1mE=;
 b=ErjKcZjTkzeEe9u0wrQdvhAocY+ELEcQYjUPCT0WsqxJVe8Kn/yp0N3YR57nEuMAR7
 DngdCdLxDTkWVb6S+uW4HLH1dpC9iL2lBB6AdoJpmNRbqF3vrHFclSSC6+nzP+dsfA+9
 YyZr56b843166+xiZZcE23oszs3Tw5Iem/IJ2FrF3f79zA6njK1iayvbqsn8ih5SH1NB
 +clGZ7HNIUpF/D7SeQKFSTmAEnOm45FgZlaic2FEtkF9d1pxTC1BNQhUtJZySnzqPSCf
 2fJbkqEHmeuhT9J1zO73egHFQQ/NKe1UPnIgKxfAxMpOtwbV9YnLv/sMXiqDwWLpPF0Z
 m0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787309400; x=1787914200;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RXSFdJhduuq/vV0dSoh2i7hiqI/DLrn0WKuxvW2l1mE=;
 b=GtM9DuJc0Zkh7+ueKMQuwkgTt1SHIYih8nmjwt46vnWfpdfFf4fR4hDHvCgZ49mnHJ
 wDZCqLSj4MSWD/ywJJTc8DTfsARE6WtBonvX/LMxqkLolyKZ7Itc8L5FPIGvxOZ77QHH
 xmOE7QX3bLoZNoe+9ZIPsrLyKrDLsFFgKYajZ92EIDYD5MNDqf6TAuXXKcs/hc+Apoqk
 NWJQCgapMdZZET/ySfFQCpS3avhhhxm+/yioq+AXZMrXbxpPVU4od0kE7aRfcqJKGlPE
 /LIEqm3x161IqmGfuMN01ofedvNnf0K+dYCknAXplA97MkyS+ISgSlkQ4WMwkfZe2G7T
 WoTA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqfqXQRfXo6LMLc1gkq9mc9hMhLQrP9P4cQUIz2+CzRjxFVpCVe8chUWp+d/XIr2s/CtanV5vr99w==@nongnu.org
X-Gm-Message-State: AOJu0Yz5h94PWntsUjgO1JBV+xDgLWOE7lPcozpKS2HhZXSUABKlRl0d
 +axBF3pGyj5qjNCApFh11tHaybrFwwiQZqckb1z1+wZu0dKdB9xyCnXE8pGj2DTWl/QCThm3TwM
 J0TQwb//oa7/lIWOqR/UE7nWxwA+UGLRHMy37cWb3w2PRGx0T+Z+xH4g=
X-Gm-Gg: AR+sD11n0TBCGTNMJH5QNeTjiV+YterpYeIZ8qRAbarw7o9u27XNwDfh9jZ4SeKoMd/
 4jF9LV2UtAvzVQVvLDYtvYMrv024TwTP3rS1i3rqYSNgV/KGzdrDO+HX7wRD9uqgLKa+KvIjuIB
 uPIgioYFfNkcZefBOvr1Q5tyRLyvKTso6WNMuQ3L9yAtCw08nJfUAsXBYknh0VwKogciii17oBS
 3i0vZTWtJM3QWe+p/fXuKMsCJS2faGUmEekpj6XzJ0XTVUXNvrI2IEBB8xRjJz1L4d8kmvqcEou
 CGTkftROxodUFVlp3u03BwK9N6mEZrJn4i+bpym8IyJeuVik/k/oB3nVIrc+0wSSoP/lTHBuWH+
 R/qXWPm3qx79GQ5a8ccwtQ18neD+bUBV0GkX6QxBoAA==
X-Received: by 2002:a05:622a:a11:b0:52d:918b:92e2 with SMTP id
 d75a77b69052e-52df56f1740mr49132271cf.6.1787309400578; 
 Fri, 21 Aug 2026 03:50:00 -0700 (PDT)
X-Received: by 2002:a05:622a:a11:b0:52d:918b:92e2 with SMTP id
 d75a77b69052e-52df56f1740mr49131911cf.6.1787309400169; 
 Fri, 21 Aug 2026 03:50:00 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b145153fsm16798002f8f.12.2026.08.21.03.49.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 21 Aug 2026 03:49:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v3 01/15] linux-user: Uncast void pointer argument as Object
 in target_cpu_free()
Date: Fri, 21 Aug 2026 12:49:35 +0200
Message-ID: <20260821104950.32108-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821104950.32108-1-philmd@oss.qualcomm.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX1/eU9F06Qw93
 +DNautYq9iRJAtEwI8tUYTuEx4beDSLbudiP9dMcileJ01UE3y4uIVQUit03ipsxn1dUAQgxDAz
 rdouFwoJZQd+foCFEhBhaTNdYhVbaMg=
X-Authority-Analysis: v=2.4 cv=U9+iy+ru c=1 sm=1 tr=0 ts=6a882d59 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2RGiIWwp3e7TAFkeQGYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tWHNF7nHhJsHqK1kcPTTy_QLl6Twlj0M
X-Proofpoint-ORIG-GUID: tWHNF7nHhJsHqK1kcPTTy_QLl6Twlj0M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfXzLPgCZiN9fpX
 pp2wbmLadyFUEoPdSd2asXgjcZW0FFQyjtLwAWUtSzPxRTtJX4HC0sdrZNv4xMKJroOrkPOvcxi
 O6ZjLU3o8uVOkx+57/g2bpBgDgAB86dfq40IcUQA04mSx9sCk7qgatAb8UMGhPsRO9SrZh5Cuj9
 eTXn90RGQEEmUs9/Y5Xbl4JrFRDpMIo0PUn2jWUCk8LO7V6U2em22DGZDJ2VbsZ29P+/MXkPXVC
 WKCXwpzUSfT7wZXNG9acx9txidrkMKSs1doqjh3yot15fGF3UwDeqhEIJ3cqSVDLLHvCaTjQGUw
 MD2u6A+PUoPxhhIZ+1PJeXdDpOp7u7Qwk9c98EsuqSYstcmSTSVIY1jJlBGg9Nb7yCCviW8Ht8M
 mxLEGTFBvFjXxGdlb6mvOkdWeWR1Seu3qZxcg0KS94TdxyOq3MZZ/i4A1MfatE4I3x95ktTb6I/
 MOVeeEUld6Srphy8fzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210081
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

init_main_thread() is registered as Object::free() hook, thus
take an Object* argument. Uncast the void pointer as such.

While now cpu_env() accept any pointer type, next commit will
restrict it to CPUState* type. QOM-cast the Object to CPU type,
otherwise we will get:

  ../linux-user/i386/cpu_loop.c: In function ‘target_cpu_free’:
  include/hw/core/cpu.h:604:31: error: ‘_Generic’ selector of type ‘void’ is not compatible with any association
../linux-user/x86_64/../i386/cpu_loop.c:331:19: note: in expansion of macro ‘cpu_env’
  331 |     target_munmap(cpu_env(obj)->gdt.base,
      |                   ^~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/i386/cpu_loop.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index fe922fceb5a..2f733b0b477 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -326,9 +326,10 @@ void cpu_loop(CPUX86State *env)
     }
 }
 
-static void target_cpu_free(void *obj)
+static void target_cpu_free(void *ptr)
 {
-    target_munmap(cpu_env(obj)->gdt.base,
+    Object *obj = ptr;
+    target_munmap(X86_CPU(obj)->env.gdt.base,
                   sizeof(uint64_t) * TARGET_GDT_ENTRIES);
     g_free(obj);
 }
-- 
2.53.0


