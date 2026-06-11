Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E2FCD98CC
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 11:30:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXdbj-0008GD-3O; Thu, 11 Jun 2026 07:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXdbh-0008Fq-Ip
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 07:29:57 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXdba-0004LH-9Q
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 07:29:51 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65B9xM1h284300
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 11:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BVGn3MLJQ6CTglzIUYSQn092miyr5ZXKx/+PkiSPyaE=; b=TENzF9OfUMpjzTWK
 qIMIWbRVWFd0MHJ84jZBJfyxTP4x1w3Fkih5WIOr9PxrIJEA9Rb7I0TJYx0rkfOO
 CT258prd4u3o/NfsGYSUUhirXQBvqCpI0O8Ez3UVx9Sc/eQw5Iib4IG5x1OrGghX
 zVY4/kf7PEahffc4H8jfP09bPj6D+82O8OW0ntVDLF8WSetCl/fnB1Syn6ZbiPq1
 faXMyWjVTYAZqLbwEGd82JlZuu25TaA9+uFlkTJeMKHo0Q1+aYXTN2BLddTYmyIx
 4Tp8XJ7qp6F+ttwE4toPFhwa9CAYrc0cgj9QBiXDQn2oqAmAD4mjh8yc6tmiwvp3
 otZPVQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tk6a3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 11:29:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5174a23afcbso97092841cf.3
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 04:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781177387; x=1781782187; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BVGn3MLJQ6CTglzIUYSQn092miyr5ZXKx/+PkiSPyaE=;
 b=H2BW3Eq/3s6jjng5jm2QE1afv9b1FElOEIznPXRBensKCrSqsExJlhGGWVTQC0LoFl
 hbe75T8KjvcRnC4N0FfQOYV1Bi6DwhA/RjR32QMv57r5ZuKjtAFGF+UZ0Qtuvvjqmnc2
 xwhuWrHt3vP4okeGkOJ0tBjL4RbFmxAbfDOeO1qdsVcNRP3Syv6ay8sa3TFFbzMT5Qf2
 tzzSa3Yvu91pNW2am/eSeDmZ3ZfKykJbyg15rhSfixUU6PctdZjUhzi3sX6PywWNoDkz
 B8vRQJtjtqxn7RNwTWRldEJfdgVb/WAg3icZ7wOYN4lhAKjPKhZBOGjem2HVrZE1QigC
 oV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781177387; x=1781782187;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BVGn3MLJQ6CTglzIUYSQn092miyr5ZXKx/+PkiSPyaE=;
 b=kY5AnN8nZQ2mFIZIURnSo+RfMJmTBQIkSV2OpOUGTjdINJzdzfkvrtG6OyEpRixlqv
 QYmuDiAw7yzpJ4ymHrPnUl6KAIUD4++P8UvvP6KThpv33fi53sU+TIJ7bCX9Dibx6JdT
 ZLQzgF44+NtIA6bmtvq1tNVMPAxUubysENmMz3r2BaL6HbpSBmuOfDiK0Y3ke7CdfcfL
 63Cd08+HN0n09tIrPwMcPOTjV8KT0iZmmmlHeoXYdKKr1TCZSJPy30p2LYLUhyKTpJbu
 kvg75J08Pnjh7wrPtRDXRlqWg9lvYyX3e6uIul1/ghY0VBsq2uA2gFpxVt63e38A7lcw
 XG1w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9AEEoArn6QpDdGrm5goBsOKYdCiGtwHUiW4CAyMXTdQU+Tr/2Tsb5Rfp5/GxO316C8HLx/+ILF5g==@nongnu.org
X-Gm-Message-State: AOJu0YxxTOIcWxAib3YGu6O4rBpDVgnLMaJwH4SUaHxugSX5JqvmVIwn
 rYoG1IMUzyFf6R70VLrHYVWoPu4vuRjJ7k46rrC1CjH9WgiGV3koamRUuy7wgH25lF9hMN6ensh
 mRQkIDpiuIWwsLgZ5B5crs6oWjaiorFAUzj66hOKwWKwdd3emfwbkKMI=
