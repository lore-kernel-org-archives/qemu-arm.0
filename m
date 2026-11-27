Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9549E606A31C
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Nov 2026 17:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Id8NcrQe
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWzb2-00067F-OW; Fri, 27 Nov 2026 12:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWzb1-00065Z-As
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 12:18:51 -0500
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xWzaz-0006qt-QC
 for qemu-arm@nongnu.org; Fri, 27 Nov 2026 12:18:51 -0500
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-675617e81f9so9514951d50.3
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 09:18:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795799928; cv=none;
 d=google.com; s=arc-20260327;
 b=nhg5AaRZQn+EyCvmz37Udburn9TwSvjDfvuuoFzJv/58eobfqfEKHbdpF5qS5UUNFZ
 DkHgP+mypMzYICOMPTed/foMu/GhJ9ReCC2ZkAkUkdxCL7Kja7Hq8bafCYWyzhtIo30h
 SXZGIavZeM6CTgEFpixCpft9/s/riH5lBn5n90IHR/Pk0MLwYLM2aoLals1ldpJKMtTe
 0+Usr2ov6ngPbOFBz3vERU9H59xBTC8cWamWyuirwIuyoO5hfoyGkvSJDojdh+Sq+5a5
 VeRysA9QUHO80yr5DcdvveJq0rBbikom6qZppXOp65Zx1jZbmGzRQ0yBrPsjBKjDdC50
 rIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=DkExGWsAVhbP89rZ5UXR8iSrPhkB24HeUdkibJZMJfo=;
 fh=cqSTVsA3YKnBAMQJZiVjGWjXryNDAHn4MQ92z7TXBWE=;
 b=DqNgHWf2w4HQrF8+QaRvCzbrY2QCrbLGePR4dL3Pwjo+vP7KT6gw1QMpiRFiXc8mDA
 nE23JQvUl8MYxBfn6zUdXkaoiepiI0fSzeE5iMWZWtcALaAt86mdZF4C6etdZqIfX1ck
 h+anIKPkroBh8pVPcioLRSLShtPpcqd5D4GinATNPyaVO8h+bEq1tb+O1gXEkmc16a0B
 biSFPFYxui8y5g5l26uSWMg1XuAMy5q4maHXumN50WqJPwC2hE6XSMXmHKt4bj6Xn/B6
 ZlN+ZHfnd0zURTaTGJLRudTlLHL+fx/jR9SF3SM9mYSAvaidCVDyyzkxGdoFroflrWbm
 19tQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795799928; x=1796404728; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=DkExGWsAVhbP89rZ5UXR8iSrPhkB24HeUdkibJZMJfo=;
 b=Id8NcrQek0do8eSylcpA9AD3lHg3ORo8VH/KMQrVJ7iq61JtRZbxUfuzLbdWDrvTes
 wBh8Q2R/Kl3jv3JZywJZc4mxBEK8/4QOUP245kcPMDQ3xuuNCCmHhspUDMyTEVw3mMhP
 A4N7MjNM2iapYOLpvoZIIq+yKdX//4Uf0gb3rHl7dU7OrxEfuLfFD58hZqfVJ7woXPU/
 CdMfsfk+NtLyjMMZOw7+pqtmr6o08XMs0KL1fTiBtBjM/kubYiL1ZWbFOqKw4M7xHIF2
 R3jvKivHIICVWtEmSvyfyHdKfDSHD82SkJYWXfbUtLH05rH03oTSQ6Bj6fgckM2Wr3GE
 0K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795799928; x=1796404728;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=DkExGWsAVhbP89rZ5UXR8iSrPhkB24HeUdkibJZMJfo=;
 b=bbo9qtoGQlAXOnkDPBaG/yUPsGw7CW8iXEUsMVQi1K63cSRfQsfRC8ezSdezfKwLa9
 7+xNg+aB/WfIuYssGHSXMg6kxjaBY0pmTfnjOr7TTlyEpkd7JzKeXYROLXGEsWNT/IdU
 q+vtKkKX0VYQP0k12Mq97cIJ93VDwxkEHXZPjoB0EFriOI5q1W3HzlqRDZBuwR8K0Ags
 ObCtRICWah1yG58XnfXs6bRKrqpM7SqLhLBVfnFj0HxPIofskoYuGSdYpYw1aMonrm3W
 Hyqgjw22r09t9+CEvmKjSWDM2rxkvYZdzGNkdznyNxL3BMP/9vyvWWMh6PuMba8tv9oq
 4mjA==
