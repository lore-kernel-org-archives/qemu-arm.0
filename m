Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0E5C982E6
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 14:31:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8f2N-0003hh-QF; Mon, 21 Sep 2026 10:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8f1G-00028N-9F
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 10:29:26 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1x8f1C-0000ST-1l
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 10:29:20 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68LEH2ES101128
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NZPsx59Nx1wIfewesp3hYcrpIVVNjWWuT9yseGXIkmY=; b=XEgI2PHLQqVIAK7A
 J0WLLQsQ666UqnnTq7FyjE+07HKNCUB8PRmRCbfSPlQC33Hw4VXxuUtht76kv5b3
 vcSmLS+EzV7BvD3XfbEL0qXSnmS4lWeYMrn5HJfVgb6wrTQKfoKi/d8k5y97HnQh
 iiZ5kbX+XoPMpmcMtsmx8NW3y153iris44UgBdM86aspOHl+Fj5yPSeU3X7pJfvG
 5JpU7qk3UHz+zf8vOHz5Og8ThuYwrqG7p0LQ1fcf5sHF0GB8u4pf36zZc1jMUHGZ
 lmkmUPRpPe/9sODzYw2mPvBpfIWGMSAE2Vg/i5qQTGP/5J/SalzVsjNKx4uGGDrP
 NyDchQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq79b3t4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:29:15 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-97caca2faacso185835241.2
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 07:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790000955; x=1790605755; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NZPsx59Nx1wIfewesp3hYcrpIVVNjWWuT9yseGXIkmY=;
 b=PisrWWAdGfUo/wvbfE7aX/K+HTAvBC+kXMc967Nya0p7cfLJrAdu5n3/8ag9g4DqPx
 Uc6tcFTkW7+TFTUpmlGILZYy76OlCj6wUyIiFr7MuEkuRZiLnxRUcyUJw3ZZZuewCXEN
 MP7eSjtCBkpNnbbWWJ2KYp9ItDdeOjM3mfCoon0NRP3VwcZLQ1J3713FiEIGofFePYGv
 7XUjC70cEnmY45BUPqs0fM4IY9RN0rL8RbYK2Dh7eGgmV1OUaY37hohej6HqittDihEW
 P1fUv4weckM/KNUuCMscQ+AP54a4X8ApNbZHFVyZw98TRMjDBEKdWUXoX+tRxU3MdLm+
 h9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790000955; x=1790605755;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NZPsx59Nx1wIfewesp3hYcrpIVVNjWWuT9yseGXIkmY=;
 b=xwgfPfQdiyoLTDs4A73cM5sQx4rnXP0eV6znj4VA5I8rJf/J3gv3DQX/z3ZSbjNUaE
 cQP7keBlaDPaOM9TmojtCeWLmQdMV0s7fbYqWRCp++uY64Nqb2UL83YNcbHRew9qWMCY
 TTASUAkaolCK5F1eWxLTLkwVJWKAVarMXJh+1gfT6pxQ72upJIXl6E/beJWSFnGYLUb0
 cnRx05isCKC8jjKqbRjrX34pWAacq6omnn1ixRDexdB+eU4gFqNEYKTlbJxc4L3IswAI
 I6QqRynfbN/nFpYJkUGlFiy30p6Ak9jqw3wuv5P3aD05p490nuq9eiANHMt4+5p1BHzX
 ImSg==
X-Forwarded-Encrypted: i=1;
 AKwUvByg1my2kipUmaM27FgXdQc5Lx3wnB0tYQKQTUQiS06WFKKiazJelmfOYTLhSHCNtidddzje+roMag==@nongnu.org
X-Gm-Message-State: AFuF++n59TeB5aU3LJpOXxl5vdFf5wCk9gDD2sb/GXgUxKo3GEt+oBEQ
 Oq1tBVaNJZmk8Tcl5MpPIJnGlG7YLyK1yjKZGPfl7NST+kSUHhbqk8JAM97opaR8EW7AlSCAHBr
 GONJ0Z+3G2KCOGfTuDFwwxkGrxwvR7fiB/0MjI4cVUUebfZMxMC2TNPE=
X-Gm-Gg: AYBFou02pkNZvd8dfBQ6lfaFmU24pVTRJz37B/95MenrS8RlrW67LIaBoM9XluOtXYi
 ue/A7GTHxKouke3re2aF1WpGdnyxwHrreTxhCKUA68G3SxXobyVTUBuK+Qo8WoRoQ6yjFLEbvhc
 yEjl0RZFoCJuKR89cEaGPh/nysFMwFzwBtV7hn/hyBiAu159EDwPvNqHQgBBdmLbfNHtHxOPXrC
 vcHN7YgzIas73iIKlqB1xOvrZFHW7d1zv/zNZ0P91XEeRVFnycVJtmUZE5/ryggtic9rOVuKjFy
 ZLEq7Kl+e2i89TVyLJT62h3neq1PQ0cTPcntS41+7uD132ZGrjDM9a0XG8NhJGICR0gqYiBHo14
 hUkq3tRVdtqZY8zDTB+12
