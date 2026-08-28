Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBB3C61DB9
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 09:44:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzt7o-000832-CW; Fri, 28 Aug 2026 05:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzt7m-00082H-Ex
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 05:43:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzt7k-0001lF-Le
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 05:43:50 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67S85Oab1894898
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 09:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 025tpNahb9PDvkr1BjiQhy8fBQm3yFsAj1TS4aewNTY=; b=GznlEVNGsKDzo4Is
 QoZwpOcsc8ERgW5szqCWzqabm1AkGuMn1FJEFZ5j7HYC12OtxXVNEeRYMMmQTm0j
 V9Pk2/n/Ti0wr9crAUl6geBFTjV+EAPJjR7pfDSOg9W3ESdiFsGrWfzUzn9GFkGs
 F3KEUbC1zcVf81bZ7EtCU3Pn55gwIQebSHjqlne3EHpwVaBFqIdMRAjHZtXZKAw4
 2nCWZIjZUFrLpGT+5hb7Ckl6YA7+HllUEWJ5CKk8Hm3wnhIIO5yuRnk5sgtPXM7Z
 yMY04GyY9BwqmoIyaogk+T/wxt/GxLKGSFMQZgQVzE93PCLU0gaBg9lflPv+X2xX
 rmWRXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h00c57-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 09:43:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51a8b0a08d2so8242841cf.0
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 02:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787910225; x=1788515025; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=025tpNahb9PDvkr1BjiQhy8fBQm3yFsAj1TS4aewNTY=;
 b=GgBaT3q5Htk2U6Ki4DZa0T2BISpL1NhtnHr272YoJ8QpABVcAPbdgjUyU6aI7stMpF
 3MBoTJrc0YN4D1tVPImdoeQVSVGiRrp7wKOQCWheVOmZ5pHMBAkoHg/2akTY3zjIPWvT
 pggIg5hiT0V1d1sARxx8tnub0VSlg8mjTOvh+tmXRt/drbm3ocK2J40HOo8fjv7naJpy
 jbvi2gY6bfpyXunL0N/SmWJ1GlpTTjL3xwlUDdm8kuyXg2VlHIb+ED1Z5ojZYf0vmhpR
 CIcESFedAUxNtpz+wUa0ybPsIz4rizPxlWtoJ3GUipUgL7es/8/9cMe218q9MYAkpfcZ
 Qjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787910225; x=1788515025;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=025tpNahb9PDvkr1BjiQhy8fBQm3yFsAj1TS4aewNTY=;
 b=eCkiraN8R3Mcvhw1ahNtcyb5f1kBFqlIyhZxqXIKe7Ulg1Zbojlvz/XeMm/q0IVomF
 B5mjAasxU4FNasYOGe7KryXM3DELv8382j1UpFQROrn26mv1QkB9zrrXBteRaLkiDdtk
 V8yivixWMTdFBzfOS2E15ooYjfkO69409FDrhDKJEBNRMsbaxTKgQc5cQgAGfPwliEoo
 GHIY/4BA0pnStTykblWv+txWX1qHNz16S9HKVPmrzfKfHpznIla/9zzDHWZBmhpWELch
 BwnPGxOflvFXIAIUed/h36juvxxMGz0Y84Sx4RQUAsxZtE+SLwMm8JmuC5WsOXN9jbEf
 BIrA==
X-Gm-Message-State: AFuF++ljTA1CXjubTsmey8ntJACIOH9vHMJ7hcp5jYilAC2FAMqo7LzC
 tUw+y+BJA//9SHEzjlaqEheqmiCXxPQSVMDHVUU2WhCcLQKiEHL+fNuZQ4WTqUz4v/lKUwDG4pp
 ht3KjZsqWtLw/FwooeBh98sTo93Swt6vA5y/y9JcGD+nsxn2yGfCOpwQ=
