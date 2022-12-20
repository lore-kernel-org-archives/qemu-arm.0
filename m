Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4114631ejb;
        Mon, 19 Dec 2022 23:22:47 -0800 (PST)
X-Received: by 2002:a25:2e02:0:b0:6fa:23d4:fa6 with SMTP id u2-20020a252e02000000b006fa23d40fa6mr13387341ybu.59.1671520966951;
        Mon, 19 Dec 2022 23:22:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671520966; cv=none;
        d=google.com; s=arc-20160816;
        b=qBNqCAbZFFkQ9jeNA77EvAXCtfFuhNKYMu7BAl7Mzuu7IQAibQo3zXSKOXRwz3ZCQn
         ldVmGps7OLR6R4maPMnBqOI0ikL9PJkZQU1z0lfCXVkXmub3vjcuDW2yu2RKmU/33CSx
         6P7+RVkkdzRfGNU0GdwLXelUHPJ1pt8bOcyB6tGqWzjDPgT76XX/u4U6EGNWvK0P0uQS
         M6a9rf6ae2QcQTkqLjbBQhQcECrObidQwjOsk8eXVpIF50HfD3VLchbwDWX/jIb5B/Ng
         TOW8mY2RnI/xqsBCTXa6Ozm/l+azpWDy3+235BQIVatGvmLTwYZdEV0Be0+UG9FVntKA
         8qfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kTl/c7jd147RrMZ+SpyWCWHk88Cx9RugkP7Mui/M280=;
        b=PC9t2NCQdoEg/tENzaQEj1/BFhIQI0oAf9o1qFXrNsx+ulE1tP5BwqI6TgbLkTYazh
         iITdSQ7tK83Jatb/vh8qRf+nGiexxkf2oo/1UPY4RZMJCuaFP3erKEp3lP7eGBG0scNa
         UtoxEey7c0mitikXNebO1JnyudKNtUdiHOh7DYEOwuWxXZvnB62X7SWOZHk9tNVDtkPy
         gsb0eor3MhQW/WftqwOim8zDc2T0URTUMguHv3dXQYWsu+Q7tldJeT4oPbv2uiMuvvvq
         xBacPlnPflTVyNi2pjbmKFiG2N/YNQX6LVjw/QkQorLdaCcVeqR/tI8UIBfmJuVFqxbe
         WiNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=fcod5+qG;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 68-20020a250447000000b006df13176873sor4818852ybe.132.2022.12.19.23.22.46
        (Google Transport Security);
        Mon, 19 Dec 2022 23:22:46 -0800 (PST)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=fcod5+qG;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTl/c7jd147RrMZ+SpyWCWHk88Cx9RugkP7Mui/M280=;
        b=fcod5+qGNkyv/TBfu6q7x8bKrlXpU/85Zxs+G8qZapmF9bwaEzmlHvwPmNLrjqgxtF
         pd9Uyk4uWYO4cNNyDgLgheSV+3LJA77fwnco0OLw8EYzBwhxOxYO7DZkE+8d26fU2tln
         d9hoSSVgJ08KXDvOUclxkdxgZwQEL17boC1cs0oilUcA/Q1L+Ox+7CQ5KN2wIhcjRn2R
         gZ9iwRTyFn2ese7XzYQAhgXPjcKxWV7eNqlsn53D+gT4jGbonyIx2s+9UEzxiENz8smf
         2TLpsdl4C0xsPyAf5QFKIzfm1YP+ZgK7m9y+HpuBFdg+sKL4vDxAWVWRFsstCxdE2dN7
         YsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTl/c7jd147RrMZ+SpyWCWHk88Cx9RugkP7Mui/M280=;
        b=Aawh+FUgh2j1PlIYppHLfYK4RuDHRnrpdVJ2Jt5QW5iOfQrTRg8tQU0TGNnm/J+nBW
         exdjc7VGhzsIXiza+/3b8H8xm/wcjpk3DJpONmlWoD5f5SViGyjv4ushHzTw33aNiuJr
         WD6Dk5L8GcwtG1bMaka+vSUamVu+Ia0XYpj1Amgg6LDbjlYmbWLzskhLBEQaEzEso0+T
         cM454+GHnB7I6v7it0MtFiv0HquqSMeqtknm2wdfRVroTPqLN5HT30SnQO239hSBrTNu
         pbRIU88RtM7g3rteYQrtZQhDd93iWMtxQbThTv+LzvfXTNNj7L3b9jclyY8op6JpuaUP
         Gokg==
X-Gm-Message-State: ANoB5pkSfILVmlsRauxduZ3uSNvM4YPplQYy19XAozxCIWRUcO6DIPFT
	lZ58iVVgGilqYyYj08Vppt8fCdLYqXaCtvES0EGCAZmYfpFsag2i
X-Google-Smtp-Source: AA0mqf6wLM3pB/HWQDMB5lHzGuhQ7IQKDNgVKphT/RwTNwM3ObkSX8Y5YS/y2CbYIZYbCnW80xMXa4PDgZKjtWuWNLY=
X-Received: by 2002:a5b:8cf:0:b0:6f8:92de:92e3 with SMTP id
 w15-20020a5b08cf000000b006f892de92e3mr44395217ybq.105.1671520966559; Mon, 19
 Dec 2022 23:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20221116174749.65175-1-fcagnin@quarkslab.com> <20221116174749.65175-3-fcagnin@quarkslab.com>
 <CAFEAcA_QvfancWKj2hL3KxbyLm8FxkteSbgxvkF8QO119H7SNA@mail.gmail.com>
In-Reply-To: <CAFEAcA_QvfancWKj2hL3KxbyLm8FxkteSbgxvkF8QO119H7SNA@mail.gmail.com>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Tue, 20 Dec 2022 08:22:35 +0100
Message-ID: <CAF8_6KkPDwe8-twtJEM3_HDuRVmxn25gJGDQVhRJF=DuA+fm3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hvf: implement guest debugging on Apple Silicon hosts
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
	qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
	alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: zDdiSutMZXvN

Hi,
indeed, the patch doesn't keep separate copies of debug registers and
just directly sets cp15.* values, as I was not aware of the issue=E2=80=94t=
hanks
for the detailed explanation.

I remain available to implement the required fixes, but I'd need
some guidance on how to proceed. Thanks,
--=20
Francesco
