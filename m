Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4004349lfa;
        Mon, 19 Oct 2020 09:11:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6x2aBwQPMpfYubKu9C5F33xDfPptOMOthLE8/4lCxPg32wxGURkq4eSbFJRkY4FYY2Hjq
X-Received: by 2002:a25:20d4:: with SMTP id g203mr601726ybg.374.1603123888954;
        Mon, 19 Oct 2020 09:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603123888; cv=none;
        d=google.com; s=arc-20160816;
        b=TNgVC9t9/KEeT1A4x2qhvb+pTG82KcSymRz1bX+VJ2Svh8bkwSIA68C+DWxGOjfht6
         qJvcYRwp7hcErjwsg6yFPu314UB/5mXdU0jSU/2w/Pr0n3iCC6R9F2U/7qu9cVvbIgUT
         LA3zfan5z7mAdM6sEISSJC15PyEPSiLidThTSctGeW73JsMXbNQ9S4qBUHS05gCIfIrs
         Tw/8qYEYcczROSDeOuWIc7lo86P/4FsFj/bx0cOSJNVqPN2/ftb68dMSnc3oNOfIFoMy
         dKmJBK7ilUa/9O2cKnbw4gAdY2R69N0+xftU8j8jyw/CSl9IyYcfLaJhbWPI99Bj59Sf
         QpOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ktXfc0M6AXq8Oo1fufQofEfLrkP7OroL2DgAT7LcHV4=;
        b=b8ujfCd8/zpB9j4FQc93RGmJQFPJ6qevNmGOzJar8Daa6j3v5N8d9bx8n3y4nYxsIT
         RrL0RJvcE1JEuaopVyh+VnHS9T//XOMz8sDxSj+cM+HiiT+KXFI1dssHXjPGVKZqezHW
         JcIW1zn1HX7uJEr/i/IoFlLWqXOu1SfLP6lvTxIVUn+q4ymXG4IdfRDKZ1oH4k9qDVgi
         3SaNTMF7CMhCA10NTgTsx2XusFQuC5l4ZKo7uD8CXakfFXZJg3oNpa08NVus+777ESVy
         9STRAHRZJA92A1zAFpDXo3uSN14HCavPQxLLaECZOOv28ZKi04rWjv7oLrBs8Ck4Z79K
         nySg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gaxKbqXC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si332032ybf.216.2020.10.19.09.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 09:11:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gaxKbqXC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUXku-00018e-BW
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 12:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUXaZ-0007Ft-8F
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 12:00:48 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:46994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUXaX-0000uC-J3
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 12:00:46 -0400
Received: by mail-pg1-x544.google.com with SMTP id q21so189291pgi.13
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ktXfc0M6AXq8Oo1fufQofEfLrkP7OroL2DgAT7LcHV4=;
 b=gaxKbqXCJW1mw3gDPnCKTc7tv1dUW9f/fD/v25O0MEl37CR7Dz5IrA4gVBtrdo7Szk
 IvaN3kH5xRWu34UWwq0Pa1HA8zSFYuuawQWRoLXPYF6WoVFK0VcnDUchAKIlGs4EmgTI
 bGAAMJRwfvvGy8Nk2I4uinlxRvLMhiu5+nSyhKlAAf02++3MJzE2gi/2MOKE0Cg7CH16
 N5WNeu3w12I/nJ4nTXHXKEv/Q50F2+2YGU2kHJNPHYUW2/kWQbKe657hM/UtFqVSswn7
 i9Z+LrCc/5BB3u9r/Z40jef7Di9m02Ij8nXb5TILyflNRt+t5zcXqlcj6hwzpqbAojoH
 wWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ktXfc0M6AXq8Oo1fufQofEfLrkP7OroL2DgAT7LcHV4=;
 b=YvMrZKUCfNJnSztZlvIzg2RpZ5yjTxOlbicSpIF/WLklnweFNzh+oZCQZDL4U+MYHb
 fHqbrJ71BYHCvA730mMgUtsExcbVGMA2YOyU3H/kIaFBHv9ROJeANlFomSa2xPhfVT6m
 J1K78IWOgHwGKejaw/HK2zPUAy5uUhSiYPcpuIolvU56e46A4dkcSVZUUZA4tHKSHXJq
 u0BAdK98NgqNh1agrLUFDI2JeadjCrhNWguD2ld6MKi598flvnkkn0B318aGAXa0VvPt
 G+SARNfFAEuFS1w8SROuCTNpcXxeB2uJUf3Xm6kbGRdhvuRgL46FkwmePIwpjSf204yX
 IU9w==
X-Gm-Message-State: AOAM533Lbsr2EDdVsspfg8Z6J9ZnfTp4y3ocw+yHvzVNFnfG02PfDWIM
 +nJ8aPG1r5F85BGybzAK6Lmong==
X-Received: by 2002:aa7:9811:0:b029:15d:2c0e:e947 with SMTP id
 e17-20020aa798110000b029015d2c0ee947mr252949pfl.76.1603123242529; 
 Mon, 19 Oct 2020 09:00:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id ng7sm21534pjb.14.2020.10.19.09.00.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 09:00:41 -0700 (PDT)
Subject: Re: [PATCH v2 10/10] target/arm: Implement FPSCR.LTPSIZE for
 M-profile LOB extension
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201019151301.2046-1-peter.maydell@linaro.org>
 <20201019151301.2046-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <699b310b-8164-1c20-e858-ffa4d838318d@linaro.org>
Date: Mon, 19 Oct 2020 09:00:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019151301.2046-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GHP0APucKsm5

On 10/19/20 8:13 AM, Peter Maydell wrote:
> If the M-profile low-overhead-branch extension is implemented, FPSCR
> bits [18:16] are a new field LTPSIZE.  If MVE is not implemented
> (currently always true for us) then this field always reads as 4 and
> ignores writes.
> 
> These bits used to be the vector-length field for the old
> short-vector extension, so we need to take care that they are not
> misinterpreted as setting vec_len. We do this with a rearrangement
> of the vfp_set_fpscr() code that deals with vec_len, vec_stride
> and also the QC bit; this obviates the need for the M-profile
> only masking step that we used to have at the start of the function.
> 
> We provide a new field in CPUState for LTPSIZE, even though this
> will always be 4, in preparation for MVE, so we don't have to
> come back later and split it out of the vfp.xregs[FPSCR] value.
> (This state struct field will be saved and restored as part of
> the FPSCR value via the vmstate_fpscr in machine.c.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h        | 1 +
>  target/arm/cpu.c        | 9 +++++++++
>  target/arm/vfp_helper.c | 6 ++++++
>  3 files changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

