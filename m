Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3814408wrg;
        Tue, 14 May 2019 03:08:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxYNx7jQTk2EFlJfnWRV8ySG/Dz+iEO/+oGiRyPiLTeL0EIF74GDlQV9GowFHFABeHRPK4e
X-Received: by 2002:a17:906:a4d9:: with SMTP id cc25mr22216359ejb.298.1557828483287;
        Tue, 14 May 2019 03:08:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557828483; cv=none;
        d=google.com; s=arc-20160816;
        b=nGJiQnN+DUvF/uLt96ywlat591JgrbTdelzE6FT5CJG3uSPjEMuHX2p0FUonmXRK6Y
         Q81dtUXKsXWdkfrTMaPq77W58mTQFFJsntg6OTigtdjpMdphj741bwVCvPW0f/LOYErI
         lFK0Zf4RY2ApjEydwb6mITfVC8PAPHi34bf1tByoP2HqwzenMe6yv4fnQTx7TBZLJeia
         2Yam+bEANUYZkIcC4HgretIU/nUH9JHz1HReanmP5Rl2pBTtR6k1mLOoIiAvuU5JF740
         7wHmDHO/mNUNMz6y3+ZGSmuj2xdVdfcuk/Fxiqlg1seYbBp9BcdLBpXbwx32xHDg/H3J
         18Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=chIQv9D9N4cd7WaO9xjFgQmQm3EB1lvib6fmJ39p2nI=;
        b=Hqk2OpN78Z+8TThMhUu+kRtjMBqSVaO70VEXwsc/YAOsT26mWwg78rLJrKeR5E6L9D
         tIThbldeSkkJpuTVcX5Z4gQHnc/A39EJQJoGK420eB5ZJ8dguilVxfYyz3kUvN0jGlGV
         6ZW+Oq3DfBRT8REbfuRgTTskyx5cR5RQdB0WoHfgfEyvzEBsQHQzq+bY/DLVt95PXnO+
         D3ez2o+zAQzw+zjOWMEJEkUjohFm0UkjEXG8amk17kX4Hr+UJTgvVWRds5FZ4bp5UiOe
         oNH65YmpojdjmTenxHrYkMrp8BfSFiXfmH+DcfvsHnuBfVepkoNWY4eVs02IhlgwRx3V
         WToQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ly4si2402223ejb.306.2019.05.14.03.08.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 03:08:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQULq-0003KB-9e
	for alex.bennee@linaro.org; Tue, 14 May 2019 06:08:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hQULD-00033L-FS
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:07:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hQULB-0008TB-Lq
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:07:22 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41758)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hQULB-0008SC-GF
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:07:21 -0400
Received: by mail-ot1-f67.google.com with SMTP id g8so14650239otl.8
	for <qemu-arm@nongnu.org>; Tue, 14 May 2019 03:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=chIQv9D9N4cd7WaO9xjFgQmQm3EB1lvib6fmJ39p2nI=;
	b=lj9ZPXfwI0+ZzItbvCFEfgwpBklXRV2oEv5QXJ3mWjHUBidwuFbyZVi4u+DmrR/7/8
	RMmQxiUaVl7cbBhlcUYBNLmH+5TDP4/8xXIQ8C+G8jIPn2yPnCrnmMjCsyl2PPc3khHI
	/Bm8O0NmvhCsJl+XY6iHh7OYYoOmbxDxb+6QvpawtR83NgQtlz+giWkEaQbQ2mCEboJB
	terzxKF8BgQyZhWscIxlIPujcwmQuMKvqqP2hT7BlUCLd5RJVBBv/Nlw2edlIWYWsonP
	Orj9bMJOejyr0oLOMKrG7UhMcyTx4bjohxzKTqbjwfrCWS6ql+CwgUWXz/BECerYfDrQ
	LLjQ==
X-Gm-Message-State: APjAAAWQ7chkzrht/UfBNOR96uOVf7JQjfKI2m0G6O0lHZ9m7Sdli/O2
	MOBDvk1oJmqNx9HmErKRDWKfNw==
X-Received: by 2002:a9d:64:: with SMTP id 91mr3449996ota.19.1557828440213;
	Tue, 14 May 2019 03:07:20 -0700 (PDT)
Received: from [172.20.7.146] ([12.187.203.94])
	by smtp.gmail.com with ESMTPSA id
	z20sm5532532otm.33.2019.05.14.03.07.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 03:07:19 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190514100019.13263-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6fdd74ed-f226-1c69-6afe-6b1f2c88c59a@redhat.com>
Date: Tue, 14 May 2019 12:07:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514100019.13263-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.67
Subject: Re: [Qemu-arm] [PATCH 0/4] Kconfig switches for core / misc devices
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2KZoqlg0ezsz

On 14/05/19 12:00, Thomas Huth wrote:
> Here are some more Kconfig patches that introduce proper config
> switches for some devices in the hw/core and hw/misc directories.
> 
> Thomas Huth (4):
>   hw/core: Add a config switch for the "register" device
>   hw/core: Add a config switch for the "or-irq" device
>   hw/core: Add a config switch for the "split-irq" device
>   hw/misc: Add a config switch for the "unimplemented" device
> 
>  hw/arm/Kconfig        | 12 ++++++++++++
>  hw/core/Kconfig       |  9 +++++++++
>  hw/core/Makefile.objs |  6 +++---
>  hw/dma/Kconfig        |  1 +
>  hw/microblaze/Kconfig |  1 +
>  hw/misc/Kconfig       |  3 +++
>  hw/misc/Makefile.objs |  2 +-
>  hw/pci-host/Kconfig   |  3 ++-
>  hw/sparc64/Kconfig    |  1 +
>  hw/timer/Kconfig      |  1 +
>  10 files changed, 34 insertions(+), 5 deletions(-)
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo
