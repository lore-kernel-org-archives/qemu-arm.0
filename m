Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4884865lfm;
        Tue, 14 Apr 2020 04:35:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypKMRKsLFT7Cx1tdis6NljAv96Vqooax7NVxEM8zXFEswomuuxgOIqBInh36ngTg+N38Qk9f
X-Received: by 2002:aa7:cb4e:: with SMTP id w14mr5483953edt.168.1586864126206;
        Tue, 14 Apr 2020 04:35:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586864126; cv=none;
        d=google.com; s=arc-20160816;
        b=AQBZvbCvq4aZwRMyfiVATya/x6D5n8lFAHrrkT/2wbe0fLyi3oI+mNiFIqm/obrBdJ
         lJp+s4swIRrlhPoGxtgI5WHv4zIrkRVQAMLkZ3ar+F2HQo84b6FOd1OXmxB4TylSaeP6
         DBBnu1lQN02eDv0cZWKSeJMceZPdwrNlbn42I87gDxYGTAohlsQrfmoFwkwR15EkyYeB
         O3JtTk3CPFGhx7w61AXRgASANKXdgdzUUocYlyMxeMismHioA+Opxr6tB0sqxgVhmfdV
         XyEwuBO3PTopu5vjA0t3Y+ZPL4ndJDtAWOOtDwyxiPBJW6JxiavBRr/yLA6GVYvHRjAR
         Bmdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=TkWkv1sSQkb10ESnJ81NX+eXLN9yPeO5ArhBlLlo7kM=;
        b=0z83q+UWdE3y09fkdqnf4mdzYDw4ws8vJ9LCbInqtqxTknB5Xgw9xXjaltLTCljXQg
         fUTpDv/y4PWLptnH4LebCJJjn9gDKXAxtrU3razBYKruluXUVwVDrLMdVTk5IvWlyIpl
         jooikYBzFRLse1XisDGvXqNGip0mP7zwuaoCmNfUG8f3m5NPT6BH/xDPHXZIAzIS+43j
         hHO/iuOwX9jhewAyOWf+Q5uDVnFZZjgMn2rMfcalV++MRqF8K30bLhJMrGzkquw4TWUG
         XR1iXWRjxlNSiVgddGtQX0u7SyFW9ELMKkl3A6+OKHE5+bOdo5pQEqpk9orHyaxcFR6v
         S0Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g3qI1N+W;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id b1si8707868edh.318.2020.04.14.04.35.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Apr 2020 04:35:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g3qI1N+W;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586864125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TkWkv1sSQkb10ESnJ81NX+eXLN9yPeO5ArhBlLlo7kM=;
	b=g3qI1N+WndwWYqYJQt38oWJEWlUKHYiNwTLiHOVj/UNJM5AMndteBpSKBqTZv0AeTjtjz3
	QT94hQXFr4755O4AqZAzixyKEv3m5OdTPgSNiGhF1DXLWi5DbKE/+kBg0JIVEpxFtAhKqq
	OP0QmQgQbkQnTBgEWmiwA/4KpnvQgX8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-28zlHIRVOrWwrSRzeWwZhg-1; Tue, 14 Apr 2020 07:35:21 -0400
X-MC-Unique: 28zlHIRVOrWwrSRzeWwZhg-1
Received: by mail-wr1-f69.google.com with SMTP id v14so8527118wrq.13
        for <alex.bennee@linaro.org>; Tue, 14 Apr 2020 04:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=45deY+ympfnEFZqUmSQTtjgToLUZLlw6E2wOzJRdDj4=;
        b=od/hn2Ykc6D/eCncqbaYjDtJizt6BIAlcWHy8MANhJQZ16a7DcTyYnnHSfja8G8afk
         BxKdgupYq8tYM8WAyCl8GD9IoXiHz1cm5Ce8jqajY07uM5RfsuRHc30Fqx5bQX5O+Pfr
         hmDm5eKXXF5jY6KwdMlbdXWn2Tmn+U3ibKkVBToF3nkD4E2qM8wap3ST73OZiAuKUk65
         iwY5rt/OpyvwDIqKmWrZ5uq85yiYrPntlLSY8UKExjcSptZjU+s2acIAsV7jWqAmxfRb
         zwbnjNK+g5d4sapc2NH99IllBQ7az+BdD25pgLiEck3dJMxtPB3OGXv84jNqkKKPIwKi
         e4gA==
