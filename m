Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E32C54F4D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 16:22:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wokYv-00015R-UO; Tue, 28 Jul 2026 12:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wokYt-000146-Rh
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:21:47 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wokYq-0002bh-TH
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 12:21:46 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-6680ae2031fso3908592d50.3
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 09:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785255704; cv=none;
 d=google.com; s=arc-20260327;
 b=EHYvzuBF+PYwEkzhuW0XqMQurZ43KECQ7LVgdrWqr7pshln2uUwd1WOR3iK5qY8ejI
 hscXFtbaNajmo4zjYzYWpLe3yqyijqEX8brdKeAEDP6UHP2Gj/+yZAZRygddeGPJn6d7
 ZS5SwmPpfEi8WOryOz5Zw9BqUbhz0nPuRsetlhnQbZGsESWC+kmQ9VTVZ5XjuCh19rny
 DjaKVBGCMMgVEHkk3buCO1i3bKKNVVeR12Nga/CwbBIsq4sSJi4TGlCc1bmfsRG6UJ9T
 jInR9abFoGc8xePM1LreR1fvt7zaDmCT3X+ZM4KqEFbbZP5crdFnVq5kkwBQTxMN5eW8
 iNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Aqd1xv0JpXnuqL6Y1foBBz5WTXkBaepovOrceKkx33s=;
 fh=Yok1UWOkU1hOxymmjRDQ6cJMwXA7f3mH0Kfm+7oOenU=;
 b=PCVJUbN+unsxUecVnTKMQO9HaE1JUNqFRG0d6pUEupn3dQlvU9A9hpXhmC8hkYhJK1
 gbi/ZpVIRRzzaTaNX6stFBxCVZFoQF8f4KT6XDJIGp9UQQ2idxcpiwxcd/XqTisEe6eb
 ZDgPfCX7MYGL/VnDU9h57Fo7el+q22MxWxh51zy25a153sjuSOK+byTWSJ1uhMNyG6dN
 KFECJBumcl4gfkt3Zs3rYkwosWa0fnYjdQK1B8ZlGgmS5FWAM7rkp5ZeutldWykol5/i
 8F0HY5BDyw75h3OoKghr5TjZNdCT6cIQ7aOASw47CWf6/gVefg3c4DXDvyCILyC/GQwH
 2N6A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785255704; x=1785860504; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Aqd1xv0JpXnuqL6Y1foBBz5WTXkBaepovOrceKkx33s=;
 b=qN3p2BQGUArl4TBkdIu6SYWwsB3fgGimExJO5nFKbfnUl3okMQKc8RW7l0tKLIUh0S
 6Ad29kBqB5ugnQPHuVk68kPMhoDvagsuLFwnaw3wlDxH3CGeN161PJZuaucYk4NRAQ4Z
 ebyovxjdNmmca6k5ey2abaV6Xs39B2FYulIq5NKQMY+hqxpypnupGIx502km4O0fs0mm
 MjlxV1XGNXE8G/uVDO/2mcOn/f2zu9G318YEHY9fyRrQm50gl3mz7vXcfuDoZSEYk+zR
 BH/WpmxzFAyoxQqkFW0W7vdcV5QcfJ8Wiq4VifZpUpKRDvYuJZK9W+xylygL9Glr/7Kv
 X9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785255704; x=1785860504;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Aqd1xv0JpXnuqL6Y1foBBz5WTXkBaepovOrceKkx33s=;
 b=GxC3Nh8bdFFnS3lVh5i7SfwZNEzO2I54OuPB2wDtCpQYdIz0gU593r22Ax+LMZJWO3
 bzm3kGLKI+t/h4S4+ModrKomc1QhiDe3nnY26g+k0650rORgk2DYPTyYMYTfAUcKhbOO
 iT5bO7WJPk489t8kRb5oTCuOwc5DtdEhJrOf3+1UkqindBG/Xla8SR9diqMXQtJ1PP3o
 i6xJ0Ixq1xO2L6N33K5F8hBcBMMbNaf4ddNIYoEn6auXDrEHQCDSn9osMW7VahHfumo5
 45bqeqsPpo5sSh2PO580HjdYGon7lDxDvVsAzpbz0y/RiEyfBuqqQiIZj/bf7VH2YEZH
 DRDA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoLVaaJ8Um+864WlXVmqOmr956iP/Ugehe1+pgTaF+R9MGyTCqrdqCsYPJW9IGKjaUVgFCDLDxn5w==@nongnu.org
