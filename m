Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCFCCD98C7
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 11:55:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ5u4-0008KK-Jc; Mon, 15 Jun 2026 07:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZ5u3-0008Ef-8b
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 07:54:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wZ5u1-0007NP-SP
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 07:54:55 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FAoOgX3983299
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 11:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F9xyfeJZi/F+sQMWR3d6d3d2zzj9lZVmXmtWeKDn/ac=; b=Lvj4iNFe/+DUy/BU
 pHanCTRODtdQFXaYsGGdsSU87/ad4on6UPyDUdOaqoYZwFVjgbd4J5kOfWfq5hlm
 coKr+EhChePIPcFXsA+X0bJTmOwQtIfeCeNrl+G3G2oUMWCz67ffT5ypL+jxweSd
 oI9tbJtKi51k2TEWomwfuhmZiVHdMzuK1f4A+Vh1kEtHWo20VN3y9KRb7mKvNgmT
 6oNByLQq6RR1PXHUqYFy5R+z4cTUbO0Y9tIh+NXYZGV7sublviDoQCgq5FfT7R7f
 OExI3XYtholihZHBEw3lYji/jUWLHxzdgiGmPWVv0zVjfsYc1lw1Oh/D7jhVGgnW
 iKKbJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa70d0e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 11:54:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-91576c147a4so864988885a.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 04:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781524491; x=1782129291; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F9xyfeJZi/F+sQMWR3d6d3d2zzj9lZVmXmtWeKDn/ac=;
 b=Ms+NvbRK3iR9z+nh50QpKimyRNClrIm50r2gt2OE0nevJG2ZdZzNBe4uh8HMeKgNDQ
 kkRN0czM1bCM2x+Z0mX1HC4Fia/fOLTSS/9tAWhUxrcIyiWAUsARsSlYzjxG8SSdCHiu
 1ytuUdcCvMJIEER9Ngy7ZSpbvKH5qMhyiqxOtuOUXBck7ZkNne381wXJf2n3R5lzGB6A
 D3IkhqAcoWZtaJ/Co9tYiepIniWVWIjJoOWYPIT6VxNO/1GgHx+eRcI/kFwS1aZQ8Em/
 dJumRiF5ZkFd1VeCd6bGiaMpk3lyUHCTP1KqdLsJfqeC6h94ST1A7EeHzm/mMLNVeUxY
 wHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781524491; x=1782129291;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F9xyfeJZi/F+sQMWR3d6d3d2zzj9lZVmXmtWeKDn/ac=;
 b=CbZCPKIfKfZ+mfHBGh79fkt6YbUMpJWeZDJ1Au176f8BQqhrdHVdA7HDdvngj0F1PR
 BPk6iD+Rqjx8x4L1+gVjsySyS7HfkQtq/zpu3KXqT/F96f8QI7ta9T16EQ9apbyrKM92
 B92f6AoDjkKGHJVRgVEfsc1nEPWYq9LO+PrN08fwdaiz2uOa37nSQoZ8YEn3XODDFBhP
 nLLoUF3echqlKlXhICGlTl/T1dumpAcM4FB6vLeB2gffNdzcoVUsR8U3D2D+d/kiXlu1
 idCFSEEEXyCVSF5KlbkGC4lVOODyxv16mOJiM/qnHpyTeAqPxnzpgXWQVuZOQfX8Z1yD
 STsA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8gesroDHRYxkQJVZIrokwR/iRAsEswbNa6G360p2oP2TLvipKl8LYrhnyODUqQqcEg36LYv1jtJQ==@nongnu.org
X-Gm-Message-State: AOJu0Yym8mT4A/u7uji2nBTwBMeqyJuyopu7sYeYADSAzhjNnnpJrb9o
 ezsrFOqopXy35qcYIBKj0LQQQA5dKIearOfZzfi3K/YFbFSwkKv/lXAg9jytPiHe0obMUBhpX1c
 V+2Q5JUejvcIvL6wfT4WYAmQKWWCzJStENVw5byRPaE8bi9KelnK+2G0=
