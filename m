Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC76B606A31A
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Oct 2026 03:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N066n8q7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CdOKYTZl
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLXtB-0002PS-IY; Mon, 26 Oct 2026 23:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLXsq-00029Z-Ne
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 23:29:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xLXsp-0008JP-4S
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 23:29:56 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69R2F2JL512082
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 03:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VyP/oAu8PP8Xz0Xs/k1x2xnWMK01hR10s0O2XqB1fpU=; b=N066n8q7jd0NJuRp
 o6lBuJilO0MP0544tQ0jNhDyeVDkGBZ3en/HLKXC/IXdnxcmGCJi9dDPiFXRskde
 VhgR5Boht8YaQ0FMJbtYnEmT7m09bxH/GPiznLQbtiYgKm1scfLlDpSLwVFYhvVs
 UtRF/bO4GyyEofOEwEfL60WTeHeKlmLSxTWnXBp6OSLmHbYljhT5rpMvnpC2pnEt
 OHsd6kbwebazqxZ1pftsBtqTrEK6dox5YWInRwj/ztpAt2AEgaGuvV1uwsk4+/9Q
 TRlmY3hlI1CUqka9s3/P7sm5KxTBMVbWo9tMVjvgsZiw729plUxr92psDFLGXBcC
 Px5qFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cpbm96-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 27 Oct 2026 03:29:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f20addba1so732076885a.1
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 20:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793071793; x=1793676593; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VyP/oAu8PP8Xz0Xs/k1x2xnWMK01hR10s0O2XqB1fpU=;
 b=CdOKYTZlTZoCHpdgm4K0JEdIKbadlkvyVsU1P1Fa/TuRyAerGXbokIDgr7mJozzyS7
 WpBd5Ogq85rPP8fXeA2NnYEds9BNx0DiiGQMt23+4djhNJ8eZ4Hy+BdL2jZKmGcusInF
 QvXMJZioJXCZJD7cZtj6QurD42FAVBqpMbPJpydumZ930NnAAzCdWe61Y2LO6OaZGDEp
 dNFZixDzqegHV/ZKPLLqhZnomWdBA322t8qSIqYgJP0DVJFV3W0aHVS32k+bohKR/gOi
 DIFBLjI0c74OO8trlrM/UpBFEZtmoev+Wvptx+P2byWqlMHDbDM2ba9wPejpFBBIJzxT
 xvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793071793; x=1793676593;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VyP/oAu8PP8Xz0Xs/k1x2xnWMK01hR10s0O2XqB1fpU=;
 b=kEMB5j5UB0vwtUc9PWKzImdbnDtTjdn+1Mu6nruicRw3o0R657xRqwlfG7eBAxfWsm
 GeAzvHs2OlaTlvg4kGFyIXfQdvTM7fXqIIdZyBQiw4EnXDsf1HrFsmU9Yd19FHzao9Gz
 qSagT4ODcav6r88r5mV1kYAsWAEQ7dhhwZZmFJ8Ec/w+CwQVzf3M+CzOGfhoenvNijHW
 Yd11SoWcIgdRcaqDdFF/Fkjt+2R0DaK90bJYQysDYHrniGFhqz2i9ezZq9Y23dBzXXb3
 OJgqf5ntHFEQbwVfUbkDDMDYucPrNwYZ6r2kJW/z34a0QStn74D4nAnRN8QHWFiDQ4pS
 VBYw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwbZplDkhkWL3YyKrs67LVV+VY2eNDsww7oIhBoQ4F85O6ut25V10F8vnSr8OVMjS6Sy8k6cvSMTQ==@nongnu.org
X-Gm-Message-State: AFq9FYLSwPTWMpbnKw9yLtnaHQPUAi6CZY1SuzwBB6tiafqzfQyt45/5
 L4G4wo+ojTkJ7iv1luVHNfMfuCPPpLbuXoaTAAs1mJl/RFo8EkgcdD2Lw2w3zZ9pfoVvQ7BFigO
 +SOl70PvOyL9e0QyU/WEkwSh2bMgNUNdqryJlwAAN3Q/5NbKZpUucrPM=
