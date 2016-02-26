Received: by 10.25.208.211 with SMTP id h202csp16027lfg;
        Fri, 26 Feb 2016 12:20:49 -0800 (PST)
X-Received: by 10.55.76.213 with SMTP id z204mr4478091qka.58.1456518049405;
        Fri, 26 Feb 2016 12:20:49 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com. [2607:f8b0:400d:c09::242])
        by mx.google.com with ESMTPS id d34si14753022qkh.0.2016.02.26.12.20.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Feb 2016 12:20:49 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) client-ip=2607:f8b0:400d:c09::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com;
       dkim=pass header.i=@gmail.com
Received: by mail-qk0-x242.google.com with SMTP id e124so3158875qkc.3;
        Fri, 26 Feb 2016 12:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=J9SFI/FiS5WOEor0q2fKAPV+uajsy2dVbUdpOwjxjaw=;
        b=sZUAxTxOEb36o+srxCw+wl4Z264q0LFGg1co7NkspPkkD+8MN7NUh2IRtXjjiB8CXa
         K6dgzQykEF67YiPsWVhNhCS8qTM3thkc/StEYh9GoqhmOwKGz5+T0JSB/+rNm1pWg0Ct
         MbcRy06RZBOGr2qr9Fl2qCqUk5Og4uh1EoNPcGbimJdkyCo2jN2BhEzhPkEgGF9hUS90
         K1Imc0Kbx03b1VPPrOJpZUlPeH0jcs0a1Ifm7X/WhsP+2Zea2CDKpk6VddxGYMfwPMOB
         0gTKRv6WQFMNM3JXhq/8s8KwxDDAUZEVbGhEf0AFq/QTRr3aKNJ9M+I3UatW5ZgndY05
         KNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=J9SFI/FiS5WOEor0q2fKAPV+uajsy2dVbUdpOwjxjaw=;
        b=Uo0JLpJwfL1qrXV4GOfC6X7CAoVCTxNKKPdvJho9DnH6usrOS3cvP86sEQP6OR91dD
         CWGbYsXW+ARcCBc3hFtTeEMyAWLzHgjezVtKQJTLCPtPqXgBL+OUhPi3NxQXhlpJrsMo
         1M65ELMRd6D9Ico/IkhqjmPv3NsJ3pLVinvX+2X15NcGixoF+AEjAAfmxLcawf3a5r17
         50JUO5+Ixi/0slA7Ns6ef+R2tS1y3l3si3dppnKkFFchknRB+tcgpot6tZ64fnJUltUp
         LgVEm8WelucLmFxovcfmr7/gd4qRlxq6aYLqMv8UAuwnmw1S5myk/TzNJ92Zzz8GTDVQ
         JGDw==
X-Gm-Message-State: AD7BkJKiEQ9RMlxK6Ot8ZgdnJvsCuUrB7SgFpSMeoav3mf6j0cVeTphXOvyMyBEriLfgJw==
X-Received: by 10.55.55.138 with SMTP id e132mr4452172qka.11.1456518049099;
        Fri, 26 Feb 2016 12:20:49 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from anchor.twiddle.net (50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
        by smtp.googlemail.com with ESMTPSA id a66sm5986931qkb.20.2016.02.26.12.20.47
        (version=TLSv1/SSLv3 cipher=OTHER);
        Fri, 26 Feb 2016 12:20:48 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v7 7/9] target-arm: dfilter support for in_asm
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <1456156787-17509-1-git-send-email-alex.bennee@linaro.org>
 <1456156787-17509-8-git-send-email-alex.bennee@linaro.org>
Cc: crosthwaitepeter@gmail.com, aurelien@aurel32.net, pbonzini@redhat.com,
 dgilbert@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM" <qemu-arm@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <56D0B39E.6020708@twiddle.net>
Date: Fri, 26 Feb 2016 12:20:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456156787-17509-8-git-send-email-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: ljEh2RfNVaJS

On 02/22/2016 07:59 AM, Alex Bennée wrote:
> Each individual architecture needs to use the qemu_log_in_addr_range()
> feature for enabling in_asm output as it is part of the frontend.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> 
> ---
> v5
>   - no longer wrapping tcg_gen_insn_start (was tcg_gen_debug)
>   - reword to handle only in_asm
>   - added r-b tag
> ---
>  target-arm/translate-a64.c | 3 ++-
>  target-arm/translate.c     | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)


Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
