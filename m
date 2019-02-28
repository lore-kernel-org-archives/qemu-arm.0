Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1124241wrx;
        Thu, 28 Feb 2019 14:54:04 -0800 (PST)
X-Received: by 2002:a1c:6506:: with SMTP id z6mr1159741wmb.153.1551394444193;
        Thu, 28 Feb 2019 14:54:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551394444; cv=none;
        d=google.com; s=arc-20160816;
        b=t+B0D5Sn7vhFA64f0vD/aQk+rg4S9PWJnlSj6NCVKKFPaMQpjyXnCAOHABHjutwvmz
         TU6qxN0pMOZ7ExV8uzkvhhVT+PTIF6GmHcN9WJY96rKHsJDKRDPClMCtORpHE+xtnZ2R
         ZdI+4hUXntgFL5WpcUnotwbHEbo41/8KnNA8WAW6abnLy62mjo9JXWI35i0K8ZAPek+d
         Vo9GLrrUyW8pZrgW06NhsMhdyDTNtUOScGmX5Nl+DGf71WLsd5WJ9oq8cKeHXsHxgXd0
         F/Mc6Xqc5O+neQYd0Nor2APaTJUpSE0in89ClxOTBtRrDVofRqhR/kyJXbAvuGlH+nvo
         Ea2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=tFgCEaYWMrLCSiLdM7E4m8f/3RgN5vtsg3LNBsq2KYg=;
        b=R0ru9fiejsUYzSK9kWONjqDPPNqM5x8qdTd+uykkqjVVGAHeHf6JpP7WdcCiMbw937
         6SCrZff4L0JXYEzHfqBCXSWwDpn3NKhYOEHB0a8Q30Nt02dNxL1YxoE5y+xxPP5Ri0Y0
         DzSFlkU8F3HHEskt4040PRbDtEN78bTVL6WAMu9y7K5FlumUXQoCzMRbWcWTIGITLfey
         y+hMEwWIaYdlOCH3oL+Q2vdSivFQkAIwT3LlyxDJwsT27qP2aqXOxhTK+xem7p4kux0M
         9p1euQ+dzZaaoI/bQYvnaP6AK5MMtWO6SO7XKry6tJxEGQrfhWn4bbTh9b22pv9KBesm
         mQpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l23sor4439177wmc.28.2019.02.28.14.54.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Feb 2019 14:54:04 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tFgCEaYWMrLCSiLdM7E4m8f/3RgN5vtsg3LNBsq2KYg=;
        b=Tk7bx+BWT7n1FawvXioJjPPoKCINItgXDTaoJM47WbcVsWCFjuzauwDw6sA0x82Owm
         ldVvfElILHt5o3nHXgP+KtOkyaMVlqsGrE51vWXSq33y5tdGt8S0fs8sgRqw6pdnAZAM
         woeyz19gC1ZJiylE0srrnhK71egUXOtisNS4h6JF05vpAEyUGNTQMUtpF1HegWFLf2K3
         Lq9NZM9EDHa0Sh8rLdD8heqGvUU5Ksz1lvm18PIQp5wgg4/ZIDqgYYTMTKIrl8cZNri0
         kln4y417ZWQoxbKm2QAuw4lOehuPNDhYOuXsWAr+Pkc4lpi0cZfi4VRVjl4c2G9tDlKz
         e7vw==
X-Gm-Message-State: AHQUAuZIkcsngvgUf6OY2bxOK2FF73KkuTbdoh/Cd0xJGlo23jwiJcYh
	oqGKuyJwz5y7xPhdkMsPYVFE/g==
X-Google-Smtp-Source: APXvYqz+/HIdZhVyW/lSvjH8S/Tg2+ttzyxc6mXdoj6BS+6DVImYBqCkXUjXC4xcRxsuCu6ij4a3Jg==
X-Received: by 2002:a1c:e1c4:: with SMTP id y187mr1289973wmg.50.1551394443859;
        Thu, 28 Feb 2019 14:54:03 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.37] (43.red-88-25-181.staticip.rima-tde.net. [88.25.181.43])
        by smtp.gmail.com with ESMTPSA id a8sm7682147wmh.26.2019.02.28.14.54.02
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Feb 2019 14:54:03 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 07/16] tests/tcg/xtensa: enable system
 tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, jcmvbkbc@gmail.com
