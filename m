Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12768C61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 09:02:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzVze-0003UC-P8; Thu, 27 Aug 2026 05:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVzd-0003Ti-Fg
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:01:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVzb-00039v-S1
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 05:01:53 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R6QuZo3834518
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 09:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pSuki79WLItnMqjtwAVVl4J/Fjo8jJF9pvoQZKKkHog=; b=BRhKYcOLjcXb+xBJ
 lEdgOVn9O5x8JEL2wC2J8XF81qyodEtYcxtpAeMfjw5ICtWlz/pNikinuzhCuoMU
 jR8/cp+rcu5R0T9zP7mM351l5xSsDSvrlO+18SN3v/TmiN0LSl8zMX7pfycLbAgx
 R/bYonSTrmJzFa830L2fqqy2ew/GBTJCjG8EDtJxWxMujrT6yMtRWEB5SIlDGLfi
 Prcz7bBIZVnnwYP9VxX1OYRC3lwX770SSSgLpYK0D+Goe/aHBJHBfZdtJUCsCqdK
 Oz6nANqLJaSnZ+otXkgf1dyQubG0WpLJFMcAZq0wZ6+5IJiay574bfktAOLuERca
 c07a9w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbuwcp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 09:01:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52d33c89a29so5767251cf.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 02:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787821309; x=1788426109; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=pSuki79WLItnMqjtwAVVl4J/Fjo8jJF9pvoQZKKkHog=;
 b=QLNy/IG2fhCcnvp169wwG7TgE17PB35M+382AjMtNIi9D/p8bwXT1OhLB+swbx/6ad
 8eING1J2N9h4B8EvZG+LOGldBEyYzmVUSTobUmgI2lh0Of7e6RmSguX4MHgT7jWZAT5m
 nMlwnkKnIFnzhLAutSOpSMIyznNouCeCLAAvDUv+ZuHCZJM26CIaiRZN5hZiwkjJD0mi
 E0a6Q4AnE1S6K5pthqbk9qWYQmVJH/PMvJjTiWFp+db8n+3hahp95DElFej84ctPCJv+
 j6RTs+oUOOumZ6hBrtbs3eIy/35W3IdCAxui+EoId1bHmI8Un8AUGKRIIeGGLFMOPA6I
 UAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787821309; x=1788426109;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pSuki79WLItnMqjtwAVVl4J/Fjo8jJF9pvoQZKKkHog=;
 b=X7q43LJ3pATZ2/3X/1RvYObF9moVobH6AlzpP1Gy8k7p1giqMDYvsJMN8kEKBZkhZ3
 6D/Ykn/hzzp6uwS9vWvGkPYUyCH3lU615cb3BfvhiFpoParfCv4RFpvDct2OSShmMWJt
 WzvfD8IbSH5BQfIM2+9WyWbR2EOptS8m0fQDVO/xKNi/pnN2zDGHE1OS6dHKNrZNAUO0
 472123Lo0MqOFBH4gSj0FMlltdNnOCCtHDjh8SdpheVgWOUZg2vDGcTv3z8n0oWoP01Q
 6HkabMQah0u5pupkDnVg7bKLy9R/3YOR86wOdnagZ9e2KDtiqaBX7/m9Ye6meXu1Ldpn
 LRQQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoT/74tW1x3vhaJrWycF2LnBqgwy+LuVTxX4gxJKOT4qA7rER3AUsf5ylRuqhAMlxsBUEJMsP8oFQ==@nongnu.org
X-Gm-Message-State: AFuF++na6YCdNPJUm5Q8GkQOotjLDoDXbNpVssWg89b4pWk/truSDRx1
 lKp3y50E+5AZqCOBWheSqHhgJvWOPwliKtWy7B2GxQ0xL1yPfWvROlkV3m9OB7/kanCmSRFbIQS
 GI2cztkYFXxMhmK1kiqxP0ZmfM9I23+1GdhwToa44a1kN93Du5c4wb+k=
