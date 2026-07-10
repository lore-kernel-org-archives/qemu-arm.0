Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0903AC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:48:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJ5R-0002Ml-Tn; Fri, 10 Jul 2026 17:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ5O-0001zP-PN
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:48:42 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ5N-0004qc-22
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:48:42 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66AKDcb31811766
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 S8qlgycSTJcCt1NmO2CiYGSD4smZGGH3PoLh0rbZ+uU=; b=MIzXo4w8iL+3OeG7
 5NrAITxP8ECO33rX1xn3fpeGgEL7/w8ddX3xoSWRPMxszm+nr0C7O2IfQW37LlzF
 NYfoQMzvz+N7n0nCAUHqPjEcPmX07U8lH96YhUl34Tl9MSYE0nC+T9qlt2Sku6Wi
 8PaCxSIelbhyxfFnLUbsUtr7uMw5JUnU4yS8mSfhWV/6kNoyE2rgrmM7hQuHX9Cq
 IGSj9Eb8u0qas3JvR92PVlA9uh+q5gDOqrYQf6zPpo6weIe81oAacn3YciP7WLts
 stWXOQno74HacJRYmPtaL69ljY8aMqoiTEQdsVDY6r9tzS7TOPfcpDlSvYv8WsQi
 syQGpA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5faj3d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:48:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1d137a68so30070611cf.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 14:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720119; x=1784324919; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=S8qlgycSTJcCt1NmO2CiYGSD4smZGGH3PoLh0rbZ+uU=;
 b=ilvLU4AEKiuJ/Crysdf/ddrZght3QVA9isDFkJ6XetiHG8WpeaGxJwqduQw6t/pOph
 vR/f54z9ItZ1U35jW2xOsn+FmRTOO/P9KjytuJIiXNJYgrVWzsb8I3qvdj0JQ5CdmJ23
 QqHfjOA+rWw07VHdOWauJa4xynkVFX0B1F+aOzirtPqJwKlcj1Ab6deUfspLZya2pI6U
 bNV+wdJOMiW4kFz0tXBzrYLzWeoHhCLLmCRO9awwcvjv80xWzH0K53CH+e3RGDj9/awp
 VoRw/UQnN0DG3aeOCnGYRz1RciLQm3Y0UZ64136NWRfL918aRs9Uqu4Xp8kgtXxZWuSR
 Anjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720119; x=1784324919;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S8qlgycSTJcCt1NmO2CiYGSD4smZGGH3PoLh0rbZ+uU=;
 b=dzNO6K3IGz9BuROoacFCst+YHaVi4uAdL/0zmnKjM+GAUEkydll4IbKYGqTQtSl9kQ
 Wr8GkdqQDrRB5ZwpJmj/ZHt2WdmjQrMNt0opthNcK8ja0jCMZyxaCFcG9yZMoGsWaKk9
 TcniR/vufsHvxkEvLNKblE9cQGP69+xgdtXBmSz8HZDz/gTv0BAAsSgGOMusWLH4Vvb5
 c19geSr8g5ddfkWhRBRS9JwGR1RDR1pqZMIAMGbPRv+uOaSfOikwZVWGv5fFykoX5ao2
 YTpCegBe9aoyIHFm4lT/YKy/kWXskVqsxeKWWCfSktJo73Z1qxUba5nxaMpoqW+6hDbo
 4cuw==
X-Gm-Message-State: AOJu0YyBrZhZ3Ud7GDLW+SkTzDFKKnS3iLTMPSrghX7CjKQr53f5Nt9f
 6S2gsgZopUCedCpInGcjKUFKyETzOFZerUFw/zMCWdMuBnI/I+i+Vk0kvPTIM5GbYBbD5ejmVcQ
 LQTzoqbrCjm5tbvBCxeqvf7Agoxl29o8IGNdc3dyjGHxavLKKaJXu9fA=
