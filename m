Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp478365njc;
        Thu, 13 Feb 2025 02:11:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8/368fU/qso6Q8WQvqNGKWPB5N2y+0zaYAykdSW4JFi8pnpcDbcW01AWZS+EsB51tx4ETPGKpAM5jAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEODUTEs+1sUXJ3dHMEkLr5OsqFNVUGqActQxL18oRDbvAHOXgMvN/QxbLUXJocMO9IVEDX
X-Received: by 2002:a05:622a:4d86:b0:471:bbdb:9f4a with SMTP id d75a77b69052e-471bbdba006mr67143691cf.21.1739441509253;
        Thu, 13 Feb 2025 02:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739441509; cv=none;
        d=google.com; s=arc-20240605;
        b=GcGCw+p1/kZ5oPjztg+OUv8e3cLEP/LI8pWdb/kfPwt7bnUdtozpP5PdTUjKJQkikg
         /Iw+cSxUvWU/iB0zzNUbLWROMpRdIt8c3P1xWkZ7BEprnF7SOZCwkj8+bb1Cc3AhMQa2
         0wp6LunAAcL58XwyTCTcXkF1RJ8TaYUS25rlPsp7P3TLfAp4xnrhLGpxRzBtJUvfAIFE
         xUK6LeiFoRSdUNcK0NzOJ5RlCNwTj6B1ccKi7CWkhqMY1Jvt/f7D1nSF8V8kSi6pDf7E
         9+kJ0Cx57lRFLn9S9XCRyO2e1vzFxY2b6OVpfFWrKHfOp1l50uYNM1RK6ug+85D4yAqf
         titw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EHa8b5VjoXUBPCKK0wJtWiyOuYodBNlXLmbA6ZnTieo=;
        fh=/ZagPg9XVUci5W43m1kxL8K47FiN8frzk6+Ik+0wpeU=;
        b=h9Nz4CkvVIJpNyMsGzXmUIXOIfS8Muh8Zig/wzFNUOWy7jMb16NjydqGCJzdzTbdfZ
         bJo9rvqNd3zxhcEgPXv3gdRMFJKlF5mMPKeDa8z1YU2r93PSzbxpbhCscue/jabMcjz0
         HzOBu+8CDI9eYI/dlY6sPRZM7L52CfL35SABO8AnFSmB63aOs13X1twHsAwOVfsbR/UP
         WenbB9+V/CK0cZYdKaZTyqzWHsReNKs5+FpFY9+zCjv7WT/VaDJMRx8mZNCs2QYyv2CR
         y3bGmWmFHULwRY/tCQqRjovBUL/pdxrUsiX2+78k06PTLhDzx+05iZcbUZulw+s4gh6I
         GzsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=J54CJK4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c2b60a05si10757611cf.565.2025.02.13.02.11.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 02:11:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=J54CJK4s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=amazon.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiWC4-000302-Ug; Thu, 13 Feb 2025 05:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=1325cea77=graf@amazon.de>)
 id 1tiWC1-0002vK-R2; Thu, 13 Feb 2025 05:11:38 -0500
Received: from smtp-fw-9102.amazon.com ([207.171.184.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=1325cea77=graf@amazon.de>)
 id 1tiWBz-0006wr-IC; Thu, 13 Feb 2025 05:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1739441496; x=1770977496;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EHa8b5VjoXUBPCKK0wJtWiyOuYodBNlXLmbA6ZnTieo=;
 b=J54CJK4sR5S0QUGq5wfo5kYWNvQk8qz707lcb34QhsZVo+r12vdhULcy
 T0bD3cA6ZeXJcFRkB4NxIYJHSlhXq9i1Qsy8Kvj5pOXzPraWaQLMs3qDk
 E5uqNiBPjrVGFUaO92QGmKUn0nNU4wNuhHTPZDQ06lTfALXCrgDA0yPnw k=;
X-IronPort-AV: E=Sophos;i="6.13,282,1732579200"; d="scan'208";a="493549147"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 10:11:27 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.7.35:1392]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.96:2525]
 with esmtp (Farcaster)
 id 9cec5498-dcb6-46fa-b6ec-bad73af767f2; Thu, 13 Feb 2025 10:11:26 +0000 (UTC)
