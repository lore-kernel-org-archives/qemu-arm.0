Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D02CD98C5
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 12:37:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXIAP-0003Jl-Of; Wed, 10 Jun 2026 08:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXH86-0003Bv-Uk
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 07:29:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXH85-0007e2-Ga
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 07:29:54 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65ABNUVj968446
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 okXBiK4eKvcq4Rk7imeR5oQ1kv1MyaAvdTZabkUpJYY=; b=hsnkE9Wth3O6MRVD
 7uynxJhGIpZXRAfoc1PRLIYxidoS12JXHRLiKArPrqb6e/gQ+HBc+gpolumznEK1
 cqWnfcoZk9dgnFMQitHsr0N+y9sxnkg6P9n5m4r8oR9BWSX4yDxRQgpUe61FVVCq
 JrMoW5BRIw7VrY0Azfr4XnNwEp3x30oriLpTdF6ClFB6ezt+pJ8Mn4IXfV3MjVQ2
 kfzoope6QDUOo/VyGcqm4FrT6gQ15YvyCp9g5VeZlWDcvbcCRHbLvewZfD9JwwlF
 iIDmLXdH0zrorRV3FMfUZwzNnFP13KrHfDPXWmYWX6u1Ma0WulkRiHfOKs4JMzW5
 bR1KFQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvhxeg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:29:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5174a236220so11840581cf.3
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 04:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781090991; x=1781695791; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=okXBiK4eKvcq4Rk7imeR5oQ1kv1MyaAvdTZabkUpJYY=;
 b=HMQMbI7ItHv4JECBvkKGxaWRRI7mHcYQBkvr71wvL2eqmsOxfJrnCEw72nlBeLPigN
 v74Vw+hPnfv+rGht5nydD0la0LMnrkqpaCgc9lxKqmOpuWIR94RZUrH1GYcxQjxKk/Wz
 LCE0Dcuv2wEybEdSxLi5bB7AjAzgCtE4vlJIs1v17CIgxuimzzL6C3Mwogf1p4lqrUjt
 38V4yRHnkIlOLfdcuBKCO8zDafeKFcT+XsyzCWED8m8Ad+4r/h0cVWTIct1DA1uYz5fV
 ntH/rVnrcZ0W3Kh/3vZoibjdwBaLsujE9GkVtqXqOIsdMySQm1UGq0sQXkn4mW+xxB23
 RLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781090991; x=1781695791;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=okXBiK4eKvcq4Rk7imeR5oQ1kv1MyaAvdTZabkUpJYY=;
 b=ZViNpIpcR2i3Tc9Dn+TAoo9/lhnpPkYqIPDJOAx1SLUAvQTOfAbuwXUSUwkEM4G/y1
 Msw7cnoPqgyM6gpZ4E9RGitzXEpn7bMnaWAh5OgekOOwh09xXLoR0Evpo5B5CWaQPcwn
 sirLcVNiOg/L/X9iUXblTt1NXaLT2CIfRYLjt9YHGVCjLqZOOMikDvcx64VuJMOW087H
 9N4kPk5K3eaiVWPvjQYCYtbG082f8OaKH2CSIF/F3FiDQS0vqV0uFWl5zNoTFuuelFZY
 zItetKh22Y2rC6QeV7PYJuif94uAiVGY5cP42OX9KHSd8pZm1HOcuyVuCPOd66cboyYQ
 tEdA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+V5h3nYENSHy4RhEju27kcEqA3bLvZCIxBwk2jjbIdSvqEPXsUrThUYlnVvcv+eBMvjc+cMME98g==@nongnu.org
X-Gm-Message-State: AOJu0Yxu0iQWfmpO23hAmFGV7iMqguQhpmVwGg+ZtCfI+AkTH4wtO9/z
 cfnqEZ6B+ib/6jBL1G3b2OeeSjBJLlxLuR20eFj8m0b2DQMu0OfbPHt8+5RbqROyPee5LgoSWn7
 e4vRAmtIL5j1AG3MxHe6cnd1FQ1n1fZbpJrBtMVUV7GIjKcCQfXgz0uY=
