Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp937956ejv;
        Wed, 8 Nov 2023 03:58:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaWMp/W9H/xd/2R/wMtN9a4fwIl6KE1pAS6mx5odS+iMEtVOyBxCPn+EMr/s5VMnr1PDR6
X-Received: by 2002:ad4:5d44:0:b0:656:2d03:a4be with SMTP id jk4-20020ad45d44000000b006562d03a4bemr1832519qvb.40.1699444733781;
        Wed, 08 Nov 2023 03:58:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699444733; cv=none;
        d=google.com; s=arc-20160816;
        b=zfRibX+jzTMbuuDJzNfYxcfV/6c9BD4wkJLokYqUmSIq2GXtq9IgJadsPRXekWeD+Y
         ZRFomeIUfvBV5wjcxvWmG2eN/itygvjCmCrnoJZEHqh8vEVTIjqlxiZ/yf37DaCVKSB4
         vGdpsmitk88YsMo574PtMwvZG94RHkg1S18Q4YulV9zITjEcqhntld7klAPRWuwPCC1U
         o7uDGTvODhCiDe86AFuOPzbvS66uUk/7x0eekRysA/im2wCgr8p+vHW9sR4/7GcozbKs
         A+abjXb5izUAH4MrwJNJ9EyBo1u9zdinYXpYzcMBBfnGqjuSafiE9OICXL5qRnkarinY
         2A1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+6N2ChRa1sb9NmKGcc3xfDk8X2qA9gCkqmJSCVGuX0c=;
        fh=2Rkq29ow0/lyblRUcuORZLUTOLYUYkyw7Dez3WWGon0=;
        b=HJaSlJkTtQT68P2WukoJejo7HXcjVzUw82L+IgLypjgf0r+vrLwz6HzLyWd44q/N8N
         33c6gX3lBJAbXRgsYCBdkssyvM6xiSFO80NifUHt9kZt26WYw+ETzUgtnJ6q88WoMfJD
         /BxfAY3/S6vUDFPmN92D+OPL2NUciER2k24XHZw7EQMUfeYjzGB9s4mbxRFysjVil5qx
         0w2F+Kh8olvjF4Q0j+OO6htGr3F7Uq3XknIxUAwd0gem/W4tm+5qovY87D6DJQw/v4KP
         lKnc/sqS8ktMqwoOXWhh3TQCiHHQVjX+aTCpj0IZX/PC7uB/80wpq7StZah1Ca6ay0x5
         rA8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F+zXxboo;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id m10-20020ad44b6a000000b0066d09046052si1213842qvx.103.2023.11.08.03.58.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 03:58:53 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F+zXxboo;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699444733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+6N2ChRa1sb9NmKGcc3xfDk8X2qA9gCkqmJSCVGuX0c=;
	b=F+zXxboow6qTswxI9gj6ehYi76uMrBWTS9MjZoCM+tTFHd2hSbgU4Rdpt13zWniLysyqjY
	dCkcGB2nuU0UMqkBQBnilwXp8e/Mq4BgiPJe3+ymzfdtfm0itcZkibQ794T0m8KmuGfE0+
	L1hU1qCwlivLcdQcf0i/lNruH8NQ1Wg=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-nrnh3_h7O9Cbd7FSJJk6NQ-1; Wed, 08 Nov 2023 06:58:52 -0500
X-MC-Unique: nrnh3_h7O9Cbd7FSJJk6NQ-1
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-7ba8e3107c5so1949919241.0
        for <alex.bennee@linaro.org>; Wed, 08 Nov 2023 03:58:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699444731; x=1700049531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6N2ChRa1sb9NmKGcc3xfDk8X2qA9gCkqmJSCVGuX0c=;
        b=LvDe++pn5sQFBlJVYsSaHIRCPt2RI8d+nm9gq2hg4g1MKj7OhVtgiJtWOACOZ8LSI6
         r5Ifu2DizQ6X7AlU8rUo5KDqRdlT+Dj39swtIvVHE370fmNyuXKt5lKWl7eRRvrxVGom
         SCnNGurGRP6IaVZziP/mR7Hfk06U+ATU5PeoznrMY0bATEvzob8Jwnlt4k7vE1w2nEZ7
         jHjHEHUFS9+ZvUMGdrLngBJT1Ea3hCZlPt+hc1o3X2cgqLkSIP/WFacxn9sFcG1BD7qS
         Ux570JhB+lLvflbgR2YE53YXl0lwlWFqrfCz1S3ftiRPnVeTgmDTdijzOiF4hmemloPq
         O2Sg==
X-Gm-Message-State: AOJu0YzcIcTV1bjj8edZ13uYcVSZWTaD//di5RhJ9/E0QE6oG2RNM0a2
	W9Lm26KPjhEhHvxdKEF97hVgI9519n+HIhmyf/QbpWo7FddjixxwPE6DDZcFHPe3YrIB6oyMRNn
	EFG4hugQbQECMwv4vNGHf8bVH4323vZd6
X-Received: by 2002:a67:b802:0:b0:45d:a302:54be with SMTP id i2-20020a67b802000000b0045da30254bemr1434909vsf.25.1699444731598;
        Wed, 08 Nov 2023 03:58:51 -0800 (PST)
X-Received: by 2002:a67:b802:0:b0:45d:a302:54be with SMTP id
 i2-20020a67b802000000b0045da30254bemr1434886vsf.25.1699444731364; Wed, 08 Nov
 2023 03:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
 <20231106185112.2755262-15-alex.bennee@linaro.org> <ea92d71f-35a3-4a5f-bece-01436a33e1e8@redhat.com>
 <CWXP123MB4341A5286537C5060BA71FB8D7A9A@CWXP123MB4341.GBRP123.PROD.OUTLOOK.COM>
 <CWXP123MB4341C5B85F101081C325619CD7A9A@CWXP123MB4341.GBRP123.PROD.OUTLOOK.COM>
In-Reply-To: <CWXP123MB4341C5B85F101081C325619CD7A9A@CWXP123MB4341.GBRP123.PROD.OUTLOOK.COM>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 8 Nov 2023 12:58:39 +0100
Message-ID: <CABgObfbW=8ywhUiWaZeT5pS_xCXuwJirMsQe=Q1ar=rEM_ytAQ@mail.gmail.com>
Subject: Re: [PATCH 14/22] plugins: make test/example plugins work on windows
To: Greg Manning <gmanning@rapitasystems.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, John Snow <jsnow@redhat.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, 
	Richard Henderson <richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ruEtGbhaE2jG

On Tue, Nov 7, 2023 at 1:43=E2=80=AFPM Greg Manning <gmanning@rapitasystems=
.com> wrote:
> Windows will look for __pfnDliFailureHook2 in the module doing the delay
> loading, which in this case is the plugin DLL.

Fair enough, this is what was not clear from the Microsoft docs.

Paolo
