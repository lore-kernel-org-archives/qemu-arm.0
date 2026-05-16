Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402CCCD4851
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 21:37:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOMhM-00077O-Au; Sat, 16 May 2026 17:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wOMhK-000773-Cv
 for qemu-arm@nongnu.org; Sat, 16 May 2026 17:37:26 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wOMhI-0000Wg-1Z
 for qemu-arm@nongnu.org; Sat, 16 May 2026 17:37:26 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64GELulW381503
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 21:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KI4v4q7laIlDS7q5LjsUhVF3mJ3/tKJ89aJJwYZvF6c=; b=NxgjZ5fythDuKM+/
 XoGZ5rDU5ZeOXxODFkMdEJxWGSZ4XP7z5AkJcclEDAtMridQacz10k5x8dHjCzOz
 WWTi+4eK3seCiCjJ+I4aGYz5DfUAO4D+1iLSOWxmV5SwmoXk8HiLfPFw7pt+1I1e
 lvyLfSRlaAILstBuszsdHs3FRGdeVSHc2VWmAAGl5Qf0UBbCYbAOgbdPxcDHNZgl
 hBVhUoK2wj4d5WzofHeCHHzyH+r8BTW1W6evB+6MTvXlOtxiKr2ah26rW300DAXL
 RB/xZMHsrBS4sMXo3WLlqOFkEFDNiJYcz32eIWWZWhzNViwbQlON7DBMClvjqbN4
 FMRq1Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw1qbw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 21:37:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2bda35eab74so691641eec.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 14:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778967439; x=1779572239; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KI4v4q7laIlDS7q5LjsUhVF3mJ3/tKJ89aJJwYZvF6c=;
 b=gkmF2DP8JQgW0AoxY7GURaQ5BO20sQXxqEvF0x8Zu7PfxwGxaWZbmJLEjX1NbA20QE
 MTTn7qmCG3bI5WYhKhMn54yiczUKCsWpWrKRkuq7Lx6DUKV2PTnIQxaxamk3pEPIOc3D
 t5whqbp9KHn7F8T1beDPXpI5PQmLu553C6+5LCaBIH/Fj85X4zIrrx6zU4mE+JobI3kw
 KkwHxD+TQnLM8v3Ctmx5c1PPQ1CrUdVoHmtFFjy5aBizlvTbxyIDex+jBQFOvanmH8Ol
 p9G5a7sUWCALEdpK4DdAFTSb6MuVqP0C2Bm5wNfaFIfrdx/pHNQ8THhjeW6uEd8Lv7zx
 MGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778967439; x=1779572239;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KI4v4q7laIlDS7q5LjsUhVF3mJ3/tKJ89aJJwYZvF6c=;
 b=SLoOXvjikePKUOdQ1XTlFtHi/pi0WwwqJgz4mnWGEpSL5KncTdXE+YApShp5iY1P03
 4q7h6bWUAZEj3SCT63gcgp4YCXKT9giYnYC0r1rsu+gtydelb2TBiIP4JjBW83FgM0pr
 nRKIszyK2/V9P1lERIfSrqIa7pc9F/KwuprmZtFLvooD6nVjy4VxYSmjiJd97bxPgc4y
 SMTS2ob97cTX/2eoD217W6Hm062hCXsOX12bpK1g3ARrmlmhed5toAR3XQ4+9RDRHVWn
 zV7Kog2Q+nwRGw9K0Ca/2i/2XXbZH3I+LkvF8WMgikfOUeoaJ6ZbSEvlz6JK21Th0rtv
 dqhQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9MBy4yRLzDY+kXMxmHjZHNiFUdlmX2s2lD8G7ql3yuYxvgOzcwtp35d84c7M8kKGnpUjI48Gxyqg==@nongnu.org
X-Gm-Message-State: AOJu0YzU8yqD4F9cRg4ufgEwNicAq4IFprnIjyz5twle3ED/0/4RklJq
 HaevcNVPcyomUgbiwpryOXwXqEBASK9EifMzWb4vYYzSMYAvMqkdRTQdeK1CLyg5EREtHHOUrwe
 y1Dwgj4N4+0ha5BBszNIo9soBtgXeoH4rTsIm4waS48aEoaO+39HFJfk=
