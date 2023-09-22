Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1449438ejm;
        Fri, 22 Sep 2023 09:45:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHK67/UpOhPLV659y4RHqsrtbtOoWCm8NLVqzdtmR/b8j+aUHWNhOwwp8wJCguAONihVPjB
X-Received: by 2002:a05:622a:3d3:b0:412:395c:e794 with SMTP id k19-20020a05622a03d300b00412395ce794mr11241729qtx.50.1695401107214;
        Fri, 22 Sep 2023 09:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695401107; cv=none;
        d=google.com; s=arc-20160816;
        b=nyNox9lhsk0uQVw/8gQCQeCa/HDAwDQMRtwl0rMIp6OsFzbmeje6LKBWeb16hmSV1U
         2gDYIcUivILbWMq1Bu1f7sXYu9yiXPsTP3hx3jl2gGfBfFQB+LmLDz37g8mKXVNYFapJ
         yMWyfYif7J/MmiSIs33gEQQAsF54iuSaKTFtVr7+h+VqbvVwfwT+jWkew61Sxi2r45Q5
         A27vrG+4kwJv3DmnpGbYMbBP9ewF3wPHetAC8Btl1BmdMyRtUq6owTbC1NtoDtMNahRs
         vY+O9BhslP3vkodlMhVT024EFw6DmwgB/LTYe0lRotSh9BlR9TaFqlQBuayCyVvB0wSA
         K4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=orxQpsM0tfFUYhXmOTpAitVO6mwhFiXwuBODXV+ysts=;
        fh=TzViD/2mgZ0J0f/y47/6gEyZjQpvDfxuVAXVElxYtqU=;
        b=TvKNnC69Y2rzv9ISG7fBqi1WDWKklSuE2KoOnVCB0SFLMz/4xQ8dTjIOwAotZJ/F01
         7D0PwEegRUBo7A9oE7lWkFvltfWFY59pTsWkopAsWtz5T4hpXWcPnXfSDWRU00fxUUJK
         AHvM0xCqzLdyv7x9Qhm/QM5HrdtpmzmzxIuHYRqDawg2LpeQCxrYxUs6ZPTYvlS3Y5IY
         OKYCCQdyocJKurkSe/uFDeRFab5C4gU1T1AAT+EAGEEDOr/egMl0YN9C5UyKmY/VIUvw
         tesxOC8bTufCR+IE6YlrQZJzd31VgruN3o7MfH35tO2oJ6lkLQX2ab4nVZR3TOsV8pJC
         X1yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jMS8y9HC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id c6-20020ac87dc6000000b00418051c660esi328428qte.625.2023.09.22.09.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 09:45:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jMS8y9HC;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695401106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=orxQpsM0tfFUYhXmOTpAitVO6mwhFiXwuBODXV+ysts=;
	b=jMS8y9HCOD+aDRq3LwqByinNsgBXTeTGb781qsFJhh9fy6lWSLfyge3e+CZMRYwGmnBOrS
	3Ruu5Kor4L5wCnRw2jX1Q7Y/LeZX61eXBq9ARd/3YEF2h6/gDVU953zu5DCbR6aL81Xu6h
	ZIt3de0S6WFUgn4CnL//tQJXjC0rdDM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-5pGM2ajoMCG3wiyNKx2u5g-1; Fri, 22 Sep 2023 12:45:05 -0400
X-MC-Unique: 5pGM2ajoMCG3wiyNKx2u5g-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-402cd372b8bso18555635e9.2
        for <alex.bennee@linaro.org>; Fri, 22 Sep 2023 09:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695401104; x=1696005904;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orxQpsM0tfFUYhXmOTpAitVO6mwhFiXwuBODXV+ysts=;
        b=mskpUcaHzxY2GurcUvRuCzy6Ymp0nvSJKUvtqnw/n3PZgs/n0qgVQm7V6DDsi6bZie
         k/GtR4iRNwuZtaifgrIogrxUi76kZFRaAGdoyKqm+sm78UTXb3N1CbotPLJSmvbbuVRc
         XrNOxeKkY3QRlMXJ9T+BagxpyBdTboiAA4PBU1eqFAVMzBmb5XdBZGqjFVwlnb8KZ3XU
         xJsP8h9gOq+88NHHFAf1iG3bwB17acYetIhwaqffQvVUpvMvNcJVO9VWy59YU+TPAtn2
         Z0gYwm/ps0QmDqaUR5v6LgG/od0eLck11NEPhD/vUIotgUDxslk7QGQgVMfiw8NfDHau
         vilA==