X-Gm-Message-State: AOJu0YyOSmxjlsNkj1jvmATIQc7dwA1juK+FSu43aGs00B19PvqivnPo
 URbT6NsoaxMsLFW26D+xIIdNfpWj35lFH2Cr5QOifpFK1LpuUVJvkVzw6cjcWegJ/TYG+X3W61g
 tKZW9xCl8Gww/2aIjNJlqbhumg04EdoJFjzhAtnOjRQ==
X-Gm-Gg: AR+sD13Jwkw+pwNZ0blfOZgzwpZ1OfxCU/xPWEBInbxcUAC0V5buiczBkPrvAaTlxHf
 r8ckrBpAP9clNTBO9WsKNyJIP+2M8QrqNMT99IZskgTdkdLzumZWSaXoIPGewhMGTa4nLtk+AfO
 7IjEQzN2vV1eBkZAnlJkNdDP4NoVgK0RJd7qAnrdBz7Al5ifDdbrM0bUe1ITiwHxpUxHnciW7bR
 UctEEE78dtjAJQJBnygZc6wm6Mga7vJr1hixcdo2Px5Whsr3PMsxOedASE84Djs6A54Wi4qVKWm
 HGval9Hiec0dlpbBcrtAhCr1Nv+0pRobqMg1yfysUUsAPeS5HT6ze93w
X-Received: by 2002:a05:690e:1348:b0:667:89c0:71b1 with SMTP id
 956f58d0204a3-6690d157f04mr626466d50.31.1785255703765; Tue, 28 Jul 2026
 09:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-18-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 17:21:32 +0100
X-Gm-Features: AUfX_mz3qjdLeaP64rgE-JM-WVOvdXjDaJ9OsQz-YmYAJJFs0eMEyCKvhlruclM
Message-ID: <CAFEAcA_ZWK5BDPu2bUp2adoZXDcXa4mhh0qJGD2Gxikf0786cA@mail.gmail.com>
Subject: Re: [PATCH 17/20] target/arm: Implement AESEMC
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, 21 Jul 2026 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> +void HELPER(crypto_aesemc)(void *vd, void *vn, void *vm, uint32_t desc)
> +{
> +    intptr_t opr_sz = simd_oprsz(desc);
> +    intptr_t idx = simd_data(desc);
> +    void *vm_idx = vm + idx * 16;
> +    intptr_t s = opr_sz - 16;
> +
> +    do {
> +        intptr_t base = ROUND_DOWN(s, 4 * 16);
> +        AESState rk = *(AESState *)(vm_idx + base);
> +        do {
> +            AESState *ad = (AESState *)(vd + s);
> +            AESState *st = (AESState *)(vn + s);
> +            AESState t;
> +
> +            /* Like above: Arm AK comes first; api AK comes last */
> +            if (HOST_BIG_ENDIAN) {
> +                t.d[0] = st->d[1] ^ rk.d[1];
> +                t.d[1] = st->d[0] ^ rk.d[0];
> +                aesenc_SB_SR_MC_AK(&t, &t, &aes_zero, false);
> +                ad->d[0] = t.d[1];
> +                ad->d[1] = t.d[0];
> +            } else {
> +                t.v = st->v ^ rk.v;
> +                aesenc_SB_SR_MC_AK(ad, &t, &aes_zero, false);

I did wonder why the Arm ARM describes this as "AddRoundKey(), ShiftRows(),
SubBytes(), and MixColumns()" whereas our AES functions do SB, SR, MC, AK,
but the answer seems to be that SB and SR can be done in either order
and you still get the same answer. (And the ordering of AK is as per the
comments here).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

