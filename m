Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3512184wrq;
        Sun, 10 Jun 2018 19:16:47 -0700 (PDT)
X-Received: by 2002:ac8:3753:: with SMTP id p19-v6mr14973658qtb.43.1528683407647;
        Sun, 10 Jun 2018 19:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528683407; cv=none;
        d=google.com; s=arc-20160816;
        b=JKoMRi9OmVZG7meAXpPApABZn/urALc87+NfgbY1VkdnWJ9Z7hPchKPLMYsPXppKBl
         aHnzYFEgE/TVuL7hgTEn4+3w/6j0lqoN9WPlVBaWk1t1DUFoV3wT/AfCx5QNiHkrrnJ8
         nw4X4TnQY6+rylz+Rxb6gC2arvQVGyBlUubSUrQ+8aDldn4rBAmCDIg4UmBhm5e52PMX
         v3b9nMp5wav1pVwnPdou2A7YTkSXHhSw8OkhgnX+O5f1jkxCU5PUSGN+PgyxEeE+bRMP
         +tTcF7r45AQGUmRXKB/H3iAxFSEdjRtgfxFF7TOp828tMCrOvi2/goTAsV9kqEOh89ID
         e9+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :sender:dkim-signature:arc-authentication-results;
        bh=A1aHaMwK7wdd9yc+biC5loxqSlREi1Tpn4eSpdgvlfc=;
        b=aif+B1mV92qktJGhvTxBE6oBIkWy46o5MkwnjlEzVjvZFdtODdNnMVl0wlq9sr8GaG
         MrmfyXEV7FannIsb8H+Mhwvt9yZSGVcZlNosEvLCA7opeVEAaAVaaHH9RS0R5VpVCYL/
         Uq3W7gKvI9gQVuTi3M/DOJ2mhd3VRBtzH0UVibHcRJTg/043lucp9md3uFxjkUjluy80
         vXZaNVt96cb3NTDiZXoioxKU3cxM2gE6f0CgP7tAdUP0eDRz6r/EFjrtSAl/yxM81YPu
         0OrXPhZ2mdNW7+mTWn9DSMyDkkBi+wXCcZi2lm26wAiNVEk4FEhBA9oSE0hsRtHCBjra
         sLbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jdH3FTGD;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 93-v6sor19986920qkw.107.2018.06.10.19.16.47
        (Google Transport Security);
        Sun, 10 Jun 2018 19:16:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jdH3FTGD;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A1aHaMwK7wdd9yc+biC5loxqSlREi1Tpn4eSpdgvlfc=;
        b=jdH3FTGD581WeiRnvE0Hw95Va/JEvQxBw8W/fCP2fadrSLPJU1sUxW+orHpw1mHKKJ
         23AIuEvMlWb61cFxUTC7lxo5SvXK0ANPfVZIffTLyDNt5Wl6ZIyjdVTWKDfyB6zLLidO
         1a9AHTSYQ5pJyQDhWfqGsgvpqSN/sYv0TMOg2TFPmfu6V3EbtcaM0/ySiY236dHv87Pk
         1/XsY+apnsx+mXm0UbPH4ul8r6bATFwqLA9Y5m80ecol70W912pQ5OvTatSomY3BMSSD
         qpdZg/ulLYjtWHk41E0NbH7nInfu243UHyZzL9PRX/oYzZAOJWnvtw2FWIq1hPEJfd0o
         Czvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=A1aHaMwK7wdd9yc+biC5loxqSlREi1Tpn4eSpdgvlfc=;
        b=OCh9ncE3IhnoXo2ctiWOE5A2/d40gyG+mRA4rNxR0JWiCqbeYqobqPoeTV+KB7v40d
         HjqHSSDoiyKyHv4iFUkM0/05oHxuyEGrJB24tlKzRHsGoNdFnnJWF80tnS7LyGPzuK2U
         zARYx5azQYs2+cuuGA5v0ZLWfxG1ozMHxBRpecdSPx/Lxpn63AHORo+PFhenF+TyXD/6
         aoElNfxMFb7z+9mSrK3LLDjEm3y88i4NhLQb3bmo11fQzQ2LsBZbaYe2wQR6Q7/7wtiM
         s6iegh19ejWBmRUY1EY2MhEMNbRoJbuL6ukOlu8EpMt8c8OTuLL0POCWdDVl86rxDPnO
         W6bw==
