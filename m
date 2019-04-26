Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp497855wrh;
        Fri, 26 Apr 2019 04:45:49 -0700 (PDT)
X-Received: by 2002:a05:6830:1115:: with SMTP id w21mr27967583otq.179.1556279148982;
        Fri, 26 Apr 2019 04:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556279148; cv=none;
        d=google.com; s=arc-20160816;
        b=LWU3bFMfbmdEgrb895OK0wAta7iFmFUL03Ue+zk60dNpNSSrJ70oYnB9mva7EcNFoM
         zsd4hKktuFcnJ5GLruOFDXKzvBvQCLe2T0DxfhRe/So+GZa61EMoxgGVoCAYfmeoXcEc
         7sURoLtd+Yu117ifh/PIJytCql1qHhZzuqrP/TB1Yq/ljFG8KgPa6Kf8UuhC7Fuu8IQF
         fhunxDeKLgaJX1A3l4TbjHdY0wq4LNecuv/xumNWPR+0cYRWDEFqnqVJFGS0EqBVN7No
         l3IjBWKrk4puLZ1DAKocA1PTnzGXIXKwOMLCqN3sWX3fb3Y43QTx+EZC/c081vLGTJKS
         m2vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m7BZyzZEm1Sa8d1x8Kn6h8VRaLuD2mj6Ndp0Mi/JUHs=;
        b=jdzgrvvoxxNNo0OImvAVdjHQCwdqi7oPScuLlN7s1MqXAcdtLRBWdNUS4iMSxPIsD8
         2eq+mklQtHbdjpPqi2kbC5ahewGk7KAhm+IMHvWx9lxrn+N4TeFf96kezJCOcy3eBI2o
         9teYsDSLoLy/U9MtJ/pmVfhgXOM93R+BPYmQ7ZJuVYVFeermuH/fcSAklj2k6TWb4Sgg
         0gmZl4J3F6iLZsbQ4EPKptrzl3NH6Iy2A7ijWXlFpnkSQM97EiyCfme+BEhNKwq8SKNQ
         0PkLow08/O2CCQU+BL55uM6LBsJFwvq79n3XieewQlbZbQmw4slz5tvL7YqC0QsByrro
         7V5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aJlwDUpl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n124sor10951659oib.60.2019.04.26.04.45.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Apr 2019 04:45:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aJlwDUpl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m7BZyzZEm1Sa8d1x8Kn6h8VRaLuD2mj6Ndp0Mi/JUHs=;
        b=aJlwDUplnPOieEl6zfs52jk0/IGfCQ7N3PF1Q+lAQ0HOlCErPlxC489nHk+Hf2y74g
         h8yuQHlOpDpg9VeKxxSJM5jBxY+qAjG9mMPbLMpfBI3fQWx8JwXvm5UW8lIgZqh/u0hG
         R1BHpyY/gxAGTK98rzB38DFX9x8XrqNmWWg+ScOTLk0JD0ZDAQSuGu3oU3Sqx+Rmglmk
         0URPZiCAKq/rAbAiJEDVtxmGF/blaYIGvTW5c+T+2kePEwKwuAFWcxw/0/Qj1PCoBSwE
         ibEHsxuqCGyHa4V0rsrkAxDpXf0aztGMIFHLvtXhiE/X1Ztlo13cv2/KxcV7PvNUM37J
         Vlcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m7BZyzZEm1Sa8d1x8Kn6h8VRaLuD2mj6Ndp0Mi/JUHs=;
        b=mrNl6Yhf/8122uvxMq7MOFp8ZvKi2gI+PBGZHqOJi5lZzpDyw12Ah0MfNUwKAh9qw3
         kM8VzuRSknYuaESC/DqqU1DM3WVNFgDRntZfMs5x2dXz0TtpQwwx3QHzD5tIj45KMUNA
         X0Sw2x/+zdIt+X4N/+bSaKK5K/9kifqFgcAAXJgktsgWHKotk4OQ2kyV9qmf7akFuiPM
         abdFyWu6ne34xCsuD0D5mn42Yn9hL7SPnNlTAKQA7S2SZuqiLEwu/PU2NvkS4yHL2qB6
         H2Zr2mXZaBpi0N/+F2w6CwYi3g0zQRr4z9oSvbS8AkvgSSkVOQM3QJBKVVaYgaeK9cYm
         2frw==
