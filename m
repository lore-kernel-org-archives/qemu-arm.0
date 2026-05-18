Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41742CD4F3C
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 07:48:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOsiK-0003GO-LI; Mon, 18 May 2026 03:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wOsiH-0003Ei-EW
 for qemu-arm@nongnu.org; Mon, 18 May 2026 03:48:34 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wOsiD-0006e1-Ba
 for qemu-arm@nongnu.org; Mon, 18 May 2026 03:48:32 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64I7V9MI1898341
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 07:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TAlBJlB+HRzVkumPBWr+YGfxiq+qAumbFMSLdPDTjZM=; b=CqR2ABtYC/+o9B6c
 5XH8X6dpvVZ0KnbIh+naN8KLDZw3NS8tE1SGAcq3ZUL7XFz/dO5bdA0dBuTLXPOB
 nromFXkBU9vWLzZMkUsJ14XB6+Nusvi5X0Au9eAkbcqi2eTOdawfhFK+ClbACcB2
 CIQYJfQNJz77iUFAa9SaNF04bseNAlephDWsjLJBjq2s+9G8R+LXIiC+q0aBC8Ic
 iNnqSBuKqapGJV27PvC1zxVb27VVByMYzTFZolgPSHRISMrWUB4IC4sgmRmFlida
 KAiuxSxuDsGeHmlqHBV8X/Cyk906EkVmhn2HPopb8benhvBsqZg7Nn8TxXe2DC3x
 LvGFQw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw59y6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 07:48:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2ef37c3f773so1984505eec.1
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 00:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779090499; x=1779695299; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TAlBJlB+HRzVkumPBWr+YGfxiq+qAumbFMSLdPDTjZM=;
 b=H2oKQ9Z8I4b00ewkjm42f7AZnI196TAAA/z1szDg+DP0RHyDbwOYKPA2H5KF3n8rPV
 q0vcTlyBfHNAFiMFpsgxqYf0z6ZQtCHAj32o9vLfsNKUSUWIdxyXj8ZqZpeLVV7c691F
 VGB2R4QtbJbvr9ULv+kIJ6LjBHCzWfxV3+EcxNVMINa9LjomnLk/V7KPWiDGKLnlztGj
 ZmnBxckGhHvdP2Kmjf+jqmBs5Xb3g53EceQpVusMnkcn9F2oY6U+R+XSjyMu+ll7vTDM
 45sFm4og/oXkzjOC5XYu5OcjLOiytP/+m5fjijQYTpnoeIcn0oBk20MaKsK3h2DdZo2p
 b1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779090499; x=1779695299;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TAlBJlB+HRzVkumPBWr+YGfxiq+qAumbFMSLdPDTjZM=;
 b=F2xb21AWf7zI7HFXV05MIEW5w6GRqFaCtdgoL/ASygMCwAsomge64jsQXI3mNbABdn
 CnDSZ45bhDscYPBEsXdB9LueAU8f2cx4XeZhl5ZvwEwM9let4FxJiMHRqo3Nx+IcQlTy
 Hh+lzSCMA+xM/17XGRqsGu9wOu5RFPK1vxBVdfAxuid3pCWVtCk5sGPrQNDrn9TnQmUN
 7cqKvdj84ueihDm1i3EkJXFTX8Ewn0TQl49/bdlPixxH9dDHa/SHVJIpQMkFyTiYLdhv
 XDycBeLHDF1bGwrmzGYGACSTq8DcnENjLpryPMcuH5P7iFCq3hi6E5sVszD9SCKd8H+/
 XI+w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+l4F3eCs65HSROaiCplhnztPqU6zDBKjIvNMti5weJ8/lgfsI7CdeSqVi7aY3HCL9NTr+6oijFXA==@nongnu.org
X-Gm-Message-State: AOJu0YwTrzpYXPfCDvx5vFLbB5XC53zdoXvBWI6LKnVydK09ZAuEt2Ui
 WbGuEF/9+grYTOUJRwA3ewebjhmplj223IIUL8Fki5dwkX1H/rhjhnp3Z51ERiP/Y45OC2vfyx5
 KpNtCwFV1yAx7aZYLD6WB09biE8bXMBq4krTEVRgeja15VFUrtqiNvPo=
