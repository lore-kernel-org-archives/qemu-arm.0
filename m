Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3059774lfa;
        Mon, 26 Oct 2020 10:19:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnmYt34Q3dTGuR3lnTf/tAgCwdR4YRcTAuOPC2TqJLY6JH7VrZeC5N9DxpGxxhBJyin8WZ
X-Received: by 2002:a05:6214:125:: with SMTP id w5mr14171448qvs.3.1603732770534;
        Mon, 26 Oct 2020 10:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603732770; cv=none;
        d=google.com; s=arc-20160816;
        b=rbv4B9ACEK4nA5jsDko+JGI6n2EisiaXpA/adKmV/vjynWERUp5lHB7zNNjbNuE/I7
         L7MRTH6PkxFBWqSsYDHtJkkfSPlcz8o6ApV6rVhUVN8HAomL5kxP//XQm2EgmM2l5oUG
         P9bT+IM1EL1+03UFG6u22P5fleyuS83miDjVuOlCQh77xAHhAj6kF2nId3786BxUI6uq
         XAd6pT8A9E5M4esB1ZDl4LrAitS/U3ZOkBWEvf0poMLoz7MOCRgReLuhZ41K04aQ8DGc
         I1F5YrNVFUavYcdoM7RHBYAhrZgOUMgbDYEQRe1psqqG/wUiibIw5QIGoZrxeb6oQzv8
         sWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nIbkRPojou0/9NMHW1B/ur67WVggS3hynEBJUA7QjQw=;
        b=VO8GSBULNdCzfdxkklaHVqXL508RnaRhj0PtOYJeRPWBY5J5CkINavnUXFVJjupkq6
         mpl79tXOSkc23W8i4cKLNCVsXThVmBoUniz/vE1lMOe+stTR4jnSqIqe33ZdKSWY/BDP
         KbQudE9dfq5948mBDsFbT7Rw2/CULivpP9yuTKq7F23YTQ9ijc+sTFcCS+5KL4+OBb9V
         ZFXMGY8frOuINW3U9rWW13nG2KVaSFXimURj8oZyoHcP0ITrfm54RKHNaFcBLW9KRl4Q
         6yui+jXgGM5fmBxf6tcpPVrHZw5WqRfYRDJ/psH964wceOauct9OzJbG1d6Tmn3R7R7o
         I80w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fUGRT4u9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si6206458qkk.219.2020.10.26.10.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 10:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fUGRT4u9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kX69Z-0007qd-U6
	for alex.bennee@linaro.org; Mon, 26 Oct 2020 13:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX65j-0004AF-BK
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 13:15:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX65g-0007pQ-9F
 for qemu-arm@nongnu.org; Mon, 26 Oct 2020 13:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603732524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nIbkRPojou0/9NMHW1B/ur67WVggS3hynEBJUA7QjQw=;
 b=fUGRT4u9TEaNwum9Sohe6qPOZ2EsRc/fuLGmXnzLzZL5BUIgcGknRIM6wwhNAZOmZjm7aX
 L7Hsq7ofNpC9oiJ+DnpvyYaEeO/4zL9w26t7Hth0vpr5hNeCqDicx7dxEB1iLseB/NhJYC
 78RmReYjz/EU78GfEtTN/FYV+V7fr+I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-b5UgcdW8PNyBIBaDdYzCEw-1; Mon, 26 Oct 2020 13:15:21 -0400
X-MC-Unique: b5UgcdW8PNyBIBaDdYzCEw-1
Received: by mail-wm1-f72.google.com with SMTP id s25so6833793wmj.7
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2020 10:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nIbkRPojou0/9NMHW1B/ur67WVggS3hynEBJUA7QjQw=;
 b=dYcy/IU1y/x9AthQz/tnD915TuJcz8VUhmNf/dQGvbOcXHnHLfY+My7ZdRtyNKPSVh
 oyCwCP7OYUpmR0PFNGM/6c2LHF2MFQ5miSBpajKeIDSCK1PB+US7sDvIXEA9WAq3GKBF
 ocGxAXexlesF+Cnht6w+WNliwaF7xV0rzfyGGTMXX7IqJfk00rbBzjAMi/a4eHsCldKB
 9+aJoLOXLnYjADdojuS7NInZDuTufLeHvAEm4BZuy6TEpVk8x6aj6qhWz4HXM06JZVrP
 KzJWL86HrRH9j9cVeQcFhtj/BHUjaZs55bj9/nV9ru/qpl8Bsfjkw3JCx440Wn2MWGic
 2tdQ==
