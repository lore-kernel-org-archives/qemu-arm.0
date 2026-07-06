Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BBCC43458
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Jul 2026 07:08:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgdQq-0001Al-GS; Mon, 06 Jul 2026 03:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgdQp-0001AV-Ef
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 03:07:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wgdQn-0003g4-Tn
 for qemu-arm@nongnu.org; Mon, 06 Jul 2026 03:07:55 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66641Yu43470502
 for <qemu-arm@nongnu.org>; Mon, 6 Jul 2026 07:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 e2aI8LXPs/gb/+T3SjcdsDrlKg3JFhwiX90IU8c+aW0=; b=HPZpW6R515CPoF+E
 vDmbUAU5pseQ55qOA5mdSAyWyXgzMHgd5yIdQcvbn7iVhBvauIaAc3r2acWkFMLy
 WSLvqwt6fhMYRYRjCoUUh3XnIlqwWDk1r7x/ggVQpbVyWvsBntFFDVLhRWfVDtCa
 TkXxHczIlGvCNWHhJ5e8haHbbik7xP6MgeNHK1X2CbP8PIdtBe8z+jGSfX79LtlW
 aonHUIODY7V/8iaBMRb7h0MLqSg5T8jEV+A9jHVs95Jww1wXXr0gqPthMV848pOF
 WzsmXyjYwD2ZKTtZiJPY0Y47tIUiuGU0d07eTUc8LUOB/g+K24KoRQRYXdqPqQ1w
 XsliwA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txemu53-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 07:07:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e62e3459fso217341885a.0
 for <qemu-arm@nongnu.org>; Mon, 06 Jul 2026 00:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783321671; x=1783926471; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e2aI8LXPs/gb/+T3SjcdsDrlKg3JFhwiX90IU8c+aW0=;
 b=O9EhqsLu9mDMEpvyj3+4to8rWsiGUY37APQFXo8BB1oiTpVFbAi5kIY/UCmy/AtJ/p
 x9O95cn0yEJIK4I2M22dEiQ2oNZeGe9WmGtbJwHkDvrM/9zghmVVutSrB6hK+oE/RayR
 Jv5h9dJvuIhqWaEW7oRsc8TRmeYjYkuSSS14CxQR74qHVgYYdA07g+sWLhnczjxBuMdh
 ZplNDlVRAhfeGsUsElUkELiuYWOJ4D+x7t7A0j/VaGKZhsmEeHxaoiRoYdSy32OSGchF
 H3imu9KfG/Aq2dOH+2Iqq8H0i6vhB0SjSIc/x9n54Xn7MH2atX8Wis2V5J1105i9Pba2
 ui+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783321671; x=1783926471;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e2aI8LXPs/gb/+T3SjcdsDrlKg3JFhwiX90IU8c+aW0=;
 b=eUBgLi+8L2VlayQgaKqsab1WgU9N2VTrcVM2q3eftmRmqN6er9gKesfNJpVbw0PpnW
 s4CoOlzEbcvXO8BrYxbgVJhppzN5i+n1x1NDvhTsxArE3CIatzC6KRRZ7CyG2TzvpgFW
 CvNw7mGG9wJum8e3nK67yhbliHdA1QUaunbzRMlHJwovNFDcWVATTnZ7woX8yr8iZerd
 hGpDokzmxMnysvBmhw4NMlmziBm49chvPsXQbaWJcxerrLZqU7XowBRjqF/I6VydFzQG
 Sq5mF/GKxIZaTIDj6PeEKN6gYJwH6XxKljHxoPS9YpmgkDxyKYb9WQME2OCV0aGAu9ut
 sHIA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp77O6x6SpvbOwyobLIvFpIGnR9w9w4EFC7/qvfhRTyZGD4v/xZOhZN8C5wJLEBhDozDuifF3O3BA==@nongnu.org
X-Gm-Message-State: AOJu0Yz+GOKRZtph35NfGwTge83aSl/z/FyIyOJs1tT/QA6wHwaCiNJj
 GDrMf0zzBicOqD/Dpc9Af7VGwG18ro+sLaXN7m3OWa61G2Ib4A4726bfNDQWcqTSjpczdYS3MJU
 anLYScyRBOjVILCz4R1B1t7aQ3mp8Fk9E1wH69lKCIumYiFi/De/ipW0=
