Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE06C61DF0
	for <qemu-arm@archiver.kernel.org>; Mon, 31 Aug 2026 04:46:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0tuG-0000Wx-5N; Mon, 31 Aug 2026 00:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0tu1-0000Ns-4V
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 00:45:50 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0ttz-0005M5-Cg
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 00:45:48 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V1bd5g2322315
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 04:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fY+RQxWD/IDVoVUNeJEQwHM3Y02AvqOUqCQ76Cr/RMs=; b=nWXrOMww8zg0jdId
 rxU+5mOsYQeB4yPEhLyzqJrnM2rom5pBRntjErRCPkmuMG4AB514G69ZesannrAJ
 6Rn3fDYAjSW3jx+dFLSk7t19L1qAQ8HckBKvlmqlrvbFgWlXz9EROoutDoR9Hsgq
 uPBtHPcXl3b6iVbfNX4A14The8z6TDfFHbhp/sBolyu1amfJ8vqd/boLVaITeIBq
 qcKmUM7xvHV16cXV3GXKGLJh3ZvkraJx3Kj70rpPhfV5lgbI9wvgsnzGXaTRvu/4
 22zeg3eNmRMCLXQqZrYMhv/AIUIi/YZkampZB3XyK0/J344hzRJ6Le0LLjXl419H
 MyXtbg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgymkpc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 04:45:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-936708f129aso386613885a.0
 for <qemu-arm@nongnu.org>; Sun, 30 Aug 2026 21:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788151544; x=1788756344; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fY+RQxWD/IDVoVUNeJEQwHM3Y02AvqOUqCQ76Cr/RMs=;
 b=ZgS2PgqI59oObqgUkhW4tc363OOfEzwoB8hzJFm9EkIl/gs+Vn5UPO0doV1P8Ry/Vy
 hAe2Gu6thvtAq+IUL0YdsT0tohZ9naKA5/rxrUeMTtkuO9wSTYPT6RcUzz1MPz3bGFIz
 LsxdIEiQxSntyz+evqi9GOXozMi2Bljzsnb6eDS+ck5aO9Uo8KRv1YHe28Mq7f9OrERL
 xdt+8DnsRc7npnC89rs9pfhX7uOMedlLLv5NGYXaNPP/jlf0xbrYI0GjFF5+n6HdQ46B
 XBqZWx7SAWvyqJ+Qd0AIi7Vy3rO+iS3YoQrwqtC/LbVbn9/n0eEedYNZfNvxEOW5hqEh
 pvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788151544; x=1788756344;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fY+RQxWD/IDVoVUNeJEQwHM3Y02AvqOUqCQ76Cr/RMs=;
 b=F8ZqKYvnjFOxFwq2kkAT8DJA0Z76Arpe9QlNbz/VMPO1W6sn03STOvidy1Jd4OI7k7
 qiMzkkhNxZ2rLYKOrqk+LDNWbXNHBCEvbONVPSFlccigFInKzBZfDg4gPRnLETV2MqF8
 I3Gq/ME/URN/YyvC5DtSUGm3eWAigkubKSKqwxEVM8VJL4gw0LTrb/7K3l6cp9EmMhvM
 y+tjtZh450YfwdnY8DzVCltqtT0PTkSUwYBJZ98kEpj7iNTZGLbI02BcMBTb9Kd7uLSZ
 umu0eDg6/wu5FzGgW6J9rvpy1yALUkc/ovlC5XHzmnODOBjHmgsgt+nONB4wRuFmYJZ2
 Pz7w==
X-Gm-Message-State: AFuF++lzUXWaznVom9iz8LtDqWAVRiarpaDDbF+10r/IV9AJI9mdnZAL
 z+Wj0zH7DXn3MIv23oFykkyC896KMv60UQYbgDh0AmRO832/OlIvBjnkxoc21D275hDCPM6laxb
 fRCx4x1UwlEE2D4DxbxVta0C4Q7qADCAydEbSTqhwjpuKajBSuLZx3p0rk0qEzoI=
