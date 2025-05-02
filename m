Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp679159njj;
        Fri, 2 May 2025 00:48:10 -0700 (PDT)
X-Received: by 2002:a05:600c:c0e:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-441bbf3bd7bmr12019025e9.27.1746172090668;
        Fri, 02 May 2025 00:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746172090; cv=none;
        d=google.com; s=arc-20240605;
        b=gDNdxCmZMElWE70PCeEgmQKQ2g0bOU3ekHWcwKVGfWzTR7fQSTQeyfbUjPIGTsztDW
         lTarJVZfPbjkYwZBWPiSsU0al8c79IZDRMOkVi7lTo45I2E52jpypMAijmx1koK2/oJ2
         6Ey2kFP5TF7B/FKvN7jx1BS1aj1L21jYsP5VZgbxufZjUJ5Am40PGTdQglnYw5rIYl6h
         NJqpz2zUzOITJMtU0Gnz8g2pJI8EmcqWInSD4vpscCRoj3z+ht17UhXR+x5lgEnLGvmQ
         U1D4JhjpkpBN9R0PvG1Hi/wGoMvLweWAJ0HRVQrtL81IiFJfuXP0F/gP/Lb6LPh2iZWy
         +PPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=CNt2gXGmzF4Q8Nkee53erYjQZK/S5DrMJQ0Jwevlp/s=;
        fh=2ldhCia9x7qVyiMptGiXBBR7XzFHNVJVvMWvT9YdxRw=;
        b=LXnVLwM+und8khQT2f32XgV7oPYR0QTcJ9JqGrszqjzefuVBy37KuAnQNUhHlRtC5b
         p8dXDAaeWoDaJKKdG8KYdGkgPEkDuCZRhyvb/v7Pvjuxcsvt7KIesNRrzJmMs21R6dhx
         EwttjkaQelAe/A/9EWLLms71lcMkaxFMfYlAla/6g0+M8xQpv1IDW+uxt/lmJQbP/91F
         jkMmfZvihQS+D072NtXhqvMAjL9/C63ra1XlsuULRUzlH+FkxXQaLfsw/ykjubo7kWCc
         AAZMe/cRSlHjAXw5thKXwD95IXY5takDrp8CaR4f7SbnL9zhlGuYnjjfUM+6l3SnZ/yv
         J80A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p7kNc1WS;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-441b8a31faasor6203545e9.8.2025.05.02.00.48.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 May 2025 00:48:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p7kNc1WS;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746172090; x=1746776890; darn=linaro.org;
        h=mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CNt2gXGmzF4Q8Nkee53erYjQZK/S5DrMJQ0Jwevlp/s=;
        b=p7kNc1WSC7EAApA95dHYzo9T/inxWj+knar/4wn5/oLrOC4mT3gOdlY7oux6mMpA0/
         UFPUCDmY6qT1Wwq3WSXMxZYhcf+1ME9HxvFd9TnZMxiBBFHtbiwoGbOOGvmuW1wsPVH3
         FO+LDOiu0qiDkxznig/vmnhzAAKgBXg5BIDVHYuLZr6PXt9eqe6Q6sQojXH405FJiO/t
         6c5AmVSwdjXC6JbmJUwk19X/3Q4mrVcBbpaRxT2f1y3x+iH3rGJXHoGiDZ0/Ru8ITDzd
         85dwzNmCzmvHjVRUTQh45ROYryP3zUWbRV+5iYQkuBEEzMhnKE2HpgTyybdChMeyJ07g
         CCvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746172090; x=1746776890;
        h=mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNt2gXGmzF4Q8Nkee53erYjQZK/S5DrMJQ0Jwevlp/s=;
        b=Y6LgJW9XihDUEIgs6EpefeyhqF1ZcIDo+IeLxa18iQEliTAeTJk/HJ11aVMBcryoaF
         n8aGiT4mso2xhw8qPDTRIRCxsBe74bW8c/q5/Ydmorif9LFBWvkhhe2Z0jMx2sApy+fk
         7wyHK+A7tiCU6pu5K7iXGKdiBQj+HdSc5tSAqR4FT9dqJNEOMk4xEsuNYQjXKNyeZeMH
         OXzn75raGZDjkJ+YKywQRzzqn1tBIvZoogixTkSvZD5y000GtODiB1zmudLSFHOis7CL
         e/4DTXEsv0pn6kZUtR7Pj/Re5fvZ18Wb1wMk0pUBl4XPYUUlH9L2Xe/wIrzdXd1OZV7w
         jcEw==
