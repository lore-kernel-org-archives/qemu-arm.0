Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp10815474lfk;
        Wed, 24 Nov 2021 09:10:10 -0800 (PST)
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr21392171wri.8.1637773810518;
        Wed, 24 Nov 2021 09:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637773810; cv=none;
        d=google.com; s=arc-20160816;
        b=Isg15GwQ/qViZUJ2jDND2+Y1GMYWLCSXHTtKHvavWP/J2rLG5JlMFnRhGGjH7lYxgM
         1p3puomSflZ0a4xkLFakh7c39LIE3ZNiwt8Y4KB3BBEL4MSlWK4LssxAcX5BR9QQbwd6
         TFuCRdQydgzojuUfsfDfKBwWVqII7pmMUxUGrAJ7M3M3vx17g9QE+xOf47Z+Wl+fgbMf
         4DvdTHyBUTZlR0PhgRP3tdv+536g+xPUssUvvlkg3fYEZAwdssK8kLDpufnz/jvx/fR/
         Y6Ov6y6pLtyKvpn3DthUayOsKeom4dm9bLXIROUd0dilyxQH3CbrDhWll/FF3QIS11qn
         bsTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lUgGk4Y9SUXNaFFkMjbf7Vqvt0fKzJOmKbaBE7oKM/Y=;
        b=nwRSUGqpIdHC17cCAO9+poose+gAhroGXvNK8gofql8ZRseHJ/upcy0OrfVauZG62G
         ub3g627FV7UqHRRhF9ClogMXaXHvMNsaeWWt3E/r4vZpw3wAwOTCCrEQMnPivdHU8+oU
         +beDra698NdovvLRdyHb2q+Y3B061yPGOkjrYUyNiFE+gAGHbmWiIou9m9Dhq825xuSu
         n0AaGPwXMKVxQ0fTGx/M7e6MhCielTxBkPynIMPbUZTvNvlRDR4bc8GdSFhZsmK8Wof4
         C8ySknCF9ozGyBIONoSaR7dx74JrQq49Y3OE3otfJgb55AAZhtNgTl9aoB6hWpfEtReE
         9kqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=izxyB96Q;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 13sor302996wrz.22.2021.11.24.09.10.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 24 Nov 2021 09:10:10 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=izxyB96Q;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lUgGk4Y9SUXNaFFkMjbf7Vqvt0fKzJOmKbaBE7oKM/Y=;
        b=izxyB96QZlXb1bVnPQG4S0OTyE9FR1Iz3rJmEtKxhuryNiJxQxEu2MccLd7jy29T1G
         ygfja0JXXq7wK4Onyx+/0Y/S4kqRabhLoYoYKcIo9ka/cUiFbBxfTS1u+gmpHpJJde8E
         0K8TA6YZrV/lPCnVLBTGVL/dCqeXCOYW7cQ4C4sIEcrV2Ot1xrRJK4EyuefPqZNa9rSM
         oSrVEMT1chhtBsNol98ZkxzXLFr/G8+GGrb4GXLmt7zozVfTRGSyxXwg5rnqzvc2bUyc
         3cp5yb0fNgxb2680Z8KQGQCCIWtiVw2OkMC///rwa5CwAHwQZ/7Srihv4T7C4g4AU2WC
         GUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lUgGk4Y9SUXNaFFkMjbf7Vqvt0fKzJOmKbaBE7oKM/Y=;
        b=fgyuHKv6r9mPN3ggYPwwn6ZizzxCFYIU4cg7vt4/3E2/xEHigXsi8VFbBjp03ET5qk
         XfSRkYoT9iEA4aHIpKwV1o70Q8mDxz0kyGF+PVhxTlZXFFwNPlJPhxhFPrLq3nodnwgf
         f1ew1RbE+As7+xEgTYaRDu17EFaXDrNG3rQzBXMhL3DZF+8hhhmgmaMXJf0JotxCqZ57
         Bn9ss1/4VgpzOgbhViCS1wQs3QYH/bmIpwtCcShokpNCKZ9UzkXNo8pCI1S2YZ2UNfdq
         QdNKGMKHRGrE7vis8RPcBtaP8001DvIz7wY76XdEocypJGmjTE617PdDjvFlUBlmW87V
         AQrA==
X-Gm-Message-State: AOAM530lnVAkSeK8ONCELCsnxmhCzmtxHo6ZjIBe/gvSQyBiCqlG5NQ5
	FfkA1OjRjzi1Rb2ZzLO0b2tCFsneBmPmnI/aCK6ltZ4Sd8Nyimcu
X-Google-Smtp-Source: ABdhPJwP4j6L3/EFJJZpn+IPs4Iy+4t9E47aUqOxz6EfZ15gU9OcALYo+tQcKBpa670YRnpWJY4L2PUWWST+PJ7xess=
X-Received: by 2002:a05:6000:381:: with SMTP id u1mr21382830wrf.302.1637773810027;
 Wed, 24 Nov 2021 09:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20211123171031.975367-1-peter.maydell@linaro.org>
 <CAFEAcA8XMtAHKY=saAajLc2b03_PHGi+G=iioEpeetuS3Hh5yg@mail.gmail.com> <233AD939-3A37-4075-8430-8FFBC6A04836@hxcore.ol>
In-Reply-To: <233AD939-3A37-4075-8430-8FFBC6A04836@hxcore.ol>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Nov 2021 17:09:58 +0000
Message-ID: <CAFEAcA_dnt5bSzdkhR99JHVKXL48KqMJDQg7uN6-cyypLfzj7w@mail.gmail.com>
Subject: Re: [for-6.2] hw/intc/arm_gicv3: Update cached state after
 acknowledging LPI
To: Shashi Mallela <shashi.mallela@linaro.org>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: SdhkvVZaEdzv

On Tue, 23 Nov 2021 at 19:22, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Since LPIs do not have an active or active and pending state,the current implementation only clears the LPI pending state from the pending table once ICC_IAR1_EL1 acknowledges the interrupt.
>
> But, as part of gicv3_lpi_pending() processing, cs->hpplpi is updated with the next best priotiy lpi (only if the current acknowledged irq was best priority irq).

Yes. But we don't update cs->hppi there, and the GIC code assumes
that that cs->hppi always indicates the highest priority pending
interrupt, so leaving it stale will break things.

> By calling gicv3_redist_update() in icc_activate_irq(), we are
> re-initiating high priority irqs scan in redistributor and if
> applicable trigger of next best pending lpi from the latest
> cs->hpplpi info (which otherwise would have happened on next
> irq trigger from source).

We will figure out which the next best pending interrupt is
(which might be an LPI or might be some other interrupt).
But we won't actually trigger it, because it must be lower
priority than the LPI that we are activating.

(The way this works is that activating the LPI in icc_activate_irq()
writes into the Active Priority Registers to indicate the priority
of the current active interrupt. When gicv3_cpuif_update() is
deciding whether to set IRQ/FIQ to tell the CPU it has an interrupt
it calls icc_hppi_can_preempt(), which checks the priority of the
pending interrupt recorded in cs->hppi against the priority
of the active interrupt as calculated by icc_highest_active_prio().
So we won't take another interrupt until either (a) this one is
deactivated or (b) a fresh one arrives at a higher priority.)

-- PMM
