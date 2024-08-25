Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp732241njb;
        Sun, 25 Aug 2024 04:34:39 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU1Cd5L5l+IOHbQw76SJcb6mFV0tNV0Xf2nMZGzkg09cplG7iCStxq/jNqR1bt3eysV+AGFJNGOiBQlLg==@linaro.org
X-Google-Smtp-Source: AGHT+IHCVYboTAa0Jh6Cy3xJmKxyjZjRZzrtsuLmpj8FsMrAVQSpohvC0NlSZskRCO+PkRB1t93t
X-Received: by 2002:a05:6902:1007:b0:e13:c6ec:2a7d with SMTP id 3f1490d57ef6-e17a8686056mr9314031276.37.1724585678864;
        Sun, 25 Aug 2024 04:34:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1724585678; cv=pass;
        d=google.com; s=arc-20160816;
        b=b89ltUn8jy2YWQzY6cYbzrmDnLb/flcc9McMY8IMhbkxHvRRgTrq6PvT6uG4+NY0/E
         8ADosFVcoyuBpCw8ClZBpTLvFbvlXB/aqmsYVyIn6oVnlRCLtdL7sHsJUo72e/KYJDzS
         UmuLGJJnIZ/d395D5o03IQdccIArnnY2Tya2iAZi0yCFsE58hQCKNG3it3M4XZAmUeKk
         PECeP8IgBUUWE/Ozv4jt3VlHDoCZFGP5dBc466uPOyYO0Pjn3WVzc+h1nTJN2K6PBLen
         MQY1CYg3OdEg6cVx5dqOPn/e5G/CFBogRh+5NqLgbuuHRkH7/KkESsCpKvB2C/ptFJzM
         +PBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :dkim-signature;
        bh=EBOPOD0hJ91yJ/PWd+Kka1k6IWK/LJzUbuBA4uXwCkI=;
        fh=Uf9dqCjncnZ58Fhbg3/HIyvJa3lrGqgybO7Vxx5txzE=;
        b=qKPNhMdLn08pcjFI2YCWtHNJElereZ+zqxEMMZJQDpd2peIS5TWCBf1jThezJNtUEr
         deShfpd8LvYJJaCGyfaLnhYE93CmmkF4rVZu4JPYWlC036fCtpLmOqMNqUqAvS/V8d8Z
         wBdDj4UNgiFbYtczJO8HM/PjPjOsCcMwapHFglddt1mGFYbu9ZiOtvbru6OwdW93Priu
         Uyxvvbk3N5ZSSCrwPrqttn3G9WOhCDPYnz+c9ybAIf888ZnGchVEDKsc4bKKv3b/wkMK
         mA4Fe9WCF+Wz/StODkR++A72GHKSFG9mItvatOIXeYvBUjPrvFaIXAb/QKf8cNpa0Grb
         tVTg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NsqCfE5c;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of linux-kernel+bounces-300390-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-300390-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <linux-kernel+bounces-300390-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe0d368fsi92014281cf.26.2024.08.25.04.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 04:34:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-300390-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NsqCfE5c;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of linux-kernel+bounces-300390-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-300390-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 829901C20AAC
	for <alex.bennee@linaro.org>; Sun, 25 Aug 2024 11:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B481F13D89D;
	Sun, 25 Aug 2024 11:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NsqCfE5c"
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B701E13D28C
	for <linux-kernel@vger.kernel.org>; Sun, 25 Aug 2024 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724585669; cv=none; b=qAPwcUZZZE+WKsk0350FEGqnUx9DaL1BNm3Y7FNgCB1C7BH7NuHKAsPiHTfgjV9VtWKZqR5xxSj9hhaAHFywfxEkV7QdTvkF6HA8UI75sXM4E3kRW0hL+F0K5G95n+i693aGnFSng7qD8BhdGegeTKfjisjYZIJ3TuuNpLghCRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724585669; c=relaxed/simple;
	bh=80as+5GIVwTlFe8wnjziZdFc8lzeVGEEdcOd9p6iXzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gB9/aub7zcfHkOWTIimehnGNXS2Dm+/PbIeDKjtni0u+dBYMyloLaHZaeLz+pzg6gwCLU7/TZWD8b7bJjS/tH0hDXBofDkdGCxF/gqQxyqFgbltmgNccabtfwu9fSj7wlO5WDHBkufigSU6f8CS5G4B6ZiTCuLRZn7P4ZeJr6AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NsqCfE5c; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3f90295a9so37120981fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Aug 2024 04:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724585666; x=1725190466; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EBOPOD0hJ91yJ/PWd+Kka1k6IWK/LJzUbuBA4uXwCkI=;
        b=NsqCfE5ct1zu7MlETQJ8eKt+c45BreUrqHHAZETJ9xYm4kw9PqKhPHjWMK2brHkXS+
         aYI2mrBGBjt4goOkmVEi0z86vRzs+XQbyrWNw+J2+Asp9geB5qFdYVeP8ROEEiS4jynm
         CMV7q9MuN0z8aV79ODKaz3VLtKFOR+D4KUe6OWbOoHqGx+747quLaPE6kFEJ3g2BInZU
         SxbN4UvKB0SeGJfxH0+Mn2KCDmL13NCCnPNkj0nQmn3FGd3aLqByhLFpNJW3l39SdctP
         nGkonHsjKZzuw+cPXAQyw37Z2CWY/VCmQ07RCOQvKkZWpvm3N13nf6rjSyl455QCIFPn
         CUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724585666; x=1725190466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EBOPOD0hJ91yJ/PWd+Kka1k6IWK/LJzUbuBA4uXwCkI=;
        b=wP2bny1Ei0s4pRm7b1tb1CbAbiLMRMQaQF5FgzqCkWESmdcUEWeB9YSUgcCuHwm5pT
         hcyph3LEKiKKcbcoIQgHJTL3LVBjyWoJ08dzKqwAEgd99m3ko1DP9QQT3UTUvQ/ZAuEq
         svNgM84TiVwT5N0g2WCi+zOkNcM08Bn7NOrNYoasQIUFKkKCETakaoY4y8PsUJCIWc8C
         1es4XlIPUncUDh/j8d9+WNFrqWm1Duu8ZMeIJR2eIwhC+WQRCq2P7tZCBvf2q/3eiZM4
         HA7F6SYlokXXCljwuxFfH+EyyI4QqPDga5i3c7hZndYie/+8FnNWSdBvEskd9e19774H
         8jBQ==
