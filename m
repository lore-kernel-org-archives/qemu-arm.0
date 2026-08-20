Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8521C5DF88
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 20:16:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx9BC-00088X-OB; Thu, 20 Aug 2026 16:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9B0-0007Ok-0a
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx9Aw-0002ok-FN
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:15:49 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7pEX3492133
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jGYx+C/wjSqKEH0TVOmY80sKiqo+hAS2MJzZs3J9eSY=; b=fVqeLQcbgR64mBiU
 rbxu1H+foDgSYyQB/MpbuucvwF2pH3GWoBe8Ne4OOcBoA/i9VOwIKgZIvytro6Pu
 BjPirRj/lD0CLW4snIgOl81qo7UjOd0x40C5i5w3D24Zd98HQ/n+5bcdR4U/liTx
 GjV3OKXA3PgXxXMQD6Rxn6FHaU8tkdFZKtb+YBCSN5qWczHH1xyL3KnwvwlX+anu
 VSa1btppzvFRBCQKzsvNdHfi7NX80Z4SRBS7BGf/jGRXcxTY8Gnz+Mm6svds1+pd
 npR6CcFWRbD0mbosKBtzcaBdNDzfLWzFDej5A8UQg5tCdneP0kKdKaZ1LKoFHlT4
 myxkBA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytcaqk7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:15:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52769fc3f2eso3342961cf.0
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256934; x=1787861734; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=jGYx+C/wjSqKEH0TVOmY80sKiqo+hAS2MJzZs3J9eSY=;
 b=TcUMD1aPhcZCWNVeq+DRrTchxtCNzAvaW+SO1M/hqm9dJ1tJV9AegrrXgEFC5Nx0Gm
 cfOXi3L0+RscgnYoo1hFk6C1cmdTJgRS7warluIDSJuUE/rbDZq5uv9oYHKcvQmB+KvC
 iwBxzNtC8uznqFCnwPKfyuBEmFMZZ1EcRw6ADjbDpEPNmlYNuuA5U/P3xx+IpsDOcLuu
 w0DvMBIZfpdFROLGRt5VAt1L3u021lT33ZH16RjBfhj0SpQXghq+8+qbY9u6Y/dKaHDT
 yU1DaDESxxipaqG6/T1Z5STsXzuQK7XxlWq7jxDBeEimTS9R4lXTA/Q8iSCv1Hi+h/mc
 WaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256934; x=1787861734;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jGYx+C/wjSqKEH0TVOmY80sKiqo+hAS2MJzZs3J9eSY=;
 b=VI85v1vaoRlhoWAdeQWHnjj02r4A0zmi4cMEKIFWta3BRRBnij/zNtEmREnEMdY5WE
 Tzs0aPDxtd3gI2tzsUJO/KVh8TRfLcjRlXfKZQKGC/1kVugfB/0p7riMykbYibj77U7i
 HteFwnlei0Is7AN/onvAZy43czMwDGQxQALz4bd6Cv1jXNvyfjvwOzFlynrJHGkTB7Oi
 zNnNnEfzrbsIvoth82PiNkFf3I/K2q1m8mXQkcOH6gZwd4yT40fl8yxUAKVYCDBpf9sX
 SdSvB4VlV3jh0qkg0OHOhVfnjstWbprkVmsJzlKV4ftdC1sbSMiOBBUawhsXNvWqUKZP
 TrPQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrlqAN3f3+pSAjull9j8PDDnkQQGs92M7hlQ/hCxRI/aiZeMXnDsOXPJNzVFMcF3+qX+p3L6ru/IA==@nongnu.org
X-Gm-Message-State: AOJu0YwxOZeJLYvnD0djQNCuEJkcSpdbqrMaQSAhKbPlsIi5GZCwHwQ2
 lLaV4WkH2V524OBjDisI6D8xZ2EkGkWw3qD6UF6HIElcMlYfuOdyEFQ8KH4BhI8ZITgBrl28VGf
 gB2blfROO+eijhdcIe75zsx9uM5LOY5ylgzZy66DgwZPotVCDfBFFTqc=
