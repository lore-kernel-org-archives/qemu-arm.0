Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3671918ejb;
        Tue, 6 Jun 2023 11:24:27 -0700 (PDT)
X-Received: by 2002:a17:903:191:b0:1b1:fb91:db2a with SMTP id z17-20020a170903019100b001b1fb91db2amr1503379plg.2.1686075867572;
        Tue, 06 Jun 2023 11:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686075867; cv=none;
        d=google.com; s=arc-20160816;
        b=u6RCMcVhmW2TU53IGaGUioO0Vnf5sLzW/6q+GSVLeNpGxxkd4lKBC/E3kvLfdXE9+q
         CJuWaj6UyDNZxNuqIBjfV0KQAgOhXasy0sZjJhUlpnpLGfMuEOLVXBiz1MjB0HU5dZri
         Rt/1lraxDqlzcThnzXnhMLyY66GqS/9M/9+REzHGlxZ2mM/YvVvGWAgjBqHg0bNf7C9G
         dO140YsikFDfUm5ckFMUJK5mJIa3223uvKFh0jiebaY5wTc1HvunjEUWI2zUIDtPa+1r
         mB/8hqyn1zWxMzVUCkcSI7CKVzT1vHzmhvU3q/L6MLnkxgFSBWNxf61xYrhFIc1xLyVt
         q+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kY7Zrm/Boo75QWDxWVkY4Hezx+pVdKx5ddpDMQwuUD0=;
        b=Cm2eBfssCF5UfGB162SRw6rJE0LXsAuCqQ7I2a0VScINFvmdNHC2xQWtf5eHaSONK6
         3dEQvwIkdrw5y+cW7s5/tkC0m9uJiufFKySdttDW7TiPjvn8bADkw9mI0y+YZLCru0y1
         /3vajxeuggLix4eAu5ELn9bHlT8TQmZfcU7DONwvoK+NE9IoKZTzxebe2SQhmTItObwa
         pJ9X3L9BIYK1tyXL2enz90GQsIBf8ZvYMsvw2aJXugDpeF7f67qaDWv4+wdgdbE/Md4p
         +KbqHsLot9lvKBLusbT+gSBE8cVEo6fuh9qUh84BKzBA0f1K7jMU0ReLGfD9tRswc6HJ
         0l8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UUs+6ENy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v10-20020a170902f0ca00b001b037e4d584sor2212168pla.10.2023.06.06.11.24.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Jun 2023 11:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UUs+6ENy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686075867; x=1688667867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kY7Zrm/Boo75QWDxWVkY4Hezx+pVdKx5ddpDMQwuUD0=;
        b=UUs+6ENy4KPnIYeKTtnkpRLfEU02V84KoW9jLK0FuqEkvwcCVURfBhwJFs12bQG4kL
         uZ2ZY4VT7JPhka2MbE3jOHLpnpBBfY7XdzatenFGsEUMfI6NQW1gBPpKAyuR4JlZjyUh
         4QAEkAf5tEHeda7aBLTxQ4wql/85swVi58X1Or/6V/jY7j4+5jK1htJ5plN1iJ4jjbkU
         flB20LMeOJvHMysdYYnnWArZSVtuGaWQJNz6LCxyZwebFXW+fbyyFBGkNpiCgFJzRrZj
         Snn79e2U5g5qfu7GtfEruEQR+8+HcL9S6pvCwQck42nUHQyhgMMdBMbOqm1/AO0nZtv0
         8JcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686075867; x=1688667867;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kY7Zrm/Boo75QWDxWVkY4Hezx+pVdKx5ddpDMQwuUD0=;
        b=kwIPnrtHVS3nfyb0r+ziVwRzkayekUjtTuEzRePlDFQWUAtacvRmoDUWNr6gA+dZIk
         VwZxwWU7hF7TwApjkuZ7Lps0OYmlXLVpvHunBTw8gwzbc7OcAckozh60PFNyWgFuP8WP
         bKCe0FAbUe1YXrXWiudXSjsRYIyJZpaQ6f0BmCVSsWsMTKf84/9AA2hRolZ3p2J4k5YF
         ygrgtCb1NNPE1A1VmsObGLiSPUyQcbhPctVVkmPa0zwbueJr5owOy8rNvtbF4ITojvlU
         Ldh3u3eEvA2bNI/tlkLZNEs3uLcg2zspqbRO+rqg441vK/x/P5yiOK/QaFAJm+6LhmLL
         HG9Q==
X-Gm-Message-State: AC+VfDzwQNHRaK2EnStDBof5RkkRQmAsL6dJyWjllzxLwxkKtOYMxyrb
	ycDRj99NvfI/omNE7YNcVpGXIYiz
X-Google-Smtp-Source: ACHHUZ6R0LRrxlR/sigHQDZ6YHU46rAuIXQxBHgVdt+pgj7UQamI9XSh/Xa7qtQMIYldS44j2Wco/Q==
X-Received: by 2002:a17:902:ec88:b0:1b2:450f:9cb with SMTP id x8-20020a170902ec8800b001b2450f09cbmr616978plg.51.1686075866867;
        Tue, 06 Jun 2023 11:24:26 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a? ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
        by smtp.gmail.com with ESMTPSA id m13-20020a170902db0d00b001b042e8ed77sm8802302plx.281.2023.06.06.11.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 11:24:26 -0700 (PDT)
Message-ID: <ad49111a-5dd9-671b-f18f-009a7eae73b0@linaro.org>
Date: Tue, 6 Jun 2023 11:24:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/8] linux-user: Add "safe" parameter to
 do_guest_openat()
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20230606132743.1386003-1-iii@linux.ibm.com>
 <20230606132743.1386003-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230606132743.1386003-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: hi2f8IuPXfyv

On 6/6/23 06:27, Ilya Leoshkevich wrote:
> @@ -8518,7 +8522,11 @@ int do_guest_openat(CPUArchState *cpu_env, int dirfd, const char *pathname,
>           return fd;
>       }
>   
> -    return safe_openat(dirfd, path(pathname), flags, mode);
> +    if (safe) {
> +        return safe_openat(dirfd, path(pathname), flags, mode);
> +    } else {
> +        return openat(dirfd, path(pathname), flags, mode);
> +    }
>   }

I'm not keen on this, as it seems like the wrong abstraction.  But I can't immediately 
think of how it could be better structured.

The only concrete objection I have is the change of API, which could be fixed with return 
get_errno(openat(...)).

With that,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
