Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40064C54F55
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 04:32:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woZUD-00074H-2W; Tue, 28 Jul 2026 00:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1woZU7-00073q-FA
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 00:32:09 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1woZU5-0005pH-O4
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 00:32:07 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S46RVM1821155
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 04:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ub/0ZePdk4Y90jbtQ+uEBBUliBz8MAqA12F2Xm3YUoc=; b=k3Tmj+qlCqTc7La4
 hyBKFpImSP7ae8m1ODc5DhkSb9liJvSL7IAdL44nSn7v1D6nDYjxAU3wUZETvldX
 dcH0ELh5cbmHAS290KcHyZ+CPi1IXa1p9XMRh2eIzpCyV0NvAI9PHWx74KvAr+vI
 +91SUgJ+y0omwGYlZ3SvAi4XQqpUzyJdfibe0fL55/tHCXX40yY/ObFWTd3oHsmv
 4zJMyLb2oFLKs+uCh/fhEL8/16FukxkllbZwuoKFz6maotfbmAozxq+oAuRFdSdv
 h2MYKDK16de6nCYWgu0xgQRdvvCN5tPLsW5qNAKOAFXUfdHaMCKvYQfTW+hpiZMV
 uhEFvw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y02e4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 04:32:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51a8b0a08d2so31842121cf.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 21:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785213123; x=1785817923; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:cc:from
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ub/0ZePdk4Y90jbtQ+uEBBUliBz8MAqA12F2Xm3YUoc=;
 b=jN3J5yQ/gnIqDiv0NOrd7yN4uNo8bKGJWU2sngLwixqz7kHUBt4yIqBY25xSabHBVl
 813lSvhihGApT0UY+nn5ruL5xGsMbLyQ+zcBN38ZzxXNqj6zghL2MFuQz4TXbpPFVZP+
 HG+GWtwFfMW0sUULBXMXWJKgsN2q2BlZYhSDNms0R6fCpdUajyQMN8lhzyJwgKv0bynw
 hOOCG4HIRa9+pLhxw4eJ72JUO/qAzYhFYW0JNM3WufJvyTGVqbjVWFTj/bJWmLoQ2xk5
 G6DtHYzSnVJyM+sXENcuwlBFIWxKTnHPl7DmjouTU/PSdj1VRe0g0eJ3fkwT+pwAfY+2
 Pnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785213123; x=1785817923;
 h=content-transfer-encoding:content-type:in-reply-to:cc:from
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ub/0ZePdk4Y90jbtQ+uEBBUliBz8MAqA12F2Xm3YUoc=;
 b=sYu/Ljjs6+KucX+P80bQ7k7grxHw/17EXgy/wrO7Spk0s/OtIgVnvPFyEorkkipsTK
 tnsCwa2WmOQqnwqSf9czOy1vNZhXR5SuOMKG5ncdHVAiL5gX/ikrrWWIsv5zTtnXQBSw
 wzemRvHcQG/DYxkF3IAa7ggzYbghwji+inBrrjNyQF47/3Ldy5u7A3IsV8hZtD450ZYG
 sstfTpnKbQ19hy0/eqnjRbHhc1QeT3RwsnWCOPh5Bddr+lu6I7up8hry+ICPVylaRXPT
 pNTD81To1WMIulMl/3jYEDpqf3NeVH5VIoCUiLRl2ZKkagKRRAJYN6qRteHfWTql+PLN
 rXGA==
X-Forwarded-Encrypted: i=1;
 AHgh+RobGGScxRxXtHLGka0+E2vqqMaTJW4TJNZSa3u25Jt3/GBUuWsjPdWiBcRXMOxRtuIQbNFkU5u2Qg==@nongnu.org
X-Gm-Message-State: AOJu0YwGPPDIJchphTkIFyyFxtCqAwDC2jVqMk6VQVPQrHtBV8u+kfCO
 cEvKIaUgBgRU9ih+E7Wp1f1XlUc1uEU4SAxAPLZ/rVYRlm73v/snlo+XVFHfBkRRhe1PFXv4EWC
 hJurosA5+njVl9lOf2ddUhH7yNETVUFYs4VjP0x8puKbU3BNeuSVmuitzCJ1uGwI=
