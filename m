Received: by 10.25.227.6 with SMTP id a6csp484819lfh;
        Sat, 1 Jul 2017 18:19:34 -0700 (PDT)
X-Received: by 10.55.102.203 with SMTP id a194mr33730607qkc.180.1498958374333;
        Sat, 01 Jul 2017 18:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498958374; cv=none;
        d=google.com; s=arc-20160816;
        b=h8BY/9y4jhU56dxLu8SYeE468r+AdJj5q44tCcthJLZGBYZpPKSgjKskkwsMUSG45+
         fJUsaJABLD7rwkZvJMu8hC0mh+u4pGE58wQytVUmjXzuZBnzU8768jrFBBh2QCkXZ8n8
         J3s/wbsILP08qx5ym4C95bk3cPYDK6U50nIFd8j+XjmgHOHsRpUvnppp/Q21F5gzaHVL
         iSidxMsUvnSiEYUy3g3hAf/T/eT5HUcpuMygalQlYsIsybin5r2HM7Wp4U1Jf1APRwSr
         oMyVPVV/SGs0DcooVZisrzqx4WcsoL/8dhz9ZuoG4BmCCn1YAs3etZv29dp8FLRiirq4
         ofXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=5I0yyPI+dvYNMgMbkrFUDcMvyWqHge9LES+LcZUtu+U=;
        b=xJZZXCqKFVlFDHbFOSqusOVkO+L+ETDwGqI6Ja3LaY7WDbPOIL5+6bdubMfERmAqW4
         4oqpsWGhwec6i8htFm2mg2WAcb5OOQAp+jhd53A9FPqbdGDu8SgZkXH7F3Aact8N5beU
         yhzCO0pjufOzo8iSP/w/Bc/D/kRu7t4LhxZcUURxvKjgq8LJRXFt1sndxtZCCrLNJyOd
         eMYNtcLBaVjU3JIJZrqGkVx+mfdVSZjDuTi4vYPOZYOMndLjTOLKFXFMaf1s+mtFQmXa
         1p3ldEOw/sr3HyCfe6RA4gzYsxe6I/Vbv4rXsC1jyazhv8tz8Q2BlLlkQoT9807GjHGx
         BruA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=t+K9Z8si;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com. [2607:f8b0:400d:c09::243])
        by mx.google.com with ESMTPS id n38si11608435qta.238.2017.07.01.18.19.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:19:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) client-ip=2607:f8b0:400d:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=t+K9Z8si;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x243.google.com with SMTP id 16so20091906qkg.2;
        Sat, 01 Jul 2017 18:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5I0yyPI+dvYNMgMbkrFUDcMvyWqHge9LES+LcZUtu+U=;
        b=t+K9Z8si+MKHK/N2+AJmodwu1hdpmfXku8e0WiQ99nIa9DoRtGI3P25MaeC0oWHvAn
         cX7FIl3jT2pcbZvqb26lLS8RBuKKcbRpCsMA8SPYdPcI7BhKS6pc7Jvaugc53Pm7OfZO
         QyI2nIIjwjrf7u5okcb/S3BGdyfjtxXSNpWQlazwNEKYwt6/bvxzS1OM48gkOZoj5Nfg
         4mcn/Z6kaLg+X0yqkvW/s0Kr155sMKMsujprjy3MJctvwEPw5/WjyRRrcb9i6yHz6TDY
         EOuO584Asrkvoosaw3TnH7lBlX2ZEny6bsEsXoaAot/E6fmA3R0kimPGFlbcYJnm9pSn
         BZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5I0yyPI+dvYNMgMbkrFUDcMvyWqHge9LES+LcZUtu+U=;
        b=UaWL9MUZ/y/N2dOpGcNyXCB0767SIYXBLNvNIHA9D6APeop5wYo/cHs95OOMqEFAC0
         iXTbYN/2tjdVImpov9fQSrQB/Db272uydV3DEm+YkRpfiOLimqmjW38fMn8tYgbNWCU6
         4vpwMh91kebX1I1c1Qrn4xp/2LGmBpEtceJPkH7XHAkeIc5vl43obf7TQNvIrDBOXRwO
         uKY2Iw+3Q2j93Z6bh82PkgGk8bqkUtJ4DzC5Nhm5NTBAnb0EU0d1nkkPp0FlFnbXLEbi
         A7cWYF8QFDz9kC8sFFSkS54KjPfzCo00qhW3mAjah7TYvSzCiM+AykeqN3lYSQSB7rbA
         DvjA==
X-Gm-Message-State: AKS2vOxhWiM8Y/IF0x5r2Myv/cehzQwE6xroXBropOOYb2yemfs5/HCP
	bMtvcU1h8LBFZDg6Ho4=
X-Received: by 10.55.154.5 with SMTP id c5mr32136669qke.231.1498958373779;
        Sat, 01 Jul 2017 18:19:33 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id q40sm10617980qtf.42.2017.07.01.18.19.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:19:33 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 20/29] target/arm: [tcg, a64] Port to
 insn_start
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865704378.17063.12646195470292499503.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <5542bcb6-384c-95db-83ad-29257238fd91@twiddle.net>
Date: Sat, 1 Jul 2017 18:19:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865704378.17063.12646195470292499503.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ycRg4gQ4SLvy

On 06/28/2017 06:37 AM, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova<vilanova@ac.upc.edu>
> ---
>   target/arm/translate-a64.c |   11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
