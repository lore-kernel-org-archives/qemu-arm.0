Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp875872ejb;
        Fri, 1 Dec 2023 02:24:19 -0800 (PST)
X-Received: by 2002:a17:906:265a:b0:9ff:9db9:1dc0 with SMTP id i26-20020a170906265a00b009ff9db91dc0mr643620ejc.62.1701426259587;
        Fri, 01 Dec 2023 02:24:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701426259; cv=none;
        d=google.com; s=arc-20160816;
        b=bAjM1LEgcSJFCulgT7UajXCzDPx75xuPGBrtZkVul8PRzwqeV354+dAi4XNspLvAZ0
         wwDsdhSmyFS2C/QLaeNX6VOV2Hdcx5NhJ6aGzfW81Neyfo7bYNxgRJuWhvVuKIdLIMQJ
         jCG+xCuVK7cXSD06E9SZRjGmudPCRym+SOnmdQs/D+KcumPfVQIQKojMOgm6kCpT2oZR
         h+Q4I9mNOJgdWuxS8PJeyVyW1nI9uqfOkRbzrkT9PtQPQf0/bHbnlVXiCxzoL+arYJQx
         7nvngErPcIMmnKgQSASIyW55aB+LCQlfUzOqoNCbyrqGOloOo1Ocp5a/US+00FQKPvQx
         Chsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=z69m+Ls2QRiO8HKOnPAfJt2sPPkLLDc2+97xG3B9H+Y=;
        fh=C/d1GziVjP5tVHj9jjg7AvDTPhljk/e5tV4vnHBycxk=;
        b=eQFcnbPVjPdtS17DZnamVQ5OqF44z8q91I6DAelO0Lk6Zz4lSGxz5IwE98uQ09C80s
         us9C12MQoOtFSce/9/exFMlvm3SwLitMmrZyYCTe204WW/oFaeCS0QjvSNuIi6oa1p/A
         kv0/QDkEOfBHIQHDogtJMyubCFIEgObnynZgUT+MLEfaTs9pIOH51r3XW5lXMP+p09AR
         cOQKH7CByGPiorD5X64ZZuok1CpP/kx23O2cQ0XFGrwE3fN8Zu7pDPuk1JsFHOKN8pGM
         Q9suopN+Tldv5jkfNARhI4xlbTY39XD1vfEiUoUtJFBkvoNjlvN3pXZDVBKS9teQqWgg
         kyCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CV1o29+B;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v25-20020a17090651d900b009ba1d862408sor1270175ejk.13.2023.12.01.02.24.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 01 Dec 2023 02:24:19 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CV1o29+B;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701426259; x=1702031059; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z69m+Ls2QRiO8HKOnPAfJt2sPPkLLDc2+97xG3B9H+Y=;
        b=CV1o29+BfKTZpVtHsqDXM5L5JVsp9R2Xpb/SBB8pPPDsxdXVZx9Rv3ju0VNUeptpRG
         TSFwltZ3JXhOg540y+rWixYJdDdzPQ2UU6+n2N7CeGPRVJXwafxvh+ehVp016pmtkgF9
         mFQy6AbnpGTOax55AcSV8VNcT1yLH7aqora9T+UEGPDsRNVj9xSFla0XXn/ukBvObLe7
         yUhh6+1K6yYb6sDxA7/clm4/em5c67o2kNJtPvgRG5FDhVFb+N6n4PQbHl9K8zpbExRV
         xzFCNL7HUgK0k65Np305+0GQ9McOn+bLrJpBArVhiMb/L328WYAyxyH9ntyESqSvAH+Y
         i4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701426259; x=1702031059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z69m+Ls2QRiO8HKOnPAfJt2sPPkLLDc2+97xG3B9H+Y=;
        b=RfUQcP7ncNKW+A1RAXg8zJvA/I5dHQdz/xRx04+Y1/R5EqOpHJlDvCWD9GQ8CEF6HT
         485DkEQQFq48kTrI1ur3SGG0Ci3z71LpW7a3IKo+w41stti962Kvw7BYdPt4WvESH9hZ
         2fZSC641IAj+7OQ0YMHEeyM2Q1n3edgKbAHv1nm1pMDr7XSKOMubSmELxRZPuNquQhvt
         jfykbaxdauPZ9pgClHIU15G4lVYj+h5cgq4sq+nsNR7HTalvlOLpFn+yQeZka1OZUMNn
         mVvqhjKRkWp+89cFIu1WeH1zalobgYwwhzXfUaBh/hl6iIPPClXaNhScFVbEm66L5ShA
         dfZQ==
