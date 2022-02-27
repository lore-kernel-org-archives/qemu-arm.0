Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1246044lfq;
        Sun, 27 Feb 2022 10:47:48 -0800 (PST)
X-Received: by 2002:a63:2008:0:b0:373:8a9b:5d35 with SMTP id g8-20020a632008000000b003738a9b5d35mr14431159pgg.264.1645987667776;
        Sun, 27 Feb 2022 10:47:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645987667; cv=none;
        d=google.com; s=arc-20160816;
        b=A40rlreinKgno9g9I7ijy/AgB0xLBzUYKZo5jJDpANp7XxNDjwnvX7ZR0JPQjCA0fI
         7s6XOvaht3kkcoxNvcEz/+TXMjNK0JP9GDF+FXFGplsrFyd9+qRLggZY1ine7sW18wzk
         aZxTKtipYtN98FREGr2EFmOplkAqqdtfxGdK0Rl221mTt9bPAxqIXW8g2ayoatI2+tQj
         VnnVDrtd9IdewU5f3PVJd3FK5rywFd7j7lx75ZItO6au+xgpIvIC/nlVqz9WXy75eGkq
         PCpmmLpZJEhd5tKjfO7IXhqyBGcn2o2W78OQmXUyqpdJKOJ414KbtmTfhalhVCAgQQCS
         FKKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OY3pfGWUsLZBu/ETt+n7ibzfe4YwlbmuZ4OlQ6KUiNo=;
        b=E0PVy61D5tn60uXooe6mfp8kluqYLOYnrlXp6R/HSpL3IR9qX41ZUmv9N2AQWocGkQ
         vtXfby+DToQ6GkN1C9WRBfgGWAXvZhmdhFrQdOtlVh+dL3YE20+t3w6zzasRXQ2EmDLF
         wYG2IyQd7uqO9kIC2TkdJeWD60G/MRQ16y+deGLBGs5ZaM5uhCGY1u1jHbHOHk2DaBad
         qofD12aa29RgmqfXZCwLmZqkGydfHZ2SAp9sxfT9zKNWD8Cggaj49+XBy7UCJoQx+8uF
         +MlNYYRXXbgWxGfDcsPdt3tfqQaf9QUOxOTwadq4u+CQpDU1BAwkEFM7juTzNDEacknr
         TuUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TlQecfmV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z1-20020a170902834100b0014fe92899b7sor4353476pln.103.2022.02.27.10.47.47
        (Google Transport Security);
        Sun, 27 Feb 2022 10:47:47 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TlQecfmV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OY3pfGWUsLZBu/ETt+n7ibzfe4YwlbmuZ4OlQ6KUiNo=;
        b=TlQecfmVe1+eeE8ORifZZuvB1A4uKk2ZclNe2INRq26XXZqRPVuwUOhWS/H0Qy++FZ
         Wkc/QuV24s+bysk/l9aL2VGsBGVztqUflv5AsqvUoKysFiWCi6BgachvrYJxdqhfxw6b
         OZRNJIAEUoU5wfChY0xgsJ7y9imYfPanMsDg3U+yJSjSf4jaE4HmmOFBHjDnPhPdjfL9
         DE23+SLD37WGoAexvx2jldPsMkAB6kXEJcEnWITxXSlazM6H2HKr8t2WtLwEt7qe+wHJ
         moTQuzDXgtbc3xcQTBDWZojLi0cdN+j/B6LOHG5lwplHxjvkzLYxQqqyBtbhDxPD2Qq0
         SEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OY3pfGWUsLZBu/ETt+n7ibzfe4YwlbmuZ4OlQ6KUiNo=;
        b=zaNF1AEhUVwgBjBN4slJnIYNt8IvP0YmOmYWf9AsEEMZe8LzulPPR1RAvDUcxQTv1n
         QX3dNKqtD8Ahjqg+lcbUULCkEF7z5Dtm+KdVh0bfdd9+v2pzvjrdu9KImW0MS+9UpJ4c
         rAtkk62s4plhJcfk4H5w3Xn7iVfXABnFrZ8wXKUJbtxhFdbA1NoQqFPziZ0M6WAF8LpK
         OskLg+OXotl0hkHDOm3Eo20RpckL3slVmg45jHBC4nTaR94Ner3km8VPKsA+XKFSeAsP
         5hNZ1+Q4nqUg7j6yV0I4kjcxTScJ4Am2t41cN7mDxkq+j3gSXPAQSphI4rER7nR3P6DR
         fr3w==
X-Gm-Message-State: AOAM5306KkSYakfR5Xm47r9gID2SgyOb6hBXlC9oWxXYnSZrwttjKcUW
	Qyvjv/Bx4lFIG28iQXdJCa4=
X-Google-Smtp-Source: ABdhPJxCkMIGGOts1Pdm1oYByYn9N9VfJoWODhxqEwujtpTdFKQwsiPrNfHW7WWrwmhA3/3drhEteA==
X-Received: by 2002:a17:902:c1c4:b0:14f:b5fa:f945 with SMTP id c4-20020a170902c1c400b0014fb5faf945mr17283993plc.169.1645987667289;
        Sun, 27 Feb 2022 10:47:47 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net. [88.28.25.32])
        by smtp.gmail.com with ESMTPSA id h22-20020a056a00231600b004e1784925e5sm10565165pfh.97.2022.02.27.10.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 10:47:46 -0800 (PST)
Message-ID: <aa0e1eb4-ef43-b386-e7a3-c034f666181b@gmail.com>
Date: Sun, 27 Feb 2022 19:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 5/9] tests/avocado/linux_ssh_mips_malta.py: add missing
 accel (tcg) tag
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Farman <farman@linux.ibm.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
 <20220225210156.2032055-6-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220225210156.2032055-6-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: fDeBsvnJP6TX

On 25/2/22 22:01, Cleber Rosa wrote:
> Being explicit about the accelerator used on these tests is a good
> thing in itself, but it will also be used in the filtering rules
> applied on "make check-avocado".
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/linux_ssh_mips_malta.py | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/avocado/linux_ssh_mips_malta.py b/tests/avocado/linux_ssh_mips_malta.py
> index c0f0be5ade..0179d8a6ca 100644
> --- a/tests/avocado/linux_ssh_mips_malta.py
> +++ b/tests/avocado/linux_ssh_mips_malta.py
> @@ -23,6 +23,9 @@
>   @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')

Should we remove this line then? ^^^

>   @skipUnless(ssh.SSH_CLIENT_BINARY, 'No SSH client available')
>   class LinuxSSH(QemuSystemTest, LinuxSSHMixIn):
> +    """
> +    :avocado: tags=accel:tcg
> +    """
>   
>       timeout = 150 # Not for 'configure --enable-debug --enable-debug-tcg'
>   
