Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp651268ejb;
        Thu, 16 Feb 2023 08:19:50 -0800 (PST)
X-Received: by 2002:a17:90a:de91:b0:234:1fa8:6589 with SMTP id n17-20020a17090ade9100b002341fa86589mr7918641pjv.6.1676564390201;
        Thu, 16 Feb 2023 08:19:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676564390; cv=none;
        d=google.com; s=arc-20160816;
        b=pOAJ/cO9yJ4h4zozIrn+e+/mIDfZeiF9fzu76ysWkn8TYMXfazgFFlxJW3r5wsJyg+
         h7Ko4Yc+olS+1Nx4V0HjaawksuUS82SxW+WQDEJds/DHGVdqK0PKb4huN+xHo+YisJKY
         fuSxzeDXxvwu+1n4FQaKB/uBrga4jCrhvapVUeaV7j/jeBxrg4a6KyfPeaj4Y1wxomkw
         sJXp0h6CZRxWGJLTN0OeKRD4D2gR0CnJ4MsDOzJ232Jgj2/QZmc9G/uSti/pXx/sW4a3
         J9LkJXPfp9yHgKP63JgQvtEamzLmqemfxqieKgCay92eF+bGrLjDBmRinHby3kGXiKsk
         pbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wj14ESZLEAlGOUoRm6CLbRBQGDs/WYzNDBqPj6RxcFY=;
        b=iFXdhPwha1CA/JsOc0pED/s1xMZiF/jifTlgca2UFzmG4RSYKKvuXwbepDeDM6Qdwb
         ygeoxar28kl5wOrv5EsmCQunJbOCWFMIfLrNCGh2C3EWSP3qpLQYOsRiJ0KLTfUxBYET
         pD3gulWusJrSUKssNrZHPjqJea211spNbbOU6Y4j6oAR0ppN4H1rdmuG3ll0ePELgcwd
         oQjBr6qkt8KlTd80BtQ0+gu96HmbBxrguTCkXgNyek9PSIEiRoU9wd9S8t2HmEOCdHBu
         01sRQ99g2HnZYP8uU/aH+dlx0+9NOttvk8O949ujVzddEDbRbcbVTWMnrV22qe5mF7oT
         XdNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QIiU5uXJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y9-20020a17090a474900b002349f97c917sor745616pjg.2.2023.02.16.08.19.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Feb 2023 08:19:50 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QIiU5uXJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wj14ESZLEAlGOUoRm6CLbRBQGDs/WYzNDBqPj6RxcFY=;
        b=QIiU5uXJUmPB5zdKBAZUhcGxGY7yIqOm1iKOEGNNA2/4dBjIS8bro9gkQ+dUX3hvgu
         s/xRQGu29bI9gssvN1aaMLy6KPvr5VQ5Wlwr8tneZTowZFsu3oPhsbsd0m2mgCjvL9QL
         CK3Ang07oojmlOSMyK+0R8OKsa0h4nLnrnquDJXpqmzrM1KPVNBLu6yuyfM+mXjdopxq
         LQ/JgiI7sewdNuJ7Gs71Uz0lukXtIQl8QnnmPR2/ItoO9L1c8y3zY5Sa1+d0x5En6yV9
         FQvKR5U1phzVyKWfYw0q2ukje7IR+V35llLqPBsZ7G7eE4vMx2hA/t40Y4F0dFJ4Uvya
         jCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wj14ESZLEAlGOUoRm6CLbRBQGDs/WYzNDBqPj6RxcFY=;
        b=hJIphXfsTwKQOOUBvhI0DLlHm0XCwBM6JRlnmLNNcq7W4N74lQSUSe8y+3rJoVT7wb
         +TpWocEWw9t/RrMMw9h+prZPKmN7FTrZqDh0ZkhDQCD/SVOxl/+FtaV2pLaaPrAr7gfT
         LlBk2XIV36l0+uawmxNACl0PAuB+e2NWBrFqVMyrbU51uA5ofTCTstyJYTW0d1M2p1D9
         DG25hyJVgrjWG1j1TzkGgIJnggBMABCd+EgGDOWH92fM0O9tyEXVVMxPlsEew5XqBYrl
         p6mmmcURUdLpK9O3NhjMD4aftKYuR8u6wg52w8aHjmg04t+LIpL7VTbfIgEDWXLLZkXV
         t/Gg==
X-Gm-Message-State: AO0yUKVyhtJfMwbuloWpzoALWekWaPSKtEUjV5lNusH6P0cWICWq1S4w
	UoJa5DdpmU8pqT4eKIzkjNUhdTEoRfFG+MeK4qCCe6AZ
X-Google-Smtp-Source: AK7set8N0jwGTUV4Vz+NigZhhCwDqL6I4wNIZsM31F0AjS14587y549jZVe3vA0sanNXHFEezzE6Hyhxq17Q4A+k37o=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr756668pjb.92.1676564389724; Thu, 16 Feb
 2023 08:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20230213202927.28992-1-farosas@suse.de>
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 16:19:38 +0000
Message-ID: <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 00/28] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ze04OGleX43z

On Mon, 13 Feb 2023 at 20:31, Fabiano Rosas <farosas@suse.de> wrote:
>
> Hi, could someone take this?
>
> I rebased and put the two series together to simplify. I'm keeping it
> up-to-date and tested while it doesn't go in.
>
> CI run here: https://gitlab.com/farosas/qemu/-/pipelines/776103500
>
> Based on master.
> Supersedes "target/arm: CONFIG_TCG=n part 1".

I've taken patches 1-5 into target-arm.next.
Patch 6 doesn't apply on top of my tree, which is unsurprising
given that it's trying to move 9000+ lines of code in a single
patch. That's so much I couldn't even figure out how to recreate
the code movement locally. The diff is not very legible either.

I think that patch needs to be restructured somehow so that
it's a bit clearer that it's only doing code movement and a
bit more likely that it might be possible to apply it without
massive conflicts.

thanks
-- PMM
