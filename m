Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1246786lfq;
        Sun, 27 Feb 2022 10:49:39 -0800 (PST)
X-Received: by 2002:a17:903:49:b0:14f:ae28:c3c with SMTP id l9-20020a170903004900b0014fae280c3cmr17759220pla.174.1645987779355;
        Sun, 27 Feb 2022 10:49:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645987779; cv=none;
        d=google.com; s=arc-20160816;
        b=naL8+zXPivZ8r79AJwdBVhrxwF0axqlQrZC8a99CnILwUVHc6LuaX5tDX1JP6PTv5l
         s60fbEDMEqySBNqL6KDEVtsQmRN/693Yb2todL50Al3nE9TrCGirPUJFMPLZ7Qmbh7At
         iSPbCowFiGxy8moyzJURWdgFqbpsJTBSL3kxQf0oi0yTjR90PtSXRSgCW3FxW8n1k9N2
         sASGRn4pv5HPhxZbXAM+s+/pjLumDjpwIhJLZ1ypv9KflkniRx3xIjRt/M9U4n7RSksx
         aFVBxfnsv5YW82cPgM50UEmlOSiDp3Bb3kWsjD5PkB6+B06RarURPo28q4jXmrn4WsHy
         QdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=54tej0WPztS1josBkKWB74KQL6RZ0g61PhZRQh9yWk8=;
        b=0bXFgN3fa9mcAsj7zBKTFMuYGkaay7oJqrkdDZzc3y92wXgZVRsE9TK7r8s670qyVy
         /4U4ugcR93Aj1iWrBBEdTW7hj42eVlpmrBwFjBtFlbMbd6kg5q8lhX93KHUxs2QT+Rpa
         6tA3jWbNPXg2UyZ2EgKK85/aeqGu9lpzr37tUSo2ii4tMC9+1YYyKPEhm4rN50htgDZh
         +3S0ZugkyrMY29IJJtR8raQUsL6jpUSw4fs507PymJzjsK8Ggzai9xQFHDA74Kw2Ltfp
         I6PYnig5nmihV7e8mIaYAra05JHZr2Ie575bxNPksQ42oIthJEaecyqZvXmtikeV1Fre
         LF1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=kC586PoJ;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v4-20020a1709029a0400b0014fe92899fdsor4310197plp.173.2022.02.27.10.49.39
        (Google Transport Security);
        Sun, 27 Feb 2022 10:49:39 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=kC586PoJ;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=54tej0WPztS1josBkKWB74KQL6RZ0g61PhZRQh9yWk8=;
        b=kC586PoJKxn3XdU8jOOzBcR34GU8EPB/p7f/LUP9KpLLapGdygup6Afw+Ui/8htULc
         jDoKkbuBddRAF6d0bA6fk2RgzLOh/Wo+NB8HSORJiSHuY1kgbLCW8OMovYilVnL62xFc
         eaBJuOkt9/AU+f5r+0gBswc/xIRPQJVOKsifzXPftHAYw0uLWnMVVA1Ljn/QattNhzco
         XTlpUvy4KNqBnQVmVX2XfBCGMl+n3oQBXTTfdyeua5iOatr9flT10NfA7U14au8P8mC0
         LEapkUwEzSmffXzjze41N/fdZfjBznADeOzGTdmBM8f4J0w6Zy2I8EsKNFz5tZQr0yJY
         JkZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=54tej0WPztS1josBkKWB74KQL6RZ0g61PhZRQh9yWk8=;
        b=z0spCuPOZL36uWqgAebXqwBygHpoyleFskOMFsvxPKEMZok+EueQwcNyne/poxrK3K
         KbMg4oTskzgVk1X4Yhd2oMtcAEJWCamsDC+nTKSuyRGTh/1hMGNeh+zDFaOmIDEtsYzj
         +IGL/fj8e/YChqAbU+VVoB3Y/WAIJitSvbmigKsFG/5ng8dopOk2Ote3mvWBcSHOh92f
         G1q5qt7PG1EOAlvRKdUNwxt7VgKlguGB8hoZld8bKalmAmzjFQMBUbg4gnnWY+n+K2o0
         teBQ4KXW6E4JhJazPq4iJu5vqu8Zyy395EZjDgA+tjsafErcOa6jT+F5kfTI++0Su1jZ
         ljPA==
X-Gm-Message-State: AOAM53096r0LR6jK6aubKGhy0vQuIgExPOMmIOM72mXZxFuSdwJTaWdh
	re9XRZHxNd87YlCJF6jsEPM=
X-Google-Smtp-Source: ABdhPJyE3uZTX3Ss6/oziXhnGRX26UgJfGcEh18aaN9UOUnMZGtEnqZYZuwBFmtdUbEBeloRFWEgRA==
X-Received: by 2002:a17:902:eaca:b0:151:4607:2ff3 with SMTP id p10-20020a170902eaca00b0015146072ff3mr8521152pld.54.1645987778940;
        Sun, 27 Feb 2022 10:49:38 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net. [88.28.25.32])
        by smtp.gmail.com with ESMTPSA id h7-20020a056a00170700b004e01663f59bsm11364362pfc.117.2022.02.27.10.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Feb 2022 10:49:38 -0800 (PST)
Message-ID: <5c6970c8-65ee-2b82-968b-676e0042a988@gmail.com>
Date: Sun, 27 Feb 2022 19:49:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 2/9] Avocado tests: use logging namespace that is
 preserved in test logs
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
 <20220225210156.2032055-3-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220225210156.2032055-3-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2YNjQZ4ZeG7D

On 25/2/22 22:01, Cleber Rosa wrote:
> Since Avocado 92.0[1], there's no universal preservation of logged
> content via Python's "logging" APIs into the test log files.  This
> changes were motivated by the fact that doing so is intrusive as it
> touches on Python's root logger.
> 
> Test writers are now expected to use "avocado." as a namespace prefix
> for everything that Avocado should collect/preserve, and other
> prefixes for logged content that should be handled differently.
> 
> [1] - https://avocado-framework.readthedocs.io/en/94.0/releases/92_0.html#users-test-writers
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/avocado_qemu/__init__.py    | 5 ++---
>   tests/avocado/linux_initrd.py             | 3 +--
>   tests/avocado/machine_arm_integratorcp.py | 3 +--
>   tests/avocado/machine_mips_malta.py       | 3 +--
>   tests/avocado/replay_kernel.py            | 5 ++---
>   tests/avocado/replay_linux.py             | 5 ++---
>   tests/avocado/reverse_debugging.py        | 5 ++---
>   tests/avocado/tesseract_utils.py          | 6 +++---
>   tests/avocado/virtio_check_params.py      | 3 +--
>   9 files changed, 15 insertions(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
