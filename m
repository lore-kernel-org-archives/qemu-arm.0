Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp718209njh;
        Mon, 12 Aug 2024 03:17:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJYpi0NYRs6pZnapM4aemybjJ/XzgexSIAiEj9OOT/8z9FTIiP+UpacruVAxWZ85HRdoydC/75VFaK0ZDwURDxekx1vyh5
X-Google-Smtp-Source: AGHT+IEt/Xu1rOtFhgL5opj8UDVYGT2FBomKitoKGfdf88S1g/62KYjja9pQdYh2ZXD68wL7tGIT
X-Received: by 2002:a05:6830:628c:b0:709:41ab:453e with SMTP id 46e09a7af769-70b7cc26fcdmr12322830a34.31.1723457852949;
        Mon, 12 Aug 2024 03:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723457852; cv=none;
        d=google.com; s=arc-20160816;
        b=P4i7WbbtudxCrPlRF/1ated6iQzCspVhIAqz++/qCeDcVdmxcWdbJ43smB9ESpKYkr
         vIGVnnxFOEvSykb8OI92p92Ya+wH43Q5k6b0IP83WGIGcs9MhK0ebbZD+HJI45H4F4rb
         NMYivgGrPk9b2eHmpP3PRfmFVhQkzvDXcGeNqLKGXWsQAkk8Vremf8Fhdvaq5CZ6x8dQ
         vYIARR/O16SqqAJNCLOR6XfPFDffgkAbEkPcE+VZhB0VbLIoqxml4Ru0QOX3TA3sm/U4
         9P+NzZjz52jZXzSXf+Dn/rksi+2xFKlLURKMsQKeiw3hYP+VKkmpSQu093wF3mlmzRG4
         pOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=lVcqCYPpo9W+fFj+K5rl8msH5Np6HFRkYMqj7Uwzb6g=;
        fh=6OF/j0dZ9hXYzxEqaeTTI1ForGc8+ZfuB5DOO57GBmI=;
        b=lZYAM4Kn4q+MEY1A+0vXzkUIgWmLp7EmRY69FGgnBAVJq78uL1doqFMKgX+BkVNpi2
         mtboa2uFUtmykeFE+iv3xOEEYnl2uSsL/IVG+TI3cD9JKImO1Wt48YtqMZEgOTgazV9f
         Vehi150hgQfNIs9SB1/Az79iWKrmcq1Pp/98PQ1d33l4krzhjsxPYD9lGgAqTplfWZbH
         XQ6iJ11y1eF17aVKGQes/aw8IP6SBwrRQBulvoNT2RLKhYUo8lrrDNXtnTxPAMLI7Hcl
         ljNa6L5mLuKCHLNDGWiDYE+r1D/JE47Y1nVzEsrOzi2R9wUjgmwchB+/+X1Qnoe9ksOz
         fT/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ds6UHAtd;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c1c8c85si56157521cf.184.2024.08.12.03.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 03:17:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ds6UHAtd;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723457852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lVcqCYPpo9W+fFj+K5rl8msH5Np6HFRkYMqj7Uwzb6g=;
	b=ds6UHAtdZrE0VV7fg14DJX5X7aWYbwlXfzsdPFDlVJA8lYQRqukkY3CsVmtxj7D4gBA846
	rTI+yi/mkKxbjjuY5xO7x4JQ2MeKK5tu1nV+UIWd8pYQ4NdW7KU/8VVPU3c1ZYHl0u83ez
	r6tpfbAxxmzM/zwjMWhYQD97fHw377I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-XJOTq0CTNgeXcPZydMJvEA-1; Mon, 12 Aug 2024 06:17:31 -0400
