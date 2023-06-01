Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp507844ejb;
        Thu, 1 Jun 2023 07:59:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4P7kPRjR+wTa5GF3yjkrqUBgOdM6gTwKtgmTb8OPSOIO+VyIi15R1fUdAqKvUSltAaClcm
X-Received: by 2002:a37:aa97:0:b0:75b:23a1:3f9 with SMTP id t145-20020a37aa97000000b0075b23a103f9mr8749245qke.15.1685631570787;
        Thu, 01 Jun 2023 07:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685631570; cv=none;
        d=google.com; s=arc-20160816;
        b=lbHR5b9sU6C9rYuIerJQ/RA7utkGL1Eq67R2E43hGX56/067exzEDXitVnsFXnSIEm
         NPjce/NEaZYBxEp44qjI50/ZgHaUTq4nyTXjfb7baHWfHKN8n7SXZHjht/E2RrFo2KD1
         AteXiHBmkx9frD0BUebw0CPBjK7sfkQrf2DQtzGarZqzRv2wrRgqI7ZOjmuPFVFU+TJc
         hoX/99Lc/kQDPC8Vq4Ti9ygbhlk3LX9BlEdq0axNgsLLspIU1odeuY1SXIXflEOrHrVm
         5tWwIBqVHx5iuw0OKQG81k5RIAhipg0UbPPUusNW6deogJHgSke2ppiOs4SjFvPsOUR6
         1HsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Sfa12e3H+IEjydh/tx3CUa2C4TV2nFRduS1SiyBzebI=;
        b=X2i4Bzj1JbPfxTmWR7rGJlUzHgjx/X4FU7NOOAXTblY9ncj9U2Y1m6V9VggBKZK9zA
         clBA86fe7YWCpMbTmFdCIFngCKuvQJSXkrpYcBITrm/zWrHKsuiCdWAPJTxtTCYWUbEf
         6wUKAHf7zsifAHgaQi4GkDqc2uYo99dBQU/Mg6zMs/xn5BQPFCdcfEopCb0cfYumUwGU
         vYOSmqd7otHkm0BuTrSDrJS8zt9WMIpJacOqEu+odCYodolbWgff/zyzTffzUKlGTlhP
         QsriDDbKi6xKx+3CP+zBrtKXywvU7HLYNm/kkPiqVzH9k4bzukAtFLHJej0onUZ/Ls+D
         ZSrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QFEb+A4m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz29-20020a05620a36dd00b0075bbcbc827bsi9588207qkb.680.2023.06.01.07.59.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 07:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QFEb+A4m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4jla-0003NG-M5; Thu, 01 Jun 2023 10:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4jlZ-0003MS-1o
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 10:59:05 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4jlX-0006KK-9Q
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 10:59:04 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f4b256a0c9so1187430e87.2
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 07:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685631541; x=1688223541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sfa12e3H+IEjydh/tx3CUa2C4TV2nFRduS1SiyBzebI=;
 b=QFEb+A4mQDynJ3MsFAZ8Lbf3+7cNkJeBwL7Bul5BQNr6LUkYnadoPUbv00f7sWfp36
 wV7vBtFOOHsKzQVTtefGKTSyVap6El1X50tUgdUyK6gLIjW0Px0Sp2GkIbkyAsDSQRVf
 fEHqfTjfXJKIbgAKoM350vgJJ5ncLkX/Uko2z2NpXvzwpo+aufIvTFXEzBIgK0J0gmjZ
 7db7/75HCDUJBr8hbZWC4RJcsiTHLa6jUB0fBY1vQfANtmv1jlIWy4N6IAACmyyF9C00
 Au2jt49A4uoiqUr7mHvQVDGJrnGQVuDokZPkEl27sZgpRuSuM8xHSg/+6pyc5rlB5F5a
 BoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685631541; x=1688223541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sfa12e3H+IEjydh/tx3CUa2C4TV2nFRduS1SiyBzebI=;
 b=cUfQkEk0QZMV8kHK42+g+YodFln5xajfIzOzXYXqntJHx5hRJvamYrIn6JY7V9mh0n
 Jyqw7C4lsYDVbwbVUZYqLgGYBtdL7niL/w4VIdzPpg1LKFDswvCbJSsZw8L/bHhqri0E
 6hbV38Q9JOTPqhtKwesG3cZB0XnoTTHLZPNHcAGWog+BMqWoulKQ/6qn7w6E7ckXQmP8
 inuwaOouZApWJeX93x4UtwJV8E8Q9BTcL6nhs7bWRe8zHL0zVYd9MR5Tgoux9EMG+d3+
 ZtUpMfTjcYfJadgSLWuFPt3S58/Pm4G+j3nUFyiiBGisCKngAavw+sG9K6VKlQfYE5yB
 f+iw==
X-Gm-Message-State: AC+VfDy67TZfAtH7Hqz9Kx4mA6VDFUvqERTNlIbityvBXovUca23Yato
 nhirs/qC52LYkrupnXQPxaFmcFNEJKyxAl26JWNczQ==
X-Received: by 2002:ac2:5984:0:b0:4f3:baf9:8f8e with SMTP id
 w4-20020ac25984000000b004f3baf98f8emr141947lfn.4.1685631541520; Thu, 01 Jun
 2023 07:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230601143312.69691-1-quic_acaggian@quicinc.com>
In-Reply-To: <20230601143312.69691-1-quic_acaggian@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Jun 2023 15:58:50 +0100
Message-ID: <CAFEAcA-92-zExcOFMwaNYvP5pXLTUETsYi3mpuvTp2txfVEp9Q@mail.gmail.com>
Subject: Re: [PATCH] hvf: Handle EC_INSNABORT
To: Antonio Caggiano <quic_acaggian@quicinc.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mark Burton <quic_mburton@quicinc.com>, Alexander Graf <agraf@csgraf.de>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: kpW+siEyT/Sl

On Thu, 1 Jun 2023 at 15:33, Antonio Caggiano <quic_acaggian@quicinc.com> wrote:
>
> Instead of aborting immediately, try reading the physical address where
> the instruction should be fetched by calling address_space_read. This
> would give any memory regions ops callback a chance to allocate and/or
> register an RAM/Alias memory region needed for resolving that physical
> address. Then, if the memory transaction is OK, retry HVF execution at
> the same PC.

What are the circumstances where this happens?
Do we try to support this on KVM ?


> Signed-off-by: Antonio Caggiano <quic_acaggian@quicinc.com>
> Co-authored-by: Mark Burton <quic_mburton@quicinc.com>
> ---
>  target/arm/hvf/hvf.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index ad65603445..6e527254b1 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1446,6 +1446,18 @@ int hvf_vcpu_exec(CPUState *cpu)
>              hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
>          }
>          break;
> +    case EC_INSNABORT: {
> +        uint32_t sas = (syndrome >> 22) & 3;
> +        uint32_t len = 1 << sas;
> +        uint64_t val = 0;
> +
> +        MemTxResult res = address_space_read(
> +            &address_space_memory, hvf_exit->exception.physical_address,
> +            MEMTXATTRS_UNSPECIFIED, &val, len);
> +        assert(res == MEMTX_OK);

You can't assert() this, it might not be true, especially if
we're here because hvf couldn't read from this address.

> +        flush_cpu_state(cpu);
> +        break;
> +    }
>      default:
>          cpu_synchronize_state(cpu);
>          trace_hvf_exit(syndrome, ec, env->pc);

thanks
-- PMM
