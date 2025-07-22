Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A00C83F27
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 18:01:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueHJ9-0007BH-CO; Tue, 22 Jul 2025 14:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ueGvx-0000Fg-GR
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 13:37:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ueGvu-00009w-JN
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 13:37:45 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MF1rLo010707
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 17:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=obCClsJcQMc
 052y7t2akKepUi0DGGNqD8BY6lnSGTo4=; b=cmH3rjw/HL32ef0orVUn42DkGAW
 RGvvmqQ++ZJ4FnoCYNbu39SIoZcXsDDfHwIRaGBv+iYyHMKq0qs+OT83hgwmqV+t
 g+YcDInE9/TwL2G1os53YFswWEatzSejza/2/e+goLl8fPvbAs2zb4Y5uV2OqANi
 xlRjeUfFtPlo8LfWGuvuYlccrI8DNGaBHOfzgsxEFodZ0WQUrAQyezSl0yvFv7/Z
 tbbNsm7N/fDcKA/M3yBjISo7RGG/zXg58FOENtVo6PLjhrWcBSkLTa3C+mVZYbJi
 riKNGUHOe7Z96861yF8vZ6LpoxsaCQca0RK3qt9N/AcuiD4wRaGd7WLxdRQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t19qxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 17:37:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b3beafa8d60so7186484a12.3
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 10:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753205860; x=1753810660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=obCClsJcQMc052y7t2akKepUi0DGGNqD8BY6lnSGTo4=;
 b=Iu+IGYByaHf+2Cyr7TSd/YA06cQOTKF/bZwPI6YqZDwBiKGlqSPEwpMAwd9TFXrW7M
 Or9izwLvC3KmhuC9VnStQdWQ8Lrqgo5UcJ8Z7S0v1SdkiDHgjiEjMqUHf2qpmhLO9RmV
 H7XhZzEanRFmlK+1eH6n/4cRK/fwyqeEMfQRF6qDHJDtJhZT8646TAomSi5ysLcgDyYh
 PtHm3EcMr6VvgblWyqgF8rQje7gkRFlNto/FqBh+J1m0q1riIEeak/feC4nzP3ZqpwV4
 8u/TWz9IrekFig6Tgwoc6BP6xB1yQtlK+v812Waqc4d3Qlia+K2vglFWjEKhnfKZR9IW
 qsug==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9G+fBJifCOIT7oFFaLVRbVogxNRV/PJteV5JEo3F3pdz2IXBpeKtbuOOoJPczU2bbY7xvLekgiQ==@nongnu.org
X-Gm-Message-State: AOJu0YyEtUBYnUJ2dOtVZFNkoaeyd6dFUAlzFh8pQoxO0VH2GMt8E3vU
 McSk+VsnFmFouA3uy8MttEizhGQJ/UjhOSr1eSVuIxmWG75VWV7InBrxNLtqzdvoWH9yoMLGWlX
 Q6I1PmLVM5Nz6mKFnd1X3zt4ZgkU61LBri5vcGFQu67gJOpFJXkuHPyM=
X-Gm-Gg: ASbGncvp8Od/FnA6UrdFKhDFC0GNnM1kv2duIYHduvUVMYoJyHDfX+JJEJOL/E0SLUH
 cFqF5N18O9rwnNRWAvRvlDli1KTn48qdzH5Q4sTAVEkmNfJjuN1PcXe91n6X60IUdATHpQ8D/OZ
 1Lh+Dz9a03itV0nXyjGN2WTQAQRaaeV78/VR/mdJ0UoZFcMiIGLUyQ9L4VpPoYuZaSbk2f3Zl5L
 CdyhOUf8B6TUpyuMz6dKl5GiVIuEtZbcFK6FF9TWU99WI86VTQeJSHOep81sWoVnzr+d90WpoW5
 st5FBYl7WdxYNVvF9f6NgrKj6IzbBF9hXgS8rl81dNZeFRj3T2eVN9IbagglBJExAC9Pe2dcl3i
 jcEP362bS0ghV7lU=