X-Gm-Message-State: APt69E1sW3k+J/YBw+ZY+6EINF5kDw92K1h3/SEx2bp1jzRbn+NdFuCw
	F7WfjoRbjsNm/as8r8rizfc=
X-Google-Smtp-Source: ADUXVKLdZqjjQtV1jWg+M/sFX7YRlV0CCeQiOZxOzuV0BlB2xcLYRbt2782Fn7BuvvvkRL8n/QtkWg==
X-Received: by 2002:a37:3389:: with SMTP id z131-v6mr13003144qkz.309.1528683407311;
        Sun, 10 Jun 2018 19:16:47 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.11] ([138.117.48.222])
        by smtp.gmail.com with ESMTPSA id k67-v6sm3850580qte.95.2018.06.10.19.16.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Jun 2018 19:16:46 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v6 44/49] tests/tcg: add run, diff, and skip helper macros
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, cota@braap.org,
 famz@redhat.com, berrange@redhat.com, richard.henderson@linaro.org,
 balrogg@gmail.com, aurelien@aurel32.net, agraf@suse.de, pbonzini@redhat.com,
 stefanha@redhat.com, stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 "open list:ARM" <qemu-arm@nongnu.org>
References: <20180608123307.24773-1-alex.bennee@linaro.org>
 <20180608123307.24773-45-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <9afcf892-8cb1-47ab-66f4-10a665a2e668@amsat.org>
Date: Sun, 10 Jun 2018 23:16:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180608123307.24773-45-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: xXcwdrQE0Skz

On 06/08/2018 09:33 AM, Alex Bennée wrote:
> As we aren't using the default runners for all the test cases it is
> easy to miss out things like timeouts. To help with this we add some
> helpers and use them so we only need to make core changes in one
> place.

