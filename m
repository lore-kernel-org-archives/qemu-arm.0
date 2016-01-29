Received: by 10.25.159.19 with SMTP id i19csp1061560lfe;
        Fri, 29 Jan 2016 09:08:53 -0800 (PST)
X-Received: by 10.112.142.101 with SMTP id rv5mr3645546lbb.101.1454087333717;
        Fri, 29 Jan 2016 09:08:53 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com. [2a00:1450:4010:c07::241])
        by mx.google.com with ESMTPS id pp9si8570329lbb.18.2016.01.29.09.08.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jan 2016 09:08:53 -0800 (PST)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::241 as permitted sender) client-ip=2a00:1450:4010:c07::241;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::241 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x241.google.com with SMTP id e36so715787lfi.0;
        Fri, 29 Jan 2016 09:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=gx522Q4qibBP5DjwOp8xDw//DL2hX4GzJFiljFRTJtA=;
        b=jjmlQDZuC13vTCXdYbqoXavu62ByKkbZqXOqU+dkZBLlUsnOn474cswgzAsGq299af
         mPgK8lqbUxk1QnT0BZBYh26hFmrCO5E/B/cGc5KBPGdwP3Mnn4HNV9/O0b+EhYkWSIJY
         +w9DaU5q/CKIar1H59TTgxrb3XMXUdRu+bwVOFI+W6AG9ex2MQUM+ETe9rw5ruqXfX4z
         R93q8dSGzGVE+2563qjR+Xt6Edyn6Q8Kac0l9DQ0HjfOigktikqFzHC5JzJ4AXf8CDgI
         WU7RcUS26jDq1/mEPAzPdNdLKP1yfPGP7dnbsFDYzqj1kjn4CX/Lt8/qAvwSENRk3BP8
         vX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=gx522Q4qibBP5DjwOp8xDw//DL2hX4GzJFiljFRTJtA=;
        b=G6bukYgG97y9NCQYyH7rdCxlDs/nHESu8OF/0iZltjFaJIxh64R9MPQ+ImvZk/ozBZ
         7+tYkdgSkbZAAqK3w374VyZB/H//T10lcYQ4y3jrM39k1bwKTC5a7ia+qznpu7DrAt+O
         iGTTQIk5Zly+VXs4sA5SLrTVHqQjp/EgtkgtK9OgsUMDXnD6AyInj8BCtpuJQrPpWLm1
         NSU5SX6OwSqKtvjKBxUURM3MeVJvIihugflGgwwpoTFh7aq6o8pWDpKfmXdDRE12FEF8
         ivyZh6nybPbL5mnvfX3xrXJwiEZfn/DITWu3FB37tYQ8RWX64QEi7FijezFqu5bQLAVb
         0MpA==
X-Gm-Message-State: AG10YORRmrKIFz83wdsTV3tGyE33hIWgxElxYB1UdGC5mZ6yTsjNofXLwojPthvc21mYfQ==
X-Received: by 10.25.31.136 with SMTP id f130mr3816087lff.5.1454087333416;
        Fri, 29 Jan 2016 09:08:53 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from [10.30.10.50] ([213.243.91.10])
        by smtp.googlemail.com with ESMTPSA id bf5sm2153080lbc.49.2016.01.29.09.08.51
        (version=TLSv1/SSLv3 cipher=OTHER);
        Fri, 29 Jan 2016 09:08:52 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH 1/8] target-arm: Properly support EL2 and EL3
 in arm_el_is_aa64()
To: Peter Maydell <peter.maydell@linaro.org>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-2-git-send-email-peter.maydell@linaro.org>
 <56AB972A.5010007@gmail.com>
 <CAFEAcA908Y_a112aTXM46q7rhKHrHaK85pP7jKwZs5bc6evBug@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Patch Tracking <patches@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56AB9CA3.4050007@gmail.com>
Date: Fri, 29 Jan 2016 20:08:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA908Y_a112aTXM46q7rhKHrHaK85pP7jKwZs5bc6evBug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: Wf3w9sxz3OtH

On 29.01.2016 20:05, Peter Maydell wrote:
> On 29 January 2016 at 16:45, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
>> > On 14.01.2016 21:34, Peter Maydell wrote:
>>> >> Support EL2 and EL3 in arm_el_is_aa64() by implementing the
>>> >> logic for checking the SCR_EL3 and HCR_EL2 register-width bits
>>> >> as appropriate to determine the register width of lower exception
>>> >> levels.
>> >
>> > Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>
> Thanks for the review, but this series went into master last week :-)

Heh, I missed that somehow :) Anyway, great patches!
