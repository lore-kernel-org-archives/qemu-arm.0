Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EACD606A31B
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Nov 2026 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZjowOQOY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IwPv9hQk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOZeJ-0003DU-OH; Wed, 04 Nov 2026 06:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOZeH-00039o-IJ
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 06:59:25 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xOZeF-0007Lq-Ex
 for qemu-arm@nongnu.org; Wed, 04 Nov 2026 06:59:25 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A4BZrZf2284159
 for <qemu-arm@nongnu.org>; Wed, 4 Nov 2026 11:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8aX7FSyrSVUBULNEkewaXvKE/6wVPdeTnuuupaou7fg=; b=ZjowOQOYBBSR263D
 hm4HHXMsmGKFou/UCU3UdIjVBJkGWK/dLjPhOOfTIsOi2Fs7iqmSFnQX4mztOGm2
 QJemMcneNqmyL5B7cb6NDJuekODzvuIOIamW2uwS3zlxojwJSDpgSpcYTRqOh8Be
 Nf0McVoGXFsv4RJD6cG/lXr6E83QjNBXL8YuyXA5Ra0/OYpPObWeJ5NOHUa4U3KL
 Q26B/LQf/jgNT5fYtn+PjtnI4nP0G6/Co2D8xBl+9pDJ26QhCcXWbuGWHdFFOhFd
 cUTOxLOfYWSVDNS6BoSFPO11Q0M3HJZjAIZNzjeB1UBveE5aZPby0chqw1Q2zTYg
 n77xZQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284rh3t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 11:59:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-7cc694cb4adso113005137.3
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2026 03:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793793561; x=1794398361; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8aX7FSyrSVUBULNEkewaXvKE/6wVPdeTnuuupaou7fg=;
 b=IwPv9hQka54T9QTBSwG6yslEcxai3jwAvQFuYmnATLLku7xsCxppgxjlE+ZvMLs9ov
 ziaRHzSkkkkUwz6Wo10l4uau8i7YUtdhQztZjDJs86h8dSLLgbbPdngaoGUsffCm9nkk
 JptQqrx8GC59vzdeuFeVfujIAwM5fw9zfqSCUTxzRxht9u4sUxLuh24DZxcSluglwGaT
 u5PwfOMY1FnVQG1fWk94Qcl8sWbkrSEeOBEnU9Ji/xBoPpnVop+iHUDHQYVKqX3YYLX5
 jecwt+u2hsrNpPMLKsE7eGh55qdfkJ/PcAZQcKwj05rkw09BkBp39BvRAYtnOG2QmtqK
 sKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793793561; x=1794398361;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8aX7FSyrSVUBULNEkewaXvKE/6wVPdeTnuuupaou7fg=;
 b=AgRtN63QJT2aFgGeu4HfnycBsM8OPtQyhPnzQZc6FnbMUV56KQhNuNM+4DfPWXFczk
 xJZ+p8Xc7O/d9tJ0WsdKAGHHJN2euRuYF/Wp6UgSYBoB6IJR9LhVEe4+yNwPYwUXnSEb
 uUAmduryGiWv+HKLztV1YL638gmlVk0uoCTwudHzfD9pDO1/RZMW+GVnqgsppBilBC31
 69I4C98bgFnwL6T1PyHesJ1LkMjtG/mKzr23kiqaY17JZUA5GYWPxe2r2NnJunPSt6kU
 IdkT2v9Xigh8uf9PkaRFnIpp4dxE1mxyWPmtNsRIlz+nfQPhFqKroRbp291VGlltmwed
 6GfA==
X-Gm-Message-State: APuU4Z8/l4bjwZjJb/9sbzGto4O7vZTzmRMkuOwAs1jqxc0mezKY2wAC
 GZHUyaCRm3YN5a3NT7/Vjw5+ZFPYdVgzDUR7OvxgH+d3IcDq8julVf79F/Q8GiZvXK8x3WDmFKq
 z+T1PPm63RaOqWvRvXHBKtLOyHpHAdIG4jO4YpIC9CqcfKsCBlRL4Z2o=