X-Gm-Gg: Acq92OGNYgM9TQAjxA3XZIUTnLEQvQYQVZho3jVZxeRZG3Whsa7JxQnvVHKx4IosLsM
 fwFv0Lp/FmyPUpfD9prrTM/BcVxYL6RSrt2Vvd+cFJ4mcJrkoApt753eYmgw+rYOT5MFf+XYKiP
 6dl8zfDG+BvZTpOOVfr7F8y1mCHKBL10rMXvWxREb/mJEwB6c3HqMaujuDGr332p/4qIaxNIVWC
 i26fwT79Dw2FzMWUHWXaNUM9dGqsCLHFS2E7Rfnd1u7q+kfYYXztvaCQI3bE9ZNdTwWPNX9ggv6
 6Qp+QAD7F4fFpKBASfEPKshNHiIOjCimDTseupDgFd5Shz64sX0e80kDGrxsSqq5ilAhvi2zPwP
 mFnTZV+B0AMkQMKkRB+IqXh0Fh6smsTHlrQ4w4WpefTRj9+/QVqFxqlkdCWNiNkfPXfJRFedfY/
 MuckcuDGzKQq+N
X-Received: by 2002:a05:622a:4a87:b0:517:b855:b8db with SMTP id
 d75a77b69052e-517ee2141eamr39718051cf.42.1781177387280; 
 Thu, 11 Jun 2026 04:29:47 -0700 (PDT)
X-Received: by 2002:a05:622a:4a87:b0:517:b855:b8db with SMTP id
 d75a77b69052e-517ee2141eamr39717541cf.42.1781177386810; 
 Thu, 11 Jun 2026 04:29:46 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfcb1de6bbfsm52740066b.28.2026.06.11.04.29.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 04:29:45 -0700 (PDT)
Message-ID: <59406166-eea8-422f-b94b-622fa578b69b@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/22] ui/input: add LED state tracking to
 QemuInputHandlerState
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>
References: <20260610-ui-input-v2-0-f68452dd6a22@redhat.com>
 <20260610-ui-input-v2-9-f68452dd6a22@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260610-ui-input-v2-9-f68452dd6a22@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX4QWZA73RshR0
 nDzHWrT7tGx4DvUFnF5pWYYRyERq+5agCgQ8oHdeo1GAGo+dsx4GXs2hI1Lw8pcFWxJNCZn9crI
 wOi2Ik8B91n2Aolc8RYQTMNCXmV0R1M8VauEGcDvCOLkpzupcPFJd+vqUgGrk7g7VHDhmjpHjV/
 LR8VbtbHVatsNgYBSy3QOjwzVXiRMoCZHFSCLbQrNZDth8/k7aL8boTClGiS29Mr/t+skW8Rz52
 IRt1CqugzVIIOE9bDHnwWZoaG3XkIhHH4grBIY7Wa6zG3a1zj4WDIZiCthY3g+YAec+xSP/yGfL
 VVeLtECGPCkq/4w5Ba28h80yBBraifw8c774U2ANK1PvDJQ2B2L4SRV3/d45JVD9AM3jXy9wjIW
 dblg19MBEroItvKjuPWzx7f9/dTWzdH9zHoIHFYda5gpT1CjdH6ylfXcX9RFA/GL6vELldtW/M4
 BdSTBqf5oz5gtj21AEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNSBTYWx0ZWRfX3tZmN5TzaErP
 KzuuPn7jVYa6evNRfpchYSDysMw9YOx2F6WOVi0vubti5g8yX9YTHwtk4yNqXGrcOxu1BAXjo8k
 CFQFHKmZtxjBE+QVRj39WXq96AvWRjQ=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a9c2c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=20KFwNOVAAAA:8 a=Q-Kv7vJzgq53HO2jYf0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: prhg3qQ9C40_7QYBpF52lob5mSABtpOJ
X-Proofpoint-GUID: prhg3qQ9C40_7QYBpF52lob5mSABtpOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110115
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 10/6/26 12:56, Marc-AndrÃ© Lureau wrote:
> Add per-handler LED state and a NotifierList for UI backends to
> subscribe to LED changes.
> 
> Devices call qemu_input_handler_set_led() to store their LED state and
> notify backends. Notify also on focus change, or list update.
> 
> Note: I considered conflating mouse-mode & led-state changes, but those
> are quite different events (from different source kinds etc) and we may
> want to improve the internal implementation.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/ui/input.h |  5 +++++
>   ui/input.c         | 49 +++++++++++++++++++++++++++++++++++++++++++++----
>   2 files changed, 50 insertions(+), 4 deletions(-)


> +int qemu_input_get_led(QemuConsole *con)
> +{
> +    QemuInputHandlerState *s;
> +
> +    s = qemu_input_find_handler(INPUT_EVENT_MASK_KEY, con);

Hmm can @con be NULL?

In SPICE (patch 20) you do:

     int ledstate = qemu_input_get_led(NULL);

> +    if (s) {
> +        return s->ledstate;
> +    }
> +    return 0;
> +}


