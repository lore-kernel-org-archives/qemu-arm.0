Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988DAC43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 09:20:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh1yo-0001Yr-Kw; Tue, 07 Jul 2026 05:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh1yl-0001Y6-TH
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:20:35 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh1yk-0004hs-Cb
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:20:35 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6678Dw933070346
 for <qemu-arm@nongnu.org>; Tue, 7 Jul 2026 09:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GUuEiYPwUs/DY0VrUFfJTUEPO0NFv1ddFZW4MmxOaIs=; b=cbkf74sZqOVsyEL2
 WLRpTk1CIbW6llkksQDAq/ps+L1Nau5uTqWuLmF2RIsEswdAUopNc89KruMv7w64
 V2lcpvwv6GL2B+NzIvH78nXPYhepOZ0iefbBDPHCpPVmaKP+73ngulBWTnR4gkmJ
 3mRA2p2SVVGtF42rrsg/1VyMmftlEsRUm6XXGZL7r6Oh8ToFa/tGPXZdTPHbKXuv
 qVf/k6ZS/HF+8VF4cl07lRNTiC395IhDVbnOgAJOAnSshKKMqiXrFCFOXtoXbaov
 anXqVUYEgrrGmhoouu9lYqF5AnaNCS3x30dtUCnxQYDm0ZxGIWIUkmHpDNimnkEe
 hioUBw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8sm8h8gn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 09:20:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8f0867a75ecso78908946d6.3
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783416031; x=1784020831; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GUuEiYPwUs/DY0VrUFfJTUEPO0NFv1ddFZW4MmxOaIs=;
 b=F6Q7r0n+F0V5W/ymOVDXOC7N7imcZOMukbxDHY/FRdNTz7Jyh2xjqRfgMiQPM1SPIz
 JgPqd0dXGKSRKJAuwgyi8x2H8Ott3xfHEGYfFzYcg4Wql374FvXl7YEX3WpTNiB8+31/
 iJ9gJGVREzWumz2OVvEFIjI0/O9ULrI28TFEjaFXpe/SZT4maS+jNLjqpyX/gFNtmtOU
 d1Iw7WmcN1hpphlQlB2YXBfkZOnt+bsw46okoPS79UjmiBvjjOUzCgROxT2FqrPypmHn
 wUaJMIIf6MRbWvo/G+nQskloThdIpsz5jB0t6un9eBvNYHtUcrcqb70SzgGzqtPlfKQg
 4+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783416031; x=1784020831;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GUuEiYPwUs/DY0VrUFfJTUEPO0NFv1ddFZW4MmxOaIs=;
 b=H27GLCgqf3CAUp3c94GUGAaJDhwLpqvfMrQ6WLhoKHpfPcA/o17CBCIPhckuywkhB/
 Nik810Fs7hpUivu+H3Oqlk1SRc/nIb5pq0YZSOTSQMAmtk0g0gyiMRkU2939VMQq+4aA
 n0SEBTIb9tRORnRFpEO1M1WiqhZuMaOAuvg3mkfyJpRNUSw3qT6WjsZ8VXQQ/v97Dgn8
 YcmL72x59LNs3SYaJ9c5IS31o/UUYGy/uRClHZawaqbAmQ7VXjlNJVcEqSkdG7acHLOP
 G3KAcIoBe4dM/fyPAVE0+xAkqPCKLip7t7GQlD0g+CW8W3GlnAWLm9ooq+XnHSPk7AvS
 OpKw==
X-Gm-Message-State: AOJu0YzcffPGnA3tOITtm/vUELvpV8isucRKluAS+pEPCv0XVR+6F/Ln
 XDH3uXneNVrHHCNbjTS87+b+Lv+7xczUjtWEnXk+uzRQyzjBniPJM5n2tPZbYb8zUCo/31QlYtj
 8ie5qQ7mgeacROsOadFge1f3noWUs3XvUZPNPqYgLrsA4wPXsCU5cUpw=
