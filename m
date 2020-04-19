Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3049584lfm;
        Sun, 19 Apr 2020 12:58:18 -0700 (PDT)
X-Received: by 2002:a9d:2186:: with SMTP id s6mr7296279otb.339.1587326298825;
        Sun, 19 Apr 2020 12:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587326298; cv=none;
        d=google.com; s=arc-20160816;
        b=ffvlmsjwKF66ydHwMf5t2gpoXbTO0uljN+aDTvRH2L2kheNJLWrThtaxW7DUmwYyKP
         6YTyqotpW+b/it7QVQqWX9rCpQ3cPVgwSHWLoJe6Pjk5JivN4+mMXKn39s7IWPRo6F2X
         7E3eMEQBTZr8835bwmQT5O1rIEK7401ZNM6KIXRT8joKBwCGXkEbYw12JFDpFcPbwhVE
         Sn3lASFf8TeafbGcXrROlxTkMR1mmbhur+hC1C31HnYSmLWUSjX7WmGARs9xCcPVRsfO
         I5rS/lH9EkERQRWKJ6SecvkR6zlnQvi/H1yKNJ+3zo1x5EzVKlZ8NWxCkHD6rHIdJKkV
         UOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8sgZNtHLVvuYw+5lDrqsN+Jm8FYYVijiJfjS9qHlDxA=;
        b=BhmfaqxDKVJ3nLiIPb1SsAymBXyzJrnHSksGtsWbDpCxRqHi7Zy7haJ+ibQFiypfyv
         f+dHVz9dz0BjoGBtwlKQ4I09S6srdsTZQ++D5+JPMHsBQ9o7yz1ntnJsUHt1QPryEfBK
         SUG4GgcYKJmCXjyfL0bmcHWpEIb3eoEtZBz2sgIHCMvBYlrVZdh7dVWGnlMApNaGqk8y
         yEZWg7kXIlU87DxKko22Gtg1O3upt7b4Xodh9fy+wDyl+5p9GJ/Q8qSa742S4XtguL9C
         AazPgOBgG7phzSnh1ni4vGbtoOf6WP5u2Z4lnROvv1pFqjzSplPX9XA/NG+G5fCaYG+V
         waow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tcHo/oAd";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e13sor4997767otk.144.2020.04.19.12.58.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 19 Apr 2020 12:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tcHo/oAd";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8sgZNtHLVvuYw+5lDrqsN+Jm8FYYVijiJfjS9qHlDxA=;
        b=tcHo/oAdo+AaUr/nRWts65oNLNMeGWd5AIknQ0t3HEnEAdV4yG35Kk8yjSb3asyjWa
         iagFJhcl1bkDtx2phWa4bucjGe/x7IzojSIOvM8jTLUqVwfUMlExGIBFEXmlHGsx5Sdc
         CO+HdMvFiAxM+HfKBqJRXPupugrFmD8mF1GUWOmjS3x5pjlO0nrcT9m+kuxBgKZwxu7X
         pF4voaq7tIFkH+fvgSWGfwtka3hrMn/JXpnO+mXL+Heas4AHAfvarYypkXGnYplSyB7B
         zBpagAXgaVlLFQJ/KEQ38PyTCxL7tZBIdN1+sj+9XuQ5h1duPcpAy/N07H5U1wKe1S2b
         s9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8sgZNtHLVvuYw+5lDrqsN+Jm8FYYVijiJfjS9qHlDxA=;
        b=um36BsUfs+yUpk/y0pWcjJ/KSb+ZtXvbeuL+p3Zq4J8R/QQs0O3TpT7xBL1s+3zxsh
         D4TPX3mSKLmruRoVGJrqcfU1bALZ+qIsvbpssfdF20Pp2M9XGkHPm89TjR20R7OmTGID
         y8jThIm4i5mBtet0m9VnLCy8ber+/YGOdASUheFoYnXannyc1/HgKo5XRP18wJHw0DLC
         FfqG5yle7UxFjhNf4ndQu1JdzW0Xldq+YdrJxZGwmLNNMUo0cK94qjUaIC8FApOHQmiS
         /jqF2U/vW+Dbc4AbqSRluvPBb+pC2nJyewkYKFcDuMn9X44SsxBYUWF93ZrXnNmtrISI
         zhHA==
X-Gm-Message-State: AGi0PuZuaQ1+xOKJXwhXsVg5m+LeZTVPMHNaxjm+uyKfD9lV1b7uwrK2
	YgKVZre2Kme+08Wwf+/OY7DzmdfI9fsU2Z6oq6sXCsK9
X-Google-Smtp-Source: APiQypI8UIJka580eXEMW8htEkYmryhOVDrQrkv7Gcep4mnLZqyA9aHRQgiiEQiubaTRr7VBz+Gkb5XrWvUDV5JbomI=
X-Received: by 2002:a05:6830:1e4e:: with SMTP id e14mr6978758otj.91.1587326298321;
 Sun, 19 Apr 2020 12:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200316160634.3386-1-philmd@redhat.com> <20200316160634.3386-2-philmd@redhat.com>
 <cb3178f1-5a0c-b11c-a012-c41beeb66cd2@linaro.org> <3dc0e645-05a5-938c-4277-38014e4a68a3@redhat.com>
 <f4ee109e-b6fc-8e1b-7110-41e045e58c30@redhat.com>
In-Reply-To: <f4ee109e-b6fc-8e1b-7110-41e045e58c30@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 19 Apr 2020 20:58:07 +0100
Message-ID: <CAFEAcA8z5t__ZQQSqx88nMcC26SHowa3AjtDaQQFaPn-p-FYYQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/19] target/arm: Rename KVM set_feature() as kvm_set_feature()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WYMvcAQRoK2P

On Sun, 19 Apr 2020 at 17:31, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 3/17/20 10:09 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 3/16/20 9:16 PM, Richard Henderson wrote:
> >> On 3/16/20 9:06 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> +++ b/target/arm/kvm32.c
> >>> @@ -22,7 +22,7 @@
> >>>   #include "internals.h"
> >>>   #include "qemu/log.h"
> >>> -static inline void set_feature(uint64_t *features, int feature)
> >>> +static inline void kvm_set_feature(uint64_t *features, int feature)
> >>
> >> Why, what's wrong with the existing name?
>
> Peter suggested the rename here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg641931.html

In that message I suggest that if you move the set_feature()
function to cpu.h (which is included in lots of places) then
that is too generic a name to use for it. The function of
the same name here in kvm32.c is fine, because it's
'static inline' and only visible in this file, so the bar
for naming is lower. (In fact, it's a demonstration of why
you don't want a generic name like 'set_feature' in a widely
included header file.)

thanks
-- PMM
