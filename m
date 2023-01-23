Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2787617ejc;
        Mon, 23 Jan 2023 01:06:11 -0800 (PST)
X-Received: by 2002:a7b:c5cb:0:b0:3d3:4f99:bb32 with SMTP id n11-20020a7bc5cb000000b003d34f99bb32mr22168578wmk.36.1674464771073;
        Mon, 23 Jan 2023 01:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674464771; cv=none;
        d=google.com; s=arc-20160816;
        b=zVQa8ZIUEqGO7NnzUlbToWKMbbETXNHwInrp5GGIU/UWtL4+mUUUX9tPFrmMOR0wgT
         j+9VVeWRkFlBh6QQFB5cJR8XEldIKceLRpJIphuU1MEFaujbu4Is8USdNgZKNCGmFeeG
         ZziMoZK62lPdHT++mD16njkMIHRkGnpg27wTphDn2+oX3lolWGYSQtKs98zQ93oOqZOD
         cBNVtG2/Xc95L7L2C2evxlqsgoDmHJj5mApFDCpGms0WAebSiKlaz9omLTUhPWKHIaz8
         2zgyHHxbyGDzlMzJsLMxFWRirhUpwQaUfavXOw6LnRDlpvSn6eMuBD4kJQ9yX0fvttx4
         ++nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hIjvQDBGwwQeJuOT9CrMS+HyRAjzK4pbkFrNNZr1/Lk=;
        b=RmURr99lRVP80Lu63dM2AjRiL71jfnQl458i4wB63526pt02nuKzAxYuHR/Tx4g8Mm
         rF459xiFtM3hO32qB2uBUMNMJkJi1fJHCI5s2apJ/9F7gjXIkJSyi2bo4Cr/PJ87ZPBB
         DdQixRYEYytL5S9ejBaOO+86IN2i1tzjZa0poNRexb2ONinCv2fGmumeQBw0V8Vu4v2+
         vAn2isQ792ZIJuG3cPle65+sIq6GhV3p5woGhnoHa3KgTdjiWKGrn00ApVUZjX0rMS3J
         Ckm0sfyXnvGVNXWf7RWQ+RCPoJSK3ef/kjdGPI6W//ujuHHBypSzcuGpWCN4dK9OHMry
         Z93A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9yDVT8D;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s3-20020a7bc383000000b003db065ef4e3sor2786874wmj.4.2023.01.23.01.06.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jan 2023 01:06:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9yDVT8D;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hIjvQDBGwwQeJuOT9CrMS+HyRAjzK4pbkFrNNZr1/Lk=;
        b=M9yDVT8DU/AeAF9GI6W7VUD2f+ZFAvqGux0Siour8QWVCSsgElP2/gGMV969yEepWQ
         S9atQ8dgWOsstmHZWqKauALIs2fyhEg5UyeL4jBfDuhCjKbN8V16TVwTY0DmlSgxgB+3
         YBQqv2CNfLweISllJLA1AGxxSVlWIgneAHQFq/cBGbnFs7N6w3Nofoa8wz1bHAFICPGd
         J8BohYN25ElWRXyCzEjr7AK14Cumt7ZSHaIcxhbJRdOCvJCvre68jIxQA6hxxde92/Lb
         oqSZsDBGBvY5uVeGnhM2AWXaHSRobd0Wr9d3pPiIAwOtbR8Zo5A0V3WAhnF5DNRUe2sh
         BRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hIjvQDBGwwQeJuOT9CrMS+HyRAjzK4pbkFrNNZr1/Lk=;
        b=Lzco5FcxB/OXa9o7+V64FmLnmn6b3TyT0hGL9nJ9wbPl0dPpOLDs/wG2Msboa+iQ6Z
         L786c9B3UYfrxpGJmqSsIJVTCD/c21gYjXRMX3FCCOd3Eb0M43oXF/tRNyJdJYpUVmPN
         QCFOmuLTvv0xmRz+rkX0goQuLXfUuA8xZjnwQeWE2umxcAuQHRqCfbH2wyyT0qzLsvFD
         D+6fTAzpQauaJyAwrgbSGHcAWmUTtoj5WXtDc9h3qW45w7a5Yf6yUP5+9/sdPU3bgzA4
         9KCNqIb/nLEOzaip6thpGtW3aTw8AXUSLAze0spSj8g4J3O48/QjTOwq8wAgGwMtqaJk
         1Pkg==
X-Gm-Message-State: AFqh2kqJMVdv9bX6n1Dy4obczkRpt4zzNdWqGxNX9Atg8w7yLZZuMAj+
	Cq7sQZScJBywhmaHz+luzFaMRp8U
X-Google-Smtp-Source: AMrXdXu+nVvXVBNsstdccS+ESlhP6SnwAyJ17uVYrFRly6CeyVLLVY4feu/ZmEBWCto95plTEQq8kg==
X-Received: by 2002:a05:600c:4f86:b0:3db:66e:cfdd with SMTP id n6-20020a05600c4f8600b003db066ecfddmr21534011wmq.9.1674464770854;
        Mon, 23 Jan 2023 01:06:10 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c1c0800b003d9862ec435sm10904586wms.20.2023.01.23.01.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 01:06:10 -0800 (PST)
Message-ID: <65cf6b01-a6d6-53ca-9ead-ebf50148cce7@linaro.org>
Date: Mon, 23 Jan 2023 10:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v5 7/9] target/avocado: Pass parameters to migration
 test on aarch64
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230120184825.31626-1-farosas@suse.de>
 <20230120184825.31626-8-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230120184825.31626-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: m88mpYZyg8tD

On 20/1/23 19:48, Fabiano Rosas wrote:
> The migration tests are currently broken for an aarch64 host because
> the tests pass no 'machine' and 'cpu' options on the QEMU command
> line. Most other architectures define a default value in QEMU for
> these options, but arm does not.

There was some discussions around that in the past:
https://lore.kernel.org/qemu-devel/20190621153806.13489-1-wainersm@redhat.com/
https://lore.kernel.org/qemu-devel/CAFEAcA9NBu+L4wHfkLTv93wy90wjnV05EZ12PT6PmLjdZ5h_YA@mail.gmail.com/

> Add these options to the test class in case the test is being executed
> in an aarch64 host.

I'm not sure what we are aiming to test here.

Migration in general? If so, any random machine should work.
By hardcoding the 'virt' machine, at least this test is reproducible.

I'd rather fix that generically as "if a test requires a default
machine and the target doesn't provide any default, then SKIP the
test". Then adding machine-specific tests. Can be done on top, so

Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/avocado/migration.py | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
> index 4b25680c50..ffd3db0f35 100644
> --- a/tests/avocado/migration.py
> +++ b/tests/avocado/migration.py
> @@ -11,6 +11,8 @@
>   
>   
>   import tempfile
> +import os
> +
>   from avocado_qemu import QemuSystemTest
>   from avocado import skipUnless
>   
> @@ -26,6 +28,14 @@ class Migration(QemuSystemTest):
>   
>       timeout = 10
>   
> +    def setUp(self):
> +        super().setUp()
> +
> +        arch = os.uname()[4]
> +        if arch == 'aarch64':
> +            self.machine = 'virt'
> +            self.cpu = 'max'
> +
>       @staticmethod
>       def migration_finished(vm):
>           return vm.command('query-migrate')['status'] in ('completed', 'failed')
