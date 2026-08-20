Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F443C5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 20:15:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx99a-0005QC-Fx; Thu, 20 Aug 2026 16:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99Z-0005PI-Gi
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:14:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wx99V-0001yF-Va
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 16:14:21 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7aYG587678
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=; b=LMlsqdZRVHLB0wQT
 Zce0HAPHEDYXSvHRmYBkCDR2i22PnNg0SFZTrVdkLfxBbXU7xfmYw6O8lZdYgR72
 LA8cQa028DeUjj+8ADOAEIL3/4QuzhshS8HLdcsXcr54hjSPRd4UY9qIA0P2K0gd
 gjY+4KrsO+vrnzK9mgdHdsP3A8PAO+pP4cNPTTobxqCkkgBkM+PCBS8hoa0AgSZj
 1uOffPkwxnXW672aUy10M0bazcKfNn0XBLmA+g4vI06jSXfEW8q75uVXmvHfJbzq
 +wnmi+QrtccQDDsBALFLzTWBGWf06guPX3ByZ+ZzTA/gte5/v2zjNWjHJpYJJms4
 VFlvfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg8asd1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 20:14:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5283df62d68so2784351cf.0
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 13:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787256848; x=1787861648; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=;
 b=Ckozgvq4NsaPcaqCyGoX6FFcfWgx08ybdbi7uQU9XcuLoeJmmc2XLbobrO0WSroEYQ
 yvutxVhI9Nc3cDV5BhQKjifi3ismGMHrxrW7e8jwWlcv8TvRZn4kmyVW32QjvNLfOY3n
 eVGcsjoqA8mrNCInVf61/fjDyagatT3loOgUgAE/oYjGZLWuGCA4VSGs7Hu4cPPLNm3E
 dweuPjesa0v5ULNtKIBInOlH5YcpBscmINWpGF044E+yj1ELgRNK5NzVoRtVRaJ+p3Qj
 8cZGzL9Ils2M8Hoibp01cGEIgc4f+MQhBed8GnKDOh775m+d/2NfQitRmvVoWRl05YWx
 xIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787256848; x=1787861648;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=;
 b=ivXu3BIguiaO6HBvZSO8qA5euYJ+LPMIMuRXjp0MKGqbrkVUk0tXlW26RS4qX1olk+
 6vljyOeGtQM9vTcb+JHyl1DgiS1FYzbz26V7Ilbe1pQprN/NAoRbeRAIUAzyBRvMskDZ
 9SGL+W7Zu+8NNjX3aOfjMQJrbzwyOhxctgWK8R3JZCtdZbBkz7VXAbehJEvinPm7eK/V
 ytMXef8vVOSgBHc/TbVEWoSNGzjZvqMGj/8Au/yDxfE7FKvIkwJSQYe+YTfdqllC27EY
 osB+tTfDekr1+j1y0Tl1FXc/Rsc3mftvqyigK8uXBNkcZiwGoGT5gHfIKl7F1bMdF0bd
 syZw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr/Ru96bKmQgAR2uVE3dqJ+wi7owj7qcamqZNkHB4VY7CSGi80foV1EznN2sUvZZUV6+prmi3WuZg==@nongnu.org
X-Gm-Message-State: AOJu0YyS8B9X+lmQzqnYOspnJDpVFEOWB0WCKcbWv/75jFsgStI9rxjG
 df5ALyEpRdn00eHdPExI6FdxzVKFE8aOLLfJi5mpC6dBNaAr+oFanZNxG3J5DI4fiqe1MxdmxJV
 4/6CeUCdCrxqpNfF29p2CMQW01zMbUfGahOzlZ7CzVZDQGKeLFeA+lsA=
