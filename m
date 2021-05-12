Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4636635lfg;
        Tue, 11 May 2021 21:53:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi4xWGyVwNeq3qhEKaM+qRQQ+dA3Nqpe2f0via9SfFkgySNJw+g5bKuQFuGsAqEkbyj+85
X-Received: by 2002:a37:a8cb:: with SMTP id r194mr32117918qke.349.1620795226957;
        Tue, 11 May 2021 21:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620795226; cv=none;
        d=google.com; s=arc-20160816;
        b=JpOlPfwrRTDnADXFDMya2Ogk38bgJzwCQLe1na0S+T5y+Z+FglUbsg0j56xl3RyAuv
         wVB0ycRpwXYL0JyKpZ4SeDj2xRZf1IhZbmeFCKszH7iXEPuzxiqyMGQ9xpWfJ4wFrmUW
         Dy1AoMH/ofdtXugSsuW0NiMG+8bjEeu46VYgDQnEQMxv3J+Gwk6kPW7rl0iNJvnTqMZW
         JPk2mlDPzrAyOci/NNJ0wCltJxjb9M1//DxE7C6nu/zKjOEQREjgMxCFwx05h2qDc1KM
         ApVKNrlDUjvPgywsvcAysSBkClaXHle1Cka/m6DJTIXKWgfSQrYnY8LmI8udJJfsbEod
         E6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rlL/K/itK4CyGRdXHSN5pxpzzaH2h+JpravII6bkTOU=;
        b=Vt4nUoulp3+gGVU2rh6TKZCpL+iUI57Wp2yQS7hhXjKIn0VPsYxyX+Uq3qYJoPhiCx
         eb9Ep45QPaaThN4Ks8nrYymwzunhmCHdk4lRU8bkwEK0AMJzhB4VyN5N3dMEHLmV5HuP
         k6NRsSuNKD/+SRa0ErOTAU3gf7S20FVpEfg0zieaQQ7vqVXTe/ldgnmoBX4kn6o63A5y
         y/8daqEJT43e/0qQFIea76K+buZ9DseNkjBUA4Yov3LlNK0VFZNDvaHOqVMCDBim+W3t
         v5/x3ZC6gT+uoN60PdEh5frhxCuXQDRzywjx4PpGKbWUmf7X+GblLh/3qEPpqrNJ3qh/
         n6SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gVAawJxd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si14092338qkg.24.2021.05.11.21.53.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 21:53:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gVAawJxd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lggsU-00081o-AE
	for alex.bennee@linaro.org; Wed, 12 May 2021 00:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lggsF-0007yU-2R
 for qemu-arm@nongnu.org; Wed, 12 May 2021 00:53:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lggsC-00047e-8L
 for qemu-arm@nongnu.org; Wed, 12 May 2021 00:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620795207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlL/K/itK4CyGRdXHSN5pxpzzaH2h+JpravII6bkTOU=;
 b=gVAawJxdrCfb1gMDE3ck7pH/4ORfokfvMmnC9jQzkIt4WBVvJ1ZPpFfemJO3ejvcvraDTw
 2VDfrl68Ah83OhiOxjZnrsEyzSyhHtHqhYw5XkI7e6KgmNCWItGGYkdvJSrko31NG7YJIT
 bv3R7dwj3aQavwSSE7CKcCHVD7T5bmk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-0bltPzC0N6eDhnTmnvcnFw-1; Wed, 12 May 2021 00:53:25 -0400
X-MC-Unique: 0bltPzC0N6eDhnTmnvcnFw-1
Received: by mail-wr1-f69.google.com with SMTP id
 f1-20020adf9f410000b029010e8048a0e3so4398241wrg.4
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 21:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rlL/K/itK4CyGRdXHSN5pxpzzaH2h+JpravII6bkTOU=;
 b=TuQklahgE1Uz6y1vAU8AqUwpfisb58RhceFX63YHImH2l+62ulc/cBRHYxhcP0hiky
 QB+XjA9pPaP6+GXOoYbLVy3cPFbTsoZISUlCrd2qtvHWDp6B38hZ6FzmUZt4FKzwWLVA
 PulRwbp4mDdQ6YRwRedx7LRsP5PmjT0oNwaGLj4ju9BlO5YzeHaiA6DxDRFgERANWYte
 gOV7F1qX8zIM9gxhc6/Alnw45dfV39+nJKbxEquDOBm/dG0XrLiTH2e83ya9w3sJPyfr
 fXGkOSloZ8hvDP5QfpIgaONNhLEkmJSMgiSrKCvaS/nq87Q/ZzYxL/ppzSc3Cm2n0r3Q
 0CIA==
X-Gm-Message-State: AOAM532gQQPa8kxG2GZNc1tuIPn3n0lqsdE6DSIjnSB+BlAOur8Z8acg
 TWzWaqo+Mnv/k0kFQtvid7YzRlQUac2/xc+Ub2pNz3EWULdTHFg6SobCUdPt8fRRZNqGYSXnvcE
 kO2azidepqS9hebdoA3b1ppT2cQxx9k6xr4AGCIZxvLtQcpFXeKIFpWBsjzVz
X-Received: by 2002:a05:600c:1994:: with SMTP id
 t20mr36470301wmq.177.1620795204693; 
 Tue, 11 May 2021 21:53:24 -0700 (PDT)
X-Received: by 2002:a05:600c:1994:: with SMTP id
 t20mr36470266wmq.177.1620795204379; 
 Tue, 11 May 2021 21:53:24 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id i3sm33711527wrb.46.2021.05.11.21.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 21:53:23 -0700 (PDT)
Subject: Re: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-2-philmd@redhat.com> <YJs8anLs1zL3nPdS@yekko>
 <21e0a306-ccfb-a627-1496-14f831fe80a7@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dba0c284-b279-5e5b-74c9-2da719a8ce2e@redhat.com>
Date: Wed, 12 May 2021 06:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <21e0a306-ccfb-a627-1496-14f831fe80a7@redhat.com>
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
X-TUID: ntRxzTB5JlAP

On 12/05/2021 05.57, Philippe Mathieu-Daudé wrote:
> On 5/12/21 4:24 AM, David Gibson wrote:
>> On Tue, May 11, 2021 at 05:53:50PM +0200, Philippe Mathieu-Daudé wrote:
>>> Per the kconfig.rst:
>>>
>>>    A device should be listed [...] ``imply`` if (depending on
>>>    the QEMU command line) the board may or  may not be started
>>>    without it.
>>>
>>> This is the case with the NVDIMM device, so use the 'imply'
>>> weak reverse dependency to select the symbol.
>>
>> Uh.. It should definitely be possible to start a pseries machine
>> without NVDIMM.  I would have guessed the same for PC.
> 
> Yes, this is what this patch does. With it we can build with:
> CONFIG_NVDIMM=n

But with "imply" you could end up with a PSERIES that does not have NVDIMM 
when also using --without-default-devices, couldn't you? Why don't you use 
"select" instead of "imply" ?

  Thomas

