Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp348328ejb;
        Wed, 1 Feb 2023 00:30:15 -0800 (PST)
X-Received: by 2002:adf:e506:0:b0:2bf:df72:fdfd with SMTP id j6-20020adfe506000000b002bfdf72fdfdmr1582757wrm.5.1675240215244;
        Wed, 01 Feb 2023 00:30:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675240215; cv=none;
        d=google.com; s=arc-20160816;
        b=ID6UktQAgS8vMv39hvg2B2w9BrSE+4kkqrc8ZMcxeRRape86fI8f23+gZmC3Xpyjux
         7F6uaFqDrspRnMnQyCGhacHQEwYNmmVeTxvKv6dKnoyao0OLb1ndogs4FyA41Ie6759u
         Wh1r9FZP94/SG28k8EdCqJxcPIVqSANvVgDeYUbhPuXqwCnWIhNQ2TNU+9dfM3cZWFzE
         KZU6sknznFj7En79AiV33FugtPSMYJrmJQAdyIrjIk5iGFCDF2VUlpjN5XtzjmR+dSob
         7tofUUDntGColqb2M8XlRB7ZKmHD1TYf4S2j84H7h6Y30RBWEMklL8nft6koOW4FjGdM
         D5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:dkim-signature;
        bh=I/e7owFfcePnLRzxpORdL+Ugp/T7FuArUHTWMklHSZE=;
        b=OrzfBD+Xr0zlNdVSbiKnnKoEj7HVrdG9sTDqE6Tp8HIOW8d7eo3/z39nzhLMcxESu/
         rmGWjLeLQ8m4tWDlyTE8Abl5cKW7AJ974U0B0W3X+1kqoEW0RdGlmjOykvOVuTWP1CX4
         2+zX3eNukyC3JUE6TPCk8NxPCXxuwHHCjMZ0ZkHrYPUdQiPf1X/eN0GThTvAF8UkrjkV
         4ejGN+XTf8zlG1UHXzh9X8vVqzHKgYkV3dTC//j9Kge8LKM5lUecxqivNEccQV1CP1rz
         vEzRahibqJxmDpxvRjwDoUULy872P5j/4m4edTtCHEb8wAKEzI+3Q7xHlFNGFxHhw/1i
         bh/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=EHcHSKQD;
       spf=pass (google.com: domain of xadimgnik@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=xadimgnik@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <xadimgnik@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hg27-20020a05600c539b00b003db01df2facsor313487wmb.38.2023.02.01.00.30.15
        (Google Transport Security);
        Wed, 01 Feb 2023 00:30:15 -0800 (PST)
Received-SPF: pass (google.com: domain of xadimgnik@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=EHcHSKQD;
       spf=pass (google.com: domain of xadimgnik@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=xadimgnik@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/e7owFfcePnLRzxpORdL+Ugp/T7FuArUHTWMklHSZE=;
        b=EHcHSKQDWrNLfrV+Zaa/V6XU/gSZoD0Nre3JE13SUBQh3px4OSMGL+aMGglogy5m4G
         T5/0+KUbLG5vUwYM0WZEJrMxk029b7oaDq96zZ9p+akCHZBRfL79n3bYkbwR1sDSzXsz
         daQko7c6Q07LbIjQADi4sTGv44JTGn9W8gRgt1tApbYSYuu2ddh3IGDOv4nvaPtV5vuD
         iF7KUbJIxQoU8Voq/qIFP7yvkLopvYsGlltoguRNw8y0RRWzW5jECBSxRd+y+1ehGaC/
         GnGELYZ/vMMGOaJPdbRakzxkSc8RfBdP570p5tYDV6PWqGr9cBuUNKlZrS8g6P7MbXYo
         EiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/e7owFfcePnLRzxpORdL+Ugp/T7FuArUHTWMklHSZE=;
        b=djWz7wmVDOIjyud0VOOlg587kb8kucGfSLCq7QdmJLhoeQK4ZqIpanKmho+WZRA/hl
         DEg7AE4cS6UBA6HP1r0oSAxnzZxEKsyQ4J/+mlkZPZrm+4hMz4qGPOeVAKWt4CMptN+d
         f0AecgiE/VvE5KS73jJwt48ItMTZjCBq/1RkBYuy8aB28sIisAItF7LDXWgSYXb3HxK5
         tAPQ/pcK7JekkS1W9eBANi1AKTRO9DSQNS+ZSTh1uht3MgfvIhCB1CDpz6narFWA2/6c
         CCACmSuSLds866R3X6xWPrON53xm282Ch9zLxXIP9dMBRPMLYtJ/ScyU9Gu5KmlZiC8L
         i3/g==
X-Gm-Message-State: AO0yUKXIOt/I9Npf3io0wIZf4ILPGQMnsb3v0NZYrC8pzvGp2cKsEI4K
	wdUF8RlQBvpLDW8EM2U69F8=
X-Google-Smtp-Source: AK7set8U7h6JgTIUz/GSAXKxVEMdwMw6uPhYD8pbylUmygyycWG1uyrxwtyWU9ELgp5Jz13+EJJG8w==
X-Received: by 2002:a1c:7c0e:0:b0:3dc:561a:79d8 with SMTP id x14-20020a1c7c0e000000b003dc561a79d8mr1285631wmc.35.1675240214862;
        Wed, 01 Feb 2023 00:30:14 -0800 (PST)
Return-Path: <xadimgnik@gmail.com>
Received: from [192.168.9.204] (54-240-197-238.amazon.com. [54.240.197.238])
        by smtp.gmail.com with ESMTPSA id f31-20020a05600c491f00b003dc3d9fb09asm922456wmp.47.2023.02.01.00.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 00:30:14 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <179d773b-2634-b52b-8836-8d8f882e1495@xen.org>
Date: Wed, 1 Feb 2023 08:30:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Reply-To: paul@xen.org
Subject: Re: [QEMU][PATCH v5 09/10] hw/arm: introduce xenpvh machine
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-10-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20230131225149.14764-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: OZs4EdUR/SBX

On 31/01/2023 22:51, Vikram Garhwal wrote:
> Add a new machine xenpvh which creates a IOREQ server to register/connect with
> Xen Hypervisor.
> 

Is this really the right way? Is it not possible to do the Xen 
initialization (including ioreq server registration) off the back of the 
accelerator init (i.e. AccelOpsClass ops_init function), which seems 
like the right place to do it now that it's no longer architecture specific.

   Paul
