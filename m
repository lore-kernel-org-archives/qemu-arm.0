Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp347327ocg;
        Fri, 7 Oct 2022 03:24:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7twTJwD4OvdJztj2AC6Bg6t3Jtg8XWQhhCFHPiQXkH+0y6T04AF11l7fh1H09VOy7YZxJY
X-Received: by 2002:a05:620a:2208:b0:6e7:f5b5:b9f with SMTP id m8-20020a05620a220800b006e7f5b50b9fmr1891861qkh.295.1665138268050;
        Fri, 07 Oct 2022 03:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665138268; cv=none;
        d=google.com; s=arc-20160816;
        b=0nWY9wJTdClWLjdLV90f6P0h8i2GjWP8f73S+eUocnaQ4uKFWqBeadbBMjxgaoWZZ2
         cOi46UKp03cxDh5tugSVGwwNSGuu/dsgb/Qtm3VrxRXrqahOBedA9jWHftuwYKWDH8oU
         R7z72q4pX+1ZFaDh/d3oOO8MfzGCoMFHuSXWyS9ckT1bhrz5n+ECFdOdqR7HnaGGuniZ
         3rMKiA5bOKnUKYvPeT5vDqPixrWoXBzAxXp4TD+Uz+oGBJSxb+8/ICnnDvOvEqS9rndm
         JhsMkW0gQVJMZN3A/egU8YALcVlK54DI4pLoDgYVBXq6QKh71MNK0r2m1J8QTNV4dwe7
         Cmvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3DbUMGitbMy6esaYizF14zFSnk0Tfx9h+t4pbVOaOF0=;
        b=FmqL6hCcPnPlfBXnRLrOT0Za59/n+x8RBX0K/UCtsXlARbE0AEala+nXiO0+m+LmRA
         ilvPvLBc/9GbKL2Y1Y1pc5MXQfnerOBmXojmtnKSc6v5cY+w6A9Xwm1SNzyoR/Rv/dcm
         0h0YT/CRsB4zdhiSFK4Iq6ikvK9oD7TFJcgDOGfn3Ckkqrk2Cal7Kyetp8EWtaQdoRcH
         2YQjvUa61rwBkv/HhFDw1cRwCDmPnrgPuDCNZKHAiIYyy/jeKbsNU28sLK4j1j+hehb2
         59XfiZUj8nAAi7CgiVipuKA3TLYTm13mtJCB02sceAf8wzXMn5qzqpWaqBkX+OTBLr9C
         DG0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uMkzFr5b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq15-20020a056214258f00b004aaa28c1e62si671320qvb.403.2022.10.07.03.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 03:24:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uMkzFr5b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogkWp-00086w-Lo
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 06:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkT5-00061L-1B
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 06:20:38 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkT3-0007LM-DY
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 06:20:34 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 i7-20020a17090a65c700b0020ad9666a86so6863903pjs.0
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3DbUMGitbMy6esaYizF14zFSnk0Tfx9h+t4pbVOaOF0=;
 b=uMkzFr5bvFVKqAEc7xmvruT8m+DXzWyaoYDZI9eNReYCqIkoWGCJRAu78fXTvL0lFc
 huWTIbQI5L9I80lEn9rQknmU8V4uqP9GiKuDF2Pyw6m2gqchvGLKC4X3dycXf7p/N9qB
 v9AjJT8VE7tZaRp9HKRIVVHRwA81pHxx4U/z/DbwbwHD90yVzUPjgdD0n/UVhR626cNa
 GX081ses53fny6k/fieABJcU1T4VigCQb4mr9VI++b1NG+WDQjxbeLiRLhPWTW3lkydk
 +1TafL/05OWR9Z5pnBUxA1uVuyYllWKKnQbLgynHqgGZ3OeSeX9ToGc79uAilS09uJbT
 HDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3DbUMGitbMy6esaYizF14zFSnk0Tfx9h+t4pbVOaOF0=;
 b=ow3jo2BNDAHBySzQtx4xEmL8MDz5lXecfVVEh/tg3RNicuwDyRXIjx8cXDvVD3ACeY
 CiIO079slbqpxNBDB/n8KWHlza3iCWCTAbgiYMj9S3/n3hjxHIJ8hzMs5UTmiwQQsx3c
 DfeitH+eti0jmiFQfqobgrae+BekwODB593PmKSU7z1ZZ6yEHPu/PxQMDlrDfA9HmQfe
 L6XokQuh6R6y8d/hhObDAZq4csWgK45IBUeY/9eyPk4afgtOe+WWYqNPfWWTE+3BXWJo
 XKWIglJcErPovv3oIwhZyRHgTuhnuK7FLQJ3xAgWtFUrYgoIXZTeqaMTrepyXz5eDIsJ
 d5Gw==
X-Gm-Message-State: ACrzQf3eeKD/MhFxe+y0uCeyExjXAsc7BcGcnI5o5V0c1CCz53Qj1oP5
 ERbUUkhKo8o2+SXlj+e7w/mXIBlaJiW8E1Thn1Z01w==
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr4581331pjb.19.1665138030662; Fri, 07
 Oct 2022 03:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-38-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 11:20:18 +0100
Message-ID: <CAFEAcA-nbiL3tbNckVuZ0yukJ3kq+-BBbh9ZSwL70Jvqm2fdNw@mail.gmail.com>
Subject: Re: [PATCH v3 37/42] target/arm: Remove loop from get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Ygw3Af+eLIm

On Sat, 1 Oct 2022 at 18:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The unconditional loop was used both to iterate over levels
> and to control parsing of attributes.  Use an explicit goto
> in both cases.
>
> While this appears less clean for iterating over levels, we
> will need to jump back into the middle of this loop for
> atomic updates, which is even uglier.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 176 +++++++++++++++++++++++------------------------
>  1 file changed, 88 insertions(+), 88 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