X-Gm-Gg: AfdE7clHz+Oq3r23A6DWyzNwmtkuf58B+9QK6WPZKJ8AscowYh5Pn3n/OtnqtyC27dI
 UZoxeGhh4A8YrsYX2pIZbIn2tZTCvyxuHAY3pAZX3CUzdNsUkCugJIRgRVrNFIUf+l9pwYqusbn
 +TxkBjn69iyLu/eXCLbZRNdf1q2qeQcaSUfIKyBdE58UNu5m9kDtAKmksQCHDDl/5yyxBa4Cgpj
 ThhHCme5/JHb22+4J+nk7666gGbSXfZwplkx01XO7yYzaQRBoloE10jyt8Dl9iootiAByav41ni
 bKZvCOOEq9VkiqepBm9XLDNtRyytaSc9kJbnYt3zNnhnuD4/wTPXm7Ik5kmKWBogMsMmjUlmqDK
 QYtEzvzZm9kFGnxY5RYRhC8ldP9uUZwsbbs3HBfUSCPa1QKguPIk5eVKdVbpnyA==
X-Received: by 2002:ac8:7c4b:0:b0:517:6d82:ceff with SMTP id
 d75a77b69052e-51cbf0c4a59mr8214491cf.13.1783720119476; 
 Fri, 10 Jul 2026 14:48:39 -0700 (PDT)
X-Received: by 2002:ac8:7c4b:0:b0:517:6d82:ceff with SMTP id
 d75a77b69052e-51cbf0c4a59mr8214181cf.13.1783720118961; 
 Fri, 10 Jul 2026 14:48:38 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb73b161sm149404535e9.9.2026.07.10.14.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:48:36 -0700 (PDT)
Message-ID: <e37a2ba5-f43e-435e-897a-6ff0ac1573fe@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/51] exec/watchpoint: Add CPUWatchpoint.id
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a5168b8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: C7xXviPpvNdcZUKURwJol4GqGpgiUROp
X-Proofpoint-GUID: C7xXviPpvNdcZUKURwJol4GqGpgiUROp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfXydlGz/e90JAl
 7Fyw6kpjAC1y6uVLsMcAvm45aHPjRKzL50tqYtIsjyChEb+gN34g8YssstbMdosNx7OYswgMkIY
 GOkyb//IaahojzKLVS2DmmvvxufqxDk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX+/x+xlxd2gHV
 ppdDDBlE7c6li/TdTGgJTHUzpvEDfcl2xJAlDJfw2M9R52tNGyGdYV89q96a8TD2fR9IJNRJ098
 eyeEcYwBzBWIy07lYSjqE2ujp+0DE+7AjNOuz3/HTUzh9hP80S5srRBWk8MPCB8AP4pwyOH+fRz
 0O2v9WcgDdX7xPeTLlk/usyWLEqsyr6ayzS27heTyaCm3qviqMk1Bid7aJ/+Tm/drWJrcNXIGlH
 lXXl7Le3wHXikl0SbWcn4lzRjyV360QcmGE5JCuXjWF9RelDxL9Sajjn37TboqA9W7KZ+UL2MuF
 daAjQ+irbp5tR1Xb+xHoxAkKWTPyKtN2Vwq4H226SkwIiy9XfoCoJ0bHEiLFRFIzcfKSLQnSvC8
 Y7rEz0u+XOuFVtdZjR1PjsTcWcwZ3W29V9moCDwCpOqOZ8WTroaCJUaoCpKfoR7FtCZFsHEuF3/
 zcwnDIFbjHi6EECKwVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100219
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

On 10/7/26 22:53, Richard Henderson wrote:
> Add an identifier for use by targets with BP_CPU.  For most targets
> the index of the hardware breakpoint resource is to hand.  For s390x,
> there is only one resource so use id 0.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/breakpoint.h           |  4 +++-
>   accel/tcg/tcg-accel-ops.c           |  2 +-
>   accel/tcg/user-exec-stub.c          |  3 ++-
>   system/watchpoint.c                 |  3 ++-
>   target/arm/tcg/debug.c              |  2 +-
>   target/i386/tcg/system/bpt_helper.c |  4 ++--
>   target/ppc/cpu.c                    |  3 ++-
>   target/riscv/debug.c                |  8 ++++----
>   target/s390x/tcg/debug.c            | 11 +++++------
>   target/xtensa/dbg_helper.c          |  2 +-
>   10 files changed, 23 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

