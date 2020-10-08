Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1372154lfq;
        Thu, 8 Oct 2020 07:02:25 -0700 (PDT)
X-Received: by 2002:a17:907:43c0:: with SMTP id ok24mr8809929ejb.385.1602165745687;
        Thu, 08 Oct 2020 07:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602165745; cv=none;
        d=google.com; s=arc-20160816;
        b=UfFYAjWZs5qigywu0Lro4c3suMO5dx7sAbSuH0t3XJBTVoCCKJRyMkBSg/oymmZ4j5
         oeWg+aGS7zuVnr+yT+tYnNpc1jmcIRo7rTg82RIAJv13oedrIxJ52kHnQIML4MIbFi72
         V5cPNrF9Hf9zTvApH12kCbLTKUlDfOyfbBul87F7qW6C7oh+QXvmu/bic75HKaMIwBRM
         oNEJ9/a6WwhlvO/15gNxtuNPxHiJyghsVVjv0HQ6Et0uLxIL4JE7/gDlFzvI5yfXIhDR
         inC19/e/P7aNF/y5yrclsN6ebYSSOC2XI4WWk+5K6v75hZVPnVz6GzucMqcJ73ifkdPm
         FhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K9tBDfuop8j2E6u+TWsjamk6eN0eE07ZY8wkUtvmSZc=;
        b=fqdACu09BT2J8PULt//Ll/47Kp08J7kAcjNFjcFXauyVk72lZqU3yI6TC2QfgYyqtC
         iANHkdFvCG81wIc7YSsBXnvkwQIyH8nXaADjYTbdbNAt46wwopYJk8LlWf0RxZfFAtsU
         G2a1c6BkzSXNlUfhQl8RwbYKSQztVpN7bGF98O+nmUaXh/IAup6LcpBfo3gixD2pdLHQ
         ySEedFx2mur70qR5Jep2CQEDlFOYo/0B9uCL6NK/RHrUKFDYAd+obqCxdWUsxOatgmKb
         DnVi+Di7sNkDOk0CNU2YnlbL4qjimNdY78ZLv2UQVgfDK35hwP86LmjAMag0wm449j9r
         HmHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpKciGAS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k3sor3393092ejg.16.2020.10.08.07.02.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Oct 2020 07:02:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cpKciGAS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K9tBDfuop8j2E6u+TWsjamk6eN0eE07ZY8wkUtvmSZc=;
        b=cpKciGASCkLJE8WzsRHZCnIpzlQBkX+zz5bxGk+YChLDD+ewnadvGFWEs2CNF47/UQ
         8rCkti66OklQKw9M3HRRwSiZNfwO8vLThEhkeXUnetC+NFx7YzzgnOdFt4Ir8ptaQCbT
         HHXW2z3MTwxTKSr+BaNuPTeN1+uvSuaNfMeDWuiNiM0YSOtsNHEvrz9UaPRdxJw6A8vq
         Q8QDsBrNjANSvA1J79hUnef/QNNGyV7boIHHHp8TmXs9a+iMNQ8QG+F34avGtqi7mhhV
         9cWSWBXuP/I8u8JXud5y58wAQtcqnqg0hI042O0/QkRb4tYtUb44aAlQI2fiIyZ7xToV
         +ZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K9tBDfuop8j2E6u+TWsjamk6eN0eE07ZY8wkUtvmSZc=;
        b=oaog0v7EEl8XOSfEhWS40RGqE8r9CS+S8kedpY8IqpS62ltpCrE8c75QCCZriwf4Rv
         cjmWIePpS3/vC5pMxdqrkr/KbNUssVxGzsXOUU2KMzMv6Y6vvOsKkr4dlE8wLZ5mgN1l
         eYg23Ge0MF7pRdpHV8Z8r30UlehufdcxqLvE5JcpvH7nzACHajKgaQH25Ajx8xIVoXnC
         NdF5Jql9D39s/jyAOOVcXWd89nw64LcZuOJNnR2b/+yD/iQ1Q4zGJEU7ucNoC+KnIOjO
         ongywn1DZaKd/J9b5qA4DlHDYKB2ENUaPlL8NiVP1k5waIdZ6X0TvJRZB0l1TapC2KS0
         fl2Q==
X-Gm-Message-State: AOAM5326xWD9xfxqNYqYuWU4WDK0okVAiFBGf6SDbc6nRiIsKFDZd6U3
	+WwdPi1Ez7PkwCh9456fUvzvytVnW5rBpP3jg9cahxk4
