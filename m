Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp78685ejb;
        Thu, 30 Nov 2023 01:02:46 -0800 (PST)
X-Received: by 2002:a17:906:340c:b0:9be:fc31:8cd3 with SMTP id c12-20020a170906340c00b009befc318cd3mr13977195ejb.17.1701334966577;
        Thu, 30 Nov 2023 01:02:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701334966; cv=none;
        d=google.com; s=arc-20160816;
        b=gH34CibLBFn0kKKtBmGCUK+0KlYFPQmHWJG8r6XYbn4p/1Nn3kkgoJMMEpouot4wIn
         4G6xZa2afYk3w4tYIWgtc1k47lFPcD2NE2hzfkA3RDYzuLQNhBKhQA5QgS2OAP02Lc8h
         ptBi47zzjxMc7yelVyODdZ2qCN2tAcyHbjjKOe0ipQO3r71Wivru4+kxZl6Ic97FMFmi
         cLF27Xy0GL7zgUWAbNR4uCRMAMMo26AXBpVYRJwHQmUD8sqCIuMCvxZWZdHFJ/yLNh4C
         44LM/b++AairjwQoid6CUpgUy1zvIDrAHu0KzUtmi6krOaIM44jJAqzKOpntMgKtn9xf
         nlLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:dkim-signature;
        bh=dN4djQbmfKsEe8CLCBFczIlNB941kshQNbbSdFz94k8=;
        fh=6nAzhoAXHalBwI7r8HAtyQCRHjPDlLK1O6MeKCMUP9E=;
        b=LzMJGBXlfvT20zEyrqJZAocyQnCNcSQagflnat9EE1nPJDPtCC1bCV7gy9TOr7r5WJ
         ipgSBgYAdkJaVVhGleeS4VkEH1P56ZtjCJuGSyr8q/ZJPTi6nA44oiKGdCQrZBcI4zUp
         iWnNg89zYfCwHmUHcp52RVjbyZEPymvYxltCRGypLSrQx5hJdclXR+8UbU05Vn2zcrOF
         pgyr1wmbORPuNIqN1xrIryB9kCoMxL673DLVNnRn5CqcvGMYYrbD/h8lXFrF063qFEaa
         gURA0kyIrs36FAtnRqlAD1muaYgBkWWo128ZXxWnL00gKKU1HN+9aCOQZJiI/LstIuGk
         fDXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="eM/1YFYE";
       spf=pass (google.com: domain of xadimgnik@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=xadimgnik@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <xadimgnik@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 8-20020a170906208800b00a1631f4cfc5sor257985ejq.19.2023.11.30.01.02.46
        (Google Transport Security);
        Thu, 30 Nov 2023 01:02:46 -0800 (PST)
Received-SPF: pass (google.com: domain of xadimgnik@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="eM/1YFYE";
       spf=pass (google.com: domain of xadimgnik@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=xadimgnik@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701334966; x=1701939766; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dN4djQbmfKsEe8CLCBFczIlNB941kshQNbbSdFz94k8=;
        b=eM/1YFYENV4wPWrFvIPfBZIWPNwMOTlsQXgmgDNobp5kiVNJcpvpPQ4JFmi2vCEkZl
         PXQFGWT1ILR5GxStgEHhCSbU90CLiWxL5/z5krbsNQqw2xqijQ6b3FQYOWyQTEbCA7oU
         BbWmr3q24I6UhAIu3YrUKY04gS21Y0Vbk2RQRK+5spHFSV0hNPNhfTaNxTogTssE1GYe
         hL8bqwe2jSNQkIRcEED5bI5vWVqMVfQuelAtURDMvnZfbKA8EWL5U3hClOMzxavUPlVV
         QU7Njt2g14p+EqcucfPbJ+4+folQk3gOZ/aOZ2R8aetxh3ORJ6mAFXLVBJt4Tu68GFC8
         hMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701334966; x=1701939766;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN4djQbmfKsEe8CLCBFczIlNB941kshQNbbSdFz94k8=;
        b=nRVAgGZQjVM9zLZ8qyL/Sxc1hM2mK9qQiL2B5X1kZ9VTlQvxZpbPOANdm5LewPDqwC
         XDDNFpiWQTvkuQWF/l9OQmK4YVxEZ0J10harL8kLpYbkfnMIUorqQozbqmbTyI+LsuL7
         LgLdsdhrNcqvlv87Bq76tWM2BVhDAYioNlRRM2nNYEq2y/mduRacHP5MflO6jbp3MepF
         w5Nss5Cy/YoptToWdwxyH/p0KFfw3xs+elWUA15w8EGwzpWFhadLj/4kRVn7rtkf4QkE
         2hpls25zkZfic/S3fuG5+GWqbjc53dfJNm5+8qk0QpMOdEkO+ngXA1keDx2VUMa/M6tj
         v9EQ==
X-Gm-Message-State: AOJu0YwdKkIwORrWXS5BbmB3Agz86uje3DjR11W3xoTipCgSIx4/exUS
	yANe7lNmhUz8Vmft/KWz6tWbGc2JI83ml3yN
X-Google-Smtp-Source: AGHT+IFWDX/X0nWdxhdyMpsksBOB56iEUyavnywH1etzd7/ikoUkMx/LzyNe6VUbK0/ejUiaEoLuHw==
X-Received: by 2002:a17:906:abd2:b0:a18:91d0:c58e with SMTP id kq18-20020a170906abd200b00a1891d0c58emr796124ejb.52.1701334965913;
        Thu, 30 Nov 2023 01:02:45 -0800 (PST)
Return-Path: <xadimgnik@gmail.com>
Received: from [192.168.17.21] (54-240-197-238.amazon.com. [54.240.197.238])
        by smtp.gmail.com with ESMTPSA id i16-20020a1709061cd000b009b2cc87b8c3sm438680ejh.52.2023.11.30.01.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 01:02:45 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9b189639-5477-4c48-98a2-3ba55417de01@xen.org>
Date: Thu, 30 Nov 2023 09:02:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 1/6] system/cpus: rename qemu_mutex_lock_iothread() to
 qemu_bql_lock()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Huacai Chen <chenhuacai@kernel.org>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Jiri Slaby <jslaby@suse.cz>, Alexander Graf <agraf@csgraf.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Stafford Horne <shorne@gmail.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 John Snow <jsnow@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Michael Roth <michael.roth@amd.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-2-stefanha@redhat.com>
Organization: Xen Project
In-Reply-To: <20231129212625.1051502-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: //ClXQ106qpx

On 29/11/2023 21:26, Stefan Hajnoczi wrote:
> The Big QEMU Lock (BQL) has many names and they are confusing. The
> actual QemuMutex variable is called qemu_global_mutex but it's commonly
> referred to as the BQL in discussions and some code comments. The
> locking APIs, however, are called qemu_mutex_lock_iothread() and
> qemu_mutex_unlock_iothread().
> 
> The "iothread" name is historic and comes from when the main thread was
> split into into KVM vcpu threads and the "iothread" (now called the main
> loop thread). I have contributed to the confusion myself by introducing
> a separate --object iothread, a separate concept unrelated to the BQL.
> 
> The "iothread" name is no longer appropriate for the BQL. Rename the
> locking APIs to:
> - void qemu_bql_lock(void)
> - void qemu_bql_unlock(void)
> - bool qemu_bql_locked(void)
> 
> There are more APIs with "iothread" in their names. Subsequent patches
> will rename them. There are also comments and documentation that will be
> updated in later patches.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/block/aio-wait.h             |   2 +-
>   include/qemu/main-loop.h             |  26 +++---
>   accel/accel-blocker.c                |  10 +--
>   accel/dummy-cpus.c                   |   8 +-
>   accel/hvf/hvf-accel-ops.c            |   4 +-
>   accel/kvm/kvm-accel-ops.c            |   4 +-
>   accel/kvm/kvm-all.c                  |  22 ++---
>   accel/tcg/cpu-exec.c                 |  26 +++---
>   accel/tcg/cputlb.c                   |  16 ++--
>   accel/tcg/tcg-accel-ops-icount.c     |   4 +-
>   accel/tcg/tcg-accel-ops-mttcg.c      |  12 +--
>   accel/tcg/tcg-accel-ops-rr.c         |  14 ++--
>   accel/tcg/tcg-accel-ops.c            |   2 +-
>   accel/tcg/translate-all.c            |   2 +-
>   cpu-common.c                         |   4 +-
>   dump/dump.c                          |   4 +-
>   hw/core/cpu-common.c                 |   6 +-
>   hw/i386/intel_iommu.c                |   6 +-
>   hw/i386/kvm/xen_evtchn.c             |  16 ++--
>   hw/i386/kvm/xen_overlay.c            |   2 +-
>   hw/i386/kvm/xen_xenstore.c           |   2 +-
>   hw/intc/arm_gicv3_cpuif.c            |   2 +-
>   hw/intc/s390_flic.c                  |  18 ++--
>   hw/misc/edu.c                        |   4 +-
>   hw/misc/imx6_src.c                   |   2 +-
>   hw/misc/imx7_src.c                   |   2 +-
>   hw/net/xen_nic.c                     |   8 +-
>   hw/ppc/pegasos2.c                    |   2 +-
>   hw/ppc/ppc.c                         |   4 +-
>   hw/ppc/spapr.c                       |   2 +-
>   hw/ppc/spapr_rng.c                   |   4 +-
>   hw/ppc/spapr_softmmu.c               |   4 +-
>   hw/remote/mpqemu-link.c              |  12 +--
>   hw/remote/vfio-user-obj.c            |   2 +-
>   hw/s390x/s390-skeys.c                |   2 +-
>   migration/block-dirty-bitmap.c       |   4 +-
>   migration/block.c                    |  16 ++--
>   migration/colo.c                     |  60 +++++++-------
>   migration/dirtyrate.c                |  12 +--
>   migration/migration.c                |  52 ++++++------
>   migration/ram.c                      |  12 +--
>   replay/replay-internal.c             |   2 +-
>   semihosting/console.c                |   8 +-
>   stubs/iothread-lock.c                |   6 +-
>   system/cpu-throttle.c                |   4 +-
>   system/cpus.c                        |  28 +++----
>   system/dirtylimit.c                  |   4 +-
>   system/memory.c                      |   2 +-
>   system/physmem.c                     |   8 +-
>   system/runstate.c                    |   2 +-
>   system/watchpoint.c                  |   4 +-
>   target/arm/arm-powerctl.c            |  14 ++--
>   target/arm/helper.c                  |   4 +-
>   target/arm/hvf/hvf.c                 |   8 +-
>   target/arm/kvm.c                     |   4 +-
>   target/arm/kvm64.c                   |   4 +-
>   target/arm/ptw.c                     |   6 +-
>   target/arm/tcg/helper-a64.c          |   8 +-
>   target/arm/tcg/m_helper.c            |   4 +-
>   target/arm/tcg/op_helper.c           |  24 +++---
>   target/arm/tcg/psci.c                |   2 +-
>   target/hppa/int_helper.c             |   8 +-
>   target/i386/hvf/hvf.c                |   6 +-
>   target/i386/kvm/hyperv.c             |   4 +-
>   target/i386/kvm/kvm.c                |  28 +++----
>   target/i386/kvm/xen-emu.c            |  14 ++--
>   target/i386/nvmm/nvmm-accel-ops.c    |   4 +-
>   target/i386/nvmm/nvmm-all.c          |  20 ++---
>   target/i386/tcg/sysemu/fpu_helper.c  |   6 +-
>   target/i386/tcg/sysemu/misc_helper.c |   4 +-
>   target/i386/whpx/whpx-accel-ops.c    |   4 +-
>   target/i386/whpx/whpx-all.c          |  24 +++---
>   target/loongarch/csr_helper.c        |   4 +-
>   target/mips/kvm.c                    |   4 +-
>   target/mips/tcg/sysemu/cp0_helper.c  |   4 +-
>   target/openrisc/sys_helper.c         |  16 ++--
>   target/ppc/excp_helper.c             |  12 +--
>   target/ppc/kvm.c                     |   4 +-
>   target/ppc/misc_helper.c             |   8 +-
>   target/ppc/timebase_helper.c         |   8 +-
>   target/s390x/kvm/kvm.c               |   4 +-
>   target/s390x/tcg/misc_helper.c       | 118 +++++++++++++--------------
>   target/sparc/int32_helper.c          |   2 +-
>   target/sparc/int64_helper.c          |   6 +-
>   target/sparc/win_helper.c            |  20 ++---
>   target/xtensa/exc_helper.c           |   8 +-
>   ui/spice-core.c                      |   4 +-
>   util/async.c                         |   2 +-
>   util/main-loop.c                     |   8 +-
>   util/rcu.c                           |  14 ++--
>   audio/coreaudio.m                    |   4 +-
>   memory_ldst.c.inc                    |  18 ++--
>   target/i386/hvf/README.md            |   2 +-
>   ui/cocoa.m                           |  50 ++++++------
>   94 files changed, 502 insertions(+), 502 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>