X-Forwarded-Encrypted: i=1;
 AL+hErHFFwq2cfW3bW0yQcrTnh63+j3IBFj/tCIfmAIFxLIME+ILv8kX3feh9R00k9X1D2bUrocRgT+yNA==@nongnu.org
X-Gm-Message-State: APuU4Z/1HD1sxS+BXBMWyDcDOcnb/LKcbvvkOxjvSzXvoMlKyrY3suI5
 6cQcaGScUm+vYwNt4fBx3C6+lQGnDScenDM2vxojRsoUIAopSvlGvKDnZJOYe7I/DE7SMsMgRwH
 GY4nF3RIILWotyRAxc14hUnTEKPaFVeM12PqFqXD9lA==
X-Gm-Gg: AZFdTZcW+joi3SkHIFxR7+FvmTKLIsHEhQVBnQDoDynHcFPEF9rrXlIpoM4T2JGAKYj
 OOgk2PoWhrwG/XJYPHHv8FCKh05iNkv4eTcF2N8ME6nSPd+vU08mtn/MF5rOyAmUW50FZ80StDs
 VsUSJMe9XBhxP+uyiDN/X5UaMPvLca9zycEm1muf0x0xYqkkUaqbCCuS/cLji/MNMviHDioaqm2
 z5e0bLwbZ6j7PH7/WXYsmVfsmdfM/h/c/sGURPj3OpIk9BKN3lY4X5pQ9MLSwkq5hT1TH8unbc6
 l5Pt8GgEGcB3KKiM6CUuE/YlsHPKCTmXiCL+zAnhYMw5xudOuwGM0da++aV1Sq4NnwTIe+DIgyk
 KoJhG0byyj6q19UiNsuSfSVel1oJOq/rkJ84opkExS/IZVhMvY0rQ8uE1W1qoz59lD91+DWceMi
 MHJq7Izbbjkkm6HMGSbIs4
X-Received: by 2002:a05:690e:169b:b0:67c:1ebe:3850 with SMTP id
 956f58d0204a3-67df42bb2dcmr11115904d50.12.1795799928447; Fri, 27 Nov 2026
 09:18:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030194318.319310-1-richard.henderson@linaro.org>
 <20261030194318.319310-10-richard.henderson@linaro.org>
In-Reply-To: <20261030194318.319310-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2026 17:18:36 +0000
X-Gm-Features: Aa3M54rxGfqHeCqJI5HNjHlsMvrEjtYkP6DYPk23C0_ilfzP6TLxhR_jlyXQKxI
Message-ID: <CAFEAcA_s9K3rwbA15CGJ9TFJnhDWGt5JNEQ+1479wu97oi14Yg@mail.gmail.com>
Subject: Re: [PATCH 9/9] target/arm: Use tcg_gen_goto_jc3_i64 for aa64 branches
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 19:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Assuming FEAT_BTI hasn't needed a page-table lookup to
> determine the BTYPE for the destination, we can compute
> the tbflags for the target.  Pass all that to goto_jc3.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index edbf67b03c..4a56fa70b7 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -566,8 +566,11 @@ static bool gen_indirect_branch(DisasContext *s)
>  {
>      if (s->ss_active) {
>          gen_step_complete_exception(s);
> -    } else {
> +    } else if (s->tbflags_invalid) {
>          tcg_gen_lookup_and_goto_ptr();
> +    } else {
> +        tcg_gen_goto_jc3_i64(cpu_pc, tcg_constant_i64(s->tbflags.flags2),
> +                             s->tbflags.flags);

Why does tcg_gen_goto_jc3_i64() take "flags2, flags" rather than
the more intuitive "flags, flags2" order ?

-- PMM

