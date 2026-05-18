Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBE9CD4F3C
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 08:25:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOtHw-0004Fz-9n; Mon, 18 May 2026 04:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wOtHs-0004Eo-9j
 for qemu-arm@nongnu.org; Mon, 18 May 2026 04:25:20 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wOtHq-0005xU-AC
 for qemu-arm@nongnu.org; Mon, 18 May 2026 04:25:19 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64I2j2BZ3269301
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 08:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EELbi55Nh7IqAHJ4/zv6ZCSEqNDfGNYK20gLNOmqQ+s=; b=NHsP498dJrmP2ji5
 SRdeQtM2YCdc93F8zI7Ijofc2bMvb1ppxC5M5gbuPI1q1OQWtnDxcSQAleFhpsFl
 t9e21eLTjCJUJyG/X4CDcJbuJf6viHgXmaIBmbZnF87Jw1hQM+Sp4Q8iLXe/zRTg
 GgQABju35u0Aj+MjFCNPSDK+lrZFSjNCsBXDsbkNQXnDHSOsjPS3CIuGOkQnIq5J
 cY4IbZHJoezk2DSL1+8k+7vYjqz8q/r947bnZjPn+3ZyZqwdZ2pOsxUMAHahzQ0R
 AkUv1uSe0KY9iqh2ht5ITfLxW1Jq4pc1wwXvi5TzmCBfhIx/a4EQNrioC787FtD2
 0aMhmg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g5ema-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 08:25:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2f525565b33so2510003eec.0
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 01:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779092715; x=1779697515; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EELbi55Nh7IqAHJ4/zv6ZCSEqNDfGNYK20gLNOmqQ+s=;
 b=Dk4YSHL2yXp9LpLYkm14codW0mya2PmW9POigofU0WjpXpFt8nIXKNjE/v9MZvj8Rp
 HhlYjjiYwb8pgs4chHQgswvu0lm4yEvIMHck54p/qY5ZEaMoF/FB6UGnURoukgYM7SeG
 f2bdD0E74L2/lI++frK3DhqlxgrMOSRHnh2ySnR98hYWQgc/zkM9UX4Q3pjvbooxxhjJ
 Y+2YxCqI+5L/yfSJM0/Ylk4uTzGCuIK4Vz0L2iVx/FU7poxIKCEvGaEc/g1BM4hu0zSy
 5FYPsrgREAofMAyLP13XDr5wXhRWuWtrVZKs8BMSTloGfY802swGokBvCZzt1AKxRvfW
 F2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779092715; x=1779697515;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EELbi55Nh7IqAHJ4/zv6ZCSEqNDfGNYK20gLNOmqQ+s=;
 b=TMLhOyfMwzk7mpeHVvKu6Prutf8JfQQcrXtp6/cmWUTITn1E3LQYY7QdvZYKeI1Yun
 d2XAZkl2u5kyWRt0STyrjzzbC+eBC+qUSg9hsDu3wC0CJEs1ar8F4IW/7XlAT1H1bk4b
 kcoy4WpOvkVc5EQM4klWWg90FCZEgonJTsIPnyLkRLSiizhAu93wfSUiDTZx8d+Dkrra
 LrBfBdCkRWacqwsccEDYdQbwPs4Z38rcK8uUA7/zayAehwbMoT/JVFoUA5bHJO7emUwv
 Q5tNWJ5ygPgM9E1/8Tuyfhg9Hub0Uab9wtZHZ9AqC4j+nMGjROklnKY1z6t0RcS30Szl
 IAGQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+5zhW8aNV8nosG79gJqbvYJ1uoFzV2zMoX1mAGO39RwQUcibN3VlHSQ073ykT392ERbx/Kyl+VVg==@nongnu.org
X-Gm-Message-State: AOJu0Yw6C6ibrUk79wu5afRWEKffkkXmK9zZArkzzBTAzMD2xStPR2r9
 NIi5fxJKBrTOYo3OXtpAlUuvwBGIL4rIMpWi8joOpAXU4JDuu0VSdmLtBQxSTUGQ9Nhg8qFNPDm
 dA0V/K08tTXXO34lmO5fbRElvNJf26ZJ08ApB1fx7COwSXp1R8Cqi6ss=
X-Gm-Gg: Acq92OEW31r/CZxQqF2RpADQkMMxpLmX8W5nK5IXFu1LlTHG103oR68Km0NJKAHIK70
 zH8gnFWQuV9hwobdBM6aT54P8T6OLPV165y+8+ydGB6uZdu36i2j0SB4cORa2VmV05cZLUzV1Fu
 jxrJbZ4TsP3+Pp9B5KuHxDn2BQp4pvktVWqzjDUsM1KYEfF687Z/rXEhbl+3qeFbBTtynGi4gkJ
 mLUzTHRrbivMiED6gs8Rd1WPrt2s8AaiwTAJq7g/b84jbGWtsA+Scz5ur1eWPaEc/2wIily556U
 rEjVv8orkYdOxhDY3L8vEvy6BWEOdgo+M/P5c1UV6fAthCwxu2Qpbqqj3qlfV4FKc8UqGajZ38V
 JmEYF2s29G66Z35/ciaFPT7x/RmO0Df1rSKimtM1JRYaC215mxa5GlG0=