X-Received: by 2002:a17:90b:2885:b0:311:f99e:7f4b with SMTP id
 98e67ed59e1d1-31e507ce490mr148982a91.28.1753205860288; 
 Tue, 22 Jul 2025 10:37:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYlm3VuL+wL06ZHfokI+fHHJVWcmjTlW2ak3xoOyfjkiYsf5LiO6T2WZWxFTbVtcu2uGFcBA==
X-Received: by 2002:a17:90b:2885:b0:311:f99e:7f4b with SMTP id
 98e67ed59e1d1-31e507ce490mr148957a91.28.1753205859836; 
 Tue, 22 Jul 2025 10:37:39 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cb5c5da0csm10081180a91.25.2025.07.22.10.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 10:37:39 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org, vacha.bhavsar@oss.qualcomm.com
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 2/2] target/arm: Fix big-endian handling of SVE gdb remote
 debugging
Date: Tue, 22 Jul 2025 17:37:36 +0000
Message-Id: <20250722173736.2332529-3-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722173736.2332529-1-vacha.bhavsar@oss.qualcomm.com>
References: <20250722173736.2332529-1-vacha.bhavsar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: R78CNjZg9Tur7he9utKvocnOLD9NHUd8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE0OCBTYWx0ZWRfX28wiO3CWuCJa
 nAmhnfBM519MlyC+3zC5Ve4sAcjPVkBjHiUFZnhwA8vCofJ4oFSf/VqLEdgBp+lxB+79zPeXR78
 AOGZv9baZKrklZZ0lZ+bFp9MdyR52OU7FGK5YTjIG/S3MV+fRwVj1F1TSDQUBGceIb3tikP3ahu
 stAfhvAkOUCQQGJR5VCe5SC4zuzJdKoXZzETcipacevIIYTvRRgGjsskGDqr+ma9t/g3Qi3xrNW
 qQJVIpKhElVMCG/aKC9z2UTTmgdkhN9Dqx/DsKTR/ZvYyWI02OTpH1UpEZR49OfROK6bG8/8SvN
 vwNkoTA89qmsNWYfCPwAdFKZhxlKwGlgkpZoYuFgC1MDp2Kq7U7Ev0RRkJMtOzKchmOhDkodBGN
 GIBY1Y8PUmSX627UQvkdajfopyvrJp8NVeD1N1TNCD1lilwENDRVmCH1c6b63b72kJgpa1ns
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=687fcc65 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=zyzssM-dKFwhFTZ1wpsA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: R78CNjZg9Tur7he9utKvocnOLD9NHUd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=717 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220148
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This patch adds big endian support for SVE GDB
remote debugging. It replaces the use of pointer dereferencing with the use
of ldq_p(). Additionally, it checks the target endianness to ensure the most
significant bits are always in second element.

Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
---
Changes since v1:
- corrected styling error in if-else block
- correct commit message to no longer refer to patch "series" notion

 target/arm/gdbstub64.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index c9d8012907..f276522af7 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -199,10 +199,17 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
     case 0 ... 31:
     {
         int vq, len = 0;
-        uint64_t *p = (uint64_t *) buf;
         for (vq = 0; vq < cpu->sve_max_vq; vq++) {
-            env->vfp.zregs[reg].d[vq * 2 + 1] = *p++;
-            env->vfp.zregs[reg].d[vq * 2] = *p++;
+            if (target_big_endian()){
+                env->vfp.zregs[reg].d[vq * 2 + 1] = ldq_p(buf);
+                buf += 8;
+                env->vfp.zregs[reg].d[vq * 2] = ldq_p(buf);
+            } else{
+                env->vfp.zregs[reg].d[vq * 2] = ldq_p(buf);
+                buf += 8;
+                env->vfp.zregs[reg].d[vq * 2 + 1] = ldq_p(buf);
+            }
+            buf += 8;
             len += 16;
         }
         return len;
@@ -217,9 +224,9 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
     {
         int preg = reg - 34;
         int vq, len = 0;
-        uint64_t *p = (uint64_t *) buf;
         for (vq = 0; vq < cpu->sve_max_vq; vq = vq + 4) {
-            env->vfp.pregs[preg].p[vq / 4] = *p++;
+            env->vfp.pregs[preg].p[vq/4] = ldq_p(buf);
+            buf += 8;
             len += 8;
         }
         return len;
-- 
2.34.1


