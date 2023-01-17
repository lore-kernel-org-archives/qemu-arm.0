Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2480604ejc;
        Tue, 17 Jan 2023 07:38:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvte9TW2syYR0V7ZLKan949DFe1dKw6VUmKKFM1KsXP1zXJ0GyElhWOQG4vxO0ufUtY7Oy0
X-Received: by 2002:a05:6214:418e:b0:534:ec18:6e3c with SMTP id ld14-20020a056214418e00b00534ec186e3cmr5457798qvb.12.1673969936260;
        Tue, 17 Jan 2023 07:38:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673969936; cv=none;
        d=google.com; s=arc-20160816;
        b=i/6g+rqvODOTPWl9Vw16SCdRm74OL93WFGL2lvGYGnSh/1f+s9XNx3HxeFLSt/vP5q
         MTOt6JRJaJSI03IZAmWQPyY3Nx20lIABl+CWc4nEoYGX56K7tSKjDz+QHaGkWTRfDBtB
         qMPAJDBnH28/nkgkbqbSZDQTGaN2QmFIpEPdvtd3g7YkJLx9m5is9+CEWamzdjYgmcnU
         t5fts7g6vGb7iLsLV9ayX2IP/p1i77hW2PyxEvDDCE3+/jFPb+vkc1fxRViJpe2WmSET
         WjmM8Gzd2U+gvH1UYnCvqWKDtNSQioxQneUTdqWLg8p6w0NSBy18mcJE3UM56artRVI5
         qGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LPDGngE3HSAwjXUkGplEfrMuZMyJyu3kza/bCR7HC0Y=;
        b=jFkX8zu6C9GVCj3/bNBAEk1k/aR7xO3B+dah1lT/DoPOyZEnkKCkEHmRNjjm4NWVJR
         4w5+foV/TyBT0qrcqwtPsYa4jZO0KC8QJO6wapCvcsgXGLyi+QodyclbslQU0BusvRD9
         K6npsl5D/faBFaWHZGztkG/zYF46DsZ0IOY65BjYc8GpgHPO5Z59s9Hhrp0XLgvTSsSV
         plZA2x/xVfqkOcp2A86/eDrdWcJbqj57Ue9iE19f2BDE6Ww+vFVtCnnpPa+roOGx0hbQ
         oE2mTWn0b2GoBgC1kzz723Clz6PzWdkhoEqOAII+03cH35KX/9aU0nqzhv5pgdHk6xKr
         b7Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SZ7WDqi6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jn8-20020ad45de8000000b00534f9174377si3339083qvb.219.2023.01.17.07.38.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 07:38:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SZ7WDqi6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHo2t-00042n-1c; Tue, 17 Jan 2023 10:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHo2r-00042D-Dq
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 10:38:41 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHo2p-0006MP-ES
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 10:38:40 -0500
Received: by mail-pf1-x432.google.com with SMTP id s3so21250456pfd.12
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 07:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LPDGngE3HSAwjXUkGplEfrMuZMyJyu3kza/bCR7HC0Y=;
 b=SZ7WDqi6825gBI+/qNQXFNmnzZdsJObJqdsynW7ZYCu4YJvfg2XEwHyJK4lM5m9kVO
 rxxm21CGQh73iqBhabq2UU2zrTm69gv6UD0imrSF//m+8PS3cQjqUx66l+x+KFbVXFcB
 ZsfDGxOy+ayqTV2FusyzFPXONUZPHW0yD/kDIx67Sn2VU5JCChYOCxoiYgkFx94zqeYF
 aykK7H5dduOn+KV6WxEgz6nMjWMPBCpR7orTv2Y0IVQp3r43lNYM5ornaKHxCDYJjKK+
 SLftXlzwqJ6tDdhqhJJz9mCVcZ3Fu9+zCoHc0n5+ru+Gc8slRKUT7CaBnyTy6w9i1tkX
 tDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LPDGngE3HSAwjXUkGplEfrMuZMyJyu3kza/bCR7HC0Y=;
 b=cZWrYCPrACpBSsf174+OuNXMwIMf7/x09/v3HjxAPNDTuV9HbskByfHCO+r0nh31vL
 ViJH4clgTjIF7rOwdzXXm/QacAQWm19JpOcZgcagL43rrL119PDUxSzv2IwqrLz0A19+
 02g21PGeePIjaPAijEIYjXGZNJXL/86LXDI7n809qfPC8/Zcn2mCs8AuwbZU8ZuT+oyR
 GrQlzrDfc67sPUkwqoCBzp5kd9MCzYTlVizCrNpRWYVFKnkvi3EUWGtnEOGuGK5wD2wm
 XFfRLigFJPiZjpUBGeA/r95T6f+ttO5DplqLcHTgZnRA0v2ZCaJsM/O1wnTROTtpNTIK
 SZLw==
X-Gm-Message-State: AFqh2kqMyk6ImpPLJ0C5wvB/UAiuYLsTjopzLn5nENQrxognIgCH6qdi
 IAS+nADjbcUtz+d2fAf7WcyTES2tK5ZEkkfJgfqrDg==
X-Received: by 2002:a63:510f:0:b0:477:86c1:640f with SMTP id
 f15-20020a63510f000000b0047786c1640fmr280895pgb.231.1673969917758; Tue, 17
 Jan 2023 07:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20230106172851.2430-1-eiakovlev@linux.microsoft.com>
 <20230106172851.2430-3-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230106172851.2430-3-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 15:38:26 +0000
Message-ID: <CAFEAcA_r=Aji3Dp_K7vcuQJ_D8Ynjxhv1KJZPU3KgLOhJL6imA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/char/pl011: check if UART is enabled before RX or
 TX operation
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Vbkjh0v+C36d

On Fri, 6 Jan 2023 at 17:29, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> UART should be enabled in general and have RX enabled specifically to be
> able to receive data from peripheral device. Same goes for transmitting
> data to peripheral device and a TXE flag.
>
> Check if UART CR register has EN and RXE or TXE bits enabled before
> trying to receive or transmit data.

I wonder if the real hardware lets you fill the TX fifo
when TXE or EN are clear (and then transmits it when
you enable tx later)? That seems kind of an odd corner
case to implement, though, and the TRM doesn't specifically
say one way or the other, so it doesn't seem worth the bother.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I notice this device doesn't have a reset method, incidentally,
which is probably something we should fix.

thanks
-- PMM
