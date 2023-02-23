Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp721288ejc;
        Thu, 23 Feb 2023 05:23:52 -0800 (PST)
X-Received: by 2002:a17:90b:3e86:b0:230:b53a:fa13 with SMTP id rj6-20020a17090b3e8600b00230b53afa13mr14092105pjb.44.1677158631885;
        Thu, 23 Feb 2023 05:23:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677158631; cv=none;
        d=google.com; s=arc-20160816;
        b=bubQ7DdFxUvd4vh7vfq2M7osK/qsflVz9tMpQfk5pmKgpFaMb8RnnVmz+PjF8dqpEs
         9LkuOUYMtvm7cH9Mzoe4JDqN1184QySPGMTrIstgD0aKpEby/p/fH7rU9/UuGsqm5JDH
         kBwbIiR59LE2IPxTGn9uio+Sp5Ai5Wl0tIB46jm2KiIjj5DIT7OOg+Nt0kLGZiU0tGRd
         3ICluvI8PX0Cp7+9liJ09FIU+OzoX4Zp/yRcklH2ZD7XUYTeTr3s/Kt0CvkDwvn8x/SW
         V5OijWzoEywlS5QVcGLGhx964dovdagRsK0IYSJsg78govRIm+Mxr3ZOLgX94TF9utX6
         wkRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BmbJQysyE94mp/ooIQeA6DiueXheewBECzDYx515B0E=;
        b=TlP3tVCRy0TKN+yH73UsIauYKq7IJwDwYm2o/eOkzFnIZfMLOM6076jL0heWIve6pP
         V4S+3mKeIPvyz44f1ZKP++1UFn6Klk1MGJZz6op3j5SCoExHWhhIePhNpDPmxPIs+Jb/
         qbTUJLaBUSRXUj7MclijXyAQNE+k8RXcP+xhxsvDilad9pye3pFehxCun1blR8yVB6bT
         r52SxtIH9+0YeMyFDU3U8TdAuNX4ErW+JAnG8i2pjvxgLyd+Ez4v8tANJz47k8LDRKUH
         qakPW4Z/ZINfIB8QNpKjkyaEuMD2OmZy8aYnIGDJblwvkQP7iO8kTxn0EgAKshV9CrWt
         2Sog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KX+1FFCD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x3-20020a17090a9dc300b00236679d95b1sor5088217pjv.6.2023.02.23.05.23.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Feb 2023 05:23:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KX+1FFCD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BmbJQysyE94mp/ooIQeA6DiueXheewBECzDYx515B0E=;
        b=KX+1FFCDETKWPHCOxGbtSQ67RSS2LN9ukhAuSp3XSttyIdQodXgumM3wTFQWVd+VLZ
         wPDxzhc7S+FOa5nGexlN6gaGvrehSKoBi1pKp7QDwTU3A25hQVsk8jLz2b9BIoaQgJC1
         C4xowVdqG4FgxvKUTHDmSFqt43Ycs7tQTAPdBRGUtHAoyYxGwwajMRT9H93N3CS3ou2Y
         keQACabrnXro0Ic6VsbacUC/vLE6c6WYcQ3lMmopLyXeeUdVsg+9U8gUGpdDLCXhBeaq
         NstBEdQtNC5NJrM7z65bjVAakdyimWAtM4tbbC0ekDqv0nFXzTkzKTrars6UyDX0hx1Y
         vxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmbJQysyE94mp/ooIQeA6DiueXheewBECzDYx515B0E=;
        b=uDerV1/2jSF7xTufdgcFS7oVMKpnzZvlmmPF8Iaozw2jesxt3SvxFgIDc1XLl2dDVC
         09HFk92e9gYk4gJFkRs62pkAkDt3O3jJtjjCWjyHXIWLrsm1kdREWa7PZbk+tJKHUbdV
         v4NVn7scd+voQVS2DmbsA8bGKfjkpWgTM8m/da7MbAIqdml5nA435aPnA5AUR/478f5z
         GBViBDhUSRFsFQg69GPLfNTXddoGJuNDIXvncFjkqrh+o/MyMtdSKn+rSX53SiXlApZD
         hfphgatgJTHogY48aXSSQsKWzyfhqBnh7P8Ew0qpoXFhuh5nbkI6gBHVg0aD4nMJ9APF
         DeAA==
X-Gm-Message-State: AO0yUKV6IhQJw7ngH47jPPBriEBnRwdONw7uQrdA9Wo5brjfuUWsUk3a
	7IRXDxLIv7gHIPaWiljsyuTEMnw+iyY0RF9vMM0m9MeZ
X-Google-Smtp-Source: AK7set+EhS9U6Vbx/3KudzUsv7KJc70BAvs9EyOrx+XTy+UIrmB3kjHTcKAHgRXR2Da9BBu1cBU+0iZwBrD2MJZDZSc=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1094041pjb.137.1677158631398; Thu, 23
 Feb 2023 05:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20230223130841.25916-1-farosas@suse.de>
In-Reply-To: <20230223130841.25916-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 13:23:40 +0000
Message-ID: <CAFEAcA_j7x1DimADiv432rFnf44wazeJXzfUSWxChoyQj6XngA@mail.gmail.com>
Subject: Re: [PATCH v7 00/20] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: neY9Laq+qcCU

On Thu, 23 Feb 2023 at 13:10, Fabiano Rosas <farosas@suse.de> wrote:
>
> Changes since v6:
>
> Now using the same feature set for -cpu max for both qtests and
> TCG. This requires a slightly awkward code movement to expose
> aa32_max_features to non-tcg code, but we gain by not having a
> different environment for the tests.

I'm ignoring this version, because I've already taken
at least half of it into target-arm.next from the
previous version.

thanks
-- PMM
