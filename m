Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4261C44506
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 22:20:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJZz-0005yU-Fv; Fri, 10 Jul 2026 18:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJZx-0005u6-N9
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 18:20:17 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJZw-0005Y8-0F
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 18:20:17 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3U1F1752835
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 22:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EXunoHqOgcq+e6ruDWuc6fgIe60dFPD2aPrHMzdaIdU=; b=k1QACYPFzr+/g3yp
 364g+VWo4CD5QHnEvkm/hBcrupAaJSbtebtXFW3dwxB0Qw1wiAjhLkF+y7VRhVTH
 wUt9Ily6TY+ptHjFdr1VaX5XD3AqElElLiLsmM7NaR/gAW41p2XJ61YBz0GnNtwf
 umyBNsh2jBHVMYYKaWbwVQrGdT8aYSF+pVFZKnIuC4SuXzlv5TyMh70dpaHySVFU
 nK+2aATS9d2EXDvPmql3dZmDxcL64TSdjZVlFi/1GxLzlfgRIJr9RCNYr0KGaHCO
 7ms/8J01GqiAPcY4VvmFKRMOfhtxQNp5TBODx+Th5ZnVVHjqVj+UlBZmgD8zC6Fj
 gt3hCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb2pc9km5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 22:20:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c083f1818so15680781cf.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 15:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783722014; x=1784326814; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=EXunoHqOgcq+e6ruDWuc6fgIe60dFPD2aPrHMzdaIdU=;
 b=eFAsXsZrmYJd+9lwLCg4x4vR7b/M6R8pwdlQyCmDfuv9Ux6/x/c1JkRC7PH5YJScG6
 x32T8+O487vhQxChMqpozd3Ojj95k2UzjmHa1qaZie/thpOMWOuYFoKXTE6O1WXW5gAi
 PAmjUi72Dr/pHpyiBqlRkZs7WDGWsS+Tc1Y5Me2Rm13Jv1EBTAsRcGQnsjCT05MY5qq/
 3ITFev55StY6p3Ibg281VIVMfipGUu9ldRUFhzduKdsPmkRViqew27/zSi13LP6egLrs
 7ViNBVmwYxSpWFU8LtashrNc8mmToMV85sK9P2kfhw+E5ifcEjabE2NWcZUYxSK2D8Yf
 P2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783722014; x=1784326814;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EXunoHqOgcq+e6ruDWuc6fgIe60dFPD2aPrHMzdaIdU=;
 b=rhYX2plxlMQ0PIn9DzuqYMsAwAmgjNVJYAnQZbLMubQvUjzWiadTdEcFLyuCe/tAZn
 hrB7iYWFHDrSK7J6AYlUzrM7VSL21qiBUe5bKflZTHEJjCM7uGOxe1jW2cQe4c08poWt
 FJECvzDrRxmXxe+uWinHmDoveNw9e1A1MeLwb4z0W7fQ5MJIKBPaIT9BMJMbtRIaykwN
 DG+vfOtxvnazISnUl6czT6WpgCpcKyDVHt//SBjfW8F7cR0opouuzLEy3BZWHaE4KWF1
 4Apl1fwaUR16Npzx5CmsDfCzW9hSaIqnUjGnHs3oLWFSICAhTO1FNI7THnG4Jc3SQbXc
 teTQ==
X-Gm-Message-State: AOJu0Ywgv4ICdBdkFJg+RmL5AuFpKAWVyj1Jgtt7/5cYx0zZutomtnkM
 Xdiw0EFItrRBc6oNFGPg7GmpBcmS3NgKiDxDYNgkfeNjXDZ2Vt+w23t8DH2PtKejSde3d+aqYZ2
 uDX0+Lvuc9gzwkYSxlLVpEJWb/0cQ71PPTE5X7sosvgodNcrmGLjgbnmcW3BSu80=
