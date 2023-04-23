Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2201972ejm;
        Sun, 23 Apr 2023 03:48:57 -0700 (PDT)
X-Received: by 2002:a5d:6582:0:b0:2ef:bbe1:5f85 with SMTP id q2-20020a5d6582000000b002efbbe15f85mr7414039wru.9.1682246937746;
        Sun, 23 Apr 2023 03:48:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682246937; cv=none;
        d=google.com; s=arc-20160816;
        b=xMh0vwnp119RzodwowpsAMkQ0v44Xkgt3WqlfbrgwuK5vQoarfQBFh6KXtNN8+OnyY
         lnl/FBB87AvTs0ED8O8zJMo9XbhOFWwJhzNU9bmq8iAPYFcyy5u/Iu9nzoFc0h4MBDcd
         DmcUDmruaTFWWWNZSqKEOAVxjcgkmCrmNVTY9NaLOCeal7y6H021vX5Ir4l3+6NWcPsY
         PKS/9tyeYIjh337FkTSBZWV6FO2vZrbxenwuHLoR57HSJpe6q1UhS+LCg47+nbJGQpmT
         NTZPwkSrZayjffeMrRh+vTPrmpBGhVQsKNI21EOgZSQiKUYYuKNie1JTuLZxzouFSy1L
         2F5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YIwxGyoLTrDeLMLk7+DKwRmeTNXNiokhIl+azqB5Qk0=;
        b=py80HjIVcE8uUwh9mOO0SdFdpxHYgMhybnYsz/ORBQUi7bLljrpZXzDFXsQOHVXGEW
         /pVRQs7/qaMAbe90KW7dMdQvCcb6mKbEezif8kBJkYoELWsJoO4DTDxOhPokI6lxaMYw
         xkDifQXBg+HeSYjaj5IG6gT8nKkfZlO+P32ZgAFdtijbDP05Sng2cWYrekUWcP8ISIVQ
         jg4fe13PU6SK6SlZw9DG+q5LbQt3LMDzDU3a2+GVVoh/5b8AyBbujMty/821MnD9Ua0b
         mzW1/iuZOQKezLSu0RCe0ttJtEKsR9diCM0Ldlj4BAQd/oKVDlIwhJu8d1s4LH7kvJXD
         8e+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMyNKXOL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m11-20020a5d624b000000b002cfec0faca3sor3192950wrv.51.2023.04.23.03.48.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 23 Apr 2023 03:48:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMyNKXOL;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682246937; x=1684838937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YIwxGyoLTrDeLMLk7+DKwRmeTNXNiokhIl+azqB5Qk0=;
        b=eMyNKXOLsyIeIRKkRY/0cT+gdN6S9QREu5Fcj/WWcltcm7WSATZ5f72TMBK0iQO7Ze
         cjzYXsZAYQKE/G/YuYNAf5YOCnR9WMthExngpSvxb8d0PeLFQO/uUz/PIA9iwqIYT6gy
         fZ1rciUTZMs0sMZWaqriY4Nz4HY6JfIBz2LdXVI5nJX6q45hnX6hlvJ9WxEwpIN0soKw
         U70jQn638UXiOvPwlrn9NcdbuKXWnyEw3ZQh7BuN8xQZp8AZ7asdg+Qw6rlFzzUA02tJ
         xBPi1u+t+kMzBUvTKCR1R+OOnsK9lB6WuVonRMuoOxDhFa3y1zFCzYpv66lgNQarStow
         /7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682246937; x=1684838937;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIwxGyoLTrDeLMLk7+DKwRmeTNXNiokhIl+azqB5Qk0=;
        b=EsMoQP0CnUvukyvQz9lrEryZ/f3WUMsIkro12W1u/FpQ/Kvi0TuXrmrFTYPP+9liMV
         IYcZkudydV1XpljdqIAIXet+nGkitPAr8wxxzzQXMOxrO/FcY8xSWeYd7ImdBrs2lfCh
         aA0cnbTKTouIk5u9NUek8PnHxkIkrUJ97o1vE9UpodiJMY1lMbiXnEs6I8Oombb9Cg1d
         7E5gz+EkDOCK0Y2gdstSWjdN4vJpl5cT+Ri86AR5zTBettDpun7z9LMMfIUiF6lOoPtP
         RSLFOJKLkkVvhwD2ORxxGvdZjn7WgNe7r92CKYxqruLeJVTZuAbxwxcsafpdSxCIJFTn
         sqKw==
X-Gm-Message-State: AAQBX9eFazE9rlujQMUGVF9t3Yb8pKMi6Z1KWh6EeU7N5xcbKfV4G5U6
	qIDQJ5YMLd483zPRIohjSutArWcQ
X-Google-Smtp-Source: AKy350Y3/a8UssFO8Aui3O0cgpDzzRDNpZss7cAkwqwqvPXcLYmWk+2cbUqPQc19g8+GLHIZnpUZ9g==
X-Received: by 2002:adf:ec86:0:b0:2f6:fb98:fa62 with SMTP id z6-20020adfec86000000b002f6fb98fa62mr7644023wrn.40.1682246937406;
        Sun, 23 Apr 2023 03:48:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
        by smtp.gmail.com with ESMTPSA id f11-20020adffccb000000b002f90a75b843sm8395312wrs.117.2023.04.23.03.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 03:48:57 -0700 (PDT)
Message-ID: <84b45be9-cfd8-7602-5277-ddbb3722e0a4@linaro.org>
Date: Sun, 23 Apr 2023 11:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 02/11] target/arm: Remove dead code from
 cpu_max_set_sve_max_vq
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-3-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230412121829.14452-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lxME1tjFqgyx

On 4/12/23 13:18, Fabiano Rosas wrote:
> The sve-max-vq property has been removed from the -cpu max used with
> KVM, so code under kvm_enabled in cpu_max_set_sve_max_vq is not
> reachable.
> 
> Fixes: 0baa21be49 ("target/arm: Make KVM -cpu max exactly like -cpu host")
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpu64.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
