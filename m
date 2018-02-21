Received: by 10.28.71.27 with SMTP id u27csp1034645wma;
        Wed, 21 Feb 2018 10:16:12 -0800 (PST)
X-Received: by 10.98.237.21 with SMTP id u21mr4147539pfh.190.1519236972733;
        Wed, 21 Feb 2018 10:16:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519236972; cv=none;
        d=google.com; s=arc-20160816;
        b=KJf5XtF1os/BJP9h/GnHBToYfY8Q9UJoV+Wi1Ewf+4zqyzI+copeys+MaPXFxciIyv
         pPwVLMGY6IQrRVsp7PQaGFL7XmtmMYRN146JOvhqSHYaGOAtnw4RsKwOM79u/js7yJxb
         Qavbj/3rMT15Vx0hMhtMWLuTw1Z0ZEqSpt7WZeyWPRiF6bH6keTpS2JkLLnOqrhIQW4S
         XBorzTCv3bUF8VfbOpoxFskmZvUzx9eiw3elanIxYqpcPKUZ9Z0X1CJi87WLN0Ilknqc
         iBSWnJePZJcBFWGEq5FPZTDrEwJCzcozgj2WV3wix+CGxCyLNoD5FQuvmJJDuc99B+hC
         jRRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=xZnU9n6YRRF4If8OYVWEsAFxXWA+5qo9kUsgbuK0wKg=;
        b=LRTGLfqgyYC7YZh1Pa4gmnFJ7VdrYKJIzLsXJWE+n2A85fB5VCSbaux6nKE8TaE+5b
         J0Hjl+5R90iZhXe91V4/5cFMURSoPhkjlZ41yDSqzRpIFkuwL/RBQndPYc7UogJXCLQF
         8Xy0bt2PnVRe27p9l9C/JTo7ezeknYb7c6REyaXhmYy8o3JAJFph1/LW778858NFbses
         dgxYFLUHD+ygHV5vjVMq1apoJST8bA8QUyXIGU5c/P1GxeHtjVg4KYCld9km4q9PNqB9
         skGaINsD+pewQa1fTG0Ucuw9l635PI+bgz8j5Tx52AgBIMwPJ21C9lmrMo/l3lSLC/zz
         /h1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cj3lvcJb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y6sor3670543pgb.371.2018.02.21.10.16.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 Feb 2018 10:16:12 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cj3lvcJb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xZnU9n6YRRF4If8OYVWEsAFxXWA+5qo9kUsgbuK0wKg=;
        b=cj3lvcJbjiY1qT+SOaYkZOcBrq1HawmjF14mA2oyir5PkE5aHfdSZVT2VaqJ9rpQI4
         HQCeJK6ev8g+nFIp1MQEuSG5sUY7n+G+Q4gTuOQoHQWWl0DDWGE970RDTmid8KYcFJ/+
         rJhJPGsNHd01zGI23MXkukFj0PooSZibaVc6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xZnU9n6YRRF4If8OYVWEsAFxXWA+5qo9kUsgbuK0wKg=;
        b=UhWCsPr1ZyxL7qlbfD1vRJC+BzbgPVWc+9n0wrTsDQ9QD/FamoXxtZCwLUIQGGdliZ
         9JRfVMt35hD7Z9NUyAHuBXMhdCF3rmKce2TZVcBhdd21VBSlgdxVIxnpbYV3ThgWYxJ9
         G8MSVW9CAoQF8GFlm+IDUJRnK7iGZUwm9+w1zASLh6Af9hGxD4g7JufUc7c6Zl8o4gLn
         jZBpZXIFGzQS1Q6ceBb6NKWoKpfLPMwOowZroGWbtk8ybN75ktG0hHGXe/9t6suTpkhl
         vKKO5L3L8zrEC9vCLU3UU71uLmnR6nJLaXG5bda7C4Zler2f7lv/3Qyayep2i8UkqcV4
         8GlQ==
X-Gm-Message-State: APf1xPBr+iUUgnqzzfeTdaFoVjexSn5UaU+x+53vubNI7LYVYKPJQy9p
	Twc/07kYkJxymqqeO1dhKifuBRcCtz7R+Q==
X-Google-Smtp-Source: AH8x224l3xatlIzSlqRvUwhBKlj7FjerPWljI2BwJ/zE/Bh5wHgjJNxjDo2h82KgRF3EyEu9QsMDPQ==
X-Received: by 10.99.122.74 with SMTP id j10mr3299069pgn.84.1519236971038;
        Wed, 21 Feb 2018 10:16:11 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net. [97.113.169.147])
        by smtp.gmail.com with ESMTPSA id x124sm62910052pfx.105.2018.02.21.10.16.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Feb 2018 10:16:09 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 03/32] target/arm/cpu64: allow fp16 to be
 disabled
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
 <20180208173157.24705-4-alex.bennee@linaro.org>
 <CAFEAcA-=Oh=MgSGoheP70o9dy0hgo64PBtRH5u1u51bjqUAh7A@mail.gmail.com>
 <87lgfm9u7a.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <595a9f5d-80ca-7ff9-5dd7-f4177a348afc@linaro.org>
Date: Wed, 21 Feb 2018 10:16:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <87lgfm9u7a.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: CZAT38iVg6Tv

On 02/21/2018 08:35 AM, Alex Bennée wrote:
>> Good news everybody -- this is an opportunity for a naming bikeshed
>> discussion!
...
>>  * use the hwcaps names that Linux defines and prints in /proc/cpuinfo
>>    (in this case that would be a combination of "fphp" and "asimdhp",
>>    since hwcaps reflects the ID register setup that allows a CPU
>>    to report support for one and not the other)
> 
> In naming I favour the Arm ARM over whatever Linux-ism /proc came up
> with.

Likewise.


r~
