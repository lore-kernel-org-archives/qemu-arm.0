Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp850068wrt;
        Wed, 9 Jan 2019 09:00:05 -0800 (PST)
X-Received: by 2002:a05:6808:89:: with SMTP id s9mr4502299oic.131.1547053205090;
        Wed, 09 Jan 2019 09:00:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547053205; cv=none;
        d=google.com; s=arc-20160816;
        b=U2bqqmoUQ6mkTqQojrJtAiS6/7RNyrxOUBeSNEpq40QUnPPQbg5fRylUNayNJiGfaL
         vJBR4Nv/+MRcGhP34va3bM9OdptqOZcr4nHB86xYHfWoMBN760HKbvcZAlAx8wwARJt0
         x9x2rFrlKRM6TJr0kkTFIz4WV0JvHXp/6dPqAoxOpB20BI0x/K0DqOc695Ewh3UKvIGc
         1fOQdd74UeZ22gyt5Xl2BA7J0Mm0wRVZ+GdYaV2y9TX+shs/hrPcwE39MhZDpdI4ulaF
         uGrfUAI+9AJIQyY7tRwezMbx8F1wsI0elgqsySkW/44gdg2bQBpE1eoaXoXiRVrEMc+5
         VbIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jHhIrNCIBIS7GICTgXowySrYLtfNSMx8JMGNyH07KR8=;
        b=ZL6Bwo7hPO3QhnavmsvALT73UPiDV5CSuqcNrD1qyIEwBydsYM0b1I2vcSQFNZmekk
         nh+1+1VQ6pIgO6vrSg5IRJ62kH3ptl2UJUy0FTPc17DZDwYgzE1CX6/VlHJgXsYZE02T
         +AWjK/LBCYjO0qAEWAT2QIxv+FZ4AtYds5YSGAHDpAjgPDNtXGWmEktDhxmcm9zB3Dwn
         XMiUvyrp5P9hlrzCArw4gt//7nSGhiRsgYwFfKwcYVeLWq+XseDKFqcJ4aRxVqAjExvl
         e+wlhVWWxPcRtE7dOv8O4WFpN0uC0skyz2EZMX64B5po4d11HAead+WjA2W07tAxw+A6
         etPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iYAdLnVt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h5sor39022814otl.31.2019.01.09.09.00.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Jan 2019 09:00:05 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iYAdLnVt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jHhIrNCIBIS7GICTgXowySrYLtfNSMx8JMGNyH07KR8=;
        b=iYAdLnVtqs/rP2PKDrNtMOUOB4BIIsBQW5xaFri7T5ehO5zRvjkrLE/k3ux2dJlCOT
         TRq9MRmDfD+pssRuWjH1JKrx2nFRH6NfytjdkIWjFYdyvN8fZPUC0omvMzjQM3iTveQl
         4VA27lBi8D0Ua1c5eTw9ZaGe4K0qq4SuGHbmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jHhIrNCIBIS7GICTgXowySrYLtfNSMx8JMGNyH07KR8=;
        b=tEzHqkJdHzSYcXEV8MPLypUY6BojJGuegmXVc4ijj/3EBk8t5TEaoXNRY3FmgLm4sK
         hKKEQPP/e+YWu5MLD4ggGT8yKwDAdepKczmyVe/mLRVaPtGGPMo4aLXxOUWsIPIDmslD
         oM65Y/MC+Mgg4VzJggJIO9LKATQ/Sv/4fEJXJCB3frwJW8ZPpZe2c16FbxZvHnpYpBZq
         kk86CqMpy3+tY5yTpWiUjMF9kwE55Z720ZpMWx+2jrweWk29OFcqBNTGmku00OXQ9q0s
         N7yTcigIiDZey8ixJM2zUVwAYZ5GNeSEo/NXii0e+LLfWgH17v8eWQjpxzwoEllsviRJ
         tXqg==
X-Gm-Message-State: AJcUukcmMANkqd4U5heEtwR9kCM/covSj+iA1XA9AgbB6Z9C6Zzr/Wxt
	9W6tucdyTEro7V3MroZ93tnmvuRooHswmn+VMCaqzmNI
X-Google-Smtp-Source: ALg8bN4Qr3uwq2V8ztFuIH1GlRsm5/cCsHaaJW+JrmFd8ozIIsHQNEY543U3f2+bVH+vXHDk44kgIAYONpk4ncg/R3Y=
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr4592884otc.238.1547053204727;
 Wed, 09 Jan 2019 09:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20190109152430.32359-1-agraf@suse.de> <CAFEAcA9zugZiWirk9QjqmAO9QKhLdCAWuG1PX5z7Nxm4O69aTg@mail.gmail.com>
In-Reply-To: <CAFEAcA9zugZiWirk9QjqmAO9QKhLdCAWuG1PX5z7Nxm4O69aTg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Jan 2019 16:59:53 +0000
Message-ID: <CAFEAcA8Xzi8GjzUtzxbFzxdCS4kn0Cps+_bF70ZS0KnH0W8SvQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] target/arm: Allow to switch from MON->HYP on AArch32
To: Alexander Graf <agraf@suse.de>
Cc: qemu-arm <qemu-arm@nongnu.org>, Tom Rini <trini@konsulko.com>, 
	Michal Simek <michal.simek@xilinx.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	Stephen Warren <swarren@wwwdotorg.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: iosz4AM3g2Ig

On Wed, 9 Jan 2019 at 16:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 9 Jan 2019 at 15:26, Alexander Graf <agraf@suse.de> wrote:
> >
> > In U-boot, we switch from S-SVC -> MON -> HYP when we want to enter
> > HYP mode. This dance seems to work ok (hence it's there in the code
> > base), but breaks with current QEMU.

PS: it would be helpful if the commit message said how u-boot
is trying to go from Mon to Hyp -- some ways to try to do
this are OK, and some are not, so whether it's supposed to
work or not depends on what u-boot is actually doing...

thanks
-- PMM
