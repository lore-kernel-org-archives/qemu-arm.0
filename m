Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EACCD98CC
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 11:24:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXdUr-0001CI-33; Thu, 11 Jun 2026 07:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXdUn-0001Aj-Fb
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 07:22:49 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXdUl-0000yI-UB
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 07:22:49 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65B9xpmm214481
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 11:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lh5iVNW5xZX0JSuGHJRy/a1sQvVC9uMeOchPTt1b//Y=; b=TlN/AOD1Q3J2rIjc
 hbuDPFkTgaKKx0eIWpdu594CYpFef0i5wzYwz9XYqhh7QooawexTDuxSa/wJyKhI
 J3PPf49FrYT5DO9ZdvhN2+NZLV6cWVjI29AYHk9sAcetUV57YX6PyJPuTv5BvLlt
 BFvoCzyJrbXLzkSNi0FwOz3+TftikU827rn9YikcWu8kMeUMk6YEJwBEKtO6Ocma
 9LyTqjbuDMFZI8QOk8YaHYVCBD1lwUNmNz/cSn3gshJ7DR3xGtZwqITR4aIrvLgD
 3d6+ORB1zfOJCxhjqtr1clitFRAIXyoNEXDJh0BRJuNTM7w0MkbOMayW9cIHUnRA
 35TvSw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6sk6r8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 11:22:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8cce42a4e75so162836956d6.3
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 04:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781176966; x=1781781766; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lh5iVNW5xZX0JSuGHJRy/a1sQvVC9uMeOchPTt1b//Y=;
 b=QrsGHHdUlvAEeguUiSp6aKCiKhOebPP1Wil7jbRhat5QrKiJwXtW3SUCVI7140DzKs
 TloztGcUZ1ZoEu60+NdKUA108Gk5qpW9rfcF52+95KJJ/lCfpBFBackYLzc+nx6be6VI
 vqYXqUxdXw9EOR9kKXOhP4bsUL9es1xftSpu3smvVV6imLhlidQduH6V5w1yTd2Bn1hd
 i4Y7/XcifLWx1hoEYHoyXB3F8dQtJ6faBDNS6MbgRkmJKdVsGYWTMXJ04sKKCgWlC9eB
 p6l+ZG/OnNwKKeybIjvIfmY9NwlvInZmX85u/QT7PUJ+0T42jfH6ab0CD6lxcjvqExfV
 Ivgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781176966; x=1781781766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lh5iVNW5xZX0JSuGHJRy/a1sQvVC9uMeOchPTt1b//Y=;
 b=kuEF0yGv2Be2GTvdoP/j6Ri2MHt5qwQTLaQKXaDbC/hGagNboU3GL4FRkGCa3poucI
 vxbQueH/dXd69d6E2AMOC35iqW16LCSKoqTN2kXCgPxpiL05Oeja+QGJ9GPPvz7vv/Nu
 qBQYLUG2Wj7X+AfJQEiZSpzOmlgud/JQCdMzJ3AIcmDAuNz2cv5COYieXsC4ROgy2Ogw
 sS+eeOPhhfO1OFirqcIZDxH4qyebAQdoUoNMXk60afH/Dwb6o3UvxoKE1BTaday2V1tk
 XCPhRQQ8wQF6XwdjRgkAFo/Akd/2gKCuEZ2qokr9gcjKwFN3N3iVMPs9YmT/jYbyK9rt
 IfXg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/1gtBfBtIT7p48MaBeWSvVfOTJfJ9MyPLzOh5TRanhWQdwsT1frt5DD5dNzyitSA+MtCJ6F52JyA==@nongnu.org
X-Gm-Message-State: AOJu0Yw9cwCck9T6gPeBRFVqsPk3ECzqowkWNoT2TVEEBMK3DzITTxA6
 qtXGqN5cDAJqdCTWsZyGNCluYDVYoIEKFHpTLWTkFK5gXhjtkBOvzK6WGbri8q8JACsGeWYahxo
 muILK/xL4kfjHteQbQNw9Y+QUUWMgxv7ilknnGbY6zKHLlwgb8ps3hpw=
