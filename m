Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp215629njg;
        Tue, 25 Feb 2025 05:34:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXeX51Zjv8hNO4jYvtao+d1dlQY37JElnFbRxMAZR7o2JwLKUHWkT+LjW1fRsbqZaslDOn6kwaSobjnmA==@linaro.org
X-Google-Smtp-Source: AGHT+IGe6y/y0uI/4PixDDN1Auh62gg0cU7oViEwLMiewWpDmE4CJOEVgLXfSyM8pQUV09g5UOxR
X-Received: by 2002:a05:620a:4688:b0:7c0:78ec:1ed2 with SMTP id af79cd13be357-7c0cef1205fmr2746090285a.27.1740490478079;
        Tue, 25 Feb 2025 05:34:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740490478; cv=none;
        d=google.com; s=arc-20240605;
        b=Gc96WBA/XwF/4AAxhHwR/0+/efcACuIcGCgJKyeRkOheGOtX5R1Uvo4p53q9n4zYR5
         m0xvuoLbvNNif2HlVwZ8vmF/oF44LLQAfPA7MA+vEgDxpaBg0Wv/akRWC/ZglG11rcHB
         GDFJwSNpOqstbjTWzNeotiRxb4Dm2fruwl9PYETB3oVngQhoiIsU27/8JC3ald2yxc5H
         NuzLArG0MuzLg3e+RgOAhBQ7kjaZnImAdCHVlvDKdeiPX3WMcGvkryTw5iotDqyw33UG
         OUcM27qpqVIuc0Qod9Irc5zsqULsuz08yS7UR+llpd+ER+Lbj8NU6Fiv186QgLzY8x2u
         ybiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=OxsrIWTDWI4PmB+DclrjQmRVQU20qMCsr2Y9+Qdy7vM=;
        fh=bVuAwzLIvqwapTBpWfgriWhsetGfiPUU9z5v+OTZJTE=;
        b=BGaEmNe/Uk4BBHAPazUTVctBGo0/CCo4XfdysteD7U1njuA9KneIpqJVUn0nqe/lDG
         7nH8p58TP0AJPIrbj4u5nTHoVc5XTKUyNLqo+w8HQLzHBGuuur2+4u+TonZyS31NhpUG
         lw8AbNsvujRKq2J4ZM/5qm5DcsjutobnoQJ4EO7+gMgcruxPO/nb6PX8ABb3K0vUkBaT
         6lLE7PTPa9bDas9HjoH6S41k545CcP5UYsyVK2Zb1sZBoP4sqrFsNF4o5g+6HLOwA31P
         ZF01rZlm5gl4lwTgCHabm5vpHCh0CiSEPsCXc6kI3cur5NAQmUTQFFntufpr38tP1tih
         OsaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CCemveXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2c462dsi172587085a.210.2025.02.25.05.34.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 05:34:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CCemveXN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmv4p-0007hW-2I; Tue, 25 Feb 2025 08:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmv4i-0007gd-RH
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 08:34:18 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmv4h-0001KN-4c
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 08:34:16 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-6efe4e3d698so51004317b3.0
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 05:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740490453; x=1741095253; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OxsrIWTDWI4PmB+DclrjQmRVQU20qMCsr2Y9+Qdy7vM=;
 b=CCemveXNxQRLt9ZQ1yDxp2P36847ZpTJkVjC7fTPmNkitVKkXIzrJWfbvyx0kpnX99
 6pxlaBdJCnB/DQ3MnsKeXuhf3TKQ7ZYshpb+D2mdoMJrCpmU9qDD4LTI6f+F+iKt03Eq
 7dwL96HyRY2AQhSxlKkaxrOlAroSPrudAheOuWJ68xQ+eeTDwjKuyRSVeRq8S3nsw9B8
 c7C4tloINo9EbmH/71ClfLnT852kxe98Yy/bNtUR7Pv6UBw0cuYAPVt5s+m48d+sxSCK
 btaq9yQYompy1J4m1RNPLlvAxjwCd1KvLLYs6alnKrJMgF2/8YBU+ylVatpNjDXqS4TQ
 hwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740490453; x=1741095253;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OxsrIWTDWI4PmB+DclrjQmRVQU20qMCsr2Y9+Qdy7vM=;
 b=JOcT1gyY3lzEYM7QSCFn66N+7wmP8ldB3EGnsbR+MTG2Vz0hX9hZEzjLxFnFjeHYNP
 YglvFN2NZ/rjSmOR0VmlPQQpeUys0D1lhGIo/sqO9yi2TokOBngmcphMgbsYyWJrIKOx
 IA8NbDBxz5/w/5YKGIIdZ2nqGbs+EI9TXg/PQyG9x7hlwvCGQ4hdnmQCTUJzdv/2rqyc
 F2Mf13aRLk4wIoS2ezsxehZP+CksrfTT9d2RQT9GIYnr3XliYiuyuud9+7YVPPL2g4OS
 IHT7u+yrhGpuMV1KUyWHcTsF+E1P5ZUgKWHaXLlIheJWRzP3v/WZk55z7jp4+7SX/Reb
 rGHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGSPctKnCl8rQsvERxOlKBp/Q9dvSynWwwKl3zUrRqCbd7u3SPvA1kdC/NfaY2J8wuebuuV0R03Q==@nongnu.org
