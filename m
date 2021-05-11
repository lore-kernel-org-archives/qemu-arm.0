Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4132737lfg;
        Tue, 11 May 2021 09:12:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykXtfVqQcXBfZV4D+K7BtKShYFvjppza4ilsrnlD/2UDIHOk702f7i+bNuYjTCV1klbQsX
X-Received: by 2002:a5d:9343:: with SMTP id i3mr20005332ioo.77.1620749532211;
        Tue, 11 May 2021 09:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620749532; cv=none;
        d=google.com; s=arc-20160816;
        b=JOddScPuk8leq18/7vQvz0GyPR1ID1OZbAjsnOtIl9XKG9ZXaHq4sdZE4uapYCrfTJ
         1VtAweSCcWrCbxtVIRSOJNYJ40xbH7XzMgwzT+ryOEjqDapU6l6atBEqMXS5sjI7W2Pq
         aXqIx2Cvy2841ho7tA0wnU4xRepW6h0aieKAxQzIlSqI3ucfX6AwGzaSJWo57ihlfZ3j
         rJP5v6SW+DUmU3Nv49pHbB9yzCZsKA+9vozY/ieXPbfd02ebOHpnJkOO2T5gRLYQrAPj
         0W76Uf5TOK2L82FDIxCjn7gBBN1XfRveBd9TBiXS4rPARLzxHu3hreblleayw1iXLBvS
         zaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uVxjKm21Pd6EhfWtuoTBoJWysrzleiAeeZQGyzS0l9s=;
        b=whA8o2wYo+5AFdK3auRt+KAtQRxn02OLm1Dw74UU6K2aX9jGkcL8KA7YqyBGhxGfoO
         DzZz3X/f0F/YdMkEsf/duG/mTh/qW2KE72/mhjVjgQsoEQLmivf77u3ybCirkuT1sili
         o+/L7FUYmnkKpmJIRlZn0GBpFjqfWVZ7cbi9yNJufvxHm0DK9nWYjcg/bvXsTlWmE1WZ
         8D7zFuVcDXEo8Rj+VcPivKJNoaoOMrB+FDztUUlP76ZlK+8AV35Vb2lsbiMKBrg+LuO3
         M1AeB2b6Fy0y5+T7r/yV76ROgZTDadm2nC9xqK+e1aZ76/86Rbf+T/dVKvYC5Her1BfF
         QMzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D1TMXqJj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l21si6292548iow.25.2021.05.11.09.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 09:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D1TMXqJj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgUzT-0005yf-Gl
	for alex.bennee@linaro.org; Tue, 11 May 2021 12:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUo0-0006jO-3L
 for qemu-arm@nongnu.org; Tue, 11 May 2021 12:00:21 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:35391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgUny-0004A2-9q
 for qemu-arm@nongnu.org; Tue, 11 May 2021 12:00:19 -0400
Received: by mail-ej1-x62c.google.com with SMTP id m12so30560337eja.2
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uVxjKm21Pd6EhfWtuoTBoJWysrzleiAeeZQGyzS0l9s=;
 b=D1TMXqJjSJYHxhl+3sVmAbFOhNkDT97yCFI31qQKQcOKL8kdOnMblqve9wm6LFVIkr
 UGFFRIMji0aBNGI0HmwC4p2vrPIHfB72P97qqfkvw/aOCU3hsc3XU6PSfyXtABxpqqSm
 siPMZbTrcSlW5QySvKKf0KQAAx8AxU3Miym1R7C9K+eUPsMJ6r42vmJK1t2F/dmj0/DJ
 TenyDelguI6wBDQqeInoRDYEWcTX0hxXFO2O01N4zdKWMhJy0IntXtVkengKtDtvl4gE
 HwjT3/vY5tPc6qKUa3/bHRuyoww3R89BRss5x0nclQqpeuiV5wh3hRLvtD8Zv3e3Xv0w
 F/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uVxjKm21Pd6EhfWtuoTBoJWysrzleiAeeZQGyzS0l9s=;
 b=VH9vJTUMnFZNkphRDQpNL9ZiUxMqfnEWlJdNgvREKe80Kyi/hrES77eZRexaCkDAY/
 fjAZNnR6SEd3cp0Hyl/1H4HAds3VNszJcUEmjGoOMmiCnggsUCDgH0StJ1yjabz4jc62
 C/MaSmbI/Zl5TE9WgKNBbAowtYonp4f8izm2xq9EtuecvrtK8mjunHA/fRhzXiYaQQfz
 00xfgIFA8wzmiqBItyxxKXxxIgvyY6yTuNrDL5Vrz/X8LDoePvtmsz6BV87PvgX911Ps
 /cbt4zi9fqoW12eAY+Zn6zLcu/JXQ9A1FR7MGlXpRdeFPWNVR4He/uhhfXNjptBl4bki
 l/TQ==
X-Gm-Message-State: AOAM532D2+l2nwoMdcI3WVV/aHQt/UBFHDSehXK2G0wpeYLF6+qBR+Ga
 z0WR5qiWjBndYOzazZuXPhB+IW+w3kZrhf1GIGuJcg==
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr3105270ejb.482.1620748815997; 
 Tue, 11 May 2021 09:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-24-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 16:59:03 +0100
Message-ID: <CAFEAcA_ZpS65=Z=TW8OMCJX9rK4gN4yDERmHUe=1g1ROtYgrvw@mail.gmail.com>
Subject: Re: [PATCH v6 23/82] target/arm: Implement SVE2 integer absolute
 difference and accumulate
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5btuNpM7cU+i

On Fri, 30 Apr 2021 at 21:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      |  6 ++++++
>  target/arm/translate-sve.c | 21 +++++++++++++++++++++
>  2 files changed, 27 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