X-Gm-Message-State: AOJu0YxHkcmAuxbTWCFcsOPiDW5iPP4yzA+KslshM4VhYbosPI9gPHtD
	1gLTAviCg8f6a28bmVruwpy6w54+YYu4gPIxU7dfDiupkUkqD2nMa8DqkWRKNjb9u7i0Zvqlb7B
	q5EDJMQ==
X-Gm-Gg: ASbGncvY5QGC9ZhOAvmXD7+wuIf+uPqNQ7XyWBvejMr39qrlgTjOufsF9gh7m2zSQ1V
	T/7I6RjgAvRq8SqCJpXWWhYffVI2DaynYUbl5+51NQFuqaVtzZdCYLdWQtUPhZ/+ee/yGRlqDdY
	HBKJ/g66gu0rb4AlgY/pO9hd65ZApw8z8XXjFXNq/gYB5PtJofyO+aS5gP4NCyMXFZk3FvWCmoY
	5qYVrYmLh3TmU6kbkCAubI11ZsLhdSKmCLrxo5prrtMieM4IQlGQSSwz1uM5nn3A0H3sRH8Z/96
	gwXgkvNxdRCgPFA2pbSd/eKod4kyLa+1g/BTByJbvnVWO9bYfqpAHK2hDNM6DJkpLrUoo3/S+qV
	mYZDnOw==
X-Google-Smtp-Source: AGHT+IEQlLcWEUeoKL5ED9JIrfs0gFYpRKmwgykIWhfu9BuTg67/nLmrWekgx1YLzoSf52lbtUHRvg==
X-Received: by 2002:a05:600c:8284:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-441bbf34546mr11454695e9.20.1746172089982;
        Fri, 02 May 2025 00:48:09 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli-email.org (adsl-37.37.6.161.tellas.gr. [37.6.161.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a31695sm35946815e9.40.2025.05.02.00.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:48:09 -0700 (PDT)
Date: Fri, 02 May 2025 10:45:52 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: Alex Benn=?UTF-8?B?w6k=?=e <alex.bennee@linaro.org>, qemu-devel@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>, Michael S. Tsirkin <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Peter Xu <peterx@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Bcc: 
Subject: Re: [PATCH 2/9] gitlab: disable debug info on CI builds
User-Agent: meli/0.8.12
References: <20250428125918.449346-1-alex.bennee@linaro.org> <20250428125918.449346-3-alex.bennee@linaro.org> <294fd9b9-6880-477f-a2b4-773f1e5274c8@redhat.com> <CAFEAcA9=YaBw=X+6NUw1D3RPgcSJn0OdmGC2=N=195jjJ7ijRw@mail.gmail.com>
In-Reply-To: <CAFEAcA9=YaBw=X+6NUw1D3RPgcSJn0OdmGC2=N=195jjJ7ijRw@mail.gmail.com>
Message-ID: <svmj08.329a1ofve5fwo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-TUID: zsKzQMGaOsd7

On Mon, 28 Apr 2025 17:20, Peter Maydell <peter.maydell@linaro.org> wrote:
>On Mon, 28 Apr 2025 at 15:02, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 28/04/2025 14.59, Alex Bennée wrote:
>> > Our default build enables debug info which adds hugely to the size of
>> > the builds as well as the size of cached objects. Disable debug info
>> > across the board to save space and reduce pressure on the CI system.
>> > We still have a number of builds which explicitly enable debug and
>> > related extra asserts like --enable-debug-tcg.
>> >
>> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> > ---
>> >   .gitlab-ci.d/buildtest-template.yml | 1 +
>> >   1 file changed, 1 insertion(+)
>> >
>> > diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
>> > index d4f145fdb5..d9e69c3237 100644
>> > --- a/.gitlab-ci.d/buildtest-template.yml
>> > +++ b/.gitlab-ci.d/buildtest-template.yml
>> > @@ -24,6 +24,7 @@
>> >       - ccache --zero-stats
>> >       - section_start configure "Running configure"
>> >       - ../configure --enable-werror --disable-docs --enable-fdt=system
>> > +          --disable-debug-info
>>
>> Do we have any jobs that might show stack traces in the console output ?
>> build-oss-fuzz comes to my mind, but that uses a separate script, so we
>> should be fine there?
>
>If you build with Rust enabled, and the Rust code panics,
>then you get a Rust backtrace. But I don't know if that
>cares about debug info to get its backtraces: quite
>possibly it's an entirely different mechanism.

It will show addresses and <unknown> instead of symbols if they are 
stripped.
