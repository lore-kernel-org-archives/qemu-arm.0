Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965B1C61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 16:38:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzd7W-0006w7-2Z; Thu, 27 Aug 2026 12:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzd7P-0006tE-4t
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 12:38:24 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wzd7M-0005GY-CL
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 12:38:22 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RFcS9I3360417
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 16:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KLct+LVkmc4dQFhgbNJuVze9hSwNoskV2Ss0U0j5+pg=; b=OmOMsBBNsFyFNshQ
 31l+ppnjj+3BMk0zcqY0GY6O3y0aM1tC8D3PfsKW6wGnckXu9qw6pRQ2Id3NSOlb
 yPRY3zDkZsDh45SYYGIbPPcHYcRbsWIb3SlXAk9bHbZT5rLEBjqHGnEF0DuL6zvC
 kOeS8eL0/2AZ66XWYo6lXSHRncIgSasfGX29XM6rvaKhjNDLkJ0LlJ8RlW9s8HS0
 pivb+IgEqS1g3t/EORejS7+j0AtmQl6xVvz4XM6fEouPq2o10D9XjgIfP4qtbxEE
 pMJyvg/xsQlKmh7ygh9N8/3gEN/WKa+QWkK8A51QyaklY+3tdLs9sjplE0q+XcDR
 GHldTQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gab7t3dm1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 16:38:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-38fa7b09921so210486a91.1
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 09:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787848698; x=1788453498; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KLct+LVkmc4dQFhgbNJuVze9hSwNoskV2Ss0U0j5+pg=;
 b=ktUElEPmuSVC6CR8mlb4RZOH1ANhdTQBoUX3EhVHseYgNifMeZfuKyH2NH4xSlwIqC
 +NcFzxwfC3UErqkkkNF6OTii5qFO63s04Tx7ATsCnFGkP2N7HA8/VHN8XQ9xP/c6a0Iv
 8wz3DWPjjcXiUZpYOYjiJ0YZmcsPWaycbHor/W+0x9rWkWRsclZvTIrikdSlCvFik0t9
 bg9UIbDiTFYvmwsURzxXDdV/dSOEALuTbmvLoCowASVkeqXK3aML4PcVk3N+/OUn8XzT
 kx9ES2E1fnq6E1+0l6tuy1Rg91xn8UCmSqSqSaaDqn6cemDRpicbWfQhCL3yyEUeHALi
 97AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787848698; x=1788453498;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KLct+LVkmc4dQFhgbNJuVze9hSwNoskV2Ss0U0j5+pg=;
 b=UMG2j9CCIHk8Ztgz1IOIV+pEonwJekTkjwFiVkA4pbYvFfwevq3jcdGkJ5OwQVs4ar
 EldTminsKh8HfL9T8eegBWLKbGL8mlr953krcLhcVze3LkkKK5ZgqsgNG61t4a3kABau
 ylLFp2StnGqkrra26OzeqOlT2XlxZwrhC01qcLg6CExEmX8tWzWTavY3q83f64QD+xm/
 y85YpRkySsT0qU+iOUvg57Y/IQ1UFS7+9lGIbzfulOM/mpt4SYFsgtACM4GoaGQQt6zl
 Rm2XHp3ul7Vwbh2/p9Osy3ebor/cIE8K8J2CZc3/yI0T7SKCCC1AjcfKVRPLOCVjjm8N
 jsBQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro55qW6nUzhIKbINsKtdJevQImNzzNBZmaPC1j35mnpw/GVgW9PJyTuYCbgn8FwCw+cSw+0DvG06g==@nongnu.org
X-Gm-Message-State: AFuF++la1rSgyz96A0Dq0R1ZIe1+hZM4s/OznRU/V7ZzWZLhteD3YaaB
 x84gHKyJVoDVzpwiQwMY+GJREphbQFchZ/50r/sX2dBb7n298maktmuNMAlgNp56UkmHbahSeTR
 f+/Mp2PzxlpJL9z6iGirfBnEUCt6rmdsj0N2MWGG+7WXcZUHDyZNyG/g=