X-Gm-Gg: AYBFou1Y+QY0IEz08Wv6OfCbg/8UbXKZd9cBzKnGMpmCowcpYeCOvTxDAbNY2ei4nmG
 XfdLy2SWh04dVtLoKwSTz8+WBSA76qhrzEk0oBsncL8NSBm/7JzHlrB/rzWx64DN9byoznwYoRF
 mpYB6w4Da2Xa9f3hy6vW7i6tuf0xutLVNeek2Xy8+9BYzcUN4iiIPh2kYtKncscOHxB0RZKUY5W
 BwgBdAAa0MwXAH15OPJOFeLnWbKjvafLxoRZIbVbED+XrnJ58XFc/6d29q46V2G2QYJcVGaz/9O
 f0gM3S2k82kS1F3QTEY09nYQFyQeUaxSFrcUWZNtErHz4PN/9tp2NoQTMyV2bh+s/PrMiHxR4G8
 yJ38d+GVJ9vmxAeRDOfTVZ7AskrtDvcNKJlwTceo0k9No1YQMJdZ8Dg7VNAGIUxbDXnkxAC7zqk
 W/MPD0Cw==
X-Received: by 2002:a05:6102:5126:b0:7cc:56a:58e0 with SMTP id
 ada2fe7eead31-7d0725e16d4mr4836947137.21.1793793560539; 
 Wed, 04 Nov 2026 03:59:20 -0800 (PST)
X-Received: by 2002:a05:6102:5126:b0:7cc:56a:58e0 with SMTP id
 ada2fe7eead31-7d0725e16d4mr4836941137.21.1793793559882; 
 Wed, 04 Nov 2026 03:59:19 -0800 (PST)
Received: from [192.168.69.229] (pmd666.hd.free.fr. [82.67.153.177])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48fed552aaesm3695920f8f.40.2026.11.04.03.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 03:59:19 -0800 (PST)
Message-ID: <30ef7862-98ba-49aa-822a-677fb2258d9d@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 12:59:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2 4/4] hw/intc/arm_gicv5: Use correct type for
 value in lpi_cache_get_hppi()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20261103172616.2400758-1-peter.maydell@linaro.org>
 <20261103172616.2400758-5-peter.maydell@linaro.org>
 <CAFEAcA8X1ARhpncsz=kE2JxFjALGej4ycw3hus=m5kfcVSJXYw@mail.gmail.com>
 <50dcaa06-1f02-4662-8c4f-9ce2ab5e923a@oss.qualcomm.com>
 <CAFEAcA823iF+bJGd64VJ8oJYsWf1tTthrifWea3ECRS4tx9cGg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <CAFEAcA823iF+bJGd64VJ8oJYsWf1tTthrifWea3ECRS4tx9cGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb1e19 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=nz36NW0qrpeEijYxj/H2Ew==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=69wJf7TsAAAA:8 a=6aJsMt4MTb09bz_f13sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=cvBusfyB2V15izCimMoJ:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-ORIG-GUID: KRBljbcgeddJn1F3V31clyoJ9EpDBPLM
X-Proofpoint-GUID: KRBljbcgeddJn1F3V31clyoJ9EpDBPLM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NyBTYWx0ZWRfX51TeNx3lfdyT
 b39mDFaeLpiuowSQ2eDSL30AY81aFk8UNWcKvZn1Vd0dftQlH3J4pBDm3YtAeGkNhZRShysvQrE
 ATLsdEDpq6qsZLtAaPUDhfstHxh1FTCq7f3ZoiU5Fux//e7npXQKuAooiAJAwz45LPsbrNo/cle
 Fa2tg8h2kXUPWHSkLlKqt/Z4FOnbMx8gCntPJgNERKxflmJq+iWPzZOEFc3RJKe/riNCXhrWwD9
 UUI4YpxnHFFouVM5LGf6rXyIggtbTfxLG+2ucV37ZoGVkEPqDIBO6g711bS8ntW5TH3AmeLhFIk
 PnTP0mvyRPLIpYchli5zeL+4SuqmeY7cPVJSiRoOXnVB7VGMAEYC/+NQfhfvRXXjJekF396PF8a
 APFLgBMhY5Ccdsh+YvffVNqt1JIgUkUQqPbuhC9oT6qdUmKHqtAhCVCQw/qsK2uUXOS9T35BwqX
 rld78wehMPtqgf7OSKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NyBTYWx0ZWRfXwuJUIyyHsDQg
 pU57Ncv9r6Srnd8w5K/8Ig0uo4G6k0mvA3R+HecDt9OWQRD1Aew1fOkNM+SabbxuJUXAcBTFr3F
 OIwYgc3kTk6k/jrtv4zgifIRyPWMtWc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040047
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