X-Farcaster-Flow-ID: 9cec5498-dcb6-46fa-b6ec-bad73af767f2
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Thu, 13 Feb 2025 10:11:26 +0000
Received: from [0.0.0.0] (10.253.83.51) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39; Thu, 13 Feb 2025
 10:11:22 +0000
Message-ID: <cc41f19c-5778-4376-a1a1-762a92c8584c@amazon.com>
Date: Thu, 13 Feb 2025 11:11:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/23] hw/uefi: add uefi variable service
To: Ard Biesheuvel <ardb@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
CC: <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Thomas Huth
 <thuth@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, <qemu-arm@nongnu.org>, Michael Roth
 <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>
References: <20250211092324.965440-1-kraxel@redhat.com>
 <CAMj1kXE289FkzV=GZSUARF7TFUyRuxYVX-090ic06Erb_RLGrg@mail.gmail.com>
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <CAMj1kXE289FkzV=GZSUARF7TFUyRuxYVX-090ic06Erb_RLGrg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D046UWA004.ant.amazon.com (10.13.139.76) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Received-SPF: pass client-ip=207.171.184.29;
 envelope-from=prvs=1325cea77=graf@amazon.de; helo=smtp-fw-9102.amazon.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-TUID: 3OOfXwViZ5jZ


On 13.02.25 10:41, Ard Biesheuvel wrote:
> On Tue, 11 Feb 2025 at 10:23, Gerd Hoffmann <kraxel@redhat.com> wrote:
>> This patch adds a virtual device to qemu which the uefi firmware can use
>> to store variables.  This moves the UEFI variable management from
>> privileged guest code (managing vars in pflash) to the host.  Main
>> advantage is that the need to have privilege separation in the guest
>> goes away.
>>
>> On x86 privileged guest code runs in SMM.  It's supported by kvm, but
>> not liked much by various stakeholders in cloud space due to the
>> complexity SMM emulation brings.
>>
>> On arm privileged guest code runs in el3 (aka secure world).  This is
>> not supported by kvm, which is unlikely to change anytime soon given
>> that even el2 support (nested virt) is being worked on for years and is
>> not yet in mainline.
>>
> The secure counterpart of this would never execute at EL3 on ARM, but
> at secure EL1 (or potentially at secure EL2 on more recent CPUs). But
> the general point that this is difficult to virtualize stands; I've
> contemplated doing something similar to SMM emulation using non-secure
> EL1 in a separate VM to provide an execution context that could those
> the secure EL1 payload (using standalone MM) but I never found the
> time to work on this.


Sounds very similar to what Ilias built a few years ago?

https://lore.kernel.org/all/20200511085205.GD73895@apalos.home/T/

Which reminds me: How similar is the protocol in this patch set to the 
one implemented in U-Boot? No need to reinvent the wheel over and over 
again.

>> The design idea is to reuse the request serialization protocol edk2 uses
>> for communication between SMM and non-SMM code, so large chunks of the
>> edk2 variable driver stack can be used unmodified.  Only the driver
>> which traps into SMM mode must be replaced by a driver which talks to
>> qemu instead.
>>
> I like this approach, but I will note that these protocols are not
> standardized: it is basically an EDK2 implementation detail, but this
> is fine, given that this targets firmware that is based on EDK2 (or
> its derivatives).
>
> Using a single shared communication buffer makes it feasible to
> paravirtualize this even under confidential compute scenarios (where
> the buffer needs special shared mapping semantics), and I think this
> might be useful, even if in principle, the VMM is untrusted in such
> scenarios. Paravirtualizing the individual variable services directly
> creates a problem here, given that the firmware cannot share mappings
> of arbitrary arguments passed via pointers.
>
> For the record, I've already acked the OVMF counterpart of this, and
> I've started working on adding support for this to my minimal EFI for
> mach-virt [0], which is another scenario (i.e., minimal EFI compatible
> firmware for micro VMs) where having this complexity in the VMM is
> preferred.


Amazing! :)


Alex

