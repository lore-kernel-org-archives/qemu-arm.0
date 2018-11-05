Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2788973wro;
        Mon, 5 Nov 2018 08:31:54 -0800 (PST)
X-Received: by 2002:a9d:566:: with SMTP id 93mr12378770otw.232.1541435514611;
        Mon, 05 Nov 2018 08:31:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541435514; cv=none;
        d=google.com; s=arc-20160816;
        b=0HJFoXYRxYj9DIp79QljQjBfWPu99GW15HIj1gynA2GEUDEoyI/QZvXb9hA/NHHTaG
         4NeX+FFg60uwve1DM7/8z53stxdR2vlVaGP9PToWg58o22/Iuo5pzncYWpKZ/x6ntSLT
         4wNpwpOcP4NudWN8O6zuuxF50Uk50ct7aCbi2/Tj9LZZytqWuh+AEwIDLPOistxto/Yi
         MH9CoMIzNUrZaRtE+8amSJjfo7rk9YTSm2m7N4Ucw8Vk7JRYvfoVlJXI6cbtGjiypS5+
         1Y4CyzStA00R+NpBvVUuzj1cHY3S/9yQyZhUupHR1u8+KXX8i8/5lnmjLsdsF97MxBU3
         h1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=zRJk6jHT8NZzbm0O8dc3qHGhIocE49d3Yo9awDi+l+E=;
        b=qswMJFDxrcuGV6UuMxdrDMMpYwiKplmE2FdN19NQYuBVwRE+2EMbwM/5aGV+DoNeJg
         gL5ayLP6DWiEeIB/M/mgqeUeHEb2cjiwQ0W3UU7+lcMnE2xZmNvfUc0ZsU0MEos2qx6K
         ASIjDqB+8cMerJZxw1u/glTJ13Yt6fKkwBCqAFDxkdcdj56kZPJph7tbGgQVilc+eN36
         pW97/mjlco3VrQGQocpbsU44Gw0pTuIcGNj0z3Mt8RUaKQmC+AaQUDemFGrh39WhGieq
         6J7bVkxi6NxCxGb64SYNBCMp7bpRujhRts88Vx3qFEFzb/EoschrfW5AvFdbfbWcP1N7
         YtCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CMC02UIL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x185-v6sor617276oig.63.2018.11.05.08.31.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Nov 2018 08:31:54 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CMC02UIL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=zRJk6jHT8NZzbm0O8dc3qHGhIocE49d3Yo9awDi+l+E=;
        b=CMC02UILUmMQJlKG50yQo3zL5zd+COz1ebBADX9xxkx6Kipx67cVIPYfByS/umkKju
         h1mZKrirwH0R5RzpDu1uFKCI8F6nb2PuPDXFIlG1Mlmkw91EZFQMgTCT3J3ZjJYMMraG
         JF61tGebmCUgMUoBCfyca91Y5byfVs2z5eo5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=zRJk6jHT8NZzbm0O8dc3qHGhIocE49d3Yo9awDi+l+E=;
        b=t1Gh3Q1m5tHtKV/WzVyqiygEGAxuAgQKZCfcfkE47lQVT3A87KulVrJlwcCAfG1VuL
         KI83dXH5igQ3AlD2KHHf91cNW4XH1EKlhQVlYuub75QJitWBNMoU2j1VfJuP5Dz3VaFl
         mWcaCooeLpGotmNu54bPjbY0ePn+JFG/dmAKzN/R1Aolx6pnLmPnrHfbelmLRGKuNKkE
         GCDubEHVGE2aKMb799mUcYCkPPH2vcesNl5UJBefvzW0Yea8OSr3pMzFsJPzMEAgGdi0
         uphpS8l23Emnsrx+lYB0Zli/jbe1RfFtYJwIoZytfgY26ihTweFo/wqvhHIXpinlfNsd
         I/RA==
X-Gm-Message-State: AGRZ1gJMfZSj8JPlDbsgV+gsToTqLC8VwUI0ZEiAGpwhNu5IqrRt1o1u
	WcwAwTUQF7qm6R7rnPKpKI2mM3H0RDZHiMRJui4yXhZc
X-Google-Smtp-Source: AJdET5f8bFnL2btfLlXJINAZ1JPELyP5RNmQL6SoVAvsFpom6vUuZ7luvvCWDjfCWPfrA/R7tuQ4wniUa7e01iJcdXM=
X-Received: by 2002:aca:c509:: with SMTP id v9-v6mr12395428oif.48.1541435514273;
 Mon, 05 Nov 2018 08:31:54 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Mon, 5 Nov 2018 08:31:33 -0800 (PST)
In-Reply-To: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 16:31:33 +0000
Message-ID: <CAFEAcA8hB=+YKNc8WSxrdmqigtErOsPJSAhYnq0Ha8_Ey=NaMg@mail.gmail.com>
Subject: Re: [PATCH v4] Add arm SBSA reference machine
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: p/FY1HqH+XqW

On 19 October 2018 at 09:55, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> For the Aarch64, there is one machine 'virt', it is primarily meant to
> run on KVM and execute virtualization workloads, but we need an
> environment as faithful as possible to physical hardware,  to support
> firmware and OS development for pysical Aarch64 machines.
>
> See the patch commit comments for the features description.
>
> V4 changes:
>  - rebased to v3.0.0
>  - removed timer, uart, rtc, *hci device tree nodes
>    (others were removerd in v3)
>  - other minore codes clean up, mainly unsed header files, comments etc.
>
> V3 changes:
>  - rename the platform 'sbsa-ref'
>  - move all the codes to a separate file sbsa-ref.c
>  - remove paravirtualized fw_cfg device
>  - do not supply ACPI tables, since firmware will do it
>  - supply only necessary DT nodes
>  - and other minor code clean up

Hi; just a note that this series isn't going to make it into
the 3.1 release. It is still on my to-review queue for 4.0,
but I may not get to reviewing it for a little bit while I
deal with for-3.1 work.

thanks
-- PMM
