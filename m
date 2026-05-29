Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD68CD6E49
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 18:39:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT26X-00088L-86; Fri, 29 May 2026 14:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT26K-0007z6-G9
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:38:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT26I-0001dk-8D
 for qemu-arm@nongnu.org; Fri, 29 May 2026 14:38:31 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2KYG518439
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3zZ7sVCQ0xTCWhIQM453AbNsQTss553nVYj4rAnmItA=; b=GW/xRJlM9ZRr/mju
 lIrg/Dv7QgHIWZRVIGCDNsKz7wIG3uAWMkTmjwuesRxWc2K9EvLJEBQ2ICvZlASR
 mTjkRJ5GqDrXLCl4ot+nckUQkLl2s2cH08e18id3kJ2D351iErlfkj16/P8oFXSQ
 U5CUqzAsMJ4OYQppgrygbjny33clo01K/JzsdDEAtvCNTRmZAiQxpS/ZrwQMTypM
 qyrZg19uiwhPt1EAUlAggmZQ1Z4QVgBQbwSkP0kT9MQx10pW+XGaII+4bAjdf7Lg
 kwZ/6mnT1ZejOpRmGhufS4FPspd4OWkrG2yVfGrdbJDwLViM5DKKyBhU+JX76ypK
 xvkl8Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efechgv2a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 18:38:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-304ea1eea05so2865731eec.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 11:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079898; x=1780684698; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3zZ7sVCQ0xTCWhIQM453AbNsQTss553nVYj4rAnmItA=;
 b=CXx3okaO67QeNqmUuLS/GJwVmDJw2F7D2I19P982wYf9KJGWx3J8CkefEbOQRTJz1V
 wolCXGUM4SjeEXbOnOa6613UN0/jPvIQWW3Z4C5jwv6hvmaWrVlJtfMbpJHOQ3fbwYEQ
 IGDpK6v05bEUYNiUHCFTKN//NZuuAE6g7wQFFxE39Vpwr37GZhCXFj1PJ+Sl0dCZoro0
 p7eykv0Xl6HXfbMmmqH7duUl5aarE0s0uYY+zBxe5W9QLbmrmiRhHb17rvMGis/WXXN9
 nfOHBSKjFtkepVHsVqUO1devwZzWUmc1Unjj52BCpPlWqvUpwkrYx7wYTnaZtx4jZ/J3
 JpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079898; x=1780684698;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3zZ7sVCQ0xTCWhIQM453AbNsQTss553nVYj4rAnmItA=;
 b=aSzp9bE7ObGTCplgoznJ+T0ZFJhdIQ7JThH2WOeERe90nMgiOhJNqXvN5sTeGd+oAf
 vxitxl0Ccuzjf4Tog8ntuL8hNc84i8jNmxq1gY/IUa8UG17Vk2PCahXRU0Zuejrs9Nu4
 m8mKhR1tlrmAkNIrxIvXDfNj7zr5zQ+2wiwq8FPoPFMMiYyYqQjYV8/Egml6k8ey9ect
 5pTVKIT3raqs2z/qfGLs9m2+g1+e6PJdQzZkXBapCfoHvUmjOlXtOKVFPwVDUxaKTFuS
 h3ux6HPnE2WB2XpVEcJR/0IvxiKWEP/MmZd1GthX5rSiNAuzhD64/bC55Me75OnyHDdn
 wVyQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/mjn5MfmnTyP7/U+aUjZzXqE04OCgZTJEdCXvLjSlx+kdIu22ibgWCAXvktTm449SAYKFsoyaMLw==@nongnu.org
X-Gm-Message-State: AOJu0YyXcViVoO1LjF8o1J6RMcBvvXYR8CqymSo2OrENODPcOI8He4qG
 SPWa07C1m/HN4Mim1GtK/Bx75mqPn+5gURLK5+Zlu71HcKmRVxRaVeurtLf2BRk9AMswnb+UyfJ
 j3txCgs7/oeqsa1cq7KciZ6P/bdm+09CvJUOzBKJryx1B7Rgz0lCUFg8=
