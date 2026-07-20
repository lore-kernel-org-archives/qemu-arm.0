Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C01CC44515
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 08:37:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wljU6-0002ly-ND; Mon, 20 Jul 2026 04:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljTf-0002hM-I4
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:35:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wljTc-0002sH-Eg
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 04:35:53 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66K6Rn1e1263187
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 08:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EoSPOA+ZJNMwVNUGh69obVgrg11VnI1X24eVgPMkaX4=; b=j0SmpGS6p5E+hHi1
 LXfY50kDpSAz+ju6E8Uvgr86P0mXp7C2RLrl6YtDPhftveY4W7z68pmtVn30vR6y
 riV2m9I8z4sUGygHuHIBHIDMfNMQjFO32I6CxvJ1Yo+bdwPejgGrozM9JtN1lMOJ
 ptgiKaFBdeHZeiy5TqZOwrqzllV8B2ginWmP/qmo9SmoFE4CUK4zYkYxC1vFOenm
 QeKdBMZA4CwGCZypEqR0zBsQgyBHAGTbASHMzcQ6N1LJVphtkO/oemqf198DjDe4
 zkcJSYV0QZB0OacN0FPLZw7FvbuOx8KA+qYigYIU/XLN6a2R3NLOQOKRM/INjSQm
 9ZOp8g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhn6w8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 08:35:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-51c19493ac2so196067461cf.1
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784536549; x=1785141349; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EoSPOA+ZJNMwVNUGh69obVgrg11VnI1X24eVgPMkaX4=;
 b=FkK7VOa4n7O/VRxZCAvLZv8Ts4OBhlLFeV2p4qlWlObdgIHGV0godVavyAHg0KSbXu
 ddxuxkcAbxwsE1VnWuPaBJAFztUp1p165diQJO530wk48Q9WZtTPfhwKoLh9QjC0Bvd6
 Elelhy4pcYz9P/Yf49RRYzHkVpM2+95ncC0/7YL4t2mvV07fkgrBKiVXpZoWl+1nx5qH
 v882/fUYtb5mw5sNZPryWYon5nuEL1/XGisWIaaiDx5lGVX9l0MGdBfe0zSLDAMoEhsp
 POzZB4ZnitnIvVEcOj6nbNPKtrmgka4yeBVK60DWoARgIaa9bOJYjWGJ116mZF0MTK7X
 U9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784536549; x=1785141349;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EoSPOA+ZJNMwVNUGh69obVgrg11VnI1X24eVgPMkaX4=;
 b=X44BraoI8JzO/Zf3lE80NjdGR3x8A3kD5zb/jIfZRZvdRBaoXRg7G4azHiVIICBO0N
 7XpczGbgSv6rhUlz7CBvwufx0AEGsjMAF0ug+MjDoYCbSFtLhGaZzQ8TRJo7hco35Pr8
 LPJcLGFMkWBjhWPZ5iT7hLO2uNIT0BSxAfX6kl/mrkUYXh/puxVog7cN9UFHqe7ccVAh
 lWuofu/Ee4BAdjW3leDh7W8RuiQztN9ObUoPX0KjbzH+eTng1POybltt+MPbcEUX0S7n
 UJ+KckhxNh0gi+d8+bBcqZBe609zNfL1Z7VKTjcTruWIbJZ7BJp90SF1+/TssNukUZIP
 Hcbg==
X-Gm-Message-State: AOJu0YxzZPhsie3Zxd8KfkOEXn0Z4VZani0lyXIko/Va9HL4cy/0pmwg
 68JGCgIix6mZ5rpqcXg7oIXd0BtAOSlqyU3GFM5hY0mS6qnbdjQxZ0QS7ScG1HHZVGm8KKSkQae
 5vWi6U2o/A55naINpWl90zJmIol/5rLtca20fsOtR7Y+xO4LRw3Jm7/A=
X-Gm-Gg: AfdE7cmPz6zkwLJ7OLlnRW7VVRvmbzKyFb9Ys4kg+pKyCHKMON5BZOBdiuGncfR4g9/
 mdIxVcxWyN5kJO0vTG3piiMTUNnxeF7yXIvPSPiwf5EAjvbOK5MQj8tnymkqKA9DHPJytv+04Xn
 ewxjjrcvinDBkjrP4ld0V0D+oNEwt5azW3v0FCT+E791ztpSQTdGYskiUBT0126dXxKg30JK14i
 GnmaxqppGVlA1jxONS58JCLBUVfW0LDyaXOOVcUmndFTAcZhOve6vDnyPBtQGfJJw8z4KPqv5Mp
 XZvVT8N8oBkipOfFMvyz0V2lzda9ZaKgBW0LhTBpJ9dP+Os8Ye/BSAlCdSbKDZdyxuSwxsnVgIu
 853N9zSpt5yoiPeDgIE7joZv1mX7kMdKa2IsY+ikKV2DiNWq6cvs=
