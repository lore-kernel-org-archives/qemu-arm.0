Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp2214985ejb;
        Sat, 17 Dec 2022 07:26:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4MhMInVuNrK8Y3KcqnALBYvbGXPshRysePfGhoU4ap0EZzYZWEYjNLhChwrWT3V92qpkAH
X-Received: by 2002:a25:df89:0:b0:706:c69c:29b7 with SMTP id w131-20020a25df89000000b00706c69c29b7mr33937641ybg.36.1671290791958;
        Sat, 17 Dec 2022 07:26:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671290791; cv=none;
        d=google.com; s=arc-20160816;
        b=aAbL1sl84DRE0H3GjNvQYnXcn/WxXr9kh1Lp8zPFDPuTGT4uRVje1eGNAk8nrJwSUu
         Ut5XLrqA/xrWlOlmc3AQQx326DSbaQ/T9pSCSR8F3N40+8GhniD1OjQUtQ4vJid8aKEQ
         BIHIZ74rFIclqO9N+qC0d69nU/X8vljTQyfE9ZYM8RrX58rdq5P89PpRb1uLiXlGNq1M
         lZ0FTjuya3FCVswj8qLXIEUdTV9AS2pZ2X2O/iJNcG+KpMipRANx5G9PpG9zIMSpNr/l
         1naQHtRlWV4aMt7DbKwGgK3/ETggpU5sCsWPvby5C+vASvYCYQIVxjq4Xxx5p6DZp3E+
         RhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pmPoEEycSInrIphKy1irRiK7vbaRkCFjmE5wIu5XwFM=;
        b=GriM6p8YdcJZwCJ8uXTCd0Chyy46fcZIVCCkPaiAnrmrsI+/50unNJh4mBzksRfufd
         QwF6dHVmqLzsJCo8/3Xda239bTADLXyz88RpijdfGdzLM2s660nkjXHVZ7VpydVtiFM8
         /yY8whS7lNW3layk/CxqDtMcif3rRALx0qLwHlEcE/Qq2gRFBDSqQl3VtHKxYmK4aIo1
         s7v79Bp0WCc7xIp3n/Vvs25qP5OSZknHQ18qu/pDtWZamckhd03avk6X3amsm1IUfKt7
         JhPlJintIiHHXIkiF4g25K9cra+CR//lhtl6oaG7CbBLgeC2DXMQ2sMOcv54m+fMO2fN
         7P6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=j4O7wqMW;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
Return-Path: <julien@xen.org>
Received: from mail.xenproject.org (mail.xenproject.org. [104.130.215.37])
        by mx.google.com with ESMTPS id c199-20020a25c0d0000000b006f1cb1afdc0si5570009ybf.321.2022.12.17.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 07:26:31 -0800 (PST)
Received-SPF: pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) client-ip=104.130.215.37;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@xen.org header.s=20200302mail header.b=j4O7wqMW;
       spf=pass (google.com: domain of julien@xen.org designates 104.130.215.37 as permitted sender) smtp.mailfrom=julien@xen.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=pmPoEEycSInrIphKy1irRiK7vbaRkCFjmE5wIu5XwFM=; b=j4O7wqMWqAt2Ch36xr/Y2tGP25
	gxU9rGKFvWYpkc5GEXJjnPlXqx6ikVlMOUxHktUcy3oDataYPfKB44iCqkKxq/W9L6VGBdIflg8fe
	jMmaXgV7nWcGu3CmHmyY4bjWo/1YOBaOYrcYh4vHDjxFBjOjMksigJXMg3G8ATdFc+10=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1p6Z53-0008Qd-AF; Sat, 17 Dec 2022 15:26:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1p6Z53-0000vI-42; Sat, 17 Dec 2022 15:26:29 +0000
Message-ID: <d87025d8-b653-d80e-22c0-05f052447706@xen.org>
Date: Sat, 17 Dec 2022 15:26:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
To: Stefano Stabellini <sstabellini@kernel.org>,
 Vikram Garhwal <vikram.garhwal@amd.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-dev@xilinx.com, stefano.stabellini@amd.com,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com> <871qphc0p3.fsf@linaro.org>
 <ade61d47-f8c0-09cc-1a44-faaaff87d76a@amd.com>
 <alpine.DEB.2.22.394.2212021429220.4039@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
In-Reply-To: <alpine.DEB.2.22.394.2212021429220.4039@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ePNbQl1/lYMc

Hi,

On 02/12/2022 22:36, Stefano Stabellini wrote:
>> Do you know what Xen version your build env has?
> 
> I think Alex is just building against upstream Xen. GUEST_TPM_BASE is
> not defined there yet. I think we would need to introduce in
> xen_common.h something like:
> 
> #ifndef GUEST_TPM_BASE
> #define GUEST_TPM_BASE 0x0c000000
> #endif

I think this would be a big mistake to add the two lines above in QEMU.

Libxl is responsible for creating the domain and generating the firwmare 
tables. Any mismatch of values will be a real pain to debug.

Even if...

> 
> We already have similar code in xen_common.h for other things.  Also, it
> would be best to get GUEST_TPM_BASE defined upstream in Xen first.

... we introduce upstream first, the guest layout is not part of the 
stable ABI and therefore could change from release to release.

> 
> 
>> Another way to fix this(as Julien suggested) is by setting this GUEST_TPM_BASE
>> value via a property or something and user can set it via command line.
>>
>> @sstabellini@kernel.org, do you think of any other fix?
> 
> Setting the TPM address from the command line is nice and preferable to
> hardcoding the value in xen_common.h. It comes with the challenge that
> it is not very scalable (imagine we have a dozen emulated devices) but
> for now it is fine and a good way to start if you can arrange it.

It is not clear which one you think is not scalable. If this is the 
command line option approach, then I think this is unrealistic to ask 
every user to rebuild there QEMU just because the guest layout has changed.

Today the rebuild may only be necessary when switching to a new release. 
But in the future we may imagine a per-domain layout (e.g. for legacy 
purpose). So you will now need to request the user to have one QEMU 
built per domain.

How is that scalable?

Cheers,

-- 
Julien Grall
