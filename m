Received: by 10.25.0.144 with SMTP id 138csp1817231lfa;
        Tue, 25 Apr 2017 04:20:01 -0700 (PDT)
X-Received: by 10.28.225.212 with SMTP id y203mr12899708wmg.62.1493119201609;
        Tue, 25 Apr 2017 04:20:01 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com. [2a00:1450:400c:c0c::243])
        by mx.google.com with ESMTPS id g6si18188753wrd.40.2017.04.25.04.20.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) client-ip=2a00:1450:400c:c0c::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wr0-x243.google.com with SMTP id 6so10529448wrb.1;
        Tue, 25 Apr 2017 04:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m/NZ24LXLmtBnZ+fPPx4UYB9Rv9hVgkbnp2YUeVcbKw=;
        b=FaIuzrDAgzb0+jsrsn36fhfVT2g/bZOmNMcIxN0Yc4c2dItjT2TE/qh/MR03/pj7UH
         sirxIQnP5exOpuMtKx09sYT7PU3Awp+zL26QQubu0Uc2b8lsaaJjgkYh++F9X6AJls8X
         kGfaVwVxowEoTrjVxUh73ChtCn/gG0sgVxzaWatio10PPmJM2m+9R/4TnJoDc+1RC1Wh
         iv+UwMW5V029kN15uJGMOS+pbk1ZhCd6s9GaRT1pXVeQI9Hil3+jHf3EESEZSUbyC0S+
         cFg6rbfjIsY+vlGBjp+wcZVydWPKrzNdelFXyv88Vb+J/L4+btN4ViGy7D778bnisCrQ
         wAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m/NZ24LXLmtBnZ+fPPx4UYB9Rv9hVgkbnp2YUeVcbKw=;
        b=IARqqKZMwt1P9TR7XWqQtrh3pSDKsj1q7j3xR0YnCUEezCTmLSDSLA0jmbh8y8E5BZ
         QquYkLnWVVnyaQDzhwmc3qJ1+Pmlvh8iIPMIroD8n8mhAJOiU76AIXmA5SxWm4shfoLq
         rrwwllXNPV8VWQ0IISytyrQhfpPMGox68aKCYNxFZwFXgsYd3/7dpaMB5qIB+5UCECPZ
         knsNI9K7iYo5+kyq1rAhhcIoldlPyXZrb7j9h9kLqb90/WJnayZ8p1d1D4W3DUdpbmeC
         WZoNv4W0ngl7pMkFakqblSdXcCWnXxfKjghluASaJ7XXsxF1g1q/kihKcgdrUwmETIOb
         E3ug==
X-Gm-Message-State: AN3rC/7lSrDzUc74cueDxSU26Nqpx+3jdbshkeHNyyXvIxm80QbMzWRu
	lr8otoCyk5Zi5NMeOJo=
X-Received: by 10.223.133.97 with SMTP id 88mr9449712wrh.166.1493119201384;
        Tue, 25 Apr 2017 04:20:01 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id k199sm3776668wmd.20.2017.04.25.04.19.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:20:00 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 13/13] tb-hash: improve tb_jmp_cache hash function in
 user mode
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
 <1493106839-10438-14-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <867b6d02-2c3e-9537-7ef9-705ce682d319@twiddle.net>
Date: Tue, 25 Apr 2017 13:19:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493106839-10438-14-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: Hmav9J9DVvfj

On 04/25/2017 09:53 AM, Emilio G. Cota wrote:
> Optimizations to cross-page chaining and indirect branches make
> performance more sensitive to the hit rate of tb_jmp_cache.
> The constraint of reserving some bits for the page number
> lowers the achievable quality of the hashing function.

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
