Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2FCC5DF87
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 10:29:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxMUc-0006Dq-H2; Fri, 21 Aug 2026 06:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMUc-0006Di-1d
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:28:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wxMUa-0005iI-FJ
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 06:28:57 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67L9LtwP1570843
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xWCeMIeLWcjhSJ+VNhO8kr4XOU2m5CV/bJ4/7dCo2lA=; b=lCzTVCpPuFbkqmUs
 /xBBXnZQgQPEgjGI6bXkKnZOB6GHKFDTdbfL6hsmyAdjJLkbhp/h4ceXafen6qx9
 hDU7o8jwMgoMmNMhiz1dUoT2W1MHBcoQqeha0+WdUiM4ku/hnZ2EnoNrfnSMStTb
 2j9Q6oAsL7ooFK3rOzxn1fLu2MXDv13hve23PFQqTgwqsG+qOAFrXYi4gydf7SmJ
 IfHvjy1qME39vNxPTdtiFe8ha4mh0mq7rHtrsF7Z11qdRl746B0vvBzF4/lVW7QT
 QZdlLIouQJEtnNK6ldSGZWMYGjhJNdxVMbZ7pEehcy6jXTLK1h74oRtj+JFafJhG
 hch+NQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fue16rr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 10:28:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-52d28f8737eso14384721cf.2
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 03:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787308133; x=1787912933; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=xWCeMIeLWcjhSJ+VNhO8kr4XOU2m5CV/bJ4/7dCo2lA=;
 b=KTuu9Z0pjMF/HbHUJ7bLUizfdgfnphSjF2kQIW7ukwbn2L2So7YenogqWsPqIr2DXL
 ZTMOpzQe/wPc+GPnGAzpHsS0ojIzSSBLb9v8G9f3seHpQsQZsH/2WENHTJutYDtUA4dH
 IzzjROzM3QUt+0GvGsOxb/SFg2ik+lQQKVVecACzaNdwABCA0+FePf2F8Y+fjgt6Feyx
 3DAHlPNVVTHXkypanrcJK22KL+X8WKHphPzqO6sv4ztQoi9C+qtILNTgv3iZ8KSj1gxy
 axtSzGejAjtVtpkLVqwRgObGmg4h92OmfBtfjExV5OkqXahI9E3eXC60qSGxJYNsbkKb
 z9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787308133; x=1787912933;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xWCeMIeLWcjhSJ+VNhO8kr4XOU2m5CV/bJ4/7dCo2lA=;
 b=U+fFEpnO8HXc/K7bhH4q8TG8kM0ccg0m77w7OaY5rjj8vMI/3jcgxXLzgRWYSSnPCU
 U6/VBRzXh2jC4dPulU3hZqkfgmUmseQh/Dpo2pMufg9QX51tAx6TXnjBMLAGzYys/LVK
 MChnD1l581LbqjJ9HozJFO8TJReFijDb53avZMcveyAZztEV+IrXzb7AlWTIsUVU7rgR
 /rJMTlce4QvTqYnSWrnR+IFV5G6rrB4sJW8bhtEF4xcKpUl6ryGrJIgmMw6S52sKYN2x
 SR5jOrYJMyUpCTckC3P80R5xcLAAsSDGKZ4A2jxmu27tCntGgBu+J3PlHoisuyEohnvo
 RXJg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr0YT2iMLBrUqC3NfqmVnh7AZOJyr/4/EpGiSuPNe7AJOrUW8wlI87WHmSeAui5ewmeezFxKago3g==@nongnu.org
X-Gm-Message-State: AOJu0Yyejg+cYloFNXZBa54x1EEXc052cB1+ZNZ7+bjDLkuM6Qi0G9Ng
 OSbFy99/wTdxm0EqiA3hwkQ0N4K744QLUgoJRrX0OZBTyqLdxtfBu4oz+bWSIbCUOaYze4ikNZ4
 OeA9Zes5z4+4Le5n9ZJkHsZgv6dDidOIgCmpYMgfORt6LBPDIhK5iNME=
X-Gm-Gg: AR+sD1186+JAIuSQvMtGlejuSYtaJGI7G82lCPsCT6EK8kOhQKMoUue6Xnp44W34lPO
 +KL5BYvlZQoZctUWxRPiIjbO+ZlB++Pw82ykuOmSZT3Mht2gtr2WBuP3uOnTLIic1DGxIs1laaW
 8hPMtc5NJtVhmhuVYcSKg8q/Td9emTbtjcRo08mpADEO8FyExgs1q/+BFCl1P1ovMxfq0Tt6Eo8
 5CpH26esOaShaO9VSn3glA5C671KAI01g6q+hYlnLCIjBOpZHGTJlvlFl8Sp8xUvQ8xgRRN9pSq
 qOn3RWalHmEYCI4rsLu0bRlQkNHai4XZRQVHzjVYLTjRDTHpTL+ALRTuh40DxICmVjX2KjK4BwU
 EQC4SdHx4EPymAIdKjNspN33PAJgEUaTYLKE=