X-Gm-Gg: Acq92OGviKMvLU3iyVKzH0BJKfYLXLw2gl/k5ylM0dojwgsmtgOtOTJWCeskhnuuys6
 3gWx4NbgE5Oc6+SwQd0zZONaRpVkDhTJbs55bpz8R3WYWQEent1rmjvuMlqu8tlqSKoH1NsPcHs
 xt5ky06WcBeaOBcwM0FlPQEvsnDee0IuYPp8GMdLETNKZe5e1teJ3baMacmJJbFofLVDMiV+Oig
 wj4c2qVQaJdjUhNK4KZqXKIgZRSgbEx3tAq+E83QR3lTjEgogXFo4q+DcuwxlgHp0x3XpLldc3u
 J1zYwxQFRL/S8DvUQnWKEHxQ8J2NgjFt9cv9fI/lmw8ch0AELtTuoi/M2sAmdD/kB7CGNd+52uI
 UH+ngusr2+PIUB11rMD54m9NPkmoEseOh/ybUmQMVQoB1852qsw9yNHhj+8u2ab87SucrF0Yx49
 GerF8=
X-Received: by 2002:a05:622a:608c:b0:517:8242:5bc1 with SMTP id
 d75a77b69052e-517ca552787mr97935921cf.15.1781090990972; 
 Wed, 10 Jun 2026 04:29:50 -0700 (PDT)
X-Received: by 2002:a05:622a:608c:b0:517:8242:5bc1 with SMTP id
 d75a77b69052e-517ca552787mr97935521cf.15.1781090990622; 
 Wed, 10 Jun 2026 04:29:50 -0700 (PDT)
Received: from [10.156.84.244] (49.170.88.92.rev.sfr.net. [92.88.170.49])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf054e05199sm1149115266b.29.2026.06.10.04.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 04:29:49 -0700 (PDT)
Message-ID: <efff6e73-c922-4431-b662-4fbba7c8b92d@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/22] ui/input: remove double-notification on
 qemu_mouse_set()
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
 <20260610-ui-input-v2-7-f68452dd6a22@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260610-ui-input-v2-7-f68452dd6a22@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3537MPsztyDf2nSU1o8GbAWZZLPGkiyL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwOSBTYWx0ZWRfXwJqDJrySBipQ
 xNbtO4y2NYF8b6JflMhlIDjfYJkJEHAh5c9lU1juDOTuaORHSmESgDNRj0hCqAre1yvYqBpn8qs
 hnyNmAbStEitRdRnHjCLGEhx43PZORZnJuKfhhr+NttYN6pTfzHQunk5ic0WMhZjACxxYXEYUra
 dAdBqUE1XGvzM4sldGgZ81sFD3cBqqyR0utHUK7YiYndndjV8iUyfbcIymiWL0zT19DWdRsi2rX
 bGhF8A/7sjsXUMoK+11EnaxF8DCexmPNaLIfWVHM+gQaXhECAC1KmjgZQ1LKnBaqqnXw8vU5t3F
 wd/40aNKdGnV+3aFLW77JsG6cQODmQHk1NCYL0wQOiz3ykywBjxM9eFeTNyZCMaLFSd6slnrzUx
 Y2ZdaMmfpOmoYexsNBZh25TWRfR5qOi5xRr1z+eryXLOUPcet68DffqKBmL/pOFRVKxLkPGP785
 1EazYyDxto5GZgT3s7g==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a294aaf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=YLXAUxGLE6hMr2F5uSHVqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=GW2pR1Yr4Io_S7K71m4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1k1Y3PzgwnwA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3537MPsztyDf2nSU1o8GbAWZZLPGkiyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100109
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
> qemu_input_handler_activate() already notifies.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/input.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

