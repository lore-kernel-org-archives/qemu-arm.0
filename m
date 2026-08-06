Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0030DC56205
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:52:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws2GD-0002Qo-EZ; Thu, 06 Aug 2026 13:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1ws2GA-0002Pj-RL
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:52:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1ws2G9-0004aQ-FC
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:52:02 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 676HPQF32933226
 for <qemu-arm@nongnu.org>; Thu, 6 Aug 2026 17:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kYdzS72jYG6WSm3X80ySxnL8BeSP9cZTr0muPitbdA4=; b=Hx4wPcBbSQmriQi8
 a9GD1Zxim/uvP03VRLYxkxGOK/NvB8/gmtpoE4FqMQ/BixdrIpFSKlj82uGjKlOI
 GveKdEI1PbGG4f5pLna1IJDFXMWq5D4drA1kHoWBk0dU6DYXqCCce6rlU1SdtlFG
 xYBKItiWIgD9a536nGT7TimqquLQVLZiDWVv6jPFMIEOqoyopTlhs4p3tJLHKyEC
 jly/mCyTkRpcJnQBYtyQ/blVlE+Q/xTksAzPgBChphRtNYVdk5M5KIgCwZun/vzz
 jqgcataoOg2h5GV7R5oBWmzdg0+ICxJ8nMWpQI2TypShqwBnb35y+DMYJRZeY9N6
 a7LMGg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvxner44b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 17:52:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c0f0a0760so40917211cf.2
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786038720; x=1786643520; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kYdzS72jYG6WSm3X80ySxnL8BeSP9cZTr0muPitbdA4=;
 b=B0SYJ03cLlobB5i+Pb+jauIWAQ8ZINL8GP+PwXvXGJL2wwkZuPZuKQXyTal30HWbst
 gO10hnPHdd0dPXXb3i4SO7HFTIBnHwP/AAhx+dasS5mc5a/4UpBrphq1W9fwqaFMUssG
 1bRM8zR9cRsYcqR9LkbdiviErhbP06UlLClUX1bxfFxuK0wwfpgYX6Zk2DAN3iLjOvpE
 xRadq+p6LM4MbMSeLZ5jeP/iMWRVTOJRqlMicghQzb6w6LkS7Opt41Zzaxnt5vN40hOV
 hw85wfsDNb97oCzmxTGEgkc1XUThku0foTMlFuix75Q21Ki1G6yeZ7ioIEElqPoCENVt
 cZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786038720; x=1786643520;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kYdzS72jYG6WSm3X80ySxnL8BeSP9cZTr0muPitbdA4=;
 b=kXEtjj/OGIOFOm1yBud5Ln1J1k/X5wig1vHOtWqZNFgTjpGG+TbTe9EmaQGLXuzM1H
 GctBGygpBVWYJOwEmSBFpDVMeU5ER0/pZi4GxkBkKdF9ieD8WaUabuKJm8E+90aJnnoY
 PUrP+mJhtYzvQqm63hrLhGUtvHVFwcU3S9vNkOWVT/5mBrM7mvXuXqzHiLGeenY/zBUP
 aAPuhHTV0t85htjG2SOkm/mFnsJspEd6KB+8g5yi/FyBMtlisbHbYrR6RdNFW7hkCnSg
 2+2ceZEf1AVDAFDnLp4o3VKCXmBM+SCUB3xbGGmNk3dq8si1cH2jgzZJu9tY8oNF7xN2
 ygiA==
X-Gm-Message-State: AOJu0YxW2EkPneiYq+fYBQ05HsMDqnDd2q0dDmSFqNNfU1llP3FyLmxG
 xm7PwD414WvGZuQE6TxZaa1FWHkwqaiue3QeHaCCi1AQzhxfAWi+GJPlHmAwSEAp5d+I6YKZacZ
 45HbCN18QGLRRJpowKzdIVpVN/cUaDVPxxPWfzAwNZj2Mc4W+j72LB9Y=
