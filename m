Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55F8C83F1A
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Jul 2025 18:04:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ueHJA-0007ER-AA; Tue, 22 Jul 2025 14:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ueGvx-0000Fn-IT
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 13:37:45 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vacha.bhavsar@oss.qualcomm.com>)
 id 1ueGvu-00009f-DY
 for qemu-arm@nongnu.org; Tue, 22 Jul 2025 13:37:45 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MFn9lJ010525
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 17:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=sQk5HUJlRR9
 IftTw5Rv2cyyQTojyYbTrMClGWoQN4IM=; b=Z+fuWK9xQ0glAGFPMBTuur8Bz4z
 ThBQEXvVKFu7Ij0xU7Jn9pexqw4UPMV+/+LpL8tsyFSagXO+bXXiP4MBBdvzk4SB
 tkaDywF+D2kuYDHyh2+k0TqG5idfBFzPAMhp3Op5wm+RsaPlyMcOvXMOPd/pPzVY
 zDC91DOZj1kuzdjiCigs+3iUleUlo8it4b6NQa96ruB/3g5y7r+VkTKFzwjeWRGl
 se671gfa4Ii5opVyzatNs3kfxnHceu6Ez0mZduvGteWu2XrNhe7TzO2asT2y+2b/
 0TN0BPPDYeEsUt5Jl4WX9Mev49xmohNsy8LOz33rNUteh2bg7xQWhYNohCg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t19qxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 17:37:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b2fcbd76b61so6674292a12.3
 for <qemu-arm@nongnu.org>; Tue, 22 Jul 2025 10:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753205859; x=1753810659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQk5HUJlRR9IftTw5Rv2cyyQTojyYbTrMClGWoQN4IM=;
 b=afzdIRxdnE+eHokHM+1lPMyBG6b61otcDorMnNZSO39ylqPKp49PtC2XteRkvk6c1+
 65j8T4nkR/aha3hb6ql8tKz5rQF0btRXLIwBx5WYtSvQ9kppKrTk9g/7n37kz1uwltGj
 C+j114/A+vPZeGDqkipaD0xA2pPCiUa0b/R7E/eTr+RVokOIOiqTFMwTPBDANOHcn886
 G7iSjvZ3HDJU8OrCCNj5aj1IrtHbFYB386wRrsh87uzDKkjItV30vDmW0Gr+wW0gcKoZ
 /hGjPr73w58JH5o3fAiifMmH5ThUb/Jn0GGybBh/cn1LT60DEsKAmyJlx+riOLgNfiF0
 J7Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwCypbOXvd5CLYstvk6Qpf5iE6COTH/icvFlvCgNh7hGMSIX1CHhoqLBlkPKP38i8XTuVS3BDaKw==@nongnu.org
X-Gm-Message-State: AOJu0YwLCKCzoNAhoUpue3NH+I7SR7LekIWj1s+R08yQ7/1lrvmoNTYu
 nBHAzwuhBI3w9uFUgsbCpHUD4smYXKEi+RM1EQlH6gwELa3TiK3kM3LXd1O4gvtXpyoPjBrIwgc
 7rAtTthyvgZ1gNd+yAPs1gBNTpFi6eMfPD4mksRPhGKGMJNE/MqwBowI=
X-Gm-Gg: ASbGnctNYvri9UGv7AvVaTXTJkkLaCIs6X8Al3Asmv62rFgMg/U30yDAJGI8K7yBJEo
 z3O/WhvUN9j50XkYKJfxmJhuwiEe00fdTLvLiKySCIHZI8TF6edjbommWuG9fl62MSs6Cy2lXin
 rkEIe+YAXBp4MEW+4nhMykzaezTDCETPKhLuaZ1cRjrM4c5AktMBoi51kz4RkJBFgEQfN8C+WiO
 7GqEX+W8HCrZVU1pflfF3ZTQo+rjEcViHnhOdbmyj6cMHsw0qiApnCVBGp2r510Mvl2nxPoTXty
 t/xJCBy1/Z9V0ov1gG5P1K1RYmSE9EVEVpRRIB6B2FEErPQey8SyRrD/1K350vICr75lanXHPK8
 i0ac0ApE5i6cEQUs=