X-Gm-Gg: AR+sD10/mgjGIWHS0oQgaYapv2s+6SgipFNd+uUy4LoqI5ZY45ABUa/ZO/RixMh5bkU
 dzOj9rqsFcA92TUnCMh+thBDZWbbZ3g3epN80DWxSOXEOBx7fn+uxyD+LghU2EJOTtHco1CXdPN
 H1JCCezo64AN4L5esRgLJaqTjZ727wYdiSJsQgC+tVBTFN0tnmgXFahLsDq0jfow0jdtyA8nhma
 m+qsCSNbEm8WwN9S3AtD+WQdoWE/lw8Tw18PjI4qqkLQNCwTB8K99qNusXhbwo4chV0Wdrq9i+R
 jsXqEwtz6lewuxazpNqBJSG7+CksjWGHXpH9qKMNtzw/Fo2kiJjFD6ez52+CDkuIHtLMDtCFDe7
 wkZRm9lem9q8fvvU6V2hcH9s62kQTZ7WfYHz+NDxRb2/4GK2Ek7Q=
X-Received: by 2002:a05:622a:5292:b0:527:8300:3d78 with SMTP id
 d75a77b69052e-529d7147430mr5596761cf.70.1785213123501; 
 Mon, 27 Jul 2026 21:32:03 -0700 (PDT)
X-Received: by 2002:a05:622a:5292:b0:527:8300:3d78 with SMTP id
 d75a77b69052e-529d7147430mr5596561cf.70.1785213123095; 
 Mon, 27 Jul 2026 21:32:03 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85a2573csm54974574f8f.0.2026.07.27.21.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 21:32:02 -0700 (PDT)
Message-ID: <80f8b49a-2f1f-4070-984a-a0543b6214a9@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 06:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hw/display/exynos4210_find: Clamp windows to screen
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260706173324.804340-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
In-Reply-To: <20260706173324.804340-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a6830c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=p0WdMEafAAAA:8 a=DdBaGUreeh0kHB85sUsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDAzOCBTYWx0ZWRfXzpU4V/7UIsBG
 HGzRV7GdWiV6HRFNeWgs0HGhuahcLpnIz50eyv4JdkBufKAMfsgf79dq4X0gRW2SXStsA3iv90H
 Yx3Ksr0AbE2RquiW4/aw/Hm8qz2pmq0=
X-Proofpoint-ORIG-GUID: pzQf0fJ5_0aEbK9GzrxEYNZzXql7gvuy
X-Proofpoint-GUID: pzQf0fJ5_0aEbK9GzrxEYNZzXql7gvuy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDAzOCBTYWx0ZWRfXwv/oWVB68NMD
 oiyKBlFNpNIX9ZodKpcSRgFjJYszUDxLv5k3Qv4ylPSlrpn6YdxFR6dv9hjBd4z9rShpcJevyeb
 XTkQqAVGrZJB0sqmtBocAijEhluf8PBXwqj0SWnDwiCe2FmbssM86od3hymT8VElXJOqy243b7j
 UyV5gga4emcOnZfzHm7UC/u8hH2hCoOFilNWP7p+36wR+r55vj1wwF7VNHs77sCUBHCB57PXW6g
 nQ+eswhDeqXmtM4tZtsnSml9o93Fq5rhHQLbpRILKLgq6pnUhFAQv0jbzYl7bXW61QtgCOtn+R/
 dCdRc+sIJSAaxHsMoQLYf1/XlSJshJREqiMQltQ9cjGHkbTjzTqUiQ7l8pcNZVa2OprapvwUb4h
 a1iqiAN9E5D5thxVa91TzTo9IofOmrngDBTo0I0D1wDnptG9BPbb/AXoRo/BzkIfbDu997e2BUF
 o+oh7V7J6+S+FGYSVYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280038
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

Cc'ing Zoltan & Marc-André.

On 6/7/26 19:33, Peter Maydell wrote:
> The exynos4210_fimd device has a setup where the guest can program
> both the overall size of the LCD screen and also the corners of
> "windows" that define where the guest memory should appear on that
> screen. The current code assumes that the guest is sensible and
> puts the corners of windows inside the overall screen. If it doesn't
> then we will try to copy data to an address that is outside the
> interfal framebuffer memory that we allocate to be the size of the
> screen.
> 
> This patchset clamps the window coordinates to be within the screen
> size. Patches 1 and 2 are simple refactorings to make the third
> patch easier to read.
> 
> This fixes https://gitlab.com/qemu-project/qemu/-/work_items/3795
> 
> thanks
> -- PMM
> 
> Peter Maydell (3):
>    hw/display/exynos4210_fimd: Factor out finding screen width/height
>    hw/display/exynos4210_fimd: Pass width to draw_line functions
>    hw/display/exynos4210_fimd: Clamp windows to screen size
> 
>   hw/display/exynos4210_fimd.c | 54 ++++++++++++++++++++++++++----------
>   1 file changed, 39 insertions(+), 15 deletions(-)
> 


