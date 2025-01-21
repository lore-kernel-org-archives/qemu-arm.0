Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp63008njc;
        Tue, 21 Jan 2025 04:51:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGh2TUAD/vICdDA3qBtWtvHbTomdVQruFqoHjZYlCpdRgRPSvB4rw6DRoHfJ3k/tg9/z8/v
X-Received: by 2002:ac8:7c45:0:b0:467:60ba:b6c with SMTP id d75a77b69052e-46e12a5614fmr192744951cf.17.1737463874229;
        Tue, 21 Jan 2025 04:51:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737463874; cv=none;
        d=google.com; s=arc-20240605;
        b=aM6sBMxQjcDgVc7TveBnIVa+bENkr+wvm40/eklTj6uOMeCuYkLJhzyps9IOd0EttZ
         zKd4rWv/7HfGqH6gjJMUJvJE3lmrcWbAEecbwb7ScbziMT94bP6WmBDuS5ZBGoCFSF6f
         OK9yVX5rTLjZ6ICz145JVcqaYzkGumcHb+UgzyHTSKvaWxCI4UggDXSyJBulLgVVvKWL
         v2CTawrozxe6Ds6sGBGSQ5Iyp2JrrQZNXSgxdT9lo60q/N7EJ3STt7mVJUCaHeLagtoN
         byEENL+oWYuzigWKTyA1oUSYfgwj9R2EvDLDmOQ1ao/wPDbpF82tEQTf661TBVe/QISo
         ADyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=2pG2uhhO+2ys+rKzycNpOYI49mEaIG9ue6yxLEqsFQA=;
        fh=XgqCuqUtcUgWd1ZLLba+puTol7HG0SLvkNvvHcImD9E=;
        b=ipH3vUgXMEwUtM2UR55zIZC+LH6BMGNPhzenLJDJzUOC9lstgCcjUBODjp2LXbjyYn
         LvK4rJzJ0KBzSRE6J/2NG5oDSLw7lrXgU3az1pk8lAfa2QMuBD8WVHr/YahaCB41q95A
         //YR2Gl8XoCV9vjAwowGfA+m2PUuvPO48HAzmWsdfGfz6FY0AUlxduX2lk3zu4alwAC9
         +8roMe46LGyjSeLP+rGIqtj+Zp2WlEn1XvTrZRX7bDo5YaT8gMRsnFpfnUUYN/e4J2J4
         jCh0tYBMAv0nyKLggC3s/c7ZRty8U7AjZ0DJod95WjVCvcBb/T01L18hJriOlJCwWtG8
         p6sA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c7oGY5Io;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46e102f30bbsi125915861cf.54.2025.01.21.04.51.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 04:51:14 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c7oGY5Io;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737463873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2pG2uhhO+2ys+rKzycNpOYI49mEaIG9ue6yxLEqsFQA=;
	b=c7oGY5Io4rrpXMDRCP+JeZAsGqZkrdcpOeQhamFwc3VDlrjwiZ4C/xRkofT5B36kWdLQ4Q
	B90QCoa8Of975uUookSMobeeLFxxG5ihusd2A1zpjbY8PEO67NrhmbgHMOfz7OLla+7qCE
	R2q1nnLFVttvcFrg0813qDRjqQGjKow=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-8zwQB5yVMva1Nt1MnV58kg-1; Tue, 21 Jan 2025 07:51:12 -0500
X-MC-Unique: 8zwQB5yVMva1Nt1MnV58kg-1
X-Mimecast-MFC-AGG-ID: 8zwQB5yVMva1Nt1MnV58kg
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7be6ccb09f9so325235385a.2
        for <alex.bennee@linaro.org>; Tue, 21 Jan 2025 04:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737463872; x=1738068672;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pG2uhhO+2ys+rKzycNpOYI49mEaIG9ue6yxLEqsFQA=;
        b=AoQetx9ufMgspLXVeuua7RVFGVeHne0wl32sTC1uvV15uUkmV2RsoX2TxZnX8uVxbD
         sfhBPwvJwW6USaVALxN2pmXeQJy5vja+Zg279XirjO+XR9/8bf0e7uWA9cpDOV8EfD/4
         gMwdvHAXLOWsNhRiclJB8gjeOCwrS7kRfqgh7hXVyqnOg+TKgAFr0p/91NngCI+sffnw
         zeyyVZqFGFZlx8/IcjIaZA+7Vk00jAGtoB0yoQKCSKXteju77l+lrQEfV3J01YrrYIYf
         k2ut23zRD99FNlUX48gbRGzTpb7gdwGTlgZhUzye3Gyexr5N2oPG1UvvB7DurJpx8MHj
         uLMw==
