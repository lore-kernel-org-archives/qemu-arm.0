Received: by 10.25.159.19 with SMTP id i19csp3774928lfe;
        Thu, 21 Jan 2016 07:06:25 -0800 (PST)
X-Received: by 10.182.148.39 with SMTP id tp7mr33023876obb.87.1453388785042;
        Thu, 21 Jan 2016 07:06:25 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-ob0-x243.google.com (mail-ob0-x243.google.com. [2607:f8b0:4003:c01::243])
        by mx.google.com with ESMTPS id u84si1585998oib.38.2016.01.21.07.06.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2016 07:06:25 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::243 as permitted sender) client-ip=2607:f8b0:4003:c01::243;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c01::243 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-ob0-x243.google.com with SMTP id is5so2846369obc.3;
        Thu, 21 Jan 2016 07:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=pmm7gY8XOmeHhJ8pyBHGsSFLgoCqzESZTHTbik1cGVM=;
        b=aFUEF/eEdTxnwJ5QJ8rMdvm41pzuYggPufgjGtA//tRinxXkVia/WXJVMCKCNZOQxL
         XPEdDkHcB1ZbFdPFR0tRV4Y9lje2bWMQrsE/AZdfityLpGyRb+6mhTWd2opKMMdZpP9U
         n8dXeacu933FN3+/2hJH8aDbso4TbNqutum136oMBih/0E2/GCIJyuyDicHFd3vzUKRQ
         0vTdVQXeBplqKiXujMVdIWw3j9Edh/CdQqZMSx8fUVABIW4y9jCl812w7nRhSQiGOIu8
         pvernoj2wCwPURZpW3EuLYYYLepAk0MIeI3ECRECIrwQRFpDTBhUa6sJEcPzmUwBtSoJ
         CobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-type:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=pmm7gY8XOmeHhJ8pyBHGsSFLgoCqzESZTHTbik1cGVM=;
        b=ZlJkiW9eyILhjAOSFSaoCryMIi4hFZ8vbqss4l3HV04SsC3A/AN2m8Q8hqfmmIL/iy
         EjEOKa+o5k3qWdnY4NBFFVXOks/aQjX4Q8JuY9BYDUdoaTQx174JzyT0XAqg8I6E1oQ4
         asYCH3EGZcFa+pGbJv4RVCivYS6mX41KYaHTjRv88+pjMHdE7HpyxmbwYAkNIO0Eiu3j
         Jz/fr31OCYR5DpemyCbZ78bO0qac2dMc1sHHVDfWpgBxLVZ1fhLClYwGj0glLF8zJTSU
         di4AXageg82jOPuezeaAKnF6FfxbpQJkbAc+avg0q4CyZy/xi5BeXstlOrWYu0XfR9qQ
         otqw==
X-Gm-Message-State: ALoCoQnosedSalqY92GIINQ3V02Uo5tQsl7OcsoW7Bx7H9m5nk0FIwWg10u0gC6xgPwEJHbT5KY5c9lp0uCo50Vzmjl67bxUdQ==
X-Received: by 10.60.76.201 with SMTP id m9mr32566298oew.33.1453388784642;
        Thu, 21 Jan 2016 07:06:24 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id v142sm674985oie.28.2016.01.21.07.06.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 07:06:24 -0800 (PST)
Date: Thu, 21 Jan 2016 16:05:58 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: Re: [PATCH v1 3/3] target-arm: Implement the S2 MMU inputsize <
 pamax check
Message-ID: <20160121150558.GB25287@toto>
References: <1453297780-12514-1-git-send-email-edgar.iglesias@gmail.com>
 <1453297780-12514-4-git-send-email-edgar.iglesias@gmail.com>
 <20160120172355.GW29396@toto>
 <877fj3ccwp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877fj3ccwp.fsf@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: OTTAXVR4EbcG

On Thu, Jan 21, 2016 at 12:52:54PM +0000, Alex Bennée wrote:
> 
> Edgar E. Iglesias <edgar.iglesias@gmail.com> writes:
> 
> > On Wed, Jan 20, 2016 at 02:49:40PM +0100, Edgar E. Iglesias wrote:
> >> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> >>
> >> Implement the inputsize < pamax check for Stage 2 translations.
> >> We have multiple choices for how to respond to errors and
> >> choose to fault.
> >>
> >> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> >> ---
> >>  target-arm/helper.c | 15 +++++++++++----
> >>  1 file changed, 11 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/target-arm/helper.c b/target-arm/helper.c
> >> index 4abeb4d..e1fa209 100644
> >> --- a/target-arm/helper.c
> >> +++ b/target-arm/helper.c
> >> @@ -6808,7 +6808,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
> >>           */
> >>          int startlevel = extract32(tcr->raw_tcr, 6, 2);
> >>          unsigned int pamax = arm_pamax(cpu);
> >> -        bool ok;
> >> +        bool ok = true;
> >>
> >>          if (va_size == 32 || stride == 9) {
> >>              /* AArch32 or 4KB pages */
> >> @@ -6818,9 +6818,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
> >>              level = 3 - startlevel;
> >>          }
> >>
> >> -        /* Check that the starting level is valid. */
> >> -        ok = check_s2_startlevel(cpu, va_size == 64, level,
> >> -                                 inputsize, stride, pamax);
> >> +        if (inputsize > pamax &&
> >> +            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
> >
> > I realized that this check should only be done for AArch64...
> > Will fix that for v2.
> >
> > Something like the following:
> >
> >         if (arm_el_is_aa64(env, el) &&
> >             inputsize > pamax &&
> >             (arm_el_is_aa64(env, 1) || inputsize > 40)) {
> >             /* We have multiple choices but choose to fault.  */
> >             ok = false;
> >         }
> >
> 
> OK, I'll await the next revision.

I posted a v2 earlier today, let me know if you didn't
receive it!

Cheers,
Edgar

> 
> >
> > Cheers,
> > Edgar
> >
> >
> >> +            /* We have multiple choices but choose to fault.  */
> >> +            ok = false;
> >> +        }
> >> +        if (ok) {
> >> +            /* Check that the starting level is valid. */
> >> +            ok = check_s2_startlevel(cpu, va_size == 64, level,
> >> +                                     inputsize, stride, pamax);
> >> +        }
> >>          if (!ok) {
> >>              /* AArch64 reports these as level 0 faults.
> >>               * AArch32 reports these as level 1 faults.
> >> --
> >> 1.9.1
> >>
> 
> 
> --
> Alex Bennée
