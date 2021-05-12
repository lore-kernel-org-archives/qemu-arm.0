Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4660508lfg;
        Tue, 11 May 2021 22:30:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu3Bmo9sx5T22YRofeA5YFUUbT6iyWyVPBMPb1e0Ee8PoI4wfS8k7dhAnna2phIPWKo2SZ
X-Received: by 2002:ab0:60c5:: with SMTP id g5mr29461441uam.5.1620797459832;
        Tue, 11 May 2021 22:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620797459; cv=none;
        d=google.com; s=arc-20160816;
        b=zwX3R/iNdgcgtAwr0QD7OXzyFjkIxnXVSCC3ai9jGcHar/FF+oKg0ZmEwXwf4KIgJL
         j2RjSQ0UeNayQHI0u1bjDxaPJWBnwOtx0LrXeM+GljlYzOQ5/4EfY2hOHu6jvqTmGGNh
         PgJUFmA1IXaYe4o06xRQfDx4RBGFpzmQhGOy4sgL3ovUTKdm2CwYjGtzmpdNCl1oqnEv
         NrORu5F02pvFyrGCrK1e4uC1lQIHwe+LoxX1SruEml0YqEuOn+2hSfXf27W+7ZThC7x/
         FkeF+aD13/VTAR2+G/wLTRn4lvN48FZUnzegb6DW1MJ/kGl2zp6mahCwAuqS+NywHF8o
         A0vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EQDcYaoo7UtIJkYj5FKIdeNZ+9RoFiL4ckcKofajUFE=;
        b=bC83LmWMTBpf3O7djLW4gESlfcr30LPYtoC1JxGziHjIeuWMTDR8hfTz7F16ogTb6R
         hLcBbkRAB96uOLjNPx9T66pCmt0l9FwZJWa8NqFYN4y8g1RCkR3MZe+4qQSKR+5occ1x
         4Fd168pb0HfegIDNP+40SiyODjuCK9zZLgJ1nI7i9alRtpxkgT4cTtLa58htHQT1fT4g
         XIbS5n0MullyRZywsY2LDlg91lDl5JRmqrhZHWi0cia2OXhwyRWn5y3/Z0YDLj5i6Tlm
         19ha92/VQzzA/jHxYfHJHwoYjzrAMuZTzLdIrScCPKWv2aujVPXM4VrFhdl8pwzo+T8h
         vHiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aDZ5FDY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3si1212866uao.114.2021.05.11.22.30.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 22:30:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aDZ5FDY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lghSV-0006li-3B
	for alex.bennee@linaro.org; Wed, 12 May 2021 01:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lghSF-0006kB-De
 for qemu-arm@nongnu.org; Wed, 12 May 2021 01:30:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lghSC-0001fc-L7
 for qemu-arm@nongnu.org; Wed, 12 May 2021 01:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620797438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQDcYaoo7UtIJkYj5FKIdeNZ+9RoFiL4ckcKofajUFE=;
 b=aDZ5FDY6LttTfPC/ShMibAawZgzP0XrKCSryJ8etqZaaw7gzRlOGWldCcl/ozbU3YqAeUW
 wn5PAEAVUFWJ3DNhyVgSSOkekxk+/ZunXpS+ccUr/plJhVA5ejI/9qQ7waDM+46IwWvilo
 luajzpeBLVWbChn7sBkw6BLImWmLA6E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-7hzcZTuYP3qpHz_DSM7Jqg-1; Wed, 12 May 2021 01:30:37 -0400