On 4/11/26 12:46, Peter Maydell wrote:
> On Wed, 4 Nov 2026 at 11:24, Philippe Mathieu-Daudé
> <philmd@oss.qualcomm.com> wrote:
>>
>> On 3/11/26 18:49, Peter Maydell wrote:
>>> On Tue, 3 Nov 2026 at 17:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>
>>>> lpi_cache_get_hppi() is a function we pass to g_hash_table_foreach()
>>>> to iterate over the LPI cache hashtable.  This hash table has keys
>>>> which are GINT_TO_POINTER(intid) and values which hold the L2 ISTE
>>>> value, allocated as "hashvalue = g_new(uint32_t, 1)".
>>>>
>>>> The function is passed the key and value as type 'gpointer' and has
>>>> to cast them to the real types itself, but it incorrectly casts the
>>>> value pointer to a uint64_t*.  This works on little-endian hosts
>>>> (since we only read specific fields of the L2 ISTE using bitmasking),
>>>> but won't work on big-endian, and trips the clang sanitizer.
>>>>
>>>> Fix the pointer type.
>>>>
>>>> Cc: qemu-stable@nongnu.org
>>>> Fixes: a0562ada75e ("hw/intc/arm_gicv5: Calculate HPPI in the IRS")
>>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>>> ---
>>>>    hw/intc/arm_gicv5.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
>>>> index fd6456cd8aa..a362349e5ed 100644
>>>> --- a/hw/intc/arm_gicv5.c
>>>> +++ b/hw/intc/arm_gicv5.c
>>>> @@ -390,7 +390,7 @@ typedef struct GetHPPIUserData {
>>>>    static void lpi_cache_get_hppi(gpointer key, gpointer value, gpointer user_data)
>>>>    {
>>>>        uint64_t id = GPOINTER_TO_INT(key);
>>>> -    uint64_t l2_iste = *(uint64_t *)value;
>>>> +    uint64_t l2_iste = *(uint32_t *)value;
>>>>        uint32_t prio, iaffid;
>>>>        GetHPPIUserData *ud = user_data;
>>>
>>> Looking at this again we could also make the local variable
>>> be uint32_t; but getting the type wrong on that doesn't matter.
>>
>> Should we use GUINT_TO_POINTER() when inserting in put_l2_iste()
>> and recover here with GPOINTER_TO_UINT()?
> 
> You mean change the type of the hashtable value from "it's a pointer
> to a uint32_t that was allocated" to "it's actually the value" ?
> We could do that; we'd need to update L2_ISTE_Handle to always have
> the actual l2_iste word and not the "maybe we have a pointer to it",
> and put_l2_iste() would need to update the hashtable entry always
> rather than only when the pending bit changes and we add/remove
> an entry. But it would save us that allocate and free of a uint32_t.
> 
> The potential downside is that if we ever decided we wanted to use
> the architectural IMPDEF option to put implementation-specific
> metadata into the L2 ISTE we'd have to reverse that. (See spec
> section 4.7.4 -- the ISTE is 4 bytes with no impdef metadata, but
> if we wanted metadata then it would get bigger and no longer fit
> as a GUINT_TO_POINTER().) But I don't really think it likely we'll
> want to go down that route -- in the virtualization parts of the
> spec there's scope and intention that the implementation puts metadata
> into various in-guest-memory data structures, but for QEMU it's much
> easier to put those in host memory instead,  and that's what I did.
> 
> I have a feeling that when I wrote this code I was partly under the
> incorrect impression that L2_ISTE words were 64 bits (e.g. there's a
> comment in get_l2_iste that mentions "the uint64_t pointed to"), and
> while I fixed most of that confusion before eventually posting the
> original GICv5 patchset, I left the "we have to allocate memory for
> the value" part in, not noticing it wasn't really necessary any more.
> 
> For 11.2 I think we should stick with the simple fixup of the
> type mixup here, though.

OK. Preferably declaring the variable as uint32_t (local fixup):
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


