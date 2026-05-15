Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB1DCD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 17:23:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNwFM-0008O9-Rb; Fri, 15 May 2026 13:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNwFL-0008Nj-D5
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:22:47 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wNwFJ-0000B4-Rw
 for qemu-arm@nongnu.org; Fri, 15 May 2026 13:22:47 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64FArZgo654911
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xQvtF/TKe9keT6WorOWSGDBW4jh5tM7Uzeq/BxmuOI4=; b=cPjeUVC2fVuHe02b
 A3fDgV6jqUDrO9VI6qZvjp/2NOXqprdeI4cVMC/JtM4cc2BuXTBNI+/1xuKwa3uG
 /lyTnri3pdGoKlwC+DEU7eGtUKabIEOtRMajPsiu2blNAG7NO7zw4vGZP5tmODIw
 eTa8T8xXe7R17nNdJ5EK+sxYulJpw0KioqiO16L0p48PvtArqUJDZUrX3CEHPuuH
 M6gpjqqIiWYlP3lOI7gBLK8hfKVui50RDiI8Lwl4THgKAiYoYuvcOHdU4yV0UCMc
 40kIK2Sm0f49w4Vh7GpgzbHc5Jn1CzHmfs0FNEjDNpH89P4xlDhABb+vG/wSH0vn
 edryBA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pv8pe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 17:22:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2bda35eab74so1775eec.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 10:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1778865763; x=1779470563; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xQvtF/TKe9keT6WorOWSGDBW4jh5tM7Uzeq/BxmuOI4=;
 b=YonyYUm9AA++y1QsnZaACywnw6VmjmEQUu6QAUd/7NN9ZtrrFUe1hsH8+En9bae1RD
 4EJRIh06EXVwpIV9Bz7K7/yWp4eWkB1wcOxXiOD8StyLh2sA7JlwoTVuVJLMnVFI5eMr
 0LvtbST25nEfCJ1QvfejYdWnwbo6/QCzPRmJ2OQilz4GKn6QPba7hfX6IdzD71M0tht7
 4SQkWnLJ425Ak3+zsdk+APugq0u6+SQdv4L09joo5luOphom/z9HT4LfbgXyLCHkEBRW
 /EHWyH8YakOINhghXcGC8YPZ9Va7oLBK7+iyhDIybFXD4SMilQsjiF9sUt8b3LluI1/Q
 rUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778865763; x=1779470563;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xQvtF/TKe9keT6WorOWSGDBW4jh5tM7Uzeq/BxmuOI4=;
 b=KnEq7z5HTMU0Uqe5PfrdfN6ichY4qZVSHRTZudRc/o/RvKWI17MNSS7K29Vcb0Agg6
 S9rCxD+tlcETvlg484IfrjP8sPL3OrPfh6LSRE76DcWwOhE1tGS8DS2eQx0eBYku+svT
 Ac0XlK5XGCpVfwpmTVg+9Rh1ojTSlUmL7uG9VKxheLRFW75qKBykhZcEt1iiRnXSQFBI
 Q1/Lv5FwfTsPOW9jd4Ro0AGrTLR8jZ80RjHPaKelbinXPsEtD/oVmlZXVB0xTLmRO4g/
 OajNuiN+x3oiMqpRAgTNrzNasRugfcUD0Bhsm01rWM93K7a+AngqvbZQTmvToNpeEMKs
 e5Fg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+yRmJ9WSz+OBTetYQwmGPIYu91pf+o5uQ4fIjSyxjW7/KxWIjpF3WnzZgJMOMsS9ibxxCPorwlWg==@nongnu.org
X-Gm-Message-State: AOJu0Yz1djoP0QQ3McsuzTaWEJwLJQozpMXfuxPuQlauuD8PKY4nsQCq
 nJQROngVop0/6ZiPoD+BIXrlZCC4yuMNAjBLmWb2Ut3kOXc4Coi1V64kRxWM6BhRkiKUDLMsIme
 I1SDxFyRK1ANxfmNUU65YtAG/CU3euX5lLPCjbBqvjt//nDuByQhrK6c=
