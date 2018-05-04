Received: by 10.28.4.212 with SMTP id 203csp457876wme;
        Fri, 4 May 2018 01:22:58 -0700 (PDT)
X-Received: by 2002:aca:f354:: with SMTP id r81-v6mr17094496oih.161.1525422178242;
        Fri, 04 May 2018 01:22:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525422178; cv=none;
        d=google.com; s=arc-20160816;
        b=ibe3xX6O5aQjHiUZksUPIBq4XIbdcOaq6LOZYJh5vqtyyEBRFYw0P+QQmWpm3/q6br
         nJ7XcEa5TXmLSyEp1wD70sVm+Tcjw3tDfrfm1YeAfWBJIbyzmKW8HcH1m4L8KF1TJOyP
         w9+4npcrpCj47345zilm+34VT7yY8cyGoghgxTqkxXTP8k3vwP5LiS30yqyzr0vuoOsh
         5K6rNnXYdn5zg8aE1JZGgv5+44GEzX084ZHuuzlzQNTL2EGtyHgEQ0HoNxL5TLqynBTp
         q3bIacG2p4QnHOvh4s/bAPED9VBMZzpK3WLWLDWTBF3QuWN00GFsNorpcfiLy/sVYGw9
         mIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zg/waToafpuNrnmxe+Dx/pIVe9KxIlE79Soxitty5Y8=;
        b=a86DLjmQ6g/HuznRa7KAZC9XyCQ5jRhdG+sRBoy56aOKiEmAJGzZR1uHOqQW6wzwBs
         JnTeDx3Ta6zDelK4B/PQMf8H5kCgnWze7nJ6TGsuxzQkLlM/NcU1RysZGRRFGceE/TW6
         j7PhGN4UFOgjJEUegg/V0U++4Y1bH7sCATfTym2nP9rPid9apKhklNtoqgAzUYnHQoCS
         fNuv8fmMPX3q4tQxezxa7mqmcHol6kfhbQGtMJ8mBj3YnHPVIo7DS75eBsNMwogWJmFt
         mIEDnPalHmAoXvkbqImFtczkS8tS4bJ0C4pAeurbCouwl9F30/I5xHOZ3JnxQO9RLbjS
         kMOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQfIr9Qa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y56-v6sor6432031oty.98.2018.05.04.01.22.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 May 2018 01:22:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UQfIr9Qa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zg/waToafpuNrnmxe+Dx/pIVe9KxIlE79Soxitty5Y8=;
        b=UQfIr9QaKDh/j46Au87tZVljBescI19r5BIDAa5n/4YDpyxQprCN1T1Shkk5XneCsC
         rrBxKBoW7KyXmxza+hq0i74zRfT7zd6eaejDJvUYZWJunKPM0rKtQv1v0be8R87iG+t5
         iaFdcmCnDqUue1I+tia2Jf4m48CMsQ57HK47w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zg/waToafpuNrnmxe+Dx/pIVe9KxIlE79Soxitty5Y8=;
        b=Rqk9hgpiMN3eTTblS4TTUqhpcZ3eJgQKURVSftrvpzfHvVqlkHbfNDqVb+ZyEM4Nyh
         iKT7N1ld+0EvIPVhLHQqXzY4N/GsTIJGsubHXCJNLO7OKEW6JQh5ToM78GhAMyQjDcZe
         G4vb+xD2zmmDpj71aNZUj3VXN8rDKCwjgOcM7nN9wKWSu3tTg9YYok8/rn3PrzTyhaoq
         3GGvAdfgYXWvU9vgQ8xtjD0YII6LbW2oMf0pzpbPh+c/EL4tJSeUL09yxEBkXJPrB0YQ
         vN+vHwFP59YXSs28T2pi05LgODrTLGradZjbTHl4tlySkB6zPezgE0QEJ43i5FEliW++
         TRzg==
X-Gm-Message-State: ALQs6tCvNwk0cWqDqKUAx2CIprymJQINIYaF9rdFEqIEk/LbI6b27yF8
	vBnsuKJiDDC5UKNTrHj3AeHak159y8+FyrehPmC5hv3XdWA=
X-Google-Smtp-Source: AB8JxZrE2WotJjhUd0a7ezrbE13xVGIjOp8cUtp3LO1+DxwgGC5u8bTccIB8kk0A6MDihhpecGnF4Yjd4HzrQ9L/N+U=
X-Received: by 2002:a9d:5014:: with SMTP id a20-v6mr17578514oth.205.1525422177658;
 Fri, 04 May 2018 01:22:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Fri, 4 May 2018 01:22:37 -0700 (PDT)
In-Reply-To: <87zi1g8qrd.fsf@linaro.org>
References: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
 <87zi1g8qrd.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 May 2018 09:22:37 +0100
Message-ID: <CAFEAcA9bZoF5zt77z8_+rNxOOoaN0KUMONqnZhTgQZAUE+DnDQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] target/arm: Add a dynamic XML-description of the
 cp-registers to GDB
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Khaled Jmal <khaled.jmal@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: rWfPv5ueh+pP

On 3 May 2018 at 20:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Abdallah Bouassida <abdallah.bouassida@lauterbach.com> writes:
>
>> The previous version:
>> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D33714
>
> I was trying to do some testing but I was finding it very hard to do at
> gdb kept throwing up errors like:
>
> (gdb) x/10i $pc
> =3D> 0xffffff8008097760 <check_and_switch_context>:       Cannot access m=
emory at address 0xffffff8008097760
> Detaching from program: /home/alex/lsrc/qemu/kernel-v8-plain.build/vmlinu=
x, Remote target
> Ending remote debugging.
>
> However this seems to be the same on master as well so I wonder there is
> a regression somewhere.

What gdb version are you using? If it's a new one you may be running
into https://sourceware.org/bugzilla/show_bug.cgi?id=3D23127
(a regression in gdb).

thanks
-- PMM
