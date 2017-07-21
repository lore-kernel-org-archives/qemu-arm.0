Received: by 10.25.44.15 with SMTP id s15csp422636lfs;
        Fri, 21 Jul 2017 02:22:34 -0700 (PDT)
X-Received: by 10.28.45.10 with SMTP id t10mr4745161wmt.105.1500628954811;
        Fri, 21 Jul 2017 02:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500628954; cv=none;
        d=google.com; s=arc-20160816;
        b=MxbsbvEGZZBdtrQ6F3WhM8NFuGy/6iaQ1DAkbEkWJSfcHV7y5uqI17OFXg3klzAmXJ
         WR3lsmqXAu0/vAv6xGdaoqLevFP6NpObxSqX1VZsDv1fvReJtZr2AoD4l1byFmaoeOEa
         5aok5E3aLUpCA9PcnpeuuMbJp0DAiDJi7RfgOoFzx/5wBamrwCUshAaB+KpCv7ZwUhyO
         nOvyrXi6UQIYxg8UV0IG4K1xI8Jz0AV6rpt4n5bsBG+z/Z23rhj4CH99L9ujKVltY6QX
         XbLUyLg2HHOi3Y10CnzLBt6GclkoCdKv/pTSKBrkD5/PYddhgajwaYcHIYzaZ6YkGlx9
         FwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4B7QItKNlldUTiUMu5zK4t7MLo942ByxWKY3jzoY+Nk=;
        b=Epfu4nSkp9lDEjqzJ294lEW+XHpK41BKaBdX0OHiyvztXoR5Upk3MtRWbaaVpVlPi7
         d6Qq92auxKNmekvVOBFu24J539VE+A5J54yUfZN7aK8boJdUsSDnemWEgcm4w4MtiKjb
         uM6u7hOwYKMPuryMZeRqRKRofBRPIX5XK71Tf6IFsqocqUM8tD4jyqtfVj6/+OtPh6DH
         TW3pTdkfkHFa4BQouYtdVzIu0v5HtxxLE6eUPMQ01f4w6sk8PTOxhVnUhhjmqxfhFUfi
         /ub/SQDt/nhWZhgxsUL3g/9qTBwcD4mno5JobpA4f7swFUaNiK7TS0zaogpXk/KWxSVC
         gWcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtVU2E9k;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22c as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x22c.google.com (mail-wr0-x22c.google.com. [2a00:1450:400c:c0c::22c])
        by mx.google.com with ESMTPS id g83si715366wmc.154.2017.07.21.02.22.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jul 2017 02:22:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22c as permitted sender) client-ip=2a00:1450:400c:c0c::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtVU2E9k;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22c as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x22c.google.com with SMTP id f21so23563943wrf.5
        for <alex.bennee@linaro.org>; Fri, 21 Jul 2017 02:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4B7QItKNlldUTiUMu5zK4t7MLo942ByxWKY3jzoY+Nk=;
        b=JtVU2E9kceyUBrCSr0JPxQz2GhWRauex+PWgwUa9u2k/NBiqa0VvxbRd5crSEBbMFu
         XPnSdPbz3Qd8On9nkoe5J3VoyeBSFs5Yy4SBmGTVLbq/vZ/GLGnBpy0OXYX3IQiFXIea
         mUUzbYLt0HAB43sMgTlRiD0kyd7P0mSrwyGn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4B7QItKNlldUTiUMu5zK4t7MLo942ByxWKY3jzoY+Nk=;
        b=JXV+YRtKYtOHpK8yLFU1AbZaw3mw8jhZdyj3ANUBxRZ/AOGgB1uWCf6Nxv1tEZCS+L
         XC++Coulbivv8H3Ger4IHhDkdTJaJ7ZhreSvQ2sHtVhBsghnql9Qw5qOsaWX4jRpsrLT
         p1j/DHucBzgVdt2mXypAgYZ49gKV+3l8CKLvAUBqVzvb8buyf6qZ6nOKnZciUBJR6QR3
         PkgBCkyGKwShNEiwuohftox8TZDUzyVsNCyXaPJkdC8c10cF+zILjNcUPSaCOgRj92xA
         xRD/gMVHg3NvaVFOl+Y3IaBa4m5/AtJEr5CNnIS/lYd/6etm+4n709Gu5T5kYWfalMsd
         OSHg==
X-Gm-Message-State: AIVw111dCVQnyStfWCZWx6bJL611NkXlrcY818V4qdQsoAtPTGXixPX6
	PxuzljyIPzfXOLWzDRts/UeICg0jHqA+/EunjQ==
X-Received: by 10.223.165.129 with SMTP id g1mr946813wrc.167.1500628953595;
 Fri, 21 Jul 2017 02:22:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 21 Jul 2017 02:22:13 -0700 (PDT)
In-Reply-To: <87ziby6udk.fsf@linaro.org>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-4-alex.bennee@linaro.org> <d58f694c-cc8a-fb0f-f01c-ba1e2eebc6e1@twiddle.net>
 <1ff55ec6-b8e5-8696-7472-0ac22073ddf4@redhat.com> <87ziby6udk.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jul 2017 10:22:13 +0100
Message-ID: <CAFEAcA_a9RW8zhaY6gpPuXAYk7twWgB0G39qOUTug44HbwyE7Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 03/23] softfloat3c: dos2unix all files
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: eEorSDF6/0Du

On 21 July 2017 at 09:56, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> One thing playing in my mind against moving to SoftFloat3c is the
> inscrutability of the upstream. It's nice there has been a new release
> with new features but there isn't a source repository or as far as I can
> tell a development list. It is basically as far as I can tell a one man
> project albeit backed by academic funding.

I think https://github.com/ucb-bar/berkeley-softfloat-3 may
be official-ish, though it's hard to tell with github repos.

thanks
-- PMM
