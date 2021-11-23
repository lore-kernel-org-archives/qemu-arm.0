Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp9071210lfk;
        Tue, 23 Nov 2021 09:46:39 -0800 (PST)
X-Received: by 2002:a5d:5186:: with SMTP id k6mr9644234wrv.146.1637689599543;
        Tue, 23 Nov 2021 09:46:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637689599; cv=none;
        d=google.com; s=arc-20160816;
        b=k3RImvW27InihlMXZwYWx764dlXL0DrCu1f5Ah0ePew8MfP0JXkfbbj9t3sOFo3FuI
         C0vNIxIbCcExVxYSyymhpxW0DtwW7fEargT+7Sbu+R9GSAonSFrXmIfzTfUVgd53c/w3
         lU3ZO4eTHYq7bCBIkQs+RjWoV1rdKhx1u2YzREOqxzaLssA53msIVQt9tGThYzST2+sw
         bFjfTI3IqteGWsDkKZKeeGIE3GPr/4tAGc2UWOSl/6tmjyiE3RDpYh4zHtS/HCAT+YYg
         T2cr8qKfoBV9UxK6ItsANK+62aP2uTjoic5bJ8CBEKQFPBPKF5ltYZB1ei9OaGZJlepT
         q+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fT1se1ZMcem8yAzBEjkdVN6j0Sf1AV9hhBoZDI1TbLI=;
        b=E03R0wJg2+DSWvVyDIxPr4D7oSnIS6R1EMeoAp+9cGAadIc2aG2CXkmjifjs/stHRM
         psBXxjHeNyAywnQbefSlGkTPwm3hDUel45VBule5xv+9YSYiqdbhyhmT/RNJIF0Q6qwc
         CFj9RwiNmLf7LxQbKWPclcNykqRVCFRh67Ub42bIOq9G6V3/PpcVn3F/ViAi8py+uM6z
         ufm7BlGfI9G1D64dkkkx5lTEpBkKvjpnk/RXajvvU2ZlDbkd17N/MCOPbxOb0VmJkPW/
         vNABb+MJ2i3HvEV+uBGb4FIbJE/p3QwNY3tNatn9eJ6+4qlbiIJY1niT3KsDFblNH5tY
         CNvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNKQE1c3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o17sor1828330wrj.48.2021.11.23.09.46.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Nov 2021 09:46:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNKQE1c3;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fT1se1ZMcem8yAzBEjkdVN6j0Sf1AV9hhBoZDI1TbLI=;
        b=cNKQE1c3Zh+5SH7XWucI2xjibwXb6+C/D5pqVXH8t+yU1bR8a3+9tM0N2Rd0pm1udV
         jN0Me464rWrBP4XUTkuK9cJY6iTfNLi+1rx+/B2mIT5PQ7Uaiolrd1kiDVQKQuG20mdT
         LoxJxjcNz2q6bkY/CoZbuAkjUeCEhqdCWW6JB3PuV/t/3UVqB2PqBH/OQjlOSoh2Wew3
         LgofjTJhHkzpBwiEMB0A+SCJvzEL52MYc3bzJ6FyOvlQxJj12irBgqevZ97SoV5RuxEj
         rqIr17dcgkbl8p3gSPrlnx2ALWxpVaRazgs8sFZUIr6f04/wmO5xq6Ejxe8p2/SGFV/5
         wV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fT1se1ZMcem8yAzBEjkdVN6j0Sf1AV9hhBoZDI1TbLI=;
        b=FD/SCin1XvLcvAEnTspF80Y+t9kituMtxmJDB/4VZA0LPJe5TJpjjJEM1NKcTx1VQO
         KLn5mC1J1WTlqIq11/5puYgSvgQIiw8NOe3dTE4qSxdsuYcWP93e0XSn/oUtce0Qxri5
         Y/7AbTyW5kslO2iLQogSM5xKadL870mQbI1NsXw2rxIyhtyK/N3PfXZSbJq2Heg1xToJ
         Eq2liKCaE2dwLOqtbf6V6yO2PeKkrRSpXYNj0bq0PBY1LRk9Gwghrapg6YpjkJJOBAZs
         teBxix6Q27j5KpAYK5BcQHjkk98CUA3qJT95VYlP9OwIHBcXsFbx7D9Mf+ZB/868nGmm
         Ql3w==
X-Gm-Message-State: AOAM533o4Sn4dFUCXInrksOJVEmT+ZA1S7fip3w56SZO33tZeQYrMeO4
	yZxAY9qZ99ZRhAJUJifO5rzhDNYFxwkcfX+6bhMpAeYJ
X-Google-Smtp-Source: ABdhPJz1kidocrn9q9tH9wJTCxZW5yPi3cV9yWkePsGCcngNyFMBKlNGJ4tKvHK7WBeP1dQiTzBw0pH+82PDIRE6cMQ=
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr9539602wrs.263.1637689599230;
 Tue, 23 Nov 2021 09:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20211123171031.975367-1-peter.maydell@linaro.org>
In-Reply-To: <20211123171031.975367-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Nov 2021 17:46:27 +0000
Message-ID: <CAFEAcA8XMtAHKY=saAajLc2b03_PHGi+G=iioEpeetuS3Hh5yg@mail.gmail.com>
Subject: Re: [for-6.2] hw/intc/arm_gicv3: Update cached state after
 acknowledging LPI
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: g/0QbbZ82FdF

On Tue, 23 Nov 2021 at 17:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In gicv3_redist_lpi_pending() we update cs->hpplpi to indicate the
> new highest priority pending LPI after changing the requested LPI
> pending bit.  However the overall highest priority pending interrupt
> information won't be updated unless we call gicv3_redist_update().
> We do that from the callsite in gicv3-redist_process_lpi(), but not
> from the callsite in icc_activate_irq().  The effect is that when the
> guest acknowledges an LPI by reading ICC_IAR1_EL1, we mark it as not
> pending in the data structure but still leave it in cs->hppi so will
> offer it to the guest again.
>
> The effect is that if we are using an emulated GICv3 and ITS and
> using devices which use LPIs (ie PCI devices) then Linux will
> complain "irq 54: nobody cared" and then hang (probably because the
> stale bogus interrupt info meant we never tried to deliver some other
> real interrupt).

Hmm; this is definitely a bug, but maybe it's not the cause of
the symptoms listed above -- I've just seen them again even
with this fix. I'll keep digging...

-- PMM
