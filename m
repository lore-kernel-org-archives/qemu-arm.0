Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1811451lfm;
        Thu, 16 Apr 2020 06:26:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypLbeIBh0xjgrxMwbOfdgSXs0UsryfEyH9Epp9KChSww28c1vtMAfpMvc58EYj1mJxr19R6H
X-Received: by 2002:a37:9f47:: with SMTP id i68mr6317015qke.356.1587043614866;
        Thu, 16 Apr 2020 06:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587043614; cv=none;
        d=google.com; s=arc-20160816;
        b=sJE8HTTTzkwBl2uWwl2G1eE9Ak6r86JlZSnA0ZsD5VQZCaap70AUMxtXK61sck6fi3
         tYM3hH4Ezz/8UuH8yOIZitDrp/db7kbmvHTjPMfSSWC38vszQRwI6KvbSFP5gRcDKZp5
         uHshEBnH6/8bHS6gSyJFUZ6S0+m1Hw0WCp+oE05v4xRzR8glExVBLEFg3HsHgOH5XjiC
         sCF45q29RGS0TWx9uu4hPB8bB6UrBKxEvpqz83e6jFd0Fhq1lAK0bXqpJFspX7X3wVr5
         7ml6nwVjZsIFTUnzYkiM4y2+LO9AITP8TGlcyjxnxLrDaeywDnNQatgFz5Y+nsMmU0Yi
         xQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uFVmbDLrbvji1ltWxqDESnl+8YxWAHHZJL+vVC3Bh8A=;
        b=qV4c0lm5ymaeJ3naUZw5mwcIy2KMEUx9B2RYKAlOpvpzjWplrhuWaM1/ri0AUMneEl
         TV+IaxF3EWOu9VtnsezXV95ZS7ee/ZBUS4/RGLO6jUP3bn1spivmf65y/BNDu1/6JDg/
         img6vyXx0cQzz8NeWMCLDlFW+1vO7ZrVazVCVwlsTuxG8M14l0WI+2WSzYox852ewTs9
         2eiL3tq+QUQIuEnx66Tkal4S5a10RhYUzTaLePcKmzL7osCvB1i+A2KiwHwKhPwS5UZF
         LaiQrKSnGJFDuFgTMOQrUzBCIhO+OYdAcruAM+OQIn3oue6J9NalnuoSGHwFDiQwJHS7
         mnxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DsT3VuV6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h185si11493029qkf.226.2020.04.16.06.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 06:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DsT3VuV6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP4Xe-0007Xm-88
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 09:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP4XW-0007X7-6s
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 09:26:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP4XU-0006sL-PX
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 09:26:45 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41971)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP4XU-0006rj-KJ
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 09:26:44 -0400
Received: by mail-oi1-x244.google.com with SMTP id k9so16528729oia.8
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uFVmbDLrbvji1ltWxqDESnl+8YxWAHHZJL+vVC3Bh8A=;
 b=DsT3VuV61KgYhaZsitF77PoUPQhJMXIGtTMm4vRsLqu0MTqhtw0HGK/vrVdksNjlCV
 14Fd5XuPEcXWueaYIwFLr9LzWMdE0LQrYTG//5AbhmvLplyGfp1YuTBuH5gT6pxx8y8P
 o3gfMVh99V+Hr8T2TvGnRJYCSQdXNHBXggoXxcxAhfALUhcY868at54ngO2XEbrNokeI
 uB63oBqj4O/BLKAQ5tCqfs6JxG85W9HRDGcq4lLUVHJizyikVqIFdB+OamUFxeJIVetQ
 Zfb3XOEMgAIG7eAiALPLcpCBqIpahFxl+SyohS2X6YtYQDczXWSHcCyEClmX5IQXDcG1
 5L1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uFVmbDLrbvji1ltWxqDESnl+8YxWAHHZJL+vVC3Bh8A=;
 b=RzftgWNrtFdfUj9SCaE6/Lk2rVlv2ZkNd8FjLHOeFUp5O0WKoBw9552xNRYaYV9HjM
 ggFWPNMRNY3lkJrx/+lIML3duKGykH9n8DqQM7Znu7/7IqU4KufmP+uKoXtaRry0qpU5
 u7KFh1hkOvAoCaRY8AVGqk6namMrXs82eVa6J8SvsJTFXSaGXwkc1w+PPG+e/7qti4G6
 4o6fhvgx7eJoljPNkp5ZhqcmldtgjgvZxVXCTbgWbgMomi5I8YSTDxohYlNV1WpAUO/2
 ETs/hBA/MM3n/dCInSiVtT15d11aK9g9BC0Xu7cGyMzFjwBEbmF7413F9/Y7hsDgsY2c
 99Og==
X-Gm-Message-State: AGi0PubAH899mlB4IMyVYLax0BH3dKcjOVSf6ABkGuhvXM810ToZljPm
 oMJIYtL7ij+mkuSaYyQIOz5uBqIIjr8HHZOexbqScg==
X-Received: by 2002:aca:3a8a:: with SMTP id h132mr2714437oia.146.1587043603300; 
 Thu, 16 Apr 2020 06:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-9-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 14:26:32 +0100
Message-ID: <CAFEAcA-v9O6+iZu9_grS6iW=QhmJeLGVfnJ8BOe59KzaPMczzg@mail.gmail.com>
Subject: Re: [PATCH 08/16] target/arm: Use SVEContLdSt in sve_ld1_r
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-TUID: lyYfgeUIq86k

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> First use of the new helper functions, so we can remove the
> unused markup.  No longer need a scratch for user-only, as
> we completely probe the page set before reading; system mode
> still requires a scratch for MMIO.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +    /* The entire operation is in RAM, on valid pages. */
> +
> +    memset(vd, 0, reg_max);
> +    mem_off = info.mem_off_first[0];
> +    reg_off = info.reg_off_first[0];
> +    reg_last = info.reg_off_last[0];
> +    host = info.page[0].host;
> +
> +    while (reg_off <= reg_last) {
> +        uint64_t pg = vg[reg_off >> 6];
> +        do {
> +            if ((pg >> (reg_off & 63)) & 1) {
> +                host_fn(vd, reg_off, host + mem_off);
> +            }
> +            reg_off += 1 << esz;
> +            mem_off += 1 << msz;
> +        } while (reg_off <= reg_last && (reg_off & 63));
> +    }
> +
> +    /*
> +     * Use the slow path to manage the cross-page misalignment.
> +     * But we know this is RAM and cannot trap.
> +     */
> +    mem_off = info.mem_off_split;
> +    if (unlikely(mem_off >= 0)) {
> +        tlb_fn(env, vd, info.reg_off_split, addr + mem_off, retaddr);
> +    }
> +
> +    mem_off = info.mem_off_first[1];
> +    if (unlikely(mem_off >= 0)) {
> +        reg_off = info.reg_off_first[1];
> +        reg_last = info.reg_off_last[1];
> +        host = info.page[1].host;
> +
> +        do {
> +            uint64_t pg = vg[reg_off >> 6];
> +            do {
> +                if ((pg >> (reg_off & 63)) & 1) {
> +                    host_fn(vd, reg_off, host + mem_off);
> +                }
> +                reg_off += 1 << esz;
> +                mem_off += 1 << msz;
> +            } while (reg_off & 63);
> +        } while (reg_off <= reg_last);

Does this loop for the second page need to be phrased
differently than the loop for the first page was? I was
expecting the two chunks of code to be identical, and they
almost are, but not quite...

Either way
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
