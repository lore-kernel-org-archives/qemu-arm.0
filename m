Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192F4C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 09:27:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wh25V-00047P-Vl; Tue, 07 Jul 2026 05:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh25U-000471-E0
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:27:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wh25S-000658-UU
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 05:27:32 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6678DaXQ3219273
 for <qemu-arm@nongnu.org>; Tue, 7 Jul 2026 09:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iBP1AxOYEH8JTa5JlqgsLzsFIYJ5VInnvZONiK9C3A4=; b=owId1Oqcui4QmW6R
 kE3kfQeBTIYjva0IYVszoX6weEaBQBKyYFE1GOPo97wBWPy36KGoyqCLFI+cxmBq
 fI0kPPJQuWubEq12Ngblr1WGlmV/kZZcTnPqEYQIWOGah3uRyK0ps7bg+AE7eCoH
 H9jVojqE1yprGDpQS2TknftX5YlKfr/AkVNt8+8QAXTOs5kSeEUfxzBCaKFfqSYB
 DptIwOf+93IxEBtVT7xeqo+ldOhxEyUl6+ThL1mFPW3yhnWP+gSCX/0Mrou9opFX
 oAhG7dEnj/Fc8CVGM3CL7XMAUpsq/qK6ErVn+kfUIQ4rc1bmSV0Qh5VdbAQQBDeV
 tDFUcQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep0dcr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 09:27:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51a8c689b5fso40435351cf.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 02:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783416448; x=1784021248; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iBP1AxOYEH8JTa5JlqgsLzsFIYJ5VInnvZONiK9C3A4=;
 b=Y047gdkKAK8SOBOxeZQJe2AjshTI/KI1MaQrt53gH7iDG41JV23aV+WbFHipuUA6Nn
 OFJWk3NH1mtQWu31SYHd8NP0/4DYpF1VQGTi3UgDeAcNuiZkKq4Xg77e8wte4ISKEkjY
 mGr0rIwK7EnWTCKMk8PPy6K+urSd6B7S4t5/dfp4qLwqprMDIsRr+v5YA/fT1M/nMF4v
 /4VJe5D9GJE7y24sDtusPatXcZ4PHHqaFG1MJxtTA2D3q4GXc+DwHT4K3y9SpSIFjv7J
 KF543pL7/mAOJkdkEtHlr6vViR+pwIySa6p5El3b3vAOYNrjIj9E12p6BntM4kcrFVoT
 b47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783416448; x=1784021248;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iBP1AxOYEH8JTa5JlqgsLzsFIYJ5VInnvZONiK9C3A4=;
 b=rr3OJk/N6UYsBTzopq7xb9rpnTK3w1ezbNaQh1/GJf3qCiGOXBzClom7PMj/WaR98S
 kHsEsVdfD6DHuhawZOqqsz6ruG/2tUtOXnNQ3rzZ4yQnX/c3BL296i7x1ARfaBw0y58U
 13GB5d9pvNGAs1ye2KNuI/AMcALcG2KTr5BEbJq5Ww1rbOvxSVmtp4+q1SgfnqW+4BR4
 NEZuYA+ZjfLokRrt9HePviK+hvrID8V15JUAA9jztEz3FJtztSt6TsJtLa17IQcJWuff
 +XGzSHY+50GPKGJ+LsnjfDN7Hz83+z5YmNu+0cLygvrCnEi2G7kN/UvlSJAyhlXS8lQ2
 4Wvw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqhvsuOuFxqmJ7tfMLRGbGlcejJTydZBoeY55Nzwf5mCfuJf1bs0BTbY2IRN1zyIcWxtD4hVdeAwg==@nongnu.org
X-Gm-Message-State: AOJu0YyezQ2B7wTVUJS10ORsu9EpAjtBOcLDrhJSGqSvpI6K4p00orFi
 6jVLNwnBRqtYsh7aFo9lFjFMRaay46F2EQ2c1LUn3vtTPsl7J+9fPQOxlnyNDPStZelCXpEM7lW
 npEmTjw27auuDuX+CXRu00mmGmqUTtG9aeTXWiF62jEE5qtibaVfKMsSR+cRbGmI=
