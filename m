Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09FF606A326
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QK4dpW2a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dc4JWHFF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOx1s-0007vP-4c; Thu, 05 Nov 2026 07:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyz-0004BL-0v
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:54:22 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOwyv-0005sN-8p
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 07:54:19 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5A1QWH1416464
 for <qemu-arm@nongnu.org>; Thu, 5 Nov 2026 12:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d5K4JcG2SMSzYOlw+UxnOa1o9IBK/vKQnlK0cGaK9VM=; b=QK4dpW2almABbkWF
 FI/ZQBacy/zy4fZdeVh/YqoXXhW5gGEvdnW5evSczXWs54z5LXIWmz8S/C/aIh12
 LgVlV1jGBUamLFtP3bdrAWs06eN9lAEas4E1FDf3S0AJMBCFE4cEoEn7fWtsO5mo
 U/mxD6DcK7RV09LdkhKUT2/5awE3MlTc4LnOi9xuQnwLgljIGZIV7E9kt8XfYsHn
 Eba51Ndq4ArnJ8A42hPTJ2maFr0HJ0NTJeqP6xVvpZyYRiZYGO4PB/htDEqtCxFy
 pXHt+xjtyIkxl+Zax5K0MHAYljwPWNK7FphULXj5L3wxHG2HS2LlDP4DUj+E9NQ7
 TkHdtw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd0pfb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 12:54:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93caf6c528aso321839185a.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 04:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793883245; x=1794488045; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=d5K4JcG2SMSzYOlw+UxnOa1o9IBK/vKQnlK0cGaK9VM=;
 b=Dc4JWHFF/7aFDJO2yUDRKNpqmK7fSWVV0Cbmih+T5meyDj9j856gkHYVMFqa29S+Wo
 /SJoNvNX1kWo8LjdCkxNa+ssB4Ql4yorVU8kFwqaOEvdRbGAf47FGVkrcezrv0rmRghk
 it7fs/2FwT8N/thB/MP1qHKNKt7c4qe2wk2b+65AEj3W3q6tjR8EWn4wRvKn02d79yzo
 9V9eT435Jn4MY1K5OV0xJNHUhERCn/R8fNaMQI1WnaveyLp5y0Ls/REHtmmZdS4R1KYL
 xyEg+7CgBjlWbrTA/I0ClpfrrtHNbQteyUl/ie39Wy4RebRB0RsQJknKqUrarzpgKTiJ
 lPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793883245; x=1794488045;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=d5K4JcG2SMSzYOlw+UxnOa1o9IBK/vKQnlK0cGaK9VM=;
 b=gcuw/qRsPlXmJnUzmBBaVIkx+W05cQQoO3iY+bowVW6GAb+XIUVnRWHRux7WCSJhmK
 4w1z42172ChVqa8LXL/2Mbzxocv3j913/SkWyjt3L85BFtGU1M/+utW5wH3Fzac8Fno4
 Jx0xeUm5OxriuS1uNeNXuWBQdbXITs3/wLVy84rjdomm0Q7W6Dnf0TDZo9B3TeQJNRFo
 rtA+ZZKuAK8pGouaHyeconEzvbUE1lr0iXU5LIr5hBgwiEWfglxerJSN5ecHVLfZLsEk
 m8OWtWlEmi2R3YxHPC7ouWylDSWvlGm5Bu0J5e4D4eNX/XAKtAL8JX2TQXnqiQ6844N9
 BVQA==
X-Forwarded-Encrypted: i=1;
 AKwUvByDnvUpjMjXXe8ySU7jeL1tjl6pksc1V/FpLen1Q5AW0w2a5TEpPr8WIJY1o9dYerv9oQ+luVUMbw==@nongnu.org
X-Gm-Message-State: APuU4Z+hd/HhT4jzu47iwRIpP4IEUcsfo23QbkWiEwaI1KmkwTXSfojL
 JSajEd4HxCcW8tYv0fix8mPXNcFeM22hDDdcUS6QF/Xn0SwFs4WEH5236feFj44kqqwbLAtclXS
 7j9ruIlvC7SmRCEArHThHxfmQAmV1KQ+SWM7nbW2Ym9D1tL8rK1SoD1M=