X-Gm-Gg: AR+sD10b0O5ccCawZO7lAe5SmTV2SEZcsJF5ecpLgMQmkefiVQfWlFdORAYqnbqVPVT
 TCkj9HxYHEJw2F0b0k/tnoAEQjMWGuxfde60vUfLyNCGJcJCn6cJ+KDh0Q9n8APVoxaehzPyaT2
 Fp/OJau4Gj6xJ4XQJhpos7hrfaWVvB231AU5Li2NpuPyJhhwc4TGl9z6LdXemV28JPFXIFIVxEF
 xtZFfMERFfEkHZfHwltm3d5laFE6cW/LwWlwTv/RskMOyXtbq/pqzETsYaUPvsTDyr/RlMvq6bD
 uxIJWC4i5EwRjV9MA+pUH5dgrqllkMSutR2Znei/JUoJmEfzPIdzjlXR1itVUHl3nwqaPdyx4yd
 1X0QW/VR5kE1J9SYMJOV89koJh9ckhHHq8IAmU4OulO+eCmwULcZjJcxMaMQzP4XlBJw3
X-Received: by 2002:a17:90b:2dc5:b0:395:4290:46e0 with SMTP id
 98e67ed59e1d1-396d0e83c28mr987460a91.5.1787848697747; 
 Thu, 27 Aug 2026 09:38:17 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc5:b0:395:4290:46e0 with SMTP id
 98e67ed59e1d1-396d0e83c28mr987357a91.5.1787848697253; 
 Thu, 27 Aug 2026 09:38:17 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3283d60d25esm23502147eec.4.2026.08.27.09.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 09:38:16 -0700 (PDT)
Message-ID: <e596141e-a02e-4fec-a1c0-9d517c66e9d7@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 09:38:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm/tcg/cpu32: make compilation unit common
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>, qemu-arm@nongnu.org
References: <20260821213536.433273-1-pierrick.bouvier@oss.qualcomm.com>
 <CAFEAcA-gqJb-1k3viJng4V3uKFs+j4L5-_x=6Cgz_GP4crpzPA@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFEAcA-gqJb-1k3viJng4V3uKFs+j4L5-_x=6Cgz_GP4crpzPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X6Bi7mTe c=1 sm=1 tr=0 ts=6a9067fa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=GaQpPoNlAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PaJ_WkIlcEXtLoyfFkQA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=xF5q_uoM5gZT5J3czcBi:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: X-NNC_QqfflvJhef8gQsDdU6kT1tqkyr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfXwWBehtg+C3iv
 lUwkepYNT9uKZRaZlZVTrg/KZ+j3Ukn4u7LG44Vi3v0PpEPA7+7+QjRvyjCTNgruJntscQHfBTd
 MsMvxUNb/YbozBETx38wN85E2kZ/tFM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX6UBVNNsn9k0u
 F+KH+yWH0qI5FnxamkS6Y1aLemX4W6YC697Oqei9sYcuAh0VVmaaWhyRiFUyvpbkXLduM3/RJ5h
 fFNJKtn809Nurqyt1LUIKkR9UmUMDe22PBm0I277GeBkqhM1oo/8Kqk2M8Z2Wl8CRd5uv5zCEjC
 tikMpjuRBBMwsdcXpBEh+sIjj4FRnZNrBDH11Ri3F/tD1oqppxqTotPP796abn/Tgvbh3r4HbFy
 CFHmtnC8CXmWCtrMoVbr/I5Vgs/wqt3Sn5n3SqIjh8f/DEadLp9leCEu+iggzjGG0iOOXLBtNRV
 H6KOvl23VhoiS/d5npkcm5/NKlq11acxacVgfRtnKudqIxQWiYQKHZQIFErNbbMy/Ro9aFPBCBF
 BUKT0rsKDXbHgg4j52OdytFq/4H0cDdJ3TaJlI8F0ncMao6/AYABTpINr2NZBri+vmpv9cFzJGJ
 cU6b9206wUrGQGt5gvQ==
X-Proofpoint-GUID: X-NNC_QqfflvJhef8gQsDdU6kT1tqkyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 8/27/2026 7:20 AM, Peter Maydell wrote:
> On Fri, 21 Aug 2026 at 22:35, Pierrick Bouvier
> <pierrick.bouvier@oss.qualcomm.com> wrote:
>>
>> We just need to remove TARGET_AARCH64. Simply expose all the code and
>> conditionnally register types.
>> This fixes single-binary with arm + aarch64 targets.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> 
> RTH has proposed an alternative in
> https://patchew.org/QEMU/20260827041557.775080-1-richard.henderson@linaro.org/20260827041557.775080-3-richard.henderson@linaro.org/
>  -- are you OK with that approach instead, or do you prefer this patch?
>

Yes it works for me!

> thanks
> -- PMM

Regards,
Pierrick

