Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EBB606A32A
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 22:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eruuM2qO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZeWK3YaM
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xT4ua-0004HI-QZ; Mon, 16 Nov 2026 17:10:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT4uZ-0004Cl-5w
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 17:10:51 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xT4uX-0001Ft-Jz
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 17:10:50 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGJfEsd611766
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 22:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8YweDSGhXD9vSxuhKGqZ6Xce9VDuhlCTm7+7ppHWaqM=; b=eruuM2qO0yJMPZzv
 niTYGWQMog53nIdT1d6WketMcsJ4mZp6MQ3mO3qmob5tiyH6sYwPdiTdis8P4pNL
 N6WgpE58IT9/AM3va6PQVNbhGduU4GQAQI5QH7JVBV3AqeeA1BJJ14QbPoGeB9HY
 7etvGAYZGM+TiDZ2FPZAzWK1g9WXSxpCS64HW4GXGbvpiMXoSytYB2MWZ3fW1UH1
 +D0bbSe9W8jtxuaut+ek+pzF3P9amDBu+W3/acx/xp6BI4lSig1UmuCRnqfUgWpg
 Iy0qYWFEj67Xs8wWbuZ5WY7sou5lHeSdqIUSr/+Uzf1WG/bqm3bHU9th9IkRXECj
 8sfOEA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6gjw2n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 22:10:48 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-99e0a55e4b4so629855241.0
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 14:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794867048; x=1795471848; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8YweDSGhXD9vSxuhKGqZ6Xce9VDuhlCTm7+7ppHWaqM=;
 b=ZeWK3YaMkG+xFsqK0jSpt0sjwSuyKXAY8kQCXOv7Z/xmkRDP5UmR+e49ZKLlR8HV04
 CUi0fm6Vsv0rMU82QuNC85ecv9U8285lJoL5NVo+5oNPIpHb7Ja/L87obxXF6jd1IJDD
 0H3qY3Zw8d57cLbrxxRCpovb34a4wYr5RMKql5FiBvz2PZPUIJ0kx6H22rH15+UP3lx5
 7Sv2CDifEswN88Qqfwwu3riGnUxoMLl4OnQi6cLs2cUsnLGYO2C7FlPni3ExHJhPgaYq
 QteL8l09RWaVZflI32oJacplOFs7Knsv1UsuKFOh3wzkK9o7j8pzPijwVodYy69ZkBRt
 c1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794867048; x=1795471848;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=8YweDSGhXD9vSxuhKGqZ6Xce9VDuhlCTm7+7ppHWaqM=;
 b=ni/ECokIRhhlXwxnZp+YrhBu95V16kea1Ym3h+xhz3f0inzmcAlD8DigdxZDxdsiSI
 +zfj+/lOZNUCwJISyqGMVQXdwuZJRmsHpsE7Ilok9K3WOP154AZWpZaI/t9htT380j0n
 rdmd9Ant6p7fRSux/UnQWobpa4Ko1pmnv5o90TCUoXhHye/LrgguYStjd8FKJSjcnBQk
 HKgFQEIC8hnnrKL/wNrX4JGvHmuE/OzWa14tytlm/n99hfeZtPHR64g2YbuCjjjDmoca
 YcNtxQ9MTAr5+JKGVQxA4LfESSTdTeEGiuKCfKCSwehNcvg1ofMP6kS2rItNH0LG/olI
 X1Sg==
X-Forwarded-Encrypted: i=1;
 AL+hErEEN92EmxO5OeovqpObI8pqY98ENC9BtJWKmUlfx3RvbLYDM9Wf6xd6FxHf/7BEB2Mwz4PVAnwP/g==@nongnu.org
X-Gm-Message-State: APuU4Z8rrSzprw5vpjoHyRlcn05Dr8U/liNF1hbokRlXrOQYeTTCj6tQ
 589YsartwrGj2EcepvTARBS1Ppty+K67S5K0JRa0hCWAYIZMpF5p8Jf25nKqVxgpVf8rdVwodWw
 dhiCnqptkHgOu3szu+H8WdncmAxb4M+eIY6LPhtqcc+8kUhxsuJWSdMo=
