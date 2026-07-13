Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A74CC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 22:02:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjOil-0002le-Qo; Mon, 13 Jul 2026 18:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wjOik-0002k2-8F
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 18:01:50 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wjOii-0005hC-7m
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 18:01:49 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66DJ9S0J2435365
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 22:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AXMScUxqap5kjhcIahQB25cd+fF11bcYm5XE0CyWb6c=; b=BmwjaBseZcVOmQiM
 O9JoR/4fBthvQD7ypDRvgyeWNt51JzUIkyoTFt6OMppDFzLKFTM9wYk8hIMR/oHC
 iWmvPnHMTAk/4pXEcdfLAAaU6i2MLINKEGEDb+/oD2L+/7rztJHnkY67f/a1C3yH
 u81RbPmxL+h/xTN7QUuzW/CWznYOWfZgKkKsi5iPfWZg/YgShTuAxiRbTgA/z+g9
 rcUDYIiETeJnFlrKUxwFAspkSC1bItkkcoYgdAgke+AjClJSKuwwLRVkiDuR3+aJ
 9UALQk91gbZcNfWB/u3PNufWT8Hk38panYqPcUKG3ghwo7PRZNBFquCzPEGn5l/l
 F3NLrw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavtt3t-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 22:01:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-388b404eaa4so4870305a91.0
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 15:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783980106; x=1784584906; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=AXMScUxqap5kjhcIahQB25cd+fF11bcYm5XE0CyWb6c=;
 b=bn+kwTlmWn7mD2f+xlzMdNFNLqqSPubjnB5fS3lqbGU1GSglU1GI+Mst6fnhs1/9Qr
 TiQ45o0LnEe2pNHpznbTQ51TyGmWfotTS6aN8KerS+Fw550vUvw0otHZqMG/UXG1iJJR
 lZoawvpHKM5EEIt4vdCdSGVbGVT6OPMpmuYaBrR55ERCoCJull1WVq2t/Pi3dz60mY6y
 FSNmopxAJkldrDWMR1R4U/qqi0yIDNPxCFHP8jnRtuXn25cxXUKIj6XrKsrFvBgsf8ds
 H7oTtUneaQLADV/QCSV2W4g7TP0X09eex7+9GrEr0gdP6EmiJi6t3Ey5QiL+CYXI/Zmw
 G9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783980106; x=1784584906;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AXMScUxqap5kjhcIahQB25cd+fF11bcYm5XE0CyWb6c=;
 b=ETs6hN+TDhaWNCYZkHprYFJ6jpT5E7xhSO7Pk5pym/3DXgMTihUvMBTnlsZuNpNvax
 56bPEMq3siU4ltHAGjMlX9Ut08nDVFzOAYw8KxfeGpe005LTkOSJmVPCQu7Zqv80cbm0
 2Wpnz41HvMvDBK9gy3O394R4YWAI9x+W89kVewe2pT7eYbUHkG2sMnzkwZOO8gzQNUIL
 I0CR+u/w6H5VTLvR355hd9UHlesoOubDlm5apc12NPFq9ZvxBzMLkyG9B26cKDQDvV9n
 OMYrZxERt6SVai05cIP/Se0/3YNFmgtkH1eM9ayR2H18ABjC8A3FVAcZcaCHYySceGL7
 Dlkg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqUS7IxLtfDhW9TyUBrvDYyYCBSjXrqIAFbeQOtQN+7zi6K78lIAHQa3KcgdjnDWnv6iP85boD0UQ==@nongnu.org
X-Gm-Message-State: AOJu0Yya4S2EVy6apEKtqplGbEoKlDcaktOApXe/TH8kDxWnOcJS0lSz
 IOhS1PJdzGXPktXrVoRXF3SqP0P0Qz35DSwI9SsaOIdERI+nXxFsLQ3Ub69kFvS5V1Sz76M2gPi
 Dzk4rmnX/PCLFwLawzvfHcFk/AneBZgIdHju25qslQ7TyPgH4llyHtHc=
