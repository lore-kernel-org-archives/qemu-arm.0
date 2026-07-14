Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E05C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 09:21:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjZJq-0007Z3-8A; Tue, 14 Jul 2026 05:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjZJn-0007YA-Er
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 05:20:47 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wjZJl-000799-R5
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 05:20:47 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66E6Sfxg3954888
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 09:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b+i73UuNTKuCAns2V0XVFFRRshnY9OdFfkHtv2Tp6FQ=; b=JydWKHEtpI0+UT0m
 iKPJaehcyNNv4a5b8QrtoDAR/llBaYQiPyJWhoXnkFp24grsG0bqN1uIey/bowlM
 HjlGDNoYtJTd/NR5uD99QY8pQzoyP7x1VPYhVaNgtt7Tw79zmNY5h3h+10AlFsac
 vealTwF/UOCHh+m5hYKoy3lT6bRGrSj0d+Hx77qc2fAv9lbJovapS4pJCkPbYmM0
 knGKdf00pCp+Pp0VmWU/y2cv8ZhgWMQU8EZfToRgoEePhOPT4tofnlWc2Z0LD/dx
 T4Z67y7Pqj2pruza9i1AidZwOdqbigLzYI/wOHFYjUFqZmJwkUOlCOaP+Y4SFfox
 ARBUsQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ju2km-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 09:20:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51bff5c7035so89579231cf.2
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784020844; x=1784625644; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=b+i73UuNTKuCAns2V0XVFFRRshnY9OdFfkHtv2Tp6FQ=;
 b=iqkpqsAogANIX8kZ8G4poo9kuu/V2mIjNMOpAWEuE2rd3cJZEbNStLHjyUSQrJ/3Cw
 8tX4R9A5XZhyx1YSRdYOIuvdv2FM+9m6UB/c74dxA0kRd7CQ3s2vnI2IepOS66c21hC5
 HC8XS1mu1RzW/lBLskC1fCJzp3cvY4FQnJpwkqWyHeZkf2Vj0l8qTKfh4D67ipKazcWC
 E0g3q/cx6JJtW2gi4GK91OnkZ2f5t8i4a5ZMEzO5f5yDvxD75wvZHuWKxFjxTDNplzBp
 7Uv7bd4xzq0Nrerl3olWcOM2NDSe45LwTTeq0nsnRelx0PL5eOm0TZjRhrAHqvZ9fP0b
 VJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784020844; x=1784625644;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=b+i73UuNTKuCAns2V0XVFFRRshnY9OdFfkHtv2Tp6FQ=;
 b=OEXoWwfhXJuxiEymJaiHIP1GOT8jvDhKMG9gvGRsaaHjQ0gMADma1QZQaRMctxkXwz
 v1jhI9NdRiTdDyPFwGgnEUyFoZEUy1nimRdNTBU+Fn1JwdQ/qI1g0u1hrl3MJkz+J6Hb
 7gDWaJ+gJtJ4zT1DqqY2kaiCnnBnghg6u/zpGN3hND9cyD2GGjlCnLYqqDiJWDmT8y3u
 eeomdo4xJFATCLZ6OECQXZgWc1bP1C7s8quT2IhlT+0cJtvgPkJVesHpw6x5CC0wocWg
 1+uQAmqpHHVq6/nzo5RinZmubJ+UFsomhPUmE4pbi2E+p6T9vtr2M2rOBBMyEhco/kX9
 u2LQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrLRwiWSo9YkTiFsDY/wdmP7Yu77E9mlFO2pjhjcHVKFUPRGFg14u9PMc6rul3IQDHG5TDEI//Teg==@nongnu.org
X-Gm-Message-State: AOJu0Yx1iIQjuUJwWYnr0WevtCPr9U8X8o0RSbimE+lMk9PrtLWlHt8u
 IjC5eyIwkyKAzKp2rE8g7t2fzECafN8H0m7JDNtw47w/qL5xvUgLTDfPs036c4XA6ekWHNR3NbN
 IUue/xc363AgxMMQas0w9Yf4FJZhdjJXhBwkPiAcCQjcajB3bRhLUpp0=
