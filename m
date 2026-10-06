Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D4BCA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 04:45:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEJW2-0005qs-RH; Wed, 07 Oct 2026 00:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEFl7-0005aP-DL
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 20:44:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEFks-0006Hq-3M
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 20:43:42 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6966e6ND3661171
 for <qemu-arm@nongnu.org>; Tue, 6 Oct 2026 09:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 49cVrfGDUVWaq11Mcwd+Ez2kORiWWyIln2OfkCT6pzY=; b=oP7WTqxiC35zXZAy
 RtmxVvwmzYkZYnqfS73jtAxcJGqLCwC8WuNNsi74UCN2RNCX9o/LdzvyEwfPiUhX
 TG4luKy0X3m+y0nEYLdNe1QlwnOje42rw/kV+CjMtdl87AiYCOlLqhM95GhQ7106
 KkNfQCQFuskfkKBInWuH5dUYXtn7aTZzNWEB4WlXH8Q2oT/2+eDZrA9LT8YoyHBl
 WGptAyjOfnYM4WIHkz+R/GEi0L6rrWjD9zto5tO3Q5ZWQVNLSpa/XNUYSXuhFJYF
 4EfMK6zz1+Dku18FofYae9a+iK/qL9W87pyTyAAhRIPfMeoMMGpDu4sqvzE32lzK
 dqRa6g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4j1ntmsr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 09:27:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93cb71b1443so495183385a.2
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 02:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791278873; x=1791883673; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=49cVrfGDUVWaq11Mcwd+Ez2kORiWWyIln2OfkCT6pzY=;
 b=fCpdIzoTemLX4ibYeQuWKcNV6lNl1tYNeX2AC9goKiS2Z5F/7EMQuaa7hfulL1FHct
 WQCdUgGcBrRTeeUzl+hvpUA5W4UCchFwp6J/iHzSzE3DH0eFjZClok0yjE6IcPW3slIj
 rmwtZYsBjSOf/6BzmQKOBiviysXdILA5X9iomoccIxepRaxZKml5vL21ySkYMHdUqwYJ
 njW0CDmDXJTFxiYtdrT9puGgfdHczKxQfAZ1Y/hoT0sLt11w3X8HwdNxbTOGkc/YvlUp
 fcqwhzEWVla0JFrWHW50z6z3k53Qt/J0rlhHZJRH6DoKfzM9LhM09vUFX2BZc6aqeVuB
 g6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791278873; x=1791883673;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=49cVrfGDUVWaq11Mcwd+Ez2kORiWWyIln2OfkCT6pzY=;
 b=fPEY+DOztBe9Yzrd7iIe728nD4S6QqH097nab00gX148+ZmiLmfQC1pOFYbrq/nBMQ
 r0nNxkw0DUJW2olYSgPDNlW3R6X+1NxBUl5KSCrL+Tpw5nU6sOhobPdoqqNLJu6BjKiP
 pXg/xgklEag6sn4oPaegaQ2rSvQuYsnOikTwhBrU0njUI7vMSPVrTqIOoY5ZP1El81sO
 Pr9PuuA37gLFpQEsDsDlX/Brd8W7LID9Zqcx/mZScRch1PWOey/fLdaoYDXnHi8qgpzl
 CP8Lt49qznTdwmwErQ9WXBUvux/xPjdmsezgWOBcswDrfITj6juaq87o/+Vj00/0nlUy
 NrOg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwrtnSwvVK0m8qVQa3HgAqyO6ICJ4HkV1uvqjzqtjXg27gfMh0d6P4qHzOk24wIeG0BorxZPQLjrw==@nongnu.org
X-Gm-Message-State: AFuF++nURvExVQGAtYQLvuOiS/u691OwlDtr9BxHwfQkTk8XbuFmC7cZ
 RLXyayaA7Fy09pAtcSVD5OYraq37JSNARmmT3fxrCiak/nhhsEopRAYrpn08idub26f1wvvAW6l
 q7U0vQKeHP76WImNsRbxxzZPxvyde0ok/ywgVEagkusHlZLK9bxGyHjM=
