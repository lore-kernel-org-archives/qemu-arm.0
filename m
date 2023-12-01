Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp1002240ejb;
        Fri, 1 Dec 2023 06:05:06 -0800 (PST)
X-Received: by 2002:aa7:d949:0:b0:54b:346d:cf00 with SMTP id l9-20020aa7d949000000b0054b346dcf00mr1709628eds.18.1701439506169;
        Fri, 01 Dec 2023 06:05:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701439506; cv=none;
        d=google.com; s=arc-20160816;
        b=bh2XKN5byUVKVX8vLoKxLivlMB84U3Ng7ZqXqKV7PeS5hEMhbU4ubViRsYOC3bncnY
         LY2bI4XLZVuwGgmDmRVn4lLa8h+bV8fb5pCrfH1cC8l8Webgaay6RWJS8hB7AppCzZkh
         HuoZffISe6WBK+W8YbFE28PkDOvmVtlIkzC2vyrNtBdvOwPf61Zd0A5t5m1lJ2myg9eG
         dQ9Aucw0ihKCMPxuK+5/gdAauGGoBGKBM5BGnONuUKpX/gE60YohLFD8j8P+9zS0YdlP
         0Um/oxtBZRXLuI8XB6/LsLjWHxl1LhUeTwV2oGnl/36Nkq9/ftxkqboDVM/OoVFwaKFH
         8sEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GXVnY5gcb6WVUU34Zw3qA5TR/PBHpiFz51PWZTPDVPk=;
        fh=/XdGpJMkc0i63N1+1gZ6RZIjh/62JN5uAsppSfGc36E=;
        b=BEIOw4GI+hoKohmtbzG+CK3tQemOpZL1IIPXtOvGZ8aNSHpSt0WS17fhglXW8p+oWv
         XRdLrhLoTo9ZC+ZMT4jpsp6TVBLGHpOujbeZCbnTLQH5AIG3I48Woz3akgIolQVD2oBW
         uO0RuYtSCzduDqrDlscNQ68tLNwkXlq07BpPfNsjwRwV6SHV08PqGNiF636I4v/QYpGV
         EeZPpKtVPERHbntvqxb9cOP/4lTumXC9tbfyKNAjfVIUmHXmlybggfR9wDXf399/uLMU
         DjL3Rdwqe5cu89b6kfDY0TZbD2cF9974UZCBgT3ov//cPnmW/amFTyOUb7vyFsmypcvX
         nrrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AasqAXis;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bd22-20020a056402207600b0054c5f9bc21asor516227edb.3.2023.12.01.06.05.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 01 Dec 2023 06:05:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AasqAXis;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701439505; x=1702044305; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXVnY5gcb6WVUU34Zw3qA5TR/PBHpiFz51PWZTPDVPk=;
        b=AasqAXisvc7ue9kLJ+kXzRTLz0ARbpLWMdXs6zWIsvgGTpo6+CzduXskXo/43pWJ9A
         8zEiNTrJw6vrKYBawn4WINk4H7ZsnFvjJq0uc14UHJEXesJ86cWuAsKuKdR0zyT3chfu
         UJCV0iyuFULyanU1JPXO/SOBnOoDwQIfA3CXD0UeEE56eRwh/S9Mwryq9MDXqoFsJzcL
         44qMX08AKjEZMDTXWiLMHD8I6WrLw5XR29HfGym+V33B2BFfbB5di1+x5qwYueauhEa5
         EyilX9IsXMhWreJIsKvZFcAH/P1a8SN8qJwe938EaXPiMBki1NSVkci8rnWOPRRiB+b5
         E/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701439505; x=1702044305;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXVnY5gcb6WVUU34Zw3qA5TR/PBHpiFz51PWZTPDVPk=;
        b=W0M+Ftg3DMqiRRTUCvFaPAF92ojL0R7p9rzsxdU+R2Qan5zNyIPqLVkKXzgu11jVjQ
         i7oP7BRiQcBvFnx3/QqiZdB38Pz3d0n0I7LVveDDagj6aFXjQTdJB3QSUNTfVUTjcSvA
         75q3C31HUonYAZy2ts3nXo9Y8noWSG+O3qQjsdMtDIv6gRCOMm7ks4XztNTUWm4Wf27a
         QvhH+JH3/Xc8ob0R5XQwFgbSEYabv4qgFiW6mEZXb50MxvBgaX7p6MjLr0L6/8sH2YvY
         nfgFP88YRAF+YwmSTh8xvQdGXUHMAXBL6e0DGla9jLIiTlqFmfgYYG8ZiFBQwO+8KWiT
         VjmA==
X-Gm-Message-State: AOJu0YzW3SnE1ZJy4smBqP+Mh75aveJe7Alz03xPVZpC8WfnRMHPft2V
	1aD/4aIYYMA1ECc3BExMxs7mg38rY2nptZxxIYxtYQ==
