Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp978506ejc;
        Fri, 3 Mar 2023 03:57:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/fYxc7/C4S9GKedvs9UDHgDUq6BEG+6N8S8gZXEk5mfAVpSgG/XqblpdFGWZFx5iwGCkkr
X-Received: by 2002:a17:906:4b08:b0:8b1:4b6d:c57a with SMTP id y8-20020a1709064b0800b008b14b6dc57amr5267223eju.21.1677844654777;
        Fri, 03 Mar 2023 03:57:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677844654; cv=none;
        d=google.com; s=arc-20160816;
        b=TLn/coucYvuxQMHtPbSt2Ej4TCD7IzxgPfYy7+em4M1363zCoYDhBR317nqvZGUgwo
         QNMUTR+YSiJ0mHHvggXOBmzyB+ZXPbU+3keXGjCqr1tVWEFJgISBQ9V2W2MGGMDrCdox
         RbwREid8TKQoS9eDBXizO47O5HsiHghkc3wAtSXZElPOgyoYWaciMW5qVnYY45rzesW7
         YmGCfxezwmEyG2rhAzExITrTn6/i4FezrDluIv3EFpKp9C9+CoYaYWgYBzVzAD7Bm2/m
         kqWbvd8kvQT45GhcSAJmUnrsFy36KcP5o7qVbcyTzUNcDnQO3CiYjnBbOGfGVGgcrFt/
         lSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id;
        bh=qPHUsztvWVdQFnM4QtKVnwb/8J5gMSfiLI/fKmz0PwM=;
        b=ynDUkaHh1TTWGVQoqzPrQGGCsgFv+cHBER0ODu6UBn2PUsMJlndOg4gejORH637Ghh
         OOKkMr/ynjJeszbqmieG5SCyE7PhV7JcUxeM4aSH05Y2EYuNhJ4wzLCS9NVQH11872IM
         2glBftxmNcYz8Yn88OKlfhOZD/179rVv0/LNnIrLzDc++q8g3ODlqLesjrgQweW1/+5r
         +m90pNk5eDJZcf1TLWKeTdvDPimOIaLz2cElym8mJBD5wPA+O3JZ92k02BpEXt/yht4N
         OnvI5koP3gDJdzPFwr4jbqq092Of4SC4uNYUT7HgDbKlfoTy/a1kwOxOXaXa9zHu/vDG
         pRng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of glaubitz@zedat.fu-berlin.de designates 130.133.4.78 as permitted sender) smtp.mailfrom=glaubitz@zedat.fu-berlin.de
Return-Path: <glaubitz@zedat.fu-berlin.de>
Received: from outpost3.zedat.fu-berlin.de (outpost3.zedat.fu-berlin.de. [130.133.4.78])
        by mx.google.com with ESMTPS id se22-20020a170906ce5600b00905faea2765si1917543ejb.105.2023.03.03.03.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 03:57:34 -0800 (PST)
Received-SPF: pass (google.com: domain of glaubitz@zedat.fu-berlin.de designates 130.133.4.78 as permitted sender) client-ip=130.133.4.78;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of glaubitz@zedat.fu-berlin.de designates 130.133.4.78 as permitted sender) smtp.mailfrom=glaubitz@zedat.fu-berlin.de
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pY42W-004B3D-QC; Fri, 03 Mar 2023 12:57:32 +0100
Received: from p57bd9bc2.dip0.t-ipconnect.de ([87.189.155.194] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pY42W-0029Jx-I9; Fri, 03 Mar 2023 12:57:32 +0100
Message-ID: <366865d17d130de0d75e9ea18e540bf4979b8ab7.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v2 0/6] Deprecate support for 32-bit x86 and arm hosts
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas Huth <thuth@redhat.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Daniel
 Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, qemu-arm@nongnu.org, Maxim Levitsky
 <mlevitsk@redhat.com>, libvir-list@redhat.com, Richard Henderson
 <richard.henderson@linaro.org>, xen-devel@lists.xenproject.org, Reinoud
 Zandijk <reinoud@netbsd.org>, Michael Tokarev <mjt@tls.msk.ru>, Helge
 Deller <deller@gmx.de>, Laurent Vivier <lvivier@redhat.com>
Date: Fri, 03 Mar 2023 12:57:31 +0100
In-Reply-To: <2c7f837f-c156-8525-005f-f47d50591a85@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
	 <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
	 <6c1f0d05-924e-854e-0175-5e345945e086@redhat.com>
	 <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
	 <2c7f837f-c156-8525-005f-f47d50591a85@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.155.194
X-ZEDAT-Hint: PO
X-TUID: 4nclwAOsk5TO

Hi Thomas!

On Fri, 2023-03-03 at 12:22 +0100, Thomas Huth wrote:
> The ticket is very long and hard to read, but ... oh my, does that mean y=
ou=20
> need to compile qemu-user in 32-bit mode on a 64-bit x86 host to properly=
=20
> run 32-bit binaries from other architectures? ... uh, that's ugly ... and=
=20
> sounds like bug in QEMU's user mode emulation ... and what if you're runn=
ing=20
> a distro (or different 64-bit host architecutre) that does not support=
=20
> 32-bit userspace libraries anymore? Then you're lost?

Perhaps the explanation here by Florian Weimer is a bit easier to understan=
d:

> https://lore.kernel.org/lkml/87bm56vqg4.fsf@mid.deneb.enyo.de/

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
