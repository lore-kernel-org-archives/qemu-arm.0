Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp135005lfq;
        Wed, 23 Feb 2022 05:34:30 -0800 (PST)
X-Received: by 2002:a17:90a:600a:b0:1b9:dd79:ea77 with SMTP id y10-20020a17090a600a00b001b9dd79ea77mr9262902pji.44.1645623270386;
        Wed, 23 Feb 2022 05:34:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645623270; cv=none;
        d=google.com; s=arc-20160816;
        b=qapRwFa25O5xSuelrtB8cTFWKG127RKUCgU1w6cvdEKdocgf1vlPBn2XbY4ychEuV9
         QCuVvylxjMU4LRLhZBW50B4+IsENH16lebxvfB2nFOHVkJDBjSHJmbMQtqtRYa0maD++
         n2j28uFD2e6Gs8jfNJfhNgYMscrX/aro5yQngwpo7CLMGchbfAsT6C2CsHyuYNqsfCA+
         XQjfFAR4FLztA8R/kzZx4udtpvWzqZbl4Wh1B3sa+g53zO1Frc0RlnZsid6Oo4CjcKg+
         jMaufBfCOR0HNhEpwgB+WORKJFD3M82xkH28BkJ9a6DL7ZQp2hj+bWOqHFkV0Com/MVN
         L6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VCh4vuuX/P112tsW9ayY6uH9gaq3mhObhMfWnbW5l8w=;
        b=nNqsdNyQByZFeVY0mFP0ERl6+2NI1xvH/Sh7E1E9HSLA3CUrMCDdxvITb+3fg/UvfV
         i+dJbpX5TISND0ZNsSyMOScbDr/iHH0R0ypCS6/V/5TF6FcRyad3BqwXLR12WWUjKs+J
         Zx72bmZgDOmWNKqhMPCLNYAvebWlcEfo9HlRoXyFiIzHeVFHxKVuLIUu5TPx/s9tqgu9
         jif8nVpf5/WC0YiWNdB16AMDYOeOi2NIXX6rkr6Pw39dALwTMYVr9w88/F8kA+fgy3hh
         xR4M7szy3fxlTaujWt4wJ1hwchBkOzd2yFEcY6U5fbsWKYq917bbmXOXpzE+Vlmb7y1m
         lgQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=g7pjR9Jl;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t39sor9099522pfg.45.2022.02.23.05.34.30
        (Google Transport Security);
        Wed, 23 Feb 2022 05:34:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=g7pjR9Jl;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VCh4vuuX/P112tsW9ayY6uH9gaq3mhObhMfWnbW5l8w=;
        b=g7pjR9JlYrhGzhIa0SerGNXPZdANzlA7BE2vCJgY0lZbxr5ZpE1zEF4iDDjFnrJyp5
         gH+9zN+JoAAEdRehLlh2DPgWp1raJIZZPUZqNcw2dWCjdgKo0tVlXkLu7oDOeYyatcgQ
         SrBFRL2gaUMVYIA29YCWCZzWA2EzWCkvHJeNukqut5e7rHnz+2pMG/7FUbRd+DKXf+bX
         YVcN4fM32BnLUPBQac+VZ75nLoBJaeb1W03q7LhnxRY5mWD19mtbx3Jce7B3BVHBSYWL
         913mroboYdwmF2KNMLsdDoDK7mWMJX/fXDxU7iorzDT4GzmRJpKMOB/bCaVheZ5aretN
         kQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VCh4vuuX/P112tsW9ayY6uH9gaq3mhObhMfWnbW5l8w=;
        b=Zt0A3tWeXYklUHbN5rBA/xyk5C2iXha/Lw3NRoaOfiu1H2OCibElcD3/UjYMH5tDqp
         K34fCFSp2SzfkGcKsj9UHnbDXCpHnDou/XII1+PReqw9V1+jw7EOMGdEnbMMYiahGI/I
         5AN8qOOz7UJGF21mcGrsorgvue9OJcfivqKaDN/6nf/Vol71QakJ/BV1IvmxhlC36cT8
         XT32bdbWVq6U17Wi7O9sTLck4p1VK7PYZigDL3dLEs2PxrMprtQZTlr0TpeztSOQrUx6
         eEECSHxbZqVdd9oNXS1qmXBS3BuUhNUaXBn6DJf7N8fbZR7IoQ8+wrtq605IYRL8BRfD
         322w==
