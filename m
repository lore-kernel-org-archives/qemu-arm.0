Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86255606A329
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kLM5DBmM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOP/Oxi9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPODw-0003eU-Iu; Fri, 06 Nov 2026 12:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xPODm-0003dU-OT
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 12:59:29 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xPODk-00083D-VE
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 12:59:26 -0500
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A6HtFGn489677
 for <qemu-arm@nongnu.org>; Fri, 6 Nov 2026 17:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ca2LWgPJo42AdxTkGZKZukyYP0lfwUeuA3UfJnlGT3o=; b=kLM5DBmMyHeQOKE/
 h3rhmPc67k1aXllIZganTf5D0w+WFJVzDE1E2V12/tkT751U4D1UEkQ4vyc9kgQi
 VD4xOTouajBmKt2z4i1FPL/NNl5BB9J3nsigDTAsQwLs/M8Xu0WecNUg7iQB1sJ8
 6UKwhGO5YDga4JyLgxzsmwabXOgjWf9KrmP6T261NGUE/GgxAu6WF3IJuX9cvZJf
 55/fOmkGwxFhDstyuREdpLx895tEEytlWKxou5P9WaYff4ShMKk0jnr5wHY2e5ay
 7qsnJhuFZbAE4GN1lMFqPr5fuTSgmLUUaHr6HBXwZjaTdc95i4bHuEyR0phJB/54
 G6prjw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa42n8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 17:59:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-33c35f5ca6cso1634487eec.1
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 09:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793987962; x=1794592762; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ca2LWgPJo42AdxTkGZKZukyYP0lfwUeuA3UfJnlGT3o=;
 b=HOP/Oxi9jZdweg6M9D1Bk1FQMOIJwccn3RCOxtqiXQmJB4qxDvMXpgtAqaXgYrwchw
 5SpwonI1nlvEa3nyIJMOWQLtmE60W64Qhms3ZexFyWMxVBxNIYbIfGiF+scTgiPj4uQQ
 vN+BX5yS0qW7DYNaTOiG1rvQaxLfFD4pErvhVnEkpHgD2iZ2qW15et8x2r23uyWlmy06
 +giMfSys/BwzmfkxsalnqHUbwoAUZqHezp67tfhPZ5rAMy6Z4Xr/4SN18XvIzrEM7ljc
 FmuGAAteZDc9s0kxDKi24yA7tJVzCSvrZ9gSxXhmA6lwSP3C9wg3MLPX+AuIb4pYWc+x
 MGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793987962; x=1794592762;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ca2LWgPJo42AdxTkGZKZukyYP0lfwUeuA3UfJnlGT3o=;
 b=TVrTxrkZKkhk9slTkJmq7Arn/LWI+psZ4+N1ojFWD8YlRUSWi6LpZ+ZsL6MhVRiQk0
 QduueFJISDtIj1Tetoxt63glhmReFhtAceFFxd38KwqIzT/BOA3YN9X91x+FEl0K7QEI
 JqF7Txi4JeW19iaw/HLJLiyNSZNFOtxEYZD6zk2ZZf/hByUaDxgy65PzasmrsVad0Dss
 0WwT84YAfeU2iNkTo1j/By+6BPkkzxIsZHXh4LYaI5QVBLcOvOxe2Tgx9J+0wdBSqvgm
 CzmMCwPGq1+zfkQJtVJt/p3GOS/kkc8se6vrQG6c5l1c8vuelu7+y9WjgHTZmd0vxgCu
 K4sw==
X-Forwarded-Encrypted: i=1;
 AL+hErET71Uf1iHeAV3fWXGsmB2Q2B5RYX/GAADN4q68IozZvhr3dImXEcE7WcK0SHgn1Bt4h/liUoRuDw==@nongnu.org
X-Gm-Message-State: APuU4Z946/c2oEi8GMypSQVd2IJeVF6mg/8G8ptZqv14O+hZ+IsJ7d/g
 Hgl9DqsfaT6HmfFbX7GkKoRzFjwFK6T0M8Qo6w9XHaHG91ygimjJYxV/8us/s5a/cTSDvQV0RBR
 xD2dOdsgpC918QUA874YlqLSeMKF63j8G8VzDidAOheCulkpeqXKAIrg=
X-Gm-Gg: AYBFou0CW7CCJYq5lwQVm99bSZXD8F12gVZbouv/Fyp+7RyQ3AWI6OP5+ZLVE2erMac
 aIp91bU/sBd4xZ9/J4QAtwpqXIYTfrOi4P+sTvJW3r7yTyPF/kP9UtB4RmY6PbgxTcXztqgx03t
 6ZCDlC2xXnQedY93KAx5KyUOt8Y//2BpPK/p1OJZeqa5SIkjYB8DSK6tS2ysbWsKhJ9ZnjzL4rI
 bpbr+5H/ERLF4SKHSYq4K5z4TvtfaIQUzWzO7Tp750h0EFiB+6xkGtQg1OSUjBgtv+v7ShQe0xq
 mlYMoluJaEiiX56JcHRriHRiXrIloVF/hOVCVecP0RQM4OjJwHPtG/ofd+8FkCCR2fjlyWrstKK
 POwxsy+QtqGOoDTzrSCjUVp+AwmsE8xTCjHVkeOfzds+ORUP3rnq9NxBMf1PI3gODBHTR7QB17A
 qFqsC2+sglEez9CKuqPmxg5hdRRYd5ZCUPO5dkiEt7Ig==