X-Google-Smtp-Source: ABdhPJwS4/obQMPI37vi76IWf/JDsu9IHChDyPxdc3OUZXXa33DMOD2qCtEMCJWJI+uSBqOOfAol6XTf39hBMaBA+ic=
X-Received: by 2002:a17:906:1f42:: with SMTP id d2mr8792238ejk.407.1602165745209;
 Thu, 08 Oct 2020 07:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201002215955.254866-1-richard.henderson@linaro.org> <20201002215955.254866-8-richard.henderson@linaro.org>
In-Reply-To: <20201002215955.254866-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 15:02:13 +0100
Message-ID: <CAFEAcA8jBAKe_tWAKzAXq4LFO5vk1H8AZN+s+3oWsLfoRugQdQ@mail.gmail.com>
Subject: Re: [PATCH v10 7/8] linux-user/elfload: Parse NT_GNU_PROPERTY_TYPE_0 notes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-TUID: hnr0XGlVyy+g

On Fri, 2 Oct 2020 at 23:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For aarch64, this includes the GNU_PROPERTY_AARCH64_FEATURE_1_BTI bit,
> which indicates that the image should be mapped with guarded pages.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v9: Only map the startup executable with BTI; anything else must be
>     handled by the interpreter.
> v10: Split out preparatory patches (pmm).

> @@ -2467,6 +2467,50 @@ static void load_elf_image(const char *image_name, int image_fd,
>                  goto exit_errmsg;
>              }
>              *pinterp_name = interp_name;
> +        } else if (eppnt->p_type == PT_GNU_PROPERTY) {
> +            /* Process NT_GNU_PROPERTY_TYPE_0. */
> +            const uint32_t gnu0_magic = const_le32('G' | 'N' << 8 | 'U' << 16);
> +            uint32_t note[7];
> +
> +            /*
> +             * The note contents are 7 words, but depending on LP64 vs ILP32
> +             * there may be an 8th padding word at the end.  Check for and
> +             * read the minimum size.  Further checks below will validate
> +             * that the sizes of everything involved are as we expect.
> +             */
> +            if (eppnt->p_filesz < sizeof(note)) {
> +                continue;
> +            }
> +            if (eppnt->p_offset + eppnt->p_filesz <= BPRM_BUF_SIZE) {
> +                memcpy(note, bprm_buf + eppnt->p_offset, sizeof(note));
> +            } else {
> +                retval = pread(image_fd, note, sizeof(note), eppnt->p_offset);
> +                if (retval != sizeof(note)) {
> +                    goto exit_perror;
> +                }
> +            }
> +#ifdef BSWAP_NEEDED
> +            for (i = 0; i < ARRAY_SIZE(note); ++i) {
> +                bswap32s(note + i);
> +            }
> +#endif
> +            /*
> +             * Check that this is a NT_GNU_PROPERTY_TYPE_0 note.
> +             * Again, descsz includes padding.  Full size validation
> +             * awaits checking the final payload.
> +             */
> +            if (note[0] != 4 ||                       /* namesz */
> +                note[1] < 12 ||                       /* descsz */
> +                note[2] != NT_GNU_PROPERTY_TYPE_0 ||  /* type */
> +                note[3] != gnu0_magic) {              /* name */

note[2] and note[3] are both basically magic numbers, AIUI.
Why do we have a #define for one but we assemble the other
with a const_le32() expression ?

> +                continue;
> +            }
> +#ifdef TARGET_AARCH64
> +            if (note[4] == GNU_PROPERTY_AARCH64_FEATURE_1_AND &&
> +                note[5] == 4) {
> +                info->note_flags = note[6];
> +            }

The spec for the .note.gnu.property section (which AIUI is
https://raw.githubusercontent.com/wiki/hjl-tools/linux-abi/linux-abi-draft.pdf
) says that the n_desc (words 4 and up) is an array of program
properties. There doesn't seem to be any guarantee that there
is only one entry or that the FEATURE_1_AND entry is the first
in the list. Don't we need to iterate through the array to find
matches? This seems to be how the kernel does it:
 https://elixir.bootlin.com/linux/latest/source/fs/binfmt_elf.c#L786

(Is it worth adding the infrastructure to parse notes generically
the way the kernel has? I dunno if we think it's likely we'll
want to do this for more note types and/or other architectures
in future, so it might just be pointless complexity.)

thanks
-- PMM
