Received: by 10.25.0.144 with SMTP id 138csp250442lfa;
        Wed, 26 Apr 2017 05:12:31 -0700 (PDT)
X-Received: by 10.223.165.14 with SMTP id i14mr13141571wrb.7.1493208751605;
        Wed, 26 Apr 2017 05:12:31 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com. [2a00:1450:400c:c09::241])
        by mx.google.com with ESMTPS id q126si6172881wme.149.2017.04.26.05.12.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 05:12:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) client-ip=2a00:1450:400c:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x241.google.com with SMTP id y10so564524wmh.0;
        Wed, 26 Apr 2017 05:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wiRaRtrQQDLdunUj9NfW8MOwjjEnG9c9SVdjJa66OhM=;
        b=JUe4yJcbaZVVsLT//Wj+sjNHrJj2UyoDyJCRRN0ULadlQAIMz4PkkWqHJI+HgcM8CF
         W9cqb72UHz5MG7emEyPR7usTjhnkVOpyDSKh60/+iCeOBKDrxg97obljJ60eGflWz01Y
         os8vEldPb0Pvfb3g/v6jKDlwIh04TptuC3XSgcIi8LhGSzn2a3f1EhX/ghOBdkhDyO+0
         X6OYS9h5XZm9PEt7dacXsNRJ3vJvvZHitlewHp1l54ijZMiWAv528qm4B52WqMTTX/7o
         8iD8TPbXWLSz/t2GKY3PHH7TXZFSH7H/oZlODinO2OtxOfrJP0yt9XUhq9M/FYR/7j/t
         QrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wiRaRtrQQDLdunUj9NfW8MOwjjEnG9c9SVdjJa66OhM=;
        b=Ts7QjDv0Ic7e7IYIJWb1UWSTsyJ6jQyGVqLx6B/k5ULQ9V+odTtCADRj+5kfNwVGDE
         N1vfgfbgPR1gHsHo3X08kZ3w3NaxFKfIj81n+hXgtycgHJwToPV6Fo2gZ7+lFBbHUCjm
         Ti4rYXG5S38fZ+Q7I5jnT5WgrO1kpI0hFOewBSdwUCCPP/J0VxypSeWOWxim3OwdAD2m
         ZnO1aR0jCRdpPjD6P2O+Q543KEF0bu0pxIC0HRnJj1lexT3OE8PAcEagOfhklAl4lqpY
         Jz1xAFuIL8ITCtObzkCw+Lj1378JX/LYoflwMg6oLy2JzHlYGGWPxi65/ubaRSJo6oYz
         bROg==
X-Gm-Message-State: AN3rC/6zQ305OfqxedfLZ/5jZgbcrByfVOFCAVyYtn7705fNZ7Y/qCGp
	Na8MGgLYSotUlldW/jU=
X-Received: by 10.28.93.65 with SMTP id r62mr595967wmb.70.1493208751354;
        Wed, 26 Apr 2017 05:12:31 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id 32sm47848wrq.34.2017.04.26.05.12.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 05:12:30 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 02/10] tcg: introduce goto_ptr opcode
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
 <1493187803-4510-3-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <472dde45-4b3e-bad7-ef64-718e089d7a68@twiddle.net>
Date: Wed, 26 Apr 2017 14:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493187803-4510-3-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 6nV6OM8VBAEO

On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> +DEF(goto_ptr, 0, 1, 0, TCG_OPF_BB_END)

One more thing:

DEF(goto_ptr, 0, 1, 0, TCG_OPF_BB_END | IMPL(TCG_TARGET_HAS_goto_ptr))

You'd have noticed this if you'd have tested this particular patch, with 
--enable-debug-tcg, before applying patch 4.


r~
