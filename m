Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp809793ejc;
        Thu, 24 Aug 2023 09:08:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbY6jFq5SfJG4gmeX9JnpL2Mgthe4Uyp0/GRaybQupgGNzA/zeVSt77gzzu3Oy2L85W75P
X-Received: by 2002:a05:620a:998:b0:767:1152:aca7 with SMTP id x24-20020a05620a099800b007671152aca7mr15808406qkx.36.1692893334987;
        Thu, 24 Aug 2023 09:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692893334; cv=none;
        d=google.com; s=arc-20160816;
        b=xQOHS54n/n62gKz9yCa4rwhAgr6p0VbJiZBsczfPy7lNUdLNS5YYP3Ghlgbp2Ewyrg
         nkIegR96Rpz7e4Cyj0vivkF5Q1ebORx5a1QRp8eF4YLaQqfYfUFe6uWqATuJVL3/dExt
         4GIzRLSKL5UadYv3z1jjF56PNKWlOovCvd8uxTSuUDcXLt7JjuVj+670hBS4PruY/qTz
         pAMT3vYKx2rYy2vu+qaONNAFvQlB6691/vwKhDEJyhI+4QcBKMlcwvnvQt3SUIkWgrOJ
         bZ8a/SmaRNN0I9tqijz5QzOL0rV/pMZJyxHmYhCP5D9THE5J8vSxa5aO6F9b41QinfxK
         gv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ys4b80d2SRQg2uZmeGFDRCRF5unfE2B5P91TIszpwp8=;
        fh=fQSWUkMuRxigFAyrwqJDZVDXvGgDP9IGeNAJ2g03mw8=;
        b=c8om0PoT3ca84d9smcivM1JbqB0sDJXNhqjFtu0iP+22gR6e0m3G9JMEq6QU4eYkwg
         rFzYlG2nHPIHp0/vviuEv08l6zFnky++zjgLKlJQLFvC4aU6vhlzD9qiLbJw1NqIEbGg
         gz9JqzrDNlnEcDJWKbvo9Lsdx+87Be+bsNlga8tUwfbFxATjxNRCMdo6NiV2iJnt+5Me
         OJTQoYfGDIyOMTou7isWrHH14V3bzXWG5FytUWh26I97CQ7sAKpfbElLCz7/OQNTBrx/
         JZa3aQ8KR/8RwRnT/v9hfriXghiTn/linmFvs1BJHmY7N0xmq3Bs//HwKbdqKLWDy9xt
         vZ5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJjxJ2oc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a05620a424c00b007673a8e37f4si3680985qko.614.2023.08.24.09.08.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 09:08:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJjxJ2oc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qZCsw-00082C-CR; Thu, 24 Aug 2023 12:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qZCsu-0007y0-Et
 for qemu-devel@nongnu.org; Thu, 24 Aug 2023 12:08:36 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qZCss-0002Vz-7P
 for qemu-devel@nongnu.org; Thu, 24 Aug 2023 12:08:36 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-52a250aa012so80142a12.3
 for <qemu-devel@nongnu.org>; Thu, 24 Aug 2023 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692893312; x=1693498112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ys4b80d2SRQg2uZmeGFDRCRF5unfE2B5P91TIszpwp8=;
 b=HJjxJ2ocyPWBL7Bx4Lc5NF5pLOoTC5r8RDHgNUt1wG7OJPzCPDCQzZ2zqzS/XUZ1pF
 WWG0CvQZHijnESlh0RK6cxJFg3LAdvZq2RCqe8XJNSPN7TAxNS30bWSo+huBHDLo4aiX
 7jh0Rdlfn/IPp91uDjX8ANYhTn2MriYdaTe6wGeY/dBYbiM2pgMdiHqJKI35qWfI7CvV
 UPISNuscjTbb4IwiEunPvLVSiJWD50NJxfEf0/3BnNwVCboVhNW8a8irYV8S0d1+qzdV
 YpcT/fMxwndlYDv5R2Bqq9YjrkpOWZdNDBkzFydkCkYg/qCAPPEqwaJBdPoElvdUTfhm
 H9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692893312; x=1693498112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ys4b80d2SRQg2uZmeGFDRCRF5unfE2B5P91TIszpwp8=;
 b=haVPQLx0O/EZ5FNfuOCKbHsf3xEcYfsMO87PcqSUVyMB4GWub9LrJuUydkUBX9x274
 EEvMvYIEHPZuq4hB3d5PhXnb93FVRE3m77DKA1HbQAkA77fQ4MUiNkJiwO93wccuHxrg
 t14SMBzRcNqAxyDaQNpCaUbCLNMPnoYPuJffUrbqFIlf+OyrVTymEX56x0xY4jPzFh/k
 LzveSNHN4aJ+ACJKv6hUGR5idRWaiSBZSIyQWbgc6WEOHnErjuPbKtQ43LMNusX4wyhy
 Y6zbOo1orwE/C67p0BNEWJKzoMaWoKX6EvFaB8ZqjqTQmib3iXuMqv9YcUibXPuuJCpH
 NmcQ==
X-Gm-Message-State: AOJu0YxgbajX87I1FW5dM9fd8KxBepGVuAgGvl/0j3OYf+a/FKN/bzgN
 TwZ2SrpURLLiLeWo81JvLUl8w5kajm9uc1pF2P0rDg==
X-Received: by 2002:aa7:ca59:0:b0:51d:f5bd:5a88 with SMTP id
 j25-20020aa7ca59000000b0051df5bd5a88mr11605256edt.38.1692893312647; Thu, 24
 Aug 2023 09:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230811214031.171020-1-richard.henderson@linaro.org>
 <20230811214031.171020-9-richard.henderson@linaro.org>
In-Reply-To: <20230811214031.171020-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Aug 2023 17:08:21 +0100
Message-ID: <CAFEAcA-Wbhf8tJgqbcHBvUS3uRB6B+0gWEXnp64JFtys2ogtgg@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] target/arm: Implement RMR_EL3 for neoverse-v1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BntZ08BZAFE8

On Fri, 11 Aug 2023 at 22:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/cpu64.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index b0cac05be6..0054bb6dfa 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -573,6 +573,18 @@ static const ARMCPRegInfo neoverse_v1_cp_reginfo[] = {
>        .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
>  };
>
> +/*
> + * TODO: For a write with bit 1 set, do something with arm_reset_cpu().
> + * In the meantime, "the bit is strictly a request", so we are in spec
> + * just ignoring writes.
> + */
> +static const ARMCPRegInfo rmr_reginfo = {
> +    .name = "RMR_EL3", .state = ARM_CP_STATE_AA64,
> +    .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 0, .opc2 = 2,
> +    .access = PL3_RW, .type = ARM_CP_CONST,
> +    .resetvalue = 1, /* [31:2] RES0, [1] reset 0, [0] RES1 */
> +};
> +

This register is architectural (but optional), not
implementation-specific. There's also an RMR_EL1 and RMR_EL2
depending on which ELs are implemented. If we want to implement
this we should do it in helper.c alongside RVBAR_EL1 (which
has a similar "only the register for the highest EL exists"
setup). But I'd be tempted to continue to ignore this, unless
there's some firmware out there that really wants to see
the register.

PS: you don't want arm_reset_cpu(), since we know that we
are running on the exact CPU we want to reset. cpu_reset()
will do. (And I don't think we can implement "reset into
AArch32" currently.)

thanks
-- PMM