Thanks, much nicer now :)

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> ---
> v5
>   - new for v5
> v5.1
>   - diff-test->diff-out
> ---
>  tests/tcg/Makefile                  | 13 ++++++++++---
>  tests/tcg/aarch64/Makefile.target   |  6 ++----
>  tests/tcg/arm/Makefile.target       |  6 ++----
>  tests/tcg/i386/Makefile.target      | 10 ++++------
>  tests/tcg/multiarch/Makefile.target |  4 ++--
>  5 files changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/tcg/Makefile b/tests/tcg/Makefile
> index e7dbcdb5bf..d4c5140210 100644
> --- a/tests/tcg/Makefile
> +++ b/tests/tcg/Makefile
> @@ -34,6 +34,15 @@
>  
>  quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
>  
> +# $1 = test name, $2 = cmd, $3 = desc
> +run-test = $(call quiet-command, timeout $(TIMEOUT) $2 > $1.out,"TEST",$3)
> +
> +# $1 = test name, $2 = reference
> +diff-out = $(call quiet-command, diff -u $1.out $2 | head -n 10,"DIFF","$1.out with $2")
> +
> +# $1 = test name, $2 = reason
> +skip-test = @printf "  SKIPPED %s because %s\n" $1 $2
> +
>  # Tests we are building
>  TESTS=
>  
> @@ -84,9 +93,7 @@ RUN_TESTS=$(patsubst %,run-%, $(TESTS))
>  RUN_TESTS+=$(EXTRA_RUNS)
>  
>  run-%: %
> -	$(call quiet-command, \
> -		timeout $(TIMEOUT) $(QEMU) $< > $<.out, \
> -		"TEST", "$< on $(TARGET_NAME)")
> +	$(call run-test, $<, $(QEMU) $<, "$< on $(TARGET_NAME)")
>  
>  .PHONY: run
>  run: $(RUN_TESTS)
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> index 7dba32138d..08c45b8470 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -13,7 +13,5 @@ TESTS:=$(AARCH64_TESTS)
>  fcvt: LDFLAGS+=-lm
>  
>  run-fcvt: fcvt
> -	$(call quiet-command, \
> -		$(QEMU) $< > fcvt.out && \
> -		diff -u $(AARCH64_SRC)/fcvt.ref fcvt.out, \
> -		"TEST", "$< (default) on $(TARGET_NAME)")
> +	$(call run-test,$<,$(QEMU) $<, "$< on $(TARGET_NAME)")
> +	$(call diff-out,$<,$(AARCH64_SRC)/fcvt.ref)
> diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
> index 14b5435fc6..aa4e4e3782 100644
> --- a/tests/tcg/arm/Makefile.target
> +++ b/tests/tcg/arm/Makefile.target
> @@ -24,10 +24,8 @@ fcvt: LDFLAGS+=-lm
>  # fcvt: CFLAGS+=-march=armv8.2-a+fp16 -mfpu=neon-fp-armv8
>  
>  run-fcvt: fcvt
> -	$(call quiet-command, \
> -		$(QEMU) $< > fcvt.out && \
> -		diff -u $(ARM_SRC)/fcvt.ref fcvt.out, \
> -		"TEST", "$< (default) on $(TARGET_NAME)")
> +	$(call run-test,fcvt,$(QEMU) $<,"$< on $(TARGET_NAME)")
> +	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
>  endif
>  
>  # On ARM Linux only supports 4k pages
> diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
> index cd173363ee..97b7c23cf1 100644
> --- a/tests/tcg/i386/Makefile.target
> +++ b/tests/tcg/i386/Makefile.target
> @@ -31,7 +31,7 @@ test-i386: test-i386.c test-i386-code16.S test-i386-vm86.S test-i386.h test-i386
>  
>  # Specialist test runners
>  run-runcom: runcom pi_10.com
> -	$(call quiet-command, $(QEMU) ./runcom $(I386_SRC)/pi_10.com > runcom.out, "TEST", "$< on $(TARGET_NAME)")
> +	$(call run-test,$<,$(QEMU) ./runcom $(I386_SRC)/pi_10.com,"$< on $(TARGET_NAME)")
>  
>  ifeq ($(SPEED), slow)
>  
> @@ -40,13 +40,11 @@ test-i386-fprem.ref: test-i386-fprem
>  
>  run-test-i386-fprem: TIMEOUT=60
>  run-test-i386-fprem: test-i386-fprem
> -	$(call quiet-command, \
> -		$(QEMU) $< > $<.out && \
> -		diff -u $(I386_SRC)/$<.ref $<.out, \
> -		"TEST", "$< (default) on $(TARGET_NAME)")
> +	$(call run-test,test-i386-fprem, $(QEMU) $<,"$< on $(TARGET_NAME)")
> +	$(call diff-out,test-i386-fprem, $(I386_SRC)/$<.ref)
>  else
>  run-test-i386-fprem: test-i386-fprem
> -	$(call quiet-command, /bin/true, "SLOW TEST", "$< SKIPPED on $(TARGET_NAME)")
> +	$(call skip-test, $<, "SLOW")
>  endif
>  
>  # On i386 and x86_64 Linux only supports 4k pages (large pages are a different hack)
> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
> index 90e45a881e..b77084c146 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -27,10 +27,10 @@ testthread: LDFLAGS+=-lpthread
>  
>  # default case (host page size)
>  run-test-mmap: test-mmap
> -	$(call quiet-command, $(QEMU) $< > test-mmap.out, "TEST", \
> +	$(call run-test, test-mmap, $(QEMU) $<, \
>  		"$< (default) on $(TARGET_NAME)")
>  
>  # additional page sizes (defined by each architecture adding to EXTRA_RUNS)
>  run-test-mmap-%: test-mmap
> -	$(call quiet-command, $(QEMU) -p $* $< > test-mmap-$*.out, "TEST", \
> +	$(call run-test, test-mmap-$*, $(QEMU) -p $* $<,\
>  		"$< ($* byte pages) on $(TARGET_NAME)")
> 
