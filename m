Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD185C5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 11:21:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wySjK-0001Gg-19; Mon, 24 Aug 2026 07:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySjI-0001CM-VE
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:20:40 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wySjG-0006bw-WC
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 07:20:40 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67O99F133575215
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 moIOwYFYai3NnlfAbgOQRMXGHJfvZC6nBcjOaLv/HnI=; b=TK23fj6RucgPUomh
 aP47k2O8UpGSTi1C7wN527nbpiL7ynsXTObam2ydXuxZvekTjJpDx8G6H0GTIS2M
 FoEN6+zvVxkB7m115HrKspk5uyWFDpgxz9eJy5P3Ejy9XDgffwAvivuSeU9yrsKR
 SW1pNUkx61gGZjOWPJqoASFmjw69w2QNXYzFSFp36PUF2/C965ElQnAuwbJBhn8F
 3bdkVSMem+ET7nXNSCTUtNRrINSl3hw1V9vPKRuKzJAA3Pti/1Ft3Vxsi470AQP9
 X64u1lwTrSkh4/gb0UEXc/MQsC2HQbPfWDR6/Pvv5kZuzu1E8FQPT+uPTeCgro6s
 QthdoQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpjd83-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 11:20:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5174a23afcbso47831541cf.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 04:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787570426; x=1788175226; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=moIOwYFYai3NnlfAbgOQRMXGHJfvZC6nBcjOaLv/HnI=;
 b=D1phnN6najEc2UsDLO9MRZJC3FFM/slZVhOZ9k0wI8ljyctx3R+wqyCPQLFjlkR/Ya
 cPZQT/fpWJqLVO2t6kOYRnozRxDtRp3epRRrfnnvkjWJjUZPJoA7fejG7t0khc9VRwro
 mvZM+2s3smF9MmnN2v9AT1ki+sRvP+gtrt1/1zKxqpmUrhnMYhEXqRdlCdbb9WLUOetR
 o9MtOI9kAai3RPURRU+ToEnJtidIoLi0vThABLBtNne5wp7zNeUN8TMSFhEG0piX7bc0
 Nq4S3GxAYLlFCrsNTA6RIDtzrz9POL4KdE+zo5wfr4uQ9jdXHcgp3q8sgWVQSZWjrrlX
 PKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787570426; x=1788175226;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=moIOwYFYai3NnlfAbgOQRMXGHJfvZC6nBcjOaLv/HnI=;
 b=RCMBv4ZvgEvkMSJbepZspcRkwTWYOab7OXnRzqGt6a+/oaMor6E7cJ7+j8ZBc17n/j
 Pxx5l41fPwouUqgVU9s+IBTUZrcpCiLHxo6UXNDMI/a/8wpnV91biW2UP3sP05mlGnkv
 sAa+hs1IYLGmvCUo1UFaqLDGkKmz/DanXrms1NSl4vQGbWVTyv4F+AlYLDhVQbDYM3MG
 9wCDnyThSgG47luejWAEW1YGqgzoyt04kvEq9wAUoHEI2S0h4VxsAZ/oot+5FSI9l4Q5
 a+wK9ERG4GP1epXRh58Teb0jSzRgGNA24S0jRgLDj3ns/HiXDo8ePWDoch2DQ9d2p54u
 1k/A==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro2eskIm0wKWJFJAdUQB+4QTgxZHCe/W0pvSI+FZHced+6/pWJESf9wdFwXf9uxwYl7iyTfC4VmnA==@nongnu.org
X-Gm-Message-State: AFuF++kQaYQVd1d4o4WSXb1QxENHsnQM4KuymkxCRZDga41RmTUz8iPb
 ad3+U8t1Iev1h4JstTHgSDL96QGdqOdGOG1Vlaak7kdGWHjDPISrLEhVSU+yYGB/AK4huorzCKC
 tv4WfT5iGPfNNBMZOLxEDF8ZSAGGk+MT2wSgAA31uJlB8MgNuNCUxhFE=
