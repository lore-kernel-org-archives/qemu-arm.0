Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp403860lfj;
        Fri, 14 Jan 2022 12:56:58 -0800 (PST)
X-Received: by 2002:a05:6808:8c5:: with SMTP id k5mr8714931oij.62.1642193818540;
        Fri, 14 Jan 2022 12:56:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642193818; cv=none;
        d=google.com; s=arc-20160816;
        b=ExyenF4PyVyV50d9lP34YLjMrd2exAnac+qj231ZMxJnnIzbzzzCp0hqgehgt5dQkz
         WW7Qh6nWnC1RwELxKJEXy+CBwHNe2quq5DmbVVFKcDVKdiOJQ+kvMmB6Pf+U9ASaZy9I
         D+6A1kowosJtQx0EwG6vP3HCXFxskFE6g1Woopnr4Mnaoqc3ysOy6WRxrfz/l3HLiUnL
         R9XJgdZeQXK5g+Fs0a8fn7HFQjLY+fB4V9ES97YbWU1BpsUDdC43QkHEXiVg6Vh07ruu
         BoI0wtQMt/z9Vs0Q8o4JME6yBGupSjiHx7de1T8Yp/+ynlDQ1sfjifVqIVuAAT/2rQfA
         V63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9cyEBUzATocJv7ZX/1lhYMaB4y2O9dXDe2JOA9IZXFc=;
        b=AkHmMTRnQCeyaxyagVCvn8XkezTgjMV3hw3tYyJ43Dvp8EM9pyYRl0lWKTlteyjxyQ
         9BQ3nq9GlJaMbB1429JPPXqtwsjn+2/npItcRIW8+oNXsAkF6wEryEcWI798foZl8UKi
         DI7K9QcPJTU9omQWXLRoZzlhQ5Fmjx23asTjsFnDPHEmIh3W/tfvQJhpOrsn9/qdpYEe
         SlRgZHlqapJnn+yqvD9Kdwj9Gg/DVegN/9823iIGWKxdNKQkIUEA7xavVHRsvs9k3/fm
         MhF0X8lYe7sXuby2mla76nkde2MdDi4iK4M8KCK/xPjSpyKly5LStJmr6ES3bn4htwQI
         bIIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=pS7iLp4A;
       spf=pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=idan.horowitz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <idan.horowitz@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 99sor1461082oth.109.2022.01.14.12.56.58
        (Google Transport Security);
        Fri, 14 Jan 2022 12:56:58 -0800 (PST)
Received-SPF: pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=pS7iLp4A;
       spf=pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=idan.horowitz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9cyEBUzATocJv7ZX/1lhYMaB4y2O9dXDe2JOA9IZXFc=;
        b=pS7iLp4AXuX/U1PANWMAsTJ7Lqe0D2ILlOjeCRLQpvGvC7yuVMl3P/27t5I4wfjUzo
         F81obfnE9YMInFX85w8V7W4BDL8YeTYj7u7TjZgjXfPRQxrIPbgktTvMsDIMnWyn8oYD
         tQ4LNcNYDuZmzqJzsYriiZTjxC8CFqSO1/XgKPtgUO9qYNPDud5GT9mhIjm+vp4LxGE9
         /dmeXBsLRZRYJZqHD5Yh1o4k50Mzfx4UrunbrCj0IcyQCr9kEYX60eZ+xNxaZ/U6vUzF
         Zyeg4iZA7qASxasSxhcqQpb2MRL/+8L04tn0PDvPp6bVsm+M4eUl0cytsWcw6HHPyhQY
         TpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9cyEBUzATocJv7ZX/1lhYMaB4y2O9dXDe2JOA9IZXFc=;
        b=gNLHbXlWk0Ba6e34+IaOOiWlDu90yGTScmTjwLz20ewTZqhrBMz9eBohwlspvdDUUM
         aCN4uvb6YTUWHqpRF6HtBfHnqU1HXER9wptfflGwrWbuK3c+yftIZRgX+1Jn3r8z2Zmk
         /UBYuOq/7okVfMZYgC/WKzubPDKtwwFvRnNejTjEaxnu1EkZb92OIY+fZJUxUAc/qczI
         dK7vckTZk6kSol+Ixwgg83uMAfjqqXUBSW3fvQprus4cXatjAM/ihy8WnSOg5P7ZJAfb
         U+ZN9hR4+w6jcdONaqOVATGe8uxFGzQXOCPTaHkDFfSZoqZ8iQCj37fVx03j5vuvE605
         UNkg==
X-Gm-Message-State: AOAM5314gBovbMIbWwWOtwR9kIksr+JZjpyJfcFmIgt5qohaPXa8AR97
	dAg39tv5sGMlQa1rkZizAfhb8b/y8e3AkAdOEvpXqG2ExMdtXg==
X-Google-Smtp-Source: ABdhPJxniehsxMgrngi34GSfqk8XAa/CW7kiwg8zjXEBSeVMFJyGx0qmtxP1pe8lJznauVcboeenGNGmPO1ZMRza0Zk=
X-Received: by 2002:a9d:27c1:: with SMTP id c59mr6131536otb.150.1642193817521;
 Fri, 14 Jan 2022 12:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20220110164754.1066025-1-idan.horowitz@gmail.com>
 <87ilum8gfp.fsf@linaro.org> <CA+4MfEK8nJLPd3J7ENG52nXkZoeqhKP_zu7NBfFg-SC-hQRzAQ@mail.gmail.com>
In-Reply-To: <CA+4MfEK8nJLPd3J7ENG52nXkZoeqhKP_zu7NBfFg-SC-hQRzAQ@mail.gmail.com>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Fri, 14 Jan 2022 22:56:46 +0200
Message-ID: <CA+4MfEJyB0T7SLLbXXhNk+JSVxSJk_QRmOsvUpoZi+v0=+sX6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] accel/tcg: Optimize jump cache flush during tlb range flush
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org, 
	qemu-devel@nongnu.org, pbonzini@redhat.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: KOMRwLSZXVph

Idan Horowitz <idan.horowitz@gmail.com> wrote:
>
> cbnz     x9, 0x5168abc8
>

I forgot to include the addresses of the instructions, making this
jump undecipherable, here's the snippet again but with addresses this
time:

0x5168abb0 movk    x0, #0x0
0x5168abb4 movk    x0, #0x0, lsl #16
0x5168abb8 movk    x0, #0xff80, lsl #32
0x5168abbc movk    x0, #0x0, lsl #48
0x5168abc0 mov     x9, #0x64
0x5168abc4 str     x9, [x8]
0x5168abc8 tlbi    rvae1, x0
0x5168abcc ldr     x9, [x8]
0x5168abd0 sub     x9, x9, #0x1
0x5168abd4 str     x9, [x8]
0x5168abd8 cbnz    x9, 0x5168abc8

>
> Idan Horowitz

Idan Horowitz
