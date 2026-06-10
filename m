Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096F6CD8CB9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 12:38:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXIAS-0003TC-3P; Wed, 10 Jun 2026 08:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXHNp-0007xB-PG
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 07:46:09 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXHNn-0002Ax-DO
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 07:46:09 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65ABNfYK3657951
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 P73fpMnfXWKRKpWDvJw5iLVgsikmyd1E4Bl4VBThfUY=; b=m2346nZb6u9jMXz5
 bsAUVaD1rfKTTXpSmz+md1j8QrZyDhVo09mUYzSIfX32iraCbUsYsMRkxYdlU2dO
 wsoX2VOgSKTy0lFhF+ITtpN4848G+vdVUkD8iP6GmSTHeYe3M8OpzHtHbh6b7ywK
 2PGJfZR6k1EDcm7IskshLVCmmJksL5onJEjMrb+yFHFqQzHgs0Bl2wsRWDNVfafl
 ip/dd8cIvKrbDF/sL3MXlXwHqCNk3R9q8Id/0JFOohMHYemLcxKvE3f2moK67kCf
 Zfok7vbodnd4U2qW1JIDo4JvU4rLE+Bj1d/dkG/6B2vz2SKhoUbMlL6CY/jmbeVG
 SbQtmw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnet9k4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:46:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-517d766e05aso36574631cf.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 04:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781091964; x=1781696764; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P73fpMnfXWKRKpWDvJw5iLVgsikmyd1E4Bl4VBThfUY=;
 b=cSlrxWiXhWVwMUJ9liwwpCAM/NfwJaglNYZ3L9mmQRfa0+LYITrg3+33iYpDM10ckp
 fl7zfR3cKIroq5rvCzFz+eHgHBNFVM3Muow0DGu+cgDqCuwqV1IpAI29ke/IoGqqZTwA
 zT5RJoliBODHQfmvPpztKQS4gx+lvVl1emzWFZQThXta3o4Hos7e9Vy75czyeHUG7MbI
 B6tGOIp+y0K1XNEcaGR/6besjE9o95GPPTXqcrb08F65+uOIx68R+5fzrJF0ZZmgGrlE
 Zu0udi409qumDVp7dC/KnqZ1RcYIsi4Za7rx79Zyt/yBwDF1h2BZSsF5+DQj1FCv/1XH
 ZaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781091964; x=1781696764;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P73fpMnfXWKRKpWDvJw5iLVgsikmyd1E4Bl4VBThfUY=;
 b=baNuiydNAP56gTu4TrbjuaSLbyU8yIxCaNsMbqJLwq8TGyimD21ktkv/4q9kLNJsT1
 emqPX4rlltJKErKHpfVXD73m1fIWXEJR+Bqzm2I7KyuUGxpHqe249hNGOa1bzUNw0PUB
 /GTyaGfpIBlfjRLpkcRcPiSlthQOuG4uBd29Mc+f7yxzLckumbgvjrk2lGHM+E05GmRK
 lc+uVEdqf2RcBqvHPhpoM7Aw/9X6WFn24dCQQZjAQrrni5y5EM2LJ/aEXrtNYE6tqkal
 YE15AdrbinFO9KspFO/Xz79UqNc8msLu1CMOekfGFaj5KyjTq0kOySMuc2jfBeG2/XMP
 m2fg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8JH9gEZt/OlKfx2U6VdsJ/TsR8aOV8g+3eAScsxl3bdJaicIxscE6+gL6kF4qvjIXq7DlktxuewQ==@nongnu.org
X-Gm-Message-State: AOJu0YxypeRdhjagT/rf+NifHtTvMJqnRnS1rZJtF2WzjkmxeRHhZ/1e
 gqXALG93B9cSANbuUx+nj7n2Mpq20KzevHTQCKj62YvX0TT5Vjk0Izi9Up7OZ0KRB/1ljm3ZPoT
 KoIAhK6l0oyJeVLiJbC96ymXW1fbCknTWj6yGD7ndYOv3F/V018XU+qE=
