Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp839292eji;
        Mon, 18 Dec 2023 06:43:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJGvbrXHmAJHSfKMEZvE5WjmFqipqqR6n99I+l9AjQBHr0xj8BsWrPhaMrhY51V8Mtwyz2
X-Received: by 2002:a5d:64c7:0:b0:336:6b16:7a7f with SMTP id f7-20020a5d64c7000000b003366b167a7fmr987881wri.74.1702910628480;
        Mon, 18 Dec 2023 06:43:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702910628; cv=none;
        d=google.com; s=arc-20160816;
        b=f/bMr7ghVQ4PuriLjD0IwkutWVNqYTQknjVeYZxs8DV4pJ053OhddvKzlM/V3YR1PC
         eWoIsNGzVTG6YXJ8VU5cH3n11xX+dQo/Rth0tvv1A/uZGpVeHczvr/ZJ9JjetG15v4Ss
         ASowAGdG4PIpZZfukz85g8hnLNGyPtYaRdm44jmCcI3RdGtn1bppXDJvZp8PrCV/mtVk
         bD7caYhxLqBcsPr30fNQvmkkifHa5oy2Uab5ANj2siETg+JN5gOaW3PVarNi6cVYNZtn
         7Fn/zOnwj+vzricpfPVCczF3GYE3GglLDzAeFBlIaTAdSR75h+lzv5oOzwFntj0kXpso
         WTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jT2wYtXckYct+df02E8MEFhxGAHUHfRpaAaDIterAJs=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=L49BcRKOkc6DnxpcNQmTBg2ElHqS3ctW66H+F96sSR2iafNgkHGksL4oUoEgmebRk4
         jUIBjK5HxjIJL8kc9vwbgtrEutbMlEQDs9NEul+p4e0DHYg6c8j50f7lYRY/I6jHWvm0
         n4z9CXR7EWXQZteQccMzTQrUZkvIuZmasTwsdY9QXcqrmKd+EXLqSaIVy+ehak/Thddy
         /gw6mXu60myh63Ms9hIvutdoBIplNxenXDt8UbtrVGlIPKoS62bJkjbZJA89rgSSqqGD
         sFj2GGXp07j+t0QWVgsj1CVeEMtmsrfLlv84ygSCMwbm34er92oje3yZBjIg7QncTCHI
         iPDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Td6Dqklx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020adff80d000000b00336664bd763si1387469wrp.812.2023.12.18.06.43.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 06:43:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Td6Dqklx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFEpx-0001Xv-CQ; Mon, 18 Dec 2023 09:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFEpw-0001XX-Au
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 09:43:16 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFEpt-0003WN-Mj
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 09:43:16 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5533ca9cc00so1704457a12.2
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 06:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702910592; x=1703515392; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jT2wYtXckYct+df02E8MEFhxGAHUHfRpaAaDIterAJs=;
 b=Td6DqklxenO2qu1uCTT4TO53idjhoQ2bucZJsn74TipJ7ZWjgwpZ35mWKhcyiaG8Cu
 KsHJYQ2EWNbqiosXWz2/mH0HXse0fJlPUhGzDysTp2aDy5SdmlsX8o2qGUlLbeMd3mCa
 hqnir2eAMRdL4eVtO7zvugjtWY6ibwSJBSAWsN/uOjFOh2peQFWZiDet1GpNaD+gh52U
 6nwumnMqy8sFpsqnZ3rdVXoAuWfEqI+8zR6Ji4f/63p3Di+pBgjxgfKj8ya8ijIPo8mb
 L+4Smtlqu+sXIMwSBMfXhgQ9At8PTKXH68MEanm12P6KhxiaVmFzwq0yxmdQa8zbrJp1
 7xZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702910592; x=1703515392;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jT2wYtXckYct+df02E8MEFhxGAHUHfRpaAaDIterAJs=;
 b=NVVWrhe7bO5nstVFuf1ZKlRBhkg9XeEdhMLhSW5wZLl/RLwj/fxzK6RelAFIX/gg7u
 d4WVA4xL9KbtlJ44a/7/8xcp7Ye1FGKTB/7BvF80w3munyiC+yyKm4wCuSKfDAgkDO2T
 D8SPRzkMUMjZayfInBWxSSzfhpH9I9WJE160lZg7T4KW+oBZXbT0l5Pv58uVqeUsu8za
 kWen9Af0d/YFpglbJLLVN8MNcBGv9LpUAyuk+XatTcZ74iEBEKs7+pQRvZ3R0L5VJdoz
 p6O5VBnMUpwJUDXU/1oi30xdrOmyYokXgU3KrRZFWl8B93sWX7Gdexp1ZhWk4Y/ftvvM
 2JtQ==
