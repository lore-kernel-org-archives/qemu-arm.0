Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1682274lfb;
        Thu, 21 May 2020 08:40:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyA2YiKc0FYo17+543uF+N+EMct+04mi7fliqAVD6A2VDgSkfwU0TRR51UP1s8TjF+zn1Ot
X-Received: by 2002:a50:e70a:: with SMTP id a10mr8447492edn.124.1590075617651;
        Thu, 21 May 2020 08:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590075617; cv=none;
        d=google.com; s=arc-20160816;
        b=iNEzHlxhls6Uv82gArPyZhtNd70XgWj6+vzw2hLJ0IBY67Sz0f8dvL/GiLIHdTJg6C
         x6VIIIEUlT7KoMjzrsoL+tcyGseUrRNIWAsYLTLXfRchiYiWVuHUHTd+8jBY+O6qHAI3
         hRT5RMqY8jFM4oMb7LJZHsedCmhz4cYYFGvAfZbIkWG0lzLqyUza34y1XARtHnay7a6B
         MrtoneexuhxILMK6WhUQC5kWtjLeHDim5BCnqJZ0yKP/yEX9lNpyHAUgC5Qn8TBrGlKD
         F6MoyJmnrZ4wXB0YNpxzjmh1H2zXcVmDsUVxAwPW9VsyRKt/ZO9Lo3L5YEmzrcYxc0rf
         Mhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=kenpgJBk4auwpqa56sHWeaXAdh8oFne+jS5kW7dDT3Q=;
        b=o4h7CcExeWgN/CUUPKLur8KwVevlgJZFQQJMK+jd6K8dRkSV7EPgakVn5G6JHH2Gea
         JGUAqtBg2J+vFJEHvc7KOmEXs1+JcSzb1r+kP/zYMfkGhTpkMcnf9U4/ZdFO0+V5OnJn
         w3G1ZH/KoK2EzM8WTFj6BqlauRTZp8kHGWiJP0fF05rcdygULKR/OQ2gzUAdGJ9RsbFc
         t9zmOJ3MN/4eI7ZGNsI+aphs6gaClrVd61P4b+U6YWa6eliBgKNzeSBVbFlgvro19A2s
         qMm7TosQXEv3ZV5gRHDxJiUXXbKYW6Za4HFZr+N84frQ/MfQ6UBI6zQObUqnyzekG0AJ
         FBRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aA6nrH98;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id v18si3732466ejb.705.2020.05.21.08.40.17;
        Thu, 21 May 2020 08:40:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aA6nrH98;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729786AbgEUPkQ (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 21 May 2020 11:40:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38791 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728267AbgEUPkQ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 21 May 2020 11:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590075614;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kenpgJBk4auwpqa56sHWeaXAdh8oFne+jS5kW7dDT3Q=;
        b=aA6nrH98tbB8DmLvjITj9G3b+pz+kXrhGXJ2y7ExdS+K2nUO3mnooKDwSOpEEzLWM6VVzh
        gYPl/kw7qlE2LrUZ6JimwzUgH3nR02qUrzJgZOkmCN1lXqtSLvIlr/AOA9xix48tqktOqE
        8TcgeZcR5LjCG1v3Jntb2FI6/7Gn8u8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-dlcgbeTKPtehoqhw7hX0zg-1; Thu, 21 May 2020 11:40:07 -0400
X-MC-Unique: dlcgbeTKPtehoqhw7hX0zg-1
Received: by mail-wr1-f72.google.com with SMTP id e1so586892wrm.3
        for <kvm@vger.kernel.org>; Thu, 21 May 2020 08:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kenpgJBk4auwpqa56sHWeaXAdh8oFne+jS5kW7dDT3Q=;
        b=RGhCVDO5XqWd4fj9a9SAHV25Ru2ZbtaNjPbSFQSHHAb7dBOUd+cq5SKIjv1JnwrXBd
         l6edQMOST+GWgWNXLTx1H/mSJUeD+9a97Gc7XrlQ5BnSPJpMu8TCSAEAYLmgMTr/N9XE
         iY+FAV/RenE5+08R6CfHgAcZMPf57GBpyus72VJhMFyJ+gLz5C/8e0SSETzZVzg+MWYu
         D+pKT5WWg7gu7xTO7TS+HRZCMEWleTmy7vTFIV/3CfvKIi7CJACQIAriQzaK+JQVsK/T
         kKbRQWWoi9xS3KLzpzfv83Vwwgp/6nK9rgbf27Ax/w+Emnz5YsdJIoSDofXpwq+O9PP5
         BU4w==
X-Gm-Message-State: AOAM533js+OCu+fHrwdzIsExS9OLgbtz02lNYGTQamQ5HntEA2Gpytrq
        YPaDHhyG+2e2xkgaHkACOUgeh+KYJpNZ++BzqE9g79aLJxnj8r0q3tAa6ykJF4Kj4kKjDvCUhMN
        XVHXIaxK//eGr
X-Received: by 2002:adf:eb08:: with SMTP id s8mr4857962wrn.361.1590075606569;
        Thu, 21 May 2020 08:40:06 -0700 (PDT)
X-Received: by 2002:adf:eb08:: with SMTP id s8mr4857943wrn.361.1590075606355;
        Thu, 21 May 2020 08:40:06 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.160.154])
        by smtp.gmail.com with ESMTPSA id a17sm2925213wmm.23.2020.05.21.08.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 08:40:05 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] exec/memory: Enforce checking MemTxResult values
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        qemu-devel@nongnu.org
Cc:     Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
        qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
References: <20200518155308.15851-1-f4bug@amsat.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <97559075-f7f3-3b18-a34d-3e7a419817ab@redhat.com>
Date:   Thu, 21 May 2020 17:40:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200518155308.15851-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: kYetSQ+3HHCd

On 18/05/20 17:53, Philippe Mathieu-Daudé wrote:
> Various places ignore the MemTxResult indicator of
> transaction failed. Fix the easy places.
> The rest are the DMA devices, which require deeper
> analysis.
> 
> Since v1:
> - Dropped "exec/memory: Emit warning when MemTxResult is ignored"
>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg704180.html
> 
> Philippe Mathieu-Daudé (7):
>   exec: Let address_space_read/write_cached() propagate MemTxResult
>   exec: Propagate cpu_memory_rw_debug() error
>   disas: Let disas::read_memory() handler return EIO on error
>   hw/elf_ops: Do not ignore write failures when loading ELF
>   hw/arm/boot: Abort if set_kernel_args() fails
>   accel/kvm: Let KVM_EXIT_MMIO return error
>   hw/core/loader: Assert loading ROM regions succeeds at reset
> 
>  include/exec/cpu-all.h |  1 +
>  include/exec/memory.h  | 19 +++++++++++--------
>  include/hw/elf_ops.h   | 11 ++++++++---
>  accel/kvm/kvm-all.c    | 13 +++++++------
>  disas.c                | 13 ++++++++-----
>  exec.c                 | 28 ++++++++++++++++------------
>  hw/arm/boot.c          | 19 +++++++++++++------
>  hw/core/loader.c       |  8 ++++++--
>  8 files changed, 70 insertions(+), 42 deletions(-)
> 

Queued patches 1-4, thanks.

Paolo
