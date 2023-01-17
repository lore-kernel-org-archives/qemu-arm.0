Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2507484ejc;
        Tue, 17 Jan 2023 08:11:59 -0800 (PST)
X-Received: by 2002:a05:600c:3596:b0:3da:1357:4ca2 with SMTP id p22-20020a05600c359600b003da13574ca2mr3679326wmq.11.1673971919175;
        Tue, 17 Jan 2023 08:11:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673971919; cv=none;
        d=google.com; s=arc-20160816;
        b=MAdtHC8jWhsrjfoJT3A4InrM56pn2v5hn5xTJuqzQQs3oRqIPHsLdpEoKAHk9y2Pg/
         95e/KZGebNSxq98fVA11TjE5TPbcpWWXftniDrfNQmHj4zzMYMQnSC8TqEKPZxvGtHu/
         oLrImQuq7gpj6iRWnHlF+GIMtXWee2aOKVSSxx9xuZ7m+nZK7oib9HtIXtoLb4ECGkJB
         F4O2ojaxlKda50leGhW7ArvWgmvl9lfXMAp3C4J4tI7OCElphNKOKR2wrAZegQpJdO1j
         ELZhQgr0WWpwB/L09t/ZcMuDdm86siP7MGGQBD/UCQT0mZQottqcSxOH1WX1zzKs7Vmw
         VUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YSR0iQEwD9EgWKmRmAZGWn3JdFWBjFQQSIwNBvSDN5I=;
        b=HCc3NviJd9093fqj6H1iRGnhpvAvZJIkn4lK6uUaV9SfEhln+SAauMx28jNxl7AbG/
         7SvzTrMv4oFpuqdm6Tms2Ou5I1sFjd5JdYmvrm1zL6W/dC4Hv/HB4VfSQ2WXGbfVrnWS
         m2W9HjD9PyGYsyjEWpUAZjOt+dD87jy4uLv4eSjCdYELJxF0mBxHTM/nxKlISGT8xhBF
         MPWwMaGx+dM/xqPVQhxRfzLwBU+ML//VLxs7iaoqTlzoZO5OFbGbXKyf7lpp+Ox/RTU7
         GTQOvGrhc8mJccZIOPpaFBk1AIJ3ToePyAno4xIKVACWvZU9dOF6V/jlmRMjyi6L/Ucy
         kQGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a7XVmi09;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v9-20020a05600c214900b003db0648df48sor954031wml.10.2023.01.17.08.11.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Jan 2023 08:11:59 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a7XVmi09;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSR0iQEwD9EgWKmRmAZGWn3JdFWBjFQQSIwNBvSDN5I=;
        b=a7XVmi09yzkfdXNR3IOmo1aG52mWS6j5hu+/JBLQWnWluza29G+BMPowNzq23v9e5q
         D53512AMWR4m7xFVQTD+wSW6TbIFv+FBMlWzLROOlXeUMvURvW9LJIilD3qX0dwT8AI7
         /HmyubwbBvkCPXOGH3Sq15PlXXfBXXrb7HctegwkGwsJ2jegq71TcewBmEWIJaipQzLB
         BCkGsSRDV1mrQlJTXm8nUVU/LM8DOxapR+XmuEHFC4+eyQn2ETpgAVPh7PBGv//yy8Qh
         cKPztKQubX6Xe5j1D6iVIvoZ8g37Ua11hevNKN6tbGx+UMnpT1GNXujTfJNg3bQEfjd/
         1EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSR0iQEwD9EgWKmRmAZGWn3JdFWBjFQQSIwNBvSDN5I=;
        b=YavxJHynhpGcifXRKTBJPA+glYvC3HvRD9o+5tedmQI9wdB3SOtz2yjfHMmjL6D+lr
         It6SDoa6nGJsbAtMY88IxUF1T8WHlyHZJ1vNEND+59hX3AE2yzQRH/HAbYGNPcMGdKNB
         AB69PMNZIYbs6mNrMEz560bDxgcDoiFAWI3ga9lkAEBMNbM7fcWkRvXrXYN/NIqQ4sxf
         oH1n4m2ogCalZ9KBr3odDX1gBrKbsGdyU+0P9EW+q9SYjhUyRhXGsXaKumYhoeOSswZq
         aYC/ffVa7pX5D+ffXN7wcNxtJij+qfKz6f1JJkUNq0GnmuS4X1sl/DbDbMHu+qhwtJoa
         O7bQ==
X-Gm-Message-State: AFqh2kqEBNuHNNZwgnmugOAbzQ0U8w3L7iKUnZRjdsbPjEsFQejJHs6G
	Jjtz3p/5BwscDYphSxZ+Ve+TbtLT
X-Google-Smtp-Source: AMrXdXsgo9yFEU6A0YYroAAGV5vfgZow8m+xgYNMW7Lg2mzRtETwLcKjFRPHK/SwNmNgKNfdWUYELw==
X-Received: by 2002:a05:600c:4910:b0:3d3:4406:8a3a with SMTP id f16-20020a05600c491000b003d344068a3amr3613016wmp.30.1673971918918;
        Tue, 17 Jan 2023 08:11:58 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id bi6-20020a05600c3d8600b003d9df9e59c4sm34213553wmb.37.2023.01.17.08.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 08:11:58 -0800 (PST)
Message-ID: <7115ab30-9093-7cbd-e2a3-c57d3a1e7d46@linaro.org>
Date: Tue, 17 Jan 2023 17:11:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v3 04/28] target/arm: Move PC alignment check
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-5-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113140419.4013-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Q/nmfvo7tfXs

On 13/1/23 15:03, Fabiano Rosas wrote:
> Move this earlier to make the next patch diff cleaner. While here
> update the comment slightly to not give the impression that the
> misalignment affects only TCG.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/machine.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
