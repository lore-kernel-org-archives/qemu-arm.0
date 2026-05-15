Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208E5CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 17:05:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNvxl-0007Xq-1H; Fri, 15 May 2026 13:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNvxf-0007QJ-P3
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:04:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNvxd-0007UP-4D
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:04:31 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FGR2RL1831335
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JzPzKh7Pvjqi8CKz1Dmi99nqloKUl3igNNl0TR/AYOM=; b=lvE+zR/dkz0cX3/J
 kNpjucsGPK8PmhF8n/dKIRsXM//JbmFLD/Zum7SBuv6yyg9VJDwpKYRCjgFrw69m
 TMo9E6EEXZgQbP/FeT5MmLKuUZ2r28VpXgvKxJbm1Y5IFSWVj25ajrfxD/M0efGh
 UDx4zumYZKHPKtETNjjc51DrcTaoshdBVmRxZcMCro0qYxGnxis96Vw2jGlsb7K3
 i7bgoFYiZh5XUjrKcP8ogPtzejiOnmaZpWzjGHEY/lVI1HZ7/6Ej1DL4DjByz419
 dqHqHK7sKBKe8PDv9PCCvEDNsygvAZFSed+0kxnJimCmFCz1/l7os7agPfjFFFZR
 PiQ0Fg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6715046y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:04:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2c16233ee11so48873eec.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 10:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778864666; x=1779469466; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JzPzKh7Pvjqi8CKz1Dmi99nqloKUl3igNNl0TR/AYOM=;
 b=YS3YqwqHGKOYcJMEI7vs+fZzXsrGFzCjVONc73Axho0DvhTZWqmaBM9xeX/ARTUeNf
 j69Ns/6qJapuBcPH1k25vTiueSyNnxDJScEP+QzH8fKr+RpNPYsHNrCBm8znhJ98JWdC
 7zgN0akzcfM4JWIMUMh8jeY0/g/7lViZTSnd6KktJBH6hShJnkDMkawtiexcHU/M45bL
 za1cBtIVcvUfSw3FRDYaLppcNhEh9pyg1lD0FqQdmn92kVoI4CZWBYkQP5tfMgL6LxwH
 0OFN79aIaIQYB7SGvdcj9EiOfJTqvZvkSDUs4/b4Xu4dCoT6y7ZVsyM0lws7xWRP8QZk
 90HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778864666; x=1779469466;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JzPzKh7Pvjqi8CKz1Dmi99nqloKUl3igNNl0TR/AYOM=;
 b=Fza4ytg6TxB6Iyh2wZFtyEB4SKtZJVULacBE7WEggWBXVnmHCQDUgx6uuYXfR2lm7X
 GIGmId1xGfyj9mGv1UPKujbfTjsD1Q7dL4bddlBZpSB5t6AcOBjr03ek7h7SPAG8UboS
 ZemUehzNe8dC7RPs8ai0f9AcskB0lycNcP7rR/SJq2n4O3rZSnjpr7NRdRyaOLYZsek0
 ApE+p22IcadAVTLSjsTUxDrQy03zdVTQTORSC+XPthbPYJTgGGsHukjWYOJyDTOaV2HA
 gg0yyWYT+zduZlyz53Wu8+xeK1/UD7MGUZU13fl8SVAeqwq+98AZxkmZNJfy5SjiYbTw
 kUFg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+j7MpS4U7QKSSCDq+04yfmaYz+29uaT/5xBSVA4sPZ+xKatOahprbi3+QTjuBjk4fvTwVSTcmMjQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzf37D7Bwgi9FTsxTVPdjFwnGukv42qOUrbgqqzyFTsBGbEPh5+
 rG1ckq4+Gn50lzA6afbj8Rbg2WkAVxsd2gg+LeGIhroU0b8KnBIawrLOyRZ07vzPlBCaHfYBo2d
 Ea/DJ5yfvm01CtTKxw0R+DvFp9LtTHN6Hc8j6Du9uLdUEQbVmxkrGV6k=