X-Gm-Message-State: AOAM531YLxDAMpX02y3yAfpZIY7cUK/GUM/YBtJC1YpRk54vdrgvRDW3
 JCan9GcWS4RYWkZNcNLl08JL9bKWcwbSKa+v+epY+C0BVyruGNfnCdaHZ4Nz2UgZgvf/6LwlsDl
 NoLdE5UicjnR3
X-Received: by 2002:a1c:192:: with SMTP id 140mr8247527wmb.73.1603732519519;
 Mon, 26 Oct 2020 10:15:19 -0700 (PDT)
X-Received: by 2002:a1c:192:: with SMTP id 140mr8247499wmb.73.1603732519258;
 Mon, 26 Oct 2020 10:15:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w1sm23297474wrp.95.2020.10.26.10.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 10:15:18 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] hw/ssi: Rename SSI 'slave' as 'peripheral'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201012124955.3409127-1-f4bug@amsat.org>
 <e15493bf-f31e-daf2-d216-b9d67ea638b1@amsat.org>
 <11aef83d-64ae-8954-e61f-911282896455@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ecae635c-6780-b01e-4efb-2f52e2cd7081@redhat.com>
Date: Mon, 26 Oct 2020 18:15:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <11aef83d-64ae-8954-e61f-911282896455@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.167, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, Max Reitz <mreitz@redhat.com>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V6V9rGuFjenc

On 26/10/20 18:05, Philippe Mathieu-Daudé wrote:
> ping^2?
> 
> On 10/19/20 6:04 PM, Philippe Mathieu-Daudé wrote:
>> Ping for review?
>>
>> On 10/12/20 2:49 PM, Philippe Mathieu-Daudé wrote:
>>> Since v1:
>>> - Fixed patch #1 subject (Kevin)
>>>
>>> In order to use inclusive terminology, rename SSI 'slave' as
>>> 'peripheral', following the resolution Paolo pointed in [*]:
>>> https://www.oshwa.org/a-resolution-to-redefine-spi-signal-names/
>>>
>>> Candidate to be merged via the ARM or Trivial trees.
>>>
>>> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg739108.html
>>>
>>> Philippe Mathieu-Daudé (3):
>>>    hw/ssi/aspeed_smc: Rename 'max_slaves' variable as 'max_peripherals'
>>>    hw/ssi: Update coding style to make checkpatch.pl happy
>>>    hw/ssi: Rename SSI 'slave' as 'peripheral'
>>>
>>>   include/hw/misc/max111x.h   |  2 +-
>>>   include/hw/ssi/aspeed_smc.h |  2 +-
>>>   include/hw/ssi/ssi.h        | 56 +++++++++++++++++++------------------
>>>   hw/arm/spitz.c              | 32 ++++++++++-----------
>>>   hw/arm/stellaris.c          |  4 +--
>>>   hw/arm/tosa.c               | 12 ++++----
>>>   hw/arm/z2.c                 | 14 +++++-----
>>>   hw/block/m25p80.c           | 14 +++++-----
>>>   hw/display/ads7846.c        | 12 ++++----
>>>   hw/display/ssd0323.c        | 12 ++++----
>>>   hw/misc/max111x.c           | 18 ++++++------
>>>   hw/sd/ssi-sd.c              | 12 ++++----
>>>   hw/ssi/aspeed_smc.c         | 53 ++++++++++++++++++-----------------
>>>   hw/ssi/pl022.c              |  2 +-
>>>   hw/ssi/ssi.c                | 48 +++++++++++++++----------------
>>>   hw/ssi/xilinx_spips.c       |  7 +++--
>>>   16 files changed, 152 insertions(+), 148 deletions(-)
>>>
>>
> 

Queued, thanks.

Paolo

