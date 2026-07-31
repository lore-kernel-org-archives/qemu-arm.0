Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7311C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 07:12:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wphPj-0005RV-9y; Fri, 31 Jul 2026 03:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wphPc-0005QR-Na
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 03:12:08 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wphPa-0005nB-Lq
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 03:12:08 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66V71QPg3758590
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 07:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zwqwJYlVzSvFuv76ZbXiaVPZaVp7GOEuu5uNBk1yvz4=; b=eIbUw1cGaXLKfhe+
 LBsz5Ktomrbb6YZlPQcf4liXM5h78kPdtvRkn8ixcBqos0h9No1EaBGREd+EFcWC
 Oz/QUyw/2EurKFlbO9T+yxmVfwokTnEM468QCqEJqG25UmjI4J4Bk7GGmh+XLR/e
 IF946C1cV9TUH0+lxeq0Jw8BKUIa6ZsfUwTuWLyorcXYpwvI0dBioZ1io/4w9Bom
 rTDM4h7amXEn+iCXheoWWVZUY4j6CXsyxvUjp1ueDzKLhFV012zhBOgPML0RWD8m
 CsDBvJUTD8Nv9CqFygQeqTzTelWBSEbKOs5yJzCNuOaedknkY25d/s2DWTBaKBuH
 P5SkWw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frpxvg10y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 07:12:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-520a00c7a03so11389621cf.1
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 00:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785481923; x=1786086723; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zwqwJYlVzSvFuv76ZbXiaVPZaVp7GOEuu5uNBk1yvz4=;
 b=IgwPV3MMjmUsxDnA+dVONIIQaJlshqPYF7YEhuym3yv3Y+Kn8h6rthOV4jEoQG9ugu
 01172Y6Jt/6XhuTo32JTAimKggkUBdBQ8PH3/9/nBNBkCp0oWCgpLJU9LxQzGj2o2J8m
 GhOr4K6G69dlGL4ivcxhjATNdnXq0riTV+6KqmQn5ko3SS89Sw7Fl19DLadrpwrynksE
 hZCcF3ld/SmWLWNNiH/JK74TsegGjYGxilRmlwRcDcDM6fZKQwUVRUuWCBmtZe6iyOQw
 v2I0WzWvDzoyJmcLpY7G7UpPxs6OWvdldH58jOKHzPaPPXncB5ya2QPS7CS0q2pUMf08
 xGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785481923; x=1786086723;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zwqwJYlVzSvFuv76ZbXiaVPZaVp7GOEuu5uNBk1yvz4=;
 b=QmLNRl27aJas5J7UYTSO6qhnq9vKgJron/1TRcg/qier/Cig7GvMg57AwzRPMuu/jG
 VWAFiGUbSojUVkFYEndXPIH/A3lAyWc3NxM1gO728v/4aDVb8/dVd6lJOta1wttMTsbu
 F34PTbvy34VCB2NK3Txy7eIpCXinAZRJI71N8qWSI1usPwZ8X99jM1f6Etfcz9dHWR5B
 QTk9UbGyIDCkDyVyXDb+1cqaAS2MDBOXZoiZIhasd3ESieqmaCypOj5PhQ50GLv+VgKA
 okhRwJ9zhgipixCsRb6vPAAyR5YzUA+ZwDw6hLD+knxATUQUQ61nVHZFAXevMeOTQCau
 JuAw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqlOWTfvqFlEHmiUegBJu5tuL9M++0CMaWZzOFOUfCmnbVhc9/+kr8CvIbi8LWh/Mnrsgej1vC50g==@nongnu.org
X-Gm-Message-State: AOJu0YxtEpuE9P2Rfk6To9US+iniz4xbMcCXa4I0Q/EekMTJPFi1C2Gv
 AnLXco/7oHMyEjYkWM3psbDyCFT2lqVkz2aauAa5vrye8nssuCVfE4Gg90ev2feVFp81HJdgzq3
 x002Kdljc5ft27j9OH8MeuMEACOFCUMfv6l2iuq9KXMamRbLRmo0xTkw=