X-Gm-Gg: Acq92OENeCHViQGeik1/mXT3nClklpuPUJJA5CTghzdXD1+vjnFg1FlGlPs0qbZpjB1
 yVfHq1dMu8cLrAZLJpyRRwwEu7IK3lmztZrf14fnAT1vp2UHMF8aHuREMuPcXneQSflmoyeYh6z
 jEL+jSvYu8Yx3vcfnSAVZ3MTmI62Nx2alHUCRm4hacpxbVHES6ygquBy3uT3vFA/mJcyioLt9tt
 UO248Rvwjj/RwwOkwZ5ZJcIp5CENNCwqIIwUJHeIm9I0f913S3gFmxBjzMuzRmFwZuHRluOxE0d
 LXd02IkwwtmMSg0eKGGutS0FRu6g0opGdcOZLeV2ozBSrwpENizkTFNqTI+VFX+LIgHI8kl8jZL
 YKcbrnvLO1tzOHt+s/mjh13412FdGkxHQBe8TIqQ+z9z1tNh9oQl/m75jQQoDprPzvJumGzkSPl
 Pojp8=
X-Received: by 2002:a05:622a:28f:b0:516:6818:6d74 with SMTP id
 d75a77b69052e-5179882d40dmr272205001cf.34.1781091964492; 
 Wed, 10 Jun 2026 04:46:04 -0700 (PDT)
X-Received: by 2002:a05:622a:28f:b0:516:6818:6d74 with SMTP id
 d75a77b69052e-5179882d40dmr272204561cf.34.1781091964063; 
 Wed, 10 Jun 2026 04:46:04 -0700 (PDT)
Received: from [10.156.84.244] (49.170.88.92.rev.sfr.net. [92.88.170.49])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0553fd86csm1188238866b.46.2026.06.10.04.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 04:46:03 -0700 (PDT)
Message-ID: <261b9e67-6e5e-42c4-93d5-ccc431f5714e@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/22] hw/arm: keep QemuInputHandlerState in musicpal
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>
References: <20260610-ui-input-v2-0-f68452dd6a22@redhat.com>
 <20260610-ui-input-v2-11-f68452dd6a22@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260610-ui-input-v2-11-f68452dd6a22@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MjrmMTqZdtLGvA94pPnR-RirbNyukDfd
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a294e7d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=YLXAUxGLE6hMr2F5uSHVqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: MjrmMTqZdtLGvA94pPnR-RirbNyukDfd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExMiBTYWx0ZWRfXz6HH+BWyHB2g
 sPvLCxFCNL7vTvW2K6UJN3HzeGghWO+PLuXGPrmKeFYMinPVLc0i2b0yrpbIJAj0Tkii4Yw3Ygs
 Qu2MacTKfFr7EmaPLj0bHvRbIs1cRebNEalqBQbMvuAseQ27ahNvylitlsL12oB0a0HjdeBZQ/7
 b+GPA9y61D0LGOxzYNzgf+ktdcZv4Y/jhSBRDeCGKnby1yVb6QsjEqvdBboJE5sidIPty3bHcS1
 7l7BLAYlxrn4mTflSs4os80YpKO+RX8kQbeChRxOxVLrkVwPkC+TMUxJGryA7Y8CSM9KXCtS6I0
 6MMFBcjmObBW4nSmbqb0IGXbDNUEBBd/FRqau7al4e0ROHUgfGg8PDIARA3YBgLHf1kJzAuenq1
 QIUcBBUW5tFc3HjJv50ks8VRVngFJpkhgz5tgAcjolJV8B6gzsZh3qMBWKS/YJ+cVXU/8c8v8eK
 cAsEAJF8Zs4GiX3m/0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100112
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
X-Mailman-Approved-At: Wed, 10 Jun 2026 08:36:17 -0400
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

On 10/6/26 12:56, Marc-André Lureau wrote:
> Track the input handled state, and dispose it on unrealize.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/arm/musicpal.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