X-Gm-Gg: AYBFou1rTplDfV+V5bVvOp1T/gvtnD+ABzHyRvuvHmSJwAgkfEuMaKh2u/gy+UDsGT7
 S/JwzY7TQp37npw8mzXRqGFRRBG1t1CjvRE2kUWC2hDBIEZYHYe4rQSbHVJk50S6hue/8xCJl30
 6udx7haSdP5e8WI8ltjA4ERM8a2CjEQWM7ToFFI3qI5KIypEvqYlnGCaSeXFYhz5LS0p+XExaNr
 OsBUWGr8/WTNt0huIkswkTr4T5HplxRQYYJFpAnPURpWXIYgih2o95XCfM0AfBU0/QrJ8yPbKfa
 FZ5AlqxGuVdqwg4WKhL3023RBS459ZVU+HRlfWbcAABkM9PW3U4Q2PpgofTUmj38SnMoWhYO3mM
 TpgLmZL9jgXU2b4Z2gT1DpW/ON/EcePgIjqTOlYB3PasI0opDJaOtCBB5VefJJWQSbqs8e+LMWK
 nktwS0MkY=
X-Received: by 2002:a05:6102:c01:b0:7c3:3890:6076 with SMTP id
 ada2fe7eead31-7d64d70315bmr3465599137.6.1794867047588; 
 Mon, 16 Nov 2026 14:10:47 -0800 (PST)
X-Received: by 2002:a05:6102:c01:b0:7c3:3890:6076 with SMTP id
 ada2fe7eead31-7d64d70315bmr3465594137.6.1794867047079; 
 Mon, 16 Nov 2026 14:10:47 -0800 (PST)
Received: from [192.168.69.234] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb6443d700sm137877385e9.2.2026.11.16.14.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 14:10:46 -0800 (PST)
Message-ID: <13463a88-6ec5-4843-8af4-e68e27a1ddf0@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 23:10:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 11.2] hw/virtio/virtio-iommu: Fix IOVA address lookup
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com
References: <20261116173857.367638-1-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261116173857.367638-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4OCBTYWx0ZWRfX3yZIpokbpqYG
 JKydMy6ZWK7HbmNBoD89VQtemXG0SFyWbZiwYWWtR8aziw9Kfj6CCHWiL+FzQ7DFTdrpIt5MnKj
 feTNUF/HryrUVqZN9xr5Hk+DfjYoPu6ytDehEIHktD01D/bLskWMibIhX21n4xr+PAnGQRimE/T
 8wgWcBpTtBc3tgtti8kph0kiTSAAzWJLNWCKxv9b2VPVCMZBgCkNdNYup45A/HZjiEsilKFFWTX
 fvxlljDs8ie0HM2Thti0UghMcYBbjZZSGQlycAVQqm3N/XGso0Gk+BmvF+tCL7w71dJr6VDncPp
 x5G5R7l6Yrb/XXE0Bb63KqOlactYE1GuI6ZdijOe9MDrTgfpqe4/peNJ9LYM0iadfimCShkWq9x
 04rAuT00SozJTfwIfDw1aIpvqazRDpUWCY8w3ApJGlc0sX7IaEZ0VrbMTQ0keBOVxGm3wyvxHEO
 WnRZMObQ5kbPaZSKdAQ==
X-Proofpoint-GUID: sWKksH2WAiawXo2io3_LlvAsltVBPY4u
X-Proofpoint-ORIG-GUID: sWKksH2WAiawXo2io3_LlvAsltVBPY4u
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afb7f68 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=p0WdMEafAAAA:8 a=69wJf7TsAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Huoy5dzQn1gHJE_Zu5YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4OCBTYWx0ZWRfX0br5crwdnkp9
 8nZXyhw+dm0dBa6mESRDYwpEAu+8sTcMIZby1eWgPT3HHTQb5G/5kQrOgnHXupXHsNzt5DJ+zBy
 KkMasMm40l+UV1c+a3KlXhVcKmtkrDE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160088
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
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/11/26 18:38, Eric Auger wrote:
> The translation code checks the address to be translated
> belongs to mapped segments by calling g_tree_lookup_extended().
> This uses the interval_cmp() function. However the interval
> is badly formed with the .low=addr and .high= addr + 1 instead
> of both being set to addr.
> 
> As a result an attempt to translate an unmapped byte just before
> a mapped segment will not fault as expected.
> 
> Example: only [0x2000, 0x2fff] IOVA range is mapped.
> An attempt to translate 0x1fff will succeed
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4754
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/virtio/virtio-iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

