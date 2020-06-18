Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1656095lfm;
        Thu, 18 Jun 2020 06:43:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRIIZN6VpRhHhkgRAp9tWMBKgctlsdd/Qe1wcMDryBzukpQ611v1/ynsbXsR6qcczJTcQG
X-Received: by 2002:a25:be05:: with SMTP id h5mr6566028ybk.131.1592487823605;
        Thu, 18 Jun 2020 06:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592487823; cv=none;
        d=google.com; s=arc-20160816;
        b=PC2hipGnxwvkE2APyPRiXUXogRRYEQPh81PalfwsvXO9ovV7sP+WwbzBqBmq0jjWQK
         C7HebaZG5BgQ621EgBFiaTjxr+aZA5nllPhn+WSowmMazmfsuyNQgZe0IJxY4/hVfg3S
         eaxBb/gnLdcWRHlbk2Ew64+kCC/nvJvFwtBXy5TzeEyq1q9Vtc71nnJpgP7IhDpgySXF
         ubi23xXqccbN83c6oh/Jd+bt5e/skzUl4eXmVNhkq1FbyM/hjUx/hE/Gxsv4a+dwdiE4
         NuV5HPqbZOn9O+NAydsCOj75kLM21PpAfhfOYKY1FT6BA3/GY8au60ET2RL7Gzxvlm45
         VAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kGdauocYF4BXlU7/FEGOo5Z/ZRwkBSG/D6g35P04CXo=;
        b=MG+4tVe/n58albpw0ZD+kd3lMWDhEXHN72Pw/6pwP+CUULK2FkvpePhIC/5c13JlqA
         BmBVaSIVro3hdDj9wBePCilACWMXm2pHfUXq1Uq87uSm+Uw70PiHm3XfTmuov5bYsr6d
         MiHcUwD2kEZ4hPFJ9HX1nxhoyp6KFjY/RCnPKDR3/9vCT7IGpoINsUCpRCDzXxOlbfSD
         V5TVZaFCvKYXJ899Zjga6U2R3WYKNPMjPeMmWZehkZ98QNsLKzxM23HWkgLUKdewLqgI
         cVZFgy5M5niLCws2o24Vx2RvoLA61/0HWHBhE9Aw5DwNjW3sZ+JLvrRDU1+45IZnNRhs
         OEbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OyLKuICe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20si2227074ybg.371.2020.06.18.06.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 06:43:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OyLKuICe;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlupS-0002PE-V1
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 09:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlufK-0000Qu-8R
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:33:14 -0400
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:46921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlufI-00083u-Jp
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:33:13 -0400
Received: by mail-oo1-xc44.google.com with SMTP id z145so1159208ooa.13
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 06:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kGdauocYF4BXlU7/FEGOo5Z/ZRwkBSG/D6g35P04CXo=;
 b=OyLKuICeazjBy/JWVyIKR1Iphrh4PHhbxQDEDXYd1+JW0h1Cd8GrCt2/PzxryxPmhZ
 ho9gi5rE8P7/0y4E9EmuU8vjeqGeSHbbeN1RekfgVM+a1BuBCRQ5oKfsIwISviDIBwwG
 bh21GZCE5Ph0d8bGDEa6/EQklWka8oMjZLyYkGNOFCBeY+wHMbTBTf1NJ/QJ/bXkfysq
 NLA8MveQ+2WpTA5p4FKkuWhhlSrVjakh3XWp0017zY/B5q8WxB7b7iqVuXctMf/Vy8JK
 sfBqk0UCT33SYML4n4YNHkpsaqM7CtgwlQAmNAhZoO5DNMA+ElUrj7tJlvKvCPsp+Ato
 +QDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kGdauocYF4BXlU7/FEGOo5Z/ZRwkBSG/D6g35P04CXo=;
 b=sIRP4YknVYPDpH6er/xOZcWP8+6L6/8gBexecU4PAzFP4VSY4W9uawxleehpR1pRTN
 MEoj17c6D+ShEpLyPyYxg2QTx9yP25fZjPW+pvNnXdxEGQC70mq3tvAZL83dr8At4arb
 W3N7HXruJzckZ04uKaWU1mYIEL3ZbRW0D4KeGXCtwB8/apMqZnvcP/BqCHUByfL+GWre
 9kKkLkBruhM+zSwLNGS8NnyPzHdfkNBWOl848861ELzDo67PlPi+CB0MN/PuzmuB+bvd
 Y6PkaozKxT7yqE0eOVzNR9ThylMhMmlqSFSme5gcR1OgMRmeeqBfr6RkMsWO3BU5L5qv
 8rAA==
X-Gm-Message-State: AOAM5329DmCRxIzcn1tEBWBYJpKd66j5g81uRKKv9297HO9RlvT6UV31
 j7KwC7hScA6Bgp37GZ/EqvZNcVJiYtIOlLf1zXf6QbPQVGw=
X-Received: by 2002:a4a:9528:: with SMTP id m37mr3989128ooi.85.1592487191322; 
 Thu, 18 Jun 2020 06:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-15-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 14:33:00 +0100
Message-ID: <CAFEAcA9EJB8Oa5c7emh-cKMmZRUPa8rRvvvXsHUJWO51gUaDvA@mail.gmail.com>
Subject: Re: [PATCH v7 14/42] target/arm: Add helper_probe_access
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O+e8j+zt8wFm

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Raise an exception if the given virtual memory is not accessible.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 0ee2ef403e..b032829194 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -232,6 +232,19 @@ static void gen_address_with_allocation_tag0(TCGv_i64 dst, TCGv_i64 src)
>      tcg_gen_andi_i64(dst, src, ~MAKE_64BIT_MASK(56, 4));
>  }
>
> +static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
> +                             MMUAccessType acc, int log2_size)
> +{
> +    TCGv_i32 t_acc = tcg_const_i32(acc);
> +    TCGv_i32 t_idx = tcg_const_i32(get_mem_index(s));
> +    TCGv_i32 t_size = tcg_const_i32(1 << log2_size);
> +
> +    gen_helper_probe_access(cpu_env, ptr, t_acc, t_idx, t_size);
> +    tcg_temp_free_i32(t_acc);
> +    tcg_temp_free_i32(t_idx);
> +    tcg_temp_free_i32(t_size);
> +}

This isn't called from anywhere -- clang is probably going to
complain about that.

thanks
-- PMM