X-Gm-Gg: AfdE7cnOqis+nLCskmnOXmyZ6y05xzpdB82X8F4fl+So6qdHuPqh85PWaDWdVQpg40m
 Ie0ARQy1+qPPcIwyRClR02av/Q2gdiqC7nNyvTi514HLgcgn6zbcfUr2b8728bIBfulnIWUsZle
 oJo+STAP1N8qrK+kzdCXNz9AXK9thpggpsRUiH0QbtPxU73bJvrRW78cWyOgOYyhVvYoA9IT1oJ
 +MGjvD6OaKA0SydbGOShplJqF8EE7isLLTCU6qTx8O36ktiXMT6YU7+D65PcrFDIO+PF8MIOdkW
 VqsA1Sc0vKFG+RmUXBH81KxZnMulEVoz5glHfZJA4rmOmPg9mwiQsHYEH6qCaIHqW6YOA0eOQWX
 s+u+aSb9WGX5r3QZSS8ZhyOvCqSfwnjN6HtiQpatSajz1tJ37wIjLJDJ4Q4W5pg==
X-Received: by 2002:a05:620a:460b:b0:92e:5610:e478 with SMTP id
 af79cd13be357-92e9a4c83acmr1220215685a.53.1783321671365; 
 Mon, 06 Jul 2026 00:07:51 -0700 (PDT)
X-Received: by 2002:a05:620a:460b:b0:92e:5610:e478 with SMTP id
 af79cd13be357-92e9a4c83acmr1220211985a.53.1783321670893; 
 Mon, 06 Jul 2026 00:07:50 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce0a7cfsm259083255e9.9.2026.07.06.00.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 00:07:50 -0700 (PDT)
Message-ID: <65ac06f1-079a-4bfe-8817-2f5aefa4c870@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 09:07:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] hw/acpi/ich9.c: don't pass ICH9LPCPMRegs via
 opaque for ACPI_PM_PROP_GPE0_BLK prop
Content-Language: en-US
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, philmd@mailo.com,
 aurelien@aurel32.net, peter.maydell@linaro.org, pbonzini@redhat.com,
 richard.henderson@linaro.org, berrange@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260703135512.3213964-1-mark.caveayland@nutanix.com>
 <20260703135512.3213964-9-mark.caveayland@nutanix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260703135512.3213964-9-mark.caveayland@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX9nZQg5zNYe6g
 vya3rbzDoYVL7m8sg7mcHvnCiEAxLoKkse4jxwY72rI8hVbiZwp73tL/R7HEiwGod0PqOcXK3FU
 xHGEea5lg24ca6Q3e//vXAoZR7/B+88=
X-Proofpoint-GUID: x9OYo52EQDJmLAtckZa1oGSU5_V3mpyZ
X-Proofpoint-ORIG-GUID: x9OYo52EQDJmLAtckZa1oGSU5_V3mpyZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX8s1RrkYsb3Vz
 TzTsnze3g3QyLkPNX9Vq/b2GVEB0NQrE3tQIck0UY7nPLTV6APwxymOdbareqkjBppn2tJk8++v
 aVyrFdE1HHOw9oL6wrML9KYGFV+goaYidvDmcDpP3iVRjZRsFMrIeAsKrMM2Mv27IwcvWVvH/uy
 Oo5r/hKSz3n+l9ymOUIW0b0CLN/UM65coqK0LZWvMbnMBvGXBar9mBztQokdBgjRwc3mYNn1v5u
 L+r34lF1IAIK58wtSX6pAEOJEbNX/JGl9VnI8l5PTdkcsrGZn531IOYAtAxQpqZu9VLbEjENJZd
 aUEPNWsJxQn9yYwl3hSoY3ANyGIgPu7tsI2IYD2i/YALDVhmvS/uiIZKVXtQVTOZay1KuB6iyoQ
 8ZzazcQKgODySaU274I95G7xH24bEMm6LjjlScVl4QXPELETWHKW5VxN54lCJB25yaYJg0B6uzl
 riJNSt24kXoR3bZlYiQ==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b5448 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=64Cc0HZtAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060069
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

On 3/7/26 15:53, Mark Cave-Ayland wrote:
> In order to convert to a class property, the ICH9LPCPMRegs instance must be
> resolved by the getter/setter instead of being passed directly as an opaque.
> 
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>   hw/acpi/ich9.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

