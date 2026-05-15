Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAB4CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 17:01:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNvuE-0005Nv-VW; Fri, 15 May 2026 13:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNvtW-000572-9E
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:00:14 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNvtU-00064D-DU
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:00:13 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FGkqCL1353908
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:00:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CUTPbQnnYo0SwhRY0iu+P6lu/Ytp9IhS6qAd3elCJVw=; b=l3UxPQhzstYN0nvG
 xYZJRnFX5hQHpl+AdrT6HM7KqoNPNR1rviVQAsqdAxJVYZhv5Uv7O3Fgh/5bJbrE
 qLS5AtPWXUDN/7xUU920VLxRej9u9Cj+t1VnEIL4u2F50hlneTiASwhBJm6hhJNm
 LrCbJLrQ3BGdjJpBaIwlyfP+xxksLnUfAZ57K1FaumjXWKoMgq2SZZxoM9mkLE9p
 5uh2EAi1TwfvH6mztBobp/bk+/c8vi+yLFZApl0ncmKarR2+3xk7Va75uNlXxVOV
 PYCnBRwG62QnYGYlbe0Ao00HlmjZH3sLPJnspGGqu4n9kjZVQBcATJg8+FmXvKGC
 3QJAFQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e67ac8174-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:00:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2ef62078ee7so55183eec.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 10:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778864408; x=1779469208; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CUTPbQnnYo0SwhRY0iu+P6lu/Ytp9IhS6qAd3elCJVw=;
 b=cz1xLxQ3V5S+EJ4wRnn4p99XdyMicnPfkM/s66+2ylcch//OYKMUOnh1FpJSwAihFa
 5gPUnooArEaM3VTwtXC8Z1gRHB+oLzhgXeRGpR6WOiEAg012garTFSQh+tXzRx5qqgRp
 HqLuw84K77DTUPPWiY22ZKqnjeHIVzrtXeF9xB7tOc8Ft+dSC3julukwTcdxxut2g3P4
 YfmRsDBbsKZl07nF1a/QrcrkTqpVOOtS9F+5Veqd8MTn4Yo7oZWQ/R8Nh7JOjBQST7cC
 I4vEGbmYlD5/Yhyj4cwedsS/EBruW6IVV98zwuundhJfeYpKRTOmxR+bA6hhgGyXMBbo
 3bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778864408; x=1779469208;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CUTPbQnnYo0SwhRY0iu+P6lu/Ytp9IhS6qAd3elCJVw=;
 b=nidDb8IQ3yXQBlMqhK8aZT6FmAHh0mfQ0SrwfvD2U/pjDh9kdh1SZ5g1PF09M9rH7G
 KPUsUrtUOP3WGVCEP8zlcwCL3GVGRvTRbDLlNEJX033eWoNqLCM54XO8gKe9aEXGekzr
 jIQi9IDM7FpCTgy8R/or2RHdbulJBgBYQoWkL9IttidhEwjZ8/9ZGLaRVEQBPPzxkr7a
 fmYHAb5DLHb0ApmB+x0qy1sAemDp7s38mZUJuzcyBCqNV1k7Ql/+VNPnvZ6CkqchxyxX
 D5IWZni01yJQ9hLKMox4/Z+cul76uLnzX4Bh1kkZD8VJtKxj5PkjuvCItmlyliETDdVx
 qzfA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9smksUvHj4N1ftTAuWIP+mWqQ1q0/qCN9VK6PvdGm2QxQB4uxC+FE4e9xCQn3fijZUjrlNI9h9/Q==@nongnu.org
X-Gm-Message-State: AOJu0YxVbD4G5gUFKNgcZKXUsGk58Zs8+KabnuouMOhdz5FEyybiPzs7
 fAoKwhZjQRHv3TfiOQ6bTd5o46NIvK3s5DVYcHWWMtF9p6/GlT9BB/U+dhSmQqp9nLzzpgh/Tb7
 OP+WKDINAQTS+1QSWJPLqv0YMvu09hihfm75ovY31BwD/JCGiaW8Rb6E=
X-Gm-Gg: Acq92OEmwaZS3dZ3Pa9WHpTpGo2y24fCHdp8AdFftnZIozpeA7kuTEZZzZ2Q0eV8cYb
 hHm9CG0F6SrKr4HmbflLx8UbhJMm8iIBViYuHm69pOjvI/35PCPe+F3dVV0qeohhkADctmpXIt0
 +4snvFVuZkZXAyIZrqCWfc8cuzoGhatsmPgtYf+R6R/A7xJcmSBPZ7z6KaHIUtYWR5ApEs62qtM
 GxWb0EXwZwEzrNc3C9drLNyicS7REy45dxS7u0SCZDbp5Hf4CIk0PbefcjhEhPHE3hN42kBRUW1
 ilbTSTZRQxC6VsMjyDRXsEUO4jdF/zgJVtBh22TCl3fJxWGCeWsq+GO+Vq2LcCmPz+lh1OvpFtO
 WGmPxWBQD1bVh7fGw/nKWX6jKG62ZmQa/TVXK32O45e+Ds7mDhWpeI2O7uKcDahrqenLmSnYpvP
 KEOvw2sKqZOyAiTTTOk7s4GHoG
