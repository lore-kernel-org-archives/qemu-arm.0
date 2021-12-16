Received: by 2002:a05:6214:3f4:0:0:0:0 with SMTP id cf20csp1448901qvb;
        Thu, 16 Dec 2021 05:28:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcy9wwtvQIIjQKZ3hTkj74kgyeaLPpnJImFUzjKsRoh/Two2S+9WNSUtWX4DkI6u/UTj4a
X-Received: by 2002:a05:6602:2acc:: with SMTP id m12mr9270826iov.107.1639661303535;
        Thu, 16 Dec 2021 05:28:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639661303; cv=none;
        d=google.com; s=arc-20160816;
        b=QvOLCILlyRdX9ODhoaTfDJrw46D7SbKDvAytdC8iw48bNnD7yjOTkzljV1kjI3kDQ8
         bl1Kewosvzr4S7jxKTvVa4r5O+A9k/+gxRGrq7UcxTfaV8c5H1meXY30kH0vNdB3lWdM
         8z0c/XTciZIll50SoCzM0ZsNNARQysR0RPIg0Yn4/3HY9zpmlmI7pHFnRsv38WpOIIEN
         9T/bXlA+kAKHR8QEdeXyOEEa2ChqrYs9H1RDBTXzajQu/GBUKEuu3Q/Rg/3QQW6AEjGd
         lHj3fzBpfeebSJuKWc2+eHu1qODMnF50xh+yyWvPOGr4WMMVddkIV7GYrOQJbX2Ep64t
         oH5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=CyqJvCZgSeYqSaSJX8CibDEHflrmsRZgXyVxRI4bC9w=;
        b=wtqvC5AqlC7lo5wgrxkH/5xsWh7XT5jkMFCvk95A1DkA1gwHhD24FuIUc7cwIEikTs
         a9qnSKWe3LCHnBXeIggLnGGezFFwA+iBJpuxp+R+d02umKCcPv/YYLHjJ89wMmaWqQk8
         uKTcDWbsX/20GI0B8g2Q8GF798AZISKvbGpG4xZ0PYudLlmfePv30L/p/3NONEAiBu70
         aKBRq675fx2PMMT9nMyW2IjQFD3GAlUTTQxdE1POSHHSUDJudSrVz81+DOd6mFquCbky
         ZcTa7yOVgS2H5wUfE5rJkyoC7nMi9kNBdiWdl6LwAfx2m4BP2LDXZ0ry0FdFAcZzr09a
         6NZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CwhDvcBA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si4085428ilb.162.2021.12.16.05.28.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Dec 2021 05:28:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CwhDvcBA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxqo0-0004es-AW
	for alex.bennee@linaro.org; Thu, 16 Dec 2021 08:28:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqjg-0001d8-Ml
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:23:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxqjf-0000V0-5t
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639661030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyqJvCZgSeYqSaSJX8CibDEHflrmsRZgXyVxRI4bC9w=;
 b=CwhDvcBAG++9iM8DNVdPuWaE1zDwRTihzWjWE9QCmi80RDvP2SF51L/yRlOW96YXMCRLyG
 UeY26YHuh0eWgEybdcs+NKL7SezQ5kiwxDtxNrl1T36N+LIJDUNfPVvD173acpPGpKRq74
 TiBeJjRQH1zC+Z2+Q2PYZUEMvF9T3X8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-GjD952uANcGlYQtUMIhR5g-1; Thu, 16 Dec 2021 08:23:49 -0500
X-MC-Unique: GjD952uANcGlYQtUMIhR5g-1
Received: by mail-wr1-f71.google.com with SMTP id
 n22-20020adf8b16000000b001a22f61b29cso1532014wra.23
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 05:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CyqJvCZgSeYqSaSJX8CibDEHflrmsRZgXyVxRI4bC9w=;
 b=FQK6PggtIzmGQXPT8IafXGzyXVZ62AZewnZiolrMpBD8uz73eaSXvZi8NpLRekc8OU
 WHX4ODuF3NRyXEyjC0EpyZH4HEfkzBtvfYCs/FZyYHT6JRXuGvRcqMNOuGYTF/bOaTQ6
 uGpG1kVAwPs+5C61fs28ImfHibDWHPe6RB+Qt1xPX5ebMGEZrzENEUhV4ltB3PK6SPTK
 JkXLG59ElxI7tALCQat0U0bvg56gcf/coEd3E5Uc4jVB/bQWQOY7H8gnq30z0EWe48Qq
 wiIji/3Qk0+zbR9wkpUS+GcAGDqFQE9RIpyR68D3yrH85F+iWCCrnAiHdEPycicOFyiZ
 Bbpw==
X-Gm-Message-State: AOAM532Z69DGEYpGCSHe33XGaJ1zAn9WYwI4q3zrZqYqEOjorCHLi/mV
 263FKTtSJUPwYP66kiwpsBMJXjklsgCrjLucPAO0nFqmjfVdsUtuvGitGPTWUujq7DVW8IQSoWo
 70JQyyHGB2c7NBSk=
X-Received: by 2002:adf:ee47:: with SMTP id w7mr8929484wro.368.1639661028480; 
 Thu, 16 Dec 2021 05:23:48 -0800 (PST)
X-Received: by 2002:adf:ee47:: with SMTP id w7mr8929467wro.368.1639661028343; 
 Thu, 16 Dec 2021 05:23:48 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id bg12sm5853557wmb.5.2021.12.16.05.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 05:23:47 -0800 (PST)
Message-ID: <7c4f8cdf-2a8c-35a6-a425-c549de34c9b6@redhat.com>
Date: Thu, 16 Dec 2021 14:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 03/10] hw/core/machine: Wrap target specific parameters
 together
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20211121122502.9844-1-wangyanan55@huawei.com>
 <20211121122502.9844-4-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211121122502.9844-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hMQbDnmZrxDE

On 11/21/21 13:24, Yanan Wang wrote:
> Wrap the CPU target specific parameters together into a single
> variable, so that we don't need to update the other lines but
> a single line when new topology parameters are introduced.

Where new params are introduced? Not in this series apparently.

> No functional change intended.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine-smp.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