X-Gm-Gg: Acq92OHNFQqWnbSGXQN0sKben5m9sNCTXB/K9NfBuVVf9snkM/A1pf/V84Qu+UvDQMn
 VThf1FZJikCkZZCt/QPJFmDSLbwMoCR6WXn7JZmUlX8uqIzujzfUZPOnE8AbhHpHxE9UUdXHuo8
 MGV197t34MATXHOUtWLFGRJTghu7wwacUMMizmfr1B0NrkS8nyocu7/s9ManFVWu+X2i9dAd4S9
 tyWbo89s+RIoLoAcjIIqtDEgJ6fd9oKSgO18rF2mQJ0A18iZMb0Bwg0zbf8i2ztu7rOH+V00AI0
 RKuCwsneWrfKmFK0Zxie4yxPvyo/tVJ3InnIIjahwRKKSrCrCKFrxlzlVdD+tOM0ipNuwLEpQGN
 PDWrHkxOMDpsMl33dK9/zkV8fcfW5Bob4qrpWPHSy/SQUdHb+mGx55faMuWrwWmc05CDOo/Onb6
 CAxT7ptIYycnge
X-Received: by 2002:a05:622a:4807:b0:516:d83c:edb6 with SMTP id
 d75a77b69052e-517edd1b350mr39495771cf.12.1781176966029; 
 Thu, 11 Jun 2026 04:22:46 -0700 (PDT)
X-Received: by 2002:a05:622a:4807:b0:516:d83c:edb6 with SMTP id
 d75a77b69052e-517edd1b350mr39495211cf.12.1781176965661; 
 Thu, 11 Jun 2026 04:22:45 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f360bd6sm87145359f8f.36.2026.06.11.04.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 04:22:44 -0700 (PDT)
Message-ID: <e9b8218b-39e3-4ab3-a2f7-3cb52c812582@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/22] hw/input/hid: use qemu_input_handler_set_led()
 for LED state
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
 <20260610-ui-input-v2-17-f68452dd6a22@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260610-ui-input-v2-17-f68452dd6a22@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2a9a86 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1k1Y3PzgwnwA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: QRbv-jipwYOUhpx4fCdLUvGuxSwRh7nK
X-Proofpoint-GUID: QRbv-jipwYOUhpx4fCdLUvGuxSwRh7nK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX0ql7EQfsJ5WQ
 G7cURRHFl2zXBEOBlgO9F2KG37sIlgoO8nj0tZMmKixx5aEiBEVk92Wbu2JuOfpDtUOzZ3zzOJF
 x9heYQuN/LxgCBY2kfWtf+5rMQ8xsyflwoaNCE5MBLgK5hHXr+SfvVPIl2i3aIW14ZzgGLy68jU
 p/ZJVwuDOGIFiad1/uWDgSLSZRDgBCnSXXbJzYzrr4c6w5szy2wP3zBHmQjGgrNuIgT2osC9u3m
 VJHOC767Ai2UqdLJaIKVU1labYtbG1se334U1I/d6kRXywITUCyWZm+lcKVon0BLVZBeICTNLgC
 DvWwvzwLn+cJHjAF0tVt/YoFonQ7ZdQpVJLM9OrjT1tngS9L2tR3+0MB8S8ge02fRmbMnAzuhGW
 YEJd60EcI00mTkmWHDMA1FQzQZcVmrvblI0GURh2GxDTJiQpVleTj7x/kFm7HhhvFdrTzFU2m2f
 Zl+PjKPO67pJog7dxRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMyBTYWx0ZWRfX2d/5ZIEJ1Kly
 Nwh/PM2L86gd9YDgpXE2bO+tRnbYed87CUVpCJSdXOLU47F44wecP7mbvIyp0VVk560oUEdWeLm
 bFVB9YL/XvNjep0ak74iUj99KC7dHCA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110113
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

On 10/6/26 12:56, Marc-André Lureau wrote:
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/input/hid.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