X-Received: by 2002:ac8:594f:0:b0:517:59a1:82cb with SMTP id
 d75a77b69052e-5213e28e183mr129316151cf.48.1784536549627; 
 Mon, 20 Jul 2026 01:35:49 -0700 (PDT)
X-Received: by 2002:ac8:594f:0:b0:517:59a1:82cb with SMTP id
 d75a77b69052e-5213e28e183mr129316031cf.48.1784536549218; 
 Mon, 20 Jul 2026 01:35:49 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4954aa1a231sm158979545e9.1.2026.07.20.01.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 01:35:47 -0700 (PDT)
Message-ID: <d714d068-874f-44e1-bdc5-0529188af176@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] target/arm: Split out helpers for creating MTEDESC
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260717232306.378988-1-richard.henderson@linaro.org>
 <20260717232306.378988-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260717232306.378988-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5ddde6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ItOpnQ4zye2zdj60azcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qntfmlduyB-pYu9ZryivdMilRppqUuFH
X-Proofpoint-ORIG-GUID: qntfmlduyB-pYu9ZryivdMilRppqUuFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5NCBTYWx0ZWRfX57vgAxqrlRNq
 gc6+DOYuHbH/FNSg8vB7uM8A+nFEwgrc/ko04r8e6F6LVPqnVtBQ8wxnbglxt0TwsW0kxbhCalY
 06I31WcyGk6AsZ37k2DMWv8xvjxLIJxLV/lLuZdxKlqP/O3KgpsunjZSJy+P6YEQoaIXrjLDGBz
 qAcjP0BH6gsNcdOnmcgd+3MPKr3EBVsp8XLDprhQAygR6B7Fz+6KeKal9Vw4ErFMWrKUosu8XBc
 7XmLPTMWBonqFZFMWiliWg1wdEE0TTmrNLno5S1P+WGuoYXagokVB8omcKhimr2j/rHpTRTYv94
 y/i0K3uiEKIXfyaLn+EquX7lgvx4RhwemW2cuOjzuZERXRGk6/rsPoqUEjymFgd/LU/LfijP2Vf
 /eUx2bV+OKmsUlXqtynN/oqlWaZUzCc50PSb2xFZaPC043rLvJz3fGkzuf70jxk2O61GkYAcHS6
 n7Ti0UdWS9Qt1OJKP4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5NCBTYWx0ZWRfX8xKEuSGDOagB
 4nNuob/QIOcJu9yCV0Yf1A8iEW9VC5C1UK/8F8yhPcY6FhvzDnSWBLN5RCW1wq/PwlG8aPCJMIW
 qEInsIy5lXBkBRMT080mlyXva7QulBg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200094
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

On 18/7/26 01:23, Richard Henderson wrote:
> Assert that align and size values fit in their fields.
> This results in more fields being filled than some
> helpers actually use, but uniformity is for the best.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 123 ++++++++++++++++-----------------
>   1 file changed, 58 insertions(+), 65 deletions(-)


> +static TCGv_i32 gen_mtedesc_xas(DisasContext *s, bool write, int idx,
> +                                unsigned align, unsigned size)
> +{
> +    int desc = 0;
> +
> +    desc = FIELD_DP32(desc, MTEDESC, MIDX, idx);
> +    desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
> +    desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
> +    desc = FIELD_DP32(desc, MTEDESC, WRITE, write);
> +    desc = FIELD_DP32(desc, MTEDESC, ALIGN, align);
> +    desc = FIELD_DP32(desc, MTEDESC, MTX, s->mtx);
> +    desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
> +
> +    assert(FIELD_EX32(desc, MTEDESC, ALIGN) == align);
> +    assert(FIELD_EX32(desc, MTEDESC, SIZEM1) == size - 1);

Why assert? This can't happen...

Otherwise, nice cleanup:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> +
> +    return tcg_constant_i32(desc);
> +}

