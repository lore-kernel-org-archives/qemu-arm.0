Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4770274wrh;
        Wed, 8 May 2019 05:29:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3uXy6WUMIIMyHjYEfyugh/bxIy0B/c6/q0KdLmwQLoH/nJaX/mFks8EdtW7KXFqlcts61
X-Received: by 2002:a1c:f70e:: with SMTP id v14mr3049786wmh.74.1557318596108;
        Wed, 08 May 2019 05:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557318596; cv=none;
        d=google.com; s=arc-20160816;
        b=1Je83IF5ZQzmB23FuPK8XGY0oIFqcXaepl+ORDQAH3VmHi06cxxmH37SMv5IgG6mq4
         Lt4yIADJI9v5hkDNuclQR8IaPWW9ew28m7WprfJ0ElHkCR3qky3eBkTkOHUDz/TfuNFq
         etGGD6zgRpjuL1GQbjLztSewvREXZ6GE58pwiJ2grt2TxIC33Ct/p6SRz5f0vqZy5nYh
         EA5YnG2Cdvf1edpoqHUOIYa4fI4pexpyXRiyjY2YoaO4DVYMhZcopdNtO3+kUfV8/He3
         74lTIGzEuA1UKZLNrvEotD+ocWGLEdJf9kbo8Fs5XESoR7yzmbm51N2EXlCKyH8UpSN4
         lgUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=JfFuS75QZH+ohLsy6LXoom87KOz5yO8X4rzQoE26WdM=;
        b=YE5ZjH4MUKwTcn8r3q3Qe3mElT5ie2kgmcXHJKyvWFEluY7f4vfRwpOlLDJx2A0OJD
         wB6HH9WsabS4LXakU3fG15gVUJ3i3d1KvfhIIcMK0QBM97tAYmt6krvyfm5c3B+3+1zN
         /jk2o/tNmNFdnT4Rc5bgC0vwqk9ckeytmj0s3p7TvBKXJjG4gRWTmzLf522ixgCXME6X
         IwGuR1KqubLNXYkUOe9kuY0N17ZHCpsyqQk+38jDmAE9ptu2sYKw3fUE8orDn/4BlBiY
         WnBUa9XeaAiIilhzwrpwkXT2LxsGMpABXiqNa2NKN92ozQvAis4DxvvbDtRtLS1dAKF/
         7IWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si11975629wri.224.2019.05.08.05.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 05:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOLhr-0001I6-6F
	for alex.bennee@linaro.org; Wed, 08 May 2019 08:29:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOLhe-0001Hp-Tc
	for qemu-arm@nongnu.org; Wed, 08 May 2019 08:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOLhd-00084m-W4
	for qemu-arm@nongnu.org; Wed, 08 May 2019 08:29:42 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54571)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOLhd-00084C-Ps
	for qemu-arm@nongnu.org; Wed, 08 May 2019 08:29:41 -0400
Received: by mail-wm1-f68.google.com with SMTP id b203so1882697wmb.4
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 05:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JfFuS75QZH+ohLsy6LXoom87KOz5yO8X4rzQoE26WdM=;
	b=umJLQZy5kTVyqwj5TRpSFh0Fc8WUDbpURhjUxZA8JQescrOWc2PXEF8cw3oqJt/D2t
	pAJalMM1LiX6fZY0/fBuqdUqio6nyuK/Oh7un8vhxnAB9SLTsFSRG4OR6me3O6N6s+ir
	G7p6RdjgXyskO8xHJ7PU942ZPanGclr2knETeVGZJCWlmbnPxCKXFL7E4uxhefQwfgAs
	xtvknKJlXZI+mQzJUSbSWGCWkD46cTI3SUjmHOsK+aM12HhV9xH75+6/mTKFR5iJugs7
	qsy4WRfIqNgCGMF2K0MmSFOxwRbhMscxdk9gFV6P8RLbfzRU8v+OPVTdU559svOndlUZ
	b3RQ==
X-Gm-Message-State: APjAAAXcJ4wp2uN0+8WZfViYrFcKh3v9Sx2Vh0K2b/7pIjYHbpAN8m7x
	vh1WrlWxpBRBXDwQwY934RWEHA==
X-Received: by 2002:a1c:7005:: with SMTP id l5mr2906265wmc.149.1557318580720; 
	Wed, 08 May 2019 05:29:40 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id
	n2sm35418726wra.89.2019.05.08.05.29.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 05:29:38 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <20190505180719.31913-1-philmd@redhat.com>
	<02ce0766-4464-2c71-6085-7e164d4405af@redhat.com>
	<ffaa93ed-f790-8aba-3683-d1e11e2ac59c@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <63fc48d2-2d33-c6b6-0e22-b8b2578b75ac@redhat.com>
Date: Wed, 8 May 2019 14:29:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ffaa93ed-f790-8aba-3683-d1e11e2ac59c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [PATCH] hw/timer: Compile devices not
 target-dependent as common objects
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ShPIYJmJUF+j

On 06/05/19 03:06, Philippe Mathieu-Daudé wrote:
>> By the way, I was surprised to see TARGET_FMT_plx there, since I first
>> thought that this would be a target-specific define, too. But apparently
>> it is not. Very confusing. I'd suggest to rename that to HWADDR_FMT_plx
>> instead, what do you think?
> I'd rather use HWADDR_PRIx and slowly kill TARGET_FMT_plx...

Right, either that or rename it to HWADDR_PRI0x.

Paolo
