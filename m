Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4790C624D3
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 10:16:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2QxP-0002HJ-DP; Fri, 04 Sep 2026 06:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2QxN-0002GV-Tr
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 06:15:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x2QxM-0000Ty-BJ
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 06:15:37 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6847n1gd2839474
 for <qemu-arm@nongnu.org>; Fri, 4 Sep 2026 10:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kGfJoSjFnA7I1L3Ldrvc+4eJtw4Df+WczMBV7FXuiBQ=; b=oyhfahlHyU4zeBck
 jWOItpyjwZWTJuga+L/YR8gpPDbK339OyCNblCoN42XYEU6z/KNzLUKUP1HzMj1u
 dZkgt10JuyUr2SxmIYeU6aCnFmAQ22fs5HhhjdKuJadj1HztGziMFXfq+IGVHauw
 aPz7TFCLYO1GL3Zo2cMoie/M2B78jLfv5WwE1sFWGX2x4yP/pKgRkON92c36Rgak
 8W+4K0Q6L8KLXGBWgIrwTd/4YKDvmswMABmgS6eNxevcVxE2gQtGMirzrIo/v1rn
 i52x6EhelcpP6cULu5LqupBhSDiOb82SAM2eCT8C8MDu5bzXAWLiq6wJ5c1AfVqG
 S8QS5w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqtrx0x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 10:15:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-9104417215aso4030576d6.2
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 03:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788516934; x=1789121734; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=kGfJoSjFnA7I1L3Ldrvc+4eJtw4Df+WczMBV7FXuiBQ=;
 b=Fs9LfTveRIW+olV7xnxN80/ziQYGhHJjP/wrQIXni1u2O4Z6B1HpQu4M8oYSRscLtc
 0bF69h2jEWajmMkI4chP9Ny3zEtMcdjPl3lqwYwBizX5+TV8u+5DzkkrFPRRGEHRyIX5
 GSLBF4kOZmei4CLQU7XoA1MAQpoQlqn33NFfIZ8CmeQ4/WpIMbAj/Oqf/tNQ3erTkJRk
 79U7b8waH8Jc1sYeTiyL51W2EAdmyMDwWw75cYLI11D28OXUH42rh+WKZj56MF2LYA1w
 XXTPmzApVokmp6ngVcrTX+FnhQfGfsozHlMoXNd4mk6Wi/vVhmZzxjhW28wTh/A0E2L0
 bv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788516934; x=1789121734;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kGfJoSjFnA7I1L3Ldrvc+4eJtw4Df+WczMBV7FXuiBQ=;
 b=ZerBxCiB2WnP6qj4yyqLgEpFWzlmd7DzX575LUJTP3CnjIlRjCOE1/uDEaY5KtWCDL
 Feq1p27iyerCqJvXlnW0o6LmDjaxXWUEUfkOaHqAqZ1ggg4DU5cQBCGzn82SlJPau3wc
 8LARD3n4/UcQs87cLyoOpOu/zBnEd8HdgvRrNzQCKmd5O7kgpMpddjxw2VN310QVNMw5
 ibtHdU9uCoAlUYTZPJjOIfh9SMdW1DTFKLXRpBcil3xhavT3dlxyvoTrSfDw6aVg1bMt
 IpFTANcQMVSOFe3rTSZ3UYxXDag8xejEbs89hOUuHKMxSgwsaCA6X7NIdIAZ5gezxxfu
 wcPg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzveKViuBJCFKIvmMuqd9GeIpeD9Jg1WBpzKGQQ5KowJNSaRc2mpTqHMJ53Ei6tLEsBvLsIZhud4w==@nongnu.org
X-Gm-Message-State: AFuF++lQuiKnxhbjFoQFW7N9SirqAIew/BkbGujG5iVUwFpIjXkevDN8
 CGAws+xfdxprMTunbvKSRZWtoc1JutJYcTSKwaKIsW3EwoGbkG4Srzx6JYtoVfLyUyylPsy7kX6
 3+nH5pdg1Pgi5hBwl3FL6nvZ8wuDF+NE6C74d1KV+cELpJqBuVaZyuHw=
X-Gm-Gg: AYBFou3fMRUuV34oY35vlsdS/zwMyfajiDORTN4MR1kuXk0X2EybCHgqZS+6VAqMyJY
 Au3vzA9hFDIARPu97SsWhDmoELb5gEf3mr57VFMWe0DDxpHnLOlpd794z8BsmhCze7jBfjNk7yI
 S3LM79allOxI/Ip9xcMo3/y/dODqTprPya7jL1BRGImJKKu6wSoK+YuEnYSa6cPqpT1avD79yqa
 WO/Qz9NuT1/CJxFQ0MON445j/kQ4OctxdCr85PGRWz2Xmg3Opw0BOp4rzEwCUoH3YCK/hziw/20
 gshw7hOQFQXnuvbomeKpdthEEqGV8JHrF501ZJiDg3HDPbAyy1XaatHa5fU4p7Ra1zN/QonR731
 Sqe4Tjaf/gY490SR16lk8SluYcPqM46vNIA==
