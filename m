Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4C0C4451C
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 10:17:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wm7Wx-0003ux-Ni; Tue, 21 Jul 2026 06:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm7Ww-0003uA-Cz
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 06:16:54 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wm7Wu-0008MC-V7
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 06:16:54 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66L8f12Z568565
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 10:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /ZXHq4MF7lH3EMSRkoGZWLXhin8D0GRMqMiGdC9iHfQ=; b=RphHM2PhB2n5JwRC
 I7kHsAFnbV/yL8Q8WKLlP5H/XhIEadSdLl1ahJAfLQ0XGEgM0rfU2qFbtz4GDisv
 OGvgQbSHvDq1Ch3pxKYEmGNnj35jm1ZwXy8Jo3EOOEQ2zRpjvSTF9P7zVq0ouu0B
 dTpKQkINTRLzSIcDMlH7I7RGddkM3CAepOjTlwg4aubzZJuWfG2wCo4y3UvVym3o
 qSwegUpuLTG6iXG1R7BI7VF3eZjQxY56iDYXqm811dSIEbE5esveYLvtT6xyjhpn
 KQhaX46pmQ05gZiQAP6kX8F9CSGAMzDhBoQxopK+wJ4mwBbrkkBo/OBos4u1TNKL
 UlOE5Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvsq14-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 10:16:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51bfe3fa93bso228273371cf.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 03:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784629011; x=1785233811; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/ZXHq4MF7lH3EMSRkoGZWLXhin8D0GRMqMiGdC9iHfQ=;
 b=ej38AfWj2DIo0s5OZpCHxCKkAUUT3nNgzB5bq5oQLXm/Q5FAlNhLXc9UqndfTYitBU
 +eej5LkLdmV3GoJ86I26zHe+I1WLnzefK8Mh2rqiPE3GFY6EzOpcExZUYA3Z9BJLCTuG
 10pX5rSu4/S0rmCxIPULzkHHikad2hPx0j5+yBtJdyJgAfGfbQH261fwyfgFKmofhYaF
 d/zUjZRXYEJiTZtICKfINJcdxza2rfa2YNQ5lbLYKrKjV4XFb66IXZ1Dw75Xl3ViNv8f
 Y+Leq1yhZ1vi+elM/M7+iOfXy5hEz3N3KwN0s/aCG8uQrh8Yyv9Hw3vjoo7ZjctirP7g
 JKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784629011; x=1785233811;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/ZXHq4MF7lH3EMSRkoGZWLXhin8D0GRMqMiGdC9iHfQ=;
 b=rdk5+Hgam+aFIeJnYRxVYUULBuZSJvRr2hKkoX5Whgk46brdFgS2D7vbS16S+ik2eC
 dWnCh/onvO8Vy67uWpQwgdqH/5EC10Gv2xY/i55t2tTfvulpEY4PgjCj882VETDJOIS0
 wfcShadH5jjDe+N4iNXJCuvqP26efHohqCESr7XJJkxV7WZ8Ka8M5gEUEVcdXTFsPSFH
 kwBWON1bxxW9NdaxogrIyCDAd9xL8sqDoSNYvfLyDByYyTrEngnUuAObN+fWSiD1lZSO
 yZfUZmpcdt8G2BQWylLceJheR7r1Oxa1ERYjNTNCLBAB7HCOHfLN16DOraemy1PiXd7M
 StZQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr3g70ACJp9U83Ita+0V/wOjCi5hyixkniIwjYgu1Fo/gCItu0+oFkKvYMa+A/EfQy1+0K+tl0tXw==@nongnu.org
X-Gm-Message-State: AOJu0YzdiDppQ/Sewy2udQ09TSI7EbLSaeFn6cplXwtvRt8tgYNcgWaY
 8z9wPyMNnUX+ayvFey95KKpxp0pn8U+cgXmvP7dVezBN4YvUMP/lDOO6pcD/FmtIYIyl/XdHcAk
 TTwkkNhEJlvXPcRxtSmeQhpPuqMMkDgRZ1X2b8uPA9KPmpHWlP1CGfbo=
X-Gm-Gg: AfdE7ck0k6NepHB8+vuchwCV9ZJGoeFHl93nlYDZS6kBNfSQU6CDX9DSNIjJc3aia3w
 8dmHnhP/7Sd1LjXRby8jOo83t6WHGY2Hc9sIMWYAXsd/MY2TX2hxpuvMYNFI1L+Im6yGeM/xOi7
 MZgWNfpWvJW6iBI+oMxl04iT2piyf8hsSgG/+1X0dSdqZDFpTjJASpw8vkHL6vbmkiZZYWTKUL2
 64TIU8nG3swMIsB7DEFFCGjeT6qUqHfc+NweIkgtP2IDmuF0y/y5WxTwjiZwhbk99JIoWjOpQfg
 K7LKky+FkP1XYf0492FzmwKbGfp9MKWbXkaqyhDYXL3Mms2UDwPIoIqHtIqFGlsaEC2zg+akx7Z
 sJcnLpMVlm7/bXQE9mExLeGhHJJknkfkIlVyy+jKviG5iue7xllo=
