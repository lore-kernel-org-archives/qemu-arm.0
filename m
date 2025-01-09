Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp1356066dlb;
        Thu, 9 Jan 2025 04:13:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnRgm+97aeiuZ2lQTZuIYjcuOtAIw2iC0L5YkRYNQrl6KUUS3a4gXhcyg0oFt2yDB7Lb3m
X-Received: by 2002:a05:6214:20eb:b0:6d8:8742:137c with SMTP id 6a1803df08f44-6df9b230fefmr82167116d6.24.1736424802628;
        Thu, 09 Jan 2025 04:13:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736424802; cv=none;
        d=google.com; s=arc-20240605;
        b=AiAPVkND00h4+b07VUtCxB97zXHaln1N4ldEluJd09dDv9Ij8LL2/+t9L1Ic8CYUOz
         zBMERr05VNbjyfWs7baYjSqZUkgqZApbkX70IaioVD4/SVZ5GfcOzDytQNWCyMbEHkTL
         qnM+408Mo1o+KGNEfkQpTk43Xk9+t8lI6uG9s1lb3oph5nMvnkvYCHmIF5H3Z5y+d5gs
         CQMYaB+ZsIQmy8JnHHZ/+Nrr4zbq9LiPT/UBuoM1SMJm/xj9M3WeQdHEerrrX2HaLW9T
         C6TLakKvgYnlBiL6sTZ46ODXeD43DF7UzHRnH7vW+7VNwmacUBxgi/JQGN8w7gpXZZt4
         5Y9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=95jH6vHVWwQhzjGzsxp2UEhTwqVMJr7Wv8BTRN7e3fA=;
        fh=K1uvSxsKJoSHoxwjrofBEXa5CvRS+XOKTRKz6jL3fh4=;
        b=AosnwTpPGJdDJlwY28X5IMg3hB+qDuZRE7HN8qQ2qvNcny5viR86bpHlf7IZrIR6I9
         x00XbYoeFRkjSKudyT2+Jy5f+6NCvivbrxyXhYrxFWtQ7pbtEGFqgh1614BDThDhQ/8z
         RYZChKbNFGYMi98JbcqhKv60OjAGEpZ+YAmJGOeZyM4M6EFJO7g8l1y8WpRgnNJRwH2o
         a1DtD3PPhCZpC4YsdVMSZZKbq6NlRMTPrwJTK1X9zf0UB+sYzOluaAtkEo2XGG8asJuM
         ukDoD96PtciPIA3YrDR2AlFTR921KsdeCgHB3PVIGEdR97hyHvs9T2G8mZ1d6euPFVR8
         T/aQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="LdIf/qG3";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18233419si650836d6.206.2025.01.09.04.13.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:13:22 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="LdIf/qG3";
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736424802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=95jH6vHVWwQhzjGzsxp2UEhTwqVMJr7Wv8BTRN7e3fA=;
	b=LdIf/qG3p/UCskhWUpmbcLnqtZQxEyZpZ6S8NsAzXZTd6DOPPEF9AYJZNKpsgJP3d6c5vK
	GACtQ8+wZVbciP/7T2At44i9GFH5JX75xGHQTDu/TCkNQyYpfS1RT/1sK/mLJkyHD54rFv
	7zC4ZaPgN5Lo0JL7L5pTTdtkakMIJoM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-Fd64NFBNOYetZ98qLx2IrA-1; Thu, 09 Jan 2025 07:13:21 -0500
X-MC-Unique: Fd64NFBNOYetZ98qLx2IrA-1
X-Mimecast-MFC-AGG-ID: Fd64NFBNOYetZ98qLx2IrA
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d3f0411814so659627a12.0
        for <alex.bennee@linaro.org>; Thu, 09 Jan 2025 04:13:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736424799; x=1737029599;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95jH6vHVWwQhzjGzsxp2UEhTwqVMJr7Wv8BTRN7e3fA=;
        b=GvoWOHGk8jFBAY59YFXvLulkCqbkj9ZBMbPKmGZWzDSeqDBl3TO7URZD30lWa8e2KM
         o24I94scdqqBEAQSbidNJenTh42T+QLky3afvxAIwdegWHrQ8kG6v1d2M8LteRekdoj+
         c6ZfwCZ6GkDdEB/EIx/7NYS9QDq8+v0fTJ1a4SHSiRsfU3JtIxXrIWOM/RN+Y2+31aoN
         2KgCJ06vhCnKOgYngZNyFM/fCcW7w1I2WOdTjV7ym+kSPGz06lWpvHx2kG5cSlpOXjwv
         leIPnhLqNokU3BxPAySLBlV7okp2yHvy0wldU+u2cadxa94xc6tTqOyifsbyxB7CddtU
         3Zvw==
