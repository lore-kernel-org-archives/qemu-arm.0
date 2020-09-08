Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp830924lfq;
        Tue, 8 Sep 2020 11:20:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyelCzUAOPKl4zVcAL3XpDjmMMg9Rgm8XCCTPSX/mfMGg7/kmGhxkpr7DHKEaG2l5tiuc5S
X-Received: by 2002:a17:906:4993:: with SMTP id p19mr28368748eju.277.1599589207370;
        Tue, 08 Sep 2020 11:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599589207; cv=none;
        d=google.com; s=arc-20160816;
        b=Bkp/TmxPp3A13yl41O66doukI4b9ccO9CjxfhlTzX0onANzoHFVr8uKnKIStxSfZ+j
         kIXJ8TR7p2aF6qjyawrKP5cTikhh4Pb/8R4ov1Rz0whVCsQYJZkpOiRV5vvK1Be168x1
         wA7KydB529HxgnoRVGmYjqkM23nMNqpV8RA5hH8Sosx2nSVF8b1lv/uT9m53q6/A32ju
         SqVQ7ZuhETA2DGxwRNrqk63gH9Wbow9IPyl/tKKZpIqa5+Wo1yCFzicXUqYHdOj1y0Fe
         vz7xtfpVgiOCyQSDqTZuidgMPq62nI1E4P5rQApw8QAOXM8+zxcETqXlTZI56wEndEdS
         bsSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jvlpPoSj7pyP9gpc3myQo1eavLoAV/LQv9NAFJNFpi4=;
        b=pttGKd7a1WL0TQJ5s1TBgaZkZZepHR0zSiDk+uBatlwUrP5LboQAj+wF926osfcsGh
         11kH7Uix++G958x6wkR4aXyEK3I95jVb5OrAhqEbz/WVvwWDeN4RuJMPXyFyUxu+6YVS
         3RfXqHuNgYbMiQdyeXZzV1nCHdue2cIIMMaElapy7spI8Ips2BfvBl0MlvHJH+I+PCaM
         c3h8+hZ+UDFU12FtHdAEjT8d4gaqUou8uNHbzGkQdPGTxqZWnQOpoiM0G8XZ8YTo9JU8
         B8fLTwjp2t8xUgXmlBL1bBcIPoTTYhbn9ezBC6fiir1aPTkNgfSH/hE9ZdIuo2Lxk0UX
         rGfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=avauB4QK;
       spf=pass (google.com: domain of wrampazz@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wrampazz@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id u2si12420598edx.5.2020.09.08.11.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 11:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of wrampazz@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=avauB4QK;
       spf=pass (google.com: domain of wrampazz@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599589206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jvlpPoSj7pyP9gpc3myQo1eavLoAV/LQv9NAFJNFpi4=;
	b=avauB4QKMCWlRMc0Wg6uqlKMhmpwuDOwJN8oUfM0pJEEG4sdJXOU8vvrcoI0g3GWCOhOf4
	wst0OK1EFGEcN/A+QxPUDA2uzBvwo7C1tBBtsXEo9Ofg+lgAjLjjFI4FeHmBDhy3gqiVUy
	Kka0jtI9+8gAGGzKcNNR0/AG3sR4Mfs=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-C_NycQAtNdmKJYtNfvvR4A-1; Tue, 08 Sep 2020 14:20:02 -0400
X-MC-Unique: C_NycQAtNdmKJYtNfvvR4A-1
Received: by mail-vk1-f200.google.com with SMTP id e4so80491vkb.18
        for <alex.bennee@linaro.org>; Tue, 08 Sep 2020 11:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jvlpPoSj7pyP9gpc3myQo1eavLoAV/LQv9NAFJNFpi4=;
        b=U/SpT82Mxj8jwlov/1mhoIT/KUSPBuTCak+8NNXa0IMhzRj/qZj+kMNatijQMES/sV
         Y8frLRRsNmZHeU9ixgaCbTbSjKrGg6sgLOFy1W0PMM4sZ1CtPv6dEvQLlj4mJo67pWv9
         01yhBHj/usLTw5uRwv2PCqXkZtNh9gplngUvuyPqcIaOAKkGO0A7ycqYnIOwC6MzZ/tr
         0++abk6Kkc1fHIp04Kje91XFFI4hKodTsRvDWMXhKYLBoG2Ltl4rnpZ6o6JEO/vQEEHa
         moZxwN+bijAQC+6BXMcBQ/OMVVrQXy6cIP8urB+/JOUCb4vLvYEVqFCXEmvC/Oz57W0E
         9uXQ==
X-Gm-Message-State: AOAM530ZBCLtYEVgP9jbH5JTvEIdx3ObRAKWJxRUj9zKKnhvddgjo2Qr
	uc9X67vo7FfSnDTpNuaqs3SgB+S5EjycL9icQKSZRPbUKAHms5sTgED/AegDdQOcif3j9vvKlLc
	Rq3LaFbZSbIj8zZ8j9qnTKkeztKjZHA5e
X-Received: by 2002:ab0:4387:: with SMTP id l7mr274242ual.133.1599589200012;
        Tue, 08 Sep 2020 11:20:00 -0700 (PDT)
X-Received: by 2002:ab0:4387:: with SMTP id l7mr274219ual.133.1599589199773;
 Tue, 08 Sep 2020 11:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200907042000.415931-1-crosa@redhat.com> <20200907042000.415931-3-crosa@redhat.com>
In-Reply-To: <20200907042000.415931-3-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 8 Sep 2020 15:19:49 -0300
Message-ID: <CAKJDGDZxML6ONPMphCtchNqoWps_C+h+Mk75KqMkQeTiZ8grfw@mail.gmail.com>
Subject: Re: [PATCH 2/4] boot linux test: update arm bionic URL
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Fabien Chouteau <chouteau@adacore.com>, 
	Antony Pavlov <antonynpavlov@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Aurelien Jarno <aurelien@aurel32.net>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Beraldo Leal <bleal@redhat.com>, 
	KONRAD Frederic <frederic.konrad@adacore.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Michael Rolnik <mrolnik@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Sarah Harris <S.E.Harris@kent.ac.uk>, Peter Maydell <peter.maydell@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: EQjjQILCV3yr

On Mon, Sep 7, 2020 at 1:20 AM Cleber Rosa <crosa@redhat.com> wrote:
>
> Which uses an xz compressed file, which has builtin support for
> decompression on avocado.utils.archive.  So the check for P7ZIP can be
> dropped, and extraction logic simplified.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/boot_linux_console.py | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 751b47b8fd..c75c512c8b 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -22,12 +22,6 @@ from avocado.utils import process
>  from avocado.utils import archive
>  from avocado.utils.path import find_command, CmdNotFoundError
>
> -P7ZIP_AVAILABLE = True
> -try:
> -    find_command('7z')
> -except CmdNotFoundError:
> -    P7ZIP_AVAILABLE = False
> -
>  """
>  Round up to next power of 2
>  """
> @@ -687,7 +681,6 @@ class BootLinuxConsole(LinuxKernelTest):
>          self.vm.wait()
>
>      @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
> -    @skipUnless(P7ZIP_AVAILABLE, '7z not installed')
>      def test_arm_orangepi_bionic(self):
>          """
>          :avocado: tags=arch:arm
> @@ -695,14 +688,13 @@ class BootLinuxConsole(LinuxKernelTest):
>          :avocado: tags=device:sd
>          """
>
> -        # This test download a 196MB compressed image and expand it to 1GB
> +        # This test download a 275MB compressed image and expand it to 1.1GB
>          image_url = ('https://dl.armbian.com/orangepipc/archive/'
> -                     'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.7z')
> -        image_hash = '196a8ffb72b0123d92cea4a070894813d305c71e'
> -        image_path_7z = self.fetch_asset(image_url, asset_hash=image_hash)
> -        image_name = 'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.img'
> -        image_path = os.path.join(self.workdir, image_name)
> -        process.run("7z e -o%s %s" % (self.workdir, image_path_7z))
> +                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')

I see you bumped the version here because version 19 is not available
in the URL anymore, so it is fine for me.

> +        image_hash = 'b4d6775f5673486329e45a0586bf06b6dbe792199fd182ac6b9c7bb6c7d3e6dd'
> +        image_path_xz = self.fetch_asset(image_url, asset_hash=image_hash,
> +                                         algorithm='sha256')
> +        image_path = archive.extract(image_path_xz, self.workdir)
>          image_pow2ceil_expand(image_path)
>
>          self.vm.set_console()
> --
> 2.25.4
>

Except for the subject and description seaming a bit confusing as
pointed by Philippe, the changes look good to me.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
