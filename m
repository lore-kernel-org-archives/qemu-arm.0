Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3546113lfc;
        Mon, 7 Sep 2020 00:52:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz09tcQUF7NZ4uC/WucnNYNrwLnjRMrvAQWVzjkgGyQlwGf0n8/ly2BlhdILaM3eIzdYVYQ
X-Received: by 2002:a50:8881:: with SMTP id d1mr20469492edd.306.1599465136781;
        Mon, 07 Sep 2020 00:52:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599465136; cv=none;
        d=google.com; s=arc-20160816;
        b=LqOXSTmDrCAg8yBoO7mv2t/iGvWl1kP1wXk9jPLw2dQDFU8zy4uVV/3qiKhnj+83jX
         e7HDST0XuP8TgSUqxhPtPNgwd3Ko0gnrvau/9RbHPbRYT0Fv6+suKyyEe8lNZa6qW9WI
         tj8vBVyINFPsEHBXN1dg/gPCfkDa+We8WmjcO4wMXzOEgbBXCsPlm1RsNTeHKn8jfnxH
         NuqkatdfIKX9jQGpZmHFKpCnKDto0rt3ahXcxu0Nxs6ant+GQyK+D1aUPl1+0BX9rFYo
         QdaS0mkPJZ1c5mjCHdgnQ9XZA4aXEetwump6dDUCk2HcIl20h5YBZ16xvNlmSaky2Yqb
         RRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=+wSsF8eTINKgZSHvd5ZHdV6zTMB/1j30M/WThtSZOeA=;
        b=i7NsPkj5bVSbwza9etkHza1K2B7eR4crsyJUJRw1GrQywGsFu6uQfyw+PmEKddkq1Y
         ij1ilwTMIcLANcK5TwlqTLRrVM/f8RqU7O8LyHw5LM1tm0dAq5XfOjcJdTNH4lcprek+
         oeO4urG+GwA/Yrq6svR+7yxK/hUTFbDm9nIvZ4df63N0AXj/1JJSPnnr6HdlAkm83R8c
         LbZr/Zt8DGmIydy6cPAvawtIAHM2bL0fVH+76QNyd9Sx1sGY56rsUEAmXuU6lrKSQ3ih
         G01kVDgTKctbe7NiEH8YSXzalIRh1wWzGx3kffBkOqq9WCyopTjN1r1bwIEycuHKbC/J
         mmjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aWOsnkAc;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id dd3si783245ejb.499.2020.09.07.00.52.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 00:52:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aWOsnkAc;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599465135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+wSsF8eTINKgZSHvd5ZHdV6zTMB/1j30M/WThtSZOeA=;
	b=aWOsnkAckm9la6EhkI7sVJMa3SGWHvyZZjCT+Qg4PWTqMwMtAQG0u8jrsmvt1t+vivvmkJ
	EE1vV0IHPdiaKRX6DNpOTTdtJH8t09R5MdLUaM6w1fGoxBe1XfiO/cuAbA4R92p9qnyqBz
	NDq739/oypcH2Z471mRkarbrdLZrkEQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-JpOOdo2AOrKu6ilPgYDoVg-1; Mon, 07 Sep 2020 03:52:07 -0400
X-MC-Unique: JpOOdo2AOrKu6ilPgYDoVg-1
Received: by mail-wm1-f70.google.com with SMTP id l26so2554529wmg.7
        for <alex.bennee@linaro.org>; Mon, 07 Sep 2020 00:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+wSsF8eTINKgZSHvd5ZHdV6zTMB/1j30M/WThtSZOeA=;
        b=YaS1yRLe5btpr+HdrUMMJdAIR4Mm/Bag8UlCsZBOhEMzD4qPf5+Em4X0KmN1XbAPLL
         bM7Z3u7gQ4VRIP60Gz1YqaGv8RYzkgUTcU+ijZa2DgJw5ALFFXA1qV94Ehggc3quxqj2
         ypK9zfYA9tAbSJ0AQ4OQdVbxJPjWL6krZoXS2J2JApS+dwcdPypEVOk4YICXWU9zsQhV
         Ergwb3Glc3OTOoffreNMUVvbOlxOcXy7ykre2iS+r/Ri8T1l6fJuRH2bKa/6CuaUI8JN
         qVUEtgI9xE53vxfMx6nQSXFmKqJaGGhVeuP7V1tDZMx8qb+0ZRPcEAqQGLgFNtXMOjQq
         KjLQ==
X-Gm-Message-State: AOAM531NggiLmD+YpNbAr4/yEDIH/HAqiqzzWrKqeq+MV0zqVdGxuBQo
	ObexSovF16rh9WRnNDhKqyz1djUFXhFvsdtrql0PDqudkkJfJGn1dn0URLY7POM7E4FgvTIs00q
	eCflCnPqCmzK+ozlD
X-Received: by 2002:a7b:c958:: with SMTP id i24mr20133967wml.50.1599465126185;
        Mon, 07 Sep 2020 00:52:06 -0700 (PDT)
X-Received: by 2002:a7b:c958:: with SMTP id i24mr20133951wml.50.1599465125934;
        Mon, 07 Sep 2020 00:52:05 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id p3sm6329146wmm.40.2020.09.07.00.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 00:52:05 -0700 (PDT)
Subject: Re: [PATCH 2/4] boot linux test: update arm bionic URL
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200907042000.415931-1-crosa@redhat.com>
 <20200907042000.415931-3-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <261b05da-0546-23fb-3e01-df0d17c0a825@redhat.com>
Date: Mon, 7 Sep 2020 09:52:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907042000.415931-3-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: vvkvUCSXEYfl

Hi Cleber,

On 9/7/20 6:19 AM, Cleber Rosa wrote:
> Which uses an xz compressed file, which has builtin support for
> decompression on avocado.utils.archive.

This line doesn't make sense without the patch subject
prepended "Update arm bionic URL". To make commit
descriptions coherent, please copy the subject.

Not all email clients display email subject right
before the email content.

> So the check for P7ZIP can be
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
> +        image_hash = 'b4d6775f5673486329e45a0586bf06b6dbe792199fd182ac6b9c7bb6c7d3e6dd'
> +        image_path_xz = self.fetch_asset(image_url, asset_hash=image_hash,
> +                                         algorithm='sha256')
> +        image_path = archive.extract(image_path_xz, self.workdir)
>          image_pow2ceil_expand(image_path)

Nack, this is not the same test. You might be lucky it test the
same things, but this is not what the developer tested.
This is not how acceptance tests are supposed to work IMHO.

>  
>          self.vm.set_console()
> 