X-Gm-Gg: AR+sD129oyUe82/wJQG+8VQd1gnASuPZONmVBaSkmYdGH+3bHOQRV7rwVCYO7ZzM6tL
 XSbQco3cmKYma3uLVLHCaavxP5Cex64eYzkr9t1R+kvExkU9zbCsPRqR4Y99yaLzmKxd2OrnKkn
 ueCsjkRpB8o4ycF/T6xAMPx2vBNu10xMLfcosoIoIfxHjnSDZJq4Sj69Qcew7wrls15jI11ruio
 9Cy285i7LS2B69D0/N9o4plIceYKyubD65wmOlylRO9gzVyGOBGWEMfL8E27xDYoLMCA8mqaH28
 W87fY9AYxwNBhcsx5Ar5X4wkA9/1weeBz/pEiiYg2r2vgqBitnz/dSTjEn83JEpZrTg4HRNLvF/
 Y/2/TEB538Y0DFrLHwyp1pAOy14JXw1nEFpxgC0BLzMVIvOH9
X-Received: by 2002:a05:622a:5591:b0:52d:fdf9:aecd with SMTP id
 d75a77b69052e-52e42234b75mr155027571cf.3.1787821308819; 
 Thu, 27 Aug 2026 02:01:48 -0700 (PDT)
X-Received: by 2002:a05:622a:5591:b0:52d:fdf9:aecd with SMTP id
 d75a77b69052e-52e42234b75mr155026461cf.3.1787821308208; 
 Thu, 27 Aug 2026 02:01:48 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28dc3f5sm7679285f8f.21.2026.08.27.02.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 02:01:47 -0700 (PDT)
Message-ID: <9cead44f-c71b-4865-a1dd-c1343a39ed2f@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 11:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] edk2: update build script
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20260824164751.1700783-1-kraxel@redhat.com>
 <20260824164751.1700783-3-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260824164751.1700783-3-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mCcq9LHtSH_41YMHzyhoq2CQHYkSJOZg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3NCBTYWx0ZWRfX6AasAPSdt7L4
 MUj2zmSfJ+kPvmIUy0pWN51Oqca8VBpebqaPw+NZsxUSeakg4rXXhk7RnzWqMvJV8hyBco7grk3
 MOuS0UEL/JMlmC/aro9SY2ZMlmKLi3c=
X-Proofpoint-GUID: mCcq9LHtSH_41YMHzyhoq2CQHYkSJOZg
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8ffcfd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=p0WdMEafAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3NCBTYWx0ZWRfX7ehQJ2NTFvkD
 4U9pbraK+aEMytxopWQh4EFpF9XEAOxCAldNUy0KVi05O//GBHFIOiL/N/El5oEndbDXLMmeNrz
 2qg8kNRE05uwiQAMJTN2aXGbAo+fvTSWJYW97L37UiA1lkgcquSo0cFYyzIGhRvmnVA9LH2FUuF
 hMbbpzgSRC1A+n7BAd37xQf/gJGBrJEG7ekL0z9VcAQaEhDw0XQrwT7SqLtgLuzZuQgWzU1IEff
 P9eMsMoawltjSEAyh7DQmSCTXKzOiw04MXgNSf0rZs2OT4iu1sw+621u4mYP5u8LSNUm4Aqk5Yp
 bhAt/zD8eYpkUgpZE43raavLTrbY5s2ap1rSxhc+MneBlmXTJ9I4A6Fv9+tOmH6S3P0YhWlyHyC
 9j4klN/K1QVf4aK+2vVt4x5KlTddAEmCrieO6I8i+wW3gP/B2oF5MPDCKR9F1TxXf2EEF4hV2Ip
 n8cn+9BhQxhHfJDkyMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270074
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

On 24/8/26 18:47, Gerd Hoffmann wrote:
> sync with https://gitlab.com/kraxel/edk2-build-config/
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   roms/edk2-build.py | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