X-MC-Unique: 7hzcZTuYP3qpHz_DSM7Jqg-1
Received: by mail-wm1-f70.google.com with SMTP id
 o126-20020a1c28840000b0290149b8f27c99so2665286wmo.2
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 22:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EQDcYaoo7UtIJkYj5FKIdeNZ+9RoFiL4ckcKofajUFE=;
 b=pE1mV3L/nAqStt/poteUeu9V5tBNTxu56TGdouqVSYftkrqu5/a1CODFA/DVBPPgXw
 LjpNs7xvmuK4Mb5CSk0E4YxrooFFnj3w6fAwineBSgPKYIAJaLXDemaV0fVGQ5TyTwHn
 khFmcOzSQ/XzNEydCC67rGobCkkKw7JBNrkFQtMYmEuKA5mQdsZochj2pORdyDz5THLY
 h4WdF5r/z7mTYscu6V0FxBjUxCLGzPFxisPAoGPRz2Mvbgbg9FUabZ3IAkDTuZsiHV62
 Mk4BJuL+rxj1qx0K8LtYJ60b5TvwS9cx2gCD/rPk83Gbc5N/L2tHJWT02l+A02AvqBD1
 469Q==
X-Gm-Message-State: AOAM533yP4dtcQQ1HhnfnGEyEwHTCWl+T1Z35O6Dq65rKmBE/sR6M8sD
 n1YLKi1oCkoYlzm3KHx5v91uajZIeQs233sMM0X0Be2CYdHhD1g2IwGKcNQoibxnnTIkmMkQdS8
 GLglR1wF5pTZn10Pc1KY397appbsV8rhY0AFr0pOs8cNabiuGmVYasvDbYcSL
X-Received: by 2002:adf:f891:: with SMTP id u17mr43363052wrp.352.1620797435844; 
 Tue, 11 May 2021 22:30:35 -0700 (PDT)
X-Received: by 2002:adf:f891:: with SMTP id u17mr43363013wrp.352.1620797435583; 
 Tue, 11 May 2021 22:30:35 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id a76sm3494473wmd.16.2021.05.11.22.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 22:30:35 -0700 (PDT)
Subject: Re: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-2-philmd@redhat.com> <YJs8anLs1zL3nPdS@yekko>
 <21e0a306-ccfb-a627-1496-14f831fe80a7@redhat.com>
 <dba0c284-b279-5e5b-74c9-2da719a8ce2e@redhat.com>
 <87594332-49d3-2859-c893-9071200e8713@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <79d124be-c881-3007-13ff-4422d2da0b1c@redhat.com>
Date: Wed, 12 May 2021 07:30:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87594332-49d3-2859-c893-9071200e8713@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0UOdSAcgFvhn

On 12/05/2021 07.08, Philippe Mathieu-Daudé wrote:
> On 5/12/21 6:53 AM, Thomas Huth wrote:
>> On 12/05/2021 05.57, Philippe Mathieu-Daudé wrote:
>>> On 5/12/21 4:24 AM, David Gibson wrote:
>>>> On Tue, May 11, 2021 at 05:53:50PM +0200, Philippe Mathieu-Daudé wrote:
>>>>> Per the kconfig.rst:
>>>>>
>>>>>     A device should be listed [...] ``imply`` if (depending on
>>>>>     the QEMU command line) the board may or  may not be started
>>>>>     without it.
>>>>>
>>>>> This is the case with the NVDIMM device, so use the 'imply'
>>>>> weak reverse dependency to select the symbol.
>>>>
>>>> Uh.. It should definitely be possible to start a pseries machine
>>>> without NVDIMM.  I would have guessed the same for PC.
>>>
>>> Yes, this is what this patch does. With it we can build with:
>>> CONFIG_NVDIMM=n
>>
>> But with "imply" you could end up with a PSERIES that does not have
>> NVDIMM when also using --without-default-devices, couldn't you?
> 
> Not currently, because of the CONFIG_NVDIMM=y.
> 
>> Why don't you use "select" instead of "imply" ?
> 
> Because as David said earlier:
> 
> "It should definitely be possible to start a pseries machine
> without NVDIMM."

Oops, sorry, looks like I did not have enough coffee yet and misread David's 
comment ... patch looks fine, indeed.

Reviewed-by: Thomas Huth <thuth@redhat.com>