X-Received: by 2002:a05:622a:2295:b0:51c:ba4:d837 with SMTP id
 d75a77b69052e-5213c012055mr159253591cf.18.1784629011021; 
 Tue, 21 Jul 2026 03:16:51 -0700 (PDT)
X-Received: by 2002:a05:622a:2295:b0:51c:ba4:d837 with SMTP id
 d75a77b69052e-5213c012055mr159253311cf.18.1784629010460; 
 Tue, 21 Jul 2026 03:16:50 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956536870esm60491435e9.3.2026.07.21.03.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 03:16:49 -0700 (PDT)
Message-ID: <be300233-ab2e-4da0-ae8e-f3afdfa27de1@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:16:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/net: cadence: Return current Cadence GEM queue pointers
Content-Language: en-US
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: qemu-stable@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowangio@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260720120731.2022475-1-bin.meng@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260720120731.2022475-1-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AfbFB88ljXTUKOyC7FLOBiNG1vX3YkTH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEwOSBTYWx0ZWRfXxh8s/oYZtbAc
 JxeYqwzEBU8O54SIqLPuGCAl+9DQ04EX9Mn8qZCQRv2YwaWO5vQrKAeahYQxjH9TH4a+It8CC2A
 3+bCVbqabxRLkafi6tiyJ8tBawLIFss=
X-Proofpoint-GUID: AfbFB88ljXTUKOyC7FLOBiNG1vX3YkTH
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f4713 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=69wJf7TsAAAA:8 a=FRSEYCzRAAAA:8 a=EUspDBNiAAAA:8 a=7Ce04qy9-wfap1NzfZcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Fg1AiH1G6rFz08G2ETeA:22 a=H4N_Y-AU75W7NKDNhZlT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEwOSBTYWx0ZWRfX3Y4+aOyVfhNQ
 W5545M4nJUW7ZrDwHWqL5/i3lzplwCrNZO0RXRdpQT/z0dJ/UTFMZ4m2s/cWZcPuUbLDEAzlXFF
 2lnLWdXoT+XOG7HS+sCBV6IKER84TDHg3C2KRdIxXVgYmZ+QTb7nqSOOwDYYCcY4sT68d8Yd21v
 99OcDN7cr2U2/vkKqmNvlu0td+XeryCMUSXM0cB36/I/IG9h6SQOSLfhjg5p01NaM29b51QTzg8
 zkMAN7LvwVi6nQZl4aOP2dRRhwaja5zO2kAUFrAODVd0SdoWqROjjeX+Qtnkr1taLc2rCva4d8g
 xnfCxB+9UaOkdsDmRrEgeHoU+x4MGC9E8L31gkOTyoQbJPgLro9b/EtLwF6Tmb22pRfWtmKYhly
 kCLxabHUe8w2csQnMCLVaOjVKQDKmxNnAK2QZ9LF6kLzoHS04KyXwoQnRy2UK701m6SkXjGrUN7
 A7vdA2bBFSzxCogddgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210109
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 20/7/26 14:07, Bin Meng wrote:
> Cadence GEM queue pointer registers are programmed with the descriptor
> ring base, but reads return the descriptor currently being accessed.
> The model tracked the current positions separately while continuing to
> return the configured base.
> 
> The Linux macb driver uses the transmit queue pointer when recovering
> from a used-buffer interrupt. A stale priority-queue pointer can make
> the driver restart DMA before that queue handles its completion
> interrupt, causing queue 0 to repeatedly raise TX_USED.
> 
> The primary queue has had this mismatch since the initial model.
> Priority queue support later copied the same register-read behavior.
> 
> A single-queue machine usually handles TX_COMPLETE before TX_USED and
> empties the software queue before the restart check, which kept the
> issue hidden there.
> 
> Return the current RX and TX descriptor positions on queue-pointer reads
> and clear those positions on reset.
> 
> Fixes: e9f186e514a7 ("cadence_gem: initial version of device model")
> Fixes: 6710172501be ("cadence_gem: Add queue support")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> 
> ---
> 
>   hw/net/cadence_gem.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

and queued, thanks.