X-Gm-Message-State: AOJu0YyU4oSFiqD7qIlrTUeQEUXCCqJAMXTcEHidjx19sHwPpSCjba2E
	yReQ+0pAZU5ZXo7gTn7idDz65gxHRoeW9hgL+s0J3/5XdZoENRBdndClnCJqmi+XHx8t4x8QahA
	DcB+nugTx7BRvso/p
X-Received: by 2002:adf:b649:0:b0:31f:b402:5aaa with SMTP id i9-20020adfb649000000b0031fb4025aaamr253292wre.8.1695401104313;
        Fri, 22 Sep 2023 09:45:04 -0700 (PDT)
X-Received: by 2002:adf:b649:0:b0:31f:b402:5aaa with SMTP id i9-20020adfb649000000b0031fb4025aaamr253261wre.8.1695401103855;
        Fri, 22 Sep 2023 09:45:03 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-176-48.web.vodafone.de. [109.43.176.48])
        by smtp.gmail.com with ESMTPSA id k6-20020adfe3c6000000b003196e992567sm4849488wrm.115.2023.09.22.09.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 09:45:03 -0700 (PDT)
Message-ID: <8df33f0f-c394-5eb8-ca0c-5601790745f8@redhat.com>
Date: Fri, 22 Sep 2023 18:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/2] tests/tcg: Add -fno-stack-protector
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Brian Cain <bcain@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20230731091042.139159-1-akihiko.odaki@daynix.com>
 <20230731091042.139159-3-akihiko.odaki@daynix.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230731091042.139159-3-akihiko.odaki@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cTs8h8fPdPZj

On 31/07/2023 11.10, Akihiko Odaki wrote:
> A build of GCC 13.2 will have stack protector enabled by default if it
> was configured with --enable-default-ssp option. For such a compiler,
> it is necessary to explicitly disable stack protector when linking
> without standard libraries.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/tcg/mips/hello-mips.c       | 4 ++--
>   tests/tcg/Makefile.target         | 2 +-
>   tests/tcg/aarch64/Makefile.target | 2 +-
>   tests/tcg/arm/Makefile.target     | 2 +-
>   tests/tcg/cris/Makefile.target    | 2 +-
>   tests/tcg/hexagon/Makefile.target | 2 +-
>   tests/tcg/i386/Makefile.target    | 2 +-
>   tests/tcg/minilib/Makefile.target | 2 +-
>   tests/tcg/mips/Makefile.target    | 2 +-
>   9 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/tcg/mips/hello-mips.c b/tests/tcg/mips/hello-mips.c
> index 4e1cf501af..0ba5f1bf23 100644
> --- a/tests/tcg/mips/hello-mips.c
> +++ b/tests/tcg/mips/hello-mips.c
> @@ -5,8 +5,8 @@
>   * http://www.linux-mips.org/wiki/MIPSABIHistory
>   * http://www.linux.com/howtos/Assembly-HOWTO/mips.shtml
>   *
> -* mipsel-linux-gcc -nostdlib -mno-abicalls -fno-PIC -mabi=32 \
> -*                  -O2 -static -o hello-mips hello-mips.c
> +* mipsel-linux-gcc -nostdlib -mno-abicalls -fno-PIC -fno-stack-protector \
> +                   -mabi=32 -O2 -static -o hello-mips hello-mips.c

You've lost the "*" at the beginning of the comment line here.

But apart from that nit, the patch looks sane to me.

Cc:-ing Alex Bennée ... could pick this patch up?

  Thomas

