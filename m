Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5386131wrv;
        Tue, 6 Aug 2019 08:21:17 -0700 (PDT)
X-Received: by 2002:a9d:5788:: with SMTP id q8mr3389896oth.237.1565104877316;
        Tue, 06 Aug 2019 08:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565104877; cv=none;
        d=google.com; s=arc-20160816;
        b=JZ5m85aLzowacYTcg6PsfDQr98JWzfwnKvhoxt3SUbfzD6lO3RWfm5VtbtCKZAss0x
         znz7a1RU9izwTIHSWvpxeUGNzNdXWNX4InZZvOnEj4R9n8zfLUbRlL0ySlwLRtNFA28V
         hR0XnQ/dlRik+NZgnCO9mMOuU/BU6inbUim8OsWxOCUt2BogUNA+S5DCBFs41ExKRoUU
         +HQxY4sVtO9qYmEBV4u4VyJ+qTB0m8h0ee3L59yrGiTBu3eU742z65/J9bBXfw2EEBWp
         zsRkp+abj3iMXyo3iFXDo6TLQQ+lhg4iWQnbPE9nODIKsKhi54a/Fv3sOPCyiA8tZQk8
         oB7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WxjTc2EKFvHZKfI2OePpAvvlRjl1puN/NiojgS9o48s=;
        b=J1raU1gSEBkdQgnFsvLBysebmLzyWyQ0lHLz9/1c0/A4mOFSA3gjG33GY+o/WJcbOP
         LbzsbehoWCC0ELVpNaFL0/uzWYTPG8f/QJbaqmL40iU5oG0ijE86EvervjFT6CAb/o3P
         +96szyd/y8T6QDNfVH1tzdLRkaoUfnGccHCqLdoRWzA7JkbogE8iC9mmFoYkt9uzmXDS
         sfs8cXHjgXs3JTiui0+dmjhOJvGx2Gf/7x62QU3xwF/KSVVInrnGV41pTO4Q9cjP/VZy
         StGLkXMZFp9ZYPIHz8Ocr6c30zShGd/BpSuBkJhBpFJLOFJzd+FJRxtDgYmIJimg0eDe
         y36A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dEiJfDx8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z16sor44422868otp.77.2019.08.06.08.21.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2019 08:21:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dEiJfDx8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WxjTc2EKFvHZKfI2OePpAvvlRjl1puN/NiojgS9o48s=;
        b=dEiJfDx8aidM4i7wTTN6Nt5WhA9Sbx1QPm/OPXskk9U+43+v+IpwBPPmTbzpiU/ds9
         vkBmlf61vtoMQPoebcVcT4RoZr3cCyQpTdODpyh9MhxftkU7uwtWF/7atvwqueQh69J1
         fyH6GrW1BsZsUMC9MTC7NcdZKcES8MZMUdtN03GhqMXMhmCjDKs5M/psy8APWHbi57Gp
         mxXg5kZQYmkV71C/1NexHoX3W7HGCB4nurxTPY6vhFWm9OFA/7g4xgLstzT3RfxEs7+p
         85B+SGeUjDmpyDoVkWRssbNwUS53Caur+oKW15pLochrsbyf4sviixjY3gkMmJhdRQ79
         sDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WxjTc2EKFvHZKfI2OePpAvvlRjl1puN/NiojgS9o48s=;
        b=pM45lb8jV3i9AZtIQ/xJ9dt/TgOi8l4nrOm7DVdkOVLfmShfaZkKfYMJh0AzQ+9X9i
         GiPSmKROp220QGH1WJXIrgxt9kfzPFMBkSYB4gKXlQuIqzKFqWJLFSK7LEjAnXWUiYBY
         IeUNtcw5S34r8CSh5ZUubvzqnbqes9OMInNm6dR+AsmdOIGo1t8auLJ0QzikR3q3oCx7
         Y4M/+w4t4HyFlneld8GXUld5rNRt4MDYHQNtay+Hg/I6y3JrWtl9qnbx35iJ9OrZuIXZ
         NtP5XicGW1PzzA5C9WfQOX7CQ7haEVVvGmHilh8ekrP5oqnuZPnOTkBtikGjxa44aJAq
         i2Pg==
X-Gm-Message-State: APjAAAUtxa8NZmyEevToATLqYnghG4+fWSnWNwrg3BKv7yIAyYw5HZ/N
	dnEhiFUrinYavwnPyygumIHvkEyyMUhFIHSNxgw5y103
X-Google-Smtp-Source: APXvYqw9PEwJ8131L+jftg088JWaP4/h4dplNATFRSjOkPtwTRmVEsQAr4UXEXgNFd3UZdsz46lhMKuLidQK8TXg+t0=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr3886322otn.135.1565104876928;
 Tue, 06 Aug 2019 08:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-7-richard.henderson@linaro.org> <CAFEAcA_kmuX6bxR50eU_3nTdRcjON2nVTqVWiRamSRe6jui3ig@mail.gmail.com>
 <09b930e2-0a92-25a3-4e26-8bea1f437039@linaro.org> <CAFEAcA9yQQSYnwEeSNbx4P94deuG5v5fKs7gW4VgG7LFzBX03w@mail.gmail.com>
 <92a7e54e-678e-cf4e-fadc-373e1bd6a41b@linaro.org>
In-Reply-To: <92a7e54e-678e-cf4e-fadc-373e1bd6a41b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Aug 2019 16:21:06 +0100
Message-ID: <CAFEAcA_oy067xK9p51cKwRDcCVTaj2JuqE+11jLS5L_gFFyzrQ@mail.gmail.com>
Subject: Re: [PATCH 06/67] target/arm: Introduce pc_read
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: lZcc3WWpt0Fa

On Tue, 6 Aug 2019 at 16:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/6/19 3:00 AM, Peter Maydell wrote:
> > Renaming pc_next would be a cross-target change, so let's put that
> > on the shelf for the moment. Maybe just put a TODO comment to the
> > effect that we could consider renaming in future ?
>
> I wasn't suggesting renaming the cross-target variable.
>
> I was suggesting shuffling around the current names, and using "pc_next" for
> what it sounds like -- the pc of the next insn.

Oh, I see, so incrementing base->pc_next after we load
the insn? Yeah, that would work too. Though it seems a bit
odd to me to have the target-specific code modifying
a field in the base struct -- that seems like it ought to
be purely for the generic TCG code to use.

thanks
-- PMM
