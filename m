Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78060606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 23:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P5Pffu5u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EkhzEmu3
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWirW-0007me-Kr; Thu, 26 Nov 2026 18:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xWirV-0007m5-Jm
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:26:45 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xWirQ-0002FJ-3O
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 18:26:44 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AQJw8xG3990014
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XRXYRRCqMdaJaqcEqo3g2mU/t6yHIVGrW0dxlCVs9jE=; b=P5Pffu5um1w0OlQM
 N5ErctICfa168LyuLTh7S24uO+2pV8AVZ37mWrEk2mwNRJypMBh8B/8qr5VwSjsc
 Rp8B9RjgcajjHE3bHIxPwg0g8n7/4AM0mt4ScpB39Li3xB/GsOcWGo3jUe6LTXtL
 4Ymup7vPTJdhNlVaRzyy44IB24SoyEivVg4SEDQVGhMnHhxbcw9YqngeAClnh7Wb
 zrosARMaDlJtUJ0daDi4yj7eNhexrG1VPcQDA17Cj/FobvmZDVYGn2ZXELz4HIjX
 dGv3p42DslRWo5cE83d3RYLqbJ/Fkh4XR8xQQlW/+3Bbld2X5hCQYuyt0uSxDRbZ
 91IVbg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak0427f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 23:26:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-3869accaac2so4486489eec.1
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 15:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795735590; x=1796340390; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XRXYRRCqMdaJaqcEqo3g2mU/t6yHIVGrW0dxlCVs9jE=;
 b=EkhzEmu3TkvqmKk9iRtBg402g2RcnYl+ulPmIc+uqVZDC3gr/XSEJ6P7hoXHapFpNM
 TMDWwiak4ZPt63fb1NCWN0A5xj/mf0GCChfaGmHxoFjl3MMf1JN47voboLFZB7Hb6NNN
 DFLJTMrgXr/Q3QA8jjWDiUYnp3DrvAKTaPQunCGygspFQCCOiERAF9PjLlwhUAESh0Wo
 O5MY/9MoDmZ1jJKfbJe6n6c8h4mBF/PWllJWMzsiLwwWvOpQacuuRa7Cj/CYH4u013k/
 thbwkiEu2qjB+MV5rV8MkfusqdAxZZWC2rVAuTV9+VH/oVJnUc0IjPFUssSSY5yePgth
 oJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795735590; x=1796340390;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XRXYRRCqMdaJaqcEqo3g2mU/t6yHIVGrW0dxlCVs9jE=;
 b=qfgLxV6cz6SDL128w9xzTky0vpQuwo8GDM2Dak1xuTLgLWMpz/Yf/ZUK0nTAw/Ngck
 hFEjjD4PsuyrIwUi6EAdd1GgQqOGbXl41rAa1NuzhKGxmv5D4Xez4t24Vs0ctI2kzUIM
 brr2Nup3DrnwaqiMMV8/WMAVMtZH3Oa1DEGwmeiNRdgoPHYkDAzQSzIloA1yhqwMj6qC
 NWthRDnTOZ25VZ/jA3rdV2rpo6JUOmiPf/6yg526UcnuxW//8q5275GXDU7vhbXZyFCT
 rlQqmiIsdIIOPtgthQ4iIvqhRPiETI4V7mNLlQuM45lkpusucv74nDUtN3pZ5X7yL8qK
 U3Tw==
X-Forwarded-Encrypted: i=1;
 AL+hErGJrMz/JKr7ZTc4b+jKw7IwHOiqqJ/cidhDBYOiw0trAoXXOuv0rjP0Vr3E+PGBU6/MnbvETj0hmg==@nongnu.org
X-Gm-Message-State: APuU4Z/FkrKsY1UG6luGCIdQCAjGDaazmv/6JnaUS0zjUtVg98vrJyrw
 GE5RIj9ub5XKkBJYwcfSwDxDQURlSwxJQHBlTnCVN4dent0gcq3b17YAX/C7zJMENdilvu4tYx8
 fLc12cyg0nG1uyrNXryzEMjdFhwrRzqI1cw6Kypk9qVW5YPUo9YKIMFE=
