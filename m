Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F20C61DB9
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 08:45:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzVjP-0004kS-5p; Thu, 27 Aug 2026 04:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVjN-0004jg-0X
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 04:45:05 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzVjL-00078M-Eg
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 04:45:04 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67R6R6kp2074658
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 08:45:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HI2PPP35hYZZ+f08QaJr4ILDZf014qy5m9U2m6WtkvE=; b=lBwOhaUfgH7Mg2hd
 vYbnRnsA/Hjm2/0W19gyNCK0hu/d4wIt+dHZumLHFMtj+eAF2ZUEbJyDiytV0etf
 QGDODiEwH8vu/3AbALPiE6R3HMoQPBpb0KOTtAx/SjOCODh65JcJKIF70K27B6iF
 yYI/WX7zDBLCRc144O3kN5fTIEqULhhR8e/1n+ung8/r1vymo9UuqMd9JeKY2HQK
 tRXwGaMu2VAjV5aWvzdVh9SQt++cSRlnoi1gbDoJ4eu5W/itVM4QylldKi6ZIrVc
 bOgqC+8FfJ+3T6JFtMi8g7aDGMQjJ1M6DQWhgZBgotCwwWpf+3+NljcRqA+AUgXR
 W3Y1LA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaa3bhp91-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 08:45:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-52f64c48bf2so18171351cf.0
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787820301; x=1788425101; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HI2PPP35hYZZ+f08QaJr4ILDZf014qy5m9U2m6WtkvE=;
 b=ZiCFQGAUbsVa39OEWDKlT/ieYG++uAQ8weR6FSWiArqBldetL7IyjIpvZTw3vq+8J4
 C8WgkOkSC5G0p95/2aEe0xbiYFBzmdAgioBDPYEx9ho7SATszXHQtCnicm6CVd8vAQzi
 7Z8rar0CH97wgFTApSV1nqA/RmQAfpyj4z4q+Du6jSjht3j3Pqk/TDfX2i02yQjQqFH2
 9XKFhQp9Z4tHhULS2s8ZA+YVDB4TrYNFyJnHnQ1GwUyth1ngLctZ+D+X8kCj8pzS1UK8
 RloOTN8JIRm0wdS9hVn/ogkhJErDkl3sBeySek1ImaSH8UX7s2bA+YrQc+LagJhi5DQK
 KLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787820301; x=1788425101;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HI2PPP35hYZZ+f08QaJr4ILDZf014qy5m9U2m6WtkvE=;
 b=pdYK6OleBnBNdDyUZ2vzKQw156qRdcrUQU8YY2Xb1+kNUijiNr6rENHDjqOmcyIXD0
 iCddGui8R3oR4/DWZnmEI2rDEi8PaSWreoYF/4s+LTE79JNEdZ7dUZom6G7VKrpvJxvk
 6Z0Q3QoNpu9jwz4ZbMQs+x8To7NvMk1Gyd2m2WE5XhGgtOkHzcyrXgkbQblNqfcGNEnT
 oi4E4peQr17I+wA73FvS/3EAxj7zWKXWUn//UPjSn+TGkd5faah0J8tjCHHaqGuBjIEg
 t4yCR8Okr65S3Wppl9rRASdE3fI9mpI3Qtwdfb+q1GejOJbEV+bdkGSGPRBW3mhqCVea
 4nnw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqldjimsDx1GDV23gJMy8ney/NM5VLe5TuK3CzNDISkSplzZjiYHr1frrcVgl2mOvEZtfMv3PeuNA==@nongnu.org
X-Gm-Message-State: AFuF++mJK99Pvr4uq/Ow1kuJN0TJ8F7q8prCMMRzXT+PVJfWplUPEhez
 uQ4+YdTUfKjCIwSxIYgm7bdTfRyCDfUp+4r2EftOeFhZYQ7QjCwUBzH5t9UsEJhkzBBP3Bh+3gp
 jMeNS+oZ4zS6aPktZbMW+h+9VhxVjSLJCfOZ1jYk1p6zvMN125plT4fc=
