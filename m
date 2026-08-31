Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC075C61DD3
	for <qemu-arm@archiver.kernel.org>; Mon, 31 Aug 2026 10:04:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0ysZ-0006dt-P1; Mon, 31 Aug 2026 06:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0ysY-0006bx-Ei
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 06:04:38 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x0ysW-0001tq-4h
 for qemu-arm@nongnu.org; Mon, 31 Aug 2026 06:04:38 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67V7xKSr2460302
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 10:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fUBo6xidHc+IM+BTVd0Bbr4FdBSolOTLMl94iGaA8Sg=; b=JOxnIc68qb2RuWD6
 Q94AVb0bgfakM001u25hH212Y7UHOMczrjqPBJ3lsVlHj0ClYFFkVfKSoLSHoPF6
 +e2o7gA4TM9P/F+uWMbL36B4cQf5eZvsx0hjeKj58Y6SdVJI05WuY4oKXhhiVVix
 AuVtXSC2aSp0n6duO+DXd1EKT1VSVxyJASSSgJv5Y9hDTx9ybmvC6ACYSOZP75SS
 5gbD7TXpWAtYqVU4p0cTlRgGnUR5kD1bT7hrQVKABB9xELXkcH3RF5HNUde7HNUl
 5/PGYypJ5QvnL9MtFu5jzFyX7btgtvbO4NrwO6fKvvOHi8z6X7BO/sgIFW8OxYZV
 npzoaw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556rnwb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 10:04:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92e820609d9so658432485a.2
 for <qemu-arm@nongnu.org>; Mon, 31 Aug 2026 03:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788170674; x=1788775474; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=fUBo6xidHc+IM+BTVd0Bbr4FdBSolOTLMl94iGaA8Sg=;
 b=bbtgyvZEQPphwDYzD8bxFoejaT+U9BfAWL6qM3dT96eWdHsA8h5BQM7/Un9yYd5Gr2
 UBUg9wlfOEZFKW+PF9grTFZzuRVKrT6i3cLLRykMoKmp5MFuEtlH/LMCDfjS7ZZyCcrI
 ixO9ft2w4U0tzco+a5hgQuPQbvyMTvHYr6mBO/IPSLkxf8KGXCAYKdWzs5amvG1WO9cn
 d66HPVM98oYVXATbd//g3iUUn2uPz0aUngwDli3UE8e/3kq6OvrYscEsfm20bmeXaEa2
 rpZA7pCOLvUy6ijkbQWc16KAA6tJ89lxnq5xmU6us8nXRI0hdcB/lwlShcu3QmwDjrR0
 5o6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788170674; x=1788775474;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fUBo6xidHc+IM+BTVd0Bbr4FdBSolOTLMl94iGaA8Sg=;
 b=JsbnBRrnAcR3NBst7ffxF06LIaOs31mQmmiZn8P5WUQVasc8/6Cdi+nszH5bwAYB7z
 Bum/GbRvuskpiqGnEnMONOWNj/bOB7HNULPQUYEdGTJwqa49NvmuhTvKhDZu6aaHmkAQ
 PIDW4iRXFjyKVyCCJCsKCDe3qAVSADLDohm7eg9NRysW2z8iAQyQMhiQh7u2wBAJkrPs
 momAb4L0WXW6GxU7gNrN238PHwSL5T13BMSgJF6dyPteVv03W7jrX+uZBX3dbE5DXEq8
 +kLbgjNjJUDs5mawf7OLVDRq4aHOj3M3jhmdW1NrKit6OXroMx5oiefmvFyW7+ky6Dzb
 86UQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrtDKoXTrcupK7kHGGmvH0MenPxLa3OrIz4Ne+SPrSQOqNXYa5YvhKUKhTRM60sfDIKYeN69SBUSQ==@nongnu.org
X-Gm-Message-State: AFuF++lmHfE31yWVXinX/zN6rFQG9hYcpocUSsAL5pho0C8x9O9O9MJO
 Hvx2DN5xZeU0bdo/HfOP4s0MOav/q58k82Fd83dXA4UHNc1I3tVB90qT7fowQXhPHXBKLvznmLs
 7smZvVjEAFmARIndTBabALOT+2bc3aCVE1diQqAR5VaCzWFBQ5ZF/uJE=
