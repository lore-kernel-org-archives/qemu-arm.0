Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A9CC44506
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:49:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJ5Y-0003Bl-La; Fri, 10 Jul 2026 17:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ5S-0002OW-Af
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:48:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ5O-0004lx-S7
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:48:45 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AK3V8a1833088
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Q08WBYg09voeUmyJgL1bgmRNn+F8rmzhPp5iiUiaMzU=; b=Qf9adNC8KQBej1R6
 Ct+t/Zki7AHXQF7SRxkymP831mCvkEQrdLXdVx9tFqu1OkNUt2haESfBT3Gtusk3
 Rll/BA1CZADRm9jZ/9Z+TESxT1YssC5D1zvCGg59O0QAUUNS22KLx5NLDRXSsVpm
 3pGelTEUDZvRnwC971nW6SaB8Z9W0cvMVCc1Od3SAMesmxLd3agJo5XJEv/AhBWX
 aR0QSYxXIR5bK5LAs6uZ2tD+749Lx6cogWLaq8JsiX/hzDTcy/Ik3apVeeWMbM66
 G0mfFqACIA99V9CsXW+DmVdbbblR6Kijc7OH2R9XIQUlg/+FsLOkhFT+vwJb4fP9
 ZUAPCA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwece0m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:48:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5174a236220so14624121cf.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 14:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720110; x=1784324910; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Q08WBYg09voeUmyJgL1bgmRNn+F8rmzhPp5iiUiaMzU=;
 b=VlD3H3sB2Fm0fUv/uImbnV2pYBrx7GL3whbuk4shFCOdOfPkiI6OpNH6TnG8s7sIm+
 fbyhBmNoGrUj6gmxulncsD47m69OWcx3fbX2AfEW6cPGqK7PSATehXatC8p2Pr1TmBvj
 egy4BNAly2WjAMN5AkSYAEMrTZ/XCa1IC/APAYthT+p60T9T/W/TAksB1mL+Gm3tO3IS
 GE6tUn3XKbbIFra9WNThW0Dg/BsbcLQ7ysyUHd17mCEbYLRoNewU+NbCQsKGxFCwTMxw
 FjZScr/16oDNbrN3OJc9x3fnb8fWaCde4i+bdasCQ1ICGlrwo1+87TAYPCyXqONUN7je
 E/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720110; x=1784324910;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q08WBYg09voeUmyJgL1bgmRNn+F8rmzhPp5iiUiaMzU=;
 b=aDdHckyohq45AXl6MkGnKE4ctLeGLYj44JGkOebcoDIzpkxS3w/QUUYwxoOVkyOwXi
 OA0fxKJExkLtCJKV0xXpPoJ5zv6F5D/W3qdHhkCU5y2E+ZtImLjtHsgreQS2fORohjF8
 p9TyqX3r1cq+eIaXxl6lWRX7qUbrJPVWoScSDz2OEpLu/k7ChWh/wsqRV3h03e9WdTDA
 8d+MOPVqrOrC+8CtFWXJGMNHhNtMWFgXUvz78Nuv6/g/Up14xJljSMMtCj/nNTqPjEfZ
 AQKmlxefuTmS7iIZzCO+LyUnVPMd9ETcAWZCzkirk522H05rpffvDQWdqskRrE8D92IY
 535g==
X-Gm-Message-State: AOJu0Yz1F5Sedq8vtY/xzaGjI2VugdeeenmagN3+Me+mp2oBGGvm35UX
 ebXJrqnU3hxV+mHQv01dgtmsahglfFFv4Kt3mXS7NtsmHbCzju8v4qrTjkTye6fljTivrOAPehf
 BpuftjVf92ZYnC7DsPvPq0KvILLJpYv28zg7bKCQXNb/7A6JQPtrabWw=
