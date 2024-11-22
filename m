Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5275471njc;
        Fri, 22 Nov 2024 02:09:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENhEO5R7HBTzmD/2eOqAXtvtEVPaQn7oLupOML8sJMHBvcJAJ07h1iigtMR+CEXiAMztcN
X-Received: by 2002:a05:6214:c43:b0:6d1:848b:a8ce with SMTP id 6a1803df08f44-6d450ff952bmr33321846d6.28.1732270180537;
        Fri, 22 Nov 2024 02:09:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732270180; cv=none;
        d=google.com; s=arc-20240605;
        b=hixMo/IihsZSV60xMQnZAamkYt0ukwxfnTJdHEqqNx5cASCsEpq6xDs9mFbg30kgvL
         8aREVJNXBvhLKZm0RDAThkRDKVN/TRTye52OveRvgh88cbb1ktqDJCG+5setRbH1ESC+
         jJl8zG+9kqutMv/iQSQSbATCBXeoyEaI3kxXMaxOaxbfG1sYRQZjIHDQ70gskxV2SOup
         RAXXNqvZz3REL1fBQMmOeYqOu2Owlvye3wIjE8IXk+14hglM+9/CJSbAeNyZE3m86g1v
         mVADQFgiBuhTWtyKPFWLs65e+SMHYskLjp2tP5qghN2E8Bf5//ycr2LCZpiUxjtR4iCZ
         kDjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=i1IWiSzOx5VC3RyUgpOez5MtsfmeowV+nHptAa//GcI=;
        fh=wyrMqsRQzp9wn+9ic3ETyfTwhE/ffyQObIHI5bvyAZ4=;
        b=V8HureYa5F2RSVUz43AeI6P658dwQbOajgC/sH422eGeQ3mmAeLPWESz9n4A+y+QS+
         h7KJW1OiNZqTwDwgPlvD1HZmvAew1SLPzLnz3iFnROBweIlikq7bjJ3N4YdEqMLZXoO2
         CPFYV2JSNN/IFNNow1xjd9R5SMm13e+i/21QaUU0kmMYmKD4j+sPiNqLtON8RB8VlvAQ
         fNNZlWQt3H2GnlOkhQrd0EVIAoUvZKL0GdiW45/24REdFM5si40Gjcm07oqZnl5wxMI+
         aX4OesZFWWlnTziC+/tZngJebvJAqLH79gG8g169fzZ3mQCgMUipbZMnRsqsXbtKTuUA
         v8cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RfHDdkx1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451b49c54si16446176d6.355.2024.11.22.02.09.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 02:09:40 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RfHDdkx1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732270180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i1IWiSzOx5VC3RyUgpOez5MtsfmeowV+nHptAa//GcI=;
	b=RfHDdkx1+OeM63CYYk8O83sPiLSUCeH+zVXXSGXtJWItqCk2T6FnANFT43Ns2EKdQyrKkE
	CSwKGdyLEUXk23t0Ij63s2CNoRRaK6cZYr1weFlksn2hA0YXksRb6kt9IvVO7eR7UYp9P/
	/EAwg45+H7y0KrvykdbweTpECuwvw8U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-VA1QeKhyNDe4SbTReojYFw-1; Fri, 22 Nov 2024 05:09:39 -0500
X-MC-Unique: VA1QeKhyNDe4SbTReojYFw-1
X-Mimecast-MFC-AGG-ID: VA1QeKhyNDe4SbTReojYFw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-431518e6d8fso14650255e9.0
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 02:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270178; x=1732874978;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1IWiSzOx5VC3RyUgpOez5MtsfmeowV+nHptAa//GcI=;
        b=R/HArjl2/VhNqmrbnPF8HEM9YKv7jX0/yUCMYwbU1S8t/Krxt1xcjwTwIxJ1wVe+m8
         /3Bc22Bzset/340z001/ZEfWUZ71Db5dxl1c5RNdV6LrWD+UlYIXJngiMXxMVVCct98R
         b1566x+97PFqhbiL+P7YM6q5r0FZ98UsI7yzXTJCEoYWafSGIyPUaA67H8qvcxhPWuwU
         qm3FMR3etjbUeEab3w25ItOGHi5Asd29R3LO8f6VBrJM3JCbP5UN7h7cyFJ7Bnbt1yIm
         oNlIZttxIwIZ/UPC2HUG0+IULHSZsQJZs77EdlU5F2rQWeZXgWeHnw5S29AB31oSHYN6
         pcsQ==
X-Gm-Message-State: AOJu0Yy8QqZCdv3umehqFlO/nQbUJYYO8rb2HbwKoG7xBdb7OJNaYV/z
	XHDa1K55Jc9VDlcSMy0CuSs7cyHoe3b697aWgbvQM1lwzzl/B8pNC9PJBRWjT0EyetXhSWc/Sg5
	+MGXKrQ/JvPyppZ1TYP8LizumFjOjasyB99ZtU097aySYusqT0oXJTo2YWXdFeOPC8a9Ho5aiwT
	Gta5Bsr2MVH/HCnm3mqoIFvTLpsse8e2LSqw==
X-Gm-Gg: ASbGncuNXDwFqas5cEThLltsuEbOEGPNnX72SRTjxIyhtRezc0PLgpgMc2MMgOlTyh5
	ScL0SpY3Dyktp9nmbW67haZIcN+MMxufsqrtOvZGtwo8939IuM14UpHK8PP6zuidjdXTOiU0nHf
	Jcs0nfce1AZAMcOlN+BrpeoGBggfC/60k+yQqR7XHFdSWC2SF2wA0tjPRzN/If+rqV5NqLeGZ2f
	LaGHgkgZt2Abz+YWJFdotE6WNippdr/TrndxYGVI7jytPCI+RU5UC2OnEdKq+0Mz5g9Rl58J+Y=
X-Received: by 2002:a05:600c:a02:b0:431:4a5a:f09a with SMTP id 5b1f17b1804b1-433ce4b2f62mr17706315e9.24.1732270178040;
        Fri, 22 Nov 2024 02:09:38 -0800 (PST)
X-Received: by 2002:a05:600c:a02:b0:431:4a5a:f09a with SMTP id 5b1f17b1804b1-433ce4b2f62mr17705665e9.24.1732270177634;
        Fri, 22 Nov 2024 02:09:37 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde98993sm22092855e9.37.2024.11.22.02.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 02:09:37 -0800 (PST)
Message-ID: <bbf0c995-53be-4aaa-9999-2ce38a442f36@redhat.com>
Date: Fri, 22 Nov 2024 11:09:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/39] tests/functional: update the mips64 tuxrun tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anders Roxell <anders.roxell@linaro.org>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <20241121165806.476008-27-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241121165806.476008-27-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ubRghTdOA3XyNDyPC3hKCUvrraPDhrGN811op_idxtA_1732270178
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: RI/rYLdPg9ji

On 21/11/2024 17.57, Alex Bennée wrote:
> Now there are new upto date images available we should update to them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>   tests/functional/test_mips64_tuxrun.py | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
