Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05EFC83F25
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Jul 2025 21:21:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1udxwD-0002CY-Bv; Mon, 21 Jul 2025 17:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1udxvY-0001cC-BS
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 17:20:14 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1udxvT-0002m6-SZ
 for qemu-arm@nongnu.org; Mon, 21 Jul 2025 17:20:03 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LH0KCc015997
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 21:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=+fQw6GvlrZy
 4nyXBmMwVnrWr+x1hCVBNBgVHmbNeyzc=; b=ES3xH7RCX588vil8hmJknmeIgNo
 uuGxW0qMbveO5si0TsCL30bK3Qg11bxAuKf+Brq6B4iR3c5gnymqkTn7Nl56dDy8
 s4/055VfwfGwMRy178rF4LUsDbWYfTbGt+M0Fx5Dor5W6Yfq5LIZe1d5tLGL1DMF
 flbiPa6H5kXKouIzD+IToH57NOAXsWIT08Q3AvN6Q5c5ooULNBd0dOfneYSgyqsa
 +nub5mTlZ9MgLILOh6Ye1Zj4WV0xAP3mMrWF1PetTGd322PNWe812Ez1kErYYxPy
 2iORJzqM43txNPUlujJ/DJ98moKnZAMeDoBq64eaWjsAZO8AMvA9aM1s3Gw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451f2uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 21:19:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b3ba7659210so3422802a12.2
 for <qemu-arm@nongnu.org>; Mon, 21 Jul 2025 14:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753132797; x=1753737597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+fQw6GvlrZy4nyXBmMwVnrWr+x1hCVBNBgVHmbNeyzc=;
 b=RnPFR52U2iT8NhOu31S0l7VEFRnfH1LjQkub+EetsvSriFDjif7jU/Na5tU+PWb49W
 2Jj2U6N16XXq3zlkIx/Xpi+EFqa7yNtXP+aq/U8WPnjOCurq1TJtL6yV7O4Q69rZ2k7Q
 ug/EHwfZBtDhWZuf9dTGex0f4Ux90Aawz6Hskb72My3rR8DqeQJlv+tPX0pd1CGPxWwU
 d7iRitOBX3L1+mFkOhk9a9roCNq0YPrUIx8tOsWxGCzUK1doX3ysZolcgCz332MMSTCi
 uMX2ThvO8gfvncp/AIxduD5obcCQQ1wmoTh/YLEffUmQqrGLROIZdSrreUjgxy2wx5rj
 Roug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv0OC7s/jQfxszgpi4wKwkaHeKScjiAl/3jn6FXx8lDP3fpsHe429jqBCM7yeu4/o1BE03SQv6oA==@nongnu.org
X-Gm-Message-State: AOJu0YwubFL7arjoKX5/USQztrMUAUgy0GSpn2GbMrAV8e7a4Khb9Xcb
 TcH14HChfLYwDX/gNeb8xbi6kJfmmOTAGuFAXJhehLvsfV0VdkOJ5lABgreuDOX7fahztxIiAHt
 Pln8p0z/v/2rwWFQTTnPiNaR/NOWMnxljmCrBekmsStMee5TZXk5ara4=
X-Gm-Gg: ASbGncvLDC4RuCuhYMuk22sAOjoqfxLsllhPZaKonli/bdVEsl2qY3UUHhTMg7MxQQP
 Q+UrtQDSSVG3V7OoT31S92kAutOSBAXdjR442G9p0/Kd9YpafiDcuQhQtmNqLwavVBUWPp2sH/x
 SEpCJMJxtbdQ1M3Q0vBgDkD1SQ+ccLD1ekyC28iIlqtrQdyRTfjRTZEMbnHEC9JKMpofLb/nluV
 mQaytS4filj7qxR6TpNA40AFa8SGkd2bqTQhGXq/HSzGnebiuivlYiHqlD55FzW7ROQZLaMDFjl
 bUCGudedV4j/qta+g0YykTiuEXLzI0AblSRjCAleo5+vWzISTD1a2pN+k3NC2XjMhHEfZHztwYQ
 4OnU7scQWIN0ZJMU=
X-Received: by 2002:a05:6a21:e92:b0:232:813b:8331 with SMTP id
 adf61e73a8af0-23811d5b784mr34505164637.2.1753132796943; 
 Mon, 21 Jul 2025 14:19:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzy+rG4z+MCFgRHdWfF1gmyGS6BGNFnENxteF83+4NQHOg38jvkmlKAngkw9fAVCN2IEbEyw==
X-Received: by 2002:a05:6a21:e92:b0:232:813b:8331 with SMTP id
 adf61e73a8af0-23811d5b784mr34505132637.2.1753132796541; 
 Mon, 21 Jul 2025 14:19:56 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbc680absm6338808b3a.144.2025.07.21.14.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 14:19:56 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: vacha.bhavsar@oss.qualcomm.com, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Fix big-endian handling of SVE gdb remote
 debugging
Date: Mon, 21 Jul 2025 21:19:52 +0000
Message-Id: <20250721211952.2239714-3-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250721211952.2239714-1-vacha.bhavsar@oss.qualcomm.com>
References: <20250721211952.2239714-1-vacha.bhavsar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687eaefe cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=u4diUC1y2Yxsy3ku_HcA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: iPuPyZ6oxph1g5SHpw94LdCsgrXe3H53
X-Proofpoint-GUID: iPuPyZ6oxph1g5SHpw94LdCsgrXe3H53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE5MCBTYWx0ZWRfX7VzrS91+NhXp
 dutxcL8/acm4yGSYVz1vyAfK4Hw5P+D1Wxfp9V0ilK1iVbF0sRhMW8hTi7HJV+A7i+3vYSuiIBe
 gQQ6Y5XWpGo/cBzd1Ie0TUnSe2J6hILO4CeW3/KQ9CYdVZQCHgooCsdFez2yH+x/Qy5/fzzfd4X
 peEdjRkzMnyB7LDCjHg5VIMJbjGc7qwwKR7sG1AL3IpJ4w4pYtOkBYGsRZmVFBxO6OnflhB8TbK
 SD5Ky24dcBWUo7xy6gfKPnWqJZaKFzweo+4zTyfBCK01frlB8QaR6KJbXsCiM48i+zfmEFlc6ch
 +lcNKroMRlYXMFxKLUvPiC0DZsdWMESdhcKQvwHL+4oqaWJyNrwF14ESCyW/lNuMel3sR9f/pij
 KSIFS7vBmG9M7UG3qAJccbZhrHAYWm7YzvScoX3OrDAc1eeOwbB3FpUOI7IxxKQiKsQcFz6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=496 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210190
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=vacha.bhavsar@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This patch adds big endian support for SVE GDB remote
debugging. It replaces the use of pointer dereferencing with the use of
ldq_p() as explained in the first part of this patch series. Additionally,
the order in which the buffer content is loaded into the CPU struct is
switched depending on target endianness to ensure the most significant bits
are always in second element.

Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
---
 target/arm/gdbstub64.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 8b7f15b920..cd61d946bb 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -200,10 +200,18 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
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
+            }
+            else{
+                env->vfp.zregs[reg].d[vq * 2] = ldq_p(buf);
+                buf += 8;
+                env->vfp.zregs[reg].d[vq * 2 + 1] = ldq_p(buf);
+            }
+            buf += 8;
             len += 16;
         }
         return len;
@@ -218,9 +226,9 @@ int aarch64_gdb_set_sve_reg(CPUState *cs, uint8_t *buf, int reg)
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