X-Gm-Message-State: AOJu0Yy4i15Zmi1YI5xBL66+jO655p1l0kPWWkHwl8BbM//s6Z2Eaa/u
	U3rJrE2OhVC18Xv77q3a9QPnveSxKOanEO81XjY2WchXeFMR6z91clPDpPecvN19l14byWIYb9f
	PmY25loA1BW0V81Ll+vLozgVBBMggM119I5bLbLc+XJPgMkj9
X-Received: by 2002:a05:651c:19a1:b0:2f0:25dc:1886 with SMTP id
 38308e7fff4ca-2f4f48ec576mr44375681fa.10.1724585665438; Sun, 25 Aug 2024
 04:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1724556967.git.mchehab+huawei@kernel.org> <b88fe895e6f71711387ca153f4f1b3fbb0aa2176.1724556967.git.mchehab+huawei@kernel.org>
In-Reply-To: <b88fe895e6f71711387ca153f4f1b3fbb0aa2176.1724556967.git.mchehab+huawei@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2024 12:34:14 +0100
Message-ID: <CAFEAcA-OaQ1ypa7LXz5nOs+6+fjmYNHzNL0VVgapoXEHU=rHnQ@mail.gmail.com>
Subject: Re: [PATCH v9 11/12] target/arm: add an experimental mpidr arm cpu
 property object
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: +MCsag/KeZ0F

On Sun, 25 Aug 2024 at 04:46, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Accurately injecting an ARM Processor error ACPI/APEI GHES
> error record requires the value of the ARM Multiprocessor
> Affinity Register (mpidr).
>
> While ARM implements it, this is currently not visible.
>
> Add a field at CPU storing it, and place it at arm_cpu_properties
> as experimental, thus allowing it to be queried via QMP using
> qom-get function.

>  static Property arm_cpu_properties[] = {
>      DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
> +    DEFINE_PROP_UINT64("x-mpidr", ARMCPU, mpidr, 0),
>      DEFINE_PROP_UINT64("mp-affinity", ARMCPU,
>                          mp_affinity, ARM64_AFFINITY_INVALID),
>      DEFINE_PROP_INT32("node-id", ARMCPU, node_id, CPU_UNSET_NUMA_NODE_ID),

Why do we need this? Why is it experimental? The later patch
seems to use it via QMP, which I'm not super enthusiastic
about -- the preexisting mpidr and mp-affinity properties are
there for code that is creating CPU objects to configure
the CPU object, not as a query interface for QOM.

thanks
-- PMM
