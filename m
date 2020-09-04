Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1579738lfc;
        Fri, 4 Sep 2020 09:12:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf9RXQgnNkgNDQTvRnIOBp1cOtz0YXxjdvgAQ/G72zUY6GqFyK+lLf/CRHAKDOpXtdKnhz
X-Received: by 2002:a25:c7cd:: with SMTP id w196mr10080276ybe.351.1599235966965;
        Fri, 04 Sep 2020 09:12:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599235966; cv=none;
        d=google.com; s=arc-20160816;
        b=qt6+6fezKkZbgSbHemkb3DRha/KcL4VM+Hw4XFTq7MOJIrx2ntcw9NNugiHDEFAxIk
         vG4gdWtaZJHBwQiK7g8y3FT06GeEcrN0sLLBsdkieIoddkE0JImRVfG/x7zJzRJzw1Wp
         DqxZVGK8HJ0pgDMd+YCAR65G5dkYSvdNP9tPUdXq5m+mI9KHUJvDpPb9R4Fs6tODbATU
         G+a8UhNGNxiv0EYXTRpCeZFV4oR8O0jl9BUTKFCk3CfTjj3qLtzr1HKvmnvO2ETw7c4q
         pf+V0YhBUjdd7YL/Q/wHe6x8qJZhYoIkM2psVhZEwv9gRXf0acW1grq2qr/2ThdUoXvV
         B0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject;
        bh=eaMwwPscNwGdRDRGK3gfyO/PfIaqPkiI3ZFAWEt4LbM=;
        b=NtbEoriXB/CBCcXJTr5bjCtehObA1TKNyHj2+Ef66zixGlg7eT2SX2HMVSwBhaIYbB
         yEuJDGTlTC+I7zOB1U7/D1/wQ77ink3cvSoPjr2RCBhRb6/E9ybk77DN27CzuIqke7La
         580c32NKN/P36CLI0OXGxPt5gX2kipeNPVJ0nTITkoUxRTB/vmmJPkSAT5Y/EOunQbv7
         BsXA5fAN2iaGFWFfKuYrvyxeeUo6Hu67YDwNswh7AyTWwlaC6w/mJLkOTQtRzO/qwyYl
         mhgkmH4y+XYRCBQBfSHN2o24aST4EGskEem9aggpWoG0Qze0kEedwovP+aP8p5VV6wp1
         Hf1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 73si6402734ybn.416.2020.09.04.09.12.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 09:12:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kEEKU-00030e-B5
	for alex.bennee@linaro.org; Fri, 04 Sep 2020 12:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEEAA-0004Ay-9L
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 12:02:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49658
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kEEA8-00027f-Ef
 for qemu-arm@nongnu.org; Fri, 04 Sep 2020 12:02:05 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-aDiuIWNHNiqXdsONYJw2SQ-1; Fri, 04 Sep 2020 12:02:02 -0400
X-MC-Unique: aDiuIWNHNiqXdsONYJw2SQ-1
Received: by mail-wr1-f71.google.com with SMTP id 33so2460206wrk.12
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2020 09:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eaMwwPscNwGdRDRGK3gfyO/PfIaqPkiI3ZFAWEt4LbM=;
 b=pzgCYafxA6x0mHFvPicXr1YC4G+Nm2+QkuKw9vLK8j3225gqTMqrGVxjbMgjMAj6ex
 5iLhZfBf/NeGjf2+mGAiB7tYdYrRtslhdEp3bu7LRZMOC6p0PvvETyF0h1Fhl8aAT1Pe
 yh6RiMMfWUJ9kQKbiPdFClRIX5R/scglsEadYa1zJgrZetDGHrACGi0WoYD65u/TVEkR
 e3xUR+pbbKJCGP7RTNrUAqH9Cclqy4j7pENGiWAwrPGo7QucuHTF2WPX/TRArdYrxu/5
 ox7p9TLUHzVjPdXM/anXP66t++Rr0TG8wKFs7oEhHSqqwdf0q/UNuTy7nyEUpmpUIEn2
 zGmQ==
X-Gm-Message-State: AOAM533XKMl7V8DLuH5VG75Z6GUV5vOApqh2oj6yJpdfVNjpMvrSUY5E
 SQFyueMOfhDlFlj+bUQXepM6ITO9btNK8Z1MccpsZIkm8Pv5dQppPOTaPOYzUGPhHTSGdrUpUXG
 uvIpa+K5MZKsO
X-Received: by 2002:a1c:e917:: with SMTP id q23mr8033150wmc.125.1599235321391; 
 Fri, 04 Sep 2020 09:02:01 -0700 (PDT)
X-Received: by 2002:a1c:e917:: with SMTP id q23mr8033128wmc.125.1599235321131; 
 Fri, 04 Sep 2020 09:02:01 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id j14sm12642417wrr.66.2020.09.04.09.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2020 09:02:00 -0700 (PDT)
Subject: Re: [PATCH 1/2] target/arm: Remove KVM support for 32-bit Arm hosts
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200904154156.31943-1-peter.maydell@linaro.org>
 <20200904154156.31943-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <2ee5f790-87ed-5a17-efef-5b428e783ba8@redhat.com>
Date: Fri, 4 Sep 2020 18:01:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200904154156.31943-2-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:58:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v6h8Kv6L7s1B

On 9/4/20 5:41 PM, Peter Maydell wrote:
> We deprecated the support for KVM on 32-bit Arm hosts in time
> for release 5.0, which means that our deprecation policy allows
> us to drop it in release 5.2. Remove the code.
> 
> To repeat the rationale from the deprecation note: the Linux
> kernel dropped support for 32-bit Arm KVM hosts in 5.7.
> 
> Running 32-bit guests on a 64-bit Arm host remains supported.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/deprecated.rst |  16 +-
>  configure                  |   2 +-
>  target/arm/kvm32.c         | 595 -------------------------------------
>  target/arm/meson.build     |   5 +-
>  4 files changed, 10 insertions(+), 608 deletions(-)
>  delete mode 100644 target/arm/kvm32.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

