Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4213918ejb;
        Wed, 22 Feb 2023 03:57:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9SlXNU297LFHRL10IXd2g7Mv3KfBsNGt8JVvzwg0khG9JrFl4LWCaJ4xFQmk8QSfqVVAsR
X-Received: by 2002:ad4:5765:0:b0:56c:61:7499 with SMTP id r5-20020ad45765000000b0056c00617499mr13902450qvx.23.1677067029397;
        Wed, 22 Feb 2023 03:57:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677067029; cv=none;
        d=google.com; s=arc-20160816;
        b=jZvu5WFI2/+Z3kkSs7AGvV/+fgMlAh5opzZ97ObYYO9Jklnl61lwmZDHCSCsm9ZV5q
         MN4cSjEROEHUvtgXlipjCf7qE/ID9r6QTo//Ctnshaz1P5lEX1vEKG8YeR/sEpnLCV54
         osd5BaaYb5huZnuJN4w/z5vOZjmWedjHoN9uHRpPg+AaCfXsASkozejPFlldRNoFgnmV
         pVi+nTIsmhGNUPII/p69U0fWqJDd/Rknm+8neeN2S1Jgze5TbMLWmAZH3cDoH/I/xj2S
         JuUmu7qI9oKuRv7RDOmByoMLaWAYTIvUxqRxlDURUGgT9H4bdYqrvk6IySmdWbkoqsly
         X8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=J4v7ETda/es6bNaGBKzFS9yzlIqTW7v28+rnvx164ac=;
        b=gHDfDuTtSvIdDrFCL25Twl70+VqPbiX2djCXe9ZQk3hrTFQbcX93xQM/9AkreXyyZK
         TTOxr6WvvodEeH5/oNKDvRwUD+Z85wJCUiD5JjsowL5L8/e6Ql1+Eh13qB+wrVc3+ulc
         ZuwVLJNx69jdMlfOG2jnaP+8ZpJ8sRtrx316sSlN48Q3nNzPONjrH2dMTEcxXwVYSQjH
         OEkeaPQ1x0moZIXDPc9rDbXJGAHQRLVzFiNk7HJ4ALh8PA31AwriPRBMcGCcbgkfATS5
         72FqPx9FE3yZD8Roy4hjEoLnM1FK/aaIUm+vgIxNNSFadnUFp/e+bbY3RovXucvWjLtT
         JL+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ci19jZHf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13-20020a05620a410d00b0073baf97bb4bsi788266qko.190.2023.02.22.03.57.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Feb 2023 03:57:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ci19jZHf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUnjt-000560-1r; Wed, 22 Feb 2023 06:56:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUnjl-00054d-5n
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 06:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUnjj-0002gu-05
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 06:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677066998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J4v7ETda/es6bNaGBKzFS9yzlIqTW7v28+rnvx164ac=;
 b=ci19jZHfKEdUJh2zsn/lZ488YwgST+1l4g1Zz8hnxOfsdK90gZBBLlkKEB/kkXba5382sG
 KwW8XalZjY/+c4HE2Vz4KttFlkT0CsQIQICSPbKsaph5gEPe/z4A8c+F91IagoKGMtFnnb
 7VFqnfUXebIA81xNwHUsv9+PLNnKac4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-38-WJJkhHOENi-wW-ZSNOEZ7A-1; Wed, 22 Feb 2023 06:56:35 -0500
X-MC-Unique: WJJkhHOENi-wW-ZSNOEZ7A-1
Received: by mail-wm1-f70.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so1478432wms.3
 for <qemu-arm@nongnu.org>; Wed, 22 Feb 2023 03:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J4v7ETda/es6bNaGBKzFS9yzlIqTW7v28+rnvx164ac=;
 b=JzEoL3XgFBlkoIVQ8aEA+l68ILz2bmr9N4V7C1Bux2ysWjPBi14zctDVTPCdhmdYvm
 XTEPMSk+eE48WSx7PG5uck6jCcLuXGhs0Aex/6+y3HsiloXdfveo27G8ZFhytIH2M5+n
 IeE2FFS5Lq/5qIlUevrelOrKOdjRjdNi3eBBRcW6fxvjZLRoEZFedkMlfF9Ya6W9LVzf
 V7WmCiO+A8MWV+EB/TEgQq8x39flnIqceOCmKp037guxreJPu53vV8f85DeJlS2hOx0X
 sqjS4JFURTLbhxhdjUIYb7iVQMCtFQs5oponcTtsWBV3tp5+dGFp+yuUXCzV2a5k9WMf
 s5pQ==
X-Gm-Message-State: AO0yUKX0ZO8/tfrIhihfOYda2sYDYNIogSXAV3pAnpB0HZ1L0eMvkEs+
 8kLyKTcNjmbMNW88UZz3e2Cl/j/E91WTc84TZdn5tBrV6cFCFdxCLThfnuN6uobVZTxZgd1dgPy
 Q/6Ra1oHmOCIX
X-Received: by 2002:a5d:45c6:0:b0:2c7:aed:b981 with SMTP id
 b6-20020a5d45c6000000b002c70aedb981mr1763725wrs.30.1677066994198; 
 Wed, 22 Feb 2023 03:56:34 -0800 (PST)
X-Received: by 2002:a5d:45c6:0:b0:2c7:aed:b981 with SMTP id
 b6-20020a5d45c6000000b002c70aedb981mr1763691wrs.30.1677066993890; 
 Wed, 22 Feb 2023 03:56:33 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-156.web.vodafone.de.
 [109.43.177.156]) by smtp.gmail.com with ESMTPSA id
 bl1-20020adfe241000000b002c54d8b89efsm7992286wrb.26.2023.02.22.03.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 03:56:33 -0800 (PST)
Message-ID: <484c6eed-cf57-14b3-ba38-3ed4cbad2df6@redhat.com>
Date: Wed, 22 Feb 2023 12:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/5] bulk: Replace [g_]assert(0) -> g_assert_not_reached()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Corey Minyard <minyard@acm.org>, Laurent Vivier <lvivier@redhat.com>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221232520.14480-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +t+UVCBCG5Jx

On 22/02/2023 00.25, Philippe Mathieu-Daudé wrote:
> In order to avoid warnings such commit c0a6665c3c ("target/i386:
> Remove compilation errors when -Werror=maybe-uninitialized"),
> replace all assert(0) and g_assert(0) by g_assert_not_reached().
> 
> Remove any code following g_assert_not_reached().
> 
> See previous commit for rationale.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
...
> diff --git a/hw/net/i82596.c b/hw/net/i82596.c
> index ec21e2699a..eda0f586fb 100644
> --- a/hw/net/i82596.c
> +++ b/hw/net/i82596.c
> @@ -285,7 +285,7 @@ static void command_loop(I82596State *s)
>           case CmdDump:
>           case CmdDiagnose:
>               printf("FIXME Command %d !!\n", cmd & 7);
> -            assert(0);
> +            g_assert_not_reached();
>           }

While looking at this patch a second time, this hunk caught my eye. It looks 
like the guest could use these commands to crash QEMU? Should this be a 
qemu_log_mask(LOG_UNIMP,...) + graceful return instead?

  Thomas

