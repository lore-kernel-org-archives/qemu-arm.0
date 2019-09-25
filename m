Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1360817wrp;
        Wed, 25 Sep 2019 15:20:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyROCce7n6eRxvSk1nB43pGE16hrgGJeX3tKAa0GsDa7WbLaTaZbMQSUvgnhpjoCGiHrfzO
X-Received: by 2002:a6b:2bc1:: with SMTP id r184mr316706ior.146.1569450023588;
        Wed, 25 Sep 2019 15:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569450023; cv=none;
        d=google.com; s=arc-20160816;
        b=d+ruwnBZ7upelPTRV7kIidTZ/MVCOR+/0sB2S1soX8AG51F0aFDS0B4GMuF2K3o1+A
         molzkjVHHCSQQYA0eySUWD1sHXMqvReozQRebUOTI8ZjRfEaqeUBH/6eeuBopRV+FoD2
         ppPWpFvLF6pA82ekxxTk9mQg7jJoX/dC4uA2RTu3deGNSJ7iJRiu3oWmdbPN9GZ8YlqI
         MEyJ0TW9kuZ6IWDcj0DZsxwtYEYM47/CGwMTcy3myD5922KsYjktsfu8XXQeQpKBLfF9
         dp83E7Qq9+iIpXYVpiVmjfNtxoekmZksmDtxVju3dy762xsb3gNTSm225EfeCjthq2mr
         ioBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=AUrJ9yxICkjbN96jkaEKLV8mIS5hDryN21dV+uBqKTw=;
        b=RIOJ2pk0hmaGSP7jJq2luZTTwu2LtcT77hHZqcrfD6sIio0fEcJV0Ej9OBLchv1iO0
         /geRVvjercZ1Str5D5nyELooOlHjm/smVmAHHrbeZ9C0rWNyY2UhhYX9TXT476UvzeRR
         yaB8xfAY3KyMfd7A5/SGAR25lXu/AASTnctamwmpsTdEIc9VKLhaP9NR1EVFf4FLoZ6k
         fJvrBVR/xu54Lw4184OZue6MMD5yzb4TpZP/POiNEux1B+2Mh2ufLYD3O2bZ26vxok2Q
         kDg2zxYeeAxzaQN22tazKDvlMKimv8z+CtNAftA+YaHEJaMPbgOCs+irfUbRi6/TQDxk
         Hc+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id e7si38632jab.42.2019.09.25.15.20.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:20:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 789F08D0F8
	for <alex.bennee@linaro.org>; Wed, 25 Sep 2019 22:20:22 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id c1so128338wrb.12
        for <alex.bennee@linaro.org>; Wed, 25 Sep 2019 15:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AUrJ9yxICkjbN96jkaEKLV8mIS5hDryN21dV+uBqKTw=;
        b=s6vGOqRpcsFkruGRmRDUPOuz3QVneR1kBh9r1mJYcDfB90Y5F7X2N5PosahIECoNue
         vMqbHPZsCqSnis1sOUSufjkLCR/8+8uT6jGirLvK5X0+KdaJlRpdXAGsFhLN8rGvhsoF
         mfNFTPxR7JTfsP9T+8xJox1g41EDVNUrvd9TKVM4HUe8PbJgYxd8anI+ygJ7nEpODGKw
         ImXkak9qaWLTm7xLN//I74zTnuhjfPtVVsH++/Yx4M/sRTJ5D0bdTpZc5P8Z1VCSf+Nf
         vZMS94HTB6/P7iUsvUepb5KyUqTZ3k/CIFg9JsAftMnAqm1T0il6yN71u75P+35g/+0L
         8tQA==
X-Gm-Message-State: APjAAAUw6/VdqrOZELMOf0WZ7K0ly9RB2M/htnQd73PDUV6jhbdRJCtp
	70Dk39lGyJ66snwyVpfyjQ/mQTMGyeHU+5w8H1bGyfzHjKAoDxkJxMPjFDUy+alF+kk/WtBZK25
	NfPSnIc2b38b4b5Ed
X-Received: by 2002:a05:600c:40f:: with SMTP id q15mr295006wmb.23.1569450021278;
        Wed, 25 Sep 2019 15:20:21 -0700 (PDT)
X-Received: by 2002:a05:600c:40f:: with SMTP id q15mr294995wmb.23.1569450021111;
        Wed, 25 Sep 2019 15:20:21 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net. [88.21.68.240])
        by smtp.gmail.com with ESMTPSA id 79sm925027wmb.7.2019.09.25.15.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:20:20 -0700 (PDT)
Subject: Re: [PATCH v3 21/33] tests/tcg: add simple record/replay smoke test
 for aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jsnow@redhat.com,
 f4bug@amsat.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>
References: <20190924210106.27117-1-alex.bennee@linaro.org>
 <20190924210106.27117-22-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <27600587-35fb-e2e7-72c2-95e8dbeb8f9f@redhat.com>
Date: Thu, 26 Sep 2019 00:20:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190924210106.27117-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: TjpJ2Igj1liz

On 9/24/19 11:00 PM, Alex Bennée wrote:
> This adds two new tests that re-use the memory test to check basic
> record replay functionality is still working. We have to define our
> own runners rather than using the default pattern as we want to change
> the test name but re-use the memory binary.
> 
> We declare the test binaries as PHONY as they don't rely exist.
> 
> [AJB: A better test would output some sort of timer value or other
> otherwise variable value so we could compare the record and replay
> outputs and ensure they match]
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Pavel Dovgalyuk <dovgaluk@ispras.ru>
> ---
>  tests/tcg/aarch64/Makefile.softmmu-target | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
> index 4c4aaf61dd3..b4b39579634 100644
> --- a/tests/tcg/aarch64/Makefile.softmmu-target
> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
> @@ -32,3 +32,24 @@ memory: CFLAGS+=-DCHECK_UNALIGNED=1
>  
>  # Running
>  QEMU_OPTS+=-M virt -cpu max -display none -semihosting-config enable=on,target=native,chardev=output -kernel
> +
> +# Simple Record/Replay Test
> +.PHONY: memory-record
> +run-memory-record: memory-record memory
> +	$(call run-test, $<, \
> +	  $(QEMU) -monitor none -display none \
> +		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
> +		  -icount shift=5$(COMMA)rr=record$(COMMA)rrfile=record.bin \
> +	   	  $(QEMU_OPTS) memory, \
> +	  "$< on $(TARGET_NAME)")
> +
> +.PHONY: memory-replay
> +run-memory-replay: memory-replay run-memory-record
> +	$(call run-test, $<, \
> +	  $(QEMU) -monitor none -display none \
> +		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
> +		  -icount shift=5$(COMMA)rr=replay$(COMMA)rrfile=record.bin \
> +	   	  $(QEMU_OPTS) memory, \
> +	  "$< on $(TARGET_NAME)")
> +
> +TESTS+=memory-record memory-replay
> 

Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
