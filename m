Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C65BC624D4
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 19:55:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1r2r-0007dH-IN; Wed, 02 Sep 2026 15:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x1r2q-0007bw-60
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 15:54:52 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1x1r2n-0007mY-9V
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 15:54:51 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 682Hr0nV2372714
 for <qemu-arm@nongnu.org>; Wed, 2 Sep 2026 19:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 egvQ7UqkrUrF0V56XA6HVxuW0ngvcS/kOaHPr1EzfFc=; b=ihr2AtI9hBcjsuTJ
 toCNQPyi5Uq57aqKhe4oEUbJa8fjg6PEwdNu49UoC9yvkkhp0Jd98vTxyjKtvUUI
 v7uRwLbXmjy2UnwEavLsgRi2loUFNgahJAYRQpV1EvM9tTuYB7YCxlwzsAMNhFJh
 eM88dFmrwABPCG1KFZmATOcWJInOe5A9u5c0mgYMT+V/VIXSSQdSinrublgbLfiC
 iaF2EyelpFuTJN42WXFCmPDRxcxb3IxBlExVO77BSd35oVH5NsXUfjlWOGNZ6gDS
 KVBztQeWMrLBjBo+dX63BErJxKvdlPshcIQyAHAQcApX8d3JLtaC3JR9p784arzp
 CANeHg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8a5vj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 19:54:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-38f97b3f853so2572695a91.3
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 12:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788378887; x=1788983687; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=egvQ7UqkrUrF0V56XA6HVxuW0ngvcS/kOaHPr1EzfFc=;
 b=TyM0xiEprzgktLItAnLiC0LaC9kKlrCyh9dWBUCUdb/m9daJRqDJC4llK+gQY1hd1K
 ddbtM6Y5+BpKydNHcEge4oZ1LvuJYJ2xwPCvk6xnJA1FgpAnyqgjJUb0yDYa/5bpqP5T
 xQgsHy9NMmP3NI4fTZfoXR5uoywhQ2dP8iXWAs2ccEvJNr5iTvYpIDw066XG6L+8JVHz
 Ss59Hbk5XjDXYugvf4DYHH69TcVMpKAOX8rc2CUi4e75w1r5TP94NuVUQVTlkifgsb74
 k2Z6UwCAQwGFh9WP+5MtQSN4TN0y0gXn3v/2BX1+TpAXoUnX959zwH8iDW1p6hc2rb74
 EgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788378887; x=1788983687;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=egvQ7UqkrUrF0V56XA6HVxuW0ngvcS/kOaHPr1EzfFc=;
 b=POXzkoM2LDiJUoxal09gE2QSse4MpBVdTUds3rtbixKpkdZiuFW8gaVvrRPRSKCiZy
 iTuJJX2uO87jjztweRUPnguFzy61Zgj6h7I1/VFDGidlcOGnvbehkTHnGy8m3evV7V5a
 AzH4vvv4WKHYkQhhEjYc+DhUSxDKJZnXXlq5mmJb05hCNJ6OTdSuamkdZwt0Bj1WKoys
 HY9otKHm6CwtsWet//DldZLu7EnJ1XO7bGeC89hjbVAlAcR7JHi/fbwTzbQm51XmA4dI
 +7yhj4R3mLFfCLinlJiH+6viGIcpSRei3izt4uH8ax4ABpUyXSwu0p1RAtbfVHTvSBvY
 6oTg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx43WXmjiOu9ds4aNe+9lNxUVixJRsS+nTx3VN9htLOT00WqAFD1iNa4cPBFnG568tA10ARSyoMvg==@nongnu.org
X-Gm-Message-State: AFuF++maTk19Bl3RnfbiHbHCaCramOpLNlW+TFTANKp+VLrA649SYS8v
 Bk6BRNK9IJCTtMpKcLNGNKSIye4IEQa49pJrFT1i4s38XSzmQGH17aGoo6/ynOdQOVNV9IWxvU5
 U3VZaUp0A8FjOAxJsGpGRhYuRGHWZR6wcpRfsMFdXxtDQIrPg+fQ46lA=
X-Gm-Gg: AYBFou02cgkJ23M5pKHEaOwIdwR95yubc7KDauvoASjfBYYpeoUPvkshexpLDcUEa7+
 vdvxouhyJc+XauoFbZl8Su7HEXHPMTgC6b6SS1OpyquLmeYTmTjnDYuK2zoMDQqpAYyv0/Aex+S
 h5qcCsMM/zdQi8oPS+WSCLgRCAeLPjDBdBAPH+Ua41nB5wihxL0DfqHeAHDB1RRQVh20S7+eomM
 epBZuPsyfUtMJCSVVmzM55r4WXJXUGGzi60Z6n7dWRcPvzYpnrsiCM4agQ3GjuCDLGboEJ8J/zq
 r8lg8ac7gngTPS4uqj9UkG/a0AyIjtnquVU1Mik2CDhc2oly/CYoJl1n82eP+3FWdpZMuoUP9zc
 M044EJaxFJELaopS7jYhX6gBy6QFYEPCrsl4/XkF+iwQne6DAgOyRWoCZkj5itBeOhjSZ