X-Received: by 2002:a05:6102:3f06:b0:7a6:96d6:f791 with SMTP id
 ada2fe7eead31-7a696d717d9mr3388816137.16.1790000954750; 
 Mon, 21 Sep 2026 07:29:14 -0700 (PDT)
X-Received: by 2002:a05:6102:3f06:b0:7a6:96d6:f791 with SMTP id
 ada2fe7eead31-7a696d717d9mr3388756137.16.1790000954292; 
 Mon, 21 Sep 2026 07:29:14 -0700 (PDT)
Received: from [192.168.0.4] ([79.127.134.47])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fd1f0a061sm168901605e9.12.2026.09.21.07.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 07:29:12 -0700 (PDT)
Message-ID: <1722c6cd-479a-4ef2-bb1a-73b957b9bcce@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/21] target/ppc: convert raise_exception to raise_excp
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
Cc: Xianglai Li <lixianglai@loongson.cn>, qemu-s390x@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Yoshinori Sato
 <yoshinori.sato@nifty.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 Bibo Mao <maobibo@loongson.cn>, Chao Liu <chao.liu@processmission.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Glenn Miles <milesg@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, Matthew Rosato <mjrosato@linux.ibm.com>
References: <20260918004225.827-1-luoyonggang@gmail.com>
 <20260918004225.827-21-luoyonggang@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260918004225.827-21-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab13f3b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=btlkdZlGvBFwkIDmIYSHuA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=O2UOSYPLqx1-oxIzoEsA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX2XRvxKzWX2S/
 +oWz83GtwM5AVLOwOkJlJ/0+Y+oUpZQauMTJv9CwQGKMxZw9YreIQ51ygA8Vduvg4ydad/vMpdX
 n6e3aB+nyyww4uxpIO2lRitve6R1Eio=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX5ktCCN+WsoZx
 A7v2eMsxx84VQI1xDB1Li8ZBbHtq+rYWhRdVc4UJnonbAnZLVtkQHx2Rk6CZRu8l+QmS3N/REhZ
 cNSbKl2zaq4s1/84VY0jEX8QY7TWqGMVK3GTQ4IgQlAuF+1OS0pG+k+IXEOoxf9j1fTi97XAx0P
 zw48zU/0AMRtwgGuW+7uPyAmdn05rnEUJJwY01XO6XMmBo6Jxsm0C77ZtWSCbz0j/1zKiIfvyuh
 Xxi4SaS4NrdLK6DWHi8UePk3NSmrMnHC+qx9u2AbvTufBJ7BY405mcNf9bMJ8Fg6+xfB1hdlLUa
 INic3rvj7hUgcegUtKzGvygRdMrRYGpKbwFo0oLLohjkyc6bn3m+fXXeWgmq0ked3N0710f10VT
 N1qxzVsxkn7/IJVYLk9np4WC7qpa06+OxiKv0+PnTMpltsT4ko2klZwLq07qFsewbyTYyVic+cE
 vt3VIZCsMFOMX65XDKg==
X-Proofpoint-ORIG-GUID: DTUn6O-yZlcrbPFdnjF-53O63nVhlPRT
X-Proofpoint-GUID: DTUn6O-yZlcrbPFdnjF-53O63nVhlPRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210211
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

On 2026-09-18 2:42, Yonggang Luo wrote:
> Store error_code then call raise_excp with restore 0. Drop TCG
> raise_exception and raise_exception_err. Move C
> raise_exception_err_ra to static inline in internal.h, and remove
> the cpu.h prototype. Callers include internal.h.

You are squashing too many distinct changes (this is a general
comment for this series). Here for example use gen_exception_err_nip
in a preliminary patch.

> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   target/ppc/cpu.h             |  3 ---
>   target/ppc/helper.h          |  2 --
>   target/ppc/internal.h        |  9 +++++++++
>   target/ppc/misc_helper.c     |  1 +
>   target/ppc/tcg-excp_helper.c | 21 ---------------------
>   target/ppc/timebase_helper.c |  1 +
>   target/ppc/translate.c       | 23 ++++++++++-------------
>   7 files changed, 21 insertions(+), 39 deletions(-)