Cc: edgar.iglesias@gmail.com, qemu-arm@nongnu.org
References: <20190228202537.4638-1-alex.bennee@linaro.org>
 <20190228202537.4638-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <71a55c0c-3c09-edea-82a5-63fb0cfb4f12@redhat.com>
Date: Thu, 28 Feb 2019 23:54:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190228202537.4638-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: pBKqiGtene4d

On 2/28/19 9:25 PM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - use cross CC for linker
>   - fix up test selection to skip linker.ld.S
> ---
>  tests/tcg/xtensa/Makefile                | 93 ------------------------
>  tests/tcg/xtensa/Makefile.softmmu-target | 40 ++++++++++
>  2 files changed, 40 insertions(+), 93 deletions(-)
>  delete mode 100644 tests/tcg/xtensa/Makefile
>  create mode 100644 tests/tcg/xtensa/Makefile.softmmu-target
> 
> diff --git a/tests/tcg/xtensa/Makefile b/tests/tcg/xtensa/Makefile
> deleted file mode 100644
> index 2f5691f75b..0000000000
> --- a/tests/tcg/xtensa/Makefile
> +++ /dev/null
> @@ -1,93 +0,0 @@
> --include ../../../config-host.mak
> -
> -CORE=dc232b
> -CROSS=xtensa-$(CORE)-elf-
> -
> -ifndef XT
> -SIM = ../../../xtensa-softmmu/qemu-system-xtensa
> -SIMFLAGS = -M sim -cpu $(CORE) -nographic -semihosting -icount 6 $(EXTFLAGS) -kernel
> -SIMDEBUG = -s -S
> -else
> -SIM = xt-run
> -SIMFLAGS = --xtensa-core=DC_B_232L --exit_with_target_code $(EXTFLAGS)
> -SIMDEBUG = --gdbserve=0

Max: I think it should be quite easy to port your simulator to Alex's
new Makefile.
One possibility is adding tests/tcg/xtensa/Makefile.xt-run which set few
variables, include Makefile.softmmu-target and overwrite variables if
necessary.

BTW is this simulator downloadable? I see the Zephyr project also uses
it, and I looked for it on https://ip.cadence.com/swdev but couldnt find
a (public) link.