X-Received: by 2002:ac8:5941:0:b0:516:e10f:7140 with SMTP id
 d75a77b69052e-52df5a28a86mr43943131cf.35.1787308133323; 
 Fri, 21 Aug 2026 03:28:53 -0700 (PDT)
X-Received: by 2002:ac8:5941:0:b0:516:e10f:7140 with SMTP id
 d75a77b69052e-52df5a28a86mr43942781cf.35.1787308132850; 
 Fri, 21 Aug 2026 03:28:52 -0700 (PDT)
Received: from [192.168.69.231] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b90e3855sm23501275e9.6.2026.08.21.03.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 03:28:51 -0700 (PDT)
Message-ID: <9aabdd1c-4673-4609-aaa2-f27e04d4d0ad@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 12:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] cpus: Constify @cpu in SysemuCPUOps::has_work()
 handler
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org
References: <20260820201356.29775-1-philmd@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260820201356.29775-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX8mll33URqWLJ
 ZfRtPbqFaD5BLbFME3DbG96RCTK9u3ygUxl+FybkvkEvNqSZ0ooHLgdUDaGxezX5Fk/C/2TBnQ7
 gaQRelv+eZYfXCv6jE+/GAOrir+qoKc=
X-Authority-Analysis: v=2.4 cv=U9+iy+ru c=1 sm=1 tr=0 ts=6a882866 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ivBIR6OCMuaYdoXQm0EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Z5FgHnGZCKmR1zRoWEVOe7MYn7zI_9pF
X-Proofpoint-ORIG-GUID: Z5FgHnGZCKmR1zRoWEVOe7MYn7zI_9pF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX1l76x9H6+uOs
 RLwjP5hQFYu+JrhKL7fU4uaWrKziDysWJysuuxCd5L6dD0gyimU0oT95VhinViUYAczsDbdqlfR
 iK3QKhXisnTO0GW0fmqS0v6ZTgMZ3l5NdT2EIBbESclFRLgdX2OUCx5V45XV8yp6NGvHOMjcPXA
 G404c6jgLCdWaNToQqxrdtGlmCG9aVvvRQjDLCYnVo2WA+SG7Z90Fiw41H8RUa5K9J27l74fEiY
 BLOvDEa3tw3dFUKoSmnszLoLVhdR+akmIP8etWo4ZxgfYEb0qgbgW+LNV21MY8o3tUnPmQ8PT5U
 s9+zfTJMKlqB2DDkhUwegvAw884AGJMi1RwhjTlQ9gtbKQDUL66Jl1bDvHolG3bMq9FNgDaj53m
 lSvJ8JvmRMopWJLAXorABlQeKdMlMum60bafhszL0X1PfRDaeJu8+Q7MiKNrki4hb1wsODu4U16
 popNWfJvkjxZIYqilBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210078
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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

On 20/8/26 22:13, Philippe Mathieu-DaudÃ© wrote:
> Missing review: 2,12,14,15
> 
> Since v1:
>    - use _Generic (rth)
>    - no more RFC
> 
> - Patches 2-11 trivially add const qualifier for various
>    cpu_is/has() getters
> - Patch 12-14 add const-qualified variants of cpu_env(),
>    env_cpu(), and env_archcpu() using _Generic() macros;
>    consolidate the redundant env_cpu_const() alias and update
>    linux-user to use the generic accessor

After reworking _Generic from v1, this patchset ordering is not
bisectable anymore. Patches 12-14 must come first.

> - Patch 15 finally convert the SysemuCPUOps::has_work
>    hook and all target implementations.
> 
> No functional change; purely const-correctness improvment
> to enforce has_work() callees don't mutate CPUState.


> Philippe Mathieu-Daudé (15):
>    target/tricore: Document architectural interrupts as not implemented
>    system/cpus: Constify various CPUState arguments
>    target/avr: Constify CPUAVRState for some cpu_*() getters
>    target/hexagon: Constify CPUHexagonState in
>      hexagon_thread_is_enabled()
>    target/i386: Constify CPU*State for cpu_*_interrupt() getters
>    target/loongarch: Constify CPULoongArchState for various cpu_*()
>      getters
>    target/mips: Constify CPUMIPSState for various cpu_*() getters
>    target/s390x: Constify S390CPU for cpu_has_*() getters
>    target/riscv: Constify @iprio argument in riscv_cpu_pending_to_irq()
>    target/riscv: Constify CPURISCVState for various cpu_*() getters
>    target/sparc: Constify CPUSPARCState for various cpu_*() getters
>    linux-user: Uncast void pointer argument as Object in
>      target_cpu_free()
>    cpus: Add const-qualified CPU environment accessors
>    linux-user: Replace env_cpu_const() by generic env_cpu() equivalent
>    cpus: Constify @cpu in SysemuCPUOps::has_work() handler

