Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D206AC55171
	for <qemu-arm@archiver.kernel.org>; Sun,  2 Aug 2026 14:24:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wqX71-0006XG-IC; Sun, 02 Aug 2026 10:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wqX70-0006X7-Ct
 for qemu-arm@nongnu.org; Sun, 02 Aug 2026 10:24:22 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wqX6z-0007Ns-37
 for qemu-arm@nongnu.org; Sun, 02 Aug 2026 10:24:22 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 672B7v8C1793034
 for <qemu-arm@nongnu.org>; Sun, 2 Aug 2026 14:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 foj/7HUB86GbO3zNQIdsT/8B70YKda3puVp2yQxR794=; b=e6S/7OJ/5gmpL7hE
 WFPR0AIv7E/gYQ/IW1tOoLpCDGaorSxC3e9TjPpNRDxOve/PY3HaHn+QoIP4rxXI
 ed19xYq9Ml6/TfCelqHKkhyN7kv6V1qqZhSGTZiMxPwCcquXK4H0NlGqh9NIMR7l
 klHylVlYd63DY8IgzbjsgGGZ4TV5+a8CFl/fyB2RXbTfSiiLrodZrkYM8RI1Zfkv
 5uUOGnrAfSMWta9jQXNFQc/UCJ4QTiyCdsf+L1wQIZynDNZsn1NiAkOA+h7rmwBK
 1DiAN7LtXFIHIbaUi6xww7H0l4qRYVb0Asir16uWaXhq6k/KxIQ/MYdN8m4Smm05
 /MCWGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8tx3124-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Sun, 02 Aug 2026 14:24:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c1a97644aso25353941cf.2
 for <qemu-arm@nongnu.org>; Sun, 02 Aug 2026 07:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785680659; x=1786285459; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=foj/7HUB86GbO3zNQIdsT/8B70YKda3puVp2yQxR794=;
 b=DXdx5sZAqz76g4Fv3IqX0UQWgkEnI3A1CbabRu73grZtG2LzFwsVWcY3CZiHruBAzL
 XADh04ARkZX0Vpa/yWCTudL6OmpC+hOsdAunj3SGO0yJ2PLKcTdGbCJKjWLneY8u7BOh
 wJKwtjhEZCstIIZhezNQ8PKvDzi3dTcdJL4KCzLStK9NJYvBEKz1RhZHNldFmB6J+SoF
 AYma38wxPogdjPNwgFbVqNo0dh3qqWSoa2ThE3kHUDeS29+K/6iebVp7cmqPTnSGHQQO
 7fQEtwQI1ut78qH5Gtk6R0oFqgE/dof9UF+/fG2Xtb77yId7BSBOzBjBTOPmZSv2Lbql
 wdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785680659; x=1786285459;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=foj/7HUB86GbO3zNQIdsT/8B70YKda3puVp2yQxR794=;
 b=BqK0hsFbcxNER86L4t8f/Lde1RstI6S7wm0he8n6NIUyQE/SayLwaA6i8k4+I4yyY9
 71MtI4yv+eywSfh1o7BPrATiymgmA5cVewcMc7lRIB0vfCOnl5PK8bAcJiAAdS7J630U
 s+tn8CnO70nQCQlGiydxTJWinv8uKemxgAmV5NXEt91iCj4/yx5dAoKmWApRTXJX3ylh
 LpOUhbRcEa76hp90aJGIhsDqgfjpssemCCuxRpKT161tUj3ea98wztVJ3QWv8/DtTST9
 9RIq10rdHhkQhvDWYQmi5MhcjjRiycVTfHV07AdISrZNvFmmY326GJQk56Nx6fYYH+8e
 j9wQ==
X-Gm-Message-State: AOJu0Yx/+9O5E2GYBPHrM5AWFLBeua/zENd+lSyrbaemfRAspRd0LhaY
 RaED2Asyp7QfNB8T6h/EebKSQd/vfrfVCJKdZdss/qf+hEe6d5PDxh3Mf0dzN4t4G/kH3FL7o1W
 bHJt0hVGxjtPwOIOLiB1BQRsfdgHcXicxQJ9P2Lptbi4orEOfetwLGNU=