X-Gm-Gg: AfdE7cmA6aE0aqhAcR/odXyJJsVEisYn8bvFtg5aQAAj4c5r5XG8gK1qWl9RYpgvkDS
 3PX73XxAIkHSC6M2A8Pw0qiZVTtvfkOK8Ndl1xn1pCeCPAl042Q6BScfBfmO7tcvkWaFLsLYwC4
 ryaifUGJofbp7rMaRKBJl/pJkBM+7j/Im8q7ru2eyuxHKjcH7WmHADaNcp55SDMNxzbw2FhqzrF
 1D1s+hN/X5m73mnwtcT8bXG+F+dK6htjZnx8UrvGkFx/HZGHn10XFB00QaXJ5RN4wOSj/PMuDkK
 8c5WWpjQhnn5XJMd/5+9idkaViSWbTR0rV5r1qgaRHicT9xDj0Q34hONd1axjhmCnIVKK+OdHdI
 W3P1KYk9/ykuYOMg7y8xa+5UD0g1PBbMgxYV9/OYmp+bRsBf3RpEMv3EIcVzGXQ==
X-Received: by 2002:a05:622a:c03:b0:516:d612:d1c4 with SMTP id
 d75a77b69052e-51c748a0c68mr49237791cf.52.1783416031422; 
 Tue, 07 Jul 2026 02:20:31 -0700 (PDT)
X-Received: by 2002:a05:622a:c03:b0:516:d612:d1c4 with SMTP id
 d75a77b69052e-51c748a0c68mr49237471cf.52.1783416030890; 
 Tue, 07 Jul 2026 02:20:30 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15ad8563desm90872466b.24.2026.07.07.02.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 02:20:30 -0700 (PDT)
Message-ID: <95030cdb-5a1c-4dd7-88ec-b989dec18f92@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hw/i2c: pmbus: clear output buffer on write
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com,
 imaginos32@gmail.com, wuhaotsh@google.com, philmd@mailo.com
References: <20260706230056.1888992-1-titusr@google.com>
 <20260706230056.1888992-4-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260706230056.1888992-4-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfXzIywqKuLwRws
 27KZlVx7aUW54Y05rpo3/iZSf4nVF2j2og63yOETGDj0zAil9jx/13LzK6z8KM0o1/Xu+wgaCsv
 Rvj0fI+5pAGmXoPGYyJV/mbym1XUJ535GCZca8JGmNMqcE09rMd8Yy+v4S/OGbtZgUimv5XlVN0
 bnOvwTS6Nm5FnBvJ01U0FZoVHm0AS9e7OkhkgwV62CBW2MeYPdlzY8Sx25Hz9BlmirKE5zbDvWr
 FspbHs6mVdDGsdCjyaIoNauD3VAMBd3GtD5Mt1po5EmQPObr/Aai1t9ACNmT9iz6ABwAYjXQoD0
 lVt32/35i1dFsiWrvGYHrv+sEE4Yk0R+G4PRaNbX3DHTmoOxFa3KAJouOsPrj3R+8kHkZcMARGj
 udfmYqKpp6Y6eA5rap6fOenO/UxwoIhY0N8nQk84cIhMQqSeJu111saKuAlmcaATrQeCHjLVS1D
 l75blZ7gKXKcqjQ5a2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX4yD0a3kCRy4Q
 vFtZXvqpsTPhclPMp2acs5NZOMg24zvt0zP7evTo0JLHyOioiCkXLeOqL9xaIMVTh0MXs6xogon
 CrUbPxLXohlPpR79OHHaF1GDsMpWA14=
X-Proofpoint-GUID: HTNHMZGxdlpcCPwzNwRafMwl_l11pjQj
X-Authority-Analysis: v=2.4 cv=UvdT8ewB c=1 sm=1 tr=0 ts=6a4cc4e0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: HTNHMZGxdlpcCPwzNwRafMwl_l11pjQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070090
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

On 7/7/26 01:00, Titus Rwantare wrote:
> From: titusr <titusr@google.com>
> 
> Generally we expect a PMBus sensor to issue writes after all pending
> reads have completed. If a data read needs to be resumed, this state can
> be tracked in the device model and the pending data placed in the output
> buffer.
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/pmbus_device.c      | 10 ++++++++++
>   tests/qtest/adm1266-test.c | 10 ++++++----
>   2 files changed, 16 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

