Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp4784250wrb;
        Wed, 10 Jul 2019 03:41:22 -0700 (PDT)
X-Received: by 2002:a05:600c:2189:: with SMTP id e9mr4634848wme.56.1562755282842;
        Wed, 10 Jul 2019 03:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562755282; cv=none;
        d=google.com; s=arc-20160816;
        b=SEh1aiLCSdvQsnujkJCeJnURKOEuiKFILr8hGSCMd/GZ30dNVE5sRwOoNznBMz9mNf
         j9c1ywBKJ+hWT+JDd53TtumvtAIUAhc7i/K8UtC4KKa35NoKfCjC0+FGl+rCNIl8RJ1K
         8trBQhlnjpKaf5EUDPK8McxunJQ7sBNXrwNbLjZkFRh2zlXeeODpyZOAehCvdooAdzaY
         qxks30+5nFXF+N2LAIhgqpKAeoShhRZnTUfQoeISTfjB4Q2E99pzTrjzzNhY3g79uffK
         XTPRQJLnM5PNlhtDFoJSPKtl8pzHRnxWRncOzI7g7kVW1yatvcc+gCsX+IZkhVYIsOVG
         YekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=bikpCkm7t8bGzapIgCxmtWgANhQEbQ0YH3XGd5eUdek=;
        b=BiBYIO9HFjlKWBNXTJ0GMrzY8QKWg7zYohv/U2A01Mqp6f3ePS8+tDb8u4ZblEkzdb
         8DfIrPCUFyfIB1ziDG+VYZNq4Dy85BzYulOz1SJ6UtG5zw0qpl85vkBSj/6mENLB6CQp
         fTTS9fJAqcSpeqzGjXMSJrKPEo+Y2uwv3wrK+GW+AnoRC4oUFlRQx6xnt/RrtneSfvFv
         y4/iJeijqPFU2XngCSqv8VAkgUSKYiffZl+bcG+2R3E24Mgaku9seAyYyN/PzPco/ipi
         omck3rFzSDJ3Bhcnsh6ghqLk2JWVhsSNGMw+si08YNcSSgjfGc1GKtF/k2hvfpTNu43o
         ADRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y2sor1376857wrn.33.2019.07.10.03.41.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jul 2019 03:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bikpCkm7t8bGzapIgCxmtWgANhQEbQ0YH3XGd5eUdek=;
        b=AncJ65Z8XoOpRJ84E7sw4yGU950kPdyB4A7YfFj5DI3o1iC2mBhvum4uf0CQDmAfeY
         lTCyGbmAmXrYD1PWy3WbtBD/q85E+x/owUU56m/gMcV82We/vAbcEGgmU8W0F3BF07yR
         R0w+QhZm1gMfALP3bX8j3nMdkLdAktZUzhQTOVTkpIwIVRwYe2EWnvQVQQFziTcTdRcY
         i5R05/LGV0FpzMzI37IFN/WCFuruaiuAbcajVTInJxKephBFpMvbcZM+V5WiO4bz1Kp1
         znjYGAs82UFqhie7AzFOt4CcXOFst3DwoJ+HIPN0Uirj1rQGBZz+gVFaBDUTdnacq5js
         mKXQ==
X-Gm-Message-State: APjAAAX9cGKaId8xcWa/sfEy/j5hldiwVnGtVAtE0zbCiO2QHrOLbeMA
	5rOGKljz94cXVcC8lNghcA2GZQ==
X-Google-Smtp-Source: APXvYqyJdSFRu81RB9HMQUu54MV0VqESbKlUFPLMJjIwGb4aDSSnggDJ3uJcjLKdgGPWECHjG7e57w==
X-Received: by 2002:adf:eb86:: with SMTP id t6mr2360129wrn.96.1562755282632;
        Wed, 10 Jul 2019 03:41:22 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [10.32.224.100] (red-hat-inc.vlan560.asr1.mad1.gblx.net. [159.63.51.90])
        by smtp.gmail.com with ESMTPSA id b15sm2305028wrt.77.2019.07.10.03.41.21
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 03:41:22 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 2/5] tests/tcg: fix up test-i386-fprem.ref
 generation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Jan Bobek <jan.bobek@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
References: <20190705160421.19015-1-alex.bennee@linaro.org>
 <20190705160421.19015-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <af417ca3-248a-d1a8-51c4-46676b6d9d4a@redhat.com>
Date: Wed, 10 Jul 2019 12:41:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190705160421.19015-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: oeJCPi9Gx2wX

On 7/5/19 6:04 PM, Alex Bennée wrote:
> We never shipped the reference data in the source tree because it was
> quite big (64M). As a result the only option is to generate it

Can we fetch it (with hash verification) or store it compressed?

$ du -ch pc-bios/edk2-*bz2
1.2M    pc-bios/edk2-aarch64-code.fd.bz2
1.2M    pc-bios/edk2-arm-code.fd.bz2
4.0K    pc-bios/edk2-arm-vars.fd.bz2
1.7M    pc-bios/edk2-i386-code.fd.bz2
1.9M    pc-bios/edk2-i386-secure-code.fd.bz2
4.0K    pc-bios/edk2-i386-vars.fd.bz2
1.7M    pc-bios/edk2-x86_64-code.fd.bz2
1.9M    pc-bios/edk2-x86_64-secure-code.fd.bz2
9.3M    total

> locally. Although we have a rule to generate the reference file we
> missed the dependency and location changes, probably because it is
> only run for SLOW test runs.
> 
> The test still fails with mostly incorrect flags and different than
> expected NaNs. I'll leave that for the x86 experts to look at.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Jan Bobek <jan.bobek@gmail.com>
> ---
>  tests/tcg/i386/Makefile.target | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
> index b4033ba3d1..d0eb7023e5 100644
> --- a/tests/tcg/i386/Makefile.target
> +++ b/tests/tcg/i386/Makefile.target
> @@ -35,9 +35,9 @@ test-i386-fprem.ref: test-i386-fprem
>  	$(call quiet-command, ./$< > $@,"GENREF","generating $@")
>  
>  run-test-i386-fprem: TIMEOUT=60
> -run-test-i386-fprem: test-i386-fprem
> +run-test-i386-fprem: test-i386-fprem test-i386-fprem.ref
>  	$(call run-test,test-i386-fprem, $(QEMU) $<,"$< on $(TARGET_NAME)")
> -	$(call diff-out,test-i386-fprem, $(I386_SRC)/$<.ref)
> +	$(call diff-out,test-i386-fprem, test-i386-fprem.ref)
>  else
>  run-test-i386-fprem: test-i386-fprem
>  	$(call skip-test, $<, "SLOW")
> 