X-Received: by 2002:a17:90b:3cc3:b0:313:23ed:6ff with SMTP id
 98e67ed59e1d1-31e506f9b36mr216019a91.1.1753205859398; 
 Tue, 22 Jul 2025 10:37:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNSFGE9C7UIX8z5Upn1vLQE1FHr1aNfTQSqwEgQnF4vwvNd+V0ufMCgHKilz0K6BCXF870sw==
X-Received: by 2002:a17:90b:3cc3:b0:313:23ed:6ff with SMTP id
 98e67ed59e1d1-31e506f9b36mr215983a91.1.1753205859010; 
 Tue, 22 Jul 2025 10:37:39 -0700 (PDT)
Received: from admin15.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cb5c5da0csm10081180a91.25.2025.07.22.10.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 10:37:38 -0700 (PDT)
From: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
To: qemu-devel@nongnu.org, vacha.bhavsar@oss.qualcomm.com
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 1/2] target/arm: Fix big-endian handling of NEON gdb remote
 debugging
Date: Tue, 22 Jul 2025 17:37:35 +0000
Message-Id: <20250722173736.2332529-2-vacha.bhavsar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722173736.2332529-1-vacha.bhavsar@oss.qualcomm.com>
References: <20250722173736.2332529-1-vacha.bhavsar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gDWiVWiObHy8_7oMpQpUTECBOdu2KWb3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE0OCBTYWx0ZWRfXx2LEC953wS7N
 qEf7b/Eg3WpyLP0P61x9uDOu0J0DMkiHMdQGCp5qpctdMfmegY9hcOKsk8ym0OZwOhyooNwr2Vo
 7XQUPG8ccXtq8Ct1Brk8lwDZKvGR7wLQQzcwnfADZTN4EdDKOy/s+I0srM5KflVyv47DZOzA386
 GhnzTUvbBsAe06dXy5und281QyRJ4DlXn50FNaFNpeo0cPsjtK8+b1T4TVdpSw4CnQ0UKcTwsZ/
 tvXVCuMix/QgVKD2t3gQxoTS59h2qhfrOZO1JKaxVnKCzzPrpWYe/UY1zP2rjnt7z4ccayaKwIs
 64HIkpK1c5Xpeg1YcQGOKkurdVGp6Yjo7DpWhwTFaDFBYwkSzA6myqmRJ+YqIngCrESslOzqSMx
 NJImyfRPosqhLLvgshKAU0kLfoHywgHuMSgU/o7yNuDDYMnZjnHF/d6HacuQscro+LYeytMG
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=687fcc64 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=mos1SNEY7zeSx4t9hPcA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: gDWiVWiObHy8_7oMpQpUTECBOdu2KWb3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=816 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

This patch adds big endian support for NEON GDB
remote debugging. It replaces the use of ldq_le_p() with the use of ldq_p().
Additionally, it checks the target endianness to ensure the most significant
bits are always in second element.

Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
---
Changes since v1:
- corrected styling error in if-else block
- corrected commit message to no longer refer to patch "series" notion

 target/arm/gdbstub64.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 64ee9b3b56..c9d8012907 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -115,8 +115,15 @@ int aarch64_gdb_set_fpu_reg(CPUState *cs, uint8_t *buf, int reg)
         /* 128 bit FP register */
         {
             uint64_t *q = aa64_vfp_qreg(env, reg);
-            q[0] = ldq_le_p(buf);
-            q[1] = ldq_le_p(buf + 8);
+
+            if (target_big_endian()){
+                q[1] = ldq_p(buf);
+                q[0] = ldq_p(buf + 8);
+            } else{
+                q[0] = ldq_p(buf);
+                q[1] = ldq_p(buf + 8);
+            }
+
             return 16;
         }
     case 32:
-- 
2.34.1