X-Received: by 2002:a05:7300:8807:b0:36a:4a68:84e5 with SMTP id
 5a478bee46e88-36f7525245emr4799767eec.8.1793987962204; 
 Fri, 06 Nov 2026 09:59:22 -0800 (PST)
X-Received: by 2002:a05:7300:8807:b0:36a:4a68:84e5 with SMTP id
 5a478bee46e88-36f7525245emr4799719eec.8.1793987961436; 
 Fri, 06 Nov 2026 09:59:21 -0800 (PST)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36fa8c4f28dsm7707429eec.9.2026.11.06.09.59.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2026 09:59:20 -0800 (PST)
Message-ID: <a97b0f72-fb7c-4f5a-bde6-b542056d6e5d@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 09:59:18 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] accel: register CPU parent only for AccelCPU
 subclasses
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
 <20261106023936.772-2-luoyonggang@gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106023936.772-2-luoyonggang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MSBTYWx0ZWRfX5TQtX0rDICCt
 rKpMkj7XmPavg2lJJ3lwJpcEI+ey27ZxT+0RxkCwgAGAPNeaFDJftEpzh9etM4CbOQqrxQ42jXm
 saU3U4H3qgqPgwSuNb3m4S+AUYTWPJB37rmQgC2CChL2d/3mTbmmLIsUnCyFvRaMZ/QjGOOGE96
 YFoXLu6hyso6Y+KCVX11XPabbtECW0vFtAsHBICuT5PxNaF8sppPZt8OD55457CpYf3w62U4BK0
 isrhAKIoTaj9xR6gSDF1b/PYtWV1OwQlafLpelCDO335iyHw2b26Gr2u2ifFiqvrr9FmSzIs+L0
 rzEA8xG3N/9zBmQJ7Kdt4QnrosqgA2Kco+PDYC2nbMz3uKmjVaJLyKny6CAv581GYtzvF9DyDIs
 SBpzFuouAVj3FvVH647CC77c8IvUonYQTsfZ7NBE0BRRT+mPfJz/nX7DG9xmdOaAH9lxjyI7oAU
 xq2qNRKR+3ZKifXSpHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MSBTYWx0ZWRfX9ROC5FoU/HdB
 eOZVMjFoExRYj719aHVbgoIuCIzIVB7aTzEjp3TERmfJYtjNRKRa1ujUOdhuUqY3GnX19EA1P1C
 dHZLBbAZ9vjFd1Qmg+icz/CBs+4lfgs=
X-Proofpoint-ORIG-GUID: o1o1CxlG0ye35bJdZ23BLMN-Nfl4fBUm
X-Authority-Analysis: v=2.4 cv=GpzXaU1C c=1 sm=1 tr=0 ts=6aee157b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oLONm9El9VE_NHCh4NYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: o1o1CxlG0ye35bJdZ23BLMN-Nfl4fBUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060071
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 6:39 PM, Yonggang Luo wrote:
> accel_cpu_register_type() creates the abstract parent
> accel-<cpu type>. A subclass names that parent, and
> type_initialize() aborts when the parent is missing. The old
> type_init registered only target_cpu_type(), which is one name
> in a multi-target process. Call the helper from the CPU type
> init of each target that has an AccelCPU subclass.
> 
> ARM calls it because whpx-common.c parents accel-arm-cpu on
> aarch64-softmmu. i386 calls it for TCG, KVM, HVF, NVMM, and
> MSHV. i386-softmmu and x86_64-softmmu each pass their own
> CPU_RESOLVING_TYPE, so WHPX on x86_64-softmmu finds
> accel-x86_64-cpu. RISC-V calls it for TCG and KVM. PowerPC
> calls it for KVM.
> 
> Other targets have no AccelCPU subclass. Machine init looks up
> tcg-accel-<cpu type> or kvm-accel-<cpu type> and skips a missing
> class, so those targets do not need the parent.
> 
> No extra tests is needed, as these QOM types already be
> tested by the existing logic instantiating all QOM types.
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  accel/accel-common.c      | 6 ++----
>  include/accel/accel-cpu.h | 2 ++
>  target/arm/cpu.c          | 2 ++
>  target/i386/cpu.c         | 2 ++
>  target/ppc/cpu_init.c     | 2 ++
>  target/riscv/cpu.c        | 8 ++++++++
>  6 files changed, 18 insertions(+), 4 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Tested-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Regards,
Pierrick

