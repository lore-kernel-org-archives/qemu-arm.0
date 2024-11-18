Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2620306njc;
        Mon, 18 Nov 2024 06:32:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWLOFx0ytNa4jIKrkovPgraeBftHrW1qxDsoSNIpLWJ16L6WICKrfKK6IsEmEwO0kWgCDuceWOuNDh1Aw==@linaro.org
X-Google-Smtp-Source: AGHT+IH1h+rQavX3+nGt9xbwU6Q/05QZ2NVTO8JcvcoYtlO0keCQZydKaEORwJ3XSpo6njGHXtLE
X-Received: by 2002:a05:620a:c46:b0:7a9:b739:3763 with SMTP id af79cd13be357-7b3622ce0bcmr1158238685a.28.1731940332714;
        Mon, 18 Nov 2024 06:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731940332; cv=none;
        d=google.com; s=arc-20240605;
        b=Z1bT31JevlTNgdNM5xqnEVvDevLN65xHLxDaia113vJAB8/5xiyDu94om0OpiwJsZC
         uhCGa9zK0VYKGA1Y/Gv18QixpgSt4LHc60KMItUS6KC0eUAzSnahc0i7cL8xIcCEyt2+
         nvm+mz64rMxcvOi0IP6F7Np1Ook7GdMyWaURDXCpQtwrkOo7SUvLqIpdVM3z4aHA/JjF
         TAEG6p29rBcXWigZtYdGUDulfhzBU4pToQLTYozJB/gRwdrDN9ZUCbtG3bjwZclC+szJ
         FnBpQqE5H3SGxeuCL7GSNAtJpQFFCdsySZnKpUjcfTa+BFCtHsrNJ4NM4eaRsj6QElJz
         rp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MhAdaVPB17968gemREtUHRV2S7Vpyh9Kc7ffCpxcGyQ=;
        fh=adDlGcu0xHQur9DKbGnup3yOLwrFV1y0o7L74W+8hbE=;
        b=cUWZkjfiFV/ZUs2Q68UIWGqWJQQFNby3sIYzoqIRGvv0T6NwPKb9xQyKJkDh0cxSmA
         6PeAFoRacWP8VDbYyTrf63u8rijc7jcYusry0n5vVL7s4gxkCkFUmoVW16PiUK7Ujz0R
         Tgx0seQUD2yRFuyJnqC/5TDoAhdvETOTnx4j8qvfsKYYlHsgpeGm6riS9KQX1CdA5Rhh
         GkU3Z2RrqNPhDKj6HwkSAZ+tPNXe1LtTz7IpMP/kwVp1VEpAD9fjBXTHmjjT7Ap9Mv4f
         NTASdJhQHGrjH+/xFqDwBgxUzb4GsfGt6R6SzBk/yk3lCYciPEY4Hei+1uYfw9wa87Jj
         t8ag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cRpeqoIf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35cae0d12si1050067085a.575.2024.11.18.06.32.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2024 06:32:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cRpeqoIf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tD2nL-00041T-SJ; Mon, 18 Nov 2024 09:32:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tD2nK-00040l-4r
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 09:32:02 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tD2nH-0004um-AI
 for qemu-arm@nongnu.org; Mon, 18 Nov 2024 09:32:01 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9e71401844so406221566b.3
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2024 06:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731940317; x=1732545117; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MhAdaVPB17968gemREtUHRV2S7Vpyh9Kc7ffCpxcGyQ=;
 b=cRpeqoIfd0/9oH0toF4cofY3RqMlm2BZq6vq3iLIg9HvPnk3mdTJVqELgVlRZW1Xwb
 4mgBPQ1+SgMLuzLb6KrOX9SZClX55U4yS4/cRzWb23hn6igrN+5WsWClHIGep9l30UYh
 W6hQlR7XFEMm7y/q7CRR60qN0ez4PlrhRpN+rMy9DvjHoq1r5erd6aU0baR57zOBNq9j
 xb3QTGUhioGRrPuQ/K3KeTTbEU4h2/57r4Lt67WUJLFf/DIZa69izdCOc1YpAgYWqWt2
 vreL0QYBobBcgKhYF5k5DcCDsxzQvF/2Ce63OcFk2cJAoe9FOkr7zmA1wv7O1BWlb5Nv
 llwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731940317; x=1732545117;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MhAdaVPB17968gemREtUHRV2S7Vpyh9Kc7ffCpxcGyQ=;
 b=enuZLwZySxg1+3dykEu2nd/nyQDLB8Kf8zqN1cOQAdFXZ2WCmoQfyDetSvhETtzqpK
 jt2YAVQSREL0punRcNbmtmf3c3RNtLnheRCT7XBdhlUIRlwSR/HMb19QUAprvFYg1XeX
 f7uBc+QZ7UMBM+9ItLYW+ivLINN+PIxdE0u3iu21y9Wh/McZTPiUzr3dM2Fvg/bhFdnn
 Bin9rMn9sgv6BQADMaOvTOLekN63Abc3BmRpg/TRSRKoWjANxWJS4ajT9AZIhAAg195Q
 8pfdhSCtrZiWrhqxhHVReiwsYQt8w8qarjsKLBV9fZNZqkbjPrNL1UTF/+mFb0HJqb9m
 xvmw==