X-Gm-Gg: Acq92OEf6wejwkIDzFpVME4lfKYpclmyyL2BK0pXbvvPtMT6GL8tYNpYLheh3bkc1uz
 YIPmEJDeEFF6XCkK1cVcJbhJuggo5JZpvilh3wYJ25jiyY3wpE5tAv0n2SlBSICIX0aGt/kIAiz
 oWO4JGZih29UCbaejbbXq3yQrSy5RwFtwaDRo3oo9RWZBQFDptDiXxEXWLkUFJjs1B9uVd/FXqB
 5vdCM8+OVnQNYXGKT3zD/4WcHhSh7rh40ox9BucVn8Qe/cUwwAMcFSuwdy5ix6bREcpEWrdsY0c
 TKB9bD3xiCSWQQzcBt2L0mhAWEbWcHNE9WFrln5CpJybH+7zq6HXjvfuOabdY/C3wAIVhmAoelo
 3Vcvnvp03WkYAL6M9NuhOno/wbt6Q3+B33UUjv2oB/hyViKku30Nh3w9ObuRF7xs48scZazugby
 4bW8VVvlsouyq/C6ss+RS4JV7H
X-Received: by 2002:a05:7300:e58b:b0:304:d32e:65f9 with SMTP id
 5a478bee46e88-304fa5295f3mr502796eec.6.1780079898267; 
 Fri, 29 May 2026 11:38:18 -0700 (PDT)
X-Received: by 2002:a05:7300:e58b:b0:304:d32e:65f9 with SMTP id
 5a478bee46e88-304fa5295f3mr502763eec.6.1780079897797; 
 Fri, 29 May 2026 11:38:17 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304ed30a012sm2190193eec.10.2026.05.29.11.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:38:17 -0700 (PDT)
Message-ID: <80e2736d-f1cb-4249-b80a-89856ee17661@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:38:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/17] accel/tcg: Convert X86 AccelCPUClass ->
 TCGCPUOps::cpu_realize
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-15-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AcDR9zX4doivGy-u-pPEReqlsNPz15Hp
X-Proofpoint-GUID: AcDR9zX4doivGy-u-pPEReqlsNPz15Hp
X-Authority-Analysis: v=2.4 cv=U6Siy+ru c=1 sm=1 tr=0 ts=6a19dd1b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_zWEW-5a1clIKPNZquMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NiBTYWx0ZWRfXzGEi8yz9z1bh
 Sx8QozbhyHgvcG0SAvV6pVTVlfS63i8lT2lH78XFtT78UYJUVGEtzQ4g+dDrNnQKzeLFgmAXSM6
 c4B0D/T7I2VKPBDTO+R8ueXDCo4/Cn7t7QODLLpx/+UuPb/juOJ6gL8/S7c7HOr6qb2lorauWyb
 dpVRdlJaI2J+RrkNRA7ZdLHvebTv1MWtADrTqQQk79YhI8j9CqZSkw1/KyV2118xq5ELA1QeH/H
 Zb0ucrijdbj5viOT+duYOCP0tabMtPvkSrGJAQwgCL8asqcpZED56Gr7xn1GUxiRMOhVHaDVIra
 hFnxK3pf9VksQsPCWT/XEvmRa+EpZ+jU4Jojv9yMJinRXyagVtFDWUkugvzlIcsrqRMkVC/Yxan
 QPWjo0vqykFv6CRQcp654+QPi4dcYcnqqg3BI93oFvHd7dnXc5axDBOeFvq9wTAS40quEO2TidQ
 aO/nnaUANWeXq3JYdeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290186
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> Register AccelCPUClass::cpu_target_realize as x86_tcg_ops::cpu_realize.
> X86's ACCEL_CPU_NAME("tcg") TypeInfo is now empty, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/i386/tcg/tcg-cpu.c | 23 +----------------------
>  1 file changed, 1 insertion(+), 22 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

