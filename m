Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp2322854wrt;
        Mon, 18 Mar 2019 05:49:46 -0700 (PDT)
X-Received: by 2002:a9d:5c16:: with SMTP id o22mr10272937otk.235.1552913386795;
        Mon, 18 Mar 2019 05:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552913386; cv=none;
        d=google.com; s=arc-20160816;
        b=REGY2ib2U0VUiKdpzFcorqoh3iSA9Op67OKEPULX99xE2Qk3NHq3PbeS/yPUZj/FAE
         Ppt80VorxqMLZUCWfv+UagDDWIa7wY59kOQwNC8upthn5oaP0X8cSfl+2JXOssNALSJb
         tmGKC/jNobERWr58kIqVVVENFp3MxkSwpSEXregu0rfYFruIiQ98WqVF/lknrH+jBT4Z
         /aKuqvVNtmDQ2lEAaoX3iacMjJVaIxB93RM6+CSqo+L4E8a7qiYCA+Ve0jlaNpOxmcyZ
         0bf0Ss+qks96g8iuZLGXO7RcMwJo1uWnWSoBf7ZWWgL42khgn9xPXPaxB+LVBX6UhTGC
         UlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oqscrhElas85VndUJL/902FSsmc+zNy4tH18eQFoyac=;
        b=IzMCsSqryhx5HQ5+X2zsf+HI60LqFD4q5TCAttQWn/FEfD6G+MM7qlwFbmt4ihtCy/
         IIgc3njfAJEfRxAgf+MKfkhyhahb97KPhYgs5sPtinYlzReznQvJGvubOxAWDX8XKUGq
         atWAc0lM0vVZpSqIKlZ9kBrDfLkXQr0dfNY9gTc8xp4QNcZq7BjktRwSrA+fgD7u7lWd
         st/SD7PZfrTLZpMs1Pu3FR7StcqkWNLrQkHVc3WPkLnSiP7oGQFPmAH5c67doKvJmwkA
         aMEsYhB9x7UDuiSTsGm9Djbdka7MHU3lZvgvpiH54b85IcisurkNXf/b1b/EgC5BvPs8
         /eRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RJsscia4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l8sor1601219oih.20.2019.03.18.05.49.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Mar 2019 05:49:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RJsscia4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oqscrhElas85VndUJL/902FSsmc+zNy4tH18eQFoyac=;
        b=RJsscia4177IADu/RNo0rhjv06tAqE5lqfE3SXyanjalvEFb5gH7hQhRok77ozLb0K
         Vnk+YiDXEbF4ZSUisKebxCdKSHGN1PqM6vexYn/Op0u4kyYNIllici/gHVcHKgz1MNqk
         8Z29BQh1whJRWYmN8RKW7oHk9iqZrgAASXkJEAJVc1YN2oA3bpIoZUj2DxO+4kPfWFKx
         TqaBsJEbGYaquYiMkw/MTGUVYyQZ/FNcgxzLQz5OHxNDAxNL9h8FwXmQEiv12puVu2aa
         fhsKp3HfsA+Xdj4goIp//iUoDXtYNFJiHfgrnPIWeTruUcIAe4svLlIH1LDYAkfoyMqJ
         BfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oqscrhElas85VndUJL/902FSsmc+zNy4tH18eQFoyac=;
        b=hWcrZvxmUsP1j+dwubK1u3Cf9ZaMOxK8lat1up9l7r0TaSrUQ0qCJ+EmUzMQcWejrE
         8o4Vbz4GVwpm5vXSzV5bOt/EL8bIEdx9/MMt7MLglaHus+KTGlr29S5N7ZA+yU5tRBAl
         TDGOWkG/oMgmAAO/f9g7YDtZ3zivPpr2jOlZEanR838vLxp+N4eXQCjTUfo7/VwTfLXf
         OatRI9lc0renyOTPol9gNS2IL9hBYsB0oV3gbnsrLA9MPB+ZDs9VlOtu65jG6SqxCrnO
         4B5sAH4Gpalwy4GYo5u1fPt799G67mKVEnOMiN80ksrnaI1xJXEYTQgKKHE1vp3z5vmE
         X0Nw==
X-Gm-Message-State: APjAAAXUseXLPd7nSGers8W+9yIMmLRTkn3ScoaF2PKlmXkCd2AEftrC
	iVDfP2JQvGcxfrCW+whIwQZ/Q5NPswU3BVQVHa6QI6W0
X-Google-Smtp-Source: APXvYqyY+zfEraspjSnXZFG0zhSDicPMRiSqZmr2KJsGh1Wqn/xPimByVhlZ/8pS5LVNlRc2GqRYGOQPTvaVTyxXVEY=
X-Received: by 2002:aca:4c88:: with SMTP id z130mr10085670oia.170.1552913386433;
 Mon, 18 Mar 2019 05:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190315143057.20165-1-peter.maydell@linaro.org>
 <c04c5c7a-f704-1c12-1a09-02f4a3db8506@redhat.com> <a2a1eb85-afd4-53d6-e907-368100357b0b@huawei.com>
In-Reply-To: <a2a1eb85-afd4-53d6-e907-368100357b0b@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Mar 2019 12:49:35 +0000
Message-ID: <CAFEAcA-DAHJP-cpQtb5_W-oHgJPLfN1B21MSp9iZivJyUvHRiQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH for-4.0?] arm: Allow system registers for KVM
 guests to be changed by QEMU code
To: gengdongjiu <gengdongjiu@huawei.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Eric Auger <eric.auger@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: BMa3jcX3wP2G

On Mon, 18 Mar 2019 at 12:34, gengdongjiu <gengdongjiu@huawei.com> wrote:
>
>
>
> On 2019/3/16 4:11, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >> Should we try to put this in for rc1? Not sure... Testing
> >> definitely appreciated.
> > You might include it for rc1 and we still have rc2/rc3 to revert it.
>
> why we still have rc2/rc3 to revert it?

I think Philippe's point is that it's reasonably safe to
apply this patch in rc1 (ie now), because if we do do that
and then discover that we have some other bug in it, we
still have plenty of time to take the patch out again
before release.

(If we did discover another bug in this patch in future, I
would favour reverting it for the 4.0 release rather than
trying to fix whatever that bug was, because two unexpected
bugs in the patch means I clearly didn't understand
the code well enough to produce a reliable patch. The cases
that this patch fixes are pretty rare -- it does fix a bug
but only in handling of some cases of debugging a KVM guest;
but the patch potentially affects the behaviour of any
KVM guest, even if the user isn't trying to debug. So it's
riskier than some other kinds of change, and on balance
that means that when we're making a decision at rc2 or rc3
I'm more in favour of just reverting it rather than
applying what we hope is a fix.)

thanks
-- PMM
