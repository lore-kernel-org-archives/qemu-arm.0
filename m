Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21335C982F1
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 12:18:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8cxs-0007gA-2Y; Mon, 21 Sep 2026 08:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8cxL-0007MK-Oj
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 08:17:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8cxK-0008G8-4S
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 08:17:11 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68LAduBE1926537
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 12:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jHfQbq7qsagH3eNaMOGuXpDFJz+kyHORcU4Kkz+aibs=; b=CQ4oFCo7H1nWbWnH
 bITtFz+2jSlVWBT2SfRYXFa4UiHoM0nzaviVrbnH1a5+ataxx3PdLZt4UFF8QkX7
 DDOLGhn+Z7vGmuqqoXJ4TWYCvLI9dx0BpV1lbRdiX5K4aVbR64oQLegxkleP6VtY
 DCwV4zMA6i8TkynB6Ka1smk6bdWcKwkdC5hQ2aGzqWRPD9oJJC4Q6DMnW9b8/vNQ
 VXBf7d0OXcSpQ+ookiLhKjdOk9Fg7b+yEIBk95gpAOH/LZ0EGgUthnDokjSxjzx0
 /zaKatvAttTul++Lb8wxuXvYqVui3N8p836KMJLKCoI/SJ8fV8ZJEbqy9Y96h/bN
 uCC28Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3vaa7f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 12:17:08 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-983310b2d52so239748241.1
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1789993027; x=1790597827; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jHfQbq7qsagH3eNaMOGuXpDFJz+kyHORcU4Kkz+aibs=;
 b=dFkUQVZpIX5blE418ECrIPnFP/lJDF4omH6/Xh5idPly7SqS2fnEbJZHN7ykTKkRPf
 86Yn8bLd19RztQEkI3zYpcISP7e+JzvcnXINqEHv19ZUSGJuXR5QQ24UjXafAwTR4Rw6
 Oonh8iGZrXrr4wwG1TBgPyvuh3XVjxMzAObohJzOYd5fKJqDM0KNfCZMC6vscaAK0F5o
 DxF+UcDuQGBq8OUH08qnTjbCLJXJQ4iCFj0oXYw0VDQhynRwc9dRQOV7sk2yNvghMXYi
 gPklZhmgXtL/51Dl0XZPmDmPhr3uOYjIiQWpxGhId5uvdEVGlgooJdw3JTvhCwc757Em
 o42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789993027; x=1790597827;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=jHfQbq7qsagH3eNaMOGuXpDFJz+kyHORcU4Kkz+aibs=;
 b=QmeT1p+4q9q/CRkfUSxGOYRj7lNiCTRIHOOev7B3c0hwSGgQ/JDUNvk780tj/jg5jd
 BwDqSJXrDx6WLLnYoWWgGgiOhpKJmKBWdYHK6MCDDmtXWPPmhryUlAtjhihJ6QYk0ltc
 LHzl9FMVbygo7M4RdUZyvyrEYseEJka6FveWt+Kq5TWJJAi51hfq2YGMExWI52VPMJaq
 JQ3OsD248Au6l3+IfgfEPPp8t0Qg3FlUv9WyXluLicLzi1lJT+wchd6jH2cVDY0WGz4h
 /qE+C+y8A5XbOw5RLDHw8PK0hIX+0s5HY4IcKYOOsvwRh6SHJ5hDLkdPxWzpMZ3bgpEJ
 d6tQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxBk79osnKN0pBDN76z0q+ezUCxyqGklX2m0CNIDKPJBOSi4NpNqTy/M1B0asgn/CCKcrpJgOjXpw==@nongnu.org
X-Gm-Message-State: AFuF++mb+x+mazyvQOE22bV8lyUNPmvDeJAbsgXXPZygdU+kjBkf4DJH
 AT5SrlIcBRbeP1S/5AoE0jeFfkMW7XLpm0viTJ0DjkrRDiG+hvO23rI4HZQqECH32/fIxDjwoct
 nUvO2+TQ1ikGU0SQ6pOUGjjkM5mNqIYfNrLzKaebmWDakpefDunStnQrN07UgQCc=
X-Gm-Gg: AYBFou3gVn0O8Fl8xgUPasXwcBx4JYzG3w4jzcUzgJCcEpyfCQnnv6Cz82PhCniquuf
 WMxjW+5IoFGPAh2OP9rCHh7uknolWoqbcKJUW0JSJMFIsmEaCm1QdduqcOwM0AswqnOyB1XTEDp
 mrHRCaMpfXZwY1inoIXvTmiSPHs5E+hQc8vTRMyvNsJbgTV3efz9T6R0+VyobIAocu/hCAyTBDO
 Zsrrb+sCemm0Q/AAyKkoe5EuQqB+mZFN0HfjuNj7b9GLgmCHbisybf1jwVhmnqYEznb/CwJnwpE
 W4Wv2N00ZWbubtiI/rGBCdut8oGfvGuIkBpfSq1yVABQtrY+CnTaB/8wf65lfcSis0vCV/HWJo5
 YH3zMRSQjtxv7lOcR2AnF5n4Wdke12HWSUA==