X-Gm-Gg: AfdE7ck00fHOQyGRaQBZpOwsSZiqJPhz35x7FB+K3cxIAc82/nsNvOcNq0h/Z+IUi4O
 CVjdYN5YGvPBq27sE8GCvahZqJRNwuJh4sIQUpCTsyBSc6SwPIlDWQUjn1Say5esIodk/WN4Y8H
 3f/GaEqzF6eetQIFXE2+8gavrRM1lUlnISPZlroa7tc0DkIPQSiAgLD8sqa7dqA3xaFcVX6uhPd
 RD4jkJ2w0ty9Sm3F0gMQxY3V2szS5/xfHl8bZJdhXlvnQc3rrBhbpeFftIYPCkPinp6qvXgc5BX
 XF/E6xpxLgrA2gNwJdMZtIyLAZIzzPSlMAwknWNUvh1lXrfBJKEYV/3T4zVEBlfGJYzCNrZCZgR
 TKyq5p0yZeCacFVyu3+0fF9V05Fs8XP3sH7++CBNkO2YCmv0mmjGMagLxIXfVgg==
X-Received: by 2002:a05:622a:454:b0:51a:1a44:101f with SMTP id
 d75a77b69052e-51cbf12be72mr117685291cf.21.1784020843842; 
 Tue, 14 Jul 2026 02:20:43 -0700 (PDT)
X-Received: by 2002:a05:622a:454:b0:51a:1a44:101f with SMTP id
 d75a77b69052e-51cbf12be72mr117685201cf.21.1784020843486; 
 Tue, 14 Jul 2026 02:20:43 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c15db22ed68sm816902666b.35.2026.07.14.02.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 02:20:42 -0700 (PDT)
Message-ID: <5fa3be03-0357-445a-b0ad-d12faff90131@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:20:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/arm: GICv5 cpuif: gicr_cdia_read() ppibit
 should be 64 bits
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260714091806.3568281-1-peter.maydell@linaro.org>
 <20260714091806.3568281-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260714091806.3568281-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C5m_UwsvLHslAUvMCz-Qd93z400LoVDO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA5NyBTYWx0ZWRfX9sPUcZDEEnSO
 oGkR4i8vdoukb+fWCn8NXFYO8RTpX04in42pkJmHigesaKsAuiNdpAejqFnkTOM46yFhNmJorkb
 PmSPrGPcGMwKrqYZma+oAgtDZtyetrIiaURJkG+3yBvL2kTPQVGuEWw1FCpd7OugWyV3Vf/NoGD
 JmIdCdXwdB7P2ULrqFGo91rI3L1NcQucf7OxNFAV5x0OI6IbVfFYhkFKh2IwtxNOxugLv/6eKmy
 GBS23q2T/YY0a/ErsCa9Ay/ObtH1O5c/JlsitGdWyO1sYPg7xdt9dNIfU0/Zt9ab6AWdxa3TsI2
 Pbp9mb62Rdui3E6gtPm06yYwAPlonSlut6YOkb6T76pfUOFwix47lgvj21CE5a1Eu9xW1hrCPr5
 pQkXRintzMvwX7cM4FNlIosD2fbhd2fNolSgQgJZrpEz6NHZFaRGgz/P0zR7RsTMKvnA5ewLshb
 iaTsBliuJrZYltytfAQ==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a55ff6c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: C5m_UwsvLHslAUvMCz-Qd93z400LoVDO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA5NyBTYWx0ZWRfX8UkS60lv3MO9
 3K89o/RSmbjDRHTg3KGgs9ft1L6m2xet/xPM3pgHrh8X9JBxEH3YkNprJUpE2PzF//jWT4MoqEH
 lZWbRmeEHFwclh0NAONo7q37LJQ9i0c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140097
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

On 14/7/26 11:18, Peter Maydell wrote:
> In gicr_cdia_read() we turn a PPI interrupt ID into a register
> index and a bit mask with a 1 for the bit we want to change:
> 
>          ppireg = id / 64;
>          ppibit = 1ULL << (id % 64);
> 
> However, we used the wrong type for ppibit, making it a uint32_t.  If
> 'id' is too large we'll shift off the end, so we won't ever update
> the state of PPIs with indexes above 31.
> 
> This didn't have any visible effects because the currently allocated
> architected PPIs are indexes 0..31, so you'd only see this if for
> some reason a guest was manually marking as pending a PPI in 32..63.
> 
> Fix the type of ppibit to the intended 64 bit width.
> 
> Fixes: 3f79212abae89 ("target/arm: GICv5 cpuif: Implement GICR CDIA command")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/gicv5-cpuif.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

