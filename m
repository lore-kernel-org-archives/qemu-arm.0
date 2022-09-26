Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp2133339ocs;
        Mon, 26 Sep 2022 05:30:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM50vQfPfXDHO6r3Sh2fvQZautTLPbyorElKZM5zCMq7gJulsmgUROBtPji/PL6M3yQ4rPH9
X-Received: by 2002:a05:622a:1aa8:b0:35c:c831:d601 with SMTP id s40-20020a05622a1aa800b0035cc831d601mr17213744qtc.434.1664195440829;
        Mon, 26 Sep 2022 05:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664195440; cv=none;
        d=google.com; s=arc-20160816;
        b=zDQGo/L4XKDCqxcVt/CUWZAIKt53JRA+kwkWdb8kFYPNw9+HOO367OsXZWnqBQ1NY7
         T/D4V0lrTUVydyCfCVSGVMr93naZ1FAYdBLU2v9WV5SHzhlctFJ58+ni5PhGqtk8+ii9
         UPhphXlzmhMuF1IPl3Axsosud/TSX5/wFsXUp+0i9QImn7ky/ELm8sysSCySZmErITWd
         eGn2gmbIfCycR6CFm0x8Zg7ZpGaoyvO0mmMC5iR6cQic4HDtTg9NIVopetBTggSiJCv5
         EyngkuC/Ttntd4ucUTYgOeGSfhiGeJcCuYzQa3bqnOOdsx2lk2FEPFA0kPsvrRrgvJlX
         g10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fQZQF2cUnTpL95IIz9S+1DjRmuYh/9fJ3Sp4R7usKfo=;
        b=K1xA95k/VUw3L1MrTCHHjJmXYfZSrhrWwwCqUH2gzXiZKN6z9zrC4mQr8LMa1qOYTN
         oC1CVEyM3zdYecq8pnV8bKPwF6nSffwh7V08PituSlIQ4eCbvqXbyluzkRSbmyItLrgH
         KZPQ16BEoFIUB/zYS/cdj+heFtz76OoZt8VISOCNTvKDq79m5Mszcvm47Nx+Ue6LYTOE
         I5JwHDZdD+JjY6Gj3ENbJm5cB+w+XIwbg2Q6yqCOTbgZtPXwMMchkLus4+LWWPmzcxZG
         qRFinkvtiYAE9tNuEbFztdzc9H6/InM9I0utgC6VmePQabv683nPUHODbtVO4uSWeMtJ
         zlVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GD23SHzS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bw18-20020a05622a099200b0035d430c7e30si1002260qtb.412.2022.09.26.05.30.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Sep 2022 05:30:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GD23SHzS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ocnFw-0002vQ-2W
	for alex.bennee@linaro.org; Mon, 26 Sep 2022 08:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocn4d-0002CX-Hi
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:19:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocn4a-0001Ft-2o
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 08:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664194735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fQZQF2cUnTpL95IIz9S+1DjRmuYh/9fJ3Sp4R7usKfo=;
 b=GD23SHzSXEZCsf/5DGqTgOkWVxhoAO1qJDsRs8WPk+07GADzQKwNoiV5iX+fJ1nCNb+u6z
 GVUSxZL3ej/6zt/C8uJ6jsU00dr0I/RUZf8D7/QztmM3BXU9bcRdr9cWHUtx684gKpoPLz
 90kzOllkymaBuFE0OaEgO35DN9hx66Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-z4RtvxdGORO6nCZSeTXneQ-1; Mon, 26 Sep 2022 08:18:54 -0400
X-MC-Unique: z4RtvxdGORO6nCZSeTXneQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 14-20020a05600c228e00b003b4d065282dso1781792wmf.8
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 05:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=fQZQF2cUnTpL95IIz9S+1DjRmuYh/9fJ3Sp4R7usKfo=;
 b=rVXnwAQH513i5+W5Db+dQeXdiLvi7k54A84owxl+1SYotSrC9rQ/TArepovw9LIsk1
 PvCMSmIaszVownm7vKzxjCQpQ1auy3K9NBAriuv6nPeiqIaR+vxFU/vMBC0qTiqhnSrh
 ofiXOI8WR8RkwdkOSGPm+vU6XBuBbooFEee/wnnZf9Mz98/GebDz6VKCYbL6ErvoWPzk
 COX6xQxSJw5hf4UunMfWgwklKkYSQ4wtGWe9B+u7vtIm4sZpP+ilB5Z9hVbhuimXvhSO
 AvGE4ZOIl5BEMgFiyUmq5OYpWHXwJEa/ohjXbbuk9NVF7/hqXc50F7AdLsr8hKP7g7dP
 aUXQ==
X-Gm-Message-State: ACrzQf3EAy/ZyrYJ0GHtXWmEg9lQeqH/8smmNdexCFPc17ligwtLDNZW
 zoneShnY74oYoFSWb/UWk78GUAjXK1WiHFcYq/JXUJ7KlJscsYRivTlVlh+7e5cWAg6oWArK9Rk
 L6wCmKZo+QuFIfBg=
X-Received: by 2002:a5d:5850:0:b0:22b:1ada:a0d1 with SMTP id
 i16-20020a5d5850000000b0022b1adaa0d1mr13079125wrf.313.1664194732900; 
 Mon, 26 Sep 2022 05:18:52 -0700 (PDT)
X-Received: by 2002:a5d:5850:0:b0:22b:1ada:a0d1 with SMTP id
 i16-20020a5d5850000000b0022b1adaa0d1mr13079113wrf.313.1664194732724; 
 Mon, 26 Sep 2022 05:18:52 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-251.web.vodafone.de.
 [109.43.177.251]) by smtp.gmail.com with ESMTPSA id
 bg34-20020a05600c3ca200b003b4ff30e566sm23576827wmb.3.2022.09.26.05.18.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 05:18:52 -0700 (PDT)
Message-ID: <33f7bd80-2508-4983-4c19-727e02f0b94f@redhat.com>
Date: Mon, 26 Sep 2022 14:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 06/54] tests/qtest: aspeed_smc-test: Avoid using
 hardcoded /tmp
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-7-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220925113032.1949844-7-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6DV94qw1Bti8

On 25/09/2022 13.29, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_file_open_tmp() for a portable implementation.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v3:
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> 
>   tests/qtest/aspeed_smc-test.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

