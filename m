Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4225232wrg;
        Tue, 14 May 2019 10:00:09 -0700 (PDT)
X-Received: by 2002:a1c:730c:: with SMTP id d12mr1503369wmb.47.1557853209416;
        Tue, 14 May 2019 10:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557853209; cv=none;
        d=google.com; s=arc-20160816;
        b=WHskfWJzIN1lqdzleK1agZJsHfwewSt84AkLXr4M/+tRTsCDaQD2AitBv/h/DbRO2l
         L/rgVGGV5XVdgZlOvjGVtBJUMcz8kFhSA2OzFDb+Rlq9SoGDDBQo/TN+Sn6O+19XrV42
         7a7ge5UztC84aTylQSXgjB8yRSO0n4mgcNA1aAHREjT345n8ps2tGKy/KwTiDxquo6Mf
         YDcXAhvxbzSSaK6X9oDi/fpfyL82zTBBgE+xhwtOItR2XaLluJ6zwHePQWx1OPXHJs5l
         cHvCws7f59cciXr9a4ACNwqBymtcyN10boxFPDBzyHIFBL+M6wqS8NNmnoZHHW/ZWzNf
         wwEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=h9AOnCLueME9f+uOyX+juJN1gfzEWa2awgFUucETZcs=;
        b=I0/IqCn3vRN9b3WIekonfcey3V5IHCLFtHQ4JrFJUq6zXJYlaqKWdzTP13SYvQXWkl
         07vhLVZNnqP5zCaDOTAnwy8SGsqpuFOLmI5aVTlL1UbXWkiuQYah6e/C1QSaRNqBmAL8
         +jCv0lyR50jlWtSXZE+JPqY2QxUyDSLJIlrlM16fakzYLJExLRZ4xnZqxScZ1csGM5oV
         j5NlQWNRoeDriMXrzTUy4NPLPVMmVowrHwv0f6xWjLFXZHNL2kMw8Vx/IDsws19jwq+g
         AZYfoNW9UMcQXQZ8q1STfGVsuswWmcMu7GI6aSjFyxzoUQcZ3vJGJ0zmTtP2HZTJG2TS
         CQ7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g3sor2005288wmf.25.2019.05.14.10.00.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 May 2019 10:00:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h9AOnCLueME9f+uOyX+juJN1gfzEWa2awgFUucETZcs=;
        b=EycGqOsUuBAHnxyYR0A9S5j/2QFLmlNcRPp/nHu0AS1VDtjC9JQT+8XIatt6Qs/Uil
         U/uZlcz/3iLJ0JLn5HkxC7JwWnJL0ycDx9nHobVp5yeKZeRyBl6HxQnUm2ic+9sQV8DT
         tuKDyONwU+fVFyHKGXYHBHAZBsDfmL1kX2t52JTEMcZhOGIE3fxVVk4XqLxV3EXkMH/k
         PHXTEL9xf3Uir6FX7Lnl85EWKVfyTh3b3JWrUcOblcBQw4AQVZAvIjU5lAGkDAonrDtc
         nRW2NBTqMZ3v5Hffx0xYmgsjIY841XeEvxKjWZJBN7k+haBLPjzT1op4mANjOa3c5/BI
         chng==
X-Gm-Message-State: APjAAAW+hH7JAG62iwSbg+rwWeNOWGF0JXyerYQnbD0lPWI5MAfowDfi
	njvCWibeV4Xnur4ZWdNK3yCV0w==
X-Google-Smtp-Source: APXvYqxy1liWWpb8M+h0UVSjMtrH8k8ZKSgTThfmHiOusa4Ab+uOGM828rZIFn+W/Fm4xJsIPY4cSg==
X-Received: by 2002:a1c:6502:: with SMTP id z2mr19270880wmb.119.1557853209200;
        Tue, 14 May 2019 10:00:09 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id z4sm3633476wru.69.2019.05.14.10.00.08
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 10:00:08 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 11/11] MAINTAINERS: update for
 semihostings new home
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20190514155301.16123-1-alex.bennee@linaro.org>
 <20190514155301.16123-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <55ff9fcc-0431-befb-2b66-3803ea85b64d@redhat.com>
Date: Tue, 14 May 2019 19:00:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514155301.16123-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: HfPkm0cuUfT0

On 5/14/19 5:53 PM, Alex Bennée wrote:
> Seeing as I touched it I should at least keep an eye on it.

Thanks for that.

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

FWIW:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a73a61a5465..e9050beb222 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2559,6 +2559,13 @@ F: docs/pvrdma.txt
>  F: contrib/rdmacm-mux/*
>  F: qapi/rdma.json
>  
> +Semihosting
> +M: Alex Bennée <alex.bennee@linaro.org>
> +L: qemu-devel@nongnu.org
> +S: Maintained
> +F: hw/semihosting/
> +F: include/hw/semihosting/
> +
>  Build and test automation
>  -------------------------
>  Build and test automation
> 