X-Gm-Message-State: AOAM533GXIZLDikZe+iJTJYp1HNUgtZTnwSV2QGFCj3/bXNnE3/5fp/3
	z6O4+HKKulqD9hV4MCa2AOqSTNaxum4=
X-Google-Smtp-Source: ABdhPJx2tnTh5YTLqmhumTeKL6wRqtrXXGxVCFrFM9//rJsBJYnT24j9FwRy71fC8a4pPm5HoGHVVw==
X-Received: by 2002:a63:f60a:0:b0:373:4c34:1aaf with SMTP id m10-20020a63f60a000000b003734c341aafmr23776819pgh.268.1645623269918;
        Wed, 23 Feb 2022 05:34:29 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net. [83.50.68.71])
        by smtp.gmail.com with ESMTPSA id kk13sm2569269pjb.44.2022.02.23.05.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 05:34:29 -0800 (PST)
Message-ID: <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
Date: Wed, 23 Feb 2022 14:34:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Laszlo Ersek <lersek@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <cleber@redhat.com>, Oleg Vasilev <me@svin.in>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Idan Horowitz
 <idan.horowitz@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <YhYVVnVSL8K1S4MC@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <YhYVVnVSL8K1S4MC@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mjZXWmTYUVSh

On 23/2/22 12:07, Daniel P. Berrangé wrote:
> On Tue, Feb 22, 2022 at 06:33:41PM +0100, Philippe Mathieu-Daudé wrote:
>> +Igor/MST for UEFI tests.
>>
>> On 22/2/22 17:38, Daniel P. Berrangé wrote:
>>> On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
>>>>
>>>> Alex Bennée <alex.bennee@linaro.org> writes:
>>>>
>>>>> Hi,
>>>>>
>>>>> TL;DR:
>>>>>
>>>>>     - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
>>>>
>>>> Laszlo,
>>>>
>>>> Would it be possible to do a less debug enabled version of EDK2 on the
>>>> next update to pc-bios/edk2-*?
>>>
>>> NB, Laszlo is no longer  maintaining EDK2 in QEMU, it was handed
>>> over to Philippe.  I'm CC'ing Gerd too since he's a reviewer and
>>> an EDK2 contributor taking over from Lazslo in EDK2 community
>>
>> We need the DEBUG profile to ensure the bios-tables-tests work.
> 
> Can you elaborate on what bios-tables-tests needs this for, and
> what coverage we would loose by disabling DEBUG.

Maybe it was only required when the tests were developed...
I'll defer that question to Igor.

> It may well be a better tradeoff to sacrifice part of bios-tables-tests
> in favour of shipping more broadly usable images without DEBUG.

Why not, if users are aware/happy to use a unsafe image with various
unfixed CVEs.

Removing the debug profile is as simple as this one-line patch:

-- >8 --
diff --git a/roms/edk2-build.sh b/roms/edk2-build.sh
index d5391c7637..ea79dc27a2 100755
--- a/roms/edk2-build.sh
+++ b/roms/edk2-build.sh
@@ -50,6 +50,6 @@ qemu_edk2_set_cross_env "$emulation_target"
  build \
    --cmd-len=65536 \
    -n "$edk2_thread_count" \
-  --buildtarget=DEBUG \
+  --buildtarget=RELEASE \
    --tagname="$edk2_toolchain" \
    "${args[@]}"
---
