Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5D4C5DF9C
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 12:30:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyToo-0002yX-Aw; Mon, 24 Aug 2026 08:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyTol-0002xT-Bc
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 08:30:24 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wyToj-0008JB-4a
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 08:30:22 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67OBMeRZ3194990
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 12:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BHpP+PuDRgPb4YiCCnLaonqjRAXPShnppHYkLBmU/R8=; b=T7hsGj6BdzDwA7p1
 fX8USnnKzqCheFLk7Ck1O38xD3+19iPY+tAVbfGykw+s3vh4CIzooHHfjuvJnlcP
 1RlvlYmKtJ5uEp9EHeTg2icYfYZS5XrjKaGzUBXeLzZGBrxbaDGEuU+IrgHpCOn3
 BO7It8e5GDG9hDlOGy4DrP9c32RRZNCwUa8uZ41IrgSDwJn4knWmFaMIE1KnWM2W
 vQcdvu0QkF9Cl7L8VpBAmMFug+L8Njwy26vSS0G9Jv+SgB66jOaxoRbqVURDas89
 4a90TDaNP3svOOLebSjvtsMnPbCZapQK+dQsEf7M39vP5DCSGcSIEmfXbWVsn/Bj
 12ic2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgs7n0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 12:30:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51c1d137a68so73769341cf.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 05:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787574618; x=1788179418; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=BHpP+PuDRgPb4YiCCnLaonqjRAXPShnppHYkLBmU/R8=;
 b=MGuCV4z3vaGp8a6+9VGC0jI9IqSLQ0Euw7E+E75L25KWlT80ckyfTVX867i7wuO5bi
 pQSytWKrczBKJqjFNxVlnjsDWkh7mJ7jW7yWnuUeVgAY/wI6Cm2a1NWSQ9pykLaTggM8
 dpzDekVzsHGtWU+3zCjPO90l/SZXnuXu7xYxtqK7dIC3Wucb4RBVn3Mq2tdEVGf04i6n
 OIqg3E7oNS0xS44Bry9q/1uE0laPAjMmX6Y8xvrlVs6I5PqpVP1OYLxEoIxsd1mTPw/6
 28juewZrzsoze8YXGxBS5+yCtThI9uMFUkZd1Yo91QcWz/HKs6fRD2AADbF4HG9e55g1
 J7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787574618; x=1788179418;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=BHpP+PuDRgPb4YiCCnLaonqjRAXPShnppHYkLBmU/R8=;
 b=Q09nXCrhLHXZByGw4U9wCbt+IkmaLcDSMh7r4bh8Kf4YjnHRVQvEQ4oUzMOnsPnfKK
 I1JnW6zS9XZwTBoX7n0OgDop3OqXZejViMelca2LEUwhUw0mGDRdByCUlxFe0tTsTq0s
 266viJpcM5cYHrwDUR9+iTLSVfE+BtAi887/cLuvxq4RLemg2l+LPwDTS4/EqBZgF1Ou
 iNZY84puG1U0zu4qaYqphEXzcQaEFF+MMTemDroxTIXmAVyIcs0jr4z2VOHT5cPBEDtV
 FqGpQnhSRfDi33n3czFSx7FNB+g32q98gttnj6yHBjWKtsH1h6BKb7iJOf1vlcrNsAqC
 gXZQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqomB9DeEG2Mt9xNIzmnAjvxjUJnz3JihRbWLEVshChweiLxHDH0HE4qs4DbK9GRVyzR5jecNsF1w==@nongnu.org
X-Gm-Message-State: AFuF++nspue2DkLPjM8iHohU4655vpwf5t6FvF1ovqNTeioN4Ed0Rjnl
 M+glXxjGo6XtZOLq3lQ7UgB365vpkFcXgy3FCr/6EMNoqJ93f8+2pT6ylDXO19nREw88Qgi8xM9
 64IL/b50oQ6fMdDfTfFks1fLEOU6N1KVBWElhfbY18b3Ap6zbgAmOWaY=