X-Gm-Gg: AfdE7cmVrtHwsyhTfHchJHfnAMaNG8dJ1MTdMKCFv2EAprpZ//9O7eG/rzaiSDFxqzK
 q3svjtm4tqDgSj7Kb++v+u9aNC2q4v/Oa+S7usF3OGAyZSx7IgdeBcEBGwTgcCpz7HPUCKFSA1Z
 h+jkernIaVlaX+S1c5R2QlzQJhhxZWSp2gE5iBBFTfr7dEmzAimjg3bSXog4elOTG70NnIZPDXq
 wK4dHeqUmZx8cUsYIz5Nb4JwIecORGwdxT5qHjBcX27U1wsL9jXQqRQ4pODDJqn5oItwWdtCJSl
 L8JCvZi4tOpV3rnHK9M/y+TfSiEVOkGw9DGnAMgpWwgQn12CmaA6uNRX77DrDVtrRyWHQatgA6I
 tvv6DLNA7jCLQwd9TV29gDwQJvE+kLZhMw8bahfEkcPW03xH1KXNRPSIXMdZ7rQ==
X-Received: by 2002:a05:622a:1b17:b0:51c:c37:df31 with SMTP id
 d75a77b69052e-51cbf16dc65mr8091281cf.7.1783722014484; 
 Fri, 10 Jul 2026 15:20:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1b17:b0:51c:c37:df31 with SMTP id
 d75a77b69052e-51cbf16dc65mr8091061cf.7.1783722014078; 
 Fri, 10 Jul 2026 15:20:14 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d910sm61420318f8f.6.2026.07.10.15.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 15:20:13 -0700 (PDT)
Message-ID: <84421cdb-00c1-4999-9c60-79d61a75641b@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 00:20:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 50/51] system: Use tlb_flush_range_by_mmuidx in
 cpu_watchpoint_insert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-51-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-51-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyNCBTYWx0ZWRfX464oW1/dbcWM
 Z5j26D87klcG7eQ06EALa3QvN6A8dwfXZgqLXNaM3xHWJsxpd0mzQiRUGma4xvXjdhU1wkLMGSY
 G0lg63denT3+SlR49T8uXvc2hm/m4c5VRY1p2FR5IAEOXARo0iOhKGBDX2dJ+LRJkSTGL0acFbU
 CZ7Lglb0fQVg2ZBusYKIN9Idpqo2z8i8F0vv2mrgptumi/Mt2krLHF/Tede4JLNwp5LE75fg7Ez
 EVgv0UOFtvS/52Oahu/P67Hoto6ggE5lU8gjpO2hsmK1ENmSXSWkQZVoXFWe+ZtRygjAvTvgQBe
 aWtqbmeAhEHkADlCTtKqV9JJCxqL/kgWeI/K07W4S1zQk/LN77UXPGKLQn+bTcAU7X8qWS8W+eG
 do4pYeRZiXgbT9ezhDS26JcMXW7UZZS3nRKD7Kh3hpMPK/vLazaTg817F3zrNzrW0Bo8fnbXvnf
 gOdcFZ045KZfrlt3RlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyNCBTYWx0ZWRfXzm4D5TNlM/yF
 iIhXS11VQ8q48xWMj0QgKaDllOnmlhnrvpb2OXSlKqE7/ZcZ3lJI9hg3Tofaioi2NB0/y5DsRqB
 c9p39JO+m7SUPnH50f3yOcVD+2HcE5k=
X-Proofpoint-ORIG-GUID: Yp_43JXk8jPPm_MZCaFwZlpjpOENw7bg
X-Authority-Analysis: v=2.4 cv=J9SaKgnS c=1 sm=1 tr=0 ts=6a51701e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Yp_43JXk8jPPm_MZCaFwZlpjpOENw7bg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100224
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

On 10/7/26 22:54, Richard Henderson wrote:
> Update to newer tlb_flush api and flush exactly what is required,
> not single-page vs everything.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   system/watchpoint.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