X-Gm-Gg: Acq92OFXbYQsguWXuoeId2wYJh5EtC7VyqQVhbIKgdHFqOapCZCWHSojQObkwDaeO6I
 F/f6wXHsu3+lK97+X0ZX63XAd/456mLmOdVosCcIEWJjWL+I7SOdIvxVePty7ooqVXqqKB0mjYb
 vGoggHGW0jLu098oXKoXzqUHzbgVXZwR9Y4BKRpafK8dUStJJjy8+oRUlE+3CSYglnNn2KJylYa
 j/7TUhIVxX/Hi5iHyQTf8AGehTm8QV45ymM62zyNTTHlXP8MOCwL9xNRKvv4oiYl6b0HBX86Tr/
 5e2+1WB2fmNKEOaqpc2b9CYrvOoaK+UNZraD2v0CPTu1WDPbXsgFpir7xnTfiOILJT2oPWP9HMp
 qOoZuGdZFBkLROS03posE23MbCZbadmisjjlMmVFOwhffQhdxdRl0+VoJ6MWB61eI5A==
X-Received: by 2002:a05:7301:1004:b0:2e6:e916:70ff with SMTP id
 5a478bee46e88-303986a0ebemr4839344eec.28.1779090499476; 
 Mon, 18 May 2026 00:48:19 -0700 (PDT)
X-Received: by 2002:a05:7301:1004:b0:2e6:e916:70ff with SMTP id
 5a478bee46e88-303986a0ebemr4839324eec.28.1779090498905; 
 Mon, 18 May 2026 00:48:18 -0700 (PDT)
Received: from [10.11.7.97] ([50.238.185.218])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30293e2ea6dsm13451082eec.4.2026.05.18.00.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 00:48:18 -0700 (PDT)
Message-ID: <5053ba4c-01eb-443d-b364-50a32be41e26@oss.qualcomm.com>
Date: Mon, 18 May 2026 02:48:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/21] target/arm: Restrict IDAU interface to TCG
 namespace
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
 <20260516171524.19184-12-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260516171524.19184-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3MyBTYWx0ZWRfX7aDuVR/bEAPH
 On1eFKJjS/Peje+8RVrNTbpj2a4Btgyz4/NybO/WksD+dBNgksajvOQYXLtraGETmOp8WZSlZUd
 c3UKUhdtGM6qzvyFHb0wKSR8qbtimUBOS8lYU0kkOKxQ2h+UimPyQKjhCpfieXo4ZqScn8ANzgC
 XmWvapzPpRAAsOzBPKcXMCtnPQBtL65lJ3X61pULk6LztVFeY3+iCUqPzuJCqThJraFCjEM1EqU
 LSWdmMD0rGRTsKgZMx6zBcbjZqpJpbqOsVw5KJLqPsY9ukup6/mTIKLzchxsoiVQN9Eg3T/aI5s
 zkEe1HgQ2bU7lot0A0NZL3Q9VzsMyn5QeOvlgA8G6Pr92Eu1r9zNLoYVrEmnMFXO/WtzDfsxZnV
 VPcqtQ9KOR91tfdEJm0DmPzexxn+9erFG7vx9zZSjVWAgO3QPKnuWE5y74NTcWcOZzzMF2SSDAS
 0nNA+90KZIeO0avEDvw==
X-Proofpoint-GUID: 5GQxgr0jvG7AP_bEsQGlA5bSLMSHSXe6
X-Proofpoint-ORIG-GUID: 5GQxgr0jvG7AP_bEsQGlA5bSLMSHSXe6
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a0ac444 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=+WjNtiTvTqxFfZe9JAS8OQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=lYet2qYnc6s8ltbzrrIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180073
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

On 5/16/2026 12:15 PM, Philippe Mathieu-Daudé wrote:
> Emphasize the IDAU interface is restricted to TCG by moving the
> header under target/arm/tcg/. Move the definition to cpu-v7m.c
> which also contains v7/v8 hardware (NVIC), keeping only CPU types
> in cpu32.c.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/hw/arm/armv7m.h     |  2 +-
>  include/hw/misc/tz-msc.h    |  2 +-
>  target/arm/{ => tcg}/idau.h |  4 ++--
>  hw/arm/armv7m.c             |  2 +-
>  target/arm/cpu.c            |  2 +-
>  target/arm/ptw.c            |  2 +-
>  target/arm/tcg/cpu-v7m.c    | 11 +++++++++++
>  target/arm/tcg/cpu32.c      |  8 --------
>  8 files changed, 18 insertions(+), 15 deletions(-)
>  rename target/arm/{ => tcg}/idau.h (97%)
> 

This patch creates a problem with the (now merged) commit:
8d3e31c0d575b3265ae5cacfba10680718ba5a22
"target/arm: Extract IDAU interface to its own unit"

Indeed, it results with TYPE_IDAU_INTERFACE being register twice which
fails at startup.

Maybe simply drop current commit?

Regards,
Pierrick