X-Gm-Gg: Acq92OF2U4rWsOOnkxOqGkay6ZBPvmK/FwX2xb5WtHCiNwkHkRr9jnbH07/2HR/CWk3
 uBHE73VPul3QvZCBHTry8O0X5RNtXZIvnjP86Ex/1Stop/ziQztTHASaS21MZYT1hTMEhzxHNt1
 1oUVy0K7vvReAZkb2KuKlcUFxmGFr0II9bKrcswsw37Yot0vWkAkgwNiiPSJrZqryRmPFYOyyCs
 CV6y0sF/W4wbDi7OPYkE1uVdtxUmUIlfHTvMxsoiD8e3ncUMixCNPQUnCT3XloSdKn255pDSyzU
 LfCuU6mqx5I5S8XfRV+9mk4WWfE+foMl2j3AJZ3IQwf9nI5Hpy0NzPIl/AxUTvEes5C1QCFccCU
 sWCePwHUIZXDF7M+7LSeEjbkhs2Q/E2vCHeVef8vldzca7SQB5gX630wj7bpCWkA/JLj/UpKvRE
 qYdMm4u8jnPHI2Zg==
X-Received: by 2002:a05:7022:68a5:b0:134:fc38:6bea with SMTP id
 a92af1059eb24-1350563cc92mr2324635c88.31.1778864666015; 
 Fri, 15 May 2026 10:04:26 -0700 (PDT)
X-Received: by 2002:a05:7022:68a5:b0:134:fc38:6bea with SMTP id
 a92af1059eb24-1350563cc92mr2324603c88.31.1778864665368; 
 Fri, 15 May 2026 10:04:25 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-134cbed2232sm11226486c88.7.2026.05.15.10.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:04:24 -0700 (PDT)
Message-ID: <2ee2bdc6-dd70-48f2-8409-2bbb2530c559@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:04:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/20] target/arm: Introduce common system/user meson
 source set
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-8-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515141032.3271-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3NCBTYWx0ZWRfX222FGSOa2B/j
 x8n+foxg5np5WuQSBpcJ4DfESKbXo1Q5MJoIJQtgWJocbZOivWOhPYSGtPwD9Q0cUluCu8CXzww
 Q19JnHHzEF7hi9VYKdnyecRQf+6p8fNsD2G62BJWOTNs6VJ6lr60hZQ2Y1k+0xH0ybvTu8Rx3n5
 OOHGqZpQGMfVlr6aL/C8xijKZZfXIE4a5edWnYxZGBzFlPKOcE/YapZjD+gFsqoKjKW9KCsTNnv
 LEI/Tm+DKLD27FPkepB/YyLH/ToKMGdbV/4J4odLtz3jFnmx/uZF2M2DQ+MRwDB+CbAkBFp9yWB
 ja3YwbI8XxNpB84QOtH7ahnYsqGTlhr0p8rtnbRR2OCcYqGswhoN5DRzPFLeHfqlmstOKzEic2t
 sja7gW0Lhx3WSUSIZDZ4gpji/VuoA1ehnyjxdbUWT4iN5dAss/z1RYtXQKGcD4egXy7Jt73guTf
 bXoAqQQmuiifHq70z9A==
X-Proofpoint-GUID: IP_D7UovfpdDtrZC4TM3TERQDL-AyeOA
X-Authority-Analysis: v=2.4 cv=I+ZVgtgg c=1 sm=1 tr=0 ts=6a07521a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EA1ayohM-yA4xSnK4CEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: IP_D7UovfpdDtrZC4TM3TERQDL-AyeOA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150174
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/15/2026 7:10 AM, Philippe Mathieu-Daudé wrote:
> Introduce a source set common to system / user.
> No logical change intended.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/arm/meson.build     | 21 +++++++++--------
>  target/arm/tcg/meson.build | 48 ++++++++++++--------------------------
>  2 files changed, 26 insertions(+), 43 deletions(-)
> 

It crossed my mind, and finally I kept duplication, without any real reason.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Regards,
Pierrick