X-Gm-Gg: AR+sD13jZLgIQkPyaTapd7Orynp4evbnJcLAhzb4Z/74D17UlEzUl06I/dsE57ZPz9j
 agXSl8d+sm3iJFJ+Qx3r2Yn1+J/7UGXRWDRyuMpiThJPk3Fp1kHXZ8q2+L1GmeLKZNezWSadPEo
 FYVStkSgnMbB0weL6mNBDyhuIP9jAcT2G2FhJGlQz6aiT65wvjQaTNWomFDfAng6TAAscGxMC/e
 13wRfYGrTo52GkHOkAzrB2noemVkmyDI0vmOPlx57TVdO7s2P217aJhMbTW3f1dVymKksdz/nok
 J3TKZTahv2OiUl762m500g0NBc4TzbfPCQAUNBwclO6l89S5FWbVR0rRHF7lpZBEMyAhNnYwe2e
 R3aw3Ct2s8IvRaREVfpemJdFd+7GN81bq6kGc
X-Received: by 2002:a05:622a:258c:b0:52d:8841:ef7c with SMTP id
 d75a77b69052e-52e09cca3dcmr184288591cf.31.1787574618307; 
 Mon, 24 Aug 2026 05:30:18 -0700 (PDT)
X-Received: by 2002:a05:622a:258c:b0:52d:8841:ef7c with SMTP id
 d75a77b69052e-52e09cca3dcmr184287481cf.31.1787574617668; 
 Mon, 24 Aug 2026 05:30:17 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a1c2e56737sm14645841fa.6.2026.08.24.05.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 05:30:16 -0700 (PDT)
Message-ID: <62af219a-0813-40e5-93fb-1ae623248f67@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 09:30:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] target/riscv: Fix RCsc ordering of Zalasr
 store-release
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 chao.liu@processmission.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 TANG TianCheng <tangtiancheng.ttc@alibaba-inc.com>
References: <20260821064032.49556-1-zhiwei_liu@linux.alibaba.com>
 <20260821064032.49556-2-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260821064032.49556-2-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwNCBTYWx0ZWRfX3MXKGfKYCjqU
 9fMNqOD+so6AmXNZdrLidWvUQJmnhmFFnNx9FKkDxKP30VIxqMd3FlJFlWs5z2LBMOVZClipIb7
 kq92Bs0QXyxRRqrupcjovX7Qycga9tw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwNCBTYWx0ZWRfX+H6JHh9sJes2
 DdFjBh1oMCR/8UAhs7zWVYLdVVFfETjAwMc1Tcq4QNBseaTYDeFJo+Xh/jhJhZFwHY0s5JqhGpJ
 P/QTLr1SmJAxAYm7lc/AVlQVVyyvt3bagPVo0RRVwX1kz1nl6wwy2/L+Z4iWF475WrYja7v4VT0
 +EkPna7FHJ7d06wQ1c8aHHZiLZaj5uDZtgC6fSECetk89zfN31tN33s3ONEprZbXnoh72OM8655
 26FkMb89K+B3Yu7yM/FjTDMO6iYO6Z6+dOjm8lASsOakhf6/PI/2hf5iCM7qOQGV5vkFf84OAM+
 qYa61mWiMPRn81gX+ampULbDYNUO6XqGu4Mpc5q2P8yminRKbRgsKtyAFoMX//wZIor5CeHktuq
 mlQ701sAfsBYTArOFhOuTBzloV65y3PXMp3t3tRB+IaHhoRpMsrnFyi1sG+vtZu0zmiByVZlumO
 U6jH2BBEgzl87iHtF+A==