X-Gm-Gg: AZFdTZftosjf9JNpv2Ex1vuk10iaoe0jh0xRk5ZwtrNuXkfCGCNwmMX0XfXnKqzcnW0
 YD6V/lUDC26hJZgZLFhe7Xw+ivYlFem7v21r7KnlCvpn2cEB+R8aH3tCgyMoSIJ56A3nKGL51Zj
 FKJwUQS9CIWQkFPzIE1so5A5DG1d2cIK3JtpXO9Ni5jOlO8PnMlFFWkLk558EdgflLX9BKDP4Hf
 yLwWAM4okUGzbVfkrWerU5+vGPw5yyHK+8muMYfRxRCEvkxT3gNhMtkmgcdftP17Vm9JrMUWVPf
 i0+BEcyj4U7+o35NII9dxkwNoI9fxl0cEK9XXDXFJXrJhvXagPX1oBeLDZ6187K+CZ8kDqHaAur
 EfxVptpq9HV9lntorDvBrmiy5Yf9XJWiLYNI5/82qCMojVt4ChffteYbBlvR6cjPKq17xj5XiuP
 +A0oFDF3WQNf1dZBU0qe6C15RJrLtc8Km3GTKdqphSYyI=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id
 5a478bee46e88-384b3986edamr23208465eec.7.1795735589579; 
 Thu, 26 Nov 2026 15:26:29 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id
 5a478bee46e88-384b3986edamr23208440eec.7.1795735589027; 
 Thu, 26 Nov 2026 15:26:29 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-386b1965c02sm33756662eec.27.2026.11.26.15.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 15:26:28 -0800 (PST)
Message-ID: <ee8de7d1-ed91-4e70-bac3-860c78bf5f3e@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:26:27 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm: Split ARM_CP_IO as ARM_CP_IO_ENDTB +
 ARM_CP_IO_BQL
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20261126223959.62899-1-philmd@oss.qualcomm.com>
 <20261126223959.62899-2-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261126223959.62899-2-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b08c026 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=haWXIRxN-KZGYTMq2MYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: JDo3flxVbKkstUy37r85qt387E8C1MuU
X-Proofpoint-GUID: JDo3flxVbKkstUy37r85qt387E8C1MuU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA5MiBTYWx0ZWRfX75V0/rmF6yYv
 5L34gBGJQj6ub2vx0INvNj51FFldmYVYbdSnGUKPm31YgCxcC3pCS+OFMGp8Dq283yXOlb0HRDd
 1WgrDhKH1CLDLi1aLI/LWknTkjWK4QfREiNltXmqPQnQmFl3ICUbUmyAEURKMySMDNlUBb2qR/Q
 BD7cHLYqr578PpFRio7yGQCuLfRaot9whKltE+EeHUPSNq5qQiicTRiBlkA7vv3Ydwe/fAc4K5u
 veKrgKIN8orTRnv2rcwmUPtKQfxWx+xw++pWIZal/nQTBhlyJozwQBpxxH+oj02nZSli6XImVjL
 R7GwxcEvLKpqMKjODV/NyAIw2jzbqBYXJqAKqSHHuxYsY1RjImaMlFkiRqG7lviilvAJ+VRgBAQ
 RYUZZrB4wBqeN6FM5mc4ti620BKwqCorPAqy6XyKCnSSJE8GGrZWlOvym5fdux7P3qNydzwR0nw
 j2E3Ar5t0RRJVzS3WmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA5MiBTYWx0ZWRfX5RUiov8/pGLs
 gaH36tCRSIi32+4+ip0KkLvuOsu6ol0BaioOdfiOkFsuSl8xnfTJZ9kyT5e9J7qSyg0Qj00ET7W
 iBedIc2b4kd6KgaGk4Q5+6dsUYTjqAc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260092
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

On 11/26/2026 2:39 PM, Philippe Mathieu-Daudé wrote:
> ARM_CP_IO both ends the TB at translation and takes the BQL
> around the read/write hooks. Split it into two flags so a
> register can end the TB without taking the BQL. ARM_CP_IO is
> now their union, so existing users are unchanged. Update
> multi-thread-tcg.rst document. No functional change.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  docs/devel/multi-thread-tcg.rst |  8 +++++---
>  target/arm/cpregs.h             | 11 ++++++++++-
>  target/arm/helper.c             |  4 ++--
>  target/arm/tcg/op_helper.c      |  8 ++++----
>  target/arm/tcg/translate-a64.c  |  2 +-
>  target/arm/tcg/translate.c      |  2 +-
>  6 files changed, 23 insertions(+), 12 deletions(-)
> 

After our conversation, looks good to split both cases.

If I'm correct, we probably want to make sure there are no write
function on those registers, no?

It seems that all registers in next patch have only read access.

For the naming and bikeshedding, I would favor to keep IO (as the
default BQL version), and introduce CP_IO_NO_BQL (or CP_IO_BQL_FREE).
The ENDTB thing does not really makes clear it's supposed to be
thread_safe, out of its documentation.

Regards,
Pierrick

