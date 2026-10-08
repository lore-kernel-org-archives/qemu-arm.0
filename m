Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1D9CA600E
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Oct 2026 09:37:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEkYn-0002Wc-LU; Thu, 08 Oct 2026 05:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEkYl-0002VD-NV
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 05:37:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEkYj-0004P8-Sb
 for qemu-arm@nongnu.org; Thu, 08 Oct 2026 05:37:07 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6987KZv6730832
 for <qemu-arm@nongnu.org>; Thu, 8 Oct 2026 09:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iO9r7zwCun+KX83pt2QrwFbYyPiSgbKYl+Lp/51cv5A=; b=P/UkEUdO4QF61wOh
 KrEu5UbnTKDwiqRnn6GpgaIVZsSWjrQG3jUZzUfxshaxX1EvJUVJD4g4dHYYBCOx
 J5AZnQSoJtOiQruGQrCOJon7k6c+9CuydLiKDtN7qpcRFv/RIOsiKqhSo/Y5Y/Cn
 2IzZ4EKqgUoh1tOsGro0SDKRkiH4qxtiKbqBYnq+9OTUATyRxgatBthBkhZSl0bp
 pjHRn/lJrUdx9uhTDqpd6JxMD2Osq70h2fYZboD6te9OEaKY3b4GtSXrYivWOH93
 xQQ5g7KE+eio5xwn5IawM446Q9RX5J+yi8V/B/5whvgCq9QbN+wH/8ywPenVZVUl
 SWcLfw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe325uy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 09:37:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-9308eafb465so1244774085a.2
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2026 02:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791452221; x=1792057021; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iO9r7zwCun+KX83pt2QrwFbYyPiSgbKYl+Lp/51cv5A=;
 b=QSAJRsdsWwXet1GH7ws1PULNZwdcodUq2kd9BjluAZlXg78mpt904Vkc2xn+WyBLx3
 04VT6VkjLUawoAYX1nhI/FehfwGlqhMoC5NK2WreM+4FlRZCBEa9dicoQ0y0O+PTGVLZ
 cdxTYhL7crludAFXcuUIAxUmAelVRxPcRZfMtmDGd070geS9iKtuhR3IEYpGt/v0ZK86
 bdJohd616cLBQDO8iNSdBvLcEWQPkDbolIMA68P8Hj03J62wQMeM9HQCatVAfeTv3usV
 QpRpy1W0qFbYC2XB16Gpg1VHxVUk6eUxGMVdgj2k5EZxkss2o1y2GOzwRLthWfxMjsy7
 HWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791452221; x=1792057021;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=iO9r7zwCun+KX83pt2QrwFbYyPiSgbKYl+Lp/51cv5A=;
 b=cIXDFbEPVKZaZcquspj5y6M96zASh6KAK3RDgMrG2jdXdv1PwWCLAeOjix2UHxQN9W
 pW2Ky3m7BCHglWcu8DT7KX2gsKP9dVn76P95Ie5agECj/i7Z0RT2zzGtX2mMTTcO2gHm
 7PYJ6JwPIkCuKVHM1eB5J2aIGFZvYaSnEGK2n74kOWp3uOduWmq1Nsz6NWuE0uJnsqeU
 VLdyTS/w3RSab8aNT8jeVFGF0bzVd3Z9hzTjYMsI7CVwKQF9quy9ZpPMy8MCVGI06sVZ
 fvjHiIIRuy/j2x/u01zRtwUtSZ3w8fk92vO311JuY8Hm+1CjpAjO4aZYiKhalC7UDKFc
 Eo9Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwf5qMTlcIQ2Nt27onwKF/Zd3vDPYPO0YP9NBypi9f/dLWGhKBJNPMzMI8IlRgYqZqJmfLMX8zqKA==@nongnu.org
X-Gm-Message-State: AFuF++kMFjI1MhEtUgjUT3uE0TEclgnMiv4gB915/Y7gMCw0pM1Yw4ty
 vIQRlDm5CtxWqXQJiSDZWiGstgBfEA3JdfCtP/RQE7Jq/r+JylIDoZCVZCshfasFskXZdyGnktY
 v5pNO9aP31flTxYO/j4H4Nr6g3JMR+ym4QrWsMDAuWFugiQLGxlBEuEA=