X-Gm-Message-State: AOJu0YwRpnQIIkTfLvWQpa8gyLD4VL9syTDNOV7A3gDf1WtypbK4FiTG
	kyF0sWjsORUMuXSMeyFPdCqn1LT+3xBsRJKWk7VfIHzWQUval+VzrZO07RghZUJaPF7DqGsVD5d
	FDx3FpczNKFPR2TxpE+nnst9IHKESMMnfp60RceAf8NVWxWbnKIx1NxM2ydASZHzi6rhRVtoVb1
	kWMMEKtp5cZxf9O4+obCZvnb1lqSovfhE8wepgi1oz
X-Gm-Gg: ASbGncuI/kIW3rwIc7ZYnXf9FSMSQDlvaoA1xdGh3mvNphl1MKkEjY+W1ha83Gruw7J
	Xzit7v6Lna9ILcGKGUtdE7LvaKy4XH+J7NVIYJTMlB5dZie86PL+lw/MzgW9UKmpuyWth1qjTVP
	hszrUHh0dLtHEaB3RC6tjQcsikcsWk3IYJoiPeaLX9ygUoAFEHFH0JZoHct0ju1wP/3v/y0kShb
	rO5DFIDuD9JnbBLm5u5M25FU/jfWbzRgpGqk0V79bhZNSZSC1WSVarZgkhH
X-Received: by 2002:a05:6402:3585:b0:5cf:e66f:678d with SMTP id 4fb4d7f45d1cf-5d972e6f913mr5652975a12.28.1736424798863;
        Thu, 09 Jan 2025 04:13:18 -0800 (PST)
X-Received: by 2002:a05:6402:3585:b0:5cf:e66f:678d with SMTP id 4fb4d7f45d1cf-5d972e6f913mr5652903a12.28.1736424798385;
        Thu, 09 Jan 2025 04:13:18 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.10.27] ([151.62.105.73])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d99046d7d5sm528421a12.66.2025.01.09.04.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 04:13:17 -0800 (PST)
Message-ID: <82cc1e4a-7035-457e-a020-9a5e12f9a30c@redhat.com>
Date: Thu, 9 Jan 2025 13:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 30/32] pc-bios: ensure keymaps dependencies set vnc
 tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <lvivier@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Laurent Vivier
 <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Eric Farman <farman@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, Li-Wen Hsu <lwhsu@freebsd.org>
References: <20250108121054.1126164-1-alex.bennee@linaro.org>
 <20250108121054.1126164-31-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20250108121054.1126164-31-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YX8U0IMtJ2pco4izX_AK9tX8lM9-1AAWdO4DJ1eIejU_1736424800
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: a9dVaoc1KG99

On 1/8/25 13:10, Alex Bennée wrote:
> I was seeing failures on vnc-display-test on FreeBSD:
> 
>    make vm-build-freebsd V=1 TARGET_LIST=aarch64-softmmu BUILD_TARGET=check-qtest QEMU_LOCAL=1 DEBUG=1
> 
> Leads to:
> 
>    qemu-system-aarch64: -vnc none: could not read keymap file: 'en-us'
>    Broken pipe
>    ../src/tests/qtest/libqtest.c:196: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
> 
> which was as far as I could tell because we don't populate the
> $BLD/pc-bios/keymaps (although something attempts to symlink
> qemu-bundle/usr/local/share/qemu/keymaps/ to that dir).

That something being scripts/symlink-install-tree.py.

This is where QEMU looks for the keymaps and your patch ensures that it 
is populated before running the test.  Please add the above info to the 
commit message just for accuracy; otherwise:

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   pc-bios/keymaps/meson.build | 17 ++++++++---------
>   tests/qtest/meson.build     |  2 +-
>   2 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
> index 0bd8ce0077..a79a09b276 100644
> --- a/pc-bios/keymaps/meson.build
> +++ b/pc-bios/keymaps/meson.build
> @@ -39,19 +39,18 @@ else
>     native_qemu_keymap = qemu_keymap
>   endif
>   
> +keymap_targets = []
>   if native_qemu_keymap.found()
> -  t = []
>     foreach km, args: keymaps
>       # generate with qemu-kvm
> -    t += custom_target(km,
> -                       build_by_default: true,
> -                       output: km,
> -                       command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
> -                       install: have_system,
> -                       install_dir: qemu_datadir / 'keymaps')
> +    keymap_targets += custom_target(km,
> +                                    build_by_default: true,
> +                                    output: km,
> +                                    command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
> +                                    install: have_system,
> +                                    install_dir: qemu_datadir / 'keymaps')
>     endforeach
> -
> -  alias_target('update-keymaps', t)
> +  alias_target('update-keymaps', keymap_targets)
>   else
>     install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
>   endif
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c5a70021c5..f75c1057a4 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -383,7 +383,7 @@ qtests = {
>   if vnc.found()
>     gvnc = dependency('gvnc-1.0', method: 'pkg-config', required: false)
>     if gvnc.found()
> -    qtests += {'vnc-display-test': [gvnc]}
> +    qtests += {'vnc-display-test': [gvnc, keymap_targets]}
>       qtests_generic += [ 'vnc-display-test' ]
>     endif
>   endif
