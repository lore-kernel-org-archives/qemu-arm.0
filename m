Received: by 10.25.0.144 with SMTP id 138csp170339lfa;
        Wed, 26 Apr 2017 01:27:26 -0700 (PDT)
X-Received: by 10.223.164.15 with SMTP id d15mr8731303wra.20.1493195246008;
        Wed, 26 Apr 2017 01:27:26 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x242.google.com (mail-wm0-x242.google.com. [2a00:1450:400c:c09::242])
        by mx.google.com with ESMTPS id r70si2820859wmg.47.2017.04.26.01.27.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:27:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) client-ip=2a00:1450:400c:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x242.google.com with SMTP id d79so31273010wmi.2;
        Wed, 26 Apr 2017 01:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ElcFTCcvwoyFF+QckiHGZCftrkSIiJV6eIFy+SAmoqc=;
        b=Wnz/phB92duv4BW7Uqp73sGaQPqsE2AL4ur6sFtILjxkvumG9xfddWoQ+gWQA9Ejcy
         5LsmAM3ZvZpyQUFysGKAo9+MYbADMKBUV8NQ5hRA3J/H0DOzvihWgRFD/oN1yoY1GmBa
         O3Cxcuw1G+XCYLVYi9Jxg65TjRM8452mq/ez93ujTfoCPlaK9wocFNA581maUmSBAGQI
         YDJc7Ro6LJ9iyRmht5TXb4K0sjRa9DeUCe4E+Hx1a/l4hI7WcBCd/ecWs59mSuSSe9aI
         i+O3S7+CdY8Kt1T4zWxrNaj3eor+5K9Lacy928Z3e0aDF+KQIWFA1p0jjm9YWLFw8qbk
         VYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ElcFTCcvwoyFF+QckiHGZCftrkSIiJV6eIFy+SAmoqc=;
        b=Y3+Qrwa3/pvhMtaUUcUGHjjVjcSQD9+zNY7xcbNNrdMmARKDyKAUCglobUXQ0WA+NG
         R38XOgjOv95HlM3Woe/SSvwqrWdBi4fFCK7w6ittftnT6HOyBrivhE9LU9FVN1ZAijmQ
         QLX9JEo9yMvNcDttcpN0A1gJ+4mnO07pMwAEGZnesV1WsRUqUAj0pMCV5r6JZAsR04m3
         7eBj2qJCAlOeigRjrXsSAVDQIml1JymjKDyrd1JUL6n2rX6e29demJE81jhc9XfPHUY2
         PXA1EfG3cI7oZKrnG296PAXkHguW07v0YZZH2FUpgj9NTShI7R920YxrpgqYRKMSMuqQ
         aZHg==
X-Gm-Message-State: AN3rC/5PW2bYi+vsp0hQ/tnk2t0nGvSjiQitCcS4r2U4AhTowU/+mwHT
	VA12A8L39VK81XMbix0=
X-Received: by 10.28.74.218 with SMTP id n87mr4795009wmi.71.1493195245722;
        Wed, 26 Apr 2017 01:27:25 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id n49sm3868301wrn.30.2017.04.26.01.27.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:27:25 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 05/10] target/arm: optimize cross-page direct jumps in
 softmmu
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
 <1493187803-4510-6-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <1569e3c7-0f05-7b77-4c97-2e29d2d5adc5@twiddle.net>
Date: Wed, 26 Apr 2017 10:27:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493187803-4510-6-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: NmjHtSLu8y2O

On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> Instead of unconditionally exiting to the exec loop, use the
> lookup_and_goto_ptr helper to jump to the target if it is valid.
> 
> Perf impact: see next commit's log.
> 
> Signed-off-by: Emilio G. Cota<cota@braap.org>
> ---
>   target/arm/translate.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
