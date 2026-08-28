Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF97C61DBD
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 07:34:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzr61-00056U-87; Fri, 28 Aug 2026 03:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzr5x-000562-Kg
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 03:33:50 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wzr5o-0005Y7-Em
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 03:33:41 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67S66rSF2196977
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 07:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 B2L/9zHGalHNGv5EJ1hR0o9DsIY/MtmWpPgxeObMA2M=; b=WrObtkX4uMLm4uYV
 QCRNR92mVENbO5sbENWsGE2nwCSDdz4E/9yx0p4HhVYJrSdtXRM6U7GhEktmfmkV
 wIPqMRl/hpNnGWXcpuIzM08hlynz05mXXHs7id4N8mM6vbXS0rWCp65Cel9KzUeo
 emP0Ws1rp9n1e9MIOJePhnjYqsY7j22JFG2IJ2DDexkVknhQIMtFolOss4YpDS/v
 oo0QcRfQnnqeFVqBQY1ROrTgu2YzpYbwTpdO3wVj8xyChxsPGrC7dpxpWNQgjjf/
 001OVeWOQYXj/CDAVRNBjsYQEmz/q5zra2jxJMUc76f59hj4TyKCejXkXP7vwwA9
 5Zp2zA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxrk5b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 07:33:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52fc16ac179so3536791cf.0
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 00:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787902418; x=1788507218; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=B2L/9zHGalHNGv5EJ1hR0o9DsIY/MtmWpPgxeObMA2M=;
 b=biKZfLJL5cyZO5iQ/zmbZ0i3gNDIhxFPIUj4SBjb/HvtZLgiHZyV6DEorOhEru/qsN
 5Wt5OU+qGWeL/R073kwA/TCyTqZXHix28rKUMUZ33swQBWj+iL8xP5sBWxocV7/im4v1
 ApLRs9GqdOyB8sxA7ERn5nbTX7mWGHtReLWTs12DE+wS3QD1sMwwrlAfBsRBSjFR7Jsw
 9JLtui63LQxtTYQQnEhVk1ZqGl/k8gWt58IKYHljqDRbclndDNQvd7Sb6eO7vFBmDYqu
 e04Oc5m20XzEp+pzVBEhjPnQ28zyeZCyYbHaf3d5pUINbTr+wtK5ykF26X3wxg1Wy8TN
 bzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787902418; x=1788507218;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=B2L/9zHGalHNGv5EJ1hR0o9DsIY/MtmWpPgxeObMA2M=;
 b=khX4ZvnO/D41NszZjYD25vW5tBCn5B8FTCaoj8fvb6v+hlY5Jjd+Hs3EU6H63a9vlw
 m0CyZHTJzoo/Tb6EuOEdcchaCq+cSnXEhA3T/kEgwNelg9vzelGdY9rpeaoC1ci7VEen
 7RsFmeNduaIXEjDsXXf99eHiMBuPokLj24zECgBOfnci7Sb+gLxw9a+mt38e2+VuFC34
 00pjZ0jRtxdIOQJgIPPT//FgAAogOJE4zHDsyLdDOsIBFLlUq60usfyXjpOsg3v61mVI
 r7R9O87VM2nzVNHAXncZpeV8IrhWmM+PrctzHNMd3HBWhFn3NvQilwqPbFd5aY6CYMcg
 ADjA==
X-Gm-Message-State: AFuF++mbBdyNCqDF/PG1CkbV4QQcKaLFmTrpFo+x0JgYBLmu5egBAbqZ
 f8QGThS25e3sDMWYBkK5UFLXaCOsDDmnr0mgSXI3X/6Y2sRD7hu239UA3UmvQY4SlF6jOkx+tII
 wSFmTAOFhns10Ohiy5wvYAi+rMiCTNsVT9kvHbQCWw/k/x5AkOtY5ZMk=
