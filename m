Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72B8CD98C5
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 12:38:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXIAX-0003uU-CC; Wed, 10 Jun 2026 08:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXHOC-00085B-Dx
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 07:46:32 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wXHOA-0002Cf-Tx
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 07:46:32 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65ABNUXh968446
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TMlog90bAeJhxIBbGMEF0MinoG4m7UeAMGnZoM2AxWg=; b=QCVdq3mkEIhK57Qv
 WP2iUxHsikQQUR8Ng6zMAgxSQtTQK03btuI3Y8AmynUp9Kb5qYq39E0mlJROkdXc
 sfqgsQ2OnoP91+fDle0d5mwc2DldyJn3Cp41QYWfc5deDWGve2Wp9WjACN3WqiOy
 PD6+LjMV7j76aoy8nq0LTfHGf0Xn7A+jmi3Kri6AUYAtJ4SJDSyNXireENO0u7/E
 Q275AbLLPLwJcrmbs75dHcBKbO9kdWyBMDwntJuWk7IZ2DgeCCIAZDu589iSnqR2
 qZzt4pvsox3g+ovIWZ9tOJoZbk+WhnKnmYLwiQS022zH7x9gua7q1QWdhkOl9VrX
 rXQ0ow==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvj021-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 11:46:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5178aed25baso137777911cf.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 04:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1781091988; x=1781696788; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TMlog90bAeJhxIBbGMEF0MinoG4m7UeAMGnZoM2AxWg=;
 b=Bcbl6CWOIBi60msj9Haq1RMymUWhs6HrSbVcmOlVnbKYByLmz/ZGGkHzIhxazI47ZZ
 rg0gQf4cI2iQJQDPVAakIWOC4l5Ay588AWU0TcsKnUl6N8GemxP90b+z8H6JuFrZxGyy
 apFDmdZJ727D1/j3DbScYymC3qHIHFP7T9v6I6TP6sgddVq3GqHPbbj/00uJcBHIKAtf
 vbfIljHThtJlaXaZZN2rYpNKEaIKni/mLCf9aFpUzbKbZ2qaPi2JXQ9bMEQpo6XkZ82S
 lQ9qcxIjgizPcfG/79TYMgGOVRa6UCXjJFlHKKoGnG5pZSDlmhv793dt/+WJwqj+SwXE
 ECNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781091988; x=1781696788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TMlog90bAeJhxIBbGMEF0MinoG4m7UeAMGnZoM2AxWg=;
 b=Nft6SrjqiQfx+iU5e4A8lo87M2SD4exaOHnA+ZUWtQvU6vC/aWJQOVfTdGCwR7ZlS/
 xoTgl4mQ99928wPu0VYbFVKItRMnB9nwJYXQyoTOdcDgjd/YisrdG/Qqf6eA3mDBTnSN
 o4GT16kvS8mJ7VIF09BLDW8s3DHbbLccL9yrIIDXLirMANqx9US3fD5zQjrEo0PSYs86
 dNt1JO+hWpGeenTa3ojdL2GUIQb8fe/V+rtvgMT52KUu++rcWbAPe8XIrLdxlXObTdlw
 UiJNMaeALAN+KNTP/dMy7rrhgy4MQ9k/qnsMadLpxc0Jz+1TJsxfbx9cB3ZuzFy/83Wl
 I+AQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9TWXXmKEullAOCgt8QbhlFt7YHkvSYXUBBAxwJ3k+atymTOu2zCClETIOEwMbLi5KbJdzsN55V3w==@nongnu.org
X-Gm-Message-State: AOJu0YxdYgVw6KiZ2JVA3t/cD9nDcRQMWaizyNysftGFHmPC1oqB9KYL
 e4bAEtBzAMY8cFzp+ZQkwHZxuDbLdGMAMCNJ3+XAylmUcR+REm0E2M9bRLTCK5IKpjytd4rL8GA
 495cor9fa0sAxae+ITZQhKOWSMsKCC8Bme2FDYdiSjKP5B1zqhitc9JY=
X-Gm-Gg: Acq92OGN6etnuigsFuzxwFCDngTjWwFAeUJjcb1+/rn2YP+WDB/di2gj/OalwcIgAuf
 vETtX1nJW3dZDA8ZQQHD0VqUgZ4a3vuIHvliUEPfm5rvd3T1tIVQbmORjImRdx1Bso1cqkbW0sP
 lZQszSYaMHDwpPrjA2d23JGRwRpNW+z5f/86kOfvu5tf5Nf0YdEGAyngfShHDqJkAYKnbqq4y1V
 4To9xYUxWpcd1OkV6rwQyJsNyjCvYiXXACZqEbu/uGRFGn9pRzEusvNNBqSoHs9ibjz/SbiY6ok
 2yGEDstd7T66rVvFkN5wBKU71Ixy+SOP5zQB/GFABkVsOG2A1Jgz9Ih6YlrNjVYt0Cx7hZ9u0cZ
 OWpmSMINfYYWrDhYh5urx5+lAsYZgARwJnxNtY3go4t+rvpGDNiXU89UQb9ZPhiIqqt+G2J2BhN
 YHOKo=
X-Received: by 2002:a05:622a:7911:b0:517:8069:8b07 with SMTP id
 d75a77b69052e-51795b6dc71mr258320711cf.29.1781091988533; 
 Wed, 10 Jun 2026 04:46:28 -0700 (PDT)
X-Received: by 2002:a05:622a:7911:b0:517:8069:8b07 with SMTP id
 d75a77b69052e-51795b6dc71mr258320351cf.29.1781091987965; 
 Wed, 10 Jun 2026 04:46:27 -0700 (PDT)
Received: from [10.156.84.244] (49.170.88.92.rev.sfr.net. [92.88.170.49])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf055307a35sm1173498966b.52.2026.06.10.04.46.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2026 04:46:26 -0700 (PDT)
Message-ID: <ad198b72-e66f-4aae-943e-93c695d8d6a0@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 13:46:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/22] hw/input: keep QemuInputHandlerState in adb-kbd
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
 <20260610-ui-input-v2-12-f68452dd6a22@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260610-ui-input-v2-12-f68452dd6a22@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yKIAhGMhkjjdBMnXg3XfBSZYBL8jkkqe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDExMiBTYWx0ZWRfX95w6g2AaJJwf
 dRaOGDcR1pMhcbtOqmb1iVcsaAXh+Jd9MVTfxPOo1imVytb0qbddFColkxUjQDSz61HIWBHqb+5
 Kga7ZBsaPNrHlFke2rMLiO75g3JOkgVen36wUtw+ku7f/e1/hX5h6bXc7DMeGdiCm/uR/5NScgN
 2rF5EUbGlBkpy7U0BFpTdoEUT7LIi4JP4DIxYghobGJGFFidhjp4+heMQ4J0bFIxN0nwbKF8u6+
 +0ms8x1Zvt+liBfWSdAPH47YFRxhM97auOoeh1ofz6rZawcM4vPYboLfT95GCAyvArUEJN44tej
 MGuA7E3nQbU9D/5khXd0x/0SWsaNBV1OjFHHJWK8QWESGJOQMD6L7mZ13u3oC+2BecVwWdmFLA8
 GquwdaQtiEkWhFmhlxIM8Yf0dD7Dnuc1iy97q9g/GkKDT8InysIO6bGtvrnLigFMN56+Jq82dLH
 TZ6xAviWjpzj+8tbUcg==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a294e95 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=YLXAUxGLE6hMr2F5uSHVqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: yKIAhGMhkjjdBMnXg3XfBSZYBL8jkkqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100112
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
>   hw/input/adb-kbd.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