X-Gm-Gg: AYBFou1hsi3rm/bKsHbJaDlIsI+yvj03d1QcMXs7wpdfDB0Pmlws6KgX8FreJlHCr84
 iFFBtMrWNqih+3hZPnZ50GieUO2UZAwZ/GbpmbKSFKudV2MAZ5mjSUQUR6l+o6VUM0Y2omaEHq9
 G0P28TLkE9PbZd1dslA0E1+4B8Zo2SZiq3oxZ5U/NCkbiU3axbKKW06veAtK12UgRp3ZnMgX7+w
 eUEZWcR8jpVDQFHUsHDEitwsr3a6uBNQsTsTBjZhUptltSGEy0IVfBVLJLUyGGoPms0+LJOc3ge
 x+q/o84LnfMv2Z22Ek+CyhpB0TercjexuTa1l4GsNE3dT0BY86zfo3qZjdC2RmjqeBVnijvvp2j
 5o+jR2Qs+gCHx3Ja8jOeX/x90qDTZWb0RNC0d8ouWbS0xNqu4r4JVtT90aanfu5bA5c4MKHqFlm
 Tw0Phrjw2F0OKuy2May/kvADPhrnQvhA==
X-Received: by 2002:a05:620a:3715:b0:93e:6283:eba6 with SMTP id
 af79cd13be357-944216bd491mr3339197685a.38.1793883244449; 
 Thu, 05 Nov 2026 04:54:04 -0800 (PST)
X-Received: by 2002:a05:620a:3715:b0:93e:6283:eba6 with SMTP id
 af79cd13be357-944216bd491mr3339194685a.38.1793883243878; 
 Thu, 05 Nov 2026 04:54:03 -0800 (PST)
Received: from localhost.localdomain (104.171.88.92.rev.sfr.net.
 [92.88.171.104]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b57feb668bsm560273a12.13.2026.11.05.04.54.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Nov 2026 04:54:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v2 12/17] hw/scsi: Replace deprecated sprintf() with snprintf()
Date: Thu,  5 Nov 2026 13:51:57 +0100
Message-ID: <20261105125203.40320-13-philmd@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105125203.40320-1-philmd@oss.qualcomm.com>
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX0bb711O2r75h
 fIfsDmAqLIeuSv0EAo1+/hbpnl0ZlnqSIjvSjMMIULlOP2NlrEaQMqQZyg4COi1L6r0i2vCBBTO
 RXA2e3e/Qmryvt/M0JU1jjS6E41iPqc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX5Iso5McA+eEP
 lBzFD9zb3h49zRTqQ8NOBicdKg0S2w7RTgAvpZKrLIDJvuCxgCKRHUHxpDFZTwX1ZFsxqXkCJIK
 IOegae1hcZJh3P01vdMptfWdEyFOLqC+I6JkQR8X0O0AgI82X1wI/jcFa1TivnI5IIBsuoVLc3Q
 ymIbYsrRai2hNk9aX3q+Q0O49uq3keb1bY7AKL09KPDG+beXxU6njODVsn1LA6ZNsdNa72o6QbK
 pIAsnOs2ZMaikb6yjbOOTKjTNRUxKxWCvPm6zGjlqQwPeioDQCig5PRoAUovMipUEgaMsp0dnB+
 o8gcRixLVrwvqEPSVFVDWJab8OdHQfGyb4uuaSxnrPZKd0MKaDf6heYi0G2+YMdXI9rjeNFIhLM
 0pSsLZuPuEvTMGlXD7bdmtT7OuGrbpffRf//ahhstjg+sgAY/GyU8FgYFE3ZQB/gaZAvz3+R2KO
 wfo9q5ZEtLxVwHWx+Gg==
X-Proofpoint-ORIG-GUID: GD_Q3-v2d7Rck1cNtazOjxjLGVCDQpr3
X-Proofpoint-GUID: GD_Q3-v2d7Rck1cNtazOjxjLGVCDQpr3
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec7c6d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=pBdeej1U2jlWEHTh2vTwjw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yPltcxp4wr7_-ubAqhcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050051
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace sprintf() by safer snprintf() to format command
trace, silencing -Wdeprecated-declarations produced by
Apple clang 17.0.0.

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/scsi/scsi-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index e48fcb926f1d..61d9de30dfa0 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -863,7 +863,7 @@ static void scsi_generic_command_dump(uint8_t *cmd, int len)
     line_buffer = g_malloc(len * 5 + 1);
 
     for (i = 0, p = line_buffer; i < len; i++) {
-        p += sprintf(p, " 0x%02x", cmd[i]);
+        p += snprintf(p, (len - i) * 5 + 1, " 0x%02x", cmd[i]);
     }
     trace_scsi_generic_send_command(line_buffer);
 
-- 
2.55.0


