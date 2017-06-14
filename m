Received: by 10.25.0.23 with SMTP id 23csp520343lfa;
        Wed, 14 Jun 2017 15:30:58 -0700 (PDT)
X-Received: by 10.223.169.138 with SMTP id b10mr1457459wrd.29.1497479458570;
        Wed, 14 Jun 2017 15:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497479458; cv=none;
        d=google.com; s=arc-20160816;
        b=iGHYlwJlvk5Cyfb78jA0hwuQHgT4QG8qYMavE0LfbJVw6G2vAJKPfk4qZuFlVCTFR0
         uUHgQULQUk6COPloCDwhOkfAPB6ITyblqBDVDjK/XjXfhfQdJnQ8+p70/FovoiYj65Jm
         AH+1KlPV+ylezXAKaOP4S4+J4EEiKhpeGNelbB0gmANqcHnB3AX95hNXh+rSRRfUpyR8
         CFaOAb/OqUVNKmeTB8tU8bNLKcned359GXx2pAiw+9LlQUw6lD7GA8YYE1A9sptelK5s
         WKk5AF7FGnGF77tYZVRqtDJgAX9iGwAqMZt6b2UI7ixPRhNwoi/0vXWYB3f6Zb778KxT
         GFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :arc-authentication-results;
        bh=QqMhd962cOU4rF9fbiQ8E5oD8Xpm829rARgGwU5MbY0=;
        b=KrMOVV9CIspAUD5g//bLHKTlTRk0DCEHSZtDRlS1bFuZkBquXNbTSzNAHSTQaDBZBi
         WR2Yb7wnLWY05SbCfjyxT+DkkLSVinP603W0QqM8VdZCIR8qmtcHDGnbomSd4QbLbcjq
         rT6Z3tBtoiBsFa3haFE4FQYu9SiMpFiSFDRwn/YVW6r8WP+m9q7VaG3453TCcz7fSOb1
         0AQ3iyIqMJA1jlN92epZSEz267ZlA3ocnyiZrhlYDdlPMiJSw9GPLWk0uFlruhRHx5yW
         a9htWMbRNrnHwOsYcmpXYnFUZckflTWXCGwfm6o0uFbqEoS+1a9uJoSx3XZ9bkhjlGiS
         HbcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.17.13 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.17.13])
        by mx.google.com with ESMTPS id i128si1235284wma.122.2017.06.14.15.30.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Jun 2017 15:30:58 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.17.13 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.17.13;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.17.13 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue104 [212.227.15.183]) with ESMTPSA (Nemesis) id
 0MZls6-1d7aVi0WWE-00LXyi; Thu, 15 Jun 2017 00:30:48 +0200
Subject: Re: [Qemu-devel] [PATCH v6 1/6] Pass generic CPUState to
 gen_intermediate_code()
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Alexander Graf <agraf@suse.de>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "open list:ARM"
 <qemu-arm@nongnu.org>, Yongbok Kim <yongbok.kim@imgtec.com>,
 Stafford Horne <shorne@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, David Gibson <david@gibson.dropbear.id.au>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Michael Walle <michael@walle.cc>, "open list:PowerPC" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <149727922719.28532.11985025310576184920.stgit@frigg.lan>
 <149727923488.28532.12388479748363447374.stgit@frigg.lan>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <65d56373-029a-14a0-8058-04659946cee7@vivier.eu>
Date: Thu, 15 Jun 2017 00:30:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <149727923488.28532.12388479748363447374.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:pRSBA95mLnryu/Z+5Wvg2Ej9cMEZiQ4EXxpnvYkC7D0Ovn3KXTz
 kq7mSSzpESnPeKL6tK11eYZpLM9eay8j9UVHdtDs/hhdYo5FQVLjE3+1af0dcbRPegKDRKT
 HbGUCTpezvVjadex0OvYdvMlElj5dKZx4QhJRkgkuBbRPYbAytfofXwgQG6N1lxpx0Yf4a1
 09mdLEIHFjwjdWC/lm4CQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:PLjajjbRiR8=:3OGIQJF83Ml2mrHKF+Dnc8
 N/KS1F8YvHct2bKyD/T4NcR0+VTG/TkeNjrNm2GRvksn4sW1dBojkefQ8d4ljsSBKu+CKBmZe
 t1p+oRcELVILzfkABLgtPZ1b7ijhiMXFFUD1k+MQX9zvd6x6rMba8DfKNd8O7w8elSxRFjJ32
 k6C3kUi+5Hz8PJfd+q14Rs3zyFj45bA34PwpykbEE/026xtOnUAf3MMrQoh3vIohDD/8n4RJ4
 XIsjYBWpIb9E68ANPmxdrXAFx7hP7gsp/aXLsUuMhOsYQeelCt9NkU2u2sgS+0HvlC7EktEfz
 PVQpoBZ41vz7Z7Jksi/alQNoHWJS+H9T9ZG431Da80VbtMnBUNLFY88z89K2LuDtwZV+zb91/
 Wduq9evkIhOjUE/p451RO8EV0Otsy2/Iqh1m3p5hQ99lTzO2IoYcQ4y2dm7/+3TIJNdzjq5DC
 lVRobC57lsRbKLuA/ZtiRH/QmVeJKKtHyfSJYMzKAnMghmRawlajOuvLRMNujFXnwHoJdnvwZ
 WSh62l7t3TrTvS521s579t34Jt8Khm+MdJyOxMj1bJ4LQYvNyasvj8LY71BmhVsmSsM++HNuA
 bGyBs9CBt40DCFLV6ygh1Ca3il6F5cxvXpqF0XnQFdl8rLaUqwqY8in3bkUipfcZhsjWI6rKb
 Gz28jxqW/Z4bRU8AGlu4HjW3jgo8O8XxiU1Yy8Sf5Tc8k+/CbhzZVHV0GVpZjtwcALpRTFCgr
 /eVkoCQIjiYnN4Oj
X-TUID: yre5+CTRcOzD

Le 12/06/2017 à 16:53, Lluís Vilanova a écrit :
> Needed to implement a target-agnostic gen_intermediate_code() in the
> future.
> 
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> ---
>  include/exec/exec-all.h       |    2 +-
>  target/alpha/translate.c      |   11 +++++------
>  target/arm/translate.c        |   20 ++++++++++----------
>  target/cris/translate.c       |   17 ++++++++---------
>  target/i386/translate.c       |   13 ++++++-------
>  target/lm32/translate.c       |   22 +++++++++++-----------
>  target/m68k/translate.c       |   15 +++++++--------
>  target/microblaze/translate.c |   22 +++++++++++-----------
>  target/mips/translate.c       |   15 +++++++--------
>  target/moxie/translate.c      |   14 +++++++-------
>  target/openrisc/translate.c   |   19 ++++++++++---------
>  target/ppc/translate.c        |   15 +++++++--------
>  target/s390x/translate.c      |   13 ++++++-------
>  target/sh4/translate.c        |   15 +++++++--------
>  target/sparc/translate.c      |   11 +++++------
>  target/tilegx/translate.c     |    7 +++----
>  target/tricore/translate.c    |    9 ++++-----
>  target/unicore32/translate.c  |   17 ++++++++---------
>  target/xtensa/translate.c     |   13 ++++++-------
>  translate-all.c               |    2 +-
>  20 files changed, 130 insertions(+), 142 deletions(-)

for m68k part:

Acked-by: Laurent Vivier <laurent@vivier.eu>
