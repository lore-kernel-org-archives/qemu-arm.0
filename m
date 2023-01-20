Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp943494ejc;
        Fri, 20 Jan 2023 01:19:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu3ZM1OmTabP+y/nTf6heqY4gmYYNvwVD06eHdyyoTpaZwxsEgdSXS2hYtG+AukOo0VweIv
X-Received: by 2002:ac8:5a88:0:b0:3b1:4a8:4665 with SMTP id c8-20020ac85a88000000b003b104a84665mr27173477qtc.62.1674206351885;
        Fri, 20 Jan 2023 01:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674206351; cv=none;
        d=google.com; s=arc-20160816;
        b=kFHmD34Eg8U0y9smpWvJicuZRGZGnIlPifokfJPl66gG7xxtu0yLv/T8qlwwI6sYKH
         4kKji4ccn70CbxcajCw5agAzaGL8hv1aw/Lkn25vCkYjysSchNN2zOeL+uLR09xlBel4
         ir19isvzcjWefzdoB1yQDpqrIVJ49XP9jgT4HjIg0o+DSGSz0GjbyuKmx58haA/0NXKX
         YWlzQIlG91fHP7WydGxUdg0x06wbvwa523O79LNa4P80VLxaWZ7KQwaB3bQVyB1EonK3
         mekoDKjbVVxcHwIjGSjxihAPcDJeM5+/9j40Xv+Tf1fNWdLi7e2fjlCJI7n90YVkg0Uy
         SQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KtzrJ+l4B9zV3u2sa+uUnRCTxQyt9aXx6lcKmJ45EPs=;
        b=pOyLBSMZRnFlq3q+6iI8E0xrvo6FbpzouFakDBIPZjcMNqZeFkit4v8soB+gq7XyoU
         xOeWLxJC4RDgT8VxFfoNtY9qP+/eimYkIHmvM4pi+Cb1yYShUFdygqlMFhueuzWerlC6
         buyELxflB2feUEvQreVNR+7l9eoC7yhPH1/iCnzL4yg+1ETpFHJ/c0ntrLS66lfPqIgp
         /RpAla8J4wtULKfXEX7Ja5PSoUjNErN2d+LUzQqieVeXMBDgr1rGyodvyhVP+ikEBDb1
         dPNEsx/VMD0v8wN9aH0riSdaGjmr4lgQsczGcY4sUMOv0r0FVWQ0PjjdAC6HhfgUbdR4
         pbmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bIGiWNuD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4-20020a05620a102400b0070620b5d07bsi6575095qkk.127.2023.01.20.01.19.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 01:19:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bIGiWNuD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pInXf-00063k-6D; Fri, 20 Jan 2023 04:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInXd-00062v-Pt
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 04:18:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pInXb-0006lw-Q0
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 04:18:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674206308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KtzrJ+l4B9zV3u2sa+uUnRCTxQyt9aXx6lcKmJ45EPs=;
 b=bIGiWNuDLsQkWTRmPin+EhoHIAFfx2x+bb7GlWrjb613ZZvt6dQWExX0HUEYbaNLpqd26J
 Pb0PBpD2NciSV0hSVQv1Bc4Rls7b34XKv0JAO8yNSsXPkM0uzqQih/reTkaEIFMW5xfZQe
 jY7j1vd2P9YtKEREAWqweBcR/RlGP7c=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-401-4mqD11dDPG6pBS3tPlY5Xg-1; Fri, 20 Jan 2023 04:18:28 -0500
X-MC-Unique: 4mqD11dDPG6pBS3tPlY5Xg-1
Received: by mail-qv1-f70.google.com with SMTP id
 x6-20020a0cc506000000b005349c8b39d6so2235174qvi.2
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 01:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KtzrJ+l4B9zV3u2sa+uUnRCTxQyt9aXx6lcKmJ45EPs=;
 b=HlhoXHvK6pN1azdJ6SAnwrPWw6ki7Ii1/o8KVEkSJpvoW+sl5eYYhzO2awIqjciPrt
 IzR5iMIqD1nvlsEcuT5jsW0HPfQZVdWLUu4ad4q/ChUcJNt9I9o5Gx5U8Rj9SHxhm8WM
 H7b467Z+jb51r9OmxL2arWKgi0ih6cHTCV1Ohjm7WPBUEzeLtN901U9ggvD5DxYHO79U
 WCIKcEi0GMCqjK4Dox6SN23yf8Ss92cc3s50F2e7TTS65qXfGJXqJy5mQtTyXomECUWX
 6yiV6f3jdmhRKgWmtUpMkaZoHZ+LtTrrI5uSwMER+UHDulFCUj7XwKUirpMoEjQFiM7h
 CLJg==
X-Gm-Message-State: AFqh2kqmb8VXko//WiCAj+fhcouq2k3uvyhqmIYMqpBBvjLAkw9oOEvG
 pt8LeZzLCwJ/wT3deOks8+A2FSdMs3xzRl3h7NsLHvIKIifjzd9Y+9euoprNUqNN42Tn45okY3o
 WPw6wv04j5uxt
X-Received: by 2002:a05:622a:4208:b0:3b6:2cdb:e240 with SMTP id
 cp8-20020a05622a420800b003b62cdbe240mr20084643qtb.18.1674206307602; 
 Fri, 20 Jan 2023 01:18:27 -0800 (PST)
X-Received: by 2002:a05:622a:4208:b0:3b6:2cdb:e240 with SMTP id
 cp8-20020a05622a420800b003b62cdbe240mr20084633qtb.18.1674206307395; 
 Fri, 20 Jan 2023 01:18:27 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 u2-20020a05620a0c4200b006f9f3c0c63csm26108202qki.32.2023.01.20.01.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 01:18:26 -0800 (PST)
Message-ID: <718784c3-43c5-b621-d5a0-a8aafa492a6e@redhat.com>
Date: Fri, 20 Jan 2023 10:18:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org
References: <20230120082341.59913-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 00/11] tests/qtest: Allow running boot-serial /
 migration with TCG disabled
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
X-TUID: eCGpCbmBP4nr

On 20/01/2023 09.23, Philippe Mathieu-Daudé wrote:
> Missing review: #7
> 
> Two test were failing on Darwin when testing Fabiano's series
> which allows building ARM targets without TCG accelerator:
> https://lore.kernel.org/qemu-devel/20230118193518.26433-1-farosas@suse.de/
> 
> These patches allow boot-serial / migration tests to run without
> TCG / KVM.

I just started reviewing while you were sending v3 ... please see my mails 
in reply to v2 for some comments.

Also, I don't quite understand why this is necessary. If you specify both, 
"-accel kvm -accel tcg" on the command line, QEMU should simply fall back to 
the second accelerator if the first one is not available? What's exactly the 
problem you are trying to solve here?

  Thomas

