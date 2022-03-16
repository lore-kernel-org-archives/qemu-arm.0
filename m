Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3614517lfo;
        Wed, 16 Mar 2022 06:11:51 -0700 (PDT)
X-Received: by 2002:a05:600c:4295:b0:38c:7165:89f0 with SMTP id v21-20020a05600c429500b0038c716589f0mr1557579wmc.170.1647436311599;
        Wed, 16 Mar 2022 06:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647436311; cv=none;
        d=google.com; s=arc-20160816;
        b=oAJ8ujm889whR9mNvC3gbUZNPDiNgmiIFOvYI90NgkFIqYVKqEn6QRxZj/l61yTqnB
         CbO2hEjjIbO9AjwgWMk6Z6WQPeAzYZQSfyUd/Mkxvln+qEZs5RZ1E12Oc2movgOmy6wH
         C0VXePY88c85LTM/qExY5X6kD0gonQacDtAQQg8na+5PC8t4tGyC2CpilPxv4C4EFbTf
         VjAevYSwqML8lVUrnXSafgORWjo09UHwmmHuJul+0kByjVSVAjEbyhKtzfZLj/TDM4eo
         3m1l8PdHqOLgI1Utd5h4qd2a46koYEoxnoNGxV2FnM/EJItrgklHLd812buVXkXyCtZ4
         +jzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2i83XDmm2Ev/BgrOHivtFmnY20KZApSWVPqEjlo6vMc=;
        b=dZRgm99icamv3zZolLNG/iKcru1r1PG0Qbm+SwEJntJP/TAAER4DPaSE1KMZEa4quZ
         Q7AqQhi3qCh5U8o5b0Kkq1S6ipmNiPCh9Y8FqN5jhoULiF8S9xeqL4yu3XNW4xey0cJu
         hifCEMcUKLpxFXCU0wOY8K5WrzZz4vj/SL2IuBavhAQNNMDhMgL0mSluW0cFbTd1gc3u
         RhUXH4skJ7NDCXw57c6UfZcZ4imjHggC/fFGu7+VlxOqgpTA2qWbjwgFSleLEgMI4hBJ
         1XEcpfa9pLqomFm2Tmlinf9q9Lqjb+BpYEbS+pCQul7y7NXgJq4AHiRySjBVowk2lL25
         uj4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=I0LoEtV7;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l25-20020a05600c1d1900b00389e840cb33sor1704858wms.31.2022.03.16.06.11.51
        (Google Transport Security);
        Wed, 16 Mar 2022 06:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=I0LoEtV7;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2i83XDmm2Ev/BgrOHivtFmnY20KZApSWVPqEjlo6vMc=;
        b=I0LoEtV7ZSyQLZGg+c/ATH4O2ixcWNJOqGH0TXOK79vAFZNjBonSFVp592r0T/7Stp
         V+v8h5sbrekisgQegIG1FCeFUr22cuWgwFhHMikTRbJ45KfuWPiKQEZUaecWbjihlhrx
         MENjFnu75doFLFEX9a55JgbJOnVSV6OtSabROElRY3xK6lLAJ0aw2ZocBBCx1KmRY1VD
         648ynNf+mKMPV5CTv2HEH+9v293oTdsnnSTnEk0PsarBG61B1m+EG2Rv5QMxNLE7csxd
         stJ/6g1t4tZgZJ4JBasNOBwNeLtT4Uo9ttgG0df9r/Eq5ADZA5ynkNXA22esMLxs2Ako
         mZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2i83XDmm2Ev/BgrOHivtFmnY20KZApSWVPqEjlo6vMc=;
        b=pKNdkEBQO+4m/V0VPFBYmJRoODlOC21KpegnaAFPwqOvb0QXZUpnxgaBKdJmEVAGEt
         tFZJbRVupNrgSR+GUHD8ESw9w39x39sBdGPodC2ZkW163YPl7pkxER7vdJxzcrCGSIHs
         aqOQi1BjthEzlJ3tbIkygVEVnugioEe/JIey96aHj8HpG26naDqup60/S4975/mjplPM
         cO7FWciwSusx0q8yarv5yLsgUBpe3SnCA6KEj6xp4iPFG6gXXczEc662+tHAPdhqhNFo
         4A8JVSwFHDA6mvVgQh9d3tfM1e23hUD5FyigEauAhzRG1T4+iaabMzEZwl4IHtuVyF+D
         SvRQ==
