Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2451013ejb;
        Mon, 20 Feb 2023 08:59:08 -0800 (PST)
X-Google-Smtp-Source: AK7set9ylYYzcu5TsGDeCtNYTMshv3eRCRGaj8RK91rKuWZL3rCi340FPAtN2MM5gq6RBnZI9qnO
X-Received: by 2002:a05:622a:18e:b0:3b9:b5c5:ebb1 with SMTP id s14-20020a05622a018e00b003b9b5c5ebb1mr17931746qtw.9.1676912348455;
        Mon, 20 Feb 2023 08:59:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676912348; cv=none;
        d=google.com; s=arc-20160816;
        b=wh4f5Ov8iblftmG/bFVkl7jHDhkGsAxL3t4S1EBbPqhZydLw477TwC7N3yO1aJbRgz
         9/mIVBL68XlXeeqtcrY29j28S/XusJQzAp3ijil2BaEODEnuf8GeLZnmSjSeANeiqxb9
         Jgx0ibsiSnPtXumzA/e4KrWFnm62usrmi9MRLGkpQ9KDjel0qeHu3C7I7LH50UEfSWxN
         YODoMEiuIdw1PHvuJ9AQR6nNSI2EGyc7qn6cBnPUcsrgbwWL3+9PeBqZSMFnsgvACB7S
         LpMT5XDvbIzzPJeA3AXn3YJFzjrWjKBGpBmdUwEGBbCOtEEG6wAl8/xXYTsvz+tWh67f
         gnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Yw7yk4bq95+8Xpq8ilMOh/TRO5rAzDj8Q27tmA3X2uk=;
        b=u78Gs89iTgGEXS14SsASVti8KA7LAJY+hoETbMSGlpikPaN/7aB4sqIC92MoymQxao
         9K7bPHMrSDq+gEeRipzxRzIazXEF4Drhjt12D5ivZao8kSI2rRRCWRc4NDI3vDqhKubb
         BbZXz8KxjwZ6/LJcwD5soIktjk9NTzf8T/yQLvABHpX0jzvDpiQXpuncxdjgRxqQOKwV
         6odfpHev8OnfoBGwDboHVRTmH6/8Pd9LoVNYabtGPSGTsf9m0CKl7xwUIMlLxJZZUEuw
         a5rhTTT1daUvJEtlGlkO4pWc9GBlAfJnSrbTn1Ac5o4SS7CGO0CajHKKyQrNoxJHJVuY
         L6DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jW/ayeKB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020a05622a064600b003b9c000ea1asi9491381qtb.410.2023.02.20.08.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 08:59:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="jW/ayeKB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU9Ux-0007qZ-Sh; Mon, 20 Feb 2023 11:58:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9Uv-0007ps-WC
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:58:42 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9Uu-00014V-BQ
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:58:41 -0500
Received: by mail-pg1-x52b.google.com with SMTP id z10so894124pgr.8
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 08:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yw7yk4bq95+8Xpq8ilMOh/TRO5rAzDj8Q27tmA3X2uk=;
 b=jW/ayeKBThjB2ra2JNm/MdiQWp/SibNorVWAfshq5MlSkksNesaJvLyWn786Ma3uzi
 tYV0QAwPa7gcTU6qMQr7WJOrWaJrbrDO797wYIZART4cYfOa7BxNAg2zx38PesoEWLVT
 UPfa9CIPoxefuGf4wd0yrjA9DzjnkXoT21QeQiZpKg8a2Sc/1Tw+Yf6s5HRwe7x/O1Zz
 LI1aGqsSU4ijgQTr8eBUaoPpfDhME+tHETspAMWOsvyLFziGrZ47Y6wK/X6wCQBZJkOd
 zoF5le40vacE+FoZswyG3b10uQRd+5bE1bW+B8dW7HZCUH4o5tZHJtqUBWyA9IpjMNwo
 Nrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yw7yk4bq95+8Xpq8ilMOh/TRO5rAzDj8Q27tmA3X2uk=;
 b=GWuF8cEBuGhWxDtQPAvoOePzmdbg2iqjHEq6B6rnlIybpwnSvBgL/QkHxYMUSoVQHs
 3z8E6aV8p33u6NiZ67mMTrrA6O4IjwEUdy14CzcsytADgUpa+DS3/6KUms0XQah6mRT4
 btduVRxgjoV0n9rcwjrEFjjW0yTq1XHkuSorqD1fy8UdVpFY6b70PT67U/j0GcnfNKmL
 p6TiWMUAsOAJY5qIDqUZxNefbE2Utm0nTN0VaAOHXzvLyyvgDEY0+36ipvHX99R7HnkH
 +pLVItuWpUORDRiIm+g8qUMWzGoji54VsYbceFaM9/UPkEE5htDCixPIaJywHivOxotF
 VOwQ==
X-Gm-Message-State: AO0yUKXN+Wxw/OMPI8WlxNt/V5a4RynQum8R8umqM+w60x+tHDED6Zz6
 BFF8E0Ytf20LvV0dZFG3zPpPFA9fNvuUt1MZ9dAXzQ==
X-Received: by 2002:a05:6a00:2ea6:b0:5a8:af24:b152 with SMTP id
 fd38-20020a056a002ea600b005a8af24b152mr176736pfb.3.1676912317273; Mon, 20 Feb
 2023 08:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-12-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:58:26 +0000
Message-ID: <CAFEAcA8fpHHoCAD59F19_-=RF=CLJzuXv-oHovpDi=OFLQ3WtA@mail.gmail.com>
Subject: Re: [PATCH 11/14] target/arm: Implement gdbstub pauth extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Luis Machado <luis.machado@arm.com>,
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ki1bqfV+BpNv

On Tue, 14 Feb 2023 at 16:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The extension is primarily defined by the Linux kernel NT_ARM_PAC_MASK
> ptrace register set.
>
> The original gdb feature consists of two masks, data and code, which are
> used to mask out the authentication code within a pointer.  Following
> discussion with Luis Machado, add two more masks in order to support
> pointers within the high half of the address space (i.e. TTBR1 vs TTBR0).
>



> +int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
> +{
> +    switch (reg) {
> +    case 0: /* pauth_dmask */
> +    case 1: /* pauth_cmask */
> +    case 2: /* pauth_dmask_high */
> +    case 3: /* pauth_cmask_high */
> +        /*
> +         * Note that older versions of this feature only contained
> +         * pauth_{d,c}mask, for use with Linux user processes, and
> +         * thus exclusively in the low half of the address space.
> +         *
> +         * To support system mode, and to debug kernels, two new regs
> +         * were added to cover the high half of the address space.
> +         * For the purpose of pauth_ptr_mask, we can use any well-formed
> +         * address within the address space half -- here, 0 and -2.
> +         */
> +        return gdb_get_reg64(buf, pauth_ptr_mask(env, -(reg & 2), ~reg & 1));

This seems pretty confusing to me. Is there a clearer way
we could write this? Pulling out a

   bool is_data = !(reg & 1);

would help, for instance.

> +    default:
> +        return 0;
> +    }

thanks
-- PMM
