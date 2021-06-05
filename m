Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2128812lfa;
        Sat, 5 Jun 2021 09:28:39 -0700 (PDT)
X-Received: by 2002:a17:90a:e409:: with SMTP id hv9mr23178678pjb.126.1622910519366;
        Sat, 05 Jun 2021 09:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622910519; cv=none;
        d=google.com; s=arc-20160816;
        b=SkXVKYJhblDn9SuH7sPnD+6WvtFpzx95kyzczDJys+V6Cw88zzJGjxxDffFC5iBitF
         luXhuLwnnnMNoW5u5mqcPVA2QxgLiZYGYl8EVL3ZiBC4tC5ptBkYjXBw1QwLobHxIDSM
         91zgwmCzVjbOeVcLzyWSP600AhaZ1chkpcleIMm0RLxGRjH7MY/XtgXRTDgPvfQLE7iS
         lsWlQO6892MhRM14S5UKIZNCLnConDRoeMI7DVBKRnJXR+OEx57yZKEvZ/O6f/SJVYP2
         r1PUrPh6btgGlX9ec93O5rBNPkTBwKt7vRbHIhfBfx4e2GGtO+I7jvflxhMO57R7jb39
         5Zbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=I9Mbi5EUubQJh3BJF092oRkJNwG4K73+a5WCRWW54tI=;
        b=MyY+PQrDXDOgHps/ZgqopbmmiyaqoKO3f6U//sp46DbTIq/L9Z7/wIgYppRlwRIekj
         Ni/8krL64ddGyICGAcSpKUJocx0qciJu4nIuArSoa7zBXn+VDj53FFuzkdQl8zpbVdqb
         EMZYeeupMw6D1QgfrzO3C2BBgASYx6+3InG1D/2xFugNWpfTW7rJs4nAEmfio6HItdKs
         CIzWWXBUfpeLp+3nNEYKa/UVPeNr7hVH+gRM7ErjYhA5R7kYu1H+hvY7yNu/QYOuXU+k
         COGsmF14raO52q1qwEgb/Iif6TYb2T8Moixih5dDT6qkBypyo7FyE3q0wC7bkjqkDek3
         CqKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iceevmrz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e6sor685637pfl.13.2021.06.05.09.28.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 09:28:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iceevmrz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I9Mbi5EUubQJh3BJF092oRkJNwG4K73+a5WCRWW54tI=;
        b=Iceevmrzqmw/Q/SAt7p2maU/2jUVZCtmpv8FeIMgLn0TfDhxrPjGXwkpolrVze8fer
         JNgFlf56pLV5eSIiPVyauEDe6vhzbJjdgnM2H1iA8PupbU06uFLXLuq8uc6w7wQ5rfCI
         Svye++uADAO35ka/wiXnBcvltcCDrBvCyFp/c8mfZFu3FdJrW1gMngqMXE0XWay2Hh0+
         zoPIeMGaS/BZXT+C8q7us5RR1K/qbLQmVqkHG9vGMH/sIjcG9i6CpHj47fJzRyFuvNp/
         groNF8nHS9t4pGkZm5fabGhvgWO50zZRQF5+eoiboWM85ftQb2sceRu3vNZUHkYNiDWj
         LFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I9Mbi5EUubQJh3BJF092oRkJNwG4K73+a5WCRWW54tI=;
        b=T4r7KW0FlYX3PEVRYTVNuiXQcNt4dQUHNTg9BhZ/NAx8HXg4VpfvdhBvDHVy4oeWkW
         HiYo95BHaYF12QTfqmigQqrsGcEhPbPFoNfxj+nttVZXyXANYTDqLUkDo+DkeJbUARPJ
         XsHo/aux7ryg0jn9mG7nLUAB68yZVT329k4fW1wtOt20bIG+/idFr1kHK115hIpqvfDp
         ASTiNCIMWXbYRs3oRMhtm+QQ14tl91Ya7fCj4cOcoRYbE8jwrPG+doIEU9IELkHlzHnD
         IQ8HiAgoQ97ic4r27JhX4nH8CfTszq026Zdd/nYznDOqCnrGMQxGVApMzGsv7iK47D8H
         OY4Q==
X-Gm-Message-State: AOAM532rvcx68dJlbrCWA+kIN+sRCzr4L7a0hF8wj/c9nOdA3vncEKwj
	re8zcJbyT5fMebGhd3hJuFFkthjx
X-Google-Smtp-Source: ABdhPJxzVEujJPOfXcm07850j/45tCNN7YzqNaLx3htu7KfA/F9L6mdBdQxqhemr5XrFgFrdsN9XlQ==
X-Received: by 2002:a62:1890:0:b029:2e8:f5e5:a05b with SMTP id 138-20020a6218900000b02902e8f5e5a05bmr9994385pfy.81.1622910518793;
        Sat, 05 Jun 2021 09:28:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id 21sm4184597pfh.103.2021.06.05.09.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 09:28:38 -0700 (PDT)
Subject: Re: [PATCH v16 64/99] tests: do not run test-hmp on all machines for
 ARM KVM-only
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-65-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <038b9b82-7410-8461-e5a5-54c3eb76a790@linaro.org>
Date: Sat, 5 Jun 2021 09:28:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-65-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 5n3AV1mqfx3l

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> on ARM we currently list and build all machines, even when
> building KVM-only, without TCG.
> 
> Until we fix this (and we only list and build machines that are
> compatible with KVM), only test specifically using the "virt"
> machine in this case.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/qtest/test-hmp.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)

qtest_has_accel, I assume.
