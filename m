Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C629606A326
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 18:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErdCIeTe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUvS3fhz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPOJa-0005Zj-JK; Fri, 06 Nov 2026 13:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xPOJV-0005Ye-0e
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 13:05:21 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xPOJT-0000P1-8X
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 13:05:20 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A6HtPxB3570512
 for <qemu-arm@nongnu.org>; Fri, 6 Nov 2026 18:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tcMWvYme3+YGeK1YfM37cDjLBAz/jJM+qVu1QTX+mx4=; b=ErdCIeTeeNmhzTm/
 5PilaY+1HYHj/7DgIoodKC/O2qi6UB5cJCrVUtbG0Dr8Nfg+ZJX0PCSA2ecJeAja
 wUcYQvKymnEXDXBFdly6UV0LcGZNjaVwW7ojKbZ+316aEGvg50s9sVKNdPhsevcb
 xpG0i+6JZMfefcScUWcorNYbz2KHAqArGW6SRiBZgk7RIC+C+2rOfC+kr9h3Y1Jn
 xAwP0hePr76YKoWL+uO9b/wH5pCL1l/E7qcZP3Ia8utVll+6+2f24m/nndJUlc+k
 +wHjn4rx1BymvHH7gQm5oEP7ANgv0FpT6pJLlCvoDlW6UqMPP7HEbCO58IT8VPnL
 3wMKdg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pac0p8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 18:05:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-36cec75d8caso1114366eec.0
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 10:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793988317; x=1794593117; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tcMWvYme3+YGeK1YfM37cDjLBAz/jJM+qVu1QTX+mx4=;
 b=fUvS3fhzUZP9T1GoCLqGfrQZdXqTcuKEHtrgD8bHkiZT3l1Xoyn8ZCpXR0L4QCBje+
 m38PEkR0Oh0IVGY7E0xtn8vojQgRUDpltmFbQCYo1OzPzI0ndyvnS8JIMNmXBp1nWjsa
 erJr+j3Ui0YQUbW/btqXKsFYKtk0LoxIvpaKBNDeNZ6ZI1D5qiTTzhXjk4kUkH+vwA18
 aPtMSZ3SQm3ttF1qbtK6qOgUYWtwaSl6rgUNLyTu5XPWxVmrRQu/Z5cCdfn2tAOt4uPY
 BM9F4/0xwR1Tw+yY7lylizqY8PMm6DLiwIkMRVsNJAnLI/IUGvNmPHesR18sfoIPE4k8
 NpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793988317; x=1794593117;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tcMWvYme3+YGeK1YfM37cDjLBAz/jJM+qVu1QTX+mx4=;
 b=Hnqqd40NJrH/y56gFFH5T+c36sXBQ3tSXH70wkc8MhNMA7VvYE31TKz2ae/s/G4QRE
 zjwe6Wrx90mzhcNKtEkOSKhcsD6P0cF9poPqEiszNa8jlmTwjDSGsV3lyXVdZuPBL63M
 ZCdAHFoVV13n68ryqtuWGRMrzTXTdtuMF+p+0ZZITjvYRCfziQRHNv96og8v9dYHFsla
 FTBuB54we5oGuT9fBdy/r3pMecZgypK3HDEpylnyskycdON2RRmQgCSRc5Hu4rfo2RtB
 RqNfXvT6/gdTjE/5odjJmRGLE009uZYAYPg+4+HCCaEBoqMGmzNvNqleHEIw94QiL0Kr
 GNZw==
X-Forwarded-Encrypted: i=1;
 AL+hErHkroxfXKTh+b8ZJzD97uVJMX+hObDDFkBuTD+O6U+JVmtQ6HEgyE4DisQzpO/64dk6BtLaoo2DYQ==@nongnu.org
X-Gm-Message-State: APuU4Z9wZjsqN0CpLP/x0BiqGZbLPEkF0tLHSjHqupOlagr+R+L+zbjF
 Z1dudE2M0Z0vf5qZewH7LNu2of/Uilsu2uw7bw69UtsexKDUsZJ/vesuXOtOyG9DRRLeWw39Zxy
 dz4GTOhHqkvnsXZHiaFAG2elKlEjiG79a25iyFH968f2wACO8OJ1FahU=
X-Gm-Gg: AYBFou1edSbB75PR+coiDQZ4Kzeb4TI2svOzCG2/CwFSDmBhnax5pusskopxJH7sU86
 eLgUmCAzvsFYwRRaPOB3qYPxsgR/+6RR9EHcbn5FonjhfLQSv6dAdEQXRTWJh0Pz0nCM31Mvmm+
 OMGjkiUY3WNdZRTB7iHoSyz/C6q2l884rOEv0ghG+6CF3n2rVsKZvaXEKFKrrf2YKoE94SJG+jD
 P1vMP5Dln9bgG2cmVnkRzMx8SbwbCSEluB38GCQNZRu0/D8tjndhUiAwLQhwwYiuuOwwQbdza80
 NmGRZjymnFCl8xdDe4Yv3rujM4k0jbc6SnoLynXJkJBCnNUwkB/o/TIvDlZcB2uuELsm9DV2A48
 3LMIKnwlpKL/7+ER1HpkItkrT6l2lQOV//oVP5cZgd82RCxEGrpYbv+0OtTONK9NgkDa8p18toh
 1oSKUMt6MB0hgTaHbiJZNcGzSYXC8pkFp4b9BHfgM2Hw==