X-Gm-Gg: Acq92OG6pl7WnjibSYY5IvvWBEDvL6IEyZwARyXbXZBmBpv0eVx2HTStJQeHQkUycvL
 WY1LihwiG9tQDVi9rT4MJHyLgtZ/D+QdSVxpfojDQFX3unLrG8ZjyIIbIddusp2KEKrY7KP8u/n
 dCV50tqle893w9T095i1tJg76r2j4JehkMf2VaswExIj2yqH/DYW7KHS/v7JLEk11XTUhFij5in
 128Owkst6JuU9n6b5lDhB7wCSdeqfIrtcjJLHr3WykCXYa6gobHxM/j+Ic1CG8yEdm2nD5xlT1a
 xxKn8z0eLEl8K/4g9z1db65lPSYRP1q43+pepfAm/iO21tQr8MSGfMC4E1qQOhRZfzkipCHYHmX
 xdRhiM1TzvGg56aDc+4v2vtNi5PfXEJJR1bbKr/+tePhBDjFaUwnhfxfEPwfIwrDbN/8Q9+VFeM
 vnk1ociLiNHvqfAkUd+G4X9QBD
X-Received: by 2002:a05:7301:128f:b0:2ed:e16:6b39 with SMTP id
 5a478bee46e88-303979efbeemr2279971eec.17.1778865763505; 
 Fri, 15 May 2026 10:22:43 -0700 (PDT)
X-Received: by 2002:a05:7301:128f:b0:2ed:e16:6b39 with SMTP id
 5a478bee46e88-303979efbeemr2279944eec.17.1778865762944; 
 Fri, 15 May 2026 10:22:42 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30296dcc458sm9056059eec.18.2026.05.15.10.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:22:42 -0700 (PDT)
Message-ID: <32cffeee-5dcc-4fa4-963d-85ca262ea719@oss.qualcomm.com>
Date: Fri, 15 May 2026 10:22:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/20] target/arm: Define 'max' CPU type in cpu-max.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-19-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260515141032.3271-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: stZUDeY0V3BsAkW5NN0j96Lqs9wyyMII
X-Proofpoint-ORIG-GUID: stZUDeY0V3BsAkW5NN0j96Lqs9wyyMII
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a075664 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=yxX4FA_8Oh2w2vnb4N8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE3NyBTYWx0ZWRfX1AVs8OY0ukSI
 uvOll2z0wI1+piuZyKIqGsT+eIPCigy1ooHqAly2l+WW4Zme20ualQdWNNmVVKELBQ4v6kQASVX
 /vE1veBps5oI+4dklovcJKUW6SWhq1oSebLF2G1XpjPnX5nbXugJlOLItA4V8/igOBuoJwEMD9Z
 W8Ln8X0epZxbCE7pKkRMaiFymCxZVha8c+UPzbgwyVlAvGKkSxv2gqHu2Gcxq1aAgWI7BMrxO7k
 K/XZK2pOGfEIi03KwUQSF08NQefALcCNkr1ZQHgYyAJ5pZ2/eN+SmwulbzLegNooqATniZPsEJm
 VI0CgvGTJUmVWXXuSFwQp4fND3Xxp1taOtOajOI0Dr+3yQAJHYWt24txTWdQS/dSlnyT6TMIFJM
 ExlYOYsqxh0CAm+ZREpnyTyUe+K/5lLo1KSBaCQPZbf7QpX6Eay7S/UjY+cJyBlHIkuzlp24Kv+
 JXEcmQ4hEox46lzqRaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150177
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 5/15/2026 7:10 AM, Philippe Mathieu-Daudé wrote:
> Rather than having the 32-bit 'max' CPU type defined in
> cpu32.c and the 64-bit counter part in cpu64.c, unify the
> code in a single place in cpu-max.c. Define stubs for
> aarch64_host_initfn() and aarch64_max_tcg_initfn() in the
> 32-bit binary.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/arm/internals.h   |  1 +
>  target/arm/cpu-max.c     | 65 ++++++++++++++++++++++++++++++++++++++++
>  target/arm/cpu64.c       | 21 +------------
>  target/arm/tcg/cpu32.c   | 29 ------------------
>  target/arm/tcg/stubs32.c | 10 +++++++
>  5 files changed, 77 insertions(+), 49 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

