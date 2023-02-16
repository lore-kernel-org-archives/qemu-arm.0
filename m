Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp660293ejb;
        Thu, 16 Feb 2023 08:30:43 -0800 (PST)
X-Received: by 2002:aa7:9f11:0:b0:5a9:c2b0:428f with SMTP id g17-20020aa79f11000000b005a9c2b0428fmr650600pfr.31.1676565042993;
        Thu, 16 Feb 2023 08:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676565042; cv=none;
        d=google.com; s=arc-20160816;
        b=R4MSwcWZhGFjazdtM49JLU4NUAN4XmRlm6XB8ReLRQgIXaDPah+wT6xhaH9hKBV20I
         ++wmS+c30NnQ1Jf3LqEqgSy0pxdDmimZC3667BX5Zmiqe3DXNvp00THrdK0hteEp3T88
         YHhp3L+bQjONmYHkllESrCZJ/OoTXDoHYQIiBzQ6VRvjcUYtewMCkNWYOk0RFmTM02VX
         lqn9VwfRd2vY52TREDSYpjosM/YwzlGhOqC4qMc272APOtZSR650w/6nOmhpwRoq2szV
         6hjw1YpyWZCa0HvxmwPqbuSZlK2OR+NHj6hAn1yBl9acrr6a5iRN8144ixIUrXlWcaSb
         DL0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jkstSIRlMtzxcNbVMLvyxGOcycN3RhvLxNo5X3UIhHk=;
        b=HMcIUt9M5HDtJ5zrNCPqPB8qybJGgRKkA5l8/A9ni330IoWaD4NCvuJmN+l/loLVpT
         Sv8W39PH41xR8o4Gsd7nU+aKuOBHncwFIMwv/Q1czaYwy92UAdokWfKLS84/A9gJFjsv
         6o33RG050buG8qS4fMJMWrZJLckoBgQbLAWp8QJtiPcEyRsUovaWlQl+yh5+zBMfZMny
         6kNO6VVoaCVFDRRoQJVzxkfswXS39pc/sylsNye9ARIzxh/8NoFHxZvdRUdGK0YQXQ8Y
         sPyZfd/qPSoVJKpJ1kTw7YcO3SinKZzVQTwBSahdZFPHzmAl07FbfElA3phHeYpd+vVj
         uZ+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DOY3NjhD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g20-20020aa796b4000000b005a8cd8db041sor916979pfk.14.2023.02.16.08.30.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Feb 2023 08:30:42 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DOY3NjhD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676565042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jkstSIRlMtzxcNbVMLvyxGOcycN3RhvLxNo5X3UIhHk=;
        b=DOY3NjhDZ3mh4skO9qx2iTW5ZbqEW2W52sI4EbZ1j4Asd2TFIVF3c+mDmb/8nF3PEh
         0YtTiJhRQstGiwASmFkVxlxLpX2yLXX08Ga+1CvsomOCVN5KWRRnx3MjpxejS/yemMf7
         BHv3yA5BHeum3rC1nGSVlhua2Cn6g6a1lb/SUX/Z+3k/3M6EmsaX+1CnfTyhqZsnIuFt
         QoGLSsSP0laX3zQcyrHdQQJH9RMVjkHuRAmAVCWCtD1LNujkEX2+HAosBRzEHqAjkvap
         hYEarz/uFwddyk5eHANMZ8qCfgkMW7KWGS9N5C51Ev709oOjfvrKP1g8rF7mzcv2OkAg
         Vd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676565042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkstSIRlMtzxcNbVMLvyxGOcycN3RhvLxNo5X3UIhHk=;
        b=dYdLnpNQDlaLRwpkkJg5QG88MRIuUjU6TCwHPP4KqK6B6Nwx+yVIvsr8LSUzc15Pt6
         29bFAn/zrl28mCRcv9kaDdeBczFNBsjokev1ERVw8Fboycq8o3R24W0USbEjCwPi1g33
         rMtkGnJdRQCKG+p4oQtV93DcSnIKwJlqTFeGtOBmgFboEZZJGsVhTrPVKbTgjfPV9HTB
         voQRxR+L/blVD7oYHJqpwdao/NB+WC7yiBy77Dn1vPwImTlleR4rQVhUeKSAxNnSmyM+
         TYrU/fETt7qLmA4BQPACYvNvmlfVYIL6QbtvgieexkSAH3uH8dc2mkI0b6fX6gm8DNHL
         qrNQ==
X-Gm-Message-State: AO0yUKV8hl7bY0zc5ETSwcYO0Q9w8Ejm9X60Mx5DqOB9Z0usvuLRgYmx
	GUOBlNoE0nJyXPaXXVIGtawpZs5Oo4sexTXPO/XJydTw
X-Google-Smtp-Source: AK7set/mbtBOI/icRSShGXKwmOufZ0yYtIxTT0QNUZcphHv27AtXWyXMfJUoqPnGIOtQkF3q4SNjS8ZZXCEbHrLJeW0=
X-Received: by 2002:a62:840e:0:b0:5a9:babe:6cb9 with SMTP id
 k14-20020a62840e000000b005a9babe6cb9mr182189pfd.48.1676565042406; Thu, 16 Feb
 2023 08:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20230213202927.28992-1-farosas@suse.de> <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
In-Reply-To: <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 16:30:30 +0000
Message-ID: <CAFEAcA-pnE4rg5KrFikZ2XVzy9OYiSxrco4G18GGk12CKec1gQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 00/28] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: zm2JHis1ErAS

On Thu, 16 Feb 2023 at 16:19, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 13 Feb 2023 at 20:31, Fabiano Rosas <farosas@suse.de> wrote:
> >
> > Hi, could someone take this?
> >
> > I rebased and put the two series together to simplify. I'm keeping it
> > up-to-date and tested while it doesn't go in.
> >
> > CI run here: https://gitlab.com/farosas/qemu/-/pipelines/776103500
> >
> > Based on master.
> > Supersedes "target/arm: CONFIG_TCG=n part 1".
>
> I've taken patches 1-5 into target-arm.next.

I've also taken patches 18, 19, 22, 23, 24, which seemed like
straightforward test fixes.

thanks
-- PMM
