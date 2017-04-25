Received: by 10.25.0.144 with SMTP id 138csp1809779lfa;
        Tue, 25 Apr 2017 04:02:46 -0700 (PDT)
X-Received: by 10.28.54.85 with SMTP id d82mr11691366wma.84.1493118166579;
        Tue, 25 Apr 2017 04:02:46 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com. [2a00:1450:400c:c09::244])
        by mx.google.com with ESMTPS id 39si29646965wry.53.2017.04.25.04.02.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:02:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) client-ip=2a00:1450:400c:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x244.google.com with SMTP id d79so24106010wmi.2;
        Tue, 25 Apr 2017 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aPq9UH/88b9WHci+xqLQmyHXC77K3sCPr2T+8532WKo=;
        b=Vxfew4ixI2hOucvpx/70e/vIUlz/UnzYwuZya3uN60qKzOwmwoSUw+gy2GKOzR74CW
         tRy2AdHxLlOjJL8brEhLUjlO2zzimQy7zIS4HAzpSkogq/InLfRJ72rg9CcM4oXvmC2e
         pAAUNtfRlzduzQjAkEW9BWYQoqo0r4m2Btw1yiWwH5BiLZGBV0h+sZvYrb5pVCdd/2QH
         3uQFctZ/Bg6h3M9dKz3x84BapGGMgtVxVKLfK+DtnBMwq3BUBKTo6aLAeFd7U/UITPOW
         0abyZOqeTGILVRfYLprnHkewEWqZQ79KsFRo+z+hrFlp87CC9b8KYaYU4sumohgKkvIQ
         AjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aPq9UH/88b9WHci+xqLQmyHXC77K3sCPr2T+8532WKo=;
        b=lj5L8/HyWIWRv1oWqHQd4lc9Me0Bpe2nREzNwCCay6jRowgk9ffvu6Oy/9Yj785+9N
         15IQjzX69exilFpsOVFqWLhCmEHLgzQ7WvSIhaE4B5ufKoZ0a/Dvl7V6HghtbFzYuoti
         wVL1Tw7sq6NDOCWv6bIxtzn1N4Wc/T1CuAkRE0Hj2LqSbyr0l9EU9QuftOPp8eMN4X+B
         ta+uYlTibHKmg6gHRwkTvddfmScn+9V2UB1hU4KtVDiWgpahrZ+hstcNNMcgkxFfWmSC
         0jdu2uibnk2eXIczW4uXYc6NviiS4FClFd8Q+qpYaHwEdSf8jlCDZLiIjyS9CD3HLhf9
         yfgQ==
X-Gm-Message-State: AN3rC/5ph9gzJ8M3bVav3LXFgDOWZJr0x0F8LTz+903BRn+dkzKQxhAo
	sAKel6Q8VfA0TtjRb80=
X-Received: by 10.80.153.11 with SMTP id k11mr4644713edb.63.1493118166162;
        Tue, 25 Apr 2017 04:02:46 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id k17sm4962232eda.61.2017.04.25.04.02.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 04:02:45 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 05/13] tcg-runtime: add lookup_tb_ptr helper
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
 <1493106839-10438-6-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <e96f6e11-212d-45df-b237-8ff3c95313ca@twiddle.net>
Date: Tue, 25 Apr 2017 13:02:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493106839-10438-6-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: wMiTOrxKKyiO

On 04/25/2017 09:53 AM, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>   tcg-runtime.c     | 7 +++++++
>   tcg/tcg-runtime.h | 2 ++
>   tcg/tcg.h         | 1 +
>   3 files changed, 10 insertions(+)

Modulo what I mentioned earlier about maybe directly inlining tb_from_jmp_cache,

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
