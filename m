Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1285324lff;
        Wed, 18 Dec 2019 12:20:24 -0800 (PST)
X-Received: by 2002:aa7:961b:: with SMTP id q27mr5133362pfg.23.1576700424774;
        Wed, 18 Dec 2019 12:20:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576700424; cv=none;
        d=google.com; s=arc-20160816;
        b=rsF9ZfgrAO+Dj4WqUrO3yE4IrJ2GdTemzQC+r5eM+Y6wAd4Ld1hL9DQtoLvJY+jh6u
         Eyz+f90jPzdp3PN2y7TTv1Z8w/CsK3o4icIlAX5ZEkbAJTUNv2wSGMSG+4AHd0aWK+Cm
         AV96mq/iGvZ4ntgOnqkAKTnQJVPJvOYknu/BZi9omFsKC5bH5Bzx3V1lY8Psi6nfaAu1
         EphVU1C5Jk4n8w7mlvgNVgQYTzi6aUdEGy5bfWjLFIMXGil+2qaWbUCUc7w8qfymDfsR
         VZ11Gb7vGQfNjCjewocjDF6RPj8hH0jhBbHdnxzuCRCHSC98ZmT7HuCbb12nb+7ymXRQ
         q8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=e0F0O5XBsMvA6TFnNmXgjcc4PZlPDbOS60e2ICRnBf8=;
        b=ptu9HWoNu/HRdq00MusUz4CCkcpZsC9SuWT0o3Zbp5RPzLhzSC2PjniLg7kr0rK3ho
         BquroVBzgU7zbHBX/VdolnJ586dF3k1d4k7VFRKR+CVr+61nrcFgfoWsGBfVH3CsXz5t
         pGJR7w+PMYIZyEB+wOeynvoxP2ekX+Sp/39EqHNcXH3KjVxoKkWYkXqxoQNKrNyFRsL4
         hWTb2c0LAjFnxGsjzdeceXvGiuR3VdQ9Y8I3kF/93c8DDWZnBLX1eNuJ2cpcZAeFU9uz
         SPQYZTTKZo5DIvnVN/tEKDqgbhiUDRlsi5gY//FNfvFn3Y4eUh4Rtwx0uQOHgjLPXBYV
         +3YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ReDrUKny;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c187sor1140227pfb.28.2019.12.18.12.20.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Dec 2019 12:20:24 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ReDrUKny;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e0F0O5XBsMvA6TFnNmXgjcc4PZlPDbOS60e2ICRnBf8=;
        b=ReDrUKnywIGJbaTsMy/auWkGB8LPssXluYZt0Gr/tynRYUb/CKJjrCHJgfMdoxbKKI
         Nn+GCjrNrsBPaphuWhWtLg2IOnBdXKvMOQe9ZOUhU3q9FAfZPqmcdXRuq5I9dOffl9KB
         Igc8hB2zknS04dx4pAW+kecBkpQKlymE2r/mfBhd0CuxkR7qjhB1Et9Y65Awg4MJPiMt
         93rmAPAuBpdAZml4FBw5BCMWd+gx4VNvc2RbOQnXdUKqgos450IB/f1QnyM5c4RI+rPG
         CRbbpNyDUgejWHAef5VDzdTUGXmBBGqr8aZwWR3aeEiHEsKBKDhU+WetwwShgPU9Fi31
         2uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e0F0O5XBsMvA6TFnNmXgjcc4PZlPDbOS60e2ICRnBf8=;
        b=sdbQ0CCqfyyazl0FdArLdJZXJPwDB5UFDEDeikm+qHYFENLkaxbeyhpWXqoRzebYq1
         CTKl+bGBPYuBTo6U/NDY4sM//ubqaNBwMsNxKbEsSNSKfH4fmsChX1H8K9F/rYItJVGw
         6Ug74JH97yBl+5gc293RYWIJIEKG/sQ0qpVns0dhUWMmLghAYnB9uicAkP9YnBaqfV6a
         UHtCZYXl15v6uar5PzZgbdj+YUR2UEKVClQgnoVDtjDv2pRs9KKZU4H9HE2ihH5jMwIu
         dwjQosB4OQy5IUvZxnDrD22ap5vP4sD2EJdGvz90fMkwOA0E0kjuKrb6L4F4XOr6MYaH
         KV+Q==
X-Gm-Message-State: APjAAAVPMVjajKE55IanN1eMp+4H0y50+oYZ+cCq98W/tyvLC6SjUZfd
	llTC9LqeuHpedIlutiayiRvPyIQMU7846A==
X-Google-Smtp-Source: APXvYqyC6nsJ598nxWFCRrSBW9fXqdLaopHZS+dIH1PjffQM5MsiiFQTgK3eM0eEHF8pF5jC9fC0eg==
X-Received: by 2002:a62:7b54:: with SMTP id w81mr5124131pfc.127.1576700424336;
        Wed, 18 Dec 2019 12:20:24 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445? ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
        by smtp.gmail.com with ESMTPSA id q13sm3918673pjc.4.2019.12.18.12.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 12:20:23 -0800 (PST)
Subject: Re: [PATCH v1 4/4] tests/tcg: add a dumb-as-bricks semihosting
 console test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, keithp@keithp.com,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20191218180029.6744-1-alex.bennee@linaro.org>
 <20191218180029.6744-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <593c8577-b1f8-f821-94cd-cf017300043a@linaro.org>
Date: Wed, 18 Dec 2019 10:20:20 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218180029.6744-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: lbiy2qsJjtJZ

On 12/18/19 8:00 AM, Alex Bennée wrote:
> We don't run this during check-tcg as we would need to check stuff is
> echoed back. However we can still build the binary so people can test
> it manually.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/system/semiconsole.c    | 36 +++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.softmmu-target |  9 +++++-
>  2 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/aarch64/system/semiconsole.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