X-Received: by 2002:a17:90b:498c:b0:38e:659b:f366 with SMTP id
 98e67ed59e1d1-39aedce7b13mr11445881a91.0.1788378887013; 
 Wed, 02 Sep 2026 12:54:47 -0700 (PDT)
X-Received: by 2002:a17:90b:498c:b0:38e:659b:f366 with SMTP id
 98e67ed59e1d1-39aedce7b13mr11445857a91.0.1788378886525; 
 Wed, 02 Sep 2026 12:54:46 -0700 (PDT)
Received: from [192.168.1.199] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1431990a65bsm345010c88.5.2026.09.02.12.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 12:54:46 -0700 (PDT)
Message-ID: <1251f0e3-237f-4f31-8d2c-0dae5e9962b5@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:54:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] accel/tcg: Document do_interrupt() callback
 contract
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-6-philmd@oss.qualcomm.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-6-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JNt8y4iNmSRfeB_Eiy3lOMIBV7iibK3C
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a987f07 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=cdAqMqu_iC8s5NaHwA0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NiBTYWx0ZWRfX83XmPwmAW5rz
 0sUi4xUFtdGPQW7uy6q51ZQSAmGj8ExsOHqFZHYOjT8N3GfCNs7V2a2AZ/6L+MCTaSSJrEqs7H2
 kDsVBBJnt1RJtiwfR+zviZLQsH3CorVu04FJGyGe4UZy12svgD6PY/i9mvnXiHCI4ANAlP/Chqr
 /n3QTSyBCyhVRZcEF52ggGcnU7kPMprBGo11G6iyi/tMKN50k9bXOLEYykazTLHw/0zU45rQCya
 aL8NSdP62xp1S6MAEyuGylZ0o6EXQ3YidiYqH7K35qgysUel9apXn9BruaT54/g+pIuJFlXr5JF
 gXHQhwQzi+sXJdLi53L8Od2AxTm/dA4wQpEyzH1JWQhAiABsYUn6f+Q85HSvpq97db/AOTpW0P1
 r8bY/4kWG5ySFIyC1KYS6QqYQNhk9eUFLi+pYgSZeierzSsVxqP46n/apNhJsdIwQ25S8seMNl0
 +k5+W3JaKpvGiGvW6Pw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NiBTYWx0ZWRfX72v4E3BaGgcv
 d8o7pS45U488y0T1pMv6OC9VdU40Tfnc0+UadEYTVjzlvFkHodCd+1ifrbJJD6wu4/dpoloXR7/
 bViuJ0DvCWSxXNz6i5/2uz81TeW2C94=
X-Proofpoint-ORIG-GUID: JNt8y4iNmSRfeB_Eiy3lOMIBV7iibK3C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020176
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/2/2026 8:20 AM, Philippe Mathieu-Daudé wrote:
> Expand docstring to clarify the handler is called with BQL held.
> Add assertion that this callback is mandatory and never NULL, since
> all targets must implement interrupt handling.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>  include/accel/tcg/cpu-ops.h | 11 ++++++++++-
>  accel/tcg/cpu-exec.c        |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
> index 87850402203..13df70eaa9f 100644
> --- a/include/accel/tcg/cpu-ops.h
> +++ b/include/accel/tcg/cpu-ops.h
> @@ -169,7 +169,16 @@ struct TCGCPUOps {
>       */
>      vaddr (*untagged_addr)(CPUState *cs, vaddr addr);
>  #else
> -    /** @do_interrupt: Callback for interrupt handling.  */
> +    /**
> +     * @do_interrupt: Deliver a pending exception/interrupt to the CPU
> +     * @cpu: cpu context
> +     *
> +     * Called when cs->exception_index contains an exception code to deliver.
> +     * Updates CPU architectural state (usually before executing a guest
> +     * exception handler).
> +     *
> +     * Called from cpu_handle_exception() with BQL held.

Would that be clearer to ensure this with an assert instead or relying
on comment?

> +     */
>      void (*do_interrupt)(CPUState *cpu);
>  
>      /**
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 609931a0d6e..2fae2c024b8 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -1059,6 +1059,7 @@ bool tcg_exec_realizefn(CPUState *cpu, Error **errp)
>          assert(tcg_ops->cpu_exec_halt);
>          assert(tcg_ops->cpu_exec_interrupt);
>          assert(tcg_ops->cpu_exec_reset);
> +        assert(tcg_ops->do_interrupt);
>          assert(tcg_ops->pointer_wrap);
>  #endif /* !CONFIG_USER_ONLY */
>          assert(tcg_ops->translate_code);