X-Google-Smtp-Source: AGHT+IFWuyEzmcF3T18erY4ajahbnIlA3B8tJP3umbeljyI0tHkBQoMPslOySJdkyRQXvSO04JQJPw==
X-Received: by 2002:a50:9313:0:b0:54c:553e:67f5 with SMTP id m19-20020a509313000000b0054c553e67f5mr1302866eda.8.1701439505403;
        Fri, 01 Dec 2023 06:05:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.160.225])
        by smtp.gmail.com with ESMTPSA id bx11-20020a0564020b4b00b0054c4b6da934sm294789edb.9.2023.12.01.06.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 06:05:04 -0800 (PST)
Message-ID: <f8738d36-2527-4620-9532-fca530ef8f0d@linaro.org>
Date: Fri, 1 Dec 2023 15:05:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] tests/avocado: drop malta yamon tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>,
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
 <45077c53-ed18-4821-bfbe-6dba3ca994d4@linaro.org>
 <87ttp25bqh.fsf@draig.linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87ttp25bqh.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EdBht9ivo4tm

On 1/12/23 13:49, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Hi Alex,
>>
>> On 1/12/23 10:36, Alex Bennée wrote:
>>> The assets are no longer available on the website so these are
>>> blocking CI.
>>>
>>
>> How are these "blocking CI"? Missing artifact wasn't be fatal,
>> is it now? Also, did the artifact cache got flushed? These tests
>> pass locally, I disagree with removing them.
>>
>> I can send a patch using YAMON_PATH like we have with RESCUE_YL_PATH,
>> but I still consider missing artifact shouldn't be an issue. We are
>> missing the point of the Avocado cache and the possibility to manually
>> add artifacts.
> 
> Sure but in this case the binaries are gone, you can't share them and no

Per https://mips.com/develop/tools/boot-loaders/:
"To support existing users of these, and the QEMU project, YAMON is now 
available under the GPL License."

Their link https://mips.com/downloads/yamon-version-02-22/ is incorrect,
Mark emailed the webmaster to ask for the correct one.

Mark, any update?

> one else can ever run the test. At that point it just becomes dead
> weight in the repository. This doesn't stop you keeping your own branch
> where old tests live on while close to a warm cache but it does somewhat
> limit the use of the test to the wider community.
> 
>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>    tests/avocado/machine_mips_malta.py | 37 -----------------------------
>>>    1 file changed, 37 deletions(-)
>>> diff --git a/tests/avocado/machine_mips_malta.py
>>> b/tests/avocado/machine_mips_malta.py
>>> index 959dcf5602..3a1ec85c20 100644
>>> --- a/tests/avocado/machine_mips_malta.py
>>> +++ b/tests/avocado/machine_mips_malta.py
>>> @@ -122,40 +122,3 @@ def test_mips_malta_i6400_framebuffer_logo_8cores(self):
>>>            :avocado: tags=mips:smp
>>>            """
>>>            self.do_test_i6400_framebuffer_logo(8)
>>> -
>>> -class MaltaMachine(QemuSystemTest):
>>> -
>>> -    def do_test_yamon(self):
>>> -        rom_url = ('http://www.imgtec.com/tools/mips-tools/downloads/'
>>> -                   'yamon/yamon-bin-02.22.zip')
>>> -        rom_hash = '8da7ecddbc5312704b8b324341ee238189bde480'
>>> -        zip_path = self.fetch_asset(rom_url, asset_hash=rom_hash)
>>> -
>>> -        archive.extract(zip_path, self.workdir)
>>> -        yamon_path = os.path.join(self.workdir, 'yamon-02.22.bin')
>>> -
>>> -        self.vm.set_console()
>>> -        self.vm.add_args('-bios', yamon_path)
>>> -        self.vm.launch()
>>> -
>>> -        prompt =  'YAMON>'
>>> -        pattern = 'YAMON ROM Monitor'
>>> -        interrupt_interactive_console_until_pattern(self, pattern, prompt)
>>> -        wait_for_console_pattern(self, prompt)
>>> -        self.vm.shutdown()
>>> -
>>> -    def test_mipsel_malta_yamon(self):
>>> -        """
>>> -        :avocado: tags=arch:mipsel
>>> -        :avocado: tags=machine:malta
>>> -        :avocado: tags=endian:little
>>> -        """
>>> -        self.do_test_yamon()
>>> -
>>> -    def test_mips64el_malta_yamon(self):
>>> -        """
>>> -        :avocado: tags=arch:mips64el
>>> -        :avocado: tags=machine:malta
>>> -        :avocado: tags=endian:little
>>> -        """
>>> -        self.do_test_yamon()
> 
