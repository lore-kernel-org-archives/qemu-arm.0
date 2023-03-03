Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp933565ejc;
        Fri, 3 Mar 2023 03:09:25 -0800 (PST)
X-Google-Smtp-Source: AK7set/59jVRBvuV0O8+24xijejTjAymmN4pWPxRLj/BT/jSQgl+YLMjVPL72I6EiQornDAdg7Lz
X-Received: by 2002:a17:907:9b03:b0:8f0:9566:c1ff with SMTP id kn3-20020a1709079b0300b008f09566c1ffmr1319871ejc.69.1677841765634;
        Fri, 03 Mar 2023 03:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677841765; cv=none;
        d=google.com; s=arc-20160816;
        b=NnPvoT1AX9NOUsn63ncLJtVg2iTEtoSi1TNQOOAyXYD6VP1j5HOSeIxTj93DjkMT5T
         lz2Jdu4rE0QYonifOsflsN1CfPedJbJJl0WawIEHqy7cUWFF6YGNLNxceuI3VQ/UYzgP
         9Z5tt99fVrg4DznJwvs1Qz3n60cyxUw20jQiy0LBMJ7WUViArnJMNMdQCHu5HiE0+qsg
         ipFzp8FNQdovXThvsBuraoQ4nC750B4uJN6JXAfcn3+QCwPWGZeWw08n7MtNHDP0eiyj
         U+EksW6uEjNxosY85Y9XBTC+jftYdNhKbUn+JvWRzG6Pul36oYZEGxW6t5y3uHDqb9Kc
         /3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id;
        bh=L11dCJW0UfsaPhZPtt5tOtDA6KlIN9Pk3O99VfJAcHc=;
        b=gPPqiOO9/vdK2zA8SsbRNtMq1vskvgDSTNWhgAzJ1z3Cm+xNiwbQnPjDAVe+dGCCT6
         Ajzq+1vlcJgh1cjxYFsRAAC2M4P384MwHzJhxB4G/RtxbnqyKRsf3sKdGHQ1U0EdyiyG
         fEpus7C532XUR7I7pkMEZaj666XJ0mzFdv4xZ7lCj5IWbNDakUDMdd3LwtM3pDap87i7
         N+RAZoQTAS/uYas1j2qVbh8X+k6C3MvUF71nWHYnRUpUnFjeidEZk1kzKk1CEu62UNzc
         5k+O3qjz+QIgV5Yi70KY7gsJMYXkfokDqbeDRddGvPMSAmKxfmV0wrGaYEvZnQDfrDSZ
         AxWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of glaubitz@zedat.fu-berlin.de designates 130.133.4.78 as permitted sender) smtp.mailfrom=glaubitz@zedat.fu-berlin.de
Return-Path: <glaubitz@zedat.fu-berlin.de>
Received: from outpost3.zedat.fu-berlin.de (outpost3.zedat.fu-berlin.de. [130.133.4.78])
        by mx.google.com with ESMTPS id sb24-20020a170906edd800b008cf79b051cesi1829645ejb.895.2023.03.03.03.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 03:09:25 -0800 (PST)
Received-SPF: pass (google.com: domain of glaubitz@zedat.fu-berlin.de designates 130.133.4.78 as permitted sender) client-ip=130.133.4.78;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of glaubitz@zedat.fu-berlin.de designates 130.133.4.78 as permitted sender) smtp.mailfrom=glaubitz@zedat.fu-berlin.de
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pY3Hv-003tSJ-6g; Fri, 03 Mar 2023 12:09:23 +0100
Received: from p57bd9bc2.dip0.t-ipconnect.de ([87.189.155.194] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pY3Hu-0022n3-VM; Fri, 03 Mar 2023 12:09:23 +0100
Message-ID: <89fd1c916b6c8094ea1a7a52396b3f91025c75c1.camel@physik.fu-berlin.de>
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
 Deller <deller@gmx.de>
Date: Fri, 03 Mar 2023 12:09:21 +0100
In-Reply-To: <6c1f0d05-924e-854e-0175-5e345945e086@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
	 <4bed38c3-ab4f-cd32-05a4-afa090ad8b9a@linaro.org>
	 <6c1f0d05-924e-854e-0175-5e345945e086@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.155.194
X-ZEDAT-Hint: PO
X-TUID: MLrX1i/FkH92

Hello!

On Fri, 2023-03-03 at 10:48 +0100, Thomas Huth wrote:
> x86 =3D=3D> deprecate both, user and system emulation support on
>          32-bit hosts
> arm =3D=3D> deprecate only system emulation on 32-bit hosts.

I would recommend against dropping support for 32-bit hosts for qemu-user
as there are some cases where the emulation of 32-bit user code on 64-bit
hosts does not work properly [1].

Adrian

> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=3D23960

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