X-Gm-Gg: AR+sD11RFwuf+BdK5FqOKnX4GVoyTnpc8W0ZS8cw8Zs0da6bSFza0dPSHnENd7HfCQC
 4dUoCVNd2kmNWQFe49HpYJc5F1PEoybv/8tUqEmyc4nVkjNBFj/QNA+JTbO6/UsSJU5/EEoyfvV
 yKoydH6/+aFg2vQUVpUW3D51ATFqn/dAKNYnZOV8EyLib+x+LZeaHq9S0CXFbmPca/NqgOoaBrb
 4apmvU/cXhrV59YPz19VbCSSWwKgMOgMO30Nbgkfeqyy8fTTR/E+5Ajwq5Y0EeTYmPBzYtOSNCl
 grWQ/3Uf3Vt6RnAhss2yH9VGeDWQ3kkdUbczl+iby8uLaT0I/6vBtmoiCJANdZoB4aQ0tgSHuCp
 rF7tMoBmk/i8x8OJIc+TFvRiaYr8YUqX/rRqvIaixz5Gki4mrLec=
X-Received: by 2002:ac8:59d5:0:b0:51c:775:c175 with SMTP id
 d75a77b69052e-52b4b033a03mr10787931cf.40.1785481923081; 
 Fri, 31 Jul 2026 00:12:03 -0700 (PDT)
X-Received: by 2002:ac8:59d5:0:b0:51c:775:c175 with SMTP id
 d75a77b69052e-52b4b033a03mr10787531cf.40.1785481922482; 
 Fri, 31 Jul 2026 00:12:02 -0700 (PDT)
Received: from [192.168.69.212] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a09c63db02sm437415a12.14.2026.07.31.00.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2026 00:12:01 -0700 (PDT)
Message-ID: <1150f1a3-236a-48ac-b22c-e91ee178412c@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 09:12:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] tcg/aarch64: Implement revbit{32,64}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260731000503.170446-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Hkz-kVXXNz6q-07GrKmIfhQiKgcyR_b1
X-Authority-Analysis: v=2.4 cv=Up1T8ewB c=1 sm=1 tr=0 ts=6a6c4ac4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9jxvZFSeuu5kULwckcUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1MCBTYWx0ZWRfX9wpwlVmVKBwG
 D7GRmtCnL+sx316iqeAZwjQxLs0QfYy1S0oRpNbI3+mDWiQBR426xmnz3OCF+L2ura9CnzwqHyQ
 K+PGJ5GRsY4/oPnd2QPWpWMTenWk1W96II0FHNiYeC/pf2+zJquZyb+A18iPy6RMXjJnuG3RZPN
 vsXlhDUTJ8vOgn1lo91dUuJVJU0Shot0WqeSa9Q5bGCNVWD6raoH/RNAg3zsyxjADl77ZLeQaqi
 npPd3K2NTbetzjIhYvkw0kq43M/JZ1zQKHLMFHLS1MLaEoP63qY3R6tYEZITshgUxZ6l01zB34j
 HAwVrGE8raBfO1a7vyupF1IZZEpO/yUdEnjCVVzEAGx5ysZ+hedPO1jWur/yxLGpQ29KqWTNbpS
 70IOVd2puf9nKxH98ZMr9wsm88oLP8TLYl9DlXa1zIxPI0w8x1ug6JxXGsJO4Z85/rNofC8R+rf
 +VoUhPWGBcEFFMtcLiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1MCBTYWx0ZWRfX7LkwKHMcEmxo
 lE8W7pzuz+l6qYmpSjeBdr8fl8lkLNdIeulJxihwwML9Q0m/IgNNf2gTIXjCHM+8COcKvckDCn1
 XQixAv3/yDh4suCy4Y4EUdcGza+kQsg=
X-Proofpoint-ORIG-GUID: Hkz-kVXXNz6q-07GrKmIfhQiKgcyR_b1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310050
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

On 31/7/26 02:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

> +static void tgen_revbit32(TCGContext *s, TCGType type,
> +                          TCGReg a0, TCGReg a1, unsigned flags)
> +{
> +    tcg_out_insn(s, rr_sf, RBIT, TCG_TYPE_I32, a0, a1);
> +    if (flags & TCG_BSWAP_OS) {
> +        tcg_out_ext32s(s, a0, a0);

Back to my comment in patch #1 about having bswap flags defined once
per target, that would allow that kind of change to be done once in
common code, not per-target once. In the lines of:

   if (backend_default_flag & TCG_BSWAP_OZ
           && frontend_requested_flag & TCG_BSWAP_OS) {
      tcg_out_ext32s(s, a0, a0);
   } ...

> +    }
> +}

