Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE92C5DF81
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 22:29:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxBG7-0000GR-4G; Thu, 20 Aug 2026 18:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wxBG5-0000Fq-J1
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 18:29:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wxBG4-0004D2-3g
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 18:29:13 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67KK7ZJS3491366
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 22:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XpHC1BZeGxeFF9YH697vM6iZjhKAVmVy/IAiny80ZYA=; b=cQa4X2fzbQvuIdXi
 yDsZYlZPXleG4SwNlEz0nl/Ymi/vEc+Gr95XpjWYi4JBM2ypVLmQ6bt2d1XZf3sq
 J4hCSLLQHyTZgM0cEaCgQdy/Nhz86kF6+hEMBq0WCheJDDUhEoCb/U76jVXoMePW
 BnRfzme7EzghXRT9nGhAAupoSPqLQFPXXrx6EH5vIcqPYvmXDEGxinBxGWhrTxTj
 VxZUQq36QXBRa5utpotZC1ndOPpe8j7TiJByQt69EFzFhNom+OproAz8J1GMJL3w
 6pKjrSj7CUTLDOIuVDACYCgByim/HRCgsqxpz+LrCIf1h+PrPEeZv1j/6/QHyGJh
 38wzXw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytcb4r2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 22:29:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-38dde0df80bso430798a91.3
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 15:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787264949; x=1787869749; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XpHC1BZeGxeFF9YH697vM6iZjhKAVmVy/IAiny80ZYA=;
 b=FHH6Kg7mOAczb4DaFEGYFMQ6z9YN4aUQBKxB2Pnxia/4/0Voem/doD+HPzocwwTh83
 70xVFVytYsOiF0K3SWTf/4k7KSn/7rsWNa7YpThMNVrRbVIHIcr//BbZIhkaFErRzuTH
 JvY4Jwr78ZhEDxUzW2jwOUuYbi/w5lvv42GIjDsdv0v+D9RVfM48o9pKmwFX+c4j+Gif
 5lhZd3ckI8dnWymqldSEaAxGGcd9J7HCSOJoS/PKBT46gccz+e0wKFIGbmDaNvrjmjFh
 uZDrC5AFsk0Plij73peUv4KpjAJwymItelMRiR7/LoVSncE+R8FtbSr0HBFel2MS9isw
 /PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787264949; x=1787869749;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XpHC1BZeGxeFF9YH697vM6iZjhKAVmVy/IAiny80ZYA=;
 b=g2AsehSQxGHdf+Ts/EYfto3v6th82qtML6h6NxXN+5X1iHxCMsygG/5n0Y2daZTHnR
 3Qjyijrf/H7lDbnzVJF7HgMTM1R6gpseYMdPro3IYYdv6ZI0jrpB+CmU6UIBECc1tkj5
 ve4t1eNrW9U9rhGPCl0I1KibWzmMpDEb9lXVvlZwS6e3C1XJy4LacwA7gkyeMDRmLIWk
 y9hV9K9SX66/6qAat9mXDp1HoFTCPUKZZf9BZS7tONE5TJhxvcgp3n48Mzo6ZFEx9/IG
 FeE2jUNrR2zPi1eOeWe32MTIayRUs8xvqkmcvSGa+HtF0EDvR+cDeRjbHIZYdUXPfz72
 DNFw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpVGa52d35u/cH0c+KIJOYpivPFyziyggr61yJgMEb+gXkq0dnA05Pp4XQO52ihAPLiRtWqu774TA==@nongnu.org
X-Gm-Message-State: AFuF++lXVqAnMli6+2XgnrvGWvsRXeSDRRKM9dzt+LRdbWM9X9McLTiV
 exqlb5wNz/oVyC+2rRdYkq/arfrMswj4IyyKofSYl4RHCRTKRhrmXPHYnGq3y2y0KYi/3xBYJZE
 ytEYjeEKHJosVVIdehlZR0qEQ1d+zwU0GihBfKzeBNnFtdcH2//0re+k=
X-Gm-Gg: AR+sD12eoW3EMsi/sVTt5DrK/gkDC3TwO68+8UGngUvfBnFxKYC8wkuI+fo85UE62Qb
 fu5kduZ/XZyYjRsn/YRBOHwJ4FRUQl+p2UnBX8k8wGJ0X+A72gaGxAiW3K4Df73VeiJaOW5QEon
 O17T9SDjdrqFEtR7iRSLqvmzGCUpJlMXvlHDNxePYjUv9Q71BlfYnwPODmAnlCgcd18OYH6WsJO
 bn7wojSzgefGX0L08zjrpYp5OCNXTOkrMZXv4iPb5UxQRKPh692/47k6eAby1e5GJrdgiN7lS/O
 onGGixljg9u4nSPDxlDykWq2Mr0PdsOiAgrqlCVGgK0YIj1wD4h/vR8H0/wEEe/00WuY6PRpY65
 AAaA3EgqNOVmeMHfRDEMo2OW3N+EZ+Wh8FAM78AE2XPe1nOgNq+NHID3VrVOuZBGBEcts
