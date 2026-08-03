Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E327BC55184
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Aug 2026 15:06:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wquFY-00048H-78; Mon, 03 Aug 2026 11:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wquFR-00043z-61
 for qemu-arm@nongnu.org; Mon, 03 Aug 2026 11:06:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wquFP-0001fq-77
 for qemu-arm@nongnu.org; Mon, 03 Aug 2026 11:06:36 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 673ECYSC843122
 for <qemu-arm@nongnu.org>; Mon, 3 Aug 2026 15:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rjs4nIMP7iizxXk9Gi6peg8/Qe9o1jtjeDFmwLowbhI=; b=J4Bde9wwgqJFy2eI
 s/dMr4zLsHBmQjFi9xiVw+vSNebfRt/+mBGXeqLBCi2sI92/j2YVoEcn4mOIQg3I
 rG2iOAbLp6GADks5aWZMNJ5MQf1Q3NDdHXtIZnvyztmHV6114Fm6TW2kwK7yyceC
 pIgCayOAyyvy7Br/QNO8Ihwq3RUiGl2PdUavpm9c9JzsqupBsh9v4cbdP7nJST/8
 DjzgCzXQGAsXj+O7sj7sRiVtoK14Or5vnExjrLC1pVR7qpOuRcIQG5y8p8GQd1W6
 zARGGL9VVFTJ9hVZVCsbZuNHmC/Jm5hwzhRwyChhATCILGduQFWvERXPjU7dRxdy
 heC7fg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnj52b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2026 15:06:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-51c0f0a0760so71285381cf.2
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2026 08:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1785769593; x=1786374393; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rjs4nIMP7iizxXk9Gi6peg8/Qe9o1jtjeDFmwLowbhI=;
 b=RWLmFOGbKEAuJfg5c7kmkJexhAUaLp6Qo7GYROzCVEKppL+83+HXCHAe0IhNd1u++k
 2zgKxaGticgzFb2fTfxk/BA5GosxzgWR2HBp/95gKSmW6ku4Ij3i8bb91FuwjnxLLcN0
 gzkL459blcoazLVsHO0wIewqXAlyPt/4F3saMTMnAR25JMAGETx8W2+l/3cuB0RQvsOV
 eC6yI/iCvvpyeegtG/e2Lx1O1ST9/ls1j4kHuvSyfptFv0301i2CuQNA5DHZGGf27EaH
 SDzzk3+cZ3FK+JA95Er1kxFC7x/HGMzHgfStVKveOEz3BoOGWFisE2dOvgiPSyJ74MBB
 oTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785769593; x=1786374393;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rjs4nIMP7iizxXk9Gi6peg8/Qe9o1jtjeDFmwLowbhI=;
 b=TzeLjUU3wCuBdk7B8mspVhiMU47wxqX8gbkW8iLTLeZuPIP9SKUxee3c8y9x+U7uYF
 rabKaUdhxLTJGdib1ESR4K+wzshF6P04tWtb9hAt334l11SmFNUvqEt2nRuh6ewUKWDx
 E+clQmfZBlF46Nxf79ChAGV6HWuhaUBPbSTH9f0fe8crqapyww2DRLU58uX4/EJUEq/5
 i+RxbV5TUPMiCG3rgezKqh/yJ3++VxrIE+6MD3k6GCwTD+NAs+2DUkuTuftTU6afrPBA
 Sw/aig4vGEaVSe6BUgCGUKCzPjJsOtpGqfV29eJawH1awd1o+r55tUwV1pGULMGyCVqA
 g+Wg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoNINipfDlz+tgOqbEBVhTy2lufkDiVwVUHT4SlGIKwI7yNlbDYiYesK3CRxwlRa9xDa00R1NFbXw==@nongnu.org
X-Gm-Message-State: AOJu0YzCcp0xmqBnu6egfyzEeROLkq8O9B5kkhnSmJedkz59yNSdzeY/
 sqdDDI+/VkR+Whd1VXE9/qI+tL5e2uKwuvBZ4P4lEASUtmPQhvQm8j2pYkY0FHHkK0nofGYIvML
 bxhujhaZilH0cwQqMoBVIw1g92njap6OfkcWzOjq2D046qDEig+oM618=
X-Gm-Gg: AR+sD113fEBVN569ACgDascTiAu1h84anKiF0nQJOYbcHnQsnD1pEh8/oDyG18v1Ufe
 9iink5EW5GnKtXW36oD08XCSbZdA/kvTi04y/JAnlPs9pYUpI860YpkTqTqiIPF/v6NbqOd97ZS
 g7F6zJzWEhFjbRLrgzCT0XMSddVZaWCNnOq0NriUEOoZaaLIqAZt9e2mmTI+NgYL5KM4Hdki8Yb
 i0vVJUd90ttkL8eRYF9V55pUsDjQLP+PJ6NKYU0tad3Z0kKTXEUqmMoP74ZkvEomQPUA30sGm/p
 cFZflOIaYcktb+YPTMMw1Sq7yV8aQ8dm5u5FhCkcL163j6tO+EKvgsFNXyyHJtKD+iGPVUGOExT
 hWqQJ5ve4MZtXFvAWkOweHI1iMUieZLHa71c=
