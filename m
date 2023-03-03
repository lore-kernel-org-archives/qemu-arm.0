Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1193894ejc;
        Fri, 3 Mar 2023 07:24:32 -0800 (PST)
X-Received: by 2002:a2e:b947:0:b0:295:a930:55bc with SMTP id 7-20020a2eb947000000b00295a93055bcmr1531281ljs.12.1677857072145;
        Fri, 03 Mar 2023 07:24:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677857072; cv=none;
        d=google.com; s=arc-20160816;
        b=0A15Z4CPyZlvlO0V8pdy1JRgEJoYDTS9sE9pJvtglm2oSBW87T3F2B2Klw87UEPaRQ
         xZZAn5lA1xvAEV0K3W71yWMvBS2o0uHhE6TQGEB2rKA3D3eGnk1ShGIQS0On+kui7qNq
         aBiqXcs4XAsFeWqtkYhUxXocDjuDymlwW+33YE5qF5hhAqzdS2j9/Qt+WH2+9D6NiBYl
         uHsW99WWTv1/gwU3W1pi8WUX5PRLkUOj1kC2tqnPx9zJiWibDsI9Q0e4FLvFVu+gVyhn
         d1Txb8OwRCUQXnkKqPWe6FDp6CzEoY9CNCFXfWUPDuJeEKN1D/c4hw737th/g7LjTHmX
         P69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=2a7WGZA17VeRHV/hH2GwqOFfIXJQZ4/1f7SkZ7plGbY=;
        b=dcFhxDxaU8zWbphbFron5l/pZ0HFB76fMyChU66sqvuWF0g28ad5JCmnYqhipVJV7D
         0/f0i9n745C9PKwDYa0D93SI9hurWIrvqPDf6pBQ3KF34Ev89UbZlAZktKErd2IA+JoY
         kp4jPIRePasofwamDJ7bFHsjwS0QBuG51zg2NU3lxq+8loM1z9r4NiE4KyEsYXB87D/g
         2nVRB1nn96rq6xsvFYTTHe4tJk4pK9IoUzIrHZ6ucO2t+q27p7CH0wQWBsp76GHAPpX/
         hkrrgXDPQFNEDvnyYtgMOa4COXrn9iKyjQRr3XwzJ7wKeRslhMy9KbRlu5CL9trmbIPV
         5NIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bc5ftC/2";
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u6-20020ac251c6000000b004db0e03202asor543159lfm.142.2023.03.03.07.24.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Mar 2023 07:24:32 -0800 (PST)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bc5ftC/2";
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677857071;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2a7WGZA17VeRHV/hH2GwqOFfIXJQZ4/1f7SkZ7plGbY=;
        b=bc5ftC/265GQxVBpS+RiceCA7ThV1monicS4J0h8wOxFUn71NzzTn3ldR2Ge4xIf90
         5QM96xrzWGsvgn8Gw0gKGl7Mkl4rIvUHO9S1OWCGJviIlw44GfrDWt5F6weszz58AMIF
         4d5lllywnwo56U64yyN0zlAUIcRQ0bPCOfTCCVassDV9LF3iS36CiNUtGphyycRYUewX
         52AmgRGB2s2pb916ZqHjr2i76LtXA6R8P/RIaM9juXi1aWT52yhAdaso76IcelzEiUqQ
         B9i/k3nNPOJs4XRaEDkJzwWMb3gJiXz59eX2PuQ1FWPgYHJayxb113je/zE/nE8apvsK
         jtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677857071;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2a7WGZA17VeRHV/hH2GwqOFfIXJQZ4/1f7SkZ7plGbY=;
        b=RX2+rjxHT97ABggyoIbfYgPBVdMYMnCmKGoFsRSyq4PujH+qCO/kdlIw0bLDxMXZSy
         ocktS9PYij6INhxPfLJafVhphVq/KL0IHl6h08pPruy+3sbqmYrAA5CAeKu2uW8jn+ho
         +nb7WWQpMN/I518DmKNMcZ1kq6loW9ccSGwdaw4NCq3gP599X/RKmlyk9H0p5b5gUnc7
         HeE62IKnW8hHAzd6dVUtdrZlDjjtKZ0/RMxYfTXbJa+Lsug4NqC2wQJLHmUmGfZEkJgl
         5xvPZXcOyKwrwFchAs3KHY7PdtORN+ywovEmRhQdvB4GG6AglkHW0R2rpI6qKn47GvAS
         g4kw==
X-Gm-Message-State: AO0yUKV/16t6jln6vD7xAVo2clchG0/+MWnOhh1LCk5WyBu1hBpXOz2F
	hGXs9n1vryCAHphLmScLJMHnrwZhDW2tmG05CGGEmjmS
X-Google-Smtp-Source: AK7set8eqOnlHzDaMBjUb06FBMYIgEiwkZe/oRPCY99cJECc5IkkzN/3jsVW3StbbWGja4o9UlcvDw==
X-Received: by 2002:ac2:5dfa:0:b0:4b6:e405:1027 with SMTP id z26-20020ac25dfa000000b004b6e4051027mr620945lfq.14.1677857071562;
        Fri, 03 Mar 2023 07:24:31 -0800 (PST)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.200.206] (83.11.36.13.ipv4.supernova.orange.pl. [83.11.36.13])
        by smtp.gmail.com with ESMTPSA id f3-20020ac251a3000000b004d51b590772sm424578lfk.255.2023.03.03.07.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 07:24:31 -0800 (PST)
Message-ID: <2c067312-0c8b-730c-f7b7-5a3925e2b15e@linaro.org>
Date: Fri, 3 Mar 2023 16:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] tests/avocado: Add set of boot tests on SBSA-ref
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
 <20230302191146.1790560-2-marcin.juszkiewicz@linaro.org>
 <87fsam9ifb.fsf@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <87fsam9ifb.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wN3y6oc8yaVb

W dniu 3.03.2023 o 12:27, Alex Bennée pisze:
>> +    def test_sbsaref_linux_max(self):
>> +        """
>> +        :avocado: tags=cpu:max
>> +        """
>> +        self.boot_linux('max')
> You probably want to encode the pauth-impef here so we don't spend all
> our time on the cryptography. e.g.
> 
>       self.boot_linux('max,pauth-impdef=on')

Thanks! Moved from 33s to 20s here:

from:

  (3/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_linux_max: PASS (33.75 s)

to:

  (3/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_linux_max: PASS (20.34 s)
  
> but even with that it seems to be timing out for me:

JOB ID     : 030a40bf6c2523b25bed4ca7a630b380d4dba39d
JOB LOG    : /home/marcin/devel/linaro/sbsa-qemu/code/qemu/build/tests/results/job-2023-03-03T16.04-030a40b/job.log
  (1/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_tfa_v2_8: PASS (3.00 s)
  (2/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_linux_a57: PASS (19.37 s)
  (3/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_linux_max: PASS (20.34 s)
  (4/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_alpine_sbsaref_max: PASS (71.96 s)
RESULTS    : PASS 4 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
JOB TIME   : 115.00 s