X-MC-Unique: XJOTq0CTNgeXcPZydMJvEA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-427ffa0c9c7so49486735e9.1
        for <alex.bennee@linaro.org>; Mon, 12 Aug 2024 03:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723457850; x=1724062650;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVcqCYPpo9W+fFj+K5rl8msH5Np6HFRkYMqj7Uwzb6g=;
        b=uDuM6FWntfu4nGktb3WyOZ6mywuYch/UJFY9vwyskYvdHcXzN9NSxhPB46gKTAlN0z
         Cq5/1ytQyUmPyL/UqSFum/zU5mEXNAAK+XgkQlewiJyRG0voMnXp2vFkcbCBnw25oGmJ
         Hw62Zk2oDlVNcLw0a8jDS2/UGnTL5Tr2TOFzXagaHFgUsOJZkGXna5SFNGvH1zfpvjBC
         TCdUPRv6TcJYvXJEtPOF151YpW2kj4rmtge+6Wn9hoxFS942wd5Jawd/14edwBz6b77F
         Z/8pJbuUbCSv5lvvDxVq8fx5da5n1VHa5CUUfSKf3rvreiFxfsUOm4RE5T+2eDqsJCaB
         M0Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUTvLIRx7a0b47TWlqY94HgnpHVeyBVf8wWXwRfA0LhLmZgQ8rZgOmcTegJD2wNSbDIsfWz7XJfr3feS3lFpCy0KyQWSzgr
X-Gm-Message-State: AOJu0Yy14lmpXUYYK/72/SkiWCGIGQCA2F7YncV34vf8mHm5JMjldWXn
	Kye+QFCTVRyioomBybD0ZRJHo0fUkF3iwe4DZ4zDUAwlYmAG4uuQZiZFrIgyApPqTeGQiGLodz8
	GltMlu3iB/F+CNY+q8/p+k6UqfXgM3SDd1B1GQPHDxD8JlgXQFRLwhQ==
X-Received: by 2002:a05:600c:a48:b0:428:fcb:962 with SMTP id 5b1f17b1804b1-429c3a5c30fmr69153655e9.36.1723457850113;
        Mon, 12 Aug 2024 03:17:30 -0700 (PDT)
X-Received: by 2002:a05:600c:a48:b0:428:fcb:962 with SMTP id 5b1f17b1804b1-429c3a5c30fmr69153255e9.36.1723457849535;
        Mon, 12 Aug 2024 03:17:29 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-43-178-125.web.vodafone.de. [109.43.178.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c751b021sm97414005e9.21.2024.08.12.03.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 03:17:29 -0700 (PDT)
Message-ID: <1f645137-c621-4fa3-ace0-415087267a7b@redhat.com>
Date: Mon, 12 Aug 2024 12:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] Avocado tests: allow for parallel execution of
 tests
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
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
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240806173119.582857-10-crosa@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: r7uxIV6yhOxe

On 06/08/2024 19.31, Cleber Rosa wrote:
> The updated Avocado version allows for the execution of tests in
> parallel.
> 
> While on a CI environment it may not be a good idea to increase the
> parallelization level in a single runner, developers may leverage that
> on specific CI runners or on their development environments.
> 
> This also multiplies the timeout for each test accordingly.  The
> reason is that more concurrency can lead to less resources, and less
> resources can lead to some specific tests taking longer to complete
> and then time out.  The timeout factor being used here is very
> conservative (being equal to the amount of parallel tasks).  The worst
> this possibly oversized timeout value can do is making users wait a
> bit longer for the job to finish if a test hangs.
> 
> Overall, users can expect a much quicker turnaround on most systems
> with a value such as 8 on a 12 core machine.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
...
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 537804d101..545b5155f9 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -94,6 +94,9 @@ TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
>   ifndef AVOCADO_TESTS
>   	AVOCADO_TESTS=tests/avocado
>   endif
> +ifndef AVOCADO_PARALLEL
> +	AVOCADO_PARALLEL=1
> +endif
>   # Controls the output generated by Avocado when running tests.
>   # Any number of command separated loggers are accepted.  For more
>   # information please refer to "avocado --help".
> @@ -141,7 +144,8 @@ check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>               --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
>               $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>   			--filter-by-tags-include-empty-key) \
> -            $(AVOCADO_CMDLINE_TAGS) --max-parallel-tasks=1 \
> +            $(AVOCADO_CMDLINE_TAGS) --max-parallel-tasks=$(AVOCADO_PARALLEL) \
> +			-p timeout_factor=$(AVOCADO_PARALLEL) \
>               $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>               "AVOCADO", "tests/avocado")

I think it was nicer in the previous attempt to bump the avocado version:

https://gitlab.com/qemu-project/qemu/-/commit/ec5ffa0056389c3c10ea2de1e783

This re-used the "-j" option from "make", so you could do "make -j$(nproc) 
check-avocado" just like with the other "check" targets.

  Thomas
