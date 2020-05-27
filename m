Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1144880lfc;
        Wed, 27 May 2020 07:55:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHp+MWKsWOXoSyj13QXYR7v38mZw7m7LVqPWMFpXMJdEmFj6oppzXYF6FDN0sfbouRsLmj
X-Received: by 2002:ac8:3f77:: with SMTP id w52mr4481389qtk.161.1590591354780;
        Wed, 27 May 2020 07:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590591354; cv=none;
        d=google.com; s=arc-20160816;
        b=RXcJKBOsCqo0Ff3YSxtVqBeyrG6T9008WJ4xbzN/TISH+vzCVaHE6T9P31PLueYcQR
         o46SU7u+k5a+lr5POxSkMOy4CIr5pPSpex3u4CMIJelHlxS33tkpYVLFkgBbgN3uZmO1
         YGssB1sSt8L2mh9T5WGBu/HLfQ4zOjQezk1WBk46Uwkzhp7Y3KZaJBsYHy0YIwDHbho9
         WmWJxoCUdbLb8ClATTCFs+Ak6znRtxArrskOzcpz7qphjbz67cV29mm+tRg5Zdb3aeJT
         oea6RrwEUp/6WbJ+tRgmYUvRyOqP+3r/oMEMZI3iUt7oHnDxSsb3L2qvWZNgEbKvcIA2
         MD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lEeSe1IRBQZQTY6sUBsPJ4KCOPChUURqmIR/pMWuNyA=;
        b=EBVDhIpBbrkdTcduQr3gAfYiSHOnXQa8Bh/9ZPMbv57iYFrqfmAekDkCKaA5RoBh6Q
         yLevac4l5RluSCnMtjAePq5VE7bQjZMSOolhMCaY+tFuyQhKT6s11AHG0SPFN+GzdKQL
         X2jKooDgu9TB6byCTQNlA0AUVSIp4Hz5DOUHUIvyAw/TuC0wG7gKGx51HM3V9hDvwWlv
         ANsLGAwAsodxihVCHkI8poERkdAGITXbwPBPzxigAQxvWhCoa0H4cam51z524CETDF16
         7VqaBLwpBdt25AluJMEd8MVRTXRz3cKe7QUBTxSOfSgmq91IISqvKtWhbabAPfK6fFcu
         7y9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YRhpyv3d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si1734410qte.239.2020.05.27.07.55.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 07:55:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YRhpyv3d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdxTG-0002oN-6A
	for alex.bennee@linaro.org; Wed, 27 May 2020 10:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jdxS7-00017Z-EO
 for qemu-devel@nongnu.org; Wed, 27 May 2020 10:54:43 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43534
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jdxS6-0007nn-Cm
 for qemu-devel@nongnu.org; Wed, 27 May 2020 10:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590591281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lEeSe1IRBQZQTY6sUBsPJ4KCOPChUURqmIR/pMWuNyA=;
 b=YRhpyv3desd4DVSob51BuZRPBVCqumF+2hTYCMafsR4Ci0DzV0SgKZGKOLP4qPGKtdEUpK
 jRvkP3xLj81FqV1ZyhGxZzobW0XO/1nmcgZLohT1cHmMFKoNvsFukh2zjj0tVOU/GBpoTB
 L1SVsRHXl/kLv7o/RHKclAiND+WoBcU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-xwDPXHVbPZmxBwn3B1EBfQ-1; Wed, 27 May 2020 10:54:40 -0400
X-MC-Unique: xwDPXHVbPZmxBwn3B1EBfQ-1
Received: by mail-ed1-f70.google.com with SMTP id m7so10228581edr.5
 for <qemu-devel@nongnu.org>; Wed, 27 May 2020 07:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lEeSe1IRBQZQTY6sUBsPJ4KCOPChUURqmIR/pMWuNyA=;
 b=Zv2BnbX6KffvrTaRZqS2D24iuEPvxwOcZN6zu76jL0P4Otd5EeWOawiyr+FAqLS8ln
 t7ARitiaZKKbrYOvcoCrl3mEbdSA1ifh4npfn3bX8QARxtvceQZmV6aCr0AKDG0L4sMo
 59Km/dcVMvHsrOk4MvLYt+wS8Z473hJiVFYtDHBglw/gRqc/X2D4y8HPeOOegIrklE3K
 Sa0HRwmJ7D4hr/y4rRbGuIXhUv3IlH2eUrFewPBiaIwf0ngt1BIx9VoREnKWg3jXFUjY
 5xQBURwZ0T4vuZQaUIF26dEns2nd2DXktxTXwAv/WB2kxdg4eR+GhKD/azookechGLNG
 F1lw==
X-Gm-Message-State: AOAM530lePeno5gz91/AuGnUMDsobjVEb4tFwUmti66oPSy7apBTM/jx
 GS9dQZ+LbN2bAYhOCONZo3eveZ63uFHwFz9tn0OoXJwSA6QLe9S0aHQoIfp0udziRiZ21fEvyvN
 ioSYN8gw6a0JWBcc=
X-Received: by 2002:a17:906:bce6:: with SMTP id
 op6mr6320880ejb.337.1590591279023; 
 Wed, 27 May 2020 07:54:39 -0700 (PDT)
X-Received: by 2002:a17:906:bce6:: with SMTP id
 op6mr6320854ejb.337.1590591278625; 
 Wed, 27 May 2020 07:54:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:3c1c:ffba:c624:29b8?
 ([2001:b07:6468:f312:3c1c:ffba:c624:29b8])
 by smtp.gmail.com with ESMTPSA id f4sm3124661ejk.17.2020.05.27.07.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2020 07:54:38 -0700 (PDT)
Subject: Re: [PATCH v3 14/22] microvm: use 2G split unconditionally
To: Igor Mammedov <imammedo@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-15-kraxel@redhat.com>
 <20200521112921.641f12bb@redhat.com>
 <20200525114508.hhvyzjiqja6knz6l@sirius.home.kraxel.org>
 <20200525183615.5f8e67d3@redhat.com>
 <20200526044839.bncj6iltugnzgfmy@sirius.home.kraxel.org>
 <20200527142545.32e91049@redhat.com>
 <58ced517-1ad4-c895-afe6-fec690791f4f@redhat.com>
 <20200527162646.694b2d47@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cdeb8406-eb41-160e-817a-010241ccd457@redhat.com>
Date: Wed, 27 May 2020 16:54:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200527162646.694b2d47@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 05:46:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ac3ER03S1T47

On 27/05/20 16:26, Igor Mammedov wrote:
> On Wed, 27 May 2020 15:06:28 +0200
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> On 27/05/20 14:25, Igor Mammedov wrote:
>>>>   (2) we loose a gigabyte page.  
>>>           I'm not sure waht exactly we loose in this case.
>>>           Lets assume we allocating guest 5G of continuous RAM using 1G huge pages,
>>>           in this case I'd think that on host side MMIO overlay won't affect RAM blob
>>>           on guest side pagetables will be fragmented due to MMIO holes, but guest still
>>>           could use huge pages smaller ones in fragmented area and 1G where there is no fragmentation.  
>>
>> Access to the 3G-4G area would not be able to use 1G EPT pages.
> Could it use 2Mb pages instead of 1Gb?

Yes, probably a mix of 2 MiB pages and 4 KiB pages around the memslot
splits.

> Do we really care about 1 gigabyte huge page in microvm intended usecase?
> (fast starting VMs for microservices like FaaS, which unlikely would use much memory to begin with)

I honestly don't think it's measurable, but at least in theory we care
because such workloads could have more TLB misses (relative to the
execution time) than long-lasting VMs.

Paolo

