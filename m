Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp6003300njd;
        Mon, 28 Apr 2025 07:21:04 -0700 (PDT)
X-Received: by 2002:a05:690c:64c9:b0:6f7:409c:f659 with SMTP id 00721157ae682-708540df5d4mr149837287b3.8.1745850064146;
        Mon, 28 Apr 2025 07:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745850064; cv=none;
        d=google.com; s=arc-20240605;
        b=d4lBWaAXgRBgpN/nLzPcCvqfTtsHhHoTFR5ebX5s4/WbiRKk9ZPmDavjvg4R8vpTpL
         Jyv2VtZtDmIvOq0WqJNJaz4dTp64WaHdamHCEyBvWnfIyWwVY3xoGz4aJdtQ5mp96BzO
         JtvP9lXOMN2maqCzeOZHTerIhj0z+33eswy4tmPCNMWJ4SxIXqXuEWRwoS54T9M1++Dt
         ZWv3NVNS+MkLdeOonXqlDRkJHUI6dOY5Q94Wi6oJxTSh2DXcHAirSXvh5MgnWsPyyOij
         hYwbhYeMF3TmB9VKNg9CNYl2tbOtvDyBS31gB/gvzN3+buusNs7EZbT9C0UDFyFr09lj
         hDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/5AV2rcjFxnMYqjywlIgXT36ModyBnbTGwKMojCdUv0=;
        fh=j0qk5wxD+ljI+Q8MXA9V1QrUmzt6Uw+wrKN6ODP8988=;
        b=JzZM9hhm3V+V5XiSOtdBhC80Zh0/ZTHk5bFq5kgXOchs3/ecyLaPLvgAAyAMB+Kx81
         TcbwdiyagpPQJ/fvAd0H0qZQU9Kad2bH/mMBLoJmN3fsEjV2osJiZrwPw+t1pPzikDqK
         4h2nKzh4U5bwATjRuUfZJRur2qWpJCA6VGc5ysV8ZjzHrE3u9DoX1zvjJjX9OuFc6mL2
         HLwyyE9G8TmH0iKVFlBF8xi7LkvR7UC10tA7kNSah+SoQrNN68u3xiC2eVNFKs3/pUKI
         o8DiqawqbMjwSXW8NEVhRGpRQtM9I+gYmV7AaJaQVrxtkC7UWmk54+mAwchh19VGYHDU
         emew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sHF9Y9cl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-7084193eff5sor58117737b3.1.2025.04.28.07.21.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Apr 2025 07:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sHF9Y9cl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745850064; x=1746454864; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5AV2rcjFxnMYqjywlIgXT36ModyBnbTGwKMojCdUv0=;
        b=sHF9Y9clLwZJhdpP1fVmT3FO2nr3ETi6TcgIRG5jDuvz/Fgi8k2jm4mjR5hXcmEP46
         3pRZN1AW5mPBKCmdsGhz51OuNeK4+ga+xm1k8+CU3dEKZqpAA16RAoAuS6SiGe7t3WGk
         diI9UzUTT79FOrhmmbdyMDERTwSkV77X1HYNH91Cxfebo3h0QZthzPBGg9Z0IlsS1BWf
         XrW1C001OUckN4DQJopY0yPaPJR0rPw/QgqXuuG9t40Wrtf1owKixl5SRyUQjTf0wc8v
         zYnbB+ATH9Mtn6/goonC5anMAP52/0myapgjCFUdto5zFrpfbClf6ZVUAaCSzFCQuCw2
         lL5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745850064; x=1746454864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5AV2rcjFxnMYqjywlIgXT36ModyBnbTGwKMojCdUv0=;
        b=plYSVHP33XLWjV1R6d77elPPjV5Fgtoqk0P0Yt/n170VKD/XYH0v/UtuRZu07Mr5dn
         WqOvRXxealEZ6CeYmQ9PyJMmcdrV2A1V7tqYHz0p94FRQWfvfs9Cb+f9GuaRvSkX1gWQ
         fhrXszW75qad7rwhA5aiEWP4cvYojHWCNBZoIe9KlUB3Y002hFotTb1ihbqRL+lFE/GI
         v+9zeIhu5KP3To/j9Q+XunrXHCUn3sYoz/k4h5HHDEzzC+wNNLIxCqgmDDMkBHnBufW5
         ZdX4dnG0epxpAXYIr1c5/eiXaskC9xVGoJxkkNCmOLomQ8e8flZ7WcZD0NK9URw0uNtR
         EOHA==