X-Gm-Gg: AR+sD1164TLBFFB5us2gDTG/CaX4WGwTLGZK40dduL0RuTNA+3tFGo8WO77YUu5sFdT
 7tCMrcgfaS1Ek+xHhzYk/6oRfPs6SAPgtr34eGHP3+RuHDSv7XQmZQI5P6BvoOvE23KcCHdXAqF
 u31LSI9WWmEKCJBlKs4xZAd4AUpZUeRX7sPcoioe5N/OS53BHu/aD/iBUztPi2TBhmOpg7LVa8w
 7Wdw+Bk6JKbHHAYHPC/KkQfvMn1l7lA+vVxXz8yQwZnLq3vkY8Tpx2taMXHhuNd4zmVlVtIzItj
 aNnfhp+Qu/nZYinOLsFWUOsMl7POdbR9avCfao34Sxu4JiVXcjJIQ+970p7Dj6ROKbjdyiExiKu
 v4OJ/tjYgdapoXvuLJtkw2bGl+eCQHW3OIU7U1hezog==
X-Received: by 2002:a05:622a:e18d:10b0:52d:f700:6dea with SMTP id
 d75a77b69052e-52df7007ae6mr3008261cf.42.1787256933794; 
 Thu, 20 Aug 2026 13:15:33 -0700 (PDT)
X-Received: by 2002:a05:622a:e18d:10b0:52d:f700:6dea with SMTP id
 d75a77b69052e-52df7007ae6mr3007631cf.42.1787256933199; 
 Thu, 20 Aug 2026 13:15:33 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14b80a5sm15529861f8f.24.2026.08.20.13.15.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:15:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>
Subject: [PATCH v2 12/15] linux-user: Uncast void pointer argument as Object
 in target_cpu_free()
Date: Thu, 20 Aug 2026 22:13:52 +0200
Message-ID: <20260820201356.29775-13-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a876067 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2RGiIWwp3e7TAFkeQGYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX7E9v+48A7wr7
 M0jIkXAOCapNdKJDoA7LYTPwd6qOH32NWE2vXlLsrsA0YQ3oFT0yJic7xOhVHKWtpBp0m7H2+UV
 TI4R/LMbmFKakVs5RsYzb5ID2t8kfFsZlKOF76TDsZc/9fsJOfJzbG1Blpf8FnQe2+NvZ78xCKc
 OG7TNkAzCx1bBEjSjqVanP7CmFl10G5ZbxWOkbDQGGJvgxJeIwqwDQS6LJkaIcuJuns0bTU8HVP
 ZylkDD4D2qQXCkrz/pMBJJbNrNQdpmzkCRdvJhq8U7sZyxZlU8hryhHpFvFf4ruhwHWkkRoIHcR
 HaafH3SrCDBT/9/SXSd76jjtrNVp/A9+zVnXaRPIuV1blvQ7UACis3DrCHdpBvcJrSOVWnX5w+N
 HOVoJYG7Wb/BzNSk7O5UwiyX7ufSDA4hVryQBsEIoMBOUtEWngDLq2bhLemb54fk4ZA3ZqpZuRl
 djy9BBVQfciPlw1vMXQ==
X-Proofpoint-ORIG-GUID: eLNfom1Otp38dW84RoPPta-6T8c2A4cZ
X-Proofpoint-GUID: eLNfom1Otp38dW84RoPPta-6T8c2A4cZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfXw5CIY7xFyI80
 z22qViE87KzfXAgECZHVD+gBMwZVm9b22Lwv+kS+qvug3EnTFqo40+aiYSA+SbhI86jOBt0/AVQ
 utgffRbvhUFMf6ppRPNsxqm6sYmxleA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200152
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 linux-user/i386/cpu_loop.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index fe922fceb5a..a0790f3f352 100644
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
+    target_munmap(cpu_env(CPU(obj))->gdt.base,
                   sizeof(uint64_t) * TARGET_GDT_ENTRIES);
     g_free(obj);
 }
-- 
2.53.0