X-Gm-Message-State: AGi0PuaH3RfyCyiUPm/vZKteRIHAyoDmG4c3TQHeaB0sLrMgmJi+b4lF
	1QxKEHoB8qe/UudnErQE7Kgo5Yd5TiSuGx/8bDUYvOnyN2E3xN7P/L00++dx2yg93nLnewnakwq
	VysiUHPsUr4rVOcvK
X-Received: by 2002:a1c:bd8b:: with SMTP id n133mr24582562wmf.175.1586864120306;
        Tue, 14 Apr 2020 04:35:20 -0700 (PDT)
X-Received: by 2002:a1c:bd8b:: with SMTP id n133mr24582536wmf.175.1586864120106;
        Tue, 14 Apr 2020 04:35:20 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id h26sm18105559wmb.19.2020.04.14.04.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 04:35:19 -0700 (PDT)
Subject: Re: [PATCH-for-5.1] gdbstub: Rename GByteArray variable 'mem_buf' as
 'array'
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Marek Vasut <marex@denx.de>, Aurelien Jarno <aurelien@aurel32.net>,
 Chris Wulff <crwulff@gmail.com>, Richard Henderson <rth@twiddle.net>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20200414112849.21787-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <09f9ae36-f8e9-8412-cd97-f3f386907b6f@redhat.com>
Date: Tue, 14 Apr 2020 13:35:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200414112849.21787-1-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: eOcyrOQeMOq4

On 4/14/20 1:28 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> GByteArray type has should not be treated as a u8[] buffer.
> The GLib Byte Arrays API should be used instead.
> Rename the 'mem_buf' variable as 'array' to make it more
> obvious in the code.

I forgot to mention this variable was used as u8[] buffer prior to=20
commit a010bdbe719 ("extend GByteArray to read register helpers").

>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Based-on: <20200414111846.27495-1-philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>   include/exec/gdbstub.h      | 34 +++++++-------
>   include/hw/core/cpu.h       |  2 +-
>   target/alpha/cpu.h          |  2 +-
>   target/arm/cpu.h            |  4 +-
>   target/cris/cpu.h           |  4 +-
>   target/hppa/cpu.h           |  2 +-
>   target/i386/cpu.h           |  2 +-
>   target/lm32/cpu.h           |  2 +-
>   target/m68k/cpu.h           |  2 +-
>   target/microblaze/cpu.h     |  2 +-
>   target/mips/internal.h      |  2 +-
>   target/openrisc/cpu.h       |  2 +-
>   target/ppc/cpu.h            |  4 +-
>   target/riscv/cpu.h          |  2 +-
>   target/rx/cpu.h             |  2 +-
>   target/s390x/internal.h     |  2 +-
>   target/sh4/cpu.h            |  2 +-
>   target/sparc/cpu.h          |  2 +-
>   target/xtensa/cpu.h         |  2 +-
>   gdbstub.c                   |  6 +--
>   hw/core/cpu.c               |  3 +-
>   target/alpha/gdbstub.c      |  4 +-
>   target/arm/gdbstub.c        | 10 ++--
>   target/arm/gdbstub64.c      | 10 ++--
>   target/cris/gdbstub.c       | 34 +++++++-------
>   target/hppa/gdbstub.c       |  6 +--
>   target/i386/gdbstub.c       | 92 ++++++++++++++++++-------------------
>   target/lm32/gdbstub.c       | 18 ++++----
>   target/m68k/gdbstub.c       | 10 ++--
>   target/m68k/helper.c        | 24 +++++-----
>   target/microblaze/gdbstub.c |  6 +--
>   target/mips/gdbstub.c       | 30 ++++++------
>   target/nios2/cpu.c          |  8 ++--
>   target/openrisc/gdbstub.c   | 10 ++--
>   target/riscv/gdbstub.c      |  6 +--
>   target/rx/gdbstub.c         | 22 ++++-----
>   target/s390x/gdbstub.c      | 28 +++++------
>   target/sh4/gdbstub.c        | 38 +++++++--------
>   target/sparc/gdbstub.c      | 46 +++++++++----------
>   target/xtensa/gdbstub.c     | 20 ++++----
>   40 files changed, 254 insertions(+), 253 deletions(-)