X-Proofpoint-ORIG-GUID: PgQKNcI7el0GaYc0AqxQ4znsiFAcGtGn
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c395b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=SRrdq9N9AAAA:8 a=V4zo2IF0AAAA:8 a=EUspDBNiAAAA:8 a=UI-TSrfoyZab33DARoIA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: PgQKNcI7el0GaYc0AqxQ4znsiFAcGtGn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240104
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 8/21/2026 3:40 AM, LIU Zhiwei wrote:
> The Zalasr load-acquire instructions carry an acquire-RCsc annotation
> and the store-release instructions carry a release-RCsc annotation;
> the extension has no RCpc variant (Zalasr specification, chapter 2).
> 
> Per Rule 7 of the RVWMO preserved program order rules ("a and b both
> have RCsc annotations"), a Zalasr store-release must precede any
> subsequent RCsc memory operation of the same hart in the global
> memory order.  In particular "sw.rl X=1; lw.aq r1=Y" must be ordered,
> which is what forbids the [0,0] outcome of a Store Buffering litmus
> test that runs this pair on two harts.
> 
> gen_store_release() only emits a barrier before the store, which
> orders the memory operations preceding the store before the store
> itself (Rule 6, release semantics).  Nothing prevents the store from
> being reordered with the memory operations that follow it, so under
> MTTCG the host CPU may execute the load-acquire that immediately
> follows a store-release before the store has left its store buffer:
> 
>    * on an x86 host (TSO), store-load is the only reordering the
>      hardware may perform, and it is exactly the ordering that is
>      missing here;
> 
>    * on an aarch64 host, no dmb follows the store either.
> 
> The defect is easily observed with a bare-metal Store Buffering
> litmus test on a 4 vCPU guest: "sw.rl X=1; lw.aq r1=Y" on hart 0 and
> "sw.rl Y=1; lw.aq r2=X" on hart 1 produce the architecturally
> forbidden [0,0] result in 89881 out of 100000 iterations.
> 
> Fix this by emitting a full barrier after the store as well, which
> mirrors the FENCE translation.  The TCG_MO_ST_LD bit included in
> TCG_MO_ALL makes the x86 backend emit a serializing lock-prefixed
> instruction after the store, draining the store buffer before any
> subsequent load executes, and the aarch64 backend emit dmb ish; the
> store therefore becomes globally visible before any subsequent memory
> operation of the same vCPU, and Rule 7 is satisfied.  This is
> stronger than Rule 7 strictly requires, since the barrier also orders
> the store with respect to subsequent non-RCsc operations, but this
> matches how QEMU already implements FENCE and keeps the fix simple.
> 
> The load-acquire side needs no change: the barrier emitted after the
> load already orders it with all subsequent memory operations, which
> covers Rule 5 and the remaining Rule 7 combinations (load-load and
> load-store).
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Co-authored-by: TANG TianCheng <tangtiancheng.ttc@alibaba-inc.com>
> Signed-off-by: TANG TianCheng <tangtiancheng.ttc@alibaba-inc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/insn_trans/trans_rvzalasr.c.inc | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/target/riscv/tcg/insn_trans/trans_rvzalasr.c.inc b/target/riscv/tcg/insn_trans/trans_rvzalasr.c.inc
> index 79b0b2c63b..28d9b13c55 100644
> --- a/target/riscv/tcg/insn_trans/trans_rvzalasr.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_rvzalasr.c.inc
> @@ -86,6 +86,14 @@ static bool gen_store_release(DisasContext *ctx, arg_sb_aqrl *a, MemOp memop)
>       tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL | bar);
>   
>       tcg_gen_qemu_st_tl(data, addr, ctx->mem_idx, memop);
> +
> +    /*
> +     * Zalasr annotations are always RCsc: per RVWMO Rule 7, the store
> +     * must also be ordered before any subsequent memory operation,
> +     * e.g. a load-acquire in a Store Buffering litmus test.  The
> +     * barrier above only orders previous memory ops before the store.
> +     */
> +    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
>       return true;
>   }
>   