X-Gm-Gg: AR+sD129tDT4d7AS5E7JwH6OubzDfAu3uzRZmtTnzHvu4CYT3bCbhj1fwnVS4FlGAdW
 AcKZwQz+9xQiHYq7cW1KTzTS8LDlCjwSSun5iPAqsIOC36XDToggrUepskNsSxlKrXeDLUTKAi/
 DPSYpwhmMqwmArDmO7XXX7iqYi4UZl2X4wvp9JmB45nnzUjA9XAdsr6Z4fFpGbekEao4H/GSKSm
 /g6SU5rGJeV2ivYh0Sr3Y/jz39CdaVLK0ASK/4Nf+IV0HDnGjM4P1meA5nOOlyUV0v/1SgsF2a8
 27eDUiUrs9Z74l6gdU0P5YqVGJVjMklajRXgwqSJXxVUBtEAMxOABlqzAmzk+xGK/X1+BEZt1Sf
 t1Sm4jjI852ApsdvYtpBc8+ZAD6ceU/EMPw==
X-Received: by 2002:a05:622a:4c1b:b0:517:63df:91a5 with SMTP id
 d75a77b69052e-52fa1daa23amr148617501cf.19.1787902418323; 
 Fri, 28 Aug 2026 00:33:38 -0700 (PDT)
X-Received: by 2002:a05:622a:4c1b:b0:517:63df:91a5 with SMTP id
 d75a77b69052e-52fa1daa23amr148617301cf.19.1787902417959; 
 Fri, 28 Aug 2026 00:33:37 -0700 (PDT)
Received: from [192.168.69.226] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb20737sm1851242f8f.22.2026.08.28.00.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:33:37 -0700 (PDT)
Message-ID: <f7e9a7a1-b702-4f33-8c69-c66fa3cb3fc4@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 09:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] target/arm: Separate cpu types max-v8 and max-v9
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@oss.qualcomm.com
References: <20260827041557.775080-1-richard.henderson@linaro.org>
 <20260827041557.775080-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260827041557.775080-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA2MyBTYWx0ZWRfX2+TianuLwOhD
 lFJ8dI8004yHoh+v31WgGPahG3qjPZijaA7fWy7t8MmvRx4Pb2gMkP4VbW3KDilXjQCl+UEzhAB
 8Am5Sd/q+yortKGCrJTDmRA/CalXmGurGHDQnSavipOtVKyBLLb3i2MM9n7LXu/2q0+aN87MDMA
 FFtZ0X5GpQz+0JswFKMP0ABiGPsxUU2jlA7SOs+1v0HJUiRtvqvg7WI8ibU2yM7lEwpSzPF1APQ
 nPJ7iAyT21Wxsj9jGIeHGI1CIjXaptsizpeTV1QaazjN++N60WrzF1K617f2hptiByk+6OS3x5Q
 Ae2iquZvgjke13rCuo8ROsVO1U+oVC9vVzBjTEgVMFEKJn9XuYlGm4tz97OmDGMPjML3tIYNZMV
 qeHq1R4C7xbNrQh7of9guONqGUPRHLh8u3rr8gxUV3Rz3WiJt8kcyfNdmEU06P6XkWYElSwQmhO
 hYdgHu1odEmFJYNAJBQ==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a9139d2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA2MyBTYWx0ZWRfX70F9R3lO6N/C
 fmOXtiSrr1qlgXYHPQxjYEyH3+vKPEo6eguPu3R8Ktbs4nNeBUX35tl4K3qxZQ47JuWIG+vzJF4
 JV7vVjwKs+MjaIMM7iEcxnn+uzRkc1E=
X-Proofpoint-ORIG-GUID: z6bd3t1CYQi563YlYAfBxBVBY9XnQ3lt
X-Proofpoint-GUID: z6bd3t1CYQi563YlYAfBxBVBY9XnQ3lt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280063
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

On 27/8/26 06:15, Richard Henderson wrote:
> Do not include v9-only features in "max-v8".
> Do not include the prohibited v8 features in "max-v9".
> In aarch64 tcg mode, define "max" as "max-v9".
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h        |   3 +-
>   target/arm/cpu-max.c          |   2 +-
>   target/arm/tcg/cpu-max-v8.c   |   2 +-
>   target/arm/tcg/cpu64.c        | 160 ++++++++++++++++++++++------------
>   target/arm/tcg/stubs32.c      |   7 +-
>   docs/system/arm/emulation.rst |  13 ++-
>   6 files changed, 128 insertions(+), 59 deletions(-)

Thank you for the help with this! LGTM:

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