X-Gm-Message-State: AOJu0Yx8SbPLKn3ioDhR59GR+HG7s+xjyzeBUGc3T7deriz+W+qwR3x6
	Ul0YA615cZvBNTSxCcPt1Ycjt9kQ6PyIq+qfculmT7+w
X-Google-Smtp-Source: AGHT+IHjqkZzb7XRQaPySAQaoQjVZkyJHVwWJRwgxxggG75IjWYXdxvEfmhSdzeYVLv3lJWzo7AaJA==
X-Received: by 2002:a17:907:6d1e:b0:a08:f837:7802 with SMTP id sa30-20020a1709076d1e00b00a08f8377802mr626875ejc.14.1701426259006;
        Fri, 01 Dec 2023 02:24:19 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.160.225])
        by smtp.gmail.com with ESMTPSA id h9-20020a1709062dc900b00a19d555755esm632159eji.117.2023.12.01.02.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 02:24:18 -0800 (PST)
Message-ID: <45077c53-ed18-4821-bfbe-6dba3ca994d4@linaro.org>
Date: Fri, 1 Dec 2023 11:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] tests/avocado: drop malta yamon tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eric Auger <eric.auger@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Cleber Rosa <crosa@redhat.com>,
 Joel Stanley <joel@jms.id.au>
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
 <20231201093633.2551497-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231201093633.2551497-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Wamfri4kSaEf

Hi Alex,

On 1/12/23 10:36, Alex Bennée wrote:
> The assets are no longer available on the website so these are
> blocking CI.
> 

How are these "blocking CI"? Missing artifact wasn't be fatal,
is it now? Also, did the artifact cache got flushed? These tests
pass locally, I disagree with removing them.

I can send a patch using YAMON_PATH like we have with RESCUE_YL_PATH,
but I still consider missing artifact shouldn't be an issue. We are
missing the point of the Avocado cache and the possibility to manually
add artifacts.

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/avocado/machine_mips_malta.py | 37 -----------------------------
>   1 file changed, 37 deletions(-)
> 
> diff --git a/tests/avocado/machine_mips_malta.py b/tests/avocado/machine_mips_malta.py
> index 959dcf5602..3a1ec85c20 100644
> --- a/tests/avocado/machine_mips_malta.py
> +++ b/tests/avocado/machine_mips_malta.py
> @@ -122,40 +122,3 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(self):
>           :avocado: tags=mips:smp
>           """
>           self.do_test_i6400_framebuffer_logo(8)
> -
> -class MaltaMachine(QemuSystemTest):
> -
> -    def do_test_yamon(self):
> -        rom_url = ('http://www.imgtec.com/tools/mips-tools/downloads/'
> -                   'yamon/yamon-bin-02.22.zip')
> -        rom_hash = '8da7ecddbc5312704b8b324341ee238189bde480'
> -        zip_path = self.fetch_asset(rom_url, asset_hash=rom_hash)
> -
> -        archive.extract(zip_path, self.workdir)
> -        yamon_path = os.path.join(self.workdir, 'yamon-02.22.bin')
> -
> -        self.vm.set_console()
> -        self.vm.add_args('-bios', yamon_path)
> -        self.vm.launch()
> -
> -        prompt =  'YAMON>'
> -        pattern = 'YAMON ROM Monitor'
> -        interrupt_interactive_console_until_pattern(self, pattern, prompt)
> -        wait_for_console_pattern(self, prompt)
> -        self.vm.shutdown()
> -
> -    def test_mipsel_malta_yamon(self):
> -        """
> -        :avocado: tags=arch:mipsel
> -        :avocado: tags=machine:malta
> -        :avocado: tags=endian:little
> -        """
> -        self.do_test_yamon()
> -
> -    def test_mips64el_malta_yamon(self):
> -        """
> -        :avocado: tags=arch:mips64el
> -        :avocado: tags=machine:malta
> -        :avocado: tags=endian:little
> -        """
> -        self.do_test_yamon()