X-Gm-Gg: AR+sD11YuaiwdLE+W3gCchcasDxuBWo9qTcQa7RACGRgSB1UeoplKLs6kLiupHpMNQE
 Y6/o2tl6n9L7gt90XFUAND9pwZ8xnm/CmKH4LZS6lsyJ3Iv46HGEBb9wypMk6upv8xTUE8wRY3Y
 TKSCJUZxf9h67JwdpeannV33Lgx9wWmMkKp3RZANPFecsQfgmKVyTTr9RB0Qg7G3h+Fc9TwkiHu
 v0Hi6BPqWNaYtwwK8P49gK9e08TR1NrE2gjwsPnWPofymlW0d1BdxsZH/Wrhzv4r5oLFjx5G/zA
 68Wb62FfL09KD4wvCUkZbNoJrSHMYV2fxboYPlWzsFWOCPMEnJZgF2CE/+LLB1M4pEmDydLn7Yp
 us6HTlIFjHA9fPGtx5B9yAi0zppkVQase2Q==
X-Received: by 2002:a05:620a:4416:b0:939:16f5:94cf with SMTP id
 af79cd13be357-93942b473bdmr171002285a.22.1788170673633; 
 Mon, 31 Aug 2026 03:04:33 -0700 (PDT)
X-Received: by 2002:a05:620a:4416:b0:939:16f5:94cf with SMTP id
 af79cd13be357-93942b473bdmr170992585a.22.1788170673155; 
 Mon, 31 Aug 2026 03:04:33 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb20793sm21222048f8f.17.2026.08.31.03.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 03:04:24 -0700 (PDT)
Message-ID: <4a1dc959-98f9-4be8-a842-badd4622a890@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] hw/usb/aspeed-udc: Add ASPEED UDC gadget USB device
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260831092125.1022201-1-jamin_lin@aspeedtech.com>
 <20260831092125.1022201-3-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260831092125.1022201-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfXxjXjGXL0PA+H
 igcFxCXf4aWEqdQ7tqqjr3xd+J9RerId9yc0xI45F2w0X4tnKxNu8GMG3UTWXE9H6b9W9f2thsr
 BaP9o69t/dGCSTGGVIGjcRNDwtmPtdQ=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a9551b2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=V2NxCb60AAAA:8 a=EUspDBNiAAAA:8 a=fsNtAQk0wgLITp3n_WMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=3L6qF29SlnrayQqPM2jZ:22
X-Proofpoint-ORIG-GUID: kDWc4M5PGGj9fWhr6QS6syTC2XrYxrjC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX1X9nQEnKaHXb
 M6D9iviuJgB9yz/FvNe5vShinV85R+Z4uRnnMHldcWuyoVlE7sJFzfCVWGPAJ9UKvhWxJkFJuVs
 zvOAq09uTFY7NYodtHcbvEQJNct8UB+wGj80ZED1MwNprPSP2DAQBhkxkwkWLnqLgdz5EnOcMIk
 O5eYMAYtzk5OUxNCmzNsQPBr3CetM74jFD5Ubj/QH+uz1z1iwlae39gU3sr9Iu6AyEzEciSUsMo
 Uaggs3vyqTVcBQqiTJnNvTyHGBY/itHyKKWONoSqPx9+m1B5xPyZUi3UJ6OG1dDOP7mIRNdBte5
 B2ffaabRWlHZdOOqcdni2SdIBBqmpfkDXOyk5HILOL0BltzMvMrArXnaLpnaW1THDtq+X9kmS9w
 Bktk/8+FiQxOsACiVZ9Mu4eXB72FkAjMKRBSQxD68aTsXJWlo7SmbrWCR+MNZMfdEnds4Z+5RLQ
 OSXugJtAwN4CBDtcsiQ==
X-Proofpoint-GUID: kDWc4M5PGGj9fWhr6QS6syTC2XrYxrjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086
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

On 31/8/26 11:21, Jamin Lin wrote:
> Present the UDC gadget side to a USB host controller as a USB device
> (TYPE_ASPEED_UDC_GADGET). This is a normal QEMU USB device, so it can be
> attached to any USB host controller bus, not only the BMC's own EHCI. It
> links back to its controller through the "udc" property.
> 
> This patch implements the control endpoint (EP0), which is enough for the
> host to enumerate the gadget. Host control transfers are handled
> asynchronously: the SETUP packet is mirrored into the SETUP data buffer,
> the EP0 interrupt is raised and the host packet is parked (USB_RET_ASYNC).
> The guest gadget driver then drives the data and status stages by writing
> UDC_EP0_CTRL; that moves data to/from the driver's DMA buffer and completes
> the parked packet back to the host.
> 
> SET_ADDRESS is the exception: it is applied synchronously, because the host
> controller keeps the transfer bound to address 0 until it completes.
> 
> The gadget connects to / disconnects from the host bus when the driver
> sets or clears the upstream-enable (pull-up) bit, and is detached on reset.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   include/hw/usb/aspeed-udc.h |  28 +++
>   hw/usb/aspeed-udc.c         | 382 +++++++++++++++++++++++++++++++++++-
>   hw/usb/trace-events         |   5 +
>   3 files changed, 412 insertions(+), 3 deletions(-)

QOM/QDev:
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

