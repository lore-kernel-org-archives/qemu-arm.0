Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2392334lft;
        Mon, 27 Jun 2022 06:49:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sx7NI70fs48FOvqYwVPy+d8d74zGnTD40yuUa3BvMLxBtygZGI0Ai70tuqhXl9XQA1fH0A
X-Received: by 2002:a05:620a:2587:b0:6a7:ee6f:bf2a with SMTP id x7-20020a05620a258700b006a7ee6fbf2amr8141001qko.542.1656337776965;
        Mon, 27 Jun 2022 06:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656337776; cv=none;
        d=google.com; s=arc-20160816;
        b=qUhaq3oDdOGkncBDgXoRdHNomr78Qo3h+IR9I06ai7+3y2JGAHUkhcOwskPD6VHFY8
         Dg4mi9GSIsulTHMkCUSHAGNpW57709DhjEp4QQFjXnC7/Q8xgGWgYKAiGL6kXnoy5Ha0
         OyKtoovZRz5o+T+DD11zSabarmeOeZHGdk3WHELdWjLgq/9nmcgRPCFsMZs6oX4oRFjp
         e0YrJfcbZ8oQRNBUfitmli2qp7BtjsRZp35MzfjmxC5acCgt/4S97ErnpCNqT36xt9vY
         TJxzBP4paS1VWnY9r8rJlfl1z4sJ3IzKOp3eZcz/u/57nCWoQLRsx03SVdN77FgpUBjg
         zD6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PrSSOU1MxC97YvB8zwD/+lVO9ZgziE4COhqGOgdk9eQ=;
        b=tnspfpsMTGcOX2cbwxOvjT1K1Odd3FZhKviW2jp5NYN54i3x8rOteEH1KhbRweDZ10
         qG0/Rk6Xj26B0LgVX7UNjr8m/6440TaXWufFHlqhKTg2Utdx5pyix/00mV7mAvg6uZEN
         H5CXowlepd5JiModyOlonkQoV39NA9jDDNAFV2fZs5QwB2GwcaK1SHJf/D+rhIJvvObi
         4mpkVQenavrlLdSTrR8wraJXDNAyB/1cN4qapBP3az7ehRoYR00YHS4VLTLsda4GpBTi
         tnw5RmsfdocfQ2H1je0QYtoDijbLFs2ZeNJ2ThVBMEOYr1M1BOeDyG5qs1ISHcNNHMAa
         N0aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fhgle95x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf3-20020a0562140e8300b00461e92994f7si5574352qvb.453.2022.06.27.06.49.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 06:49:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fhgle95x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5p7Q-0001o5-Fs
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 09:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5p76-0001kZ-R8
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 09:49:16 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:46701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5p75-0004iy-4M
 for qemu-arm@nongnu.org; Mon, 27 Jun 2022 09:49:16 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3178ea840easo85654167b3.13
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 06:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PrSSOU1MxC97YvB8zwD/+lVO9ZgziE4COhqGOgdk9eQ=;
 b=Fhgle95x9ZlmlXWLgoWMnQXRQod5n2wFdnycspWMSVD1bz0KOjtzl//BQ1sa2lsprV
 K/YQ0n9a1Qgsf0q8W7VYEASbcx+VKJlqktmoR53P2k/UhrqT5CdQVuFEKvY9auf13RS9
 y3LUc9Cw7fTF/RqyUuPSwsA1uAlw2pwNXKUZyfpKIH+uvPciYb9X9oXabfiD2RW2eu5T
 JtrLDXQPFsFyTHuswIZG38VtUAjZhxfdmkoqwyzJvwN17QaAIZ1YeoYAbH+CNvE3yN1Y
 YjCAVq/Pg945MzukQFXEpKmF0v9mFV8gYTUL6SeuqI1U/q2zF789+CIYVeAOOlM+ncEA
 1Uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PrSSOU1MxC97YvB8zwD/+lVO9ZgziE4COhqGOgdk9eQ=;
 b=iZHTYYWc35JtMyXTuh4DfopTcFI6oORDVybBzvvegcoG34vfdFHNpv+zWq28b+jhnk
 wRulBTqPbGjw18QcbgToqynAeLAwoSg6XmMWeiwqZzQgFmZ2tNfs1Hq5zaxMhec130LD
 EfSBLGVHR3CQrtbBLcIrQaN5VQetYgAZ1dStAc4yiMeptDirCHb8ThZzjRqO9evDSKnq
 uAlOP1QkrcAAd7W+FC3IK1YHQ+ArWdyzxeHEVq938J5rY4O94FLFLIXgt+I0AjqQYDH+
 ZWG0JhwhTx9xlTVXhzAZIuSQb1HeX+nzec/OBM10wPYk9s729TaC81U3YJJOi5UmQWKI
 aQuQ==
X-Gm-Message-State: AJIora/io66LuSkvzreqIkYp5bvVgxG2YGPavF6aDaLmkkPBDeT5ylyj
 qMTb/Yk1fDKoiDaInwBZdwVLRM7qSk8plUVH1Fw5YLyRmr0=
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr15190034ywd.64.1656337753031; Mon, 27
 Jun 2022 06:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220627134620.3190252-1-peter.maydell@linaro.org>
In-Reply-To: <20220627134620.3190252-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jun 2022 14:48:35 +0100
Message-ID: <CAFEAcA9UE0P=gU9Q50y6OuZN_0tO6mFO7d-yJmUF+GvSCre9mw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix qemu-system-arm handling of LPAE block
 descriptors for highmem
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 He Zhe <zhe.he@windriver.com>, qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X5edsZmPthfx

...forgot to actually cc qemu-stable. (I'm still not sure if
that's important to the stable-branch process...)

-- PMM

On Mon, 27 Jun 2022 at 14:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In commit 39a1fd25287f5d we fixed a bug in the handling of LPAE block
> descriptors where we weren't correctly zeroing out some RES0 bits.
> However this fix has a bug because the calculation of the mask is
> done at the wrong width: in
>   descaddr &= ~(page_size - 1);
> page_size is a target_ulong, so in the 'qemu-system-arm' binary it is
> only 32 bits, and the effect is that we always zero out the top 32
> bits of the calculated address.  Fix the calculation by forcing the
> mask to be calculated with the same type as descaddr.
>
> This only affects 32-bit CPUs which support LPAE (e.g. cortex-a15)
> when used on board models which put RAM or devices above the 4GB
> mark and when the 'qemu-system-arm' executable is being used.
> It was also masked in 7.0 by the main bug reported in
> https://gitlab.com/qemu-project/qemu/-/issues/1078 where the
> virt board incorrectly does not enable 'highmem' for 32-bit CPUs.
>
> The workaround is to use 'qemu-system-aarch64' with the same
> command line.
>
> Reported-by: He Zhe <zhe.he@windriver.com>
> Fixes: 39a1fd25287f5de
> ("target/arm: Fix handling of LPAE block descriptors")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/ptw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index da478104f05..e71fc1f4293 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1257,7 +1257,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
>           * clear the lower bits here before ORing in the low vaddr bits.
>           */
>          page_size = (1ULL << ((stride * (4 - level)) + 3));
> -        descaddr &= ~(page_size - 1);
> +        descaddr &= ~(hwaddr)(page_size - 1);
>          descaddr |= (address & (page_size - 1));
>          /* Extract attributes from the descriptor */
>          attrs = extract64(descriptor, 2, 10)
> --
> 2.25.1
>