X-Gm-Gg: AR+sD12EXghQmI7U30NOgFPxL7hbjJE1WsGDqGkusDa0LnNCkytzgKtB2H6o+crDFEZ
 svz3qybmLnTdZ9UByEuxpx3eip+paAeDs2jvgsfekPkN66dS39shynuLGrmzHYGWpq0OOlnhHbh
 Ez/dcrVxAoP4WbSQKs2H1jh5XAaez5l4dgGkIHwCFZXTRwLT5ecyFC+PJMeOhHFcCvpwIZsQO1z
 ybILTR5DOV8cWaY7hPffzYOJT3HePQorP3QTUg6kb/0Kkilb20Gv/qtazaN0VUz2Tq521fdNT2n
 xSaJCYPugue2SNvflT2J4jx3L/fS0oFlLNgfMwkQzjEG63xDFZ5q1crhQc9YXdAd2LlzcURc8Yz
 5GL+JPLmN9TfqlS4avqSlSkReqD+YRZdDV3g=
X-Received: by 2002:a05:622a:614:b0:51c:1132:c7f7 with SMTP id
 d75a77b69052e-52ce6187082mr165630791cf.29.1786038719662; 
 Thu, 06 Aug 2026 10:51:59 -0700 (PDT)
X-Received: by 2002:a05:622a:614:b0:51c:1132:c7f7 with SMTP id
 d75a77b69052e-52ce6187082mr165630111cf.29.1786038719023; 
 Thu, 06 Aug 2026 10:51:59 -0700 (PDT)
Received: from [192.168.69.212] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ff7b183b2sm8660827f8f.24.2026.08.06.10.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 10:51:58 -0700 (PDT)
Message-ID: <af245e94-ba75-4128-ae84-0c893a9f8a35@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 19:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] target/arm: Introduce cpu types max-v8 and max-v9
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260806163939.328201-1-richard.henderson@linaro.org>
 <20260806163939.328201-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260806163939.328201-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _D20Zk6-SBuwuKK74hpKiFjDem7K8_vB
X-Proofpoint-GUID: _D20Zk6-SBuwuKK74hpKiFjDem7K8_vB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE0MCBTYWx0ZWRfX9wBoR2ol347j
 GSnLTiykDeFYIHpDRR4JQItDEG/Qd9BxPpX3k1KUvpuRPejtMJYJBdNbTbYirbBqAypPi4Dy/ev
 6hFeMV+jJSLi9RObf62oRWXqXcMbvzTUQPs8rRp/3g9ue5fK5Kf7lxjTSd3q8qEWWPiK7BTPSdL
 Cm+ij03+8Qyfisl0avQZRCk4gabIUA4irsIG9dGYzhG8djkTXH42jTS0RqN4yg+fUg5CZXdfpbA
 4mlJZJfsOPoCvZs3hPhBB2cSHvxQeKpPVRw83mrFDPPnIprOuALiVT57NAFxQDGwlyfCeEaiYY1
 Wfyx/aJeHG6C/2r6mSBd4gSBEV0H8xjo1PSF5X74ZFJRghYN28pZOEXo24GI08xs+qxtPSwMMUe
 RjxBBXntTOcB+OssLjO9ZpKqdg3FD2uTppRUtRE11bhw3HqF22kB5njYraZmg8Gi3wQTeqA4Owh
 zbehLdr4HH4tz/mnMIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE0MCBTYWx0ZWRfX8XjYD/PEpC9P
 FF1VQjrWInPTuttRwtDvQ6mHJBis1EuP3BfMruqn2AYPoA7GKzhNTWWqmJ4YViXaQNHfes+j9fO
 GDEYH6jn8IVA9k7rXgT6Cip5jA6Kt6Y=
X-Authority-Analysis: v=2.4 cv=ebgNubEH c=1 sm=1 tr=0 ts=6a74c9c0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060140
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

On 6/8/26 18:39, Richard Henderson wrote:
> Introduce the names and allow them with the virt
> and sbsa-ref machine types.  So far, the cpu types
> both exactly match "max".
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/sbsa-ref.c      | 2 ++
>   hw/arm/virt.c          | 2 ++
>   target/arm/tcg/cpu64.c | 2 ++
>   3 files changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

