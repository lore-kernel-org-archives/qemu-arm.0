Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp497758wru;
        Wed, 25 Jul 2018 02:43:48 -0700 (PDT)
X-Received: by 2002:a02:ba85:: with SMTP id g5-v6mr5497969jao.6.1532511828724;
        Wed, 25 Jul 2018 02:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532511828; cv=none;
        d=google.com; s=arc-20160816;
        b=b6B6Iw+/LjftvaWcfuIs+Be2vX11RUKUYYh17tEVn8Alqnra2dBzGc8m31UeL3sn9q
         ZdRJjk/gdYwJb+5SyIzxrimKKHQY3bOmZOvGUaL8XjO7GrdZgfOyoAs7hiVrHKk0sbC2
         4Vo6Uep0JXOapWOu/nB72fwHRgbm3OBB4hBMztw9jsMwws/ZlwE4ROoeqzo7bNxScH5k
         rrUYn4k0CPqTMOZlMlriiPVw9VKeTbl7t5mdUmG47kBAjYku1oeyVnPsi/nnycEx5QJP
         Bd0T9YMhWZClRGKb4eO+KYJfc69f6/ueT7qsrxD0idNcbtQKCfaEbI9llnFRbVhM2a1X
         wOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZD6A2OS255EfHX+TiFZS+UGsr8aQ6teEUbFsVAF3k1A=;
        b=TNdjmgNnFQhD4QfBh9pliPTQe9s0eSV6CxM7iJAiEtZM0YhsQAJfRgmMboPaJD4YYy
         WB7h9/EGB6GDSrmjOM96Tsa8i+Q5c2gSwTkdPmUE3X3jDXf7jmdauTpZbaafwi3TblMv
         p3mx+DLKF9JdJzS3VCn5YRsIRbilTBZ1RiVHnjTp4kcK9Ln0+R67yJPb5G+ynUXyO2+X
         a9fA2W2pgnzeowGhtsi6jruj1runkhCpjnuSf3ZQEtlO46FyT7/BDR+nMjw8RatTufUY
         7pOivP5wmsnHua5zJYjbEZRlJQLJCFf7DuF3P0SbkDOSFqwDFRy2YZM9b2IczkFYvqI2
         fS4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ksw+hpDH;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r127-v6sor4454413iod.78.2018.07.25.02.43.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 02:43:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ksw+hpDH;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZD6A2OS255EfHX+TiFZS+UGsr8aQ6teEUbFsVAF3k1A=;
        b=Ksw+hpDH5nO8p8w6Vdv8odYiQ0M+ruP0fo2OJHROFcQFQW/NY+GhecHDBvvg4zn9vf
         UCL2ffyJuOCkPQJodbrUjwQaPMt10MRTEWYVtu6XrAMAxu2yLU0mQtAqt03D7+I5/dsC
         j6QJC0n5rS+y9yRRLh1O+YM7yjpt22mJtgrVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZD6A2OS255EfHX+TiFZS+UGsr8aQ6teEUbFsVAF3k1A=;
        b=bCvf9lXH5uiqSH7zgbbD15DlEXacsH8xWWHWr6spMdRJ0gTLuYaQ6i8bP1SXQb/VYm
         8YDm35ZjbLxFrgKQVfNWol1wN6TIKWPHYeWQXvkT8L6X3u80QZ2QFjXzcnFfBno7nAR0
         JNkjLTiyP642l1y+KFM6rBoCFB3yvi/sC/3iZlKUBO8d9G3sBao4PRzTpKFJOzrDDYgG
         TEBKSjNIZvN/HORRb4kGMuinWFgo37OerulwYs3eJnAVgsJDS1oZVJ3qsUpYD9vpN5Wp
         87fHK0E/EPRY1qkmEcKMOXBQmPHPJfQPFmW+CCsMScC6VOO3eQAHvm/5amSOxfM3KYiR
         DOmw==
X-Gm-Message-State: AOUpUlEJ5nai0GlgRNupYhivlrOnA/X+rlDpcz7stpr7v28vDvXgKDsd
	rXMMJziGyJeBeRdPuD05tokWnXskyygjR+jYb/Rhgwsk
X-Google-Smtp-Source: AAOMgpeZWwx9jTmiFS3mHPQWqhTydRLcHQPdTUZSFsvjZdoQcJUQgLQiFExJU+L78me6BWdyrcrlVBKRNJJxs6Cn5t0=
X-Received: by 2002:a6b:6104:: with SMTP id v4-v6mr15160808iob.94.1532511828390;
 Wed, 25 Jul 2018 02:43:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 02:43:47
 -0700 (PDT)
In-Reply-To: <20180725091837.GB12855@redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725084824.GA12855@redhat.com> <CAHmQWvDtNQsPDy1tCnsy9JbGzMxLAik5S0bBfpCj_0ig8=iZdA@mail.gmail.com>
 <20180725091837.GB12855@redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 25 Jul 2018 17:43:47 +0800
Message-ID: <CAHmQWvCNBgZatR4hdn4yunKn6+ocHith7ZQ86Re2jQ9xE4iwGA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: dtX07M776KsD

On 25 July 2018 at 17:18, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wro=
te:
> On Wed, Jul 25, 2018 at 05:05:06PM +0800, Hongbo Zhang wrote:
>> On 25 July 2018 at 16:48, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>> > On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>> >> For the Aarch64, there is one machine 'virt', it is primarily meant t=
o
>> >> run on KVM and execute virtualization workloads, but we need an
>> >> environment as faithful as possible to physical hardware, for support=
ing
>> >> firmware and OS development for pysical Aarch64 machines.
>> >>
>> >> This patch introduces new machine type 'Enterprise' with main feature=
s:
>> >
>> > The 'enterprise' name is really awful - this is essentially a marketin=
g
>> > term completely devoid of any useful meaning.
>> >
>> > You had previously called this "sbsa" which IIUC was related to a real
>> > world hardware specification that it was based on. IOW, I think this o=
ld
>> > name was preferrable to calling it "enterprise".
>> >
>> Thanks for your comments.
>> Frankly, I myself prefer to 'sbsa' too, in fact, at the early stage of
>> developing, we called this 'enterprise', but later I changed it to
>> 'sbsa' until I sent out v1 patch.
>>
>> The work Arm TF and EDK2 porting to this platform needs this name to
>> be defined finally.
>
> Why should EDK2 care what the QEMU machine type name is. The machine type
> name is purely a QEMU internal tag and shouldn't be visible in the guest
> ABI at all IIUC.
>
For example, in EDK2, ArmVirtPkg/ArmVirtQemuSBSA.dsc and
ArmVirtPkg/ArmVirtQemuSBSA.fdf are created for porting to the new
platform, similar situation for Arm TF, so the name is needed.

>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
