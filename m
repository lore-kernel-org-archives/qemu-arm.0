Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp909001njf;
        Thu, 15 Aug 2024 09:02:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUA6rvGyfEFOCW4U+rtell0rIuQHK3bfx2UwYt88xGwWmVO9V3urCQF3B3wOAI211vZAEhKpBhTZ/THdGOvTFVISR04lfeq
X-Google-Smtp-Source: AGHT+IGdWsEZ5BgFHlwECNN5LmbrpdK8NVqf1b62yGcM6JKY3OMK8kd2eORm6CNwvHC9lym6+7Vb
X-Received: by 2002:a05:6214:4598:b0:6b5:e488:61f5 with SMTP id 6a1803df08f44-6bf5d23f2femr62715026d6.40.1723737768021;
        Thu, 15 Aug 2024 09:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723737768; cv=none;
        d=google.com; s=arc-20160816;
        b=AaPqgcR7anQ46yQMUiRG1kaKfwcKvvYATkBEogSR9ykll3kZ9OHyBTv1S5APOcgRwv
         H7RGXs/Jl6aO+wIgxJ7mAggaBhPL+NQ9Z4d0kCMpw4xs5bGmyXw5zM84RIreNKGgqQQN
         ntDmR2nF9/vEgamEnlLrtaELqTXzh0ssDRemM6fqPGs76lQXsX1nMd+p+oqxgwGJsjwZ
         oOHCj9fMMkSl8tGWtCLsinneOgu0b2QlLez9AZPRHfpwiTy1raIiHiAkwbL+5UGO01IS
         tU4mL8vYvpQQQUZs71iv+liqKdsX5lmruspdn3nGQYMI3ffNrRIKgrO+Sphaw7J9CFvu
         RIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=d25gAAZTwx5HFLBSQIC4ypWKDudPB+ue+R/jvwM+ipU=;
        fh=/kuGymLmQoLaR+MY5v1vyNUx2ktm8m8RI+HcUtDYoMI=;
        b=cs757jHWhBKivoJS+BQRdpGV8Mx/39/In2xN2VMER4CwVIvxO8ZJEh6iuPNr/nLuHm
         uyAodJIi2KsFTuD7qNW52uQbMAW6uh0U+teUG4yoXIgWIceWc4G1qPXw7V38dPE3M6np
         7VuoAUT2GY+CaR6ftxz8pAZ+Q8brImktaDDBFavGEDLBzsCjQwftncXvMI4MLW4OzXi8
         hazJCiioB+XbKlIOIxrFtZaWPaJZUG4cK8szFfk3FgQEPu6WJOU7uIW9/txPa8P2PWQe
         Zb20vgPGHi07IEe8cBE1kXYrjeema6Vr8UljsPlNn2tzWKQrPSaQh4RXlfWQRw96S/3R
         u/gA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OpigzLF8;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bf6fee624dsi20756636d6.322.2024.08.15.09.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 09:02:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OpigzLF8;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723737766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=d25gAAZTwx5HFLBSQIC4ypWKDudPB+ue+R/jvwM+ipU=;
	b=OpigzLF8KLaI3PY2KP+q2B4rwqO7x+C+1OR1OSSCMfTQzYGN0noGAYv2EcFDssw7mZE43x
	mbuk3XfRpAVDjpLLpK6d1y6ESFRESTtcE62EnPftAcRBOeLFOvNlmnlyz3Y7SG2zuKhHIa
	GLhSZf+vIPJhbaKss0dFpXdE3XlyjkI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-qQH3evdWPC-53SDILVFH-A-1; Thu, 15 Aug 2024 12:02:43 -0400
X-MC-Unique: qQH3evdWPC-53SDILVFH-A-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6bf6a0c2f1eso11989916d6.3
        for <alex.bennee@linaro.org>; Thu, 15 Aug 2024 09:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723737763; x=1724342563;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d25gAAZTwx5HFLBSQIC4ypWKDudPB+ue+R/jvwM+ipU=;
        b=QQNaoxNNKlZB4t0uHRPKbLRmEkNR9PRYLnNgT7vulNABvoCTwKJIQnqOoTb+bIeASO
         h/WLPYa9L0KHynjBE1xOy3CdhDj+PgZ8PMCUtNavURHbpRD8AOh2zr4MAURI7aYUTtnz
         FUoRyJfK4wzUC2Wnaq4PEy12DUd4hblMDblrupi5wAhNchYcvK7KXx2ztebdfv7OLqJJ
         p6L+UT89xTCXSbiSPiM+1qWeYuBbRPPYMFs4DS/PVdQp0tr1YHKzOCtvDnP/KISDb4ot
         iLCC9li6zHbCPIM9/iC15FGjVrPSgPu7IEnX8T8iRHz0Y1ZJPLtCOP8z+00Rt1tx2qhv
         5CHg==