X-Received: by 2002:a05:7300:6c05:b0:2d8:df01:d9f6 with SMTP id
 5a478bee46e88-3039864d5c1mr5904429eec.23.1779092715490; 
 Mon, 18 May 2026 01:25:15 -0700 (PDT)
X-Received: by 2002:a05:7300:6c05:b0:2d8:df01:d9f6 with SMTP id
 5a478bee46e88-3039864d5c1mr5904406eec.23.1779092714881; 
 Mon, 18 May 2026 01:25:14 -0700 (PDT)
Received: from [10.11.7.97] ([50.238.185.218])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-302973bc9d4sm13024749eec.23.2026.05.18.01.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 01:25:14 -0700 (PDT)
Message-ID: <b718241c-12d4-4223-a2cf-a8086ed7f84b@oss.qualcomm.com>
Date: Mon, 18 May 2026 03:25:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/21] target/arm: Restrict IDAU interface to TCG
 namespace
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Laurent Vivier <lvivier@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20260516171524.19184-1-philmd@linaro.org>
 <20260516171524.19184-12-philmd@linaro.org>
 <5053ba4c-01eb-443d-b364-50a32be41e26@oss.qualcomm.com>
 <2a560940-d834-4184-9369-301ca9dfc5fd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2a560940-d834-4184-9369-301ca9dfc5fd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OSBTYWx0ZWRfX5aRIAw0yaZVH
 GfSnQdH1lxCHyKr/nT28KXSd/yWs8aUuqu0djDSusfBJlIEhW1I61ycsZ1U4C77it/6cd1WLA/q
 nnB6gUyTRiInCqpk9lTCznY7rXT1Dg+c3RmpJKsH6fqfDktLp7VCRcbJ3gchSz9GE9din+2oFve
 vhLquJ3yje1f7BH+68fnFQRbyfX8L3Zro56rdyk9m8uVDbDV3zlRZuxeVk482Pu98W2ocyWXdSi
 IC1vMs2imXgbOzlGxOWeUpHBvu/eDqFshjzAa9z0c0gIFx+o4DQPnbEDLAPzKFNeA85rfyEuseY
 tQFUL5EX8r+Uxm5kKskNSLiIxVrYFov2HMQi4sXvYFvXa+bDNcuOoBm4R3ti7WtwcTRTo8tce4F
 aybmxeFsqPDQwmAH/XKtjQobbD77DFozgLBOaTBuho35Vq0SLU4ZnyGjAaVkT/LTN6eaKDCUTEs
 2ZDEazlQjT5jxsCzFjg==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0accec cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=+WjNtiTvTqxFfZe9JAS8OQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=CVyTDA8UNC5bGtqKXk8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ngytuNBkpv1jhXSwXOgJ4DhsfkUALRYH
X-Proofpoint-ORIG-GUID: ngytuNBkpv1jhXSwXOgJ4DhsfkUALRYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180079
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

On 5/18/2026 2:59 AM, Philippe Mathieu-Daudé wrote:
> On 18/5/26 09:48, Pierrick Bouvier wrote:
>> On 5/16/2026 12:15 PM, Philippe Mathieu-Daudé wrote:
>>> Emphasize the IDAU interface is restricted to TCG by moving the
>>> header under target/arm/tcg/. Move the definition to cpu-v7m.c
>>> which also contains v7/v8 hardware (NVIC), keeping only CPU types
>>> in cpu32.c.
>>>
>>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>>> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   include/hw/arm/armv7m.h     |  2 +-
>>>   include/hw/misc/tz-msc.h    |  2 +-
>>>   target/arm/{ => tcg}/idau.h |  4 ++--
>>>   hw/arm/armv7m.c             |  2 +-
>>>   target/arm/cpu.c            |  2 +-
>>>   target/arm/ptw.c            |  2 +-
>>>   target/arm/tcg/cpu-v7m.c    | 11 +++++++++++
>>>   target/arm/tcg/cpu32.c      |  8 --------
>>>   8 files changed, 18 insertions(+), 15 deletions(-)
>>>   rename target/arm/{ => tcg}/idau.h (97%)
>>>
>>
>> This patch creates a problem with the (now merged) commit:
>> 8d3e31c0d575b3265ae5cacfba10680718ba5a22
>> "target/arm: Extract IDAU interface to its own unit"
>>
>> Indeed, it results with TYPE_IDAU_INTERFACE being register twice which
>> fails at startup.
>>
>> Maybe simply drop current commit?
> 
> Yes. I'll repost, but the series still won't apply cleanly when
> the "discarded const qualifier warning" fix gets merged (just
> letting know, I don't mind respinning).
>

No rush to respin, as I fixed it on my side for now :)

>>
>> Regards,
>> Pierrick
> 


