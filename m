Received: by 10.25.0.144 with SMTP id 138csp169591lfa;
        Wed, 26 Apr 2017 01:24:58 -0700 (PDT)
X-Received: by 10.223.146.193 with SMTP id 59mr7993269wrn.165.1493195097865;
        Wed, 26 Apr 2017 01:24:57 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com. [2a00:1450:400c:c0c::243])
        by mx.google.com with ESMTPS id u4si6013295wmg.153.2017.04.26.01.24.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:24:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) client-ip=2a00:1450:400c:c0c::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wr0-x243.google.com with SMTP id w50so23733865wrc.0;
        Wed, 26 Apr 2017 01:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5LsoQRxJqO3/ruae9W0Q6BYLzi2+1abc3UrgvWfFCfk=;
        b=rPaef2s4JXJxvOhIV3GgmAHeq3z62/k5at/59vdSMH/L3tt44AuN/uWMKfugXIpM75
         Up1ScatNcxhY90pOEsC66aS36rmg8tt0xSrQX4d6qeNlFqy0LRwuC/ZmIzSZ2lGdlaoe
         wLieCiPvCuYuznOUP8TbffJzwR6qFEFkq43yxCr0oD9nJ+QkD6NWQn9sfsAqnJFkf5IR
         JMXWWk0iS6a/AeDOjKKNrTWQlkkGycSlMzNlnL3h5JIP0OkCg0aEzylzpdTMK2gtY2BK
         I2C+t3JLP0V3MzyGuEW3la3wyG+pK8GGTQaIcYRALAV6yFEzC+0ogDXSn+zHwtwl5Kwo
         yqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5LsoQRxJqO3/ruae9W0Q6BYLzi2+1abc3UrgvWfFCfk=;
        b=BK6rcpLxQvp3BW/MrbDF7l8r07ijmIVSz1hPPC4isyyhXKqNuAJOfX1OG3I3cNB9/t
         BuVEsbwMzcrtX1MfEC6P368FakBDGi3bkkzA9Y9rq970RQ8zZO9+gWrZLiWESa//EULs
         Zk6IvpJchiapoNSC4LciKXES0IWny72XfhThnN4KGMOJW/cI3IoJ1ElyiiYZxHDnWAmp
         Xxfsfqlb2zd9Io0UtB4Kx393366OjMkajYJfMkIEdiOxqI8Lyd/4MgOq4Nas2pfj7Mz2
         Dr3ZSQmaNjEcijWXY3WcVdMlNdVkCZRi9kPerZwj2p/frQJ5wTGykbwDZEITSGZ9QWII
         1iyw==
X-Gm-Message-State: AN3rC/4HICDDvBBjEg/bA01lqIXaBS1Nd7RFxdCv5Kl/PYBWjqAvT4Gf
	DNBveHa052LhGg==
X-Received: by 10.223.142.135 with SMTP id q7mr12419532wrb.180.1493195097609;
        Wed, 26 Apr 2017 01:24:57 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id f64sm4388809wmg.2.2017.04.26.01.24.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:24:56 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 09/10] target/i386: optimize indirect branches
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-10-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <3814e69a-823a-0fb8-da7f-071b61856414@twiddle.net>
Date: Wed, 26 Apr 2017 10:24:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493187803-4510-10-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: IVdNpivkDgCO

On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> Speed up indirect branches by jumping to the target if it is valid.

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
