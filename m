Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp5356146lft;
        Thu, 7 Jul 2022 02:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZ3u0bDXhc6/wtCyuv8PQiT/8NHdueuKhxIJkmTDCJIPjPt7mmZXDH82YZiy/s2QkXAmDw
X-Received: by 2002:a05:622a:1ba5:b0:317:c65b:3ad1 with SMTP id bp37-20020a05622a1ba500b00317c65b3ad1mr36393670qtb.117.1657187621419;
        Thu, 07 Jul 2022 02:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657187621; cv=none;
        d=google.com; s=arc-20160816;
        b=kf44y75qxcS+nKXNjrOnfBEwWt1nvdVZKT0OlCT9HWyfSrgJEgJnTDvQPp1w0r8Icj
         VwKb4OpKtX5yAroq7AP1tkEbJk1oxy8G3aO8FvvSfnnSRIsw6nn4Ey0xrxoyExKVDb4D
         UKJZ5X+nHhXChvYAauRAGrqOKNr9snJp6QGtB43El9LPMfI7PdPI+v+OHA1S8WhGEfgy
         rWGi340/qjKg39heXbBoXppiqBKOza6YVpoMZBVPxllhQPAUgGl+G9+mmW362VJ/ICQy
         QyY/frk30xudCkdND0ZYVz/9uPiAFx+LHxua/RsmF4JFMD5X8Fc8gV4X2JR4gc70Erff
         e2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Y8C7guAptAfdK4tEL5pY1utId5SIjk80x5nLUW97Isg=;
        b=H9+jEHqGPjsDXbcOtexYbmWVu4YljXFEPF9AxRCQOZU/MlNuAfDNDmuKTkKwiJgNWS
         xzKLOiIxWw4bWJuP79EZLrTHzytsV2Iqe8ill6FMowleW59Yzj+easDqidAZStxNXkyW
         eyf9w2X+Tx3IxYLfG7/r8lBw2xpayEAHClWqjIFyYtYsk3zzYZry4dwwElm7oAg7LIdT
         mpEaQMMf4KZW9wgrB3XRcaJqSOpB5mEbQ2HB/MOnIiTKlyPELNO9HZYb40hnhSyOiJpM
         CyvXg82SU8Bj8DfyNOv53etA7b1d1rmiLfQiJW5+juav78DSc879MLashCD8RHY7K7hv
         vyYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a9D574sC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8-20020a05620a44c800b006b1ef35cad1si19037751qkp.289.2022.07.07.02.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jul 2022 02:53:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a9D574sC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9OCa-0002Z5-Cm
	for alex.bennee@linaro.org; Thu, 07 Jul 2022 05:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9OCJ-0002XE-8Q
 for qemu-arm@nongnu.org; Thu, 07 Jul 2022 05:53:23 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:43648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9OCH-0003gp-MC
 for qemu-arm@nongnu.org; Thu, 07 Jul 2022 05:53:22 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-3137316bb69so164509937b3.10
 for <qemu-arm@nongnu.org>; Thu, 07 Jul 2022 02:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y8C7guAptAfdK4tEL5pY1utId5SIjk80x5nLUW97Isg=;
 b=a9D574sCn28R6/Jjwld276XPPUxdmIJkQBc2O8zzdRGvVtczw/zGaMUba3A9pCcngt
 kE1SE0hTcuves3PXmW7d7QWH05YoG3GdsxOUmg3TTnn1K/VlZDahRGubB+K0NDk49g2Q
 z3prEdWNMmWmbIeQ0uNNNQGTEA527yhuay8/JXKJB3Bu4crHWSEcB4vMeXeNEt9ZYwDP
 9QQzUcYl6Rr81A9US1ZRTvjFmyue9IWhE2dzfdcuP9olKX87Ls72tUV5tUF0idgsmM0Z
 dHp5vj/6kjyhfKuT1yixDzCbVuPA3L/GHGQvd49mdBelDXW07oT/A1u/Hvpu96nfls+i
 ND7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y8C7guAptAfdK4tEL5pY1utId5SIjk80x5nLUW97Isg=;
 b=T8Llj//ua2QAEEO6AswFDHwLErgrOJFr37za5lkXqYKdg+pheXnUGFEvmKteugbKXD
 sQQ+hzaFHzAGWz4WXKVxOk0TH6SOQX4M1ES+nx/UMCIm+j07N0/odrTkDNPVQ+UYqxuh
 lUAFZipLY+VFO6Jdhm2nL8bSbTVLHsHMiz1IJ8kPRtiygThxk/WRxtxePvlkBAc9xV1q
 wfXI31CGQFXirbmCV7h39rWGsBTvj90gXW24fqLHlp8q1DUXhX9SlsBC57E+UcfmF88v
 jrzMSFEXw3kP6xAX8bpTJAYxqaJUtU8p8YLCjZHflEEA8SiVUmav2xB+2ohHdBPYdSWx
 mt6Q==
X-Gm-Message-State: AJIora/SVeT6U00pqK7g1zRJCTqU/1FnePm4r8OuKjHk0eZSYI1uOHYR
 P5rGKUWRvlIQIAaOlIgIw6ujxJXFwpnUjv+4TDH1iQ==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr51833722ywb.257.1657187600699; Thu, 07
 Jul 2022 02:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2022 10:52:42 +0100
Message-ID: <CAFEAcA9nfCaH4hYjdQqWMDMYc59SXAdNdMZ=WhfzZCVQZgu1ug@mail.gmail.com>
Subject: Re: [PATCH v5 00/45] target/arm: Scalable Matrix Extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
X-TUID: SIeCWp1ruXEW

On Wed, 6 Jul 2022 at 09:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v5:
>   * Use macros for vertical tile slice addressing.
>   * Other misc adjustments per review.
>
> Patches without r-b:
>   03-target-arm-Trap-non-streaming-usage-when-Streamin.patch
>   07-target-arm-Mark-PMULL-FMMLA-as-non-streaming.patch
>   19-target-arm-Implement-SME-MOVA.patch
>   20-target-arm-Implement-SME-LD1-ST1.patch
>   23-target-arm-Implement-SME-ADDHA-ADDVA.patch
>   24-target-arm-Implement-FMOPA-FMOPS-non-widening.patch
>   25-target-arm-Implement-BFMOPA-BFMOPS.patch
>   26-target-arm-Implement-FMOPA-FMOPS-widening.patch
>   35-linux-user-aarch64-Add-SM-bit-to-SVE-signal-conte.patch
>   37-linux-user-aarch64-Do-not-allow-duplicate-or-shor.patch

Now all reviewed. There were just enough fixes needed that
I don't quite feel comfortable doing them at my end, so if you
could roll a v6 I think that would be better.

thanks
-- PMM