X-Gm-Gg: AR+sD10hH2kY97QM0rRlOGXwbhPjrBZ9zXYUufkZQHeoTMKjBUFCx1ne4k8n3aJwy1s
 CCoSdOzVOjpYug8LbCmwcT3vZErLKGvDl3HD3bJRn+8ksjo6zOWVfbzwPGXP6sgNAcPnNjd8dsp
 Ggj25TWagaJ27j7s5xPyRUaqILXG+di4gZug7zIk+bfbjrLZa4mu4G0kH8BaXRDvR8tEFhfdZYD
 V8p2FcLG33j10vAqPHiBvKlIaBVkuwWNWMZBI6DeZOX0D9F4L/3SYnpRNfo/Gi8K3qN8iMwLqD0
 eyPQSxeOtFsQdJOWqBeIDwyyuF2nJK8669j2CVykwA6c2wdKt1+C1g3Tx1qNFdkey7bNRCB3AuC
 kqnWsOxgeMKu+NkmXKi4G1VWkZ8Si0sXKmg==
X-Received: by 2002:ac8:5902:0:b0:52e:2d19:b242 with SMTP id
 d75a77b69052e-52fb9679ed8mr59511411cf.38.1787910224820; 
 Fri, 28 Aug 2026 02:43:44 -0700 (PDT)
X-Received: by 2002:ac8:5902:0:b0:52e:2d19:b242 with SMTP id
 d75a77b69052e-52fb9679ed8mr59511201cf.38.1787910224410; 
 Fri, 28 Aug 2026 02:43:44 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbac8e61sm2815268f8f.13.2026.08.28.02.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 02:43:43 -0700 (PDT)
Message-ID: <356f285f-2d28-4d55-b77e-a08977007d53@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 11:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] target/arm: Move -cpu max stuff out of cpu32.c
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@oss.qualcomm.com
References: <20260827041557.775080-1-richard.henderson@linaro.org>
 <20260827041557.775080-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260827041557.775080-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CrocZEGw3Zs_4lGisoljZvHTpRG2QeVS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfX4uEMhjT3EZl3
 8cEBFSRahEQv1fI/fjpdU6WwIObgzjG1X4lvojh5G7FlDfxfErKcV9eTCropHnxbRITnOCxv2R+
 PHw8G7hLQ1vJC86LAfd8uqsJoHO8r/8=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a915851 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CrocZEGw3Zs_4lGisoljZvHTpRG2QeVS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfX9jZfeci/U4kr
 FIyhOqe2Wnj8C/9XJBe+gc5hBnL9mZyNpgR1oWco0PMu+EkMOwVQaOmhhzKZKHy9+5HyGnuyu3j
 kIkBw4QTLJWs3h82BaER1IUV2K7vJLo4P/6kCq/GVITulXktVp9dTU06PT7w5INVFTx/GTdJR40
 XD2aykpxUKR+zDGnDhq/hMTFoqztps+yemfz9tja1Q626uPcZJ89TfYq5TmDrv/ZsrVBraYBcZd
 y0cajcbVqbo0O3i+Fua35FhSvE7OU6Y45Vz2izGchMe1RvEqgsCLhqWK8SCg5jwoBLIR5UwpF5I
 2U0afBCJgwS4sGeYCgW7EeuqZcB3VWhNsAHIDnwE/jr7LWXiFT1qtcruNtN6lpastITC2TFl0R3
 LjBm0gmDGHGmw0HlIMHwM5nc2L3LUTAHkWw+Zt/GYrC961DwG1RJZBVEs1wpWbiqXYFAMCJ7vum
 YPgl5Wd7A3aKDu0bnSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280082
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

On 27/8/26 06:15, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/cpu-max-v8.c | 117 ++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/cpu32.c      | 111 ----------------------------------
>   target/arm/tcg/meson.build  |   1 +
>   3 files changed, 118 insertions(+), 111 deletions(-)
>   create mode 100644 target/arm/tcg/cpu-max-v8.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