X-Gm-Message-State: APjAAAUfTDxTCMii3C7kG7dPwOK9Xxc0blLPaSPURH8Ux9DEChlksaNG
	b//7EbvisEoXt7EKEllycAcpN+kYRhXBgi92jHKLVwJxu88=
X-Google-Smtp-Source: APXvYqzdFU7FLe9mstikFRuLQZPxOGasyGi18lBVHM2byTosx7R6I6sPFObEJBlsIDLwdG/e6iB3JckEwatzDqJ8X0A=
X-Received: by 2002:aca:c7d3:: with SMTP id x202mr6143556oif.48.1556279148335;
 Fri, 26 Apr 2019 04:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190103144124.18917-1-stefanha@redhat.com> <CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
 <62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com> <20190426091702.GA2071@stefanha-x1.localdomain>
In-Reply-To: <20190426091702.GA2071@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Apr 2019 12:45:37 +0100
Message-ID: <CAFEAcA8OVKO087uiNvwDGObiaxHAPYHwoXLEN1t5Y4v9B43r9A@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] Revert "armv7m: Guard against no -kernel argument"
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Jim Mussared <jim@groklearning.com>, Julia Suvorova <jusual@mail.ru>, 
	QEMU Developers <qemu-devel@nongnu.org>, Steffen Gortz <qemu.ml@steffen-goertz.de>, 
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: nwHDg5q+E7pY

On Fri, 26 Apr 2019 at 10:17, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Thu, Apr 25, 2019 at 08:07:06PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Previous to this commit (v3.1), we have:
> >
> > $ qemu-system-aarch64 -M netduino2
> > qemu-system-aarch64: Guest image must be specified (using -kernel)
> >
> > Now (v4.0) we get:
> >
> > $ qemu-system-aarch64 -M netduino2
> > qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1=
)
>
> A user-friendly error message is needed here.  The check for -kernel was
> too specific and is not desirable for microbit where we use -device
> loader.

It's consistent with how many of our other board models work.
If you try to run them without providing any guest code
in any way, then they just do something not very useful.
(For A-profile this used to often be "die with the 'execution
from something not ROM or RAM' message" and is now "just steam
through executing garbage and/or taking exceptions in a tight loop.")
This is how real hardware also works :-)

(Strictly speaking this message appearing is a defect in
QEMU's emulation -- the 'lockup' state behaviour is architecturally
well-defined and is supposed to cause the CPU to sit there doing
continual instruction fetches from a specific (non-valid) address
until either the system is reset or an NMI handler kicks in which
might be able to rescue it. We don't bother to emulate this detail
because lockup is pretty much always a guest bug and the only thing
I've seen using the lockup behaviour and expecting to recover from it
is test code.)

> Old boards probably want to continue using -kernel.  New boards like
> microbit may use just -device loader.  Perhaps there is even a group
> that wants both options.
>
> A solution is to introduce explicit checks so that we can tell the user
> the appropriate option for the machine type.  I can work on this if you
> like, but probably won't be able to send a patch until Tuesday.

But it's difficult to tell how to identify whether there's really
any guest code there. For instance the user might want to start
QEMU, connect via the gdbstub and load guest code from gdb.
Or they might be using the generic-loader device. Or they might
really be using -kernel but with a broken guest image which doesn't
have a vector table in it, which will result in the same message.
I guess you could have a heuristic for "if an M-profile CPU is in reset
and the value it loads for the starting PC is zero and the gdb
stub is not connected, then print a warning that the guest image
is missing or there's no vector table" but I'm not a big fan of
heuristics...

thanks
-- PMM