X-Gm-Gg: Acq92OEzd7oCikm3cYaOIV60RcEwlEEsvZD9UYlrgYekYXGa1/r/MMMYz33H+H88Dqa
 Dws2um5V0XNsa4TKFm6m4sSVP7Qbr9oUDIR2kQqwhNIcLfn/WQL9iVVICB8Ulzu6777+x7Ee0ob
 EUrzTCNA4vGGe6M3l57Y886wud3VXFhBQ0I2b3tiHoeXbKhXx2wXeyDotsW717vllpWRH5ITfoj
 ejUH8EjaGCcIIncJw4LA9hR8psTgYgxgDcHJ47fuUBWY5BRdUOYDZ9bX40Hk5KmpWcSya7UN+W2
 pVcSFvAUy9c50tjAj4UORXOWQ18CdfO97lsNkwLVyh6eTYcTDQIbsIu6WPnbcE0yTibiCPUBngV
 ZdVG3mzuM7Ds9ZwTD5BPgkTHnnBiO7/NBLvdcccKl6Z4kkTPJen76HcpMVyl2HbZ0g8QlNE3gNM
 eNe3kfpq7z8uWkvA==
X-Received: by 2002:a05:7301:1984:b0:2be:9c19:b34b with SMTP id
 5a478bee46e88-3039785c745mr3778733eec.4.1778967438706; 
 Sat, 16 May 2026 14:37:18 -0700 (PDT)
X-Received: by 2002:a05:7301:1984:b0:2be:9c19:b34b with SMTP id
 5a478bee46e88-3039785c745mr3778723eec.4.1778967438174; 
 Sat, 16 May 2026 14:37:18 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30293e2e6a9sm10286993eec.2.2026.05.16.14.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 May 2026 14:37:17 -0700 (PDT)
Message-ID: <4fe8e2cb-8a5a-45ee-822d-2488dbec845e@oss.qualcomm.com>
Date: Sat, 16 May 2026 14:37:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/21] hw/arm/aspeed: Do not realize 64-bit CPU types
 under QTest
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
 <20260516171524.19184-6-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260516171524.19184-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDIxOCBTYWx0ZWRfXwpdYm6uf97aE
 yqJx4aCZiDZCASLFRofWo7g1zqhc+1yFwkHExInUoANnAHfpx928jVgb4mmfhni+tZqsrCe5hU/
 GO6nmbyQpxeUCVME/H2bLZMYUo13v+CQQfts9zkbNu++Y9yeLs0druIEc1Juy/8g7UTBTaTfQeS
 +L/9NwnWUkw30VOe65xh9kG+YFGxzpkFFn4xAbrgoOJ6YNFlMpXV2g/dIfN6dyhDUWqHSTuCJ2J
 U9efn8T8bTpWLF5x53sbre1XRfL3XvEr80ju7b8eNcV06GDQ0lzy70mT5lC6A14UcrkmUUQDfOa
 5fhXEYXAqHCPWNWhbvI3tmlKyhHePVNu3jc5A1JfHlHl2lieBU3RlrQeYDNURSgZtaP0M8PMjmn
 viZ3zRyeRxbQ6+2jbxQXrxxBQw9BgpfxYGr1boJEQZ/40/EHAqmFbI3M6kbuNogOQ7ZHLPFY+im
 tZ0CwVvL2klyyRX+ZKg==
X-Proofpoint-GUID: RaMmlPwWVfAI0-OOJPgN5drkX1oLrOG-
X-Proofpoint-ORIG-GUID: RaMmlPwWVfAI0-OOJPgN5drkX1oLrOG-
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a08e38f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=aow-egSQAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RhXjfXvIr8CSHO81VaMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=gFNbaldVC-z-bsjSTzMo:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605160218
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

On 5/16/2026 10:15 AM, Philippe Mathieu-Daudé wrote:
> aspeed_ast27x0.c models 2 similar SoC based on a 64-bit only
> CPU (Cortex-A35), only available in the 64-bit binary.
> 
> If we build this file as common object, these SoCs become
> available in both 32 and 64-bit binaries; however when running
> the introspection test on the 32-bit binary, the init() method
> tries to init the Cortex-A35 type -- although not realizing it
> -- which is not available. Simply skip CPU initialization when
> running QTests on a 32-bit binary, asserting the realization
> step is not reached.
> 
> Suggested-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/arm/aspeed_ast27x0.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