X-Received: by 2002:a17:90b:530c:b0:395:5404:95 with SMTP id
 98e67ed59e1d1-395c35516a0mr3098881a91.12.1787264949551; 
 Thu, 20 Aug 2026 15:29:09 -0700 (PDT)
X-Received: by 2002:a17:90b:530c:b0:395:5404:95 with SMTP id
 98e67ed59e1d1-395c35516a0mr3098827a91.12.1787264949126; 
 Thu, 20 Aug 2026 15:29:09 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395c4b47ae8sm524884a91.13.2026.08.20.15.29.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 15:29:08 -0700 (PDT)
Message-ID: <4b80bd7c-1002-4ae4-a9fe-7449c0637687@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 15:29:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 15/28] hw/arm/smmu: Make CMDQ invalidation security-state
 aware
To: Tao Tang <tangtao1634@phytium.com.cn>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Mostafa Saleh <smostafa@google.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20260813161515.2788900-1-tangtao1634@phytium.com.cn>
 <20260813162512.2807281-5-tangtao1634@phytium.com.cn>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260813162512.2807281-5-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a877fb6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=fgrLqfBXAAAA:8 a=Hmx-Tj00yXVqkUNXdAAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=_Ge82aPy-h_wFa7gWU4u:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2NyBTYWx0ZWRfX2kfDdR0hcD56
 2dNVENl63EoJNVIfsnoDc4T6wHkn8Yq6XByFiYPkxXDqaR6YkJW/H108zN/pbgStnTrbeekA8hC
 6M8OWNj+Rs1puys92j+v0THF3zJCNYbXReqbs+33ge1pEDPZW/23DXB6ioa1vzjqJtkcth3OFhx
 v2oYbLhAU2SZ1DLqmBNPkfzaUx10/AkuMS2ex77mLb5ZrRbx+odAqgCTdD2s6Jy69YVgLTRK4lK
 o/YnCNpJFdtS+d9GWQ7tvSWx3shbuZ/FpiCLQhMS3OheINGzVhX9tMq5VomkI/HnZPGTOwRLMdh
 nFDNTOZpg9ALoen+fp9OnE8wG0HqRsSYlE/IVfA7TM7ENIoRQqm2obRSLTIQjWVwkmXuUfamtkU
 M8v39pyYNThEJbA2B8yVXB+8ZSu/CNHS4tSqds3oK6+32KzGbfD02l61Ul/T+ENk+auTGlrgAcY
 onDwivg7VkqQuc6PP5A==
X-Proofpoint-ORIG-GUID: FV0RVxe1eVyXMyO-sozR5WNy3164-yff
X-Proofpoint-GUID: FV0RVxe1eVyXMyO-sozR5WNy3164-yff
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2NyBTYWx0ZWRfXzd8u9hYzEBdK
 GW/SBS5QHAjVJ+keeKfB6pk8TeqxjVYzEmGo+3lGteIm3/nhxFWOlfyRHfAUZqtyMmTD7d1N8Zn
 atM42dKQjz3GqntkgJATj/8gNxaiQWs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200167
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 8/13/2026 9:25 AM, Tao Tang wrote:
> Refactor CMDQ invalidation paths to carry security state and apply cache
> invalidation per sec_sid instead of globally. Add separate helpers for
> invalidating all entries and for invalidating entries belonging to one
> valid sec_sid.
> 
> In smmuv3, propagate the command queue sec_sid and command SSec through
> CFGI and TLBI handling, and gate VMID use on the stage-2 capability of
> the selected command queue, including SMMU_S_IDR1.SEL2 for a Secure
> Command queue.
> 
> Keep acceleration and IOMMU notifier propagation Non-secure-only.
> Commands targeting a programming interface other than Non-secure do not
> reach the accelerated backend or Non-secure notifiers, while Non-secure
> stage-1 CMD_TLBI_NH_ALL remains forwarded to the host.
> 
> Include the command queue SEC_SID and target SEC_SID in the relevant
> invalidation tracepoints.
> 
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmu-common.c         | 100 ++++++++++++++++++++++++++++-
>  hw/arm/smmuv3-accel-stubs.c  |   6 +-
>  hw/arm/smmuv3-accel.c        |  30 +++++++--
>  hw/arm/smmuv3-accel.h        |   6 +-
>  hw/arm/smmuv3.c              | 121 ++++++++++++++++++++++++++---------
>  hw/arm/trace-events          |  12 ++--
>  include/hw/arm/smmu-common.h |   6 ++
>  7 files changed, 231 insertions(+), 50 deletions(-)
> 

Given this patch, would that be simpler to have multiple iotlb hashtable
per sec_sid? This way, invalidation becomes trivial.

It has been long time since last version, so I forgot if there was a
specific reason to keep a single table and add sec_sid to each entry.

Regards,
Pierrick

