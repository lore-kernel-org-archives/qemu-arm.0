Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6342156lfg;
        Thu, 4 Mar 2021 07:41:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyk/EHtuiBkWDHI1LXkhBvYz0kbMMPSeOPneCKtUdDKnYs3RqZKzvbLjMC5hA1nq+P/uP/V
X-Received: by 2002:a92:bd06:: with SMTP id c6mr4699099ile.158.1614872463897;
        Thu, 04 Mar 2021 07:41:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614872463; cv=none;
        d=google.com; s=arc-20160816;
        b=V6LZBDAUmLfrPjq3pqEBiVxAn5nKnGWFHK9NtMsW7ku6ACMTZBzYhHTor4cuXaNEnZ
         Y14ETpmZI9fiPAPEXVfbxZ2MXu2t0kXRAXJgwJKQp373boG9VSUvCZKZ5R9hk6DtBGVh
         P0oStYhNXR+M8eqTRF6KKsgO8LbKh+lHhIhW15TbVoGvqqUA+kk/CpoxUWIeTbJt6zdr
         VlLoSBGkdnPxKd2/oloTG4JeWCSEmGv03kWrGednF3edy0ZuRSGG3HHeR7v+jLE/6N2O
         bvUBgbAyo614nC8AFhLgKnM8VCJZhUiQ3xd5BDthKu2VETI9lW5UAoGnTBw6+nSs+KuT
         65hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:to:dkim-signature;
        bh=oEsOz/8T8z2ylZ4ja7cwKljdny+N8pW5D/wcdQijxOA=;
        b=wL/Mgl8Rvcb5J1v1kJ8lGaRf18ZEXfu2UGIfnTCZsQn4MAP+tZwk+EDK4HLMAQRsAz
         P1C3y6WXMuGzrX7aAOznIj9zBhGqJVJJscOOU4wlvpvGchigT9JJQ8sqnY/SZpvAORlh
         DiwQBmmIjyzXOMfHK3ki0pOtPXsrYF5dY7YwFeYLNMX4knUdSVQ88tic5TZxU+M80p7u
         pm1FTXgV5MILWlG6Z67Xe6yVPOR01stUAkE0DlMHcY1U539uPeQpUh/B0vt77W9w/lfA
         a6MHrOJveiuDcQ3JYT0rI060DslrRjwxEfuafBO8Px9F6XCL7VzDyhk8yMMw+kgNuwP3
         ktyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WR3V4rVi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si26500798ilh.60.2021.03.04.07.41.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 07:41:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WR3V4rVi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHq63-0003dC-7a
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 10:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHq5u-0003cu-V6
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 10:40:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHq5t-0006Ii-1b
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 10:40:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614872452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEsOz/8T8z2ylZ4ja7cwKljdny+N8pW5D/wcdQijxOA=;
 b=WR3V4rVipZF6Wff5WVWXG3ax7RiUShXORmjTfLbzebk//EaZVHHuBzIh+AyfqSI6fxvFXM
 qPLDr/3swCCgOijOblKHL2hypnHdphAjX+F9iAr3hkhGo8gKK/hcRpo3jpFD86B5xoxoqB
 goLhR/0tlwCcTDpo3xU1KoqtVy7YJOQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-wQoOBzM5PxKH7y8qvveU0w-1; Thu, 04 Mar 2021 10:40:48 -0500
X-MC-Unique: wQoOBzM5PxKH7y8qvveU0w-1
Received: by mail-wr1-f69.google.com with SMTP id y5so4098563wrp.2
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 07:40:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oEsOz/8T8z2ylZ4ja7cwKljdny+N8pW5D/wcdQijxOA=;
 b=LZqxvDYYPVydirSK1NyqA16zSot82rkT4900HBpJj7J8DYSk3FHbYgwY/XhccJgaIb
 Zu1ARfinBYW4/VQVIg2k/tc7P6+x9QOJ6h0jS/TThaKfeafSsqSzWwkMREXsdOAqJiza
 hj7fPv8YO90yVeT6Rk8fWHSPyfAd1y/LxNQr7CPIAp+E+sqOJsnU6VRAA4IWejZt7xDR
 UUEzk/0C35/hbvUzgRU9SLcFZfM2AodNDaWtH3KTCmjizD735YzpgidGcu4C49K/whsg
 B5KU8G3tOMujBILC2IBAZmw5S/mfcZAozXK8g/tzECtNRJMMk153GmNlVCZOF8OTLSqW
 UyQg==
X-Gm-Message-State: AOAM532HXM5xNMl8gn993/xEyW2jauTs8wduMDJJhZ5vORy83bPW6h94
 BdoSiildOZ6NcEckmtXh7Egy+xCjfQ9JaiTOS/9AbOOzROYsNchAieRorI5Nw8klRPM9T6Nz/2j
 ++nRHF1Uh1dg3
X-Received: by 2002:a7b:c0c3:: with SMTP id s3mr4475377wmh.11.1614872447603;
 Thu, 04 Mar 2021 07:40:47 -0800 (PST)
X-Received: by 2002:a7b:c0c3:: with SMTP id s3mr4475350wmh.11.1614872447432;
 Thu, 04 Mar 2021 07:40:47 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 4sm11076508wma.0.2021.03.04.07.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 07:40:46 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210303182219.1631042-1-philmd@redhat.com>
 <a84ce2e5-2c4c-9fce-d140-33e4c55c5055@redhat.com>
 <1eda0f3a-1b11-a90e-8502-cf86ef91f77e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 00/19] accel: Introduce AccelvCPUState opaque structure
Message-ID: <438743f3-6e97-1735-6c11-26d261fa91b4@redhat.com>
Date: Thu, 4 Mar 2021 16:40:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1eda0f3a-1b11-a90e-8502-cf86ef91f77e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ID6A4u2VItAx

On 04/03/21 15:54, Philippe Mathieu-Daudé wrote:
> On 3/4/21 2:56 PM, Paolo Bonzini wrote:
>> On 03/03/21 19:22, Philippe Mathieu-Daudé wrote:
>>> Series is organized as:
>>> - preliminary trivial cleanups
>>> - introduce AccelvCPUState
>>> - move WHPX fields (build-tested)
>>> - move HAX fields (not tested)
>>> - move KVM fields (build-tested)
>>> - move HVF fields (not tested)
>>
>> This approach prevents adding a TCG state.  Have you thought of using a
>> union instead, or even a void pointer?
> 
> Why does it prevent it? We can only have one accelerator per vCPU.

You're right, my misguided assumption was that there can only be one of 
WHPX/HAX/KVM/HVF.  This is true for WHPX/KVM/HVF but HAX can live with 
any of the others.

However this means that AccelvCPUState would have multiple definitions. 
  Did you check that gdb copes well with it?  It's also forbidden by 
C++[1], so another thing to check would be LTO when using the C++ 
compiler for linking.

Paolo

[1] https://en.wikipedia.org/wiki/One_Definition_Rule

> TCG state has to be declared as another AccelvCPUState implementation.
> 
> Am I missing something?
> 
> Preventing building different accelerator-specific code in the same
> unit file is on purpose.
> 
> Regards,
> 
> Phil.
> 

