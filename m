Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402A3CA5FB3
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 08:20:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCC1w-0002KN-BN; Thu, 01 Oct 2026 04:20:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCC1v-0002K0-Cz
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 04:20:39 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xCC1t-0002Nk-FN
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 04:20:39 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6916xfLf2337471
 for <qemu-arm@nongnu.org>; Thu, 1 Oct 2026 08:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OsIV1SnUVG2R7nXEGhsBE5icN3BgEtHG2JfvqnnUsKg=; b=bqqR3cDMiidj4D9j
 MniidkpkNNLXfhtuivqBLZ/RaXML8iNMWEa19R6gVbYrv6WzxhQambng35OCbPkX
 wThy55YlYa3Bav8DqDgzOgT398RhD5apVHbr7ExJ6qZRYkbln1cD/Vqxup12JDON
 TCd1ypqYhTR73yf3MMaESg2F+6xs/hIpArxYPPDGBU+GlmEBpYJdG0ZybVvqj66H
 rbdMRgXxp8ElF2WKk8XBwxI3j0Qvh0rcd0d4ogdEnPCvvS09eWjEDylsnufYBQON
 wwHdksdxBh0JcIaxHeQBBp3PEkiMueXWWR7OilkH0IRZE69VoCjyZqguLL7nTI+L
 rv9ang==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n23qp0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 08:20:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93bfb2da664so1686927385a.1
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 01:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790842834; x=1791447634; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OsIV1SnUVG2R7nXEGhsBE5icN3BgEtHG2JfvqnnUsKg=;
 b=erFYY7VOGo74yN9fop567Hz8GNUAawdKbve9vK7uCviv1jSCuvLqA7hFzvW/0cre3b
 FxBS2vQlWeHm8d829FAfZyY/Z0YNVyDM25j9tuAoJEX0PF57aThihfTo/l1lXRD+8pnF
 inLDrvcJKKlEqQx2KYvCatu+1ax61pz8gWap/bn0aXu2RZfa1km1oeG9WIrT0cSO30HC
 iObNRQkx5s+7qqwTHs4ABytZDvPT9i/uTHJaDKP9eCyDauPcNXl/RYDVP1S1Qhdo0NKm
 R3CSWGi6shYA9JGP79oilEPnexEBRFEuIVz0n+k3e3iv0xaKGN558TVeNm5V1jOukEZF
 gTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790842834; x=1791447634;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OsIV1SnUVG2R7nXEGhsBE5icN3BgEtHG2JfvqnnUsKg=;
 b=yOvkWx+NP8TNJJzEb5+H0RAyk/L0t49dg9X8B0aQoLiOayflzZxKWs3xmT/2s1R/wo
 gXZRIhAW6MVnY1SQq9c94ZxiRikVOb6G+L63/ef/UAKRx0Tv14rCodbvVCrU1zvC8pf3
 QsgwZoxMIzzG7sWMI3apLkAPDdoXuMwSUMHw3+SigW+TJ+QwnNtQojpKTsP9ZgtWAt0E
 1uhFtkj0nQev/8fq9XFhOuRoJ94H1sd7OrOHOaOQBUx8yU1NIxGRb8rsrfemRQqx1dDX
 8HPvcZmyNACmwOJnSaQiLcmryGGIPZ922JT269tTXNgD6J8C67V0GDg7BIG7NKyjJH1u
 8APg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwmnZl9j6T671mcXSyxYwHKpDyXIDXQ6GfwGce5rf2Fn2BsDvEpPGWvmvJmtNwi/6sOTfekeQjMBw==@nongnu.org
X-Gm-Message-State: AFuF++m6QqM/ueESXBZhFVc5zNgm+b84j14Tfasnh69VFIV6vtjdhRhw
 glOgrWL/Luwspb4y/d80wRIxlPXbiMJib0ghSTypQ1Wlp9fPvA2cI/uGHOCVZMW+faJA0EQTjbR
 lB6nKP53XHBc4zsqmqTx93YXL0j6jGDv5pCkcksVz6ijrJAdLGNOGyZc=