X-Gm-Message-State: AOAM533AByVfe7LegPHaPJP+sR7qy3e7BGqPr+8S1hg62WB8wEU7tDZz
	YCP6FcXMcXnqzDLadkF4T7o=
X-Google-Smtp-Source: ABdhPJysxaC/TdNQa5HjTO1GOAcmUA/36gHHMfIT3uAptuoqQ0hHz0TwXQvnu9ctJ9Q0e5U7gtlggA==
X-Received: by 2002:a05:600c:1994:b0:38c:48dd:23ba with SMTP id t20-20020a05600c199400b0038c48dd23bamr4557931wmq.206.1647436311078;
        Wed, 16 Mar 2022 06:11:51 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b0038bb71518c1sm1689996wmq.42.2022.03.16.06.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 06:11:50 -0700 (PDT)
Message-ID: <e1f049be-8f98-04a3-6532-995e55fe7471@gmail.com>
Date: Wed, 16 Mar 2022 14:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 10/27] Replace config-time define HOST_WORDS_BIGENDIAN
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Coiby Xu <Coiby.Xu@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 "open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:virtio-blk" <qemu-block@nongnu.org>
References: <20220316095308.2613651-1-marcandre.lureau@redhat.com>
 <e709547a-a0c2-d1bd-7145-d03e9fd1776a@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <e709547a-a0c2-d1bd-7145-d03e9fd1776a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +4uqjqiHhVK7