X-Received: by 2002:ac8:5f4a:0:b0:517:9570:c1bd with SMTP id
 d75a77b69052e-52b5673f0f1mr193370691cf.25.1785769593022; 
 Mon, 03 Aug 2026 08:06:33 -0700 (PDT)
X-Received: by 2002:ac8:5f4a:0:b0:517:9570:c1bd with SMTP id
 d75a77b69052e-52b5673f0f1mr193369101cf.25.1785769592068; 
 Mon, 03 Aug 2026 08:06:32 -0700 (PDT)
Received: from [192.168.69.212] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4980869106csm304683795e9.9.2026.08.03.08.06.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 08:06:30 -0700 (PDT)
Message-ID: <4b5db4f0-bad1-48e0-bde6-f72ae4681f39@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 17:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] tcg/loongarch64: Import REVBIT insns
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, git@xen0n.name,
 qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, 17746591750@163.com, maobibo@loongson.cn,
 lixianglai@loongson.cn, philmd@mailo.com,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260731000503.170446-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a70ae79 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=Q8D8so8t8yqNAXCl7-8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DYox2gTjgug8mdVc-FnLW9s3ik2Ak-LW
X-Proofpoint-ORIG-GUID: DYox2gTjgug8mdVc-FnLW9s3ik2Ak-LW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEzNSBTYWx0ZWRfX07Ctax1eO2fC
 xQmXAihhp0QR27kngjfThweIW1nBxzkoZKjJapK/FbktliUhqG1ZNPz0vBpt5Y9C6eiVi3QpGom
 l0Ex3ObUTLS6RLONArbHyo5Awxliar5jcpa2YXv7ye3tjtEX/75wsEkFkM9bKT621gFTfI6Au5e
 ZiWcy7eBk2DEkWdfwfp0m0KeArH++jMr9iCrmTxu8UUYfO9k8nbpGXxOwfkifnmBu+lE59FcskP
 TxOVESRONmVXDbg9eC/Qasty0/J0F5D+Fev01C/mJpxJUcRvWFyubaAwitakESy4gJqSZSLJ6jq
 0RipENm2FQYrsVslFASgURysfqosHdwCEOsdAq0nbGj4CmtqMA3W4tUOmYzVi6sCYt3luh72gZ+
 P+CZIfX4Dc/x3bKgsOSxnB8RLACYKQRC1VGlSpkkd+fZdbGi8RWFsAFgi+PNp9hmNmUuvV7Xjcn
 zev65zmn1vMyR3ZVFMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEzNSBTYWx0ZWRfX3/uxn83k1Aea
 7C1HM7ECncYQywtVBsDFAXb7dPSbt3Fq83wKQbW4dTI8etPYljdrWDkU95jg/P3ei1Ao6f+KOAe
 a211bXMeLTyl7XnBtr8us+yzke1nMY8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030135
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

Hi Richard,

On 31/7/26 02:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-insn-defs.c.inc | 944 ++++++++++++++--------------
>   1 file changed, 487 insertions(+), 457 deletions(-)
> 
> diff --git a/tcg/loongarch64/tcg-insn-defs.c.inc b/tcg/loongarch64/tcg-insn-defs.c.inc
> index 6bb8656fd8..c308b770ef 100644
> --- a/tcg/loongarch64/tcg-insn-defs.c.inc
> +++ b/tcg/loongarch64/tcg-insn-defs.c.inc
> @@ -4,7 +4,7 @@
>    *
>    * This file is auto-generated by genqemutcgdefs from
>    * https://github.com/loongson-community/loongarch-opcodes,
> - * from commit 7f353fb69bd99ce6edfad7ad63948c4bb526f0bf.
> + * from commit 40ea52087699392ad911387b666541891d33da31.

I couldn't find it then noticed your
https://github.com/loongson-community/loongarch-opcodes/pull/10,
so pending it to be merged?

>    * DO NOT EDIT.
>    */
>   
> @@ -18,6 +18,8 @@ typedef enum {
>       OPC_REVB_2H = 0x00003000,
>       OPC_REVB_2W = 0x00003800,
>       OPC_REVB_D = 0x00003c00,
> +    OPC_REVBIT_W = 0x00005000,
> +    OPC_REVBIT_D = 0x00005400,
>       OPC_SEXT_H = 0x00005800,
>       OPC_SEXT_B = 0x00005c00,
>       OPC_ADD_W = 0x00100000,
> @@ -545,14 +547,14 @@ typedef enum {
>       OPC_XVLDI = 0x77e00000,
>   } LoongArchInsn;
>   
> -static int32_t __attribute__((unused))
> -encode_d_slot(LoongArchInsn opc, uint32_t d)
> +static int32_t __attribute__((unused)) encode_d_slot(LoongArchInsn opc,
> +                                                     uint32_t d)

What triggered this code churn? Could we commit before generating for
REVBIT opcodes?

>   {
>       return opc | d;
>   }

