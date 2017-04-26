Received: by 10.25.0.144 with SMTP id 138csp169730lfa;
        Wed, 26 Apr 2017 01:25:26 -0700 (PDT)
X-Received: by 10.223.164.195 with SMTP id h3mr12402201wrb.135.1493195126698;
        Wed, 26 Apr 2017 01:25:26 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wr0-x242.google.com (mail-wr0-x242.google.com. [2a00:1450:400c:c0c::242])
        by mx.google.com with ESMTPS id z29si6236693wmh.51.2017.04.26.01.25.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:25:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::242 as permitted sender) client-ip=2a00:1450:400c:c0c::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c0c::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wr0-x242.google.com with SMTP id g12so10045922wrg.2;
        Wed, 26 Apr 2017 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2GTvTWFYapYNeoFgq5wIBRm+7Zh1NfJQiu5KW8BU/Bc=;
        b=q/bW4kjy8Eytk7CD9gXEJdpAo8PqH6ckXtcxjZpn9WiLtbBwZBmC13DAIszXBcE71G
         tJLIbXrBBuNC5IWcTjW7TbpXEF0wJ7XM795gu06exdQ7cOyxFDAAPoLOVTgTgIHl7EVL
         2SSvWSRk+21NDDrN9B1hVgIFMxf8fjmx6zUiTJSufXmSe+peB9urAQoI1o23e8XLX/Az
         5D5CA9SpCTvwL0D6Whzvij2Rg+rCQdJ57VGlCM736kx/ljL9aeCkOlSLvWg/lExT//11
         2JFp5/eW9an8qkV5QBrAKRaIaeUFi66enz2TBohjBzdmZo9ACNjBiZtp9RaCy8M023G+
         U8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2GTvTWFYapYNeoFgq5wIBRm+7Zh1NfJQiu5KW8BU/Bc=;
        b=GO6/8dAbL9jVHDG2zHqIK9xhrxJb94VDaDhQu/UOK0tgONrzn8kiC7+TMJaG9obRxw
         1EfMdRN0Sa95sJwq52rST2xwzm2VchGlVSFuPwbimYQPt0xsKeTvuqMvQOUQVblPVNpY
         OYmfS5Q2YEbRyokzGoRhjcIeqwuYnhcbPAHE//UcVQ7MZJqLT1kqtNpH6uK/ACfueViv
         e3vKb6Q09ld9bUDlXiepIy5ruBr3DTWMEtE7SbCNY9IkZZHs5vUnlBG8uPaVRxBuyP3P
         KAfed6SYMIPa6fYjM1zkCDSSpWzvcVzi0Eg9aCPJJlez5TXqRRKihJF20AKNt836HNyv
         isFg==
X-Gm-Message-State: AN3rC/4IPRIurzSDA5/QUPGWmXiSl58Uxjqijs38MH68DmD9danPyp5S
	jA09aMDVGLQBkg==
X-Received: by 10.223.141.244 with SMTP id o107mr13995458wrb.69.1493195126437;
        Wed, 26 Apr 2017 01:25:26 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id l133sm4301720wmf.17.2017.04.26.01.25.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:25:25 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 08/10] target/i386: optimize cross-page direct jumps in
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
 <1493187803-4510-9-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <344b0b7c-30e4-2986-ab87-4f1c3b3f80bc@twiddle.net>
Date: Wed, 26 Apr 2017 10:25:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493187803-4510-9-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: XbdQ5Bdc508G

On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> Instead of unconditionally exiting to the exec loop, use the
> gen_jr helper to jump to the target if it is valid.

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
