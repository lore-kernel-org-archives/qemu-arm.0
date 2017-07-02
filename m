Received: by 10.25.227.6 with SMTP id a6csp486470lfh;
        Sat, 1 Jul 2017 18:21:52 -0700 (PDT)
X-Received: by 10.55.53.148 with SMTP id c142mr29137759qka.88.1498958512518;
        Sat, 01 Jul 2017 18:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498958512; cv=none;
        d=google.com; s=arc-20160816;
        b=v6hvFECIo4kofBx8IwzmoRzFK/WVJbKWWsQxnpx2yYOe5V/9x8yuXLcKQQs3UdjuZe
         NRFeBby3NfWHzJYcj5zBQ9svKYZ3AxUjoeIK6l7Y4MdRji4pyP/UOtktNT5FjVAKxVls
         6HhyBZ9rxK0yQjrY7sFa0CHJEQjB5jPQOH2vmezqgm7TGoL/lKJtkQ/Bf0EHJL/nCdLi
         GctBW2WeLqueAu2Xj5apd6duy5/nSPTjubPLvdRr3AvjSiyUeRgLjhocez3PqafZZZJN
         6rppLggaLa296DLHfABvINM/g/epFjevT+LMn8MI1Z1nRA1aP/TtEPWqCeH2WH8I2DlM
         NEXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=c+Ioc6gmCnt46jgFhTij/T+TVthbNOxpSmG5k/Qxtbs=;
        b=tCtKwgAlGPann+os8NxYlL7ND35FcLf3efHJ1vdOg+JrUeHUutNHzcGgXURMOZ52fO
         RzaWGIgo5wz2iLWmCACrXkW9NaAy1C1F6IXfPZTqy7K4mNzCYwlB/yJZJmk8bCvd2PCq
         ABZiiuotj6gnP909Dgno3ZNYvEpPw7rg5J8Vabj13hDZu8ZECFgNGdv0lQ7yMejxrYFA
         HcElpSmT8siV04ks/nvMokAcTbAuZprMdY38KrUa0XMgTuMtIw6436/XwOkKd1MLqsvF
         G0ClAK96GFdzmSD5QIPUV20na78PMS37n2AjuN8c8q23yZvcArjnj5ApnFu5vxi8tPdi
         Hxnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=AWB7gkpw;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com. [2607:f8b0:400d:c09::242])
        by mx.google.com with ESMTPS id w55si11556846qtc.66.2017.07.01.18.21.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:21:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) client-ip=2607:f8b0:400d:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=AWB7gkpw;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x242.google.com with SMTP id v143so7305394qkb.3;
        Sat, 01 Jul 2017 18:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c+Ioc6gmCnt46jgFhTij/T+TVthbNOxpSmG5k/Qxtbs=;
        b=AWB7gkpw3GRLeaRgB/K1f6jqnCIJb/+ssjVGaQLNMEdjw/R4eRR3cgSFfR1zy1h4XF
         lRor4SpR4eDo3xc38WUOUyQXUpoRC8+uvg1+k7YmlKwXYWpBR+X5PyQReanJLLQi3QMX
         wty0VmSLWi1WTmAF/VALFrHbmw8lC7u8Sl3YnHFWi9SlVikjlDZ/1lWusuLlRrO3mo19
         3KzNYAkfAXDX8i4C2mXvCIgpn0qPQ8FPANyKnwSMt+IuDJqWUGxlynPW3QtdiWrGIvZo
         zvkPpESWrHA9Uox1/o1ecDdjhCfRPo+AP0jOZw2+d0M/+xd5XRto9mGcWXG7vBEKTmss
         oNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c+Ioc6gmCnt46jgFhTij/T+TVthbNOxpSmG5k/Qxtbs=;
        b=nbPcorhm9bQWFjRPWYnrqEGVUcyCt/BwcxNYcA5g62PPYUcSgLwh/DtElOwJoLlnUt
         g2IXz6UBfx/pMuBAZHFIueJqRhmL3m40Em581TpjaGaQpAmbxW2yAM+7a0u0Gt1jnZ1/
         QmRhBPDXcRjqiZplI4gAPz9+5+InsEpw7pDsBtp3vO7PDOmxOhJtOzDanYt/MAlCyYtF
         jU7PtXCtDRXEV5+MCfpQnZayBdB7tPjOM/J1g4QiPY7m5QfKxUYVFw+ALuCkZzBxRCE7
         sg6z4KUgj/CsxrzrmMkDim4VOsfGxyIXGhEPRF2YDigZEjjIfSQ6GRwBgFUbelzxlUo+
         I02A==
X-Gm-Message-State: AIVw111F16fkYDU4JyYwi0oovkss9qmF/6YvqNQ3AbBe74GR6VBVHBLj
	ne1eU3lFZpvY+qoxwaQ=
X-Received: by 10.55.115.69 with SMTP id o66mr5844462qkc.110.1498958511966;
        Sat, 01 Jul 2017 18:21:51 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (97-113-165-157.tukw.qwest.net. [97.113.165.157])
        by smtp.googlemail.com with ESMTPSA id l207sm8944076qke.36.2017.07.01.18.21.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jul 2017 18:21:51 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v11 21/29] target/arm: [tcg] Port to
 breakpoint_check
To: =?UTF-8?Q?Llu=c3=ads_Vilanova?= <vilanova@ac.upc.edu>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 "Emilio G. Cota" <cota@braap.org>, "open list:ARM" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
 <149865728578.17063.13455172137587126808.stgit@frigg.lan>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <d13da25b-0bad-73a2-1b6b-0af4e4a1dcb8@twiddle.net>
Date: Sat, 1 Jul 2017 18:21:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <149865728578.17063.13455172137587126808.stgit@frigg.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: GrXgqh91hUQF

On 06/28/2017 06:41 AM, Lluís Vilanova wrote:
> -        if (unlikely(dc->base.is_jmp > DISAS_NEXT)) {
> -            break;
> -        }
> -

Surely this doesn't go away til the final conversion.

Otherwise,

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