X-Gm-Gg: AfdE7cnOVIIutOvmDiOMDwe09o6cq6yJMjrPveK8MwTT+fSKuX/cejfmP/++LlKTqHX
 qpZBO3PFbciq0gqQh+iMzAKMVOCEllUR0PCpjQYLNExAfm1xLmzkCouGgQ6FEalW5y+MrMkGjuR
 Sx81bVsYBy+TXhEBjSOys/MkD9zJpX3Rk9qoIc6tbRiqmZWDcOPy8E1wqPAGkWWk0wG0n9ow7MO
 4KhPNl74ymUEy/MCEX4XdAp24IBVRH3qXNnEPmJXiqniVhneepzL87/GZ7T/iw09s2mUuhuceFN
 18wr/u6Lt9lv++fgLJblCM3uVGgslwTOslKJRMMMsfgeQKeT3ny61M9ek6zpmoJBtMDGF5FB5gI
 6icEu6yoO2wRNK3vVYaMd8xPTXsLFvgTLVN3Xsp4mJoocZUSnfRm394S00xe+aA==
X-Received: by 2002:ac8:5ac4:0:b0:51c:7b13:62ff with SMTP id
 d75a77b69052e-51cbf380b99mr6797671cf.85.1783720110545; 
 Fri, 10 Jul 2026 14:48:30 -0700 (PDT)
X-Received: by 2002:ac8:5ac4:0:b0:51c:7b13:62ff with SMTP id
 d75a77b69052e-51cbf380b99mr6797501cf.85.1783720110143; 
 Fri, 10 Jul 2026 14:48:30 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6ff6casm200671765e9.5.2026.07.10.14.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:48:29 -0700 (PDT)
Message-ID: <1c3f9bd3-d3a9-4647-9f95-c23a5cb74d5c@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/51] exec/breakpoint: Add CPUBreakpoint.id
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a5168af cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfXyk0QW6NuX9UF
 KmIh1Z/n32eMrp8cFvQOWFx8kkHfA1wZRu+yge2E18bnDGdN55O0DYk023PppAq9fSe1vrZK2ti
 biCY/ilcBKRz3XtbRCn8Ixpy01aPTwATvPAA/5O5phbcX8f8veW4M68INC7i0AcGb7lzc++sOrU
 hWOgRbrePlXntvJStQVFD/Zq/QSFcdmIQpDWqq6BeIgUAEAAUXrt124b36DZ3HUrCZlOaFMI4hR
 9d4h40F5zishATZ5HN4EqJO1EyA4ub2iVgXBLU02nsEmIi6finn8f15XhkS+iFJcp40DcaJd6G9
 TfLq4O2Ya81OwrjfxXLAAsTuy4qNO9fVmLxq8W460fSHeaw1h7AwrVTN65JELo3xvVlbja2UsCY
 UcJRG5JYouh3e6BsDf31w2uP//oCKRsa8GHOXpYVjVHSKYjgNyP7ohGDQdZ/kuhkqPKvr9WiZHm
 D1z0NXteP3nXwqzCtnA==
X-Proofpoint-ORIG-GUID: jNKZF5NAonKEOEVz8H__oXSXfK2BjgAy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfXzOwEWP/CH7qN
 4nKlILt0GHfc55ziq61fSDkQWoLJURgh3lN3FFBJhj4xNn7wThc8SC0b5ksK6UV3SFmgdiRPZjo
 i+B6+mLYrJ4XGIFZJmRXQAMoByjU/mc=
X-Proofpoint-GUID: jNKZF5NAonKEOEVz8H__oXSXfK2BjgAy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100219
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

On 10/7/26 22:53, Richard Henderson wrote:
> Add an identifier for use by targets with BP_CPU.  For all targets
> the index of the hardware breakpoint resource is to hand.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/breakpoint.h           | 3 ++-
>   accel/tcg/tcg-accel-ops.c           | 2 +-
>   cpu-common.c                        | 3 ++-
>   gdbstub/user.c                      | 2 +-
>   linux-user/main.c                   | 2 +-
>   target/arm/tcg/debug.c              | 2 +-
>   target/i386/tcg/system/bpt_helper.c | 2 +-
>   target/ppc/cpu.c                    | 2 +-
>   target/riscv/debug.c                | 5 +++--
>   target/xtensa/dbg_helper.c          | 4 ++--
>   10 files changed, 15 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