X-Gm-Message-State: AOJu0YxE5WXKjPCsbrN1WGwjQUz6dvOwTxGha9PSp+4euwNArPUBRhiA
 tCT6rkRNVdLn3HwmJgXb5jbMdP0wQEhun6+YQ53FVQ==
X-Received: by 2002:aa7:df84:0:b0:553:61c8:5e33 with SMTP id
 b4-20020aa7df84000000b0055361c85e33mr745559edy.52.1702910591776; Mon, 18 Dec
 2023 06:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20231214211527.1946302-1-nabihestefan@google.com>
 <20231214211527.1946302-12-nabihestefan@google.com>
In-Reply-To: <20231214211527.1946302-12-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 14:43:01 +0000
Message-ID: <CAFEAcA8H1-Sj34mdOQyoc_7Ut-e5DEKbX8MN4DSxZkxABDGDCQ@mail.gmail.com>
Subject: Re: [PATCH v8 11/11] tests/qtest: Adding PCS Module test to GMAC Qtest
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: F9IMlvc6wKsb

On Thu, 14 Dec 2023 at 21:15, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Nabih Estefan Diaz <nabihestefan@google.com>
>
>  - Add PCS Register check to npcm_gmac-test
>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---



> @@ -129,7 +198,12 @@ static void test_init(gconstpointer test_data)
>  #define CHECK_REG32(regno, value) \
>      do { \
>          g_assert_cmphex(gmac_read(qts, mod, (regno)), ==, (value)); \
> -    } while (0)
> +    } while (0) ;
> +
> +#define CHECK_REG_PCS(regno, value) \
> +    do { \
> +        g_assert_cmphex(pcs_read(qts, mod, (regno)), ==, (value)); \
> +    } while (0) ;

The standard way to write this kind of do {...} while (0)
macro does not have a ';' at the end of the definition.
That's the whole point of the idiom -- it means the macro
expands to a single C statement, so it does the right thing
if you write
  if CHECK_REG_PCS(x,y)
      goto foo;
without braces. You got this right with CHECK_REG32(), but
then this patch (a) incorrectly adds the extra ';' to it
and (b) has a ';' after the new macro.


>      CHECK_REG32(NPCM_DMA_BUS_MODE, 0x00020100);
>      CHECK_REG32(NPCM_DMA_XMT_POLL_DEMAND, 0);
> @@ -180,6 +254,64 @@ static void test_init(gconstpointer test_data)
>      CHECK_REG32(NPCM_GMAC_PTP_TAR, 0);
>      CHECK_REG32(NPCM_GMAC_PTP_TTSR, 0);
>
> +    /* TODO Add registers PCS */
> +    if (mod->base_addr == 0xf0802000) {
> +        CHECK_REG_PCS(NPCM_PCS_SR_CTL_ID1, 0x699e)
> +        CHECK_REG_PCS(NPCM_PCS_SR_CTL_ID2, 0)

These should all have a trailing ';' like the CHECK_REG32()
invocations. This makes them look like function calls
syntax-wise, which is nice for things like editor code
indentation.

thanks
-- PMM