X-Gm-Gg: Acq92OG5gSIroNSUgGYP47jl7q4Frbu22BmN9te0FALgTukpeWQ1c+YT8FRjDPr5RQj
 N24PKLlBAFAn3geSuHm+FY1/6WcrWcmlDphMEvwMwrONJdP+XZuGl/EHpqLCKtq406Nb634/2/A
 JwK+cf5qI+oB7XUFqg2R3zItBpkXgvNg3MrsniHs7ob9FERAdLxoVidy/ytLBx91V8UM1eJUU7A
 i1DY0ZhkDl9U0sv+NOoNjR5h5WJ7h/LXCzF7Zztzj5GV2RCUVPx5gOf1EPBNq4yB6AH+BwqlLqi
 24ve+vZE3vsjNi56u0i5rI7s2iqWXvqMFax2muq1urjLKqJKBEtcVyvlsuafhiYMlzc44Hro6rt
 cQaXZlXoVNtqh8NdkKv5DOop1x0G7FhqSWMpSrv3YeouFvOQqbpK8TlcP5D5KKRTLjGkiyy60
X-Received: by 2002:a05:620a:2992:b0:915:86a4:6691 with SMTP id
 af79cd13be357-917efbbd2d6mr1736813485a.4.1781524491430; 
 Mon, 15 Jun 2026 04:54:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2992:b0:915:86a4:6691 with SMTP id
 af79cd13be357-917efbbd2d6mr1736807985a.4.1781524490891; 
 Mon, 15 Jun 2026 04:54:50 -0700 (PDT)
Received: from [192.168.69.214] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb4b2276fsm458767266b.17.2026.06.15.04.54.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 04:54:50 -0700 (PDT)
Message-ID: <6ebb4c3b-553e-4de8-af85-c7128330dcf4@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 13:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm/gicv5: Add URL to GICv5 specification
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260615105029.2898872-1-peter.maydell@linaro.org>
 <20260615105029.2898872-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260615105029.2898872-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4LxNyBDx5xd1woA6SB-ny_CLmiTXaZhJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNiBTYWx0ZWRfXzH202DZTCj1K
 W6Wog6YXSFMcHTErKMNRY7rZ+q6rIlMMSAcv9OhWXQezw3KuPgUqvCsAp0OgsfHxdHD7+OE4AgG
 Eot+UWsOCPwV5cqkAvJq+i7u7KpjGCI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNiBTYWx0ZWRfX21KJqHNLGQ90
 EsG3x34uxUKMS+ZdvbWh71Rcq2vskStVYUUikkH3OBvJbVuDTtUDSaotq29QvoMNnBOhhGRUz5A
 aFOXh4DM2hr9tTR/Ogt/T4z95j0HOgN6cQ7OOBTCfkFx82qFhj4KPmnm/2wd1y+RuZhxNO6EDwP
 HeEcDwGKpgUrnj0voAH7w/3UWk/+yvvqwS+5/EaeGLCHWoH7ffpBJPtxE+l+zDvMiUcoiZbU2Rm
 +BGMb37FY1V7XL6ayby7KW4XuJHT8zzbBm3eBIEDs6729g4Y39OTK0+BnP+NsKdn2Wx4rsufqXi
 WDCDO/S7kECjLs8M4XMygohIuXgpobY1WyRV2I14R5aqm04zLojMFt5gPSFhN6DDGqBJuqidXEC
 jVfS2V657HRewyd1TGTg1RB3Uyd1mcU88Yov2zmh81m1/GutRI7UsUoan5OrOrQTOrYnWysdp+/
 /UEhxYTPRiWilyEeVEA==
X-Proofpoint-GUID: 4LxNyBDx5xd1woA6SB-ny_CLmiTXaZhJ
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a2fe80c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0qh-XUmV_KFcohtNKhIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150126
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

On 15/6/26 12:50, Peter Maydell wrote:
> The GICv5 specification has now been assigned its final document ID
> for a rev A.a spec version.  This seems like a good point to add a
> pointer to the spec to the main source files.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c          | 5 +++++
>   target/arm/tcg/gicv5-cpuif.c | 5 +++++
>   2 files changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Tested-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