X-Received: by 2002:a05:7300:ea83:b0:36a:37:1404 with SMTP id
 5a478bee46e88-36f78ea36dfmr4322872eec.13.1793988316140; 
 Fri, 06 Nov 2026 10:05:16 -0800 (PST)
X-Received: by 2002:a05:7300:ea83:b0:36a:37:1404 with SMTP id
 5a478bee46e88-36f78ea36dfmr4322791eec.13.1793988315252; 
 Fri, 06 Nov 2026 10:05:15 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36fa651e6b1sm18554425eec.3.2026.11.06.10.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 10:05:13 -0800 (PST)
Message-ID: <1825f706-5013-4f0f-bf2f-4dc2413bc3f9@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:05:10 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Register accel-$cpu_type for all targets
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Chao Liu <chao.liu@processmission.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@oss.qualcomm.com>
References: <20261106023936.772-1-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106023936.772-1-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2s4N-aJbNzLo6HBHn3R1lH2VKcctj3GS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MiBTYWx0ZWRfXxDuJlhpElV9+
 6HuPA4LOfz4syqPmHYp6+nG0UDJmfbW5RWa1o6SLhdDHzPIaUSR5P/YGTfPKUlgWcxu+6ewEvxJ
 l9BKpgGyMr28Tp4YQD3aYfNKSKOwnMkKmUrYSfqxxyZNutWugpemQ02+NNJe6faTyJODMAani2d
 8Wryrmh1p/HQ7ni8vdY6KiGvtC0FInoA2sdtstAbysWqVoC0jGcaHEz7A7scMe0fCWZNd8RXUIK
 keqxUrtH0nJonH/KHOAaqq/hJ6HKSbQN1h9WtOe+R3DWT7/K5iZ7BDTPCCTf0NwKmlNTqsm3ojb
 PtlK3W7EnHWBlhhgRral8PIOzBipAWtLC56Bcdtxnuek3BRz1gSE5Epl9D8Fl1Ry5iBiR93olGk
 QNqb0kKud3kEnd+sHfWzjlelnTLu0c7QFBgZhhkiJQwz2JjAxZsbQt//rcYFwnFEeH0RWqaYX2D
 qYxVgwSj4u73wZl09VQ==
X-Proofpoint-ORIG-GUID: 2s4N-aJbNzLo6HBHn3R1lH2VKcctj3GS
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aee16dd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=5vwi3AZKjZg2J1XA_hsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MiBTYWx0ZWRfX08ZaTVO4RBaJ
 ISwh5nMJPqxnCFIGsh0LCp9hGJiUZKwRmV088ybZvKgSdDFN237DP96sMeQKWk/W1JmNOHnMTja
 aZ8Jq1iyyGI1L5H0lzwQha3HfqTdNOY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060072
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 6:39 PM, Yonggang Luo wrote:
> A multi-target system binary links more than one target.
> accel_cpu_register_type() creates the abstract parent accel-$cpu_type for each
> target that has an AccelCPU subclass. ARM, i386, RISC-V, and PowerPC call it.
> Other targets have no such subclass, and machine init skips a missing class.
> 
> test-multi-target already instantiates every QOM type, so this series adds no
> parent check.
> 
> This is an alternative to gating accelerator CPU types with is_available. The
> RISC-V TCG and KVM gates are reverted here as redundant.
> 
> v4: https://lore.kernel.org/qemu-devel/20261105183310.1614-1-luoyonggang@gmail.com/
> 
> Changes v4 -> v5:
> 
> - Drop test_accel_cpu_parent(). test_qom_types_are_unique() already instantiates
>   every QOM type
> 
> Yonggang Luo (3):
>   accel: register CPU parent only for AccelCPU subclasses
>   Revert "target/riscv/kvm: restrict kvm-accel-riscv-cpu to riscv
>     targets"
>   Revert "target/riscv/tcg: restrict tcg-accel-riscv-cpu to riscv
>     targets"
> 
>  accel/accel-common.c       | 6 ++----
>  include/accel/accel-cpu.h  | 2 ++
>  target/arm/cpu.c           | 2 ++
>  target/i386/cpu.c          | 2 ++
>  target/ppc/cpu_init.c      | 2 ++
>  target/riscv/cpu.c         | 8 ++++++++
>  target/riscv/kvm/kvm-cpu.c | 2 --
>  target/riscv/tcg/tcg-cpu.c | 1 -
>  8 files changed, 18 insertions(+), 7 deletions(-)
> 

Thanks Yonggang, I'll pull this as part of multi-target once the trunk
reopens.

Regards,
Pierrick

