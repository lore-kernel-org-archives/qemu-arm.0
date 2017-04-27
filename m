Received: by 10.25.0.144 with SMTP id 138csp648973lfa;
        Thu, 27 Apr 2017 01:12:53 -0700 (PDT)
X-Received: by 10.28.98.65 with SMTP id w62mr1301024wmb.85.1493280772980;
        Thu, 27 Apr 2017 01:12:52 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wr0-x244.google.com (mail-wr0-x244.google.com. [2a00:1450:400c:c0c::244])
        by mx.google.com with ESMTPS id 18si2232947wrw.52.2017.04.27.01.12.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Apr 2017 01:12:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::244 as permitted sender) client-ip=2a00:1450:400c:c0c::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wr0-x244.google.com with SMTP id w50so2869852wrc.0;
        Thu, 27 Apr 2017 01:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JYF4wPtMsL/swgYf/Gb2/CcFYAhRc6kxBZ7U9A+gKeA=;
        b=c7ROPh032pWJQyrQEjRlIDOzADAIoLOE0siAaGtgdNiUPp+P57G5dJQHGfIsPqwL5W
         ymh0c2sWMzNhxIjB8hG0xSjfezc1MlSRidYg7pl20N96llBheV4rS9EHhUhqOiPE8yRA
         GXK1urT1DOGwAY4/YN8SrgFgvCfSu4ttOLV3yEyGUh+OScA/wD9Uz4CC9IDhNN+GFaya
         LFrQP83oPTDbMLbZAEvIokSROs95i7PUxrj+dx500+WCOVfbBlpCxNfLc4tdFDliV954
         VmVxHGVWN7lcrWURV9iQc8HE0Ko+Tf/w63wfX3ZQmQwK8xbAATRlOTG4jvh9Sb9Mrt//
         iKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JYF4wPtMsL/swgYf/Gb2/CcFYAhRc6kxBZ7U9A+gKeA=;
        b=IRB/2DDXjeqySUng2mGOCeecVVps4hstHrNbQDPZ7HQk5QO845brcn08CBxp66O8Sx
         eos9WfTZUPEh5AuJz1iNCAnTujGH6gPdBtsXAN2e2eBDK8O6z+aewJ1/cUe0dcIoIRuW
         ytRxtJ6sR2vcPBSGcVegc17I0Sc1diG0rBtyzbdZEDM+sp9PrC4EHZbReZ6sv5xVqx+a
         mEC4FfOT8F7FqRLXtX5ib172bEf8qjZEggZmoEZobYju2JSC/pxCHtCFsird+XG5xTwH
         IOFXuMlCVrzylA40VShKQY4zp6ZWJTMCkRxJQLgNQuvGEfvnfmYXFq6Q4L78O+OkJkw9
         ijSA==
X-Gm-Message-State: AN3rC/77w6VAPf11aMsGgt/dESsFKJ2eWsD5QL0s2XAQ9ISukMEKfBNp
	5XrJnB6mo+Uu7g==
X-Received: by 10.223.175.218 with SMTP id y26mr2407012wrd.63.1493280772768;
        Thu, 27 Apr 2017 01:12:52 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id 188sm2574576wmf.29.2017.04.27.01.12.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Apr 2017 01:12:52 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v4 08/11] target/i386: introduce gen_jr helper to generate
 lookup_and_goto_ptr
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493263764-18657-1-git-send-email-cota@braap.org>
 <1493263764-18657-9-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <4415513e-db6d-ed35-295b-63a2ae7c8f90@twiddle.net>
Date: Thu, 27 Apr 2017 10:12:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493263764-18657-9-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 7qZUo/5/l7mt

On 04/27/2017 05:29 AM, Emilio G. Cota wrote:
> This helper will be used by subsequent changes.
> 
> Signed-off-by: Emilio G. Cota<cota@braap.org>
> ---
>   target/i386/translate.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
