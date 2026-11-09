Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26BF606A31C
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 11:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hEFz6CDP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uqn4tKU/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQNI7-00021g-Kf; Mon, 09 Nov 2026 06:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xQNI6-0001zn-CY
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:11:58 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xQNI4-0005wS-Si
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 06:11:58 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A99vHdD4108062
 for <qemu-arm@nongnu.org>; Mon, 9 Nov 2026 11:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5R1x+TKPW+APpwch0mh0uFdz3d0IjwDU19p+RI6kM1g=; b=hEFz6CDPfMM2c4mV
 xEO1BWNEB9MhN0qz2/6OAxnyHUicbsB1I1LGwqbPa2d0oOQ4fKm7o5YmSm+i6lH5
 fWh9Q6WbTU4TNZhQhySyp6ut0WJ7A3ol+JYdbY511lGBSMmXWv+wOpzfF6i4gilG
 Ei8NXpr/oaDMlSFIUD1f2SKkdzcguqmMv4vuhgH485/rwjNbWd2HzELaGGhaPv03
 g45KKxqlwFoAoZhLx9wB1mo8+/f0KQqHBNH4Tz7AJpLXRTXnDOky1H8VVJxLKUYr
 K+f68vQuJ6Wvyw5KEkuYN0dBChBlxql3ejHcm87AUkPNsboYc/oe8zqK3uvR8rMh
 FWBVIQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnxeqs-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 11:11:55 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-99077a0be0bso332167241.2
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 03:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794222715; x=1794827515; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5R1x+TKPW+APpwch0mh0uFdz3d0IjwDU19p+RI6kM1g=;
 b=Uqn4tKU/vPU+hjN9fdwNNHpHFjnxvBmT5Icpb6DnI9mHp1XwtaQCi8HVoN+rAV/YkA
 1566b7K1L4R5FvjwpNEkA9SQpJB2otRxF49JuXFnSXuLIZ8Z/zjrLPnB4JHK/FJJR/4K
 Fp2pJ1BGBiywFNPLErurWAovEF/kHjwyFQ1GUQrdnSM7w3aNDGQwSsw8mocaxszuRqTo
 MrYh7F+05cifyBcl15+TBSjQN7UDZNVH1Bac3Z7hjnp2b35C+4/YzVzlGtGNx8S0MZYk
 8P7rXUlcaSq6WEStRwQ6ZWs6duWi2S3QmBLSqZp5THlMPkJfRRylCAPDrcg9EG3LC8wu
 xlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794222715; x=1794827515;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5R1x+TKPW+APpwch0mh0uFdz3d0IjwDU19p+RI6kM1g=;
 b=uQJMoVf9w4EY03B9uzXGJbsYL2yHhooXFFENEa5NtpvjPpp37QRqF0G7ujcSAU6KQ+
 Lu9+o4gzvVg+gRXylZ5OUrOGJ+7qRZ4Ps88qbs5GDpz6T/B7HmntJmJpX6LazbMmUltp
 W/Y9gjRWUqWK5kz9W/SIqWjUnarJhP0VZVJ+3eHhtUBO8BJE0j5kalTmKkS7khMlWjSB
 KwQyTtXSlt05tADyUiE6UWK9qWqEuWWXKuHken+ghhHfXTB+ADI62nJf25SK6yadXxwG
 MsE28A/LwP6Otb+bR5NtA9mhmOr6mqzgrUdMOx4EPBb1wsewA9vVwbKaoJHvHkhe9hfj
 cqhA==
X-Forwarded-Encrypted: i=1;
 AL+hErEhje8ID+++bXq+ktLOckXbC9zXjgvLoKFqcaA2IftEn7ObvBtqMyEJIHd5pdq63JQzpkEin9NW5Q==@nongnu.org
X-Gm-Message-State: APuU4Z9MgoCpqUl3nosoIxx6ouKMZUgz5PY7G40MSL9dYjAoK6VhnK9m
 2TgKa4nFFHetHHijGT0XSa2C7JRHVZb4TqBEuNz4ZknBJhoFF3trbIxI4GvoIJYWuE9lEsopJJ3
 XnmlUoSTF/0ILQbIOSaaSHM3em8MQ5cRUmOiEPyhv3b6iiDEKBAlQP2M=
