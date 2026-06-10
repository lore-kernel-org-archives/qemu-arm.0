Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127FFCD8CB2
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 12:38:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXIAX-0003wS-MH; Wed, 10 Jun 2026 08:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXHPe-0000Kp-UQ
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 07:48:03 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXHPd-0002R6-Dg
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 07:48:02 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65ABNUAw1501443
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UbsHOho2kjT2Qd7EC5ZEMkIBKJGwbmvD/cxyQRV3Jjs=; b=MDRhDTrfn4p3CvqO
 ZAt/vxfYFynVlqwQmIJcrR+2FrlGpXVavr/1pYh8b8IX8n7JoUn39aVDKqOVFLYZ
 wsGu7j6zzlT5j5NbcwTmCxzXQyeZmfrbBxAlBduEAF6CN9l2MzlqftCJj2p+P937
 IjXRsU38EMTKTTFWbGyoZt6eR1xAL52ZZQ51HL1hr9z+WRwAoYl9IbHbbY9dIIzX
 urBwNLTuRL2em4ctSDmJ1/SpudV8GIialv//6cy52tc3Tx+ET+u1T8MCdYX8uVmU
 IBKy1k7MSumQVYHYO0jYDzcLvEvecWAiu0W892ESzjaru4tZ6b+XMcf/D2VxtTci
 H+p/4Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a9m7y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:48:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5176cc5bf2aso91388761cf.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 04:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781092079; x=1781696879; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UbsHOho2kjT2Qd7EC5ZEMkIBKJGwbmvD/cxyQRV3Jjs=;
 b=Z3R1C69qmt/lnOCK/oHUgg/9fds00HaK6RYsrS4HsnGVEHyQlYhcmALCnXDSVqCjGB
 /7I1MppPz/AbgvTSvMFaYc2IjrEsLOpCwCaC4KTBQXJjXpZxEHvzYdNXLii/ZQ8MhSut
 C5D8sOUPNTaYKXm4rGiByXJubMYrro7JZs28OXrikKAirupA8fN2XF7HUMOK17np4kaI
 4VnJ5qFFqw7ZmWc58KDIuTEdzTIgIKk9ipXJ62aex9O1zmemJqnaNDPWBPdeKVjkH5Vg
 g3r3YPJuAnKYrfG+UgyIPXPoqQkn8qXLx6F/YHXg6CM1hSg7dtjDGKKRN/Gi3lrBz4MJ
 mpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781092079; x=1781696879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UbsHOho2kjT2Qd7EC5ZEMkIBKJGwbmvD/cxyQRV3Jjs=;
 b=nIbcMmV4AaVDM4hobLJr9ZfLYgYTXgj+LjqFPtCJInDofi/o/CQ9ldBV2Srf5MLxmk
 1W7WcXVLCkxSOXw19PAtRV0I2ee/FUrhHc7q9iJSyioOeuB6OddpQ7RslEKQOaCdosnJ
 /p821UdpK/Xd5Nu1Zh4cdimqqh6MKnV6s+NBEDccZMKgd1cPBFmi21qsAMEzgwNQMG3n
 q9wJJwwE79vGPPdoxiYYPVezVaUE1ou0j+T9TjiA1fV23W6H1EtRMSTDU+OWfmKuWfIx
 M5YhcOiKgizB68ho/KAfz+TGqWuZnvw5zCIHRbIB4J0hv47LeYEnbYZJpGlg4kDXQB+g
 DYbA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/aAZXYHB0lbZDCr4IhMPVPrL8++qESoyf0R6H1DrQbEGvZiBOCh4IqXZW9jRryc7rKNmEXGbZlDQ==@nongnu.org
X-Gm-Message-State: AOJu0YwFgeIftYUTnihMBQh4XRvCic/Ut7U3e2SzOsrV8C6IUASGYcOU
 4nF+jqvZMNgOjIG4ngNp8RZKt1OaA9Xho5FHRUQnCVUiWD0LkvPLzdl/2t3fcyMvJ72434u/pRA
 QTztO7R7mMGyM+RzDfmCDHxexXwAlWoyVGu9Jfbo5ZsLsHRyoCnMAejs=
