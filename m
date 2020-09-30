Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5292374lfq;
        Wed, 30 Sep 2020 01:03:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw82qSnj/I2DyxwV9ieWKWEOoz+qbJ7DsShwoMgy2fJ8aTueIidfX4JDo5vj9a5fCH6ZBSv
X-Received: by 2002:a17:906:c8d2:: with SMTP id gc18mr1631625ejb.467.1601452996235;
        Wed, 30 Sep 2020 01:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601452996; cv=none;
        d=google.com; s=arc-20160816;
        b=VFU1A9K/alugKN1aP0AJkJTZe83kZj10svHeprR69LhO/COWlULzudGS5JKyHozckn
         WB5ZxRVZqSiF5Ejaf/9lTWzPfiLJTvF2OKhnRTaGmJJTCSyt8B9ySswO8+7pMuhsjjZR
         v+vGbmkwdnhdQbhN3Q76kRT7L9RlLq0ZmDFhLSWrrq5i44m4GxdplhYc6EDQ5o8sSG8C
         zUY/L+8aGIZqfvjNPZecz7zoVqTIcHc/Aq2ER9le7dE9KsaSXourZvwONjXWVERpEQon
         Jxou72+S6nVKXVVAF42gvVS5FKnGyAz0qUewPxDlryNim8RqBySesOEb5baPS7SqYkiZ
         OzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=H4BYt/vK5k2En+rBp+T6Wcx0j3U2356tq8o6rj5g7sk=;
        b=JrBKKbl8puMne2fbQkmSwKi18Qb5XVmuWhgK0BDv016DQhZtBgUUn5d7nAS7UEEXGy
         Dtc+TNyDN43mS+oEaaIYoPTBdqGIcsG5LQF0k9iuPz/V8ybseYxaWQptlSLm/VaCTIvy
         D2BatbaP0+i7wlNfMoVD+qg5rbkJMOuZ3EuxlS4RROMCIOvu8NOx7jeZzWSMjl1qrKmU
         pXlNa5/WwNBogNTJObDxzrCjpX22O5LF0CeKXGqucHVjt6jwheSY5DIUS9o2Ev3+PeNn
         hmzr/NaE0CoROAgu9ChFQCklonPdQHni9GA8EnuI9bawTlThinIoZjm9OVsA+uJ88nVg
         VjCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U9uKzT2G;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id g11si521407eds.232.2020.09.30.01.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 01:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U9uKzT2G;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601452995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=H4BYt/vK5k2En+rBp+T6Wcx0j3U2356tq8o6rj5g7sk=;
	b=U9uKzT2G/Oitq1KguT58OOjat4IByhl4L9mChzucQYxuegEsVhHNWU0sIrncjIYl/Mm5uv
	rG6ZcPbqc3yXpg5K2M4pYSH8Mu2+/LN1KQD1aPaOmzvWmm6zd6ChHSJwrxf7E8/uOiCDUj
	RA/3tE1LwwbtxsdI0tRn79RoEr1FLpw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-oCh5PpWEPxaCXbjlSoTycg-1; Wed, 30 Sep 2020 04:03:13 -0400
X-MC-Unique: oCh5PpWEPxaCXbjlSoTycg-1
Received: by mail-wm1-f72.google.com with SMTP id 23so169978wmk.8
        for <alex.bennee@linaro.org>; Wed, 30 Sep 2020 01:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=H4BYt/vK5k2En+rBp+T6Wcx0j3U2356tq8o6rj5g7sk=;
        b=PaizRuPbn0t8srtIgOAP2CXDeuxqqA4VYHtlY/xhqizaVTE4mk2CufJuGfxNzFpnQJ
         TYQHkfa2Hrc6G7tffrnZcJot164uLOfUmgum5MSkIDdyCkVchbyifT/maR6n6899r/Hn
         rPt17FA9aQyppwtEbG3kdv1JVMjyTiTEDkI+zgeVTM1DmWkluJTUGxAHkR2DNlaIBBPL
         2DxaoLkOcf37Sh3nFVlbaouoJUmMuNm6ajkMXdHT0ib8q3Hvi2X7dz9q3sA9iQftiBq6
         RQ0NJciYvJnouNvKlrIU/UifhLwpolQtah86dv3WzlLfIfCK5HA92uSxqCMAwxf4cs80
         AFsg==
X-Gm-Message-State: AOAM532/YZLCx5KyfEJUhTL21aGr2EQipT7goCB7y1GGc1mKAUqYuHmP
	pQWdOwuioGwl5qgzkmTzJh1ogx8Ss8dJjUEOmEOUieecDk8GcAnxWveE8kO0JZWNMqhxPgap6+/
	CvdnHFbhTlil6vx6K
X-Received: by 2002:a1c:7302:: with SMTP id d2mr1636640wmb.133.1601452992065;
        Wed, 30 Sep 2020 01:03:12 -0700 (PDT)
X-Received: by 2002:a1c:7302:: with SMTP id d2mr1636624wmb.133.1601452991837;
        Wed, 30 Sep 2020 01:03:11 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id k12sm1444147wrn.39.2020.09.30.01.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 01:03:11 -0700 (PDT)
Subject: Re: [PATCH v4 04/12] target/arm: Restrict ARMv4 cpus to TCG accel
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-5-philmd@redhat.com>
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
Message-ID: <971287b0-fd62-21bb-e80e-8b83c8a5c459@redhat.com>
Date: Wed, 30 Sep 2020 10:03:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200929224355.1224017-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 3fNuXnpEZYsw

On 9/30/20 12:43 AM, Philippe Mathieu-Daudé wrote:
> KVM requires a cpu based on (at least) the ARMv7 architecture.
> 
> Only enable the following ARMv4 CPUs when TCG is available:
> 
>   - StrongARM (SA1100/1110)
>   - OMAP1510 (TI925T)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/Kconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 7d040827af..b546b20654 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -1,3 +1,7 @@
> +config ARM_V4
> +    bool
> +    select TCG

This should be 'depends on TCG' because we can not
*select* TCG, either we enabled it or not.

The problem is the machines are already selected in
default-configs/arm-softmmu.mak, so we can not build
the current config without TCG.

> +
>  config ARM_VIRT
>      bool
>      imply PCI_DEVICES
> @@ -30,6 +34,7 @@ config ARM_VIRT
>  
>  config CHEETAH
>      bool
> +    select ARM_V4
>      select OMAP
>      select TSC210X
>  
> @@ -244,6 +249,7 @@ config COLLIE
>  
>  config SX1
>      bool
> +    select ARM_V4
>      select OMAP
>  
>  config VERSATILE
> 
