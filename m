Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB585C624CF
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 09:57:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1LCd-0003Ho-7d; Tue, 01 Sep 2026 05:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LCa-0003Gi-S7
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:49 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x1LCZ-0007kR-9s
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 05:54:48 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6817936u705489
 for <qemu-arm@nongnu.org>; Tue, 1 Sep 2026 09:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=; b=Tpg3zzEantPz9Alr
 9UInhxO6I8SQTbAmp14U+0DlvaLqRGq+zzFhzZ7U/F9U4ey9qdgfciKfc/tU02J0
 /rzu+SuZ9DoqoSmUPQb+fO4oXtDUI7tEXXJXDCMDxoRTenUwfvITw8wF0xtUULr3
 b2O2mCj7We/ls6YeKSl5OEPgERnPi0sadgUVdut+JND8Ue0h95pdaxMVFyVqzA6V
 TUzMUD1HbzN9pSWYZx8FZkxWZhlSOPasu2A4Vtts/CKhjZo6WFuRkb7I8GeDBTyF
 jWxZicio7rk40HFG+8gXyJszPLLSkxnThk9F4inUiXbypGBE9h/M1iBwO3hVTnD8
 Eof3Lw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsh6cv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 09:54:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9394ad7f64aso177545985a.3
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 02:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788256485; x=1788861285; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=;
 b=GlaZkz+UhXCI8B3MMaTXXo/iziOIPNVGNMpNvlX3P/6aNjeJXRNiMIcHQcVKybwVdw
 YpKled3IBL7MpYfqM+WyJhJqpihLnlf+nFOHk0a+19ponWIN6CHjZc3Ks1vBDbRzX/XE
 0auVcvHLLbLfaDU4fO2mSfmmNXjrXf6j8Yt/WWl4CCvHfoBGc3FqCBufHI94GdJWMuQF
 q/gpbOZaZPhfAJXyDaHFkoXMp7BPjKxj+DJIugy+8C2ZVEkJzIb7UA+/RaPvaTksjoI4
 7WPEpkm15ewYzy4yr/WuhbFdebRHZkpVH9AcsahCbP1+YmUXsdfn+sE+BZOOHCfwm2Qg
 bvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788256485; x=1788861285;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iDP7SSBBed9OilMDhZqOv3xXCrS8V81wrx791E5ihCQ=;
 b=Bv6AqKLCfxxXvD1eiaIkgRH7/tHEtO5ZMM3Y1e5OkJYV5xqLeDxdZnoJpHZkUuXDGh
 0amUrcmlmivyESRd8x96CwtTub5N8Pi/QuUZi/Yt6ama6Qmgy/F90mmDytin7lLe4u0I
 LKZEM7+INHQwjx6qhaa6FNnG4x/UpQKFDfqe0FsRrX6agImyAKalEhupZO/UBF7PLAPu
 W5izusWSAaKK8Myo7T1QbBBfpjSouwJwGEb4SOIXHyZHHfxL5N7qN2mEJT3BWOYaS286
 1YIi1CjXtWiO+laZDGCzNSNsol/sI8kP4g7bCK6BeTDakv8z/cYy6GGs0wjjq0VY98vz
 ZPzQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrdTgSuiAbuWIgiHZrm7dWHfV2pC6x308lnRju5E54LHMO8V+HQLri1MpchoU3I+GpR78K+HDwhRQ==@nongnu.org
X-Gm-Message-State: AFuF++lgz2ssCL7ECz1rqJpLKoMY13WdKhFEv3J3vu0pBxkFSTfIsyxO
 CSTZGIkUsroXkblxjFyxwHLZag8AsHTAZHNXIKJtrH7272ESTWOA6Ol5hEKQt8p7qIZCa6gQl5x
 l94YW2iLsXPnOFeauAq9Z0ip9aw21u1dT8n1PDGP/78Ztb0b0KtX2RAw=
X-Gm-Gg: AR+sD13ER5WNp8j9ZQKZlI3f7leNpcOjINHFgk8bjVEOEHVmY2hrV9IhVL1oZYSZte3
 xjhnRV2pDHCGl1ZzRft4JIchmnfjKih3sisw9y067JopMK8Ie+U9Fl2hZv+UvBu/lAXTFFMKt9L
 rnS7op3c1Es2u9U+6Jsa8K2HbnQrP5MT7dGwBANQRUdKJCOjF6wIUSC6MGznQsaPtukPT+n2zyn
 W/82zgn5PT6XLhLQP/NcYuF/TFZhBxzYVzghOAZNLD0BOahH1MIIXHkowLQzPnpcx7OIk4mVCTo
 1ld1KoaJG3S/RP/YFiivo3ysCQ3dHX6+GnPJ3EeADVFzHAJnghwu5aJJklhvOK59gVlGM3FdeOU
 rRHAxQZNs0TD8D5kjlM8Mv1TLp7KvAdxEsoM5vdVj
X-Received: by 2002:a05:620a:43a3:b0:939:31b5:4e08 with SMTP id
 af79cd13be357-93947d40bf7mr1071038585a.0.1788256484654; 
 Tue, 01 Sep 2026 02:54:44 -0700 (PDT)
X-Received: by 2002:a05:620a:43a3:b0:939:31b5:4e08 with SMTP id
 af79cd13be357-93947d40bf7mr1071035985a.0.1788256484235; 
 Tue, 01 Sep 2026 02:54:44 -0700 (PDT)
Received: from localhost.localdomain (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce08b8esm51007345e9.3.2026.09.01.02.54.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Sep 2026 02:54:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v5 18/21] target/tricore: Document architectural interrupts as
 not implemented
Date: Tue,  1 Sep 2026 11:52:24 +0200
Message-ID: <20260901095229.72018-19-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901095229.72018-1-philmd@oss.qualcomm.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX+6B9zg5YQVzZ
 dCf5n43ui3UOz6Q4yESl7BM5+/AjZ2vPizjq/hYQVxSwAVgO3luybGDKKymjG5qmCWWEdEfSXVD
 dT/rQLw5bATZOOvb0VcRClC07zX/SxI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXzhSKL/DeO6Mb
 wnVsofrGqwRgYnP/OaBTWhTIIM0WR/0LhQdyUoGhq1pYaHosdYtiXNqeRvg7aIWUof6aJkeb4+u
 VWkj+5TocmfdUkC3ld8LTcejDKe8D6XTeYtWXshiLTuFZci+ug2X82aouvFsEB8d5gAf3IEX2kX
 cPYmgnk6Yh6tCiqvfg97IamImAqKnzbn9aHWgWfPjIouwOeBWcNaL3VFYlyoUVIo6BtWijDy+hA
 +p5GnRFSKasJeHuwVHBbNRGEh9izdNxTUYRk1U13YNjwk1fUyiyfUqXL5sutMPBza2Xln44Tcx2
 X0A6DVsPXM79I9hQek1o0xMa+etR2jIEtNfMDQoS5xuL8yo5f+KOs+wQE09Sgtp7mpqsbTcLB/G
 gXypY8dURY3aaTmMHox7/3PL+5FL82zFw93u+GSSFX84g+cmhwI5Co8D1HguqapakoEynxxNDtJ
 cXyjmt/dG1miimZFGXQ==
X-Proofpoint-GUID: XqAz7J8sbVHH0n5-50D8RzsfJT0pvIea
X-Proofpoint-ORIG-GUID: XqAz7J8sbVHH0n5-50D8RzsfJT0pvIea
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96a0e5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Cu_OB6cER5A0ZMY7a4UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
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


