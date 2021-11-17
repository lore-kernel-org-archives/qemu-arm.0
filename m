Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1008481lfk;
        Wed, 17 Nov 2021 09:07:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+KDWnMliPel869C0dOGByEgXB8RrmBF6YX4981lIqMO8Wv7YsUJ4HIjqed5rSffjGjm/C
X-Received: by 2002:a9f:2d8c:: with SMTP id v12mr25844537uaj.25.1637168854135;
        Wed, 17 Nov 2021 09:07:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637168854; cv=none;
        d=google.com; s=arc-20160816;
        b=Em0Ireb0474WjRsRKA6rel71kxJGRzEzf7Aj+UFt7aklXkL37ie3ULfnF50yFvqGcJ
         LQ2tOxJnaZ8iaNOHlvk9ORqXNvcOjYHFC3DS6HZN9G5AU2lj8ZhbyWO7RhwxLeeFA2Z/
         V4arUhE0squhjsfwHLgB6b3bHxYmC/GmF+MxlDgTnD+zV57rZUAMxCVlTLWbNszBmcOS
         m/m2XTjcDH3HI1kiga7mcmmJuhLjP/6Tpznj1YcNkQP6HqeQU4Dv6t2ygJk72kKj9vYq
         eGgWtJ95e4tiesJPXXvbqn5AWcxpgkk4Fszz7s1pLITNJIcznvO96d5/MZO4mSy/N7tr
         w92A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=b/6f3fFZxbRQPFp/pJwCtHLi7hso+hflJYH3IdFBjk0=;
        b=mcSfq1SVCYwKBTVEf8ObrN4cmUFiOw6Rc8nHc9H9Vm+ibVb79Gy7m5GZB+y3X8vn0k
         73lWVgrLDYzzqIGWpF+6gzBbvh7+1pHybCy3NwmDsYygNKuAd4cITtW1RbG4v35CfobV
         Aop92COt46GcECur2yObXzp8iRN7DwB65r1dardof7mpr619he2jd4LXaoBdsgdmQgHJ
         dGXCPT0MANonAS1iV1x0H+sinYTTX1g+1zKC3UjmQduZqY3Dmj6bfFlYi1lilZtVWtR1
         3nktgit8A8WO7O7wt/jsgbNU7jWaFspS6lvcaht4dBG0EEoEb8XeUZv3ANFbZPtnjl6O
         VJaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=DbiZDapZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si658672vsj.268.2021.11.17.09.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Nov 2021 09:07:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=DbiZDapZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:60516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnOPF-00054F-HP
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 12:07:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1mnOCK-00086q-SV
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:54:13 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=42499
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1mnOCJ-0002rE-Bd
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:54:12 -0500
Received: by mail-io1-xd2a.google.com with SMTP id x10so4054699ioj.9
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b/6f3fFZxbRQPFp/pJwCtHLi7hso+hflJYH3IdFBjk0=;
 b=DbiZDapZlIwh/hQ7Fua3cyFrPaDf42WcoiCs1hoD2qhRpNcGfygIskLrJ55DSAMe83
 NmtAG0yP96TMKNPw5Lx3uMZKCMAbZmGKSFsTBbwONFTvzOeCHtpUignoVgYsBGGolZt8
 pRSkXp2NuJHVg8E3vRp/AT8+DzWk1VCZK2JlJ/xeYFU2MBZ1Q5WTsF054/GL+8QSRUHw
 8ViWlPeo+sP4NQ8OwQOuJKYouxIlsss77l2PmcppLwuU/P7RKNG1sdq/Ky7b7FvsNbZi
 YP17RSbRlbtI58DIOEdocKBI0tyF3pLB+Yi5AQNFYG835WdJsJyOsCEttIxHBYgW2kWP
 VUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b/6f3fFZxbRQPFp/pJwCtHLi7hso+hflJYH3IdFBjk0=;
 b=YZY4HaJmpNWmCJUPtPOZmcMB4JMIqaookizvAh58NuE6h/wt/6WDveSKyyX4pmnoCH
 jxb1b4YDmXK8of1UwX5oxiJkqdqbqWRN4iuykc7NwGJEKP/Du23dfoXdUfeTXI0naaoF
 TZbGH8CA5Lr7vd8Ze09fSLlN6+UfsabIo40EZAW1mJ8i8PMMDPiubZgC4YwPmd5EmBNN
 r1VZlHZXI9R5OX49awkTBXuHAZTkmvSv4SGF1tiDRtaEoo04pucXl7mrjWVpTFvkMfUM
 fHJQQf4E6q6X7WmiXlOO+i/KIYEqG+lKyfDk0CCCCfu2LdPQyoFFDIL7soL+rkFqPZQh
 2pVg==
X-Gm-Message-State: AOAM531lXu++ENqv4VoEC89CPNh7alGHWkNkviW7ktStWX9sSja905lm
 GVwVRCfyt1+DyTs3DgPSSGK6rb+2/f3Qek4/RwfVJw==
X-Received: by 2002:a05:6638:d0e:: with SMTP id
 q14mr14463471jaj.12.1637168049113; 
 Wed, 17 Nov 2021 08:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-4-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-4-armbru@redhat.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 17 Nov 2021 08:53:57 -0800
Message-ID: <CAFQmdRaz9aa22KVHup15oquDrt+HviqqNtGvt9tb21=spTKHog@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] hw/arm/npcm7xx_boards: Replace drive_get_next()
 by drive_get()
To: Markus Armbruster <armbru@redhat.com>, Hao Wu <wuhaotsh@google.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Tyrone Ting <KFTING@nuvoton.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=hskinnemoen@google.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2jgZioRjLs74

On Wed, Nov 17, 2021 at 8:34 AM Markus Armbruster <armbru@redhat.com> wrote:
>
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
>
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
>
> Machine "quanta-gbs-bmc" connects just one backend with
> drive_get_next(), but with a helper function.  Change it to use
> drive_get() directly.  This makes the unit numbers explicit in the
> code.
>
> Cc: Havard Skinnemoen <hskinnemoen@google.com>
> Cc: Tyrone Ting <kfting@nuvoton.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/arm/npcm7xx_boards.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index dec7d16ae5..d8a49e4e85 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -84,9 +84,9 @@ static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram)
>                               &error_abort);
>  }
>
> -static void sdhci_attach_drive(SDHCIState *sdhci)
> +static void sdhci_attach_drive(SDHCIState *sdhci, int unit)
>  {
> -        DriveInfo *di = drive_get_next(IF_SD);
> +        DriveInfo *di = drive_get(IF_SD, 0, unit);

+Hao Wu IIRC the chip has separate SD and eMMC buses. Would it make
sense to take the bus number as a parameter as well? Is bus 0 the
right one to use in this case?

The existing code always uses bus 0, so this is an improvement either way.

Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>

>          BlockBackend *blk = di ? blk_by_legacy_dinfo(di) : NULL;
>
>          BusState *bus = qdev_get_child_bus(DEVICE(sdhci), "sd-bus");
> @@ -374,7 +374,7 @@ static void quanta_gbs_init(MachineState *machine)
>                            drive_get(IF_MTD, 0, 0));
>
>      quanta_gbs_i2c_init(soc);
> -    sdhci_attach_drive(&soc->mmc.sdhci);
> +    sdhci_attach_drive(&soc->mmc.sdhci, 0);
>      npcm7xx_load_kernel(machine, soc);
>  }
>
> --
> 2.31.1
>