X-Gm-Gg: AYBFou0wQqRjNiAGqhwf2A4nic3rfkT4x06RGNC2VbdTP0M+7SOLEUdWA15iaPN1ljz
 twm5ovmL7R+yqCe2qCsuQgjBaNAJKkhJvMdBsDDubdnzcb7rwd4BRC/tqMZrdNI95SZx4GB8bc4
 nMpOAocqgo5lEzcCIixZTFOd7iQp0jghPoon0YYuoGf+AjADmA02DEQYt9W3wA/gxSf/kGxXTWN
 tfJO4RisG0kb1sNIRS07kqU4IEyqgGnMsmGUNfmM47+k+l+OyGzui2AzkHxa80nexGwnL12Vx9B
 OKGKBLZvIB+lecSFnWDq6o7iFoYfCWOfVOl3jFsrsRr2rU8BZSqp6kfBffmJ7U/8Wuw02EQDsqP
 JXMRuKz9wk0QF0onZ550VgvzgGV80XF5rgw==
X-Received: by 2002:a05:620a:2a08:b0:93c:b6db:8c with SMTP id
 af79cd13be357-93e8eb5df92mr146145785a.0.1791278873128; 
 Tue, 06 Oct 2026 02:27:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:93c:b6db:8c with SMTP id
 af79cd13be357-93e8eb5df92mr146143085a.0.1791278872701; 
 Tue, 06 Oct 2026 02:27:52 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03ff20831sm259724515e9.4.2026.10.06.02.27.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 02:27:51 -0700 (PDT)
Message-ID: <6b638f43-cd99-4d79-85ad-141450349759@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 11:27:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/31] Kconfig: Extract config FSL_IMX7_GPR from config
 IMX
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
References: <20261006083445.30362-1-shentey@gmail.com>
 <20261006083445.30362-22-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261006083445.30362-22-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfXzDTzRLox2fu6
 T9GSunxliAk2oAiibokJFfIA1BE1RknYAOqgBZyr4CMqRDDtLdGuDRsNTXvZYBiEJ376L9cg9zW
 kiL5RdRUUYFe9wQCK9PU7QStvD93ImI=
X-Proofpoint-ORIG-GUID: SFPXe46RyzKQkVfeDfYzkRJGfa2l_n2L
X-Proofpoint-GUID: SFPXe46RyzKQkVfeDfYzkRJGfa2l_n2L
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ac4bf1a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=FRSEYCzRAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=sRGqw_Zo-bWQZ-GCd54A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNyBTYWx0ZWRfX2qaqFgn0oxZZ
 B08x6FPvq3Hv88vObkOZisfXZNvE8tyXxDUb1wQjy+Gusc/ur+UP5Hc9L8OLK5rlDR9tmIRMGk+
 sFaAqAAQP0EO/0VY5OGVl0TZ44CpdNeK9lFPGOl3EgdrZzpF+SKgAbcm3sjSFrVwn6EYjIy3ubR
 kkDngw51yvayKisxUbb7m+m7WR0yOhX+ag+lHXpzw3zda1QXMNgPHWt5Ps4GPQYJhp8ilcFqcTb
 ieC/kG9mzhddLoIoJyJt8nrAbvFJD1J1Xozg1WtuPqcDXmxFvQ1wC8BDfaMRxmVOsQjsbnSBb/8
 SuUEa9WFQEFWAdLBu9ND4LtI4rDHAKIqFeSTOEQmtQLrlIImcEawrgJGa8Pov+/bVnlLzhsDgDL
 LUxhccRZxliZWLQZmSOmTUGEKgyBG8AY0Zu/T+fKABtEoSL1iowwLjfvmxYEqccYvkqFxaxnyfp
 bEV81p5/s+ThMnPMUnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060037
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

On 6/10/26 10:34, Bernhard Beschow wrote:
> Over time, QEMU has grown a number of i.MX boards and the monolithic
> config IMX drags in unneeded dependencies into each SoC model. Extract
> config FSL_IMX7_GPR to eventually eliminate config IMX.
> 
> Reviewed-by: Bin Meng <bin.meng@processmission.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/arm/Kconfig      | 1 +
>   hw/misc/Kconfig     | 3 +++
>   hw/misc/meson.build | 2 +-
>   3 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