X-Gm-Gg: Acq92OHF2gbKsjTouVUFdcV9T0J3+1gjc8oDzIAYy09cc71fNd87XnY/eS2t/rasraK
 2xFwgp+qm5y9wFeq8+YaUJwchGPQhnxi8YqDG8dhJFyPTzvuDpuK2m2Gp1yHtAe6zMYO5lwWS+c
 qCpe/P5YyBT8tHoR7JB3dc63CQZ5sU1AG26E4jeSqpYh/nfsMbTSKI0psLyImP9Vs4cg5fR7+7k
 rQxlyaztccvJwtplODEqZNQKRF1gtwqMg1C+mOhScJ5KY+mitLdgQYhsVH2zvPGP66BuOCwR5FK
 Bu4TPC/s6rWshj/AOwMDAm7xOIndmzEkjE594Cr0bTn5nwTW/Jjz+UG6w6DvLHc0v+Ut8GVdN9o
 e4Ok1k76zMEyvJZTkGVkghdGlNfW2ZskUcRU5DW164pFBzLa4mlTIIOmXi2oMkicbXtf7pNqoog
 MvPTc=
X-Received: by 2002:a05:622a:110b:b0:516:df62:bdd2 with SMTP id
 d75a77b69052e-517ca63940cmr97761621cf.55.1781092079549; 
 Wed, 10 Jun 2026 04:47:59 -0700 (PDT)
X-Received: by 2002:a05:622a:110b:b0:516:df62:bdd2 with SMTP id
 d75a77b69052e-517ca63940cmr97761211cf.55.1781092079148; 
 Wed, 10 Jun 2026 04:47:59 -0700 (PDT)
Received: from [10.156.84.244] (49.170.88.92.rev.sfr.net. [92.88.170.49])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf055309368sm1160712966b.49.2026.06.10.04.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 04:47:58 -0700 (PDT)
Message-ID: <ee1d8992-567b-49f8-a2c0-670e41b60fef@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:47:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/22] hw/input: keep QemuInputHandlerState in stellaris
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
 <20260610-ui-input-v2-13-f68452dd6a22@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260610-ui-input-v2-13-f68452dd6a22@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a294ef0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=YLXAUxGLE6hMr2F5uSHVqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: trd2uEwxJjPLRjdsMtdN6uGl4-w01sFr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExMiBTYWx0ZWRfX6CNVl/W8gL8b
 OjpDPMIgyKYPRobOs9zeOCAX4BiITF/k7IefHIaIBIb1T4w+fnZtjHgU/+6TCxTEjlnF09V77FI
 pb9ux8FpaVPcoawWMKHcwDN+cejErzxCCQWQBlbRs0b1fc4vC2sYXiEMg7XEDrbKtvB27jQKNPn
 KGOnu0pn5eWUeMVbKScK9vU69xQoCuAnbMZ+Y4UDO2czao7xierB7WaT+Kb8Rz7jIFCuqhhPVzJ
 wgm4VqVZrqxKYusyH2elrVjJVFRuclqn0dR1CWKupNrI2z7iq74Ie0LEz+bdtFMC5uUCGkaT/6Q
 7kplkM54wJRdIfUMntvQ3L+cXm8mY7pL7tCBw4cUDuUwAA0c33J2++DeqsqANq/VGBtJpzBa2w3
 IeoMLjiDo0vsbU4MfGqLaWQEMfosqon5Jvx8xFOwulX1W7+2LXoq2B4Lb0JrgpLFWaMCDqWev0G
 8Mofhv3Qpe5hBxvkAgA==
X-Proofpoint-GUID: trd2uEwxJjPLRjdsMtdN6uGl4-w01sFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100112
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
> Also free some allocated fields during unrealize.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/hw/input/stellaris_gamepad.h |  2 ++
>   hw/input/stellaris_gamepad.c         | 12 +++++++++++-
>   2 files changed, 13 insertions(+), 1 deletion(-)

I'd rather a preliminary patch adding stellaris_gamepad_unrealize()
to free the current leaks.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