X-Received: by 2002:a05:7301:3d1a:b0:2da:1a81:588 with SMTP id
 5a478bee46e88-303983c6515mr2218432eec.14.1778864407951; 
 Fri, 15 May 2026 10:00:07 -0700 (PDT)
X-Received: by 2002:a05:7301:3d1a:b0:2da:1a81:588 with SMTP id
 5a478bee46e88-303983c6515mr2218418eec.14.1778864407290; 
 Fri, 15 May 2026 10:00:07 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30296dcb6e9sm8860161eec.16.2026.05.15.10.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:00:06 -0700 (PDT)
Message-ID: <99983366-9174-40cf-a158-a663daa7965f@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:00:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/20] hw/arm/aspeed: Initialize 64-bit CPU types
 during DeviceRealize()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-5-philmd@linaro.org>
 <e8e1d0f8-b5b9-49a3-9478-f58f72e962e7@kaod.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e8e1d0f8-b5b9-49a3-9478-f58f72e962e7@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JzTrZgVITAofSNxHvbPG_REFSNx58Saa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3MyBTYWx0ZWRfX1EVGyuisBlrK
 /ljX3PPbW+9gEKOynPFxhSiGdZxC4srB9QL1DK8m5FoWUoEgAZfVlWt/0BRryUdpsAbfU6GIv9H
 DxBmH5dCjFP/ZrHQXtR1Qx9eB/hO5QbB9ZPAVCxZiCKydC6XY6yYDsrbueb2LcJJVaROSTGXC9x
 AfwnOCyF/d7U9bxtXDY4rYolbzpFrUS2+bYSN5b2DcROoEs8HV6Td/TV2ImZIETlUd9D2J7w2WB
 3IMGtA/A0alY/ZfQC4AyOOYhy1FlVt8q9nzHi1NgOwVvX4CD6YnZADF7RE+iEOh2f0n1nG36lH8
 DQsKI5aoEjWtNzZgfuMTPT0mc+K04MNuAlb5mqRbnuJewgZF8SdD28wh0P3mCtwKAY67nWKL/vu
 iEaXCiLSw/Fu2xTuIi/GVaeL6yzTPu+a4CLUslK9Y8q5Vr9gdifwjIPNYu4UlFoaD7idKQBckSz
 y7Bpvr3EkDKof1xQlNw==
X-Authority-Analysis: v=2.4 cv=SuWgLvO0 c=1 sm=1 tr=0 ts=6a075118 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=u3Zk6hkPrBBZEYuwQVgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JzTrZgVITAofSNxHvbPG_REFSNx58Saa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150173
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

On 5/15/2026 9:29 AM, Cédric Le Goater wrote:
> On 5/15/26 16:10, Philippe Mathieu-Daudé wrote:
>> aspeed_ast27x0.c models 2 similar SoC based on a 64-bit only
>> CPU (Cortex-A35), only available in the 64-bit binary.
>>
>> If we build this file as common object, these SoCs become
>> available in both 32 and 64-bit binaries; however when running
>> the introspection test on the 32-bit binary, the init() method
>> tries to init the Cortex-A35 type -- although not realizing it
>> -- which is not available. This can be avoided by deferring the
>> CPU type initialization to the SoC DeviceRealize step (this is
>> safe because nothing uses the CPU type before, only the GIC
>> access them, just after their realization).
> 
> I understand this is a qtest workaround. Could we introduce
> instead a (qtest_enabled() && 32-bit binary) helper ?
>

In general, it exposes a dependency issue in QOM type system.
In this case, we get a class depending on another one through
class_init. Moving this to realize seems like the best fix.

> C.
> 
> 
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/aspeed_ast27x0.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
>> index 87dcb82e1b0..e50125bfeec 100644
>> --- a/hw/arm/aspeed_ast27x0.c
>> +++ b/hw/arm/aspeed_ast27x0.c
>> @@ -418,11 +418,6 @@ static void aspeed_soc_ast2700_init(Object *obj)
>>           g_assert_not_reached();
>>       }
>>   -    for (i = 0; i < sc->num_cpus; i++) {
>> -        object_initialize_child(obj, "cpu[*]", &a->cpu[i],
>> -                                aspeed_soc_cpu_type(sc-
>> >valid_cpu_types));
>> -    }
>> -
>>       object_initialize_child(obj, "gic", &a->gic, gicv3_class_name());
>>         object_initialize_child(obj, "scu", &s->scu,
>> TYPE_ASPEED_2700_SCU);
>> @@ -701,6 +696,8 @@ static void aspeed_soc_ast2700_realize(DeviceState
>> *dev, Error **errp)
>>         /* CPU */
>>       for (i = 0; i < sc->num_cpus; i++) {
>> +        object_initialize_child(OBJECT(dev), "cpu[*]", &a->cpu[i],
>> +                                aspeed_soc_cpu_type(sc-
>> >valid_cpu_types));
>>           object_property_set_int(OBJECT(&a->cpu[i]), "mp-affinity",
>>                                   aspeed_calc_affinity(i), &error_abort);
>>   
> 


