Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp961684wrs;
        Fri, 23 Aug 2019 12:17:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxiEDPf6T8IS7MTaqS8VgGa+EEuBz6Wn+BIY4RNa5QjMBSU7qhLpGuNX0VQQbE9WseQ4YFk
X-Received: by 2002:a0c:e64d:: with SMTP id c13mr5363955qvn.80.1566587847589;
        Fri, 23 Aug 2019 12:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566587847; cv=none;
        d=google.com; s=arc-20160816;
        b=wTYUaeeJX6lCld/s9yzbAfGvk9uZ5YOE3z6C8k7ycD/SMfk2mg9tmUPlyvW3x8ZASh
         RKbkBngXJJdHIfDigcy8wZe9LURJ9g0JlcOkxeo48SyO/cqmHusHcWCGLncvK1ng4CvP
         IYyZ4zle2fknS6IxVG2nGCA/4NW2Bys0sdRG+KLvPvFUu2jhEz07vSkaPC5I4taCngfd
         M54Cf0uFFX4sUlbwD4jbDU4aG52msqAIwZZAgan/5/kbUWsEL3Hu9pJK5Hu+YCbA7aU/
         htQYs42DI190ZNVhMKMQEQlVMEAWIk6zGYTY/vIn1NER5SHg1n105HKp+zMryUWYQdYz
         aBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Me3uBy3nz24VlnsYg7ubJxvYpiVCyDYT57dyN5yHXWQ=;
        b=iCRazX56ZK0iO8+zZXnXkAOuWWVuYjrf3TpBcV6vTEzgndl91Df1rH5fH53N8rTjfy
         vfXVY8XboElzAWGUvYXEuPsC8mCIZi5A+f02sj0PY3CYixF+rwi4fSQ+XzmV0UoGoxwU
         ej204uM5PoU30hu8WBpxLDkYq/tE8gr/7lwuz6wI6qu0J6XtI55KKIoMWniunO6CefMc
         2CrWNzew8MUGAQY91H9zQpbUa8xPOpT+CybMcwy6oM8Y19a7gUMs1pe31k/Gh90uaXwS
         EGyjnjUahpx55GZqRAm1k1FKPGgRcKZvqVKQ6If8WLMwDCowcFmToBoUQcJRqK1ingCS
         Y5ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FklvIOcS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w191si2483170qka.211.2019.08.23.12.17.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 12:17:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FklvIOcS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1F3u-0002Cd-WC
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 15:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1Erh-0005wM-BC
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 15:04:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1Erf-0001hb-6j
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 15:04:48 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39743)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1Ere-0001g5-LX
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 15:04:47 -0400
Received: by mail-pl1-x641.google.com with SMTP id z3so6079266pln.6
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Me3uBy3nz24VlnsYg7ubJxvYpiVCyDYT57dyN5yHXWQ=;
 b=FklvIOcS5eH4CtRFKKVakN0tas8V8Gutu1c/n24hKC/+d8D6+W6OZautRwUxiQADId
 nJbHFm7ramD5VRELOezozDWEHwCOzBhk+zllh2QT1SynsAKkx76mBQLNaSNjc2Xfhkxk
 lz/iMWJ+179tiSIuwuOcYjfXk2Mkou817ygBrSkf3FWkvaY+VNQs9/KMauU2RVqC6mBC
 b6gOfAYP5GrEUvILNWQKwAz5vvxXfRZ3lNnCNTeaSDUggKlDoUqSPZio+3YeWII9U9EV
 l2u+ZRK2K3dqmrOMg7/V2pR55w8KyTHlGb+BdxID7/o0sOBlSJY9yZFICZ84kMcySQ90
 8k9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Me3uBy3nz24VlnsYg7ubJxvYpiVCyDYT57dyN5yHXWQ=;
 b=YBTremcNDRyCtvmYu4PiD2gQ1U5ysbLgzP5Dp4PyCVvOMM2vc4ogBa6psR22liYkeP
 wv4+No/RXBpAoArMdUd5XDock881PuGc6ygVDq6vNi/AGvF0s72fvPIlOwrM/yTbGadm
 kTIsaXJQChjsGEWDK8/Z2QuB2k1PRGltiq+7kzTBJfDmrmQnjds7per81f0vaGiXVG4o
 h+fnbLTVV3kY/fJq1ATCwBVU7OX1v3GReMdCgcoIQX144XVRY6n2Z8RNYzgtIqTOraiM
 c5x6oHbS+j1uLQLxwyRA8YdmnX+sNweB1Eetw/R0dpfs7Q/RTwrsf1PHk8cwIu2k3UP9
 MsgA==
X-Gm-Message-State: APjAAAXCltyx8QIxz974suk4XBQvU/DIclKGgbiip382II+wnkqDKBUO
 hnLcpvxcsUNTqdtDtM2Fh1acVA==
X-Received: by 2002:a17:902:8a87:: with SMTP id
 p7mr6501318plo.124.1566587085432; 
 Fri, 23 Aug 2019 12:04:45 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a5sm2901697pjs.31.2019.08.23.12.04.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 12:04:44 -0700 (PDT)
To: Tony Nguyen <tony.nguyen@bt.com>, qemu-devel@nongnu.org
References: <cover.1566466906.git.tony.nguyen@bt.com>
 <8066ab3eb037c0388dfadfe53c5118429dd1de3a.1566466906.git.tony.nguyen@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f0b797c8-7801-d2cc-5ad5-7bf7b46a790e@linaro.org>
Date: Fri, 23 Aug 2019 12:04:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8066ab3eb037c0388dfadfe53c5118429dd1de3a.1566466906.git.tony.nguyen@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v9 14/20] memory: Access
 MemoryRegion with endianness
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
 Collin Walling <walling@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oISNNNOLtWv4

On 8/23/19 11:36 AM, Tony Nguyen wrote:
> Preparation for collapsing the two byte swaps adjust_endianness and
> handle_bswap into the former.
> 
> Call memory_region_dispatch_{read|write} with endianness encoded into
> the "MemOp op" operand.
> 
> This patch does not change any behaviour as
> memory_region_dispatch_{read|write} is yet to handle the endianness.
> 
> Once it does handle endianness, callers with byte swaps can collapse
> them into adjust_endianness.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  accel/tcg/cputlb.c       |  8 ++++++--
>  exec.c                   | 13 +++++++++++--
>  hw/intc/armv7m_nvic.c    | 15 ++++++++-------
>  hw/s390x/s390-pci-inst.c |  6 ++++--
>  hw/vfio/pci-quirks.c     |  5 +++--
>  hw/virtio/virtio-pci.c   |  6 ++++--
>  include/exec/memory.h    |  3 +++
>  memory.c                 | 18 ++++++++++++++++++
>  memory_ldst.inc.c        | 24 ++++++++++++++++++------
>  9 files changed, 75 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