X-Gm-Gg: AYBFou2T5K9HLtyAYrhJQiqNi5GpIk7lyiv4Tw5tXamgI9emY0PrKLio5vKEqW6gxc/
 eQxhD9gn80/aEme5xx5miyBTtz1TTpSHsWXAsG2Op5k359Y8XQjyzsq+FQoGZm15zZ1H90xJg8E
 IRyzTmzU2fryuump8Kp6gjDR2sKH5TbYJsRevxYjIbmS4NjlsOHh5eS2o20jJscivyEWBVHVaBq
 pxmNztr6WliSZS8WyQnB6GIQWbr2D6bqyMm2nplr+v6YUCjqRkPeI3cBASMOH4ilmGJGFPFTAK/
 t3Va81k4cDhvhwmuA1/7jPL4es9QIEKiM6nFh6pg4+lJzok5mHdOW5UaKolnSxD22U8+yS1WJAC
 E51OXMc8yPWJd068C1a1GICY4ib4bnrzwVA==
X-Received: by 2002:a05:620a:1a1b:b0:93e:5cf8:e5aa with SMTP id
 af79cd13be357-93e9b7e3e52mr969234085a.61.1791452221275; 
 Thu, 08 Oct 2026 02:37:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1b:b0:93e:5cf8:e5aa with SMTP id
 af79cd13be357-93e9b7e3e52mr969230885a.61.1791452220712; 
 Thu, 08 Oct 2026 02:37:00 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1843cb261sm59426725e9.3.2026.10.08.02.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 02:37:00 -0700 (PDT)
Message-ID: <5d81e092-86f2-4459-a34b-460d69009568@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:36:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/intc/arm_gicv5: Make IRS_IDR0 reads return actual
 value, not 0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261008092327.4036856-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261008092327.4036856-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzOCBTYWx0ZWRfX6IXtTUWJlBVm
 5TvZ2/I/nNWUOW8RWuaTZdqb9OUYgVVlENSCjol5mTQ5Mi5iBViIwOtkgNk2VFGevFy3kug29Du
 a2V1JuXMW8dKRUrHSMocrXZrY9rmUV9JZl0VqspA+WV0oYBcX361ZyRsFsW3tS1hzABk34LD9HX
 LLLn2x37U/w9wxAu0mpGmRnYR+9Tnf27dh5F83/HO+N8bTRAphNdIP9K4Rx3bc2UpcS/xzidm6v
 hvfMfusfw1vZHmd5XwqeiqFmid3jrHzO+Sudc7c89+lv36kmLN8cBvnKhgSH51+8PY6bg1qCU8A
 iJo/S+fpwq9EOqGd6bly92XkL8FfDAD3SsJ7o/0XU3JekucNwUJh1yhHumwmWT3/yQbyOjzdtPU
 7GRmLjAqOiTrmRU6a8PDYjU9TsYjYrzRB904+Wemr0mZ/dstmjTVPOeFfvjYtMMPAzh7hoKCNsS
 hVYjoKCs5DNdV9ssTeQ==
X-Proofpoint-ORIG-GUID: YZcbGIQQlK6yDgb5nLxoTK63YkFVd__-
X-Proofpoint-GUID: YZcbGIQQlK6yDgb5nLxoTK63YkFVd__-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzOCBTYWx0ZWRfX4jVG+m8KdSDa
 Nf6KnMiyR7YHHJtY2LklUfgJpPVtawYOS3nied4B7qcA9VCu5F148xiQVTc1Z+Kh+iBsrOgDBYk
 XMnW+2N//FBJpSOffIxPuEYdDyKEn8c=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac7643e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=69wJf7TsAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ZPVIWaONiU0xY8L9-hkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Fg1AiH1G6rFz08G2ETeA:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080038
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

On 8/10/26 11:23, Peter Maydell wrote:
> IN the code for handling reads of IRS_IDR0, we carefully construct
> the correct value starting with cs->irs_idr0 and adjusting it.
> However, we never actually write the final value into *data, so
> the guest will always see zero.
> 
> We didn't notice this before, because Linux happens to not care
> about this register value except to check for the presence of
> virtualization.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 405ad2e76f13254 ("hw/intc/arm_gicv5: Implement IRS ID regs")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv5.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
> index 08878193dfc..ebfb0878af3 100644
> --- a/hw/intc/arm_gicv5.c
> +++ b/hw/intc/arm_gicv5.c
> @@ -1433,6 +1433,7 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
>               /* ...which means VIRT_ONE_N is also RES0 */
>               v &= ~R_IRS_IDR0_VIRT_ONE_N_MASK;
>           }

Looking at the code path it is obvious, I wonder why compilers or
coverity didn't warned 'v' is set but not used...

> +        *data = v;
>           return true;

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>