X-Received: by 2002:a05:6122:d89:b0:5c8:4831:1539 with SMTP id
 71dfb90a1353d-5c9b58dbc15mr5052760e0c.5.1789993027461; 
 Mon, 21 Sep 2026 05:17:07 -0700 (PDT)
X-Received: by 2002:a05:6122:d89:b0:5c8:4831:1539 with SMTP id
 71dfb90a1353d-5c9b58dbc15mr5052685e0c.5.1789993026908; 
 Mon, 21 Sep 2026 05:17:06 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b8c78c1562sm1928099e87.8.2026.09.21.05.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 05:17:06 -0700 (PDT)
Message-ID: <8c7d88e5-44c5-4b22-8983-2dd9af9d8128@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] hw/intc/arm_gicv5: Pass CPU index to CPU interface
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260914160020.327787-1-peter.maydell@linaro.org>
 <20260914160020.327787-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260914160020.327787-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab12044 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: NnJIt6kAWdB8qm0xauy2w-PD6YkAPBRe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NyBTYWx0ZWRfX78872QwA58F1
 3nfvDrXED7dSUO56ljH/zvNRdesfB4P4Jj9qnp+lMZC0BR6X6G+0ZJwVZx9hQIRQ6a0RzVyJMgL
 IRaecirOyU4DFEwVzA9yeANNZqJDVKA=
X-Proofpoint-GUID: NnJIt6kAWdB8qm0xauy2w-PD6YkAPBRe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NyBTYWx0ZWRfX6BTu1Wt5Sysi
 lcTAcOdzqRnR+dKjky4Pr61xomS8BPbIS+6yFKg2RO54FlktdpBjaCGc4zhFiOjhiqIzclxH69n
 h0nq977SxunSRhDLj/plPr4G9PkgEik9NxVb6atz2hTsh+h7L9058tubA3R7M0sKsdtp55iEFES
 5cKqoBF7bxYtpn7lMru9cHe3EChf7wUTmtyoiyRjcZ0Df8xDNiXeAPOfRifvpSUUtb70UrHb/7M
 ddZTkm4jppp1JVQRUyOhAMc6xVIfBG58p92m0wdEPyRveu66VL4CXk8dFBoSMxUS4SENA4OBwXE
 RZF8JV4NySNb1kGWqPzAElMaGLykaYHFajJgO9kKdsimkF0Mr2JMKUSBuRkYL6e8WEWgaUcth6T
 P/MnBr/lAnJaHp0xXcgC6ezt1D2IE+eFPC3wfXFGLcPLAWtViXEjMirwSWnTlnBnt0nqKH0N9lk
 YSbAQMKrL20Qveyk3hQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210177
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

On 14/9/26 18:00, Peter Maydell wrote:
> In a real hardware GICv5, the IRS knows which CPU is talking to it
> because each IRS<->cpuif link is a separate 1:1 connection.  In
> QEMU's implementation, the cpuif code calls functions like
> gicv5_set_priority(), and currently we usually don't pass anything to
> tell the IRS which cpuif is making the call, because mostly the IRS
> doesn't need to care.  There are a few places where it does need to
> know, notably in gicv5_get_hppi().  Here we have the cpuif pass its
> IAFFID; the IRS then looks that up by doing a linear search of the
> cpu_iaffids[] array to get the index of the CPU.
> 
> For virtualization, many of the stream commands which don't currently
> need to say which cpuif is making the call will have to start doing
> so, because changing the state of a virtual interrupt requires the
> IRS to look up the VPE which is resident on the calling cpuif. This
> makes the IAFFID->cpuidx lookup seem increasingly awkward.
> 
> Change gicv5_set_gicv5state() to pass the IRS's CPU index value for
> the cpuif as well as the guest-visible IAFFID, and make the stream
> functions identify the cpuif by CPU index rather than IAFFID, to
> avoid the unnecessary IAFFID->cpuidx lookup.
> 
> As this is now three GICv5-related things that we are keeping in the
> CPU state struct, we push them into a sub-struct to keep them tidy.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5_common.c         |  2 +-
>   include/hw/intc/arm_gicv5_stream.h |  6 ++++--
>   target/arm/cpu.c                   | 10 ++++++----
>   target/arm/cpu.h                   | 10 ++++++----
>   target/arm/tcg/gicv5-cpuif.c       |  6 +++---
>   5 files changed, 20 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