X-Gm-Message-State: AOJu0Ywzt3dyhJ3biu0KedYB6KYvwxD7ITbONa6jAqSTdZdL9R8YQybh
	+RxpqGYrT49RWzrsnSIfHibgHbeKsJ4Cc+NmZVGk47rfrbNFlLx4vSgMIiBvDo2YFSHgI4KxbPl
	al3IBiWEzCzRgLtJuj+xyuv4+8qz2uKQKAnMI4VN0+FXWO/qTE1K71iKk5dPuuwgfoeBeGOMyWo
	d67v1A246ddqsrZwXng+OBzn1IFM7CMeRHKw==
X-Gm-Gg: ASbGncuNUiM1tj/F1ZZAIk56e99s/w/dtBiJye9YdC7eSBpceXrw5caaqie5xrasjEH
	u40f+SjEcW7rYmG9Hq5+uFxk8A43JcIGCLg211i11XCwSlJUYsuyaFSR1KpzZ+/F85w/1EKlPQT
	wl8tGWP28OieRRHH8kfaAQJlW8kRZc4FH0hczUkKqcG56YKvyzn5h8GYxNDkiyj/HCyA82lYQxC
	hHfU54tIexnlmHrgp+EVeZ45y+bZxEx0qn5DlwhzQ0s5/GlQkDkS8WtZcbiOlUJJdEQIFa7BvX/
	RrVwDXWloT+ddcCZXdTakReE4Q==
X-Received: by 2002:a05:620a:2413:b0:7b6:e697:2090 with SMTP id af79cd13be357-7be631e71admr2662503085a.2.1737463872086;
        Tue, 21 Jan 2025 04:51:12 -0800 (PST)
X-Received: by 2002:a05:620a:2413:b0:7b6:e697:2090 with SMTP id af79cd13be357-7be631e71admr2662499785a.2.1737463871761;
        Tue, 21 Jan 2025 04:51:11 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-48-103.web.vodafone.de. [109.42.48.103])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd3868sm50784896d6.71.2025.01.21.04.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 04:51:11 -0800 (PST)
Message-ID: <28500692-705c-44dc-86a2-461a61e8526c@redhat.com>
Date: Tue, 21 Jan 2025 13:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] testing/next (qtest timer stuff)
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250120210212.3890255-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250120210212.3890255-1-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ztEkn16YT_ofrEmwFp1fAFb60_J-LBjnWKF4rPlo-oo_1737463872
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GAh1trW04Al3

On 20/01/2025 22.02, Alex Bennée wrote:
> Hi,
> 
> Thomas found that a number of tests fail under CFI and other exotic
> setups. The eventual realisation was that --enable-slirp masks a lot
> of timer misuse because it ensures there is always a timer and
> therefor things tend to move on (until the system is shutting down).
> 
> It turns out that bc02be4508 wasn't the solution after all. The first
> few patches are clean-ups and various tightening of test expectations
> before we revert the patch.
> 
> Please review:
> 
>    Revert "util/timer: avoid deadlock when shutting down"
>    tests/qtest: tighten up the checks on clock_step
>    tests/qtest: rename qtest_send_prefix and roll-up into qtest_send
>    tests/qtest: simplify qtest_process_inbuf
>    tests/qtest: don't step clock at start of npcm7xx periodic IRQ test
>    tests/qtest: don't attempt to clock_step while waiting for virtio ISR
>    tests/docker: replicate the check-rust-tools-nightly CI job
> 
> Alex.
> 
> Alex Bennée (7):
>    tests/docker: replicate the check-rust-tools-nightly CI job
>    tests/qtest: don't attempt to clock_step while waiting for virtio ISR
>    tests/qtest: don't step clock at start of npcm7xx periodic IRQ test
>    tests/qtest: simplify qtest_process_inbuf
>    tests/qtest: rename qtest_send_prefix and roll-up into qtest_send
>    tests/qtest: tighten up the checks on clock_step
>    Revert "util/timer: avoid deadlock when shutting down"

Thanks, I've checked that this fixes the check-cfi-* CI jobs and it also 
seems to help with the travis jobs that use --disable-slirp:

  https://app.travis-ci.com/github/huth/qemu/builds/273921493

Tested-by: Thomas Huth <thuth@redhat.com>
