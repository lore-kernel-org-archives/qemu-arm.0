Received: by 10.25.227.6 with SMTP id a6csp487063lfh;
        Sat, 1 Jul 2017 18:22:43 -0700 (PDT)
X-Received: by 10.200.44.87 with SMTP id e23mr5095177qta.123.1498958563329;
        Sat, 01 Jul 2017 18:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498958563; cv=none;
        d=google.com; s=arc-20160816;
        b=UPmO5c/Za3aZC7k1CUODq79X8vFSTN0CUXZ5R2KP2esAwiyvQXukJMKLnhpYuIXjjh
         nGMMlz+Be4nRx2uxritEuLeK7umn+Qlvt+6KJD1sD/yuiqONfPRc5VOfvq9jqiwB6yn4
         G2pAqXqJUvebO4fGyPrULGdd07RRgZ48SDoEo3j1E4hnENNbqeUOeGVk2tbgfBZ2HWtU
         KnlLJdYqjgPm2Gx6gU7viu4YEV4+ryWE4V2eZvtB+en1CuCrd6E3Z3iaWvwruePEFKg8
         d3zQsWjowM5I7ND7JcZR5iZBs3J298a/TAyOAGEcr+GXKSuC0/I2U00gMWi5UYvAfFjo
         cfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=y1hvf+z5CGB/n8Ve4dXI6wwBEz1mpd5eWzdp10dzPEE=;
        b=DkhnIY7MnOnGU5QPmAXxUNyzckGhMMach5uSoFixt0HMnYsS0hR1dWrhL3dDYwVOhi
         O4OM9q/03Zpt1mv2fTVsgoBP+3/tdcPdlBpeZtYU8Q+7JteuIce28S0S4Ej0MclZh0LI
         bes9a2l3e1zMnJydQ+QeZ7X3/u4FNTVC6ct2T8UBCR27qabvHj7d05+IV/stFTHBvEJB
         TGUYok+QX2BppXn8p1gwGpC1yjr7eEwQ828NP4RdEGFJt1Rdcq27E6MnzW6uqwSHiMqC
         6VwglqLa6NyV/oD10wTkJM7MCnsEhwylMwhee6sd6ts+dL7K5hdcOFemp1Kdi++45vYS
         jUHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=mmdm7BXj;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com. [2607:f8b0:400d:c09::243])
        by mx.google.com with ESMTPS id m39si11414419qtb.37.2017.07.01.18.22.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:22:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) client-ip=2607:f8b0:400d:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=mmdm7BXj;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x243.google.com with SMTP id p21so20104908qke.0;
        Sat, 01 Jul 2017 18:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y1hvf+z5CGB/n8Ve4dXI6wwBEz1mpd5eWzdp10dzPEE=;
        b=mmdm7BXjYl8rMMWGhBGYOlrRhMJXXiKbtGq4Lx8F0oTuNilDzTAdFxk1zI/pHpC4QJ
         QnZfbyEuIvaOkTYNbMl3G/V28xBnuu3PK1bhA9aqGoXkKkTnuWYud0yjM7KINwUEkCHP
         D8tXYGCgn1vn9LMb88kWk6EcbosQ8TNj90bdFxTCVk0fqSZUyH9bVfLdgHbvzN5nrfIW
         RttSF/9HM1CXOeuWvjIa6K3ctrS06UCp9MIgY62V+7vTgPJbC3JC3vTvo1DgM18D1KZ8
         k9xJTnUkTAHY6/Nd4H8ikDOl5FTDs6U58SwRi5+jM6XIWflO0gANvMOD91Rk0e733C3w
         fyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y1hvf+z5CGB/n8Ve4dXI6wwBEz1mpd5eWzdp10dzPEE=;
        b=n+ssf50AQe+zvgpp3uG1LXtPhfCpl0NGC0Y1LPCjajbFiIMEMtWNJm3J0tYoBalyOq
         LKtxhQbBcrl/Yf4xTRXmkiZ6NnEDjgv5W/DFIk2/bGDfybjMDIl/tNp9pG60XLGKQeFQ
         XXfcXtqKLQEE+kp2yBHsRPOxWxsIRnFwsqRhJrAcvsEm+YFlbPbF2s1DHWq3H3e8nsCv
         KXR6X1Hpc7QbWZ4CAXVX3afrZzmugElD/5QeqZTocSeXfRU15nV50MBRtE9yrYQMy6AG
         oPBnnroQQYpkC8OHxW6D6Zvv19GgY2iPtV3+CBZkKQaXmE07jpmjJupdTT+tttfpDp7q
         Jzvg==
X-Gm-Message-State: AKS2vOxYmyWoRUYjQsSxz3uSjEtS00JoXi1KhOlHWtNrtyd8Q98gavL2
	EKqMvIaZAtb+z7OPS8g=
X-Received: by 10.55.197.136 with SMTP id k8mr35200512qkl.211.1498958562724;
        Sat, 01 Jul 2017 18:22:42 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id m66sm9388793qkl.60.2017.07.01.18.22.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:22:42 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 22/29] target/arm: [tcg, a64] Port to
 breakpoint_check
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865752773.17063.5160701222440538985.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <e8de6c54-71fb-137c-10b8-f9129b19a7da@twiddle.net>
Date: Sat, 1 Jul 2017 18:22:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865752773.17063.5160701222440538985.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: c/qL3PZHGhjE

On 06/28/2017 06:45 AM, Lluís Vilanova wrote:
> Incrementally paves the way towards using the generic instruction translation
> loop.
> 
> Signed-off-by: Lluís Vilanova<vilanova@ac.upc.edu>
> ---
>   target/arm/translate-a64.c |   58 +++++++++++++++++++++++++++++++++-----------
>   1 file changed, 43 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