X-Gm-Message-State: AOJu0YxCS+XoxAHpe98sXFRARnfQxniMsvTX6i2SmCjv6SBibWJC1NHz
 W8RrlBZda0XwtrHauCxkGNqd6ov1a2Zc5UffDuejQ+c524+kxO4UomSf01UtrruQbfl+rzn1suG
 yr7XmMmxKh+jtbBllpxKOkkDdhWoWrRvF0sWxGw==
X-Received: by 2002:a17:907:d19:b0:a99:f861:ebd with SMTP id
 a640c23a62f3a-aa48340fc14mr1108960566b.14.1731940317282; Mon, 18 Nov 2024
 06:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20241117134931.37249-1-paskripkin@gmail.com>
 <20241117135022.37508-1-paskripkin@gmail.com>
In-Reply-To: <20241117135022.37508-1-paskripkin@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2024 14:31:46 +0000
Message-ID: <CAFEAcA8ez9hQXJAPc+s8NpkFs_3_SAybe+HCizBm1mzsmJD-EA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm/ptw: use get_S1prot in get_phys_addr_v6
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
X-TUID: J/Bu2U5TCya3

On Sun, 17 Nov 2024 at 13:50, Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> To share missing SCTRL.{U}WXN and SCR.SIF in short format walker, use
> get_S1prot instead of open-coded checks.
>
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  target/arm/ptw.c | 41 ++++++++++++++++++-----------------------
>  1 file changed, 18 insertions(+), 23 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 50eed0f811..0d003a9f7d 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -85,6 +85,10 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
>                                GetPhysAddrResult *result,
>                                ARMMMUFaultInfo *fi);
>
> +static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
> +                      int user_rw, int prot_rw, int xn, int pxn,
> +                      ARMSecuritySpace in_pa, ARMSecuritySpace out_pa);
> +
>  /* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS. */
>  static const uint8_t pamax_map[] = {
>      [0] = 32,
> @@ -1148,7 +1152,6 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
>      hwaddr phys_addr;
>      uint32_t dacr;
>      bool ns;
> -    int user_prot;
>
>      /* Pagetable walk.  */
>      /* Lookup l1 descriptor.  */
> @@ -1243,13 +1246,13 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
>      if (domain_prot == 3) {
>          result->f.prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
>      } else {
> -        if (pxn && !regime_is_user(env, mmu_idx)) {
> -            xn = 1;
> -        }
> -        if (xn && access_type == MMU_INST_FETCH) {
> -            fi->type = ARMFault_Permission;
> -            goto do_fault;
> -        }
> +        int ap_usr;
> +        int ap_priv;
> +        ARMSecuritySpace out_space = ARMSS_NonSecure;
> +
> +        /* NS bit is ignored in NWd. */
> +        if (result->f.attrs.space == ARMSS_Secure && !ns)
> +            out_space = ARMSS_Secure;

Instead of doing this, I think we should align the code a bit
more closely to how we do it in the lpae codepath. So before
"if (domain_prot == 3)" put

     out_space = ptw->in_space;
     if (ns) {
        /*
         * The NS bit will (as required by the architecture) have no effect if
         * the CPU doesn't support TZ or this is a non-secure translation
         * regime, because the output space will already be non-secure.
         */
         out_space = ARMSS_NonSecure;
     }

and then delete the current "if (ns)" code block at the end of
get_phys_addr_v6() and replace it with an unconditional

    result->f.attrs.space = out_space;
    result->f.attrs.secure = arm_space_is_secure(out_space);

That way we're determining the output space in exactly one
place, and the code at the end that updates result->f.attrs
is the same as the way we do it in the lpae function.

(PS: note that QEMU coding style mandates braces on if()
statements even if there is just one statement in the body.)

Otherwise I think this looks good -- thanks for doing
the refactoring.

-- PMM
