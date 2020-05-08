Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2685199lfb;
        Thu, 7 May 2020 23:53:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypL+2LcnM5UXzzB+xtdK67TdH8p4MuyGsxdeGoUMkCtNYpYTDM2DgPrEVSiFLaZU/EoLH1Hj
X-Received: by 2002:a37:6690:: with SMTP id a138mr1303574qkc.152.1588920788574;
        Thu, 07 May 2020 23:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588920788; cv=none;
        d=google.com; s=arc-20160816;
        b=DRb177ouf06k0jV4yl+o76Ro0EBHAJHveTabydrjSvKEUIvifHEcR6fm60m2NuAt3m
         Z0yxmTcnDJCasL9h1ZnWlxcDaC4DkUMkKf2KPqoTqypWw08AecQl/owT4m+fsUUD6a/3
         lGgVZLDnDNXDq6h0vDtvd//p11t4Owxd1f4MJOlczvQNkZi7t0kqlNW2AL4cBGkwMg73
         l14JyQS3fgcNomyGFN1Z3FaJLFiWQQ9r4Wi7+kRwj6K/217gnYyIjkwHkfy3IZ8y1+eH
         a9Ia6Gh1zVfT/XL6vZgjZONowd1vva1mR59xT9XQgkq7y2a7Ora0r6wtuTuD6p3tmz+8
         zb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ZaTTP1HypK+9+FFDLK29esbflOK4M9siUYvkNHZgl7k=;
        b=wYf3EYvoPf0tB+CgIbKkaBiAMPYcDvaGisXs04kBhDqa0rnpu8l2Au/UfkFgzTg8gV
         Yn4TDOKPnoj8xs7oeQ2iPtXwdJd9bqQsyqorkvPFYPv/rkwLEVNLq/BObz8kU1rn05HI
         T+OuWqYYukZSsxR9E/8bIEUW3b4AZXWrmQwh91+3rgMG1VMhycmf8ouCzs0DzRT/Cf9a
         sLNuNqURMmls3SqRq1EY3I1sF3XlrEopG3NrxqWBOic8uOryalK16V20aCOrnMxekBDT
         hibPkaC3RbSyuXmpLcaJkkGK/E9D2g9tp9qYC0xN++wLx/MN7SI3gAhioqS722UY9z5/
         4nkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=V02TLv4f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id u15si383874qtj.326.2020.05.07.23.53.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 23:53:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=V02TLv4f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWwsd-0000L7-UD
	for alex.bennee@linaro.org; Fri, 08 May 2020 02:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jWws6-0000KV-82; Fri, 08 May 2020 02:52:34 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:39980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jWws4-0004g2-FE; Fri, 08 May 2020 02:52:33 -0400
Received: by mail-ej1-x642.google.com with SMTP id n17so459810ejh.7;
 Thu, 07 May 2020 23:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZaTTP1HypK+9+FFDLK29esbflOK4M9siUYvkNHZgl7k=;
 b=V02TLv4fu65+EzC7vP0otWqY3w5Huo/joRnj0vPHB6W5r3VknHBtuDRNmcFXVoT2oK
 utUHa09lUw3gO/ww9CiCST1jNDLMbfGTs0EECdZ/hn4rMWujLEOTzZO5pvcqy4EfSo1s
 tgLugQeVxOeb0DIsoi+hFNsUyFHvVqFIpI5zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZaTTP1HypK+9+FFDLK29esbflOK4M9siUYvkNHZgl7k=;
 b=PnrkCfag8DE7iZfVkhb8/ohPsmKpdQwqhHeD6x4DRQ0hRH8V4PgZoKuC1ls6cuQHdL
 3ECo2mBsTzgNvUSLvxxKo/denVSE3LKPvgMpPDpTtrlpe9ZoIvKGhvSHxoaUZ/j3hZqp
 3SkIJkLNCZuqz1LIaldp+S/mxcixCwN7UGdIEHif2ruPkeQFq80HzT1G8nrJxBg/Q5HS
 J/cpjRhbR/zbC6uSSP5LInnUog4yMtr0cIlpAMgceYtkrT74mDdLLnrjFu/rYlHD+KDF
 Z0bZxW6cV0Tf05wEoXrtQTm+8lOFyaGDuY84ce/38oG/XHhGqTP2dkW54JUzRE4coNz+
 oz6w==
X-Gm-Message-State: AGi0PuaEF1iAHIbtk8ANJNtJHgfYN6v4BUn0tTxg7A+5HuYnS5PTdfpT
 qrcg72L//6KQOUKPVl//7f/aMuvzNxAsMnT+wqc=
X-Received: by 2002:a17:906:c7c5:: with SMTP id
 dc5mr686082ejb.50.1588920750144; 
 Thu, 07 May 2020 23:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200504081953.245912-1-joel@jms.id.au>
In-Reply-To: <20200504081953.245912-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 May 2020 06:52:17 +0000
Message-ID: <CACPK8XfTg1OucOEeiUE711_+-Pz4daYCrPmKFDTj25keeM8aMQ@mail.gmail.com>
Subject: Re: [PATCH v3] aspeed: Add boot stub for smp booting
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iOCUMHxVEzCs

On Mon, 4 May 2020 at 08:20, Joel Stanley <joel@jms.id.au> wrote:
...

> v3: Use WFI instead of WFE
> v2: test for number of CPUs

> +static void aspeed_write_smpboot(ARMCPU *cpu,
> +                                 const struct arm_boot_info *info)
> +{
> +    static const uint32_t poll_mailbox_ready[] =3D {
> +        /*
> +         * r2 =3D per-cpu go sign value
> +         * r1 =3D AST_SMP_MBOX_FIELD_ENTRY
> +         * r0 =3D AST_SMP_MBOX_FIELD_GOSIGN
> +         */
> +        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
> +        0xe21000ff,  /* ands    r0, r0, #255          */
> +        0xe59f201c,  /* ldr     r2, [pc, #28]         */
> +        0xe1822000,  /* orr     r2, r2, r0            */
> +
> +        0xe59f1018,  /* ldr     r1, [pc, #24]         */
> +        0xe59f0018,  /* ldr     r0, [pc, #24]         */
> +
> +        0xe320f003,  /* wfi                           */

I was wrong, wfi does not work in this case. I must have made a
mistake when testing.

C=C3=A9dric, can you please confirm my testing is correct? I was using
today's linux next, but anything newer than Linux 5.4 should have the
same result.

Peter, can you please take v2 of this patch set instead of v3?

If you've already added it to you queue I can send a follow up to fix it.

Cheers,

Joel