X-Gm-Gg: AR+sD11ooN1+m+YsxmIB/Mb9WoicD2oYBF0r42D0q2W9ndAq+qfqKqvXFGgqMXGs5DD
 T9Y24kmvzh9KmAnoRk+IPm5rgSG9/VtBNfOxcUYQRYZ52Lz2Xvf8GqVyUJl5+qiKIURNDRF//RP
 zOxzmUaF/+EEjui+TxPqLODJOGLL+OLbXEw3MxQv1zYvmqRBQoAHUigWFwBDfv2d+x+Xh69if7+
 ZPv00ab4CfGjfML20ljat002pOjktlfdGgswRHZotmP93/qy6sweWhL2PRvNLjUoETakkvhHYwc
 z3/N9eONKb+mQXvxF5W6etp1SseSUXBWwPJsOHjCtNKpQLib/mrUBGRkRMnh3rM68yqionps2/D
 ySctST6iqidIxx23BCWAsRCzvPycEJK0JBw==
X-Received: by 2002:a05:620a:440b:b0:939:27b1:66b4 with SMTP id
 af79cd13be357-939427ea3bamr60535685a.6.1788151544575; 
 Sun, 30 Aug 2026 21:45:44 -0700 (PDT)
X-Received: by 2002:a05:620a:440b:b0:939:27b1:66b4 with SMTP id
 af79cd13be357-939427ea3bamr60533785a.6.1788151544156; 
 Sun, 30 Aug 2026 21:45:44 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48436e2af3asm9403422f8f.12.2026.08.30.21.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Aug 2026 21:45:43 -0700 (PDT)
Message-ID: <eca22099-1d8d-4cf1-9a85-40240300b4f1@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 06:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] target/arm: Move ID_AA64PFR2 feature tests together
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
 <20260828222639.1432046-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260828222639.1432046-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAzOCBTYWx0ZWRfX8+a+FaRBoepO
 zzcQ8niBKO6dMQ0kum4VCo9HN8uTwceW2iyA80lFV7aYGzjRY62w07lUzqdtey7axvPeKnXixZl
 XikU6qbeLJVgu/pAseZE6WOqFY5Ec58=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAzOCBTYWx0ZWRfX3IfnudloSU1H
 CPOMTvk1rObo3boCV+MhZ1AdXNoIfhYoYoS0M7mXqkmmM4yyHUZfg4UH4ybZ8Xthtp1H5LTHgFd
 IzlYUoGm6hbf99LdmltJDBboWvakecNMyZKXeQmdmDE6O0xTyBHkYI9z1QE66mzAYPqOvn5Dyxd
 s4wRS5f4//Fvcb6AyNRGlckk3XX4Qxk+5KDAsulmqLxn2wwEHkRQOp5570NtnUU+C3rB4x3q/jo
 XaGcTUI6Geu55z+mz8xaKXDzyESVm41kjGKByQuer+Ix2I3pYeak4DoecmPAW12oyd5qP2RWzRw
 M+wkVDl/qrtr11M0FdqdNYRhwA1EFPxuuSbQ4Kn/P1xtwbGK8lg2Ld/OVQhYaHjXDyBmpHxePU3
 wz86f4s5RsvoXrAV/4lh7MZrXmNvaCXV/MWyCJjUEtSvimV9ZXgGVwaIQ/M8fV+cvY3hWCIryKj
 Z1V+1pqSnc96cGXUAoA==
X-Proofpoint-ORIG-GUID: YgInvGyNsDm1gJpOd6ocCrvvAuH3OxoW
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a9506f9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YgInvGyNsDm1gJpOd6ocCrvvAuH3OxoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310038
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 29/8/26 00:26, Richard Henderson wrote:
> Currently the MTE feature tests are clustered together,
> but those are spread across two ID registers.  Sort the
> functions by ID reg and bitfield order, like most others.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-features.h | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