X-Received: by 2002:a05:620a:aa01:b0:939:35e5:94ba with SMTP id
 af79cd13be357-9398031e112mr444453585a.6.1788516933797; 
 Fri, 04 Sep 2026 03:15:33 -0700 (PDT)
X-Received: by 2002:a05:620a:aa01:b0:939:35e5:94ba with SMTP id
 af79cd13be357-9398031e112mr444412285a.6.1788516928686; 
 Fri, 04 Sep 2026 03:15:28 -0700 (PDT)
Received: from [192.168.69.202] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485881353e8sm5460366f8f.1.2026.09.04.03.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 03:15:27 -0700 (PDT)
Message-ID: <881be57e-5496-41f2-af0b-e21087fa5e54@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 12:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/33] hw/arm: Add basic Phytium Pi machine
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>, Anton Johansson <anjo@rev.ng>
References: <20260903112532.3276678-1-bin.meng@processmission.com>
 <20260903112532.3276678-3-bin.meng@processmission.com>
 <0795176d-4580-4acc-a3cf-c40f8d221661@oss.qualcomm.com>
 <CAEUhbmW4h_-az5iBsztzy8Yuu06+WMjOYcrL51sW8VEgyAaSMw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAEUhbmW4h_-az5iBsztzy8Yuu06+WMjOYcrL51sW8VEgyAaSMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YtA/gYYX c=1 sm=1 tr=0 ts=6a9a9a46 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FRSEYCzRAAAA:8 a=it7j-MvzHP9yZAzkGKMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-ORIG-GUID: tvYJksFViCD3GL7ZEUX2p-WK2__ojMco
X-Proofpoint-GUID: tvYJksFViCD3GL7ZEUX2p-WK2__ojMco
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA5MiBTYWx0ZWRfX332289h4Oq/J
 ooKLiDDSP3Oi6rYpwtW+GKwUGuuZItTdbEQ+jHhRAYKRn8LWDibvobcvQ1ySoAB0YBm8vZlQqwa
 W+TKzCkL6qOQNEPpnNYuf+Tv+WTZjSs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA5MiBTYWx0ZWRfX0evLFHPV+e+e
 ns426k6bXJwOrSziE4FEoLqzQkZTPX5L6IoK7jrfl+QyYZAErQ05q30x3fOwUsmsGSpjgQ3xStN
 PgUkrWB0jVNfeei2uNBQs80bg78J4cEAbUU8Dfxda6y5vkkifuhs4k9WbHj/yUVKOQQx9xsPhx5
 8PMXUQAscl/hI6cYs7x075PeVdXNPNRo8m2WmwPfzXOOFOS5gEUOGcNuaOUlok/kft0HGeZ98ir
 DvpGLEJ+dK8amqbvcuZlNcNroSj6AHFcnoyErmjr0Kb4D7P2pvwp8iHDB7wN2tAta0lob7qioXg
 o4Nj87QP9UoBs4+r9Z6XtcSREZGF9QSZQZG7o7M/pwTOcsXtpJCeqiwzAckMkOX6NF9THKpLnmv
 kznUOGMDm+bFzJj+6J9FNpnpiL2RD69pEwarBOJTEQ8178ODUe8XqUQODEC4ZIXk0PD81wIcrUd
 EMy07QudtLRcEPvsUkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040092
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 4/9/26 09:57, Bin Meng wrote:
> Hi Philippe,
> 
> On Fri, Sep 4, 2026 at 12:56 AM Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>>
>> On 3/9/26 13:24, Bin Meng wrote:
>>> Add the base topology for the Phytium Pi board built around the
>>> E2000Q SoC, with two FTC310 and two FTC664 CPUs, RAM, GICv3/ITS,
>>> and PL011 UARTs.
>>>
>>> Describe the CPUs as three non-uniform clusters matching the vendor
>>> Linux device tree. Preserve the board CPU slot order so firmware
>>> MPIDR 0x200 maps to QEMU CPU index 2.
>>>
>>> Signed-off-by: Bin Meng <bin.meng@processmission.com>
>>> ---
>>>
>>>    hw/arm/Kconfig         |   8 +
>>>    hw/arm/meson.build     |   1 +
>>>    hw/arm/phytium_e2000.c | 406 +++++++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 415 insertions(+)
>>>    create mode 100644 hw/arm/phytium_e2000.c


>>> +static void phytium_pi_init(MachineState *ms)
>>> +{
>>> +    PhytiumE2000State *s = PHYTIUM_PI(ms);
>>> +    int i;
>>> +
>>> +    if (kvm_enabled()) {
>>> +        error_report("phytium-pi: KVM is not supported");
>>
>> Why is it relevant?
> 
> This is because the machine relies on heterogeneous named
> FTC310/FTC664 TCG CPU models and Arm KVM generally requires the host
> CPU model. KVM is rejected explicitly instead of failing later during
> vCPU initialization.

Hmm OK. Cc'ing Pierrick to add to our list of things to think about for
heterogenous emulation. I'd rather have this handled in a generic way,
not per-machine. Hopefully TypeInfo::is_available will be sufficient
to not expose the machine if KVM is not available. No need to think
about that now.

> 
>>> +        exit(1);
>>> +    }
>>
>>> +}