X-Gm-Gg: AR+sD11E7VO62ym+OOrEzo59QsThr80Fbea0WbPLx8EI9IWSYkB+IRHDQUkD9i1FK/u
 1+06ryUvS+TmaAX/JyIQI7XKyvA6TJZOXc6XYusY1A0gRnW3Ct47lH4WmGrrmdjhp6Mx/YUZ3p0
 ART1YRC3XYjH7bSFMOjE26cXU6kYXc3XPs8s8wEy8412BuHM371nZD+Lzv05m9RaXgqScDKSM0O
 RtUYz9T1rBk5ONIuXfEAIC/WD1XjDua1/Q+t01oqZb/hIfy4c6s7fwK2pXkbJ7k5UsHY0I4k5+T
 LrcVLrKFFmKIghUJ6ZLe4O9MwTJKFnO9fYlNwVRYJJUs4eCIbSgA4S0v+hiwjvXW+4LIC7PeB+A
 z7NGFl4wAg7E7I+u3/yD1HychIRLJnhESp0YjNm7t7GuK0vZu
X-Received: by 2002:a05:622a:30b:b0:527:7842:72cc with SMTP id
 d75a77b69052e-52e424059fbmr132419401cf.39.1787820301330; 
 Thu, 27 Aug 2026 01:45:01 -0700 (PDT)
X-Received: by 2002:a05:622a:30b:b0:527:7842:72cc with SMTP id
 d75a77b69052e-52e424059fbmr132419161cf.39.1787820300940; 
 Thu, 27 Aug 2026 01:45:00 -0700 (PDT)
Received: from [10.254.188.74] (164.170.88.92.rev.sfr.net. [92.88.170.164])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4942298fsm36659845e9.1.2026.08.27.01.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 01:45:00 -0700 (PDT)
Message-ID: <56221472-2b28-42d5-912b-26b791657706@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 10:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] tests/acpi: log the name of the table checked
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20260824164751.1700783-1-kraxel@redhat.com>
 <20260824164751.1700783-9-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260824164751.1700783-9-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MSBTYWx0ZWRfX+nBGqM0q9TSW
 igVXuDJgLLqEGOV0cwcC5iaQ+y820+vSm7lWGUuo66BVyQbLStCZgXK9XTM7Cko2YvZ2RYHXZK+
 oHJkbKIFIv5k9HIaiym0A+tz/tqFywJC9QxQav5y63RMkT3vzBnTxHcSnEnQAXJLHL0CK0ah4C3
 5SCAQCh2Nslb0OpNxEiN1dL6hLC1eyPF2PW0iHvjFZ8r3UXTCX3KdRleu/0MH7EZPZwLP1KTB92
 T2OIYK5wIDlqxYak/0ULAK9Ne3ZvO7gZyCqdbuamLB5JGIzsf/Vfi59gBGFSNbbmpb5l0jhZ1av
 BlUS3rK2LuAG7IbdWOQhAgz8FB/rCk6TFGP8V0rFkMIZq5HPrIKs1n+giP8tJH057xLeT3cj+q/
 92fDh6gXz5tCvQ9ciiwPl5SOaemWWk4sCFegPCLcXzpQf9EkMiexbYkhx+Mqb/GQfDvURSl3Xap
 AHeOR9GKcTi2JNK2E/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MSBTYWx0ZWRfX8GAUQabP1SSy
 RCk8BYicJW5203rmEksEo6q5hF9w1YrvLpg5Ms6b9XueG6FMOxu9d3aOLc/wB/d2IQvZFej4gH3
 34sGYA9HwZZiQ9o4ag4BQZGF7pV05Mg=
X-Proofpoint-ORIG-GUID: ILCCp86b62puCyQKOmVorLedvOrm10pd
X-Proofpoint-GUID: ILCCp86b62puCyQKOmVorLedvOrm10pd
X-Authority-Analysis: v=2.4 cv=KbfidwYD c=1 sm=1 tr=0 ts=6a8ff90e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=T/Q9W4kDmp1FI4VDxy1skw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Km4GceFjMsEA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270071
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 24/8/26 18:47, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