X-Gm-Gg: AYBFou285Bo3ASijMcHMI9b58oHECe1MhCL5XUECnrKGv0IgsthQEteb44nlaXLIP5c
 POmj46w3A/2XhRRdAAQcJCiGkAyNltm4tpLQBImv/TNP37IRRUmeARJ6p2yZZhNq7kgRzJ+8zxr
 C4J2MhrBMuqjyCjEZHVEWiC2IOqxVuzsNIpJUxOzBb2c/YQ1wTQZJCkcTxpCC1Oe5AaCg961gcT
 G+pXdmOwYwCkmKGoV+8QrWLOOMf/82JaZhSXinrki5NOFxxe4N4vGqlEUzY6qkn/ubeYOul/ifR
 YbfX8ZHKP7tKtMomoqEtz1Aploy8Zqa4wEuPKrmgwuExQKkhT331l7S1cWrZeRqFdwBZWFSXh1i
 4vV+gpY2x0eTXVCpHGMq2nzBUZuSX/pUE6Wo7RmNnl6kQM/ybf3VD8Yojtn7yVP8rzchb/uBmG3
 vUXDqY2Q==
X-Received: by 2002:a05:6102:41a7:b0:7c3:a6f0:99cb with SMTP id
 ada2fe7eead31-7d2db206187mr752946137.33.1794222714942; 
 Mon, 09 Nov 2026 03:11:54 -0800 (PST)
X-Received: by 2002:a05:6102:41a7:b0:7c3:a6f0:99cb with SMTP id
 ada2fe7eead31-7d2db206187mr752940137.33.1794222714455; 
 Mon, 09 Nov 2026 03:11:54 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49597b2066esm9412818f8f.52.2026.11.09.03.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 03:11:53 -0800 (PST)
Message-ID: <ff56e3cc-df38-492f-b158-765ae645bd61@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 12:11:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 03/13] whpx: i386: get APIC state before VM save
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20261109004108.85808-1-mohamed@unpredictable.fr>
 <20261109004108.85808-4-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261109004108.85808-4-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eL8CmKEzmiMaS3VyKTB8wEVuvuMZlCwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfX4rOdIB7vcKg3
 jEz8oHT0qKx82Wac8A57545QYePDnrSP3e2U1c9htM7OPI31OknaGO50os83pnhTo0e1rw/Vwxm
 nn8BWW/WiSs4K5KYE+5WQgFr3sKAuRGh2uJPibHxIW4Hqrbg0KaG6/hPe/agtR/WW/G+pTDOfIb
 19eZiONWQfmHIhlUnnqP2CwsUIWKPneWI0y+LKIMN3NVpS9/CG8CYlORAIqCpD4pvu7NZHa65Qx
 LCwsAAZUlrbUAI9SuU3+MJ4d7VTdadev39SkaT1b1TiaSJrTHblL8g9yuN6u1rxJajypXvrqXMi
 R6hHA53wbF1k6mUcHS+ZjqW/NvDvGUadb8e/0p898HynsOEqNoDbI2kMmlJNiJ4L5H7duLhPtmj
 WkyCPY9yrsvyuKLN5m9M/GSctl4dsGNAJCQaekRdjSffHAnWBhX4gLQKRv/+2dpu42to2AbpR3v
 MP0Y8s4DAuYwOEh+tzQ==
X-Proofpoint-ORIG-GUID: eL8CmKEzmiMaS3VyKTB8wEVuvuMZlCwM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0NCBTYWx0ZWRfXx9/4bhe7KXQg
 ktiQmeUZ0BVqAjFx+CCgBzJ0fAYAezuGeRDca8Sq7PlFRqiqAUOTyaAqxvHlEkr/wGxuK/8sddb
 AaThz8CYxmZg+SQgY14g33XWzvz2Ee8=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af1aa7b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=OgOKQp0cJKO2VJyodbYA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090044
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/11/26 01:40, Mohamed Mediouni wrote:
> Prerequisite for VM save/restore.
> 

This commit is not reviewed.

> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/i386/whpx/whpx-apic.c | 6 ++++++
>   1 file changed, 6 insertions(+)