X-Gm-Gg: AfdE7cnGH3m4E/flK33AHXO6ehfp6kyaj0ll0oMWd73mMUvv1uyOJhOVyTV9kOa/WB+
 bqO36WNiqE30TgEGIA0Wzt3sXbthjazKT1xiVBuNwKxC7t4+eF1dS9XQq9wCRrIvHU3vKXuYFFI
 cbZpuP/UJ0AVLnVsuknv396ossYgVpENeazDZ3/uKCmvMV2gOsorClwc8Qj40R3h8+LhIfsdd5i
 aIdZ5dfBmd6Na8lUIPa2bDYs2EJscUrJ5kwfegOcCY5NG+WQs2NDk+7F+DFX+itIEuIDOcnoQ5O
 herQTC3KGOlrYPsEhtf6eKIFNAyechBe8O16NS0+C+watUIhcrlCXe0Uipa13+m9Jb2Wha+xM9V
 cqX7mUVFDXu8n3of+EYYiJn2TBG/Gv9ZcjqCYIp3MKvOd8hJCBIulnOZA3CtdRw==
X-Received: by 2002:a05:622a:180c:b0:51c:17cd:1fd4 with SMTP id
 d75a77b69052e-51c748b8011mr47337101cf.41.1783416448476; 
 Tue, 07 Jul 2026 02:27:28 -0700 (PDT)
X-Received: by 2002:a05:622a:180c:b0:51c:17cd:1fd4 with SMTP id
 d75a77b69052e-51c748b8011mr47336861cf.41.1783416448064; 
 Tue, 07 Jul 2026 02:27:28 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-69a19cf68f5sm5714948a12.13.2026.07.07.02.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 02:27:27 -0700 (PDT)
Message-ID: <5d422df9-b70a-4c9e-8736-25b220c9a92f@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] hw/arm/aspeed_ast27x0: Pass realized PSP SoC to
 SSP/TSP initialization
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260707060919.350637-1-jamin_lin@aspeedtech.com>
 <20260707060919.350637-6-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707060919.350637-6-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3ynSCMviBhImzkoXqNplq7k5sujaeGwf
X-Proofpoint-ORIG-GUID: 3ynSCMviBhImzkoXqNplq7k5sujaeGwf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX39cntruvkh3z
 v1cECYp2IMr07puGgWApt8DdAm1lw9FObjrlO+JMsQBIJWEc91BbqWyoNYpOobtI8YmfZOWN8Fi
 tQPLUj4USjGmO0khhbZMlalR1T/D4jCBZfQ/4RxqPnrgZW4yLFQHUzce5CUo/BuIzDbOe7/LqGX
 0hRwABfEMy7hKAuahBEcX99GyKbeXDGkJs2xkc0kqSqkdum+NxqaOCnKy7ZJqvcIs7nXQML1ixJ
 e+OikbYLngaCPjjfE36aZbEYW4BGG1X4ly7e5YKWf4vIBnNBfrGxK++4IOfOgebHKkI5HC7hI62
 WLrYML1b/5CEsBLC6c0E76d49Y5bXRrW1z5v515hP0GPz6Y/4HqMTjx5UyAThkna6mMN/Fl+OLd
 Dl8mBMwAwTstNMASlWPr2RU34EQDkL8zP83NzNgZAr4X7KQsfu5T+Vs5mChjfLGp0aygmsjYRLk
 zIMFjh+yT1cnK4IJe8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX/nBXrrlSiP6b
 I1ty5OJ6A/r5IPC5dTbeF42d/VIjtEI2hihVh9zElJwcopCT90ZY6LF7xetFpYz+fG8/FL8jERa
 r51WKMSOXQMzKwD8cTcte4d0y4Qq/Js=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4cc681 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 7/7/26 08:09, Jamin Lin wrote:
> Pass the realized PSP SoC to the SSP/TSP initialization helpers instead
> of retrieving it from the MachineState.
> 
> This makes the dependency explicit, since the SSP and TSP coprocessors
> use resources owned by the PSP SoC, including the UARTs, SRAM, SCU and
> SCUIO. The PSP SoC must therefore be realized before the coprocessors
> are initialized.
> 
> No functional change.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast27x0-fc.c | 26 ++++++++++++++++----------
>   1 file changed, 16 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

