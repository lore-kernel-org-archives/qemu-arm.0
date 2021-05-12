Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4647397lfg;
        Tue, 11 May 2021 22:09:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZGISPnrr8qs/QVlDjxkCLxZnkkD4YZWykI1sVEY+c/8MgrPlDiesr0SeAp/Ymjzdjn3fL
X-Received: by 2002:a1f:dbc7:: with SMTP id s190mr26578314vkg.12.1620796151071;
        Tue, 11 May 2021 22:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620796151; cv=none;
        d=google.com; s=arc-20160816;
        b=KjLJ/UkbohfBm4AHx5/6UrKR07zaZR7fVhxrshEDEY2gqomJpoziLRDTZi056TYWT9
         wUt1WYoBOfhR1Ezg4ZVS67fH7+JCmvKNsFlJ1wN3SiHFbnZMB7kL4fClEpGLqZuV4FZZ
         KGTO/r6nhEUWgqXjym+LJxM9+2g4xBTNdrc2l4Js6l305VlluPNojt3IeOXaGX0DVMvu
         W824V+CDgeXoOK2WIVwnXQiXJOuC+5itVbWymqc8ldJZtM8ajIwD7dUKM+4+pq1iVsAg
         rBLNyS/J6Z7zN01z38jcpR8croMzZWVMpnTjvUj9aDHSXTf/O6zD88gKAb6k0TL2F0e2
         0GLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qOMZjGtqxOQlsN+U1IEb0tEKh8Ml+YaaJkvn+j4SU1I=;
        b=GT/oUBPLReKyZK4TADJkZE9Fa4F96NSTEL5hDI7kJM8hpm23OnIKrJoFDXJq+J3m4O
         mQ44damPwQHExE+dj//oGdlBT5jafAnxpStS4KEXVE9b+LjtIq3y8kqNSdWhaCHIghTV
         vLLvWFIp6EcidtLANYTpfqwEjEVrDjfrilbxPcLo8ATD78Rg7MFnjKKnNI3ajDV2wPgy
         xtQ0Z8Ph1wD2w+dx960c14d4PBsk0b0pU+NxPOSFWi3yVLfkfVBo0XulVqfjNod4zkB7
         ims5y0ZrtrUEeK/Y2GWJxdA6ooZNJCq0Wq6Peu3/ORXxEKlmGY/ODw7HyWaz9uvvv15c
         rbzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QE2zhUek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si6165881vse.398.2021.05.11.22.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 22:09:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QE2zhUek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgh7O-0001tH-Dq
	for alex.bennee@linaro.org; Wed, 12 May 2021 01:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgh73-0001se-10
 for qemu-arm@nongnu.org; Wed, 12 May 2021 01:08:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgh70-0005W6-IL
 for qemu-arm@nongnu.org; Wed, 12 May 2021 01:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620796124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOMZjGtqxOQlsN+U1IEb0tEKh8Ml+YaaJkvn+j4SU1I=;
 b=QE2zhUek9+lJaBkLqHgsjDXSM7fhr2EZ0GypCXPV9Kr2Ts7fvOEyN1I0fkbUEX2I3xxeBf
 tGqhlBIPkPoaKE/hqJpiFNXMudd1/3HMSZQYlq+HI5/mon0FOnlYXUHc3bkUzjjfFS57TI
 N/XuXkPfEqlQQAWeX5CrrPq9qGXTAxw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-1XcHsM2pPI-aMCa60N5DsQ-1; Wed, 12 May 2021 01:08:40 -0400
X-MC-Unique: 1XcHsM2pPI-aMCa60N5DsQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 g199-20020a1c9dd00000b02901355dd71edaso198150wme.7
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 22:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qOMZjGtqxOQlsN+U1IEb0tEKh8Ml+YaaJkvn+j4SU1I=;
 b=KPmv6Ufisgzx1cw10FjBCYNzoTqRV0NlSAAJXSkmZEkvyaqiqg7CLQGfdn7CjP7vbe
 stOBjmh9vl8jJQoYAU31fgsTct4v24KOk1fuXgoIK/+YR1O5VnUOg/1zz1LV/rRbsfpP
 CAFLvAONp8RseAYqVRb6mKYOoKQxzxX4zrk6FRuXBLI4uvr6QoVLrNV8r2GCncnaE28o
 8gfeYgy3kAd46ba9kMEsVDcSb+zbRx21NhjvkH1RcWJNHcVLgsOhDtFuXUQiyDJdsjzK
 WNMEYA0/ra57omgHPxtNypK7isjd5bozEDASteAidajaPZN6zcaZoXKPXNQyJJ3erPAG
 wyLA==
X-Gm-Message-State: AOAM530fFnxfrP9HtIEuPAoTvbh/EvUpjZcVJ4UME3PSFwxHJ/vltpdn
 Qf0VRuKoqqWY+5OKzRBHDxnEmgfDF1OyJsXu8pBnGmGjAqYaG5Kec3U4WMSjxjgDxY6H/ebKg48
 /VL4XDProFfmaP++xe4M150xXbh+pm6Gb6o7HLaZy48CyyLd21td0+IXBaWa0cA==
X-Received: by 2002:a1c:540b:: with SMTP id i11mr9602608wmb.40.1620796119103; 
 Tue, 11 May 2021 22:08:39 -0700 (PDT)
X-Received: by 2002:a1c:540b:: with SMTP id i11mr9602572wmb.40.1620796118789; 
 Tue, 11 May 2021 22:08:38 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a15sm32588297wrx.9.2021.05.11.22.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 22:08:38 -0700 (PDT)
Subject: Re: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-2-philmd@redhat.com> <YJs8anLs1zL3nPdS@yekko>
 <21e0a306-ccfb-a627-1496-14f831fe80a7@redhat.com>
 <dba0c284-b279-5e5b-74c9-2da719a8ce2e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <87594332-49d3-2859-c893-9071200e8713@redhat.com>
Date: Wed, 12 May 2021 07:08:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dba0c284-b279-5e5b-74c9-2da719a8ce2e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: R/8VcB47epci

On 5/12/21 6:53 AM, Thomas Huth wrote:
> On 12/05/2021 05.57, Philippe Mathieu-Daudé wrote:
>> On 5/12/21 4:24 AM, David Gibson wrote:
>>> On Tue, May 11, 2021 at 05:53:50PM +0200, Philippe Mathieu-Daudé wrote:
>>>> Per the kconfig.rst:
>>>>
>>>>    A device should be listed [...] ``imply`` if (depending on
>>>>    the QEMU command line) the board may or  may not be started
>>>>    without it.
>>>>
>>>> This is the case with the NVDIMM device, so use the 'imply'
>>>> weak reverse dependency to select the symbol.
>>>
>>> Uh.. It should definitely be possible to start a pseries machine
>>> without NVDIMM.  I would have guessed the same for PC.
>>
>> Yes, this is what this patch does. With it we can build with:
>> CONFIG_NVDIMM=n
> 
> But with "imply" you could end up with a PSERIES that does not have
> NVDIMM when also using --without-default-devices, couldn't you?

Not currently, because of the CONFIG_NVDIMM=y.

> Why don't you use "select" instead of "imply" ?

Because as David said earlier:

"It should definitely be possible to start a pseries machine
without NVDIMM."