X-Gm-Gg: AR+sD13CX3QYBPKtTmfys630+qy1vP6qjLT3dMVUjuHUO2jbgCm1HpdKqSXL0gShmPW
 FpT/E1/2YWW/M5s+kE3yJELHoIyx2oy2QaVZfaIWO+dmhHWwASK/2jQjbJq9gnjyCp9fjeZIFUN
 N9D2cMhling2FAYd9RdAf4WVtgNCZwZdYQRNz2Oc3u9tDkgmhgurAsQs896HYzXPF/tEYDMF3YC
 rI2GFd79oDZFUMMN/MCkq08Pkgs1MxndjT+ypIVAdnBi3gKGEtcknHr9bMr32ab8ueVM6YLnQHV
 EdkQcEJIHhn7QM3OLoINN2jJV402IoBz1zoW+UANDLwA3vFTFshFcgPB0QAy0E9mD/OV2fUEP2B
 1uFXBMcfe5HgIkv5HTlpWeQX1kZIWVQqCOtlusmiO2oNdqBQm7V8=
X-Received: by 2002:a05:622a:c07:b0:51c:17cd:1fd4 with SMTP id
 d75a77b69052e-52b56845401mr144592661cf.41.1785680659101; 
 Sun, 02 Aug 2026 07:24:19 -0700 (PDT)
X-Received: by 2002:a05:622a:c07:b0:51c:17cd:1fd4 with SMTP id
 d75a77b69052e-52b56845401mr144592161cf.41.1785680658689; 
 Sun, 02 Aug 2026 07:24:18 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41d17f2sm27825355f8f.2.2026.08.02.07.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Aug 2026 07:24:18 -0700 (PDT)
Message-ID: <fd0895ce-8474-4e9e-8a71-268069b7b993@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 16:24:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] target/arm: Rename isar_feature_aa64_idst
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20260724031123.76597-1-richard.henderson@linaro.org>
 <20260724031123.76597-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260724031123.76597-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEyOCBTYWx0ZWRfXzjmeFsM4+ueG
 8vrJeGcYeCjEK07u32NURmbagIiA9aS+93uNQ1D7/tGCCpg7Wpz6L/0lgL57EJBGTfjKzg0xeD5
 HKQxnwYPXxpkQh+24BEcP/JpjfmJ8BD5O1S2Dx7Ek8YCc4Ybzyg7KKnnLfnuOogMwiBpn8ajfXj
 oGyecYjV0CvZx+9Ua8d6Pq5AsHroojE+YIT08CYVwy8UJuiDxMyLKaiVlZqBQKL+qycjqJGKSRs
 wnWR4ye/xzCnstwE4cJX3Hf1td9TROTSaIDH5dA3vu6G1lt5PpUL9LRokWVtHrgE/t+7rMdOnzs
 62u3QM95gOM2Oqonr0UakTE/1Y2WjHyQxOY3jS3X1UDMV/K2Pq9IFPspiURT9EeUrMc6p7LV/tz
 zvEMYm2YQ2RMKghwsM8jelS+0B38gA8pSVt/3Ip+WHK0TWTdnhXlr0klA/stR4XGVtK6PoQZhm4
 R9Dtjh8yw2f1M0VT5xg==
X-Proofpoint-GUID: _r_Q3SwQJYY0P-C-YgzNWWD2vwNvuVDg
X-Authority-Analysis: v=2.4 cv=T9C8ifKQ c=1 sm=1 tr=0 ts=6a6f5313 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEyOCBTYWx0ZWRfXwu5KaMCC3Xiv
 a93BRMVBTs2dM/WVFOZbBpM7BnhLBiKJkRmRYMl4tVQnLyIOQNcvge5J8x3d2E/nWrMJTp7pe9L
 BcAu83E6E+rJ7R4n+836I1j4lXvjMWI=
X-Proofpoint-ORIG-GUID: _r_Q3SwQJYY0P-C-YgzNWWD2vwNvuVDg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608020128
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

On 24/7/26 05:11, Richard Henderson wrote:
> Rename from isar_feature_aa64_ids to match the feature name: FEAT_IDST.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-features.h      | 2 +-
>   target/arm/tcg/op_helper.c     | 2 +-
>   target/arm/tcg/translate-a64.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