X-Gm-Gg: AR+sD13bcUWpkvJSwxKjg9tbTGjsmRUZEKFmUJJYatCSfFQEhS5d5YQqmka6i+UCmIG
 4q6S3WTWpXnDUTsW6itUSS54ZDmi6fjmLDuNe9pTxSncUwXfR8Cqb5fHRtPVqGMABsFCdeke5jq
 J5csdX/GQ/BRtMuCoL9eErPoqndOgSkMYNKSaN3S3ulT/Hod403cpemDVI7x2p3+l7Y2btUT/fY
 NH5DFYaVdtID90vg/ICMoPpmRQYsMdxVnuRnsQTO9sfl5RGBvsSesNNsFyYY9bFu/OUWogKDUxx
 /6pvIqbrqvG7yAhwpH6Eqij1pKqq47cPnnwJwmYz18pBbkV6459r5tWBwhrjuAKG5TMB1LU8zMA
 u/Fqf7+lQwL1hoo8ow2KC8xj5sjfN9pWMMfb3yFiLfA==
X-Received: by 2002:ac8:6f14:0:b0:51c:b98a:2448 with SMTP id
 d75a77b69052e-52df56f9741mr10809611cf.9.1787256847877; 
 Thu, 20 Aug 2026 13:14:07 -0700 (PDT)
X-Received: by 2002:ac8:6f14:0:b0:51c:b98a:2448 with SMTP id
 d75a77b69052e-52df56f9741mr10809231cf.9.1787256847450; 
 Thu, 20 Aug 2026 13:14:07 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b14b8038sm13531554f8f.20.2026.08.20.13.14.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Aug 2026 13:14:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 01/15] target/tricore: Document architectural interrupts as
 not implemented
Date: Thu, 20 Aug 2026 22:13:41 +0200
Message-ID: <20260820201356.29775-2-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX6O1CMK3ZH9yb
 msRFLC2gxoQs3iE/rmz168/KW0/YEGkw5y/lQFDcd78IwgOPKH2ds4HeOJ+TkBOclKVLJBvDT4o
 2/V9xb6MdL4wmRB7snx0C6UhmVbMEag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE1MiBTYWx0ZWRfX/ZKWpG/mP4yU
 PMzclQ+88/+SFGwpl8m8tq2ZUbIlSbAEm0qzbj5E7R177HGaq+I9ZR6OcCGFJkSHBOAlAC6pNB+
 ctomNP2EjM7TtEoTC6L8NknDcw2Y/Z5UBlplDwinxCE4Ahi04Ho3dU5DPJxt0wSnn9G3L/ZaKKL
 2C5InCWpzsQb1I/K3V6bA8gh/ArMdxDP7RfdMhLCyggzY7T8PmRbtOtENFacLFnUOYTC9ZSqZkx
 heqLmzrEVGzatrLkFxBBFmw0E+W91dQcgkufcbUvqYtlZHRio9jwJU6L/UhaeW3GY8tUJjxH8W+
 hqG3HACj7eUUDyHp2t7e4eHP3moIiD4u6HktuKTUoYwGpkGcSFi+5S6KX7bWfZOw9mAbq4BJk3Q
 CM65/1mdhaaSRT6pWMi/csG8hI+j63o2Vd8IZ6a0DhhvHROfLuZaZcgPrrcCWe/URXOsH83EOSR
 oEWP9WNjQO3ETM0p+6g==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a876010 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Cu_OB6cER5A0ZMY7a4UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2v0QHRr7W-IlWYjaTQMrfQ_m-F_hnlJc
X-Proofpoint-ORIG-GUID: 2v0QHRr7W-IlWYjaTQMrfQ_m-F_hnlJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200152
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

As mentioned in commit de680286b52 ("accel/tcg: Make
cpu_exec_interrupt hook mandatory"):

 > Tricore doesn't currently implement the architectural
 > interrupt handling.

Add a comment to help understanding why this SysemuCPUOps
has_work() handler is simply always returning %true.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 6d448727005..82b56c3cd56 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -113,6 +113,7 @@ static void tricore_cpu_reset_hold(Object *obj, ResetType type)
 
 static bool tricore_cpu_has_work(CPUState *cs)
 {
+    /* Interrupts are not implemented */
     return true;
 }
 
-- 
2.53.0