X-Gm-Gg: AfdE7clfFflsWBmcvVIf45JBZ2ru4G6ahGkdtAFE9lccS5r1XfJhVNDXpPt0zDXIqYx
 eNYg1jskMnldM0+/2G4XCmRc6mejiocq7Tk82Knndt3xWHn6J8EY6iCShTLzN8auMPgtvFBibx3
 y1TYbn8IQKZ5gwopfUFZO8RBzcgcvCMT0z002CGRK9JDPlf3NpWvYvYftyV7gG8OO3sPMWcWmAi
 +Rrn1WXETKxC2W2n0G8xwFWUjjsQoRWQxBIl2L+XVhk2o2vd839t3foI5YqcSxxlUaovyHgPNlx
 GXrUGY3JsyRFTB/NBCDzVUXVyYbxe5K/cZFyy010ej7u2Y4S8Sq442aQiWaRXogYbe3uHVuNcMh
 Q3ZcUkIbBWRjFzOUDMP7sgdr/jaNpP12vyurFB2TcD1hPC6nExsKFfs+cKU842eoCecefE/jNQZ
 PKV7w=
X-Received: by 2002:a17:90b:2dc7:b0:387:e0db:3d89 with SMTP id
 98e67ed59e1d1-38dc77c33a6mr9647958a91.36.1783980105996; 
 Mon, 13 Jul 2026 15:01:45 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc7:b0:387:e0db:3d89 with SMTP id
 98e67ed59e1d1-38dc77c33a6mr9647926a91.36.1783980105587; 
 Mon, 13 Jul 2026 15:01:45 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3119d5cf176sm48890968eec.12.2026.07.13.15.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 15:01:45 -0700 (PDT)
Message-ID: <f27a66b8-0b74-4f01-916b-594bf4279d87@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] semihosting: add callback to set error
To: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: brian.cain@oss.qualcomm.com, marco.liebel@oss.qualcomm.com,
 philmd@oss.qualcomm.com, ale@rev.ng, anjo@rev.ng,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1783973054.git.matheus.bernardino@oss.qualcomm.com>
 <df1607f5ee373a1ecaa6f88bb56fc64101d818f8.1783973054.git.matheus.bernardino@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <df1607f5ee373a1ecaa6f88bb56fc64101d818f8.1783973054.git.matheus.bernardino@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ud_MF5LspzEwQWPbjvF8BbnKjYLVM3gs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIyNiBTYWx0ZWRfX/GKePFmJYdQ8
 3ZElaEj5gs92vvquF+Fm8EgPGMDUl/97NpTs2wlxy1n0cTwQ5lmHdVOSiu+WCxtWxH1QLrDV9I1
 AGd/E2oKgGOJ8uq8EVHp0FTQ4DX9BkP+YPrKpRsphtgs/AOmrP8/skALlpcq+ES8+Cx+AO982vw
 gxeoQ5XRNbBTFiVYQM07wtQi38t25fPRA4ZTrmEU92a1FlYnIHFZJa3j2RBp3Tqa0RS8GgJvHSo
 wqtAU2Q1UT6jFh3dxfmHCVuFrQu42heJT3x1x1S48PlV49HY2hf4+D1ESg9/1ef3F9nAk5/pjvO
 NRKgKDnegLs0ek2m/XkgISgNPV+K/cUlFPk+n1Si0Lc3KJp/RiBLgYPlcOLQbTRTe2OI6xwrVDt
 B0FYRbHzHV+l/yoCYcbGMGkxATOp+HuvEWDK70aEEWXqGyV2BbhobiPPFq3oGhN2EQ34TZbEDdW
 4JXJT/Fqq+Vo+I92+yw==
X-Proofpoint-ORIG-GUID: ud_MF5LspzEwQWPbjvF8BbnKjYLVM3gs
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a55604a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KdzvvqdFADfKUjNgu8wA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIyNiBTYWx0ZWRfXym5Vvv47+nry
 HD42tXlMTfZWQy7A+MxuCnuwudzXslD42erDRw7BbvSOXqrZ7sS3QqmHkhJCSgSkRDzZq0B3oKI
 u7w1+owRO3W+adF3fyOQ2C7iTtGhe0k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130226
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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

On 7/13/2026 1:07 PM, Matheus Tavares Bernardino wrote:
> This is currently unused by existing semihosting targets, but it will be
> used by hexagon.
> 
> Signed-off-by: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
> Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
> ---
>  include/semihosting/common-semi.h | 1 +
>  semihosting/arm-compat-semi.c     | 1 +
>  target/arm/common-semi-target.c   | 4 ++++
>  target/riscv/common-semi-target.c | 4 ++++
>  4 files changed, 10 insertions(+)
> 

Is it used in this series?

Regards,
Pierrick