X-Gm-Message-State: AOJu0Yyhkmg4DLUo/pDzEOvmGJmB5Dw2oe4PgwNsnXc3HiAeD1sRucNS
	nCfQNnD7FxrAnRmUeBWuwG+9RzL2E96kj9TQKM9+7yqsHwVGEAtoo7u2ttdVBH8xGGLwO7OSZK0
	EAPug1HgZEMhHmYlJ4ZtOWdhB4DO7HZQ0OlbrS7rcSSktYy47Qt8=
X-Gm-Gg: ASbGncvetxXgXxxG7HH1KJ4DJxbKohtAqVnGareIy2BuDFXDZQlsB30Iy69IVpF+n/D
	2r8jHHm9TFOurwfyF2YBgUZqWzCtwrTHku177R4AjMJ32JnyNd50Ab8R0s87ZWDx5sIdDZGyV0f
	JxQGees57GD7zqLLXaPHsldmY=
X-Google-Smtp-Source: AGHT+IGvbnu5A18NZyy3KoQabDs4CcQPdjJ+h9nkWt+ZyuSf+4N872mHG4NbB2XChGSKt+OBPENw8r4pBA1xgaz6vhQ=
X-Received: by 2002:a05:690c:6d05:b0:702:d54:5794 with SMTP id
 00721157ae682-708541e9ffcmr171135307b3.31.1745850063725; Mon, 28 Apr 2025
 07:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250428125918.449346-1-alex.bennee@linaro.org>
 <20250428125918.449346-3-alex.bennee@linaro.org> <294fd9b9-6880-477f-a2b4-773f1e5274c8@redhat.com>
In-Reply-To: <294fd9b9-6880-477f-a2b4-773f1e5274c8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Apr 2025 15:20:52 +0100
X-Gm-Features: ATxdqUGHWS-7X3JRAng4fMhhaz9ExxVdX6hc3tnznIo9BWdMm5kwV2UI-2XE3yA
Message-ID: <CAFEAcA9=YaBw=X+6NUw1D3RPgcSJn0OdmGC2=N=195jjJ7ijRw@mail.gmail.com>
Subject: Re: [PATCH 2/9] gitlab: disable debug info on CI builds
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Peter Xu <peterx@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: PN3S6piJNjz8

On Mon, 28 Apr 2025 at 15:02, Thomas Huth <thuth@redhat.com> wrote:
>
> On 28/04/2025 14.59, Alex Benn=C3=A9e wrote:
> > Our default build enables debug info which adds hugely to the size of
> > the builds as well as the size of cached objects. Disable debug info
> > across the board to save space and reduce pressure on the CI system.
> > We still have a number of builds which explicitly enable debug and
> > related extra asserts like --enable-debug-tcg.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >   .gitlab-ci.d/buildtest-template.yml | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildte=
st-template.yml
> > index d4f145fdb5..d9e69c3237 100644
> > --- a/.gitlab-ci.d/buildtest-template.yml
> > +++ b/.gitlab-ci.d/buildtest-template.yml
> > @@ -24,6 +24,7 @@
> >       - ccache --zero-stats
> >       - section_start configure "Running configure"
> >       - ../configure --enable-werror --disable-docs --enable-fdt=3Dsyst=
em
> > +          --disable-debug-info
>
> Do we have any jobs that might show stack traces in the console output ?
> build-oss-fuzz comes to my mind, but that uses a separate script, so we
> should be fine there?

If you build with Rust enabled, and the Rust code panics,
then you get a Rust backtrace. But I don't know if that
cares about debug info to get its backtraces: quite
possibly it's an entirely different mechanism.

-- PMM