X-Gm-Message-State: AOJu0Yz/bf4zGP17xrGMqSn1kInzJ6UyIxyM43Kj4TDViiEN32pPW3Dw
 NoYYuvcC0Po0ZW+9mwrBRz0sffSqVZ53Sv0emaTjajSFUODucaAFTk8zj9MEXpYP9BN3j6pSri9
 UxDNtKJv/90Cu+QDRik3jaCtnuDnl7Mw1j+d5vQ==
X-Gm-Gg: ASbGncuiObBulXa5c5Nhh0ANXYmmWMpMbJhYQVSjB2Ohtxjj/4c5M7o0OK/oPVyY8ZC
 7HG64OX17uoNUrpoyuz3GQeJuhn7Ojv6m2G/G+f29xgcuUM1jMX7q8S9QpQ6vdZhdvRAxzhfU/k
 29o25ygjB/
X-Received: by 2002:a05:690c:6f0d:b0:6f7:4f5c:c2c5 with SMTP id
 00721157ae682-6fbcc3a3d7emr154533077b3.31.1740490453698; Tue, 25 Feb 2025
 05:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20250224184123.50780-1-j@getutm.app>
In-Reply-To: <20250224184123.50780-1-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2025 13:34:02 +0000
X-Gm-Features: AWEUYZmdji5XwKgZYKGtB1FS518mTcYuzcBjcwG4lqWvO2R6KKBW4-fU2DgAdrc
Message-ID: <CAFEAcA_woELyL3Ev3Erd7A=dc=o2eEvjbmKvPbA7R6Lm05iDbQ@mail.gmail.com>
Subject: Re: [PATCH v2] hvf: arm: sign extend when SSE=1
To: Joelle van Dyne <j@getutm.app>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
X-TUID: Nw2plXLVC3Zt

On Mon, 24 Feb 2025 at 18:41, Joelle van Dyne <j@getutm.app> wrote:
>
> According to the ARM manual, when SSE=1 the data item must be sign
> extended.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
>  target/arm/hvf/hvf.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 0afd96018e..43cf250eef 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1971,6 +1971,7 @@ int hvf_vcpu_exec(CPUState *cpu)
>          bool isv = syndrome & ARM_EL_ISV;
>          bool iswrite = (syndrome >> 6) & 1;
>          bool s1ptw = (syndrome >> 7) & 1;
> +        bool sse = (syndrome >> 21) & 1;
>          uint32_t sas = (syndrome >> 22) & 3;
>          uint32_t len = 1 << sas;
>          uint32_t srt = (syndrome >> 16) & 0x1f;
> @@ -1998,6 +1999,9 @@ int hvf_vcpu_exec(CPUState *cpu)
>              address_space_read(&address_space_memory,
>                                 hvf_exit->exception.physical_address,
>                                 MEMTXATTRS_UNSPECIFIED, &val, len);
> +            if (sse && len != sizeof(uint64_t)) {
> +                val = sextract64(val, 0, len * 8);
> +            }

sse is only set for byte, halfword or word loads, so if it
is set then len won't be 8. Plus sextract64(val, 0, 64)
is valid (returning the input value). So we don't need to
check len here.

>              hvf_set_reg(cpu, srt, val);
>          }

I've applied this to target-arm.next, with the
check on "len" removed from the if() condition.

thanks
-- PMM