X-Gm-Gg: AYBFou13HiPTJ3UTwfU1ERQYdfjhIrg7h8xJkEpHBnfM32ElBaVpz8k2qaZrD4/P/KT
 6Rg3hYsIn2P9AmEVTVQyIAkSi4bTwO27zCCbyJbi5swq7Hnm6aw+1lMnSyzx4l63gkc8zr3ZSfr
 ritPmfagXqtE2Z3h9hc8guMYEddx0lKil1w5tlxkM7rOJrNOJ/g+0r4XeaoC+QFjh1g2akLbvd6
 Ber/T6XJbPc2lcaSGtdhAsfssIvwjNMAHNVIivAjcTOJVLAT8teBxovo96uAOL4e0Zl0TMwUjsI
 rfRAjq6tjUE0sezTO1ko/X3XcbQm1gqQv5o1B9+QuREEcPDa3Mp0mV6VStOoTHjdiT0mfwZ0N0O
 Fb+vuzlH4jLKF1aOj3vujp8Tf0avvB0m3wQ==
X-Received: by 2002:a05:620a:4010:b0:93f:22af:cce7 with SMTP id
 af79cd13be357-940ef7af322mr1306041985a.12.1793071793516; 
 Mon, 26 Oct 2026 20:29:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4010:b0:93f:22af:cce7 with SMTP id
 af79cd13be357-940ef7af322mr1306039885a.12.1793071793069; 
 Mon, 26 Oct 2026 20:29:53 -0700 (PDT)
Received: from [192.168.69.230] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ecd8dcfsm19849990f8f.50.2026.10.26.20.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 20:29:51 -0700 (PDT)
Message-ID: <8012de2a-0de8-45c1-8890-f0a1f495ff19@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 04:29:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/14] hw/arm/aspeed_ast1040: Add I3C as an
 unimplemented device
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20261015055642.106204-1-jamin_lin@aspeedtech.com>
 <20261015055642.106204-12-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261015055642.106204-12-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxMyBTYWx0ZWRfX3cj4TlAwMjHK
 Dn9v0/6+zS3ktrPqV4+MGAm1zHzet0PsE0S3CaxeoUsmXubIiLWm64QA1Z5NvJ78MweyFj5pVIS
 SidcrnPNZBy0AGo5t6kgiyjTjraRtBDNhvL+Xb4j8ZKg34/oRHLudDfHD1TmMPdiOJnFPSkCTIN
 7eetA8gXgxyXuZsU7A+kOHvzXEdVArwUafe4E6nM0u7/jD8s7xwmqjxIgZhxM9Vfx86YlDfCYeZ
 yLyiBJpHO5/x5d9t5+OQYVnTSejAvZVAm6nZPphyA4morz7EUvb8296JQUIr0oVbVL7zFpzjD+v
 TYBWqIles3FykgMEY9AhDf4Qk1LAebDkpwWduZL3//xtU3JIYuwshv1GgpPdWZpiYW7FMjzc5Ai
 G0w4GpPhVvixzvRuVQPbji2RS6OU4Gzk2b8kQ77vGgqxqu3iKKVUYOkD/JswHaDgWNOqhZmd2O6
 izcXur8PNA9xnEpVmzA==
X-Proofpoint-GUID: -8UGx416ScqvR2Fy4orwnSawXFU6CUF7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAxMyBTYWx0ZWRfX4Qc2n82gAnGp
 6Rzz59ramv4Kt/Eg0zxG2hERqf+A9QRuCxiLJRYNLwB7kmYsqGeII0skqVzLJp7LTevfpNZyzsk
 yumKIHA8Bd+SOKMm0bDK4fLbLk7MJ5g=
X-Proofpoint-ORIG-GUID: -8UGx416ScqvR2Fy4orwnSawXFU6CUF7
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6ae01ab2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=DD068z39KEkKQDAZABgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270013
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

On 15/10/26 07:56, Jamin Lin wrote:
> The AST1040 provides an I3C at 0x74c20000, but the controller is not
> modeled yet.
> 
> Add the I3C register region as an unimplemented device to reflect the
> AST1040 memory map.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast1040.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

