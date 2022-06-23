Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2879123lft;
        Thu, 23 Jun 2022 04:43:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sLkrYGxxUMsN9P1EHD1SLXFxb1svJaYq+a/eLR+l7Vyf57s0hijdmM0qP0JEU2MvUfFr0e
X-Received: by 2002:a05:620a:4903:b0:6a7:3b01:a404 with SMTP id ed3-20020a05620a490300b006a73b01a404mr5580817qkb.405.1655984618810;
        Thu, 23 Jun 2022 04:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655984618; cv=none;
        d=google.com; s=arc-20160816;
        b=hcr6RAX4PkiOZ33A4cWKkYVqSnmqxfghSPtG9O36zm5lMwD0yzSH4n8ynqTThnMOT9
         VTuIZobcazkOq4KzUxns9EkRLShk6Duoy/a++NpP+8e+yW7C2xdCNGfOmFWcjhIdZsuO
         2tPJDeTOTqVLS8Mf168CDdHvrUiPhcJMaNePx2TdinCvTY5NuXw6sVjHUpwZ50tcExxA
         wJ7dZ9LAKKpMIFxwyNR2fRwwchxLbyZM4caSPTXAO2I20ywi6haHIYHlSi+BG8rVEg4j
         rl0gcGvS9dK/rYaJou5bhrs+Ps5uVNwfBKzafMf4g6Js0xTeIrS+B/BWnhFOs04k4Fjb
         +JIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=y8t4huc/a/R+d/eHo98icgB9bpiDx5ZVRL2x6ofh6pc=;
        b=tjqp2FAVW6O2KsFtwwo3voVMB/yE4PANiduP1oJin/TX586fVgu3EO4KOJjWkGoOEN
         YqGaYVHyTYk2EXOHtA1PgM3QBH762rv072jVTjWoLtCjtjNDWcSeCzgPg55eK/4Ff+wx
         uvHNFEneBFoVeSmlI2u2qXUfSV80DU4NiRuvx9FC0KuxfE1ox4H/8b/txFw1v4wvytU0
         KCOOPMTZy53CUSq2sIKFaiiXlikwP+nm7rNNRAcf/k9DB9waUHZnN5UNJx4ESPMhlNOr
         hUAJH3uoou9fHQIOs4gfSaR1yXicfj8pTQIbqM/GM54RTGWEeWRFbdj3RTucRfBHdIZQ
         SBQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e7b9/KAP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020ac859c8000000b003061659c057si14582702qtf.572.2022.06.23.04.43.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 04:43:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e7b9/KAP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4LFJ-0002R8-QG
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 07:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4LEY-0002Oz-5Y
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 07:42:50 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4LEW-00033P-5S
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 07:42:49 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id r3so35369748ybr.6
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 04:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y8t4huc/a/R+d/eHo98icgB9bpiDx5ZVRL2x6ofh6pc=;
 b=e7b9/KAPCrgfUpcBUj+JKe+YD98jikX75shHPXOpvwkLiqshRpVVlY7dNzSWmCsA8P
 kdj2ZwR8EQuwb/Vtuh7XQhpEvRBz14ELLuoxsLAthTlIwc7kRYX/xu9mUxc98vV7Pgme
 eekffeCndzDtLaHLiZ1vv/olwNdcq3UgGuKw+zx4xPKqXF6g/9jQoEzlK0zTlKZtYegt
 h8L08vyoDxwy6XeJgAFgEvsJtDrZL0x1yUeRxYm95xMLY65Ol5obWRitM0s1GbvBm4k/
 zfpx234ftg027bG9qjwoHzjpzUUwmY2pleWBglu9aRXxFwFvNbNarNMz/GTBOAj9SOKi
 Yk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y8t4huc/a/R+d/eHo98icgB9bpiDx5ZVRL2x6ofh6pc=;
 b=3t0SH1adYCUuGJPdG94RTSDwpq7pPf3/SFa0swQowSq3lYkITtcQPdaOjQcuieWXtK
 caGRsl0HXLysyBPIX9PbswjIBiXesztv0IjYv2NndaEO0KwEsQ7mnFsHtJy1jTDUbwsj
 JgazrHBqARECRAm9Sj6GNBr68Jyf+ZA+N+QdFcfRp4Qj8cB1+0EOYa2NxKFneyWT+fZc
 Ne1V/sHFeX17cUaa/rGVW1KZHHZD4Bc7+F6gas+ZSfi6JcICIAuJHdMu5oqm0L8TYw9a
 8JOXp4qsSz7hLZGALrVw5xd4WYae7W4nB1QlemOJEFMXSya8Vd5vKcevtdyXaBAD/bJ0
 sgvg==
X-Gm-Message-State: AJIora+T9cwcipVbzv2TBvAGZZhN4d0PfTODmUxU9zk/1iJfuMimzDPN
 CwYbOgpe7xYKxdjqBg/pI66L9ina3O0yTthLv6MyngwKj2E=
X-Received: by 2002:a25:d288:0:b0:669:12e2:b561 with SMTP id
 j130-20020a25d288000000b0066912e2b561mr8827983ybg.193.1655984566983; Thu, 23
 Jun 2022 04:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-28-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2022 12:42:36 +0100
Message-ID: <CAFEAcA9ac=P6Ggb+tTMxz6FkOzepfGUNBXUcu_xbUNE5+JVDaA@mail.gmail.com>
Subject: Re: [PATCH v3 27/51] target/arm: Export unpredicated ld/st from
 translate-sve.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0hKDrNpL7jX5

On Mon, 20 Jun 2022 at 19:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add a TCGv_ptr base argument, which will be cpu_env for SVE.
> We will reuse this for SME save and restore array insns.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
