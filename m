Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp818749lfm;
        Sun, 16 May 2021 18:56:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJqSDVNkxWoNKrHwyEg/0NN1LnHZzMZ0PWTp6SQQ38MAhQ4vwSVD7XZWKgL02yqzb+6ecS
X-Received: by 2002:a5d:805a:: with SMTP id b26mr13511969ior.138.1621216583758;
        Sun, 16 May 2021 18:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621216583; cv=none;
        d=google.com; s=arc-20160816;
        b=dLkQAyZ4TeRkoDk2YMK5BtnmYRCjBOjtLNLAPsgfGpZm1U7tuJIR6DtStfxBRFqfMW
         XgAdFJwk9yMf2yNmebY4+fezGLrwKsdCcGK3RrSBPwAHHDijKjzCnrEpb4eKBA0J2xQx
         SvZMJ/9ksWU0TIoA1iLKkU4EA1Cg/Jji3OlQuYlCkpZ1dhEyEm35hsAZe2KEkjy459jk
         XATUVwHy/CUCkwqjaSGM0eCxEKFPsxUm059dF7ydaWzS/GRCuuP9AqowOOVT7Wt+jIwL
         vhjLUku7AdMFlXdtlLKNfrUeSqZyhT/rlt2Qdoq/EBcnaNKdUblEIeTxokjWZ7nbSWFH
         ZRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=SWdGHnNm35rrHmmCHWr85QqUsNhtShOhtSqragF8j/M=;
        b=zgAaUq+yrUCNdKbclpwYEeg/LQ9mgJlMcVbzOqc/9N01Jd8mNe++YVSeYtrk+39uYw
         4W55D/rz7GSEeKbI3+71YTB3CKCCt82XizqiXfxmXz7j2tbp1/TbbQ5QPw2aAJ2XiPUO
         NLmBOx7+OLKED4310sUKwCUSPkE9RAfBseIu8P+AOl3UAckbc6Tt8MqnV5JD9xsXNv7o
         S+k/ABR8TolKzuUVcgE/WGbRYq2Un0pRysXPrWufsscSd7ughimCxy3kDBsHJU9h5cqX
         dMbSG3gjEy0vQC8D4oBWV/FrxpcW2qfkQDVVQ5iXFJ97eqqOTVjWLHkjpSOhGNixy9VX
         Vu5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YeIbwzFQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si16996246jao.7.2021.05.16.18.56.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 18:56:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YeIbwzFQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liSUZ-00014y-1f
	for alex.bennee@linaro.org; Sun, 16 May 2021 21:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSU7-000144-04; Sun, 16 May 2021 21:55:55 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:35509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1liSU3-00014S-KM; Sun, 16 May 2021 21:55:53 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id i4so6503567ybe.2;
 Sun, 16 May 2021 18:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SWdGHnNm35rrHmmCHWr85QqUsNhtShOhtSqragF8j/M=;
 b=YeIbwzFQNxJDYYcGb5DTD0CMwde2bDm0j9CeXZV6Z1Ve9tt3rW4GkmAVENxeUwTLPC
 JcSsmALqkLJ0pC6H2o8o8VSzkGXnyOrtu6guQWkJbREA9rWARRyMwmtsJ38bvjdNVxzZ
 yaLO0TraicNc1jLzjDC2StUoP+L2NrPjzIuSHjUWFjcKpPFjmMkxcSylFkvY6LtvuILl
 t/9EF/5Vl9r3ng/SesQK7hDIwPU4ytAsYIq73908iSUuloMcW2YMNsSEu+aTym4Mlpu6
 JyDjxQefNbvLDYyQrUe0VTrHPN28duqQdtML+s53w7kAIJXWUDWRt5gKYUQvIHZ0aybQ
 EqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SWdGHnNm35rrHmmCHWr85QqUsNhtShOhtSqragF8j/M=;
 b=bvAYHzgIBhTeqFwpJCSRPKHQMuPvD16jC4QzTDIQ4TxfgKw2sLMxb60ZBKUhL6RSBT
 PbNtFrj/sJ1aNSTELS4oa2QEcrSvNG0U0Iii75WwkDCDaDBpLrnBRJvJc1fhOFXW2maO
 34bp9lJiTVwUJWD8PUQxLDhckepj8RoH7Uc4VhTaG7pSTVHZ/2BP6MZ2PLqjrtK8k9ce
 ih5FcS//OG1gxmyvf7UbotmUPjIhPGA7OPvd+Ydf9FziiNOVip9gAmj9yhT2Qi/eUHhh
 4lGIID2UlL+Vb5q4A4xcyhd5vkH3AwmW+Ek2yhMx4s/WDwGr5cxUof2U2gQwN7aGlCZn
 YXCA==
X-Gm-Message-State: AOAM530LipC9HDFkoStHnHHs2Kq880Awopc6PDGKNtHsguyLS2LSKuCw
 IbvBRxb1Og0DnfzPq0fRYZhN9vkA2p8jbD2Twho=
X-Received: by 2002:a05:6902:1543:: with SMTP id
 r3mr46415391ybu.332.1621216548919; 
 Sun, 16 May 2021 18:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-7-philmd@redhat.com>
In-Reply-To: <20210515173716.358295-7-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 17 May 2021 09:55:37 +0800
Message-ID: <CAEUhbmUKRhq0th3A9266qZXmf3Nxn=3=OAc2xtaTAWkteUxt-A@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] hw/riscv/Kconfig: Add missing dependency
 MICROCHIP_PFSOC -> SERIAL
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pRkorcXD3jW/

On Sun, May 16, 2021 at 1:44 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Commit a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART
> emulation") added a dependency on the SERIAL model, but forgot to
> add the Kconfig selector.
> Add the dependency to the MCHP_PFSOC_MMUART symbol to fix when
> building the MICROCHIP_PFSOC machine stand-alone:
>
>   /usr/bin/ld: libcommon.fa.p/hw_char_mchp_pfsoc_mmuart.c.o: in function =
`mchp_pfsoc_mmuart_create':
>   hw/char/mchp_pfsoc_mmuart.c:79: undefined reference to `serial_mm_init'
>
> Fixes: a8fb0a500a6 ("hw/char: Add Microchip PolarFire SoC MMUART emulatio=
n")
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/char/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
