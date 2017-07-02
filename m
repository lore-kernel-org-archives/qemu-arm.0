Received: by 10.25.227.6 with SMTP id a6csp469934lfh;
        Sat, 1 Jul 2017 18:00:50 -0700 (PDT)
X-Received: by 10.233.223.65 with SMTP id t62mr36199517qkf.80.1498957250226;
        Sat, 01 Jul 2017 18:00:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498957250; cv=none;
        d=google.com; s=arc-20160816;
        b=K7m83pVNcfEPeYrQ85zP8QxVDJnicLJOA08ZLC6ZsdRJFYC4NCR0VF15uu4YHSvC0x
         eFcW8lRvn75s0AmYqfgm+9DM9N3sy2IsSzyDb7N15Fp29pD2BQHkF9IDM7/MyrU+BQEL
         EI1ELOqJZ0S+h/KQqCFjQG4D9Y6vKwXZ2XVqScylnmnSa9zBVIYYkK6okXQPPjIlPLzl
         7UpeMeluPAkcpaz5Wbi6NvijRLiUoioLA/B5VO6yM75jv59XLg1yjfVwpS2YKX93T7yr
         ZRkUF9z1hwIuMHVgZWXpUk/2kUUuWJo22scta6evs2kqxqPEv2xisusm/eUi/HFgkjBe
         nP1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=2rfCqTLwWqvzbPu4I6XRZtKLxXbps7DQeF1sDy+QDOw=;
        b=MSmrd5J6ehn1bBPwb3vJuSsmSwTQ7MQ4VhuADsWK7fi0TSdwzTXC2dZX/QTEoPkJL4
         H5ZesJNp8xUdNZJrrE7940fNw+YnxNRNLTNzFjqDRQkpwwwqmwzXJOVcMvW1lqcGSgL0
         afpkIIIJb42LZ8G6FrJt9HSYcvO/JPH/+tUCO2+9doGQXknJ5GCMbdLhB3LenSul9O3q
         VG0MG1cIDQFDtOWRvbhhyPDcCw4xHtpmi+3mJ7A51kohfREim0ts499fg7qMoBzZmo6t
         chN52jjIDzaqLfKc0HmRMIKFF7rGNuIrcNwym7CBD7ZyXfC+Qs/Z/ifHs7+wfWHLtkJk
         SuWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=gnxmYocm;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com. [2607:f8b0:400d:c0d::243])
        by mx.google.com with ESMTPS id m18si11586535qkh.52.2017.07.01.18.00.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:00:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) client-ip=2607:f8b0:400d:c0d::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=gnxmYocm;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qt0-x243.google.com with SMTP id w12so19619994qta.2;
        Sat, 01 Jul 2017 18:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2rfCqTLwWqvzbPu4I6XRZtKLxXbps7DQeF1sDy+QDOw=;
        b=gnxmYocmjlrKjn0n4Ap9eUr3r02TrT4F/in/gWL3uQOrPm7sT1nvOKp/enSnEtz/Q0
         /wXvdenjmqFyuvdBZGQhampxiL4cRrW3R4bIHi4wTXI/eVsgCxr+slN1ImLbpuj1ir/L
         TQuimiIokyqzkdPpBh0pUp7nabLYiqfmFHajRd6rkDy5NSC9R/VVzpUEAyTuULIjZyKt
         teZ7QRpfakS+bR3eZ8UlHCy28cYBe+vdunOfbp0+nYx7lJ60L7IRf9v39mapPfqyA8oj
         DmDGeR5oGEv3S3gTHAKs8ZfFuj4HwLobz6rwW9L94AkXnQJV6mBC9LoyT/REBg1UtOnH
         sM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2rfCqTLwWqvzbPu4I6XRZtKLxXbps7DQeF1sDy+QDOw=;
        b=b7KBKq6X3K/mvpAD9WVWy0bDt1YX7zQsD3wHL7UbagFymBi2naUTLOfSLdZ86SdVci
         WTvNaudgX3p79MK1CLvbcE2dgMppJtlJ+28Vnm6LOhqiVmWN9fY8S2JNUPVsoBXEI8h2
         ex63BqB/R92ULdTFCWbYmkIjOnLL0AH+5SXqBVog9giTBr1Wt/0Yge/VGKb0DvzP3PWx
         L7yLXqk6yn3T23YUjlT6lVk+o3QSCU4NX476yAoyf6Lmu3kPgiR2BjyfWlUgxe76xbag
         4pak2d17QBhNHOVOozFSOt87x+P+lxkWMB++AaKdx+yEDFFjWsdoqjaWcwey3GVe6fjl
         NUIg==
X-Gm-Message-State: AKS2vOwCyUkgIzVi1rzQ2ucy4NNeI7PrRXzK7Jq3LjdJQcyOQ8eBNlLw
	lz4x0f+1mHQoQYDnkUQ=
X-Received: by 10.237.62.132 with SMTP id n4mr37364998qtf.0.1498957249569;
        Sat, 01 Jul 2017 18:00:49 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id a23sm9339821qkj.51.2017.07.01.18.00.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:00:48 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 14/29] target/arm: [tcg] Port to
 DisasContextBase
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865558836.17063.10744518168688659698.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <cc1db796-9cd4-3f2b-d7e9-0d7e8d071b16@twiddle.net>
Date: Sat, 1 Jul 2017 18:00:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865558836.17063.10744518168688659698.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: p/U39Y7JbEvF

On 06/28/2017 06:13 AM, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova<vilanova@ac.upc.edu>
> ---
>   target/arm/translate-a64.c |  119 ++++++++++++++++++++++----------------------
>   target/arm/translate.c     |  114 +++++++++++++++++++++---------------------
>   target/arm/translate.h     |   11 ++--
>   3 files changed, 121 insertions(+), 123 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
