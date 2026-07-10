Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103B6C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:57:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJD0-0003Vs-1m; Fri, 10 Jul 2026 17:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJCy-0003Us-Qi
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:56:32 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJCx-0007Vs-B7
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:56:32 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66ALCl7g1931562
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZI85Olt6Tqyu/rupFmmacxe2KIcvQ07Yymt7b+3xEJ0=; b=lSPPmBgIjvaz6ve3
 W6RUYuZgDp6agKvFlPaP6FAqZoxluQF9NwfO47Z+qWlM9HkoqedvaqinUR5Cg/Me
 /eUffUJTzHTJS0vh2NjJcf0wViSA/WWXAZhFdAJXnct6av+fqtozETq/c5T5PhKD
 SMfG+XrmkJPmwzdfmcDIOgTsuQt/Qc56xfZaLCxs1/KO4yX43+/yJYlOZg8hZ+NN
 x8/oyqhT11PisRg7X4GLijB5ppHJdxqBc3LKDFCwCSfMTPBgI+1jCHO4XGqdH4st
 rjhP1TYg6rrIuoSpzD+qtTVuS0Um5R1cT81uPr1zA04f3ugwJ/6fj82GkGTDRnLF
 uWZTlg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb8f2r40v-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:56:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1a97644aso14345081cf.2
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 14:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720590; x=1784325390; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZI85Olt6Tqyu/rupFmmacxe2KIcvQ07Yymt7b+3xEJ0=;
 b=YF3PaUZW5hBieUiaHBLN//v1RPiEh0E+92bm54P6/aONHFpUNWFzdqZ7Aic0VE8FLX
 oUDyShHYk52V6kB7qfnvkleSA/lyCyz/Ewaeg/fIPUDJefRWmnrQHywEKqnfKw5aGNf/
 khe9RwzLdEnqDA2wU1IyWRBblvidlEPJ2mFtpK1xYIkA+g0JY9/exUdxA2jc3307cmPA
 9zXMWGsAxUGJKw7pJ9p8HL5agGkmOO9xZmdfo51kP3rN/orDAv/ftN2YPSOuvjH8xIr/
 zqRdJMlZIKXt9ixNNeJ4CiLq483mj0P8X/5CjhAnhR/O6z3sQSR9FJ7kxUN+ObHlcMVI
 gpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720590; x=1784325390;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZI85Olt6Tqyu/rupFmmacxe2KIcvQ07Yymt7b+3xEJ0=;
 b=NylKaIEO0EdC8Ke7PryXQ65DeUlen54FH3Br5fPy63QMQaN30AYYjzbyPVRXT7q0GX
 Lp6wV1hYP2xEGTarrGAfQe/L4XPhpeSY9G1btwa7LUSIMyI8JWxoN00koc4pidj+MdHC
 0V4nBl90P8Ue00wj03GPOMzMDCl2cnG/L9l9NTnMOHEGicDONz+/W6BIQpZNwq3Pk41L
 sOKWTV6vT/tVoBVIPw4S8g42ofETN4vHBpu8XpxWWP7IpTSIP+gNrl3Ce9EBpIJtKks8
 GfU2sBlGK4zQ6eL3faSVAGHYmxVVo9t3L84lISMhw2yZK9ekfoJYf16MT4fTPACiEusR
 6adQ==
X-Gm-Message-State: AOJu0YzAmr5Kh0Hfi89HMqn+w74LpazCGeWdIzWITQwrPDDqRDkVa3NI
 8QPjI4irUfDPCQ2yEhItzFcYYodCDT3JG7UJlInZPu6GPDOH/qSDnbSyyeAU5bPuAFMYcbQY9Gk
 Wcj0UEKHl8PjpIl174QXoWUviusr0clCttaH4u/axUcXpI0biGnzVKUU=
X-Gm-Gg: AfdE7clzO0qISkwdJuCPhrjxGDHLM8uR4/Kv83Hr72eLHvzxbHts7/PODoAYfIsKpXb
 LoA+zvktyg6p0MGPbASeK+0L+BoLMTQ//bV8P7eld1Ggjpd2xWPlcG6K8POCA2a6oVBlaJA2taH
 nf/jJzLcdboL4SxHHt4MbZpWVVIwMvRj1x9mxR4zBDUx4//Mp20QXOJCH2OpgG8PVKHyxUULSEZ
 GIvOYzCFBv9R3aP4sLKkzi77oPsD9rjC5cCYwMwuE+Ybu+OB7IiqQHLHsE6wdxQAY4EpIvnxrD7
 reyCy60li8dGSBcbxJlzDA339UGR//JHR5EcxWKi8XMSQXXLVVeo27gHh3SKPZupfBWOvEMJDTx
 AFD0RCev87lAckBF2Sv0l7JgqELAkBkqRUYEVcDy1Jl3GP+CN4oG/l20Pb/Zqcg==
X-Received: by 2002:a05:622a:4c0a:b0:51a:8c9c:7f44 with SMTP id
 d75a77b69052e-51cbf2af35amr7323141cf.71.1783720589789; 
 Fri, 10 Jul 2026 14:56:29 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:51a:8c9c:7f44 with SMTP id
 d75a77b69052e-51cbf2af35amr7322931cf.71.1783720589294; 
 Fri, 10 Jul 2026 14:56:29 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f2d88698sm90807135e9.1.2026.07.10.14.56.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:56:28 -0700 (PDT)
Message-ID: <c65ac09e-b87e-4a0e-8265-c4ae27d0eb11@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:56:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/51] cpu-common: Validate flags in
 cpu_breakpoint_insert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YLavDxGx c=1 sm=1 tr=0 ts=6a516a8e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 346gDS7XyerL22zes2546CT8-reN5Nrm
X-Proofpoint-ORIG-GUID: 346gDS7XyerL22zes2546CT8-reN5Nrm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfX4KxvJUE67IAt
 9+DDmHxf3Jt59DH7+onSiZZWDWHNmkApiR+KF894Ph38hP7ZhZt8CUfZm5CnAmRRTY9zOP3Nt/s
 9WF18JQvJndG6HT3OXELMRv5tUp9vww=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIyMCBTYWx0ZWRfX835X/jL4AS1z
 39G6re+1z75KxthEZkqr1tYGEQNUgko8b8vkxcKFH95ISZzsYxIiuU4QE1guxTaJ016p8zA1i8G
 wyFgUp6BkHpP7je4o0oGJSrZsvcweEogA33VydYma2HV26xxeVIrUrDtrt1lNyyaI9EFzTq2RLh
 tblkgzpqSMwUCxwi1HxOQ19V0nH3ZoAFczJYUpxLEU2IOvDaZj7dltO1z3pBskYrgHWsB5sBM1/
 dFPMhO64DzJjcw1X3uDuAxhMlWoFZKll1930RDlGPqPVNxLlwQUftdZqFtbykv26G+iHSBZE+TN
 KRLEvIyB7SO+g3fdOU5UHL/70WgoutFFmnMnUGVclrnAv4y4eLdPG9vp5YA0Lld8KPbV2Lg63qT
 hdKofyJaGzbTffrhvluCB0AxlQkqPSQ7sXGdFR/psn9VJ1utF0wDRLJOErI98icVkDwqw9vSP6H
 ZAyvQtFJ6Edo0q6GglQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100220
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
> Flags must specify GDB or CPU but not both.
> Flags must not contain extraneous bits.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   cpu-common.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