>   *
>   */
>   #define __NR_SYSCALL_BASE	4000
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index 3d7837d3b8..c43020d990 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -123,7 +123,7 @@ else
>   # For softmmu targets we include a different Makefile fragment as the
>   # build options for bare programs are usually pretty different. They
>   # are expected to provide their own build recipes.
> -EXTRA_CFLAGS += -ffreestanding
> +EXTRA_CFLAGS += -ffreestanding -fno-stack-protector
>   -include $(SRC_PATH)/tests/tcg/minilib/Makefile.target
>   -include $(SRC_PATH)/tests/tcg/multiarch/system/Makefile.softmmu-target
>   -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.softmmu-target
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> index 617f821613..55f8609897 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -49,7 +49,7 @@ endif
>   # bti-1 tests the elf notes, so we require special compiler support.
>   ifneq ($(CROSS_CC_HAS_ARMV8_BTI),)
>   AARCH64_TESTS += bti-1 bti-3
> -bti-1 bti-3: CFLAGS += -mbranch-protection=standard
> +bti-1 bti-3: CFLAGS += -fno-stack-protector -mbranch-protection=standard
>   bti-1 bti-3: LDFLAGS += -nostdlib
>   endif
>   # bti-2 tests PROT_BTI, so no special compiler support required.
> diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
> index 0038cef02c..3473f4619e 100644
> --- a/tests/tcg/arm/Makefile.target
> +++ b/tests/tcg/arm/Makefile.target
> @@ -12,7 +12,7 @@ float_madds: CFLAGS+=-mfpu=neon-vfpv4
>   
>   # Basic Hello World
>   ARM_TESTS = hello-arm
> -hello-arm: CFLAGS+=-marm -ffreestanding
> +hello-arm: CFLAGS+=-marm -ffreestanding -fno-stack-protector
>   hello-arm: LDFLAGS+=-nostdlib
>   
>   # IWMXT floating point extensions
> diff --git a/tests/tcg/cris/Makefile.target b/tests/tcg/cris/Makefile.target
> index 43587d2769..713e2a5b6c 100644
> --- a/tests/tcg/cris/Makefile.target
> +++ b/tests/tcg/cris/Makefile.target
> @@ -30,7 +30,7 @@ AS	= $(CC) -x assembler-with-cpp
>   LD      = $(CC)
>   
>   # we rely on GCC inline:ing the stuff we tell it to in many places here.
> -CFLAGS  = -Winline -Wall -g -O2 -static
> +CFLAGS  = -Winline -Wall -g -O2 -static -fno-stack-protector
>   NOSTDFLAGS = -nostartfiles -nostdlib
>   ASFLAGS += -mcpu=v10 -g -Wa,-I,$(SRC_PATH)/tests/tcg/cris/bare
>   CRT_FILES = crt.o sys.o
> diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
> index 87ed2c90b9..f839b2c0d5 100644
> --- a/tests/tcg/hexagon/Makefile.target
> +++ b/tests/tcg/hexagon/Makefile.target
> @@ -19,7 +19,7 @@
>   EXTRA_RUNS =
>   
>   CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal
> -CFLAGS += -fno-unroll-loops
> +CFLAGS += -fno-unroll-loops -fno-stack-protector
>   
>   HEX_SRC=$(SRC_PATH)/tests/tcg/hexagon
>   VPATH += $(HEX_SRC)
> diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
> index fdf757c6ce..3dec7c6c42 100644
> --- a/tests/tcg/i386/Makefile.target
> +++ b/tests/tcg/i386/Makefile.target
> @@ -35,7 +35,7 @@ run-test-aes: QEMU_OPTS += -cpu max
>   #
>   # hello-i386 is a barebones app
>   #
> -hello-i386: CFLAGS+=-ffreestanding
> +hello-i386: CFLAGS+=-ffreestanding -fno-stack-protector
>   hello-i386: LDFLAGS+=-nostdlib
>   
>   # test-386 includes a couple of additional objects that need to be
> diff --git a/tests/tcg/minilib/Makefile.target b/tests/tcg/minilib/Makefile.target
> index c821d2806a..af0bf54be9 100644
> --- a/tests/tcg/minilib/Makefile.target
> +++ b/tests/tcg/minilib/Makefile.target
> @@ -12,7 +12,7 @@ SYSTEM_MINILIB_SRC=$(SRC_PATH)/tests/tcg/minilib
>   MINILIB_SRCS=$(wildcard $(SYSTEM_MINILIB_SRC)/*.c)
>   MINILIB_OBJS=$(patsubst $(SYSTEM_MINILIB_SRC)/%.c, %.o, $(MINILIB_SRCS))
>   
> -MINILIB_CFLAGS+=-nostdlib -ggdb -O0
> +MINILIB_CFLAGS+=-nostdlib -fno-stack-protector -ggdb -O0
>   MINILIB_INC=-isystem $(SYSTEM_MINILIB_SRC)
>   
>   .PRECIOUS: $(MINILIB_OBJS)
> diff --git a/tests/tcg/mips/Makefile.target b/tests/tcg/mips/Makefile.target
> index 1a994d5525..5d17c1706e 100644
> --- a/tests/tcg/mips/Makefile.target
> +++ b/tests/tcg/mips/Makefile.target
> @@ -14,6 +14,6 @@ MIPS_TESTS=hello-mips
>   
>   TESTS += $(MIPS_TESTS)
>   
> -hello-mips: CFLAGS+=-mno-abicalls -fno-PIC -mabi=32
> +hello-mips: CFLAGS+=-mno-abicalls -fno-PIC -fno-stack-protector -mabi=32
>   hello-mips: LDFLAGS+=-nostdlib
>   endif
