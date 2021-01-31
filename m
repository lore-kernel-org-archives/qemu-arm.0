Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2624077lfo;
        Sun, 31 Jan 2021 04:36:34 -0800 (PST)
X-Received: by 2002:adf:9523:: with SMTP id 32mr13914494wrs.361.1612096594347;
        Sun, 31 Jan 2021 04:36:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612096594; cv=none;
        d=google.com; s=arc-20160816;
        b=FHvkBCPjRvSsTG5OlucPF1N260WDGnm0JEAfIYenSjMYpT0+gYTPUwOB6iAuKdzJkL
         s9qcmN4VyWmKtyGQgDRwLnBZKBrI/1tcaRdsxMQtRiv0QOq+rhyN9ad5CHLKoxUFh2uS
         OjLhOLMM4JdzQUhTWPO30LTWlRb2heoxcEie9j40KOkVx/1WLlFeIdHRER8B1FbCA77H
         0FB64u0T/ujaun4MiNqDOMPaz2kx6QyibWU4jbk+3kWrbQ4jc+uvttfjFLIpTQ3UpTGE
         T2CGoxwU5JaKlgBqu4kCFHkwbWEMgO8b1ZocY+GG9zLr3TLzFBrRIlsO+X1vJLx58RAv
         tlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=SlPVp/QhGLIucOeXf2GAys5Xs3M9ZcVjsvA0z2gXN4o=;
        b=pncYqli6jWcWI4IGMHNWuz4IMiTf5KYfJAyXUKGAYjLl613gEqkKpFRWTF0/uX7kbI
         cxWouLRn7n9drbuTIdxs//v3HUB7TaW0VJQElPKjuIshThWXgJXx79cpahns30sKXD9n
         NvdweWRvMVb/1dTo6TrYmptPGlfKJvXMHlQ3C4+uLmt9R7OmlaDjD1vNOB1sDD0B0oEh
         PgksSiNMmRmtbswPoCxeq/J56TlIWsOZJr5wvtw3vytpcBnNx7NXGAuHKpqftZFZCOtr
         ++fgukXHl/KcOn+pKlNifPpZcWK8q59Gl5I9C6eITcW0ICSsxkbvcwIMB4DuHMstGfn8
         kC2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GqF9nNkg;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m8sor7172269wrv.0.2021.01.31.04.36.34
        (Google Transport Security);
        Sun, 31 Jan 2021 04:36:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GqF9nNkg;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SlPVp/QhGLIucOeXf2GAys5Xs3M9ZcVjsvA0z2gXN4o=;
        b=GqF9nNkgn2avmaYgMPwoNKRqTrCOmYlhjcSJIIM1a525tHHZGokwelM3VxqW9GfU3A
         HEeLfJ26Y8GiggTDcd8voUsssPtXfKtE9pl6TB9a8171kJ6lbfYQB//8UBw9PCbYH7a6
         EqVY3pwGeNTAS9MVRXwig/mcReaRpUFYSZF7nvLvr6zyDvesdvIlynLasC41Ohrv8hfv
         fZbPuFsaA9kHV91Xku1duzJ1qzyxSpwDpGL42iPrk/lWGl+rilDElZWKztrBCbBw/Ade
         PgbwkfTGoY/QMivj+j+fXN5p1X7sum2107zX4v8e5dIT6Tmo5kZS7c5IcvS9Vg+wTuIM
         UoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SlPVp/QhGLIucOeXf2GAys5Xs3M9ZcVjsvA0z2gXN4o=;
        b=Cx7BpnJTAKbK0dfm8kHJTqovYN5p4fV8/FCIO9p9RUjanvAPJVCqAJFhQ+IAsQvXU8
         T1jOmAtkSWkyrVlDh9Eahg42oW7hMrd0gv8nCqXELoLJoeNyh1Uo6IGNxLLQJIGTAw7i
         7GOtt1YZeUa2a5kMHAWrDJ8E2eljWaIZM2mGUuG18ndoKzXTEG6WsRTwXlOp2O6xLAm1
         bUw7PIdxiGKyuwLx84b+kmeIkJ23cLtb3UHaWDiOXQPFe54AVPhyulhAa8Wf8ONXzu1s
         fRrh7ucYubqPNz4HrLG0jimaHBitIRlCg90OZmoANLU+J3oA92C3wnbBNgwX636VShrO
         CMUg==
