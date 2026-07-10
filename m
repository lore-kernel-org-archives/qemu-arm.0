Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4A3C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 21:51:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiJ7i-0006Od-UZ; Fri, 10 Jul 2026 17:51:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ7b-0006Cv-P1
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:51:00 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wiJ7Z-0005jd-W8
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 17:50:59 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66ALCkYO1931536
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 84ec3fgK8/jEOWef5W0keF0/v+uLogAqU/+LIXNJukw=; b=S4XPX8VzBX9R0xuY
 f5g4wA6OIz1RhRLIsua69rgautEsTdLjTQNN19tZPU/12Dsq57JnLTL0Eu/lvEBC
 FDHppkkidzKYxSHQZMvh7htUXOMySmftwZFQO9x8V7UzMTIw8q4Mw+eUJyS8qYiC
 5yiheq1teeRnSzfOuhsqv4rYVyWjaBy1cJPF8ydCXHU6Klp3xkVOCqFsTVM8w8zs
 Qhkvn5cXffHnb8fY/svjAbK4meH9CsxAK6oBDqNuB2tJgRodLlVjfgU2I8/SabVb
 blcn5MQwPK9ma++nP0mh4m6obQBxbtarWdqjgLAJwACmc38cYOkk14xkJaTM6zbl
 PlmuNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb8f2r38c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 21:50:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-51a8c689b5fso15174781cf.0
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 14:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783720246; x=1784325046; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=84ec3fgK8/jEOWef5W0keF0/v+uLogAqU/+LIXNJukw=;
 b=MvR7jgQmUIMYEFHgVG2bLjk7EiBK8fnRYF9hBlS1Z+yQl5Ss84GesmhP2XIVAqgiUy
 gVps4MmxOoObMo1E4kzzMNAouXF+2x/CAx15cnxJi/sqcZU3WEWGmIHUnOmqdP4nAmBF
 VICeVqHBEUgVQLF71YYdcOVIv3/3Y/cNyZJwDTo8cWQYVIpkjbNtorYg93DcZJyWatVE
 RefbnMkG7j9WLr/Iw06iu+aeH/wi2LsXCmJuAHE+fa5KAkj1bb/dHchBWgyZncM6YhZ7
 6IL8I6piumiAknyshnmf9pn8p6UD3umN9eieAI7uI8of+OcIF3ed5TbRGMdnQWIzb9Rz
 QQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783720246; x=1784325046;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=84ec3fgK8/jEOWef5W0keF0/v+uLogAqU/+LIXNJukw=;
 b=LJa3WIy58HZP15DeBjE92y83x31j7jVcQEBybq9NoPw/+7m1Uds/ACeCjGhngDzNrH
 h9w+iQI9H+jbroBl+vwCm4q5HsJkOH1DzFj9mWQSBKgAsUHfe/BdQdOt2vSi4MWbhQ41
 2jfG/9kiqspcHMMF9igZN/0k2hUKZ1GsbqG968/CUE7Q/SLPYWHihWJa6t1P/S235t+1
 fCAoXRO2pLmGsaIabCeCXTvrjrAbW/k/BtDdK6QUVSu6kwW3ldGcG6lm4dLIZea+Z6hX
 jVsanTv7SxcODU0dQ15Pmh/6ngfIAJIdxr1k/788NrEHveRXEZaxjkfIGNx0WlZFoCT8
 dTxw==
X-Gm-Message-State: AOJu0YyHc0MU2LUtDJN+MOsetnwkvzoJsCBcqrHPqij+yutiHZMb76iN
 IwhKNL2Z+EzznmRdSP/Q8TfO//AdT4kL5EODiZnpBXpjBQRCrFJxS5mVfjwdAinjkL5ptvaBWDd
 JxC0/whBMH4D229oUVrWBLZAXjJvIPY6mNagcsiWwIPRNCu9dchz7eu0=
X-Gm-Gg: AfdE7ckB/nsPeSIRsMb7Di1vg5u2SAkbZLaKoxUVG8589Ax2frX88D63wnIHMNw3Shp
 lM3ulKhHP4q4cRX82jYi9kkdqXmBVMfKH9sd931Q8W0u7MmWY7pX+2OlHYAnHxTTchwc28pPebH
 J/+D0dOvvyx7YkTCfN027FxHnU6JVrxGUiPcZ3yE60lWCZjMpT008abQnfFmDGuo1UGmwO4jTDb
 Mh+Xruk+YxpSLK5PFQZwJ2dwhdY7yYaW4fDz2Frg2g9jgtDthkwixr8ol0lMMmjrydWudkApx+P
 rNXaJrZEvPJFH7O8yVSyTP4oLKq0nHa/mdmPeHilaQgPLaDu9dJIZ72t7SEfGFa6SLML0YFuc5s
 z3BiEFKRQu2Y8cKd3wdz+6dLNWVIZZZPebqSPlgHE5VWcuxm6p6FXQmsIAy2cIw==