> -endif
> -
> -HOST_CC = gcc
> -CC      = $(CROSS)gcc
> -AS      = $(CROSS)gcc -x assembler-with-cpp
> -LD      = $(CROSS)ld
> -
> -XTENSA_SRC_PATH = $(SRC_PATH)/tests/tcg/xtensa
> -INCLUDE_DIRS = $(XTENSA_SRC_PATH) $(SRC_PATH)/target/xtensa/core-$(CORE)
> -XTENSA_INC = $(addprefix -I,$(INCLUDE_DIRS))
> -
> -LDFLAGS = -Tlinker.ld
> -
> -CRT        = crt.o vectors.o
> -
> -TESTCASES += test_b.tst
> -TESTCASES += test_bi.tst
> -#TESTCASES += test_boolean.tst
> -TESTCASES += test_break.tst
> -TESTCASES += test_bz.tst
> -TESTCASES += test_cache.tst
> -TESTCASES += test_clamps.tst
> -TESTCASES += test_extui.tst
> -TESTCASES += test_fail.tst
> -TESTCASES += test_interrupt.tst
> -TESTCASES += test_loop.tst
> -TESTCASES += test_mac16.tst
> -TESTCASES += test_max.tst
> -TESTCASES += test_min.tst
> -TESTCASES += test_mmu.tst
> -TESTCASES += test_mul16.tst
> -TESTCASES += test_mul32.tst
> -TESTCASES += test_nsa.tst
> -TESTCASES += test_phys_mem.tst
> -ifdef XT
> -TESTCASES += test_pipeline.tst
> -endif
> -TESTCASES += test_quo.tst
> -TESTCASES += test_rem.tst
> -TESTCASES += test_rst0.tst
> -TESTCASES += test_s32c1i.tst
> -TESTCASES += test_sar.tst
> -TESTCASES += test_sext.tst
> -TESTCASES += test_shift.tst
> -TESTCASES += test_sr.tst
> -TESTCASES += test_timer.tst
> -TESTCASES += test_windowed.tst
> -
> -all: build
> -
> -linker.ld: $(XTENSA_SRC_PATH)/linker.ld.S
> -	$(HOST_CC) $(XTENSA_INC) -E -P $< -o $@
> -
> -%.o: $(XTENSA_SRC_PATH)/%.c
> -	$(CC) $(XTENSA_INC) $(CFLAGS) -c $< -o $@
> -
> -%.o: $(XTENSA_SRC_PATH)/%.S
> -	$(CC) $(XTENSA_INC) $(ASFLAGS) -c $< -o $@
> -
> -%.tst: %.o linker.ld $(XTENSA_SRC_PATH)/macros.inc $(CRT) Makefile
> -	$(LD) $(LDFLAGS) $(NOSTDFLAGS) $(CRT) $< -o $@
> -
> -build: $(TESTCASES)
> -
> -check: $(addprefix run-, $(TESTCASES))
> -
> -run-%.tst: %.tst
> -	$(SIM) $(SIMFLAGS) ./$<
> -
> -run-test_fail.tst: test_fail.tst
> -	! $(SIM) $(SIMFLAGS) ./$<
> -
> -debug-%.tst: %.tst
> -	$(SIM) $(SIMDEBUG) $(SIMFLAGS) ./$<
> -
> -host-debug-%.tst: %.tst
> -	gdb --args $(SIM) $(SIMFLAGS) ./$<
> -
> -clean:
> -	$(RM) -fr $(TESTCASES) $(CRT) linker.ld
> diff --git a/tests/tcg/xtensa/Makefile.softmmu-target b/tests/tcg/xtensa/Makefile.softmmu-target
> new file mode 100644
> index 0000000000..1a4014506f
> --- /dev/null
> +++ b/tests/tcg/xtensa/Makefile.softmmu-target
> @@ -0,0 +1,40 @@
> +#
> +# Xtensa softmmu tests
> +#
> +
> +ifneq ($(TARGET_WORDS_BIGENDIAN),y)
> +
> +XTENSA_SRC = $(SRC_PATH)/tests/tcg/xtensa
> +XTENSA_ALL = $(filter-out $(XTENSA_SRC)/linker.ld.S,$(wildcard $(XTENSA_SRC)/*.S))
> +XTENSA_TESTS = $(patsubst $(XTENSA_SRC)/%.S, %, $(XTENSA_ALL))
> +# Filter out common blobs and broken tests
> +XTENSA_BROKEN_TESTS  = crt vectors test_boolean test_pipeline test_fail
> +XTENSA_USABLE_TESTS = $(filter-out $(XTENSA_BROKEN_TESTS), $(XTENSA_TESTS))
> +
> +# add to the list of tests
> +TESTS += $(XTENSA_USABLE_TESTS)
> +VPATH += $(XTENSA_SRC)
> +
> +CORE=dc232b
> +QEMU_OPTS+=-M sim -cpu $(CORE) -nographic -semihosting -icount 6 $(EXTFLAGS) -kernel
> +
> +INCLUDE_DIRS = $(SRC_PATH)/target/xtensa/core-$(CORE)
> +XTENSA_INC = $(addprefix -I,$(INCLUDE_DIRS))
> +
> +LDFLAGS = -Tlinker.ld -nostartfiles -nostdlib
> +
> +CRT        = crt.o vectors.o
> +
> +linker.ld: linker.ld.S
> +	$(CC) $(XTENSA_INC) -E -P $< -o $@
> +
> +$(XTENSA_USABLE_TESTS): linker.ld macros.inc $(CRT) Makefile.softmmu-target
> +
> +# special rule for common blobs
> +%.o: %.S
> +	$(CC) $(XTENSA_INC) $(ASFLAGS) -c $< -o $@
> +
> +%: %.S
> +	$(CC) $(XTENSA_INC) $(ASFLAGS) $< -o $@ $(LDFLAGS) $(NOSTDFLAGS) $(CRT)
> +
> +endif
> 