X-Forwarded-Encrypted: i=1; AJvYcCVIVnH67v8jL5eFxCSGjgIDwScZCL5A4nzARS2o4ncVF7axwsP75fdclsdJAuWrvqZL+0ALq3wthMqmJ1FzH91ngbq6lrcs
X-Gm-Message-State: AOJu0Yx59qu5b/aymRyVZ6Jzt7ROEhP0g2/s9RaSS8VFxBaGW7n3Ux1z
	bTuOMKPAmmXaFjgTxeJ8dVCJ7mbFv8y4hGO9uXE8iM+VGxb5V36tuP5iomFQg4pDvxYeZ78E+tF
	dCWnnc+A0Y1fcXbjgNFQL81fvUDeGy3BIy+pzb0zsOkWpAyWmPUJe1w==
X-Received: by 2002:a05:6214:2f0b:b0:6bf:6da7:6113 with SMTP id 6a1803df08f44-6bf6da76357mr54616286d6.12.1723737762693;
        Thu, 15 Aug 2024 09:02:42 -0700 (PDT)
X-Received: by 2002:a05:6214:2f0b:b0:6bf:6da7:6113 with SMTP id 6a1803df08f44-6bf6da76357mr54615636d6.12.1723737762070;
        Thu, 15 Aug 2024 09:02:42 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-43-177-15.web.vodafone.de. [109.43.177.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe10ddbsm7483086d6.49.2024.08.15.09.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 09:02:41 -0700 (PDT)
Message-ID: <6ecd8981-f5d5-42d0-9769-82fbde55df23@redhat.com>
Date: Thu, 15 Aug 2024 18:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] Avocado tests: allow for parallel execution of
 tests
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Radoslaw Biernacki <rad@semihalf.com>, Troy Lee <leetroy@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Beraldo Leal <bleal@redhat.com>,
 kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Paul Durrant
 <paul@xen.org>, Eric Auger <eric.auger@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <20240806173119.582857-1-crosa@redhat.com>
 <20240806173119.582857-10-crosa@redhat.com>
 <1f645137-c621-4fa3-ace0-415087267a7b@redhat.com>
 <CA+bd_6LTqGbx2+GOyYHyJ4d5gpg4v8Ddx5apjghiB0vjt8Abhg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CA+bd_6LTqGbx2+GOyYHyJ4d5gpg4v8Ddx5apjghiB0vjt8Abhg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: XtC6yMb/Sqx7

On 15/08/2024 16.08, Cleber Rosa wrote:
> On Mon, Aug 12, 2024 at 6:17 AM Thomas Huth <thuth@redhat.com> wrote:
>> ...
>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>> index 537804d101..545b5155f9 100644
>>> --- a/tests/Makefile.include
>>> +++ b/tests/Makefile.include
>>> @@ -94,6 +94,9 @@ TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
>>>    ifndef AVOCADO_TESTS
>>>        AVOCADO_TESTS=tests/avocado
>>>    endif
>>> +ifndef AVOCADO_PARALLEL
>>> +     AVOCADO_PARALLEL=1
>>> +endif
>>>    # Controls the output generated by Avocado when running tests.
>>>    # Any number of command separated loggers are accepted.  For more
>>>    # information please refer to "avocado --help".
>>> @@ -141,7 +144,8 @@ check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>>>                --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
>>>                $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>>>                        --filter-by-tags-include-empty-key) \
>>> -            $(AVOCADO_CMDLINE_TAGS) --max-parallel-tasks=1 \
>>> +            $(AVOCADO_CMDLINE_TAGS) --max-parallel-tasks=$(AVOCADO_PARALLEL) \
>>> +                     -p timeout_factor=$(AVOCADO_PARALLEL) \
>>>                $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>>>                "AVOCADO", "tests/avocado")
>>
>> I think it was nicer in the previous attempt to bump the avocado version:
>>
>> https://gitlab.com/qemu-project/qemu/-/commit/ec5ffa0056389c3c10ea2de1e783
>>
>> This re-used the "-j" option from "make", so you could do "make -j$(nproc)
>> check-avocado" just like with the other "check" targets.
>>
> 
> Hi Thomas,
> 
> I can see why it looks better, but in practice, I'm not getting the
> best behavior with such a change.
> 
> First, the fact that it enables the parallelization by default, while
> there still seems to be issues with test timeout issues, and even
> existing races between tests (which this series tried to address as
> much as possible) will not result in the best experience IMO.  On my
> 12 core machine, and also on GitLab CI, having 4 tests running in
> parallel gets a nice speed up (as others have reported) while still
> being very stable.
> 
> I'd say making the number of parallel tests equal to `nproc` is best
> kept for a future round.
> 
> Let me know if this sounds reasonable to you.

  Hi Cleber,

that patch that I linked did not set the default number of parallel tests to 
$(nproc), it just used the value of the "-j" option of make. So if you just 
run "make check-avocado" there, you only get single threaded execution as 
before. You explicitely have to run "make -jX check-avocado" to get X 
parallel threads. IMHO using "-j" is more intuitive than using yet another 
environment variable.

  Thomas