X-Gm-Gg: AR+sD12IpflwXlueXf4BKMSLnzxHv+1pIDWeJ8jUmr5fWh1XxeaBtikRHQ/6oqqfjUn
 csjUTh/IkOPmWNH39dsX2zx3Uau39yLTJrb8a1qAmobxHBaPhELLPo0Mw2/hHZjqy+OuBFeZG7C
 fVdYr185VnFODBEojKn+R7rjB/D0q5VyUrKxlQ6W3mJs0GjgrypKUKY5SujcSwTAmMGjOhjVJDW
 Ae9GEKSeSXjxFt7VyzLzsit3Ot86wnkvO21x26CAh2jBSsZjQnKtNgvSd3xpduG8gc8hpt6LIIT
 qTaFaMV74gbk8JnMcPTPXR9x/43kpzLv/BNbZVl9Arvv6CmysCivdCi3EDQZXd4h4fA9UGUL/KA
 eWLPyvmR4HX9Db0HuMtenhCesUb0ByewZkRF4jOGM1p0tPqu0uw==
X-Received: by 2002:a05:622a:4c0a:b0:52d:f4fb:8baa with SMTP id
 d75a77b69052e-52df5a57d2amr244522401cf.35.1787570426466; 
 Mon, 24 Aug 2026 04:20:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:52d:f4fb:8baa with SMTP id
 d75a77b69052e-52df5a57d2amr244521861cf.35.1787570425991; 
 Mon, 24 Aug 2026 04:20:25 -0700 (PDT)
Received: from localhost.localdomain (44.170.88.92.rev.sfr.net. [92.88.170.44])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606b5aasm1217813166b.4.2026.08.24.04.20.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Aug 2026 04:20:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v4 18/20] target/xtensa: Constify CPUXtensaState in
 xtensa_replicate_windowstart()
Date: Mon, 24 Aug 2026 13:17:07 +0200
Message-ID: <20260824111711.26297-19-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824111711.26297-1-philmd@oss.qualcomm.com>
References: <20260824111711.26297-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfXx68dSBjeX/zf
 43MhV3ZCmC71GKEQHFOZfuoEUHhxGC+EAL8DXCU285xzpDraM1b3ht85ZzOSxjZIeMLAakRolnB
 N0l3L09WQIPHGy9uKI1UrIPFqbRPufTJ+CR0T09ktxFWLZjkjIzd6RWUVUYlg0DH0jXa94bK3d8
 ocIRsrdT53A9p8fKfZTkdsKBZFZXr1ySWyXilCy8bzTOF6rP0SKkNc+D7CzMWRb5+7JnBGM/5So
 FrS0wqzTVPfXMey8kYAQ16PY7Ens15BiRIsafgLyadPapN4bRhrJnzXQukpP+SRp15DaESUQIs2
 kdJsFnZCvDO4Jkrt4iZbINZeXvh+PnsY7XHs9AnPw3aXOp66t+qnE3ByAXc6bdDdEWFfD4iN5IC
 2jjDrsHRX77MalLHk90XUxCKJ6Eieh54mjerhcJTqS3gkwdP+7geHyQokj90WexhnXmkupsrN0Y
 Q/SQUIWx4QgkmhS8ABA==
X-Proofpoint-GUID: 0WHcqtMUu6NHl3RsMkFMczbxl15iJp2j
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NCBTYWx0ZWRfX+HvM5uAZN5+i
 ey4ITpGBUEoeCzYusPc8U51l2GXOBmqxeLlxMh5z7c3AhVOhsVsp2+5/IZXiQPBT2G016ue9pfk
 Bb/2tJ+xeIfcR5JB2eIa/DKZbfcHqtU=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c28fb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=s1NLoHz9uzatdv2VNqxUSg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=i4eqDRyDUUk0pEqmao8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 0WHcqtMUu6NHl3RsMkFMczbxl15iJp2j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240094
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

Add the const qualifier to CPUXtensaState when the
argument is accessed without modification.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 target/xtensa/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 442e98bd1ba..49d6ad9083d 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -708,7 +708,7 @@ void xtensa_set_abi_call0(void);
 bool xtensa_abi_call0(void);
 #endif
 
-static inline uint32_t xtensa_replicate_windowstart(CPUXtensaState *env)
+static inline uint32_t xtensa_replicate_windowstart(const CPUXtensaState *env)
 {
     return env->sregs[WINDOW_START] |
         (env->sregs[WINDOW_START] << env->config->nareg / 4);
-- 
2.53.0