On 16/3/22 14:04, Philippe Mathieu-Daudé wrote:
> On 16/3/22 10:53, marcandre.lureau@redhat.com wrote:
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Replace a config-time define with a compile time condition
>> define (compatible with clang and gcc) that must be declared prior to
>> its usage. This avoids having a global configure time define, but also
>> prevents from bad usage, if the config header wasn't included before.
>>
>> This can help to make some code independent from qemu too.
>>
>> gcc supports __BYTE_ORDER__ from about 4.6 and clang from 3.2.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   meson.build                             |  1 -
>>   accel/tcg/atomic_template.h             |  4 +-
>>   audio/audio.h                           |  2 +-
>>   hw/display/pl110_template.h             |  6 +--
>>   hw/net/can/ctucan_core.h                |  2 +-
>>   hw/net/vmxnet3.h                        |  4 +-
>>   include/exec/cpu-all.h                  |  4 +-
>>   include/exec/cpu-common.h               |  2 +-
>>   include/exec/memop.h                    |  2 +-
>>   include/exec/memory.h                   |  2 +-
>>   include/fpu/softfloat-types.h           |  2 +-
>>   include/hw/core/cpu.h                   |  2 +-
>>   include/hw/i386/intel_iommu.h           |  6 +--
>>   include/hw/i386/x86-iommu.h             |  4 +-
>>   include/hw/virtio/virtio-access.h       |  6 +--
>>   include/hw/virtio/virtio-gpu-bswap.h    |  2 +-
>>   include/libdecnumber/dconfig.h          |  2 +-
>>   include/net/eth.h                       |  2 +-
>>   include/qemu/bswap.h                    |  8 ++--
>>   include/qemu/compiler.h                 |  2 +
>>   include/qemu/host-utils.h               |  2 +-
>>   include/qemu/int128.h                   |  2 +-
>>   include/ui/qemu-pixman.h                |  2 +-
>>   net/util.h                              |  2 +-
>>   target/arm/cpu.h                        |  8 ++--
>>   target/arm/translate-a64.h              |  2 +-
>>   target/arm/vec_internal.h               |  2 +-
>>   target/i386/cpu.h                       |  2 +-
>>   target/mips/cpu.h                       |  2 +-
>>   target/ppc/cpu.h                        |  2 +-
>>   target/s390x/tcg/vec.h                  |  2 +-
>>   target/xtensa/cpu.h                     |  2 +-
>>   tests/fp/platform.h                     |  4 +-
>>   accel/kvm/kvm-all.c                     |  4 +-
>>   audio/dbusaudio.c                       |  2 +-
>>   disas.c                                 |  2 +-
>>   hw/core/loader.c                        |  4 +-
>>   hw/display/artist.c                     |  6 +--
>>   hw/display/pxa2xx_lcd.c                 |  2 +-
>>   hw/display/vga.c                        | 12 +++---
>>   hw/display/virtio-gpu-gl.c              |  2 +-
>>   hw/s390x/event-facility.c               |  2 +-
>>   hw/virtio/vhost.c                       |  2 +-
>>   linux-user/arm/nwfpe/double_cpdo.c      |  4 +-
>>   linux-user/arm/nwfpe/fpa11_cpdt.c       |  4 +-
>>   linux-user/ppc/signal.c                 |  3 +-
>>   linux-user/syscall.c                    |  6 +--
>>   net/net.c                               |  4 +-
>>   target/alpha/translate.c                |  2 +-
>>   target/arm/crypto_helper.c              |  2 +-
>>   target/arm/helper.c                     |  2 +-
>>   target/arm/kvm64.c                      |  4 +-
>>   target/arm/neon_helper.c                |  2 +-
>>   target/arm/sve_helper.c                 |  4 +-
>>   target/arm/translate-sve.c              |  6 +--
>>   target/arm/translate-vfp.c              |  2 +-
>>   target/arm/translate.c                  |  2 +-
>>   target/hppa/translate.c                 |  2 +-
>>   target/i386/tcg/translate.c             |  2 +-
>>   target/mips/tcg/lmmi_helper.c           |  2 +-
>>   target/mips/tcg/msa_helper.c            | 54 ++++++++++++-------------
>>   target/ppc/arch_dump.c                  |  2 +-
>>   target/ppc/int_helper.c                 | 22 +++++-----
>>   target/ppc/kvm.c                        |  4 +-
>>   target/ppc/mem_helper.c                 |  2 +-
>>   target/riscv/vector_helper.c            |  2 +-
>>   target/s390x/tcg/translate.c            |  2 +-
>>   target/sparc/vis_helper.c               |  4 +-
>>   tcg/tcg-op.c                            |  4 +-
>>   tcg/tcg.c                               | 12 +++---
>>   tests/qtest/vhost-user-blk-test.c       |  2 +-
>>   tests/qtest/virtio-blk-test.c           |  2 +-
>>   ui/vdagent.c                            |  2 +-
>>   ui/vnc.c                                |  2 +-
>>   util/bitmap.c                           |  2 +-
>>   util/host-utils.c                       |  2 +-
>>   target/ppc/translate/vmx-impl.c.inc     |  4 +-
>>   target/ppc/translate/vsx-impl.c.inc     |  2 +-
>>   target/riscv/insn_trans/trans_rvv.c.inc |  4 +-
>>   target/s390x/tcg/translate_vx.c.inc     |  2 +-
>>   tcg/aarch64/tcg-target.c.inc            |  4 +-
>>   tcg/arm/tcg-target.c.inc                |  4 +-
>>   tcg/mips/tcg-target.c.inc               |  2 +-
>>   tcg/ppc/tcg-target.c.inc                | 10 ++---
>>   tcg/riscv/tcg-target.c.inc              |  4 +-
>>   85 files changed, 173 insertions(+), 173 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index f20712cb93d7..88df1bc42973 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1591,7 +1591,6 @@ config_host_data.set('QEMU_VERSION_MICRO', 
>> meson.project_version().split('.')[2]
>>   config_host_data.set_quoted('CONFIG_HOST_DSOSUF', host_dsosuf)
>>   config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
>> -config_host_data.set('HOST_WORDS_BIGENDIAN', host_machine.endian() == 
>> 'big')
> 
> Can we poison HOST_WORDS_BIGENDIAN definition to force cleaning old
> patches before merging them?

Now noticed elsewhere a patch #11 doing exactly that.

Addressing Halil comment in "exec/cpu-all.h":
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