X-Gm-Message-State: AOAM5339Y6nVzWv1labTXGHjs/M9rBZZu+HugJhIKnY+mwg8DUqbT1HY
	llSMSIbRhHiI/b7A4Dn+LR8=
X-Google-Smtp-Source: ABdhPJwav7PbpTPE6lRzujkZ6yrrDC5Aycgug4nFeHODSjoMTWkGUOKecg5Ror2BMadj4R5bOHipCA==
X-Received: by 2002:adf:e511:: with SMTP id j17mr13477973wrm.17.1612096594084;
        Sun, 31 Jan 2021 04:36:34 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id q6sm21580414wrw.43.2021.01.31.04.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Jan 2021 04:36:33 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 05/10] meson: Introduce target-specific Kconfig
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-6-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d4a706cb-11ac-1c79-9641-c061bffea829@amsat.org>
Date: Sun, 31 Jan 2021 13:36:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131111316.232778-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: AsJSCqT5+s3v

On 1/31/21 12:13 PM, Philippe Mathieu-Daudé wrote:
> Add a target-specific Kconfig.
> 
> Target foo now has CONFIG_FOO defined.
> 
> Two architecture have a particularity, ARM and MIPS:
> their 64-bit version include the 32-bit subset.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
...

> diff --git a/meson.build b/meson.build
> index f00b7754fd4..a2dda0ce95e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1322,7 +1322,8 @@
>        command: [minikconf,
>                  get_option('default_devices') ? '--defconfig' : '--allnoconfig',
>                  config_devices_mak, '@DEPFILE@', '@INPUT@',
> -                host_kconfig, accel_kconfig])
> +                host_kconfig, accel_kconfig,
> +                'CONFIG_' + config_target['TARGET_ARCH'].to_upper() + '=y'])
>  
>      config_devices_data = configuration_data()
>      config_devices = keyval.load(config_devices_mak)
> diff --git a/Kconfig b/Kconfig
> index bf694c42afe..c01e261e4e9 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -1,4 +1,5 @@
>  source Kconfig.host
>  source backends/Kconfig
>  source accel/Kconfig
> +source target/Kconfig
>  source hw/Kconfig
> diff --git a/target/Kconfig b/target/Kconfig
> new file mode 100644
> index 00000000000..a6f719f223a
> --- /dev/null
> +++ b/target/Kconfig
> @@ -0,0 +1,23 @@
> +source alpha/Kconfig
> +source arm/Kconfig
> +source avr/Kconfig
> +source cris/Kconfig
> +source hppa/Kconfig
> +source i386/Kconfig
> +source lm32/Kconfig
> +source m68k/Kconfig
> +source microblaze/Kconfig
> +source mips/Kconfig
> +source moxie/Kconfig
> +source nios2/Kconfig
> +source openrisc/Kconfig
> +source ppc/Kconfig
> +source riscv/Kconfig
> +source rx/Kconfig
> +source s390x/Kconfig
> +source sh4/Kconfig
> +source sparc/Kconfig
> +source tilegx/Kconfig
> +source tricore/Kconfig
> +source unicore32/Kconfig
> +source xtensa/Kconfig
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> new file mode 100644
> index 00000000000..3f3394a22b2
> --- /dev/null
> +++ b/target/arm/Kconfig
> @@ -0,0 +1,6 @@
> +config ARM
> +    bool
> +
> +config AARCH64
> +    bool
> +    select ARM

This isn't correct yet, as Kconfig is primarly designed for devices,
and per docs/devel/kconfig.rst:

  "devices are usually ``default y`` if and only if they have at
   least one ``depends on``;"

So having one machine "depends on AARCH64" selects AARCH64 on ARM :/
I'll see if explicit each arch as 'default n' helps...