X-Received: by 2002:a05:622a:1b27:b0:51c:168d:3ae0 with SMTP id
 d75a77b69052e-51cbf07129dmr7846501cf.1.1783720246102; 
 Fri, 10 Jul 2026 14:50:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1b27:b0:51c:168d:3ae0 with SMTP id
 d75a77b69052e-51cbf07129dmr7846281cf.1.1783720245684; 
 Fri, 10 Jul 2026 14:50:45 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039af67sm71706636f8f.17.2026.07.10.14.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 14:50:44 -0700 (PDT)
Message-ID: <7eec8cbc-e5db-4ad6-95e5-27d208298a6d@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 23:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/51] target/xtensa: Use bp argument in
 xtensa_debug_check_breakpoint
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
References: <20260710205401.836304-1-richard.henderson@linaro.org>
 <20260710205401.836304-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260710205401.836304-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YLavDxGx c=1 sm=1 tr=0 ts=6a516936 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8iTtmLh_eV7-T8uE9KsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ITUJseecC9qC0r8C5q698SzdXu6vh3Oo
X-Proofpoint-ORIG-GUID: ITUJseecC9qC0r8C5q698SzdXu6vh3Oo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX88BNik98MRSt
 4dIBML2h9nHwRN0A/sHl/oVIOmj/+xglRhhVCja10mfS9u46ynKX9rdzWxGJ9tZtzipS0Kj21QW
 uEh1+aIepZ+6B7U6qmfzfINEg0VhrUo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxOSBTYWx0ZWRfX0vTV4/suXznq
 Q3a73JfJaKQ3VCZueDxmmXKJ3WAdM3hT85BUkakDaHX2WSiYuYm76eeWLnY1/LOJmKGWZFq+gnO
 Z5tOVPS1J3jz3GuFzH1Qg21JTKQRWcvGOTbNTY3p4L1tdXSmURxmrFwMRE4pjfPFSnHWdfhdtK9
 cqjc4Em9H8td0lvBFtaUUfd8V4/YkKOFZKHApS2SLv2bttn9DrU5byPFo4uhLnfDniZi6Iiw64g
 CoBqTTkLk8U7a8FxwfZGxEilUXir+2rVqQrdAh8NlWhG7GivVhG0wMQ5eELk8SRzya12a245Hsp
 Jrzx4WVfxaNLA6ezNAuwWAhny2qX5X1iVztJ+RI9vNMfVOQYvkizCGa36cxImPTZlaNG4n12UZY
 Ce9n0FRrI6AAfXrvDOqp+l0QmjCs9kxciZWP3AZAcmf7piw+Kk7j4Qat3W1iv140AoSgxcqZR4z
 g1WFH2p2aMeqmwuF/dA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100219
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

On 10/7/26 22:53, Richard Henderson wrote:
> Use the ID of the breakpoint instead of a loop over all.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/dbg_helper.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
> index 557a7852c8..b08bd03435 100644
> --- a/target/xtensa/dbg_helper.c
> +++ b/target/xtensa/dbg_helper.c
> @@ -67,18 +67,11 @@ void HELPER(wsr_ibreaka)(CPUXtensaState *env, uint32_t i, uint32_t v)
>   bool xtensa_debug_check_breakpoint(CPUState *cs, CPUBreakpoint *bp)
>   {
>       CPUXtensaState *env = cpu_env(cs);
> -    unsigned int i;
>   
>       if (xtensa_get_cintlevel(env) >= env->config->debug_level) {
>           return false;
>       }
> -    for (i = 0; i < env->config->nibreak; ++i) {
> -        if (env->sregs[IBREAKENABLE] & (1 << i) &&
> -            env->sregs[IBREAKA + i] == env->pc) {
> -            return true;
> -        }
> -    }
> -    return false;
> +    return (env->sregs[IBREAKENABLE] >> bp->id) & 1;

or

        return extract32(env->sregs[IBREAKENABLE], bp->id, 1);

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

>   }
>   
>   static void set_dbreak(CPUXtensaState *env, unsigned i, uint32_t dbreaka,


