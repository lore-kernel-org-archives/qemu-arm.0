Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A22C624CF
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:53:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LAi-0007Td-Bp; Tue, 01 Sep 2026 05:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LAh-0007TU-Oc
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:52:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LAg-0007E4-1B
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:52:51 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68179JFU1335422
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RXSFdJhduuq/vV0dSoh2i7hiqI/DLrn0WKuxvW2l1mE=; b=O5V+HEQL8s1i0THj
 XqPPq2c82rbYNaX92o5Brm2BgrweybL6qjZLhPsjFUd4OTNUYXWabWnKKYJdWo7+
 R3sjb84F2jP6CC3rH4w6np7afsdg6LwUuS5TacDGc8E7WJdM/DPvHDLo0b5svw1l
 y3v6TrwaltN6mvTXyRQUFT+8ijrzjXT3hh8NZ9xJkmYwN8NcA5iZ/Q2vh2t64p8k
 oGWWz/zN16YRNOE1pDIScKznDduMFcetk3HBqu7DBA3Bdv7AXu0LNgiNqTycRMHe
 NJ1eIS60IEZH2iVq2lZbtOgSnCW6yHqdE63GWABDSaJh27TcsEFMEHxGu8KijsJ8
 tM1EmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx2gq4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:52:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93494cce712so817602885a.3
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256367; x=1788861167; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=RXSFdJhduuq/vV0dSoh2i7hiqI/DLrn0WKuxvW2l1mE=;
 b=aosywf9ehY7SuAZpyXzXTX8PrMX+fX7J2w3zR8JujobIG9PMn0vYAzZhz8T1if15xN
 x/6E14sTNZpov/DwmuQL0GBYjjJgkzsd463+Y7/u9Y6f1XZHcZl1oNKV1O5alZjg/DXj
 HB8lw5FqF/6TR5oEOscRpLJKZKsfSWOc0YnxCBqGzFKLLYYEnDz33G30smoP/HawxCdG
 tDdItqRZyDw0Qu1j/h2Ax+83zvKLZIBQH20WKYkf2BmVPB7mHwrNO5lznbOboHsLjV/T
 GLtCf1leCcl9o1VN2nIm6iljg89W+n5OMzitO8Ede/b3OkfCkOcQY7A+2ZPT8PFlrDxO
 UHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256367; x=1788861167;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RXSFdJhduuq/vV0dSoh2i7hiqI/DLrn0WKuxvW2l1mE=;
 b=J2Mm1qWtipSarKi3o+I73YQT9s20jJ7G2LjuTqejeahskFs6MOB6HJBfeZbI6FDVoF
 ajrQvFDYdZyZfMvTVkSFUnur/67C/MBsvVxERBasLYm0vHh0StlnqnzpxUo6sIFJa5C5
 pGIWexLTelI2ChL1gfsrv01rH44JxwDFj3BG1rdwmNj5e9p+o3NA42FvN6wm9FcU+hFl
 feUCw6dJtbAV2K3c09hPmiGtpwawP50lNiaQ9R/Hlq6ESYErlitZHr50kfOkBAiHjMKj
 F1pgzsdtirHkNSc+WgJf3bqzPG2uIbOHjXCUBSLS0B1l4DgSymhK2zOHsN2O0ey+rR1g
 Wqvw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpdtkvzVMOqE9ShiH1GsXDwUPPKaG9HkVvD19EM8TRIhSkr11/oCYl3d8EdJaQv0CDAYrb8mLhbaw==@nongnu.org
X-Gm-Message-State: AFuF++k41x8B1vn2vOCvFov/TeHanjMS/VJcgsekeODLO01Db7G0btpB
 JnNV29HmMiB2mkTgMA2jvKZNzeP2fPEZh9HXcSNRl63jGacyefRfqivnZ8IdmskQ6oW394Yt5LJ
 rbqxRRLwHioAmlbAtx7D6hezzKBYZKheIFJi95CPZFQ/7iUaKalKfB90=
X-Gm-Gg: AR+sD10He+sTQbpNMHjDGpzbvjpLOpw408IviPpaQu0r52+GWfqU1iS4t01pBAZ2iHI
 F7qje2Bk6xV/xQcCXGMTt6mzrh/J46T64H8lwgGU4OPdToeNBP1n+2P80huwt8a0PGU5KdTMy+3
 YNJrzZbN/Aseq+brdgKKElBc3O2Qdx5F7/H7aRKzqN7YfGAYDkvS6Px1weAVC5iZ8KHxQ9c8Xjw
 8jBAcA80A/RS3nlgh1IuPVf3fvtVhVk5VNwy469jDqrI8S/E+0vmzjNciFgWfZZHO3+NcSD3HaV
 FIevfexMe5wChnepUI79msVIrkwLKH26pLPf+cD70HgoVOlpXzoYUDr/4yh2mLuaRRMw0NL1Jup
 2dECmqrB3Nl/1Fa2860ZysvnhMS2Ep3yyviQJRJ4q
X-Received: by 2002:a05:620a:6302:20b0:937:5aaf:8c7b with SMTP id
 af79cd13be357-93947fccb9cmr748051785a.14.1788256366512; 
 Tue, 01 Sep 2026 02:52:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6302:20b0:937:5aaf:8c7b with SMTP id
 af79cd13be357-93947fccb9cmr748047085a.14.1788256365816; 
 Tue, 01 Sep 2026 02:52:45 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce171c3sm58834755e9.8.2026.09.01.02.52.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:52:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v5 02/21] linux-user: Uncast void pointer argument as Object
 in target_cpu_free()
Date: Tue,  1 Sep 2026 11:52:08 +0200
Message-ID: <20260901095229.72018-3-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96a06f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2RGiIWwp3e7TAFkeQGYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX+Oo7MDmYgznp
 QvEnqTkEp79XormdSAFr5+PWQQP8wWMctqel8TmRl5lJCl8QPwkkrMhkl4k03AdfCHU55IyXXCo
 HWFwxVyVcHUeoEaCf1mTYHp2CKbS3mY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX2uSb9Oy5jTr0
 yXKgJFo43XOda4NrOtZ4NsOHcGLDY4sUt2QrGUUUsysMG2AEAzxR9W3gxqmbhifcRykT7fblClb
 h6NqxNI/XQALUGpVAFHmmCMXwSpM4Q+lDxRRa72forcuxu4qusd+AqrYHKh4c+XY2pr8T9A7Q1h
 ebFldDNrHaiHH19ECwOc4xkfPsJGFWx2klDq4tQTj0Vx0IvmaG/n7Kvj9RS/59GKcQX7j30yxL9
 bNDTdzlw93Xoao1f+x94SlfMRhDmms+hsBhns6wEWhurBGYQwMS1kaZopSEeRbjh6iHPFxcy6jF
 jiwFZZ0NmNcyahmJQaZGEin35kKhaw+vNHamXKJ3ZHtGHrP3GMucAWtIUzeMu/WGwt1PyA4bNtF
 p+kVLNFKB2YVuNXLyXZ4J/su01mToh2M2OjzbUkEumHkbfoL96LQzAVp9yUjrXCMmIqn3Cq3h+1
 dMPpjypKzBbyoWCj3/A==
X-Proofpoint-GUID: 3RpFTalOwvRp20Tziu3je6CkDzSytWxX
X-Proofpoint-ORIG-GUID: 3RpFTalOwvRp20Tziu3je6CkDzSytWxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087
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