X-Gm-Gg: AYBFou3W1z8pOT43J8ncw4nipy/hDw+r8gxN3+A45kD3zJeDCnsJqAJujyrKubAiXFx
 UcQYiTEGhXJ6/hRxeKXbouAOxPlE4CaCiWTbxHbvT2ig5OyFKY1W+gAk94vwYXw36gryTWLGJiE
 O7WhIDGU+avGip2Gnc75fOoZst2KPk1n19VGzvRBDIKNmsW1ytFgQ+X/+2IFwbhO27FyI6y0uKV
 WR/+vGfgATX8uP/vQUFeawbeFOfZ+tMPaJ1j+4/N/vH++c2r41uZOqV1kzfsuCNCfyBavhsqgkV
 qt22CtG4+V0RUyiN+zlA6BaiVQbXxpna7JeBRGqakQ7kgJIZVS5Z4zSfS5zxW95LtF1IU/r3egm
 ZCkcJudCl9OOFs2k0ofFUpu9jLQv0my1Agg==
X-Received: by 2002:a05:620a:1b99:b0:939:3a81:326 with SMTP id
 af79cd13be357-93ca9725df6mr753303385a.37.1790842834477; 
 Thu, 01 Oct 2026 01:20:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1b99:b0:939:3a81:326 with SMTP id
 af79cd13be357-93ca9725df6mr753300985a.37.1790842834010; 
 Thu, 01 Oct 2026 01:20:34 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01f979c05sm82534465e9.3.2026.10.01.01.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 01:20:33 -0700 (PDT)
Message-ID: <619e0b71-d58b-44ac-adc9-7a5d8f62f716@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:20:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] accel/tcg: Make halt-to-exec transition explicit
 and remove cpu_exec_halt
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-arm@nongnu.org
References: <20260930174946.82195-1-philmd@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260930174946.82195-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abe17d3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JKmM5Wr0875lQbMBMLAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMyBTYWx0ZWRfX2DEJrTG9VkZj
 udOf1jzk47FBoElmFq7snXILbWKOcNPAd8EduWvAXToUJ7td9BO1SBVsDdfcW4vn7gwBEjQNkvf
 BVJ132cZOs1n8IujXNiM0klb+jvBQcU=
X-Proofpoint-GUID: vaA8WdgG0PY2M-Z1YulkN1pCTbSdiZQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMyBTYWx0ZWRfX0gc/or8KTyR9
 x2udv28Lleb6loHDbQf3W49CdHNL0zkZyQAFbsAg8NzhKAIZRUZVfow2beoE7Ifw8cJIFypXvOI
 zBort5E2a07IlPv7ifCiz9q0EG0X607Py9c3naYtTQT1o2gF0tLZ+4ZdxRAA5oMcioo3O8nV3wZ
 3E1oFO6ekIQlyVV881LEknQ/7GlBz33XuNqq0NpP8jXPT1fbtU1U5IwGPye7TkGZtrKm9AKqTTh
 47o6iiuxZvY7TxiNcZ6EEftOOI83vhonup7T7W/C/FCgN4TcEN9DzILgg08zWGYDUWSPX6BfXoL
 Rxsm3yEXLTZ8ozWex+JvFDuJW6605toZeYCl/3UZ4rPrWmvnDN83gKUrJhSkMKkLfT7WMwIKSgd
 OOQAeQX+M2sq5yt6PCSJJRMSU2L4m8/q8N+q3gFNpKH5TB9kqJd6+awEupJ+XwjgGqElRamgJKt
 BWcF6ATbcOFw0Yl7N3w==
X-Proofpoint-ORIG-GUID: vaA8WdgG0PY2M-Z1YulkN1pCTbSdiZQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010033
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

On 30/9/26 19:49, Philippe Mathieu-DaudÃ© wrote:
> Missing review: 9
> 
> Since v3:
> - Rebased (s390x, x86 and some ARM patches merged)
> - RISC-V posted separately as [1]
> - Better describe ARM PSCI power-state update issue


> [1] https://lore.kernel.org/qemu-devel/20260930174508.81497-1-philmd@oss.qualcomm.com/

> Philippe Mathieu-Daudé (9):
>    accel/tcg: Refactor poll-while-halted flow in cpu_exec()
>    accel/tcg: Introduce poll_during_halt() and leaving_halt()
>    target/arm: Split leaving-halt handling from arm_cpu_exec_halt()
>    target/arm: Convert cpu_exec_halt() to leaving_halt()
>    target/i386: Split APIC polling from x86_cpu_exec_halt()
>    target/i386: Split leaving-halt handling from x86_cpu_exec_halt()
>    target/i386: Use generic halt transition handlers
>    accel/tcg: Remove the redundant cpu_exec_halt() hook

Since Alistair queued the prerequisite patches [1], I'm directly
queuing the reviewed patches 1-8 via accel-next tree.

>    target/arm: Kick vCPU after updating PSCI power state

I might repost this single one (arm specific) later when the
rest landed in /master.

Thanks,

Phil.

