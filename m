Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5383898lfp;
        Tue, 11 Feb 2020 10:09:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwEKYD9Duu7k9rQUDNHsA7Y5VbwrKLS6c+ZdKnNGE/F6WEUxzU4jxwhDM9hr/nVXvbzIxag
X-Received: by 2002:aca:d544:: with SMTP id m65mr3703474oig.177.1581444555399;
        Tue, 11 Feb 2020 10:09:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581444555; cv=none;
        d=google.com; s=arc-20160816;
        b=Ovr8VJAVxp+9D4XDZw1lAfYSkUlrbOwsB1d8kRGxyo26U/cwcm4NuW+KHlg9nWLHle
         q0t0DpYhQiGgvcsfdVKHPTUmtWLEi7t4x1hKtQJbD8qR67ghTNuEDXCe7hbonCKUH6Xp
         8TdYY6MiVX1dfZNMUGxv3Z/V6Q16A8fhOXYMZt3vS5u14CDvW6Mhe60X8JHkw/jdKt+J
         ffLHM5cr2UfS6qglV4JEty7tLgrm/rQibb0rF7gH1uE7dZsQJ00GT/xwVf/w6DjMqFSZ
         EFj26MSmLrsoNNrEL/OI9nlSR0KGdIAUYLoCpo+tEh5rAlSflPlGwfroivB2xX6Rx3TY
         kCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=cvWT08/WflUIvbNwwiYodUIPz5SYW+7c7HDtxodvSyY=;
        b=VV+IAH0wXWiNY47jy3Vwb8C3tnzRy0FBUBMx+BPoe4zy/bYCxHOIMb2T1Qt9JHnjJZ
         FVxKHI+sNaV8GIZD+E6Clxx/wrty8FC03nyzp10EE/G3G5rMUWf59iCCpM0rSvp430By
         nXWqvL3I8G6tecbTjWN3y1oh9w6BCzftbfNQq3zk7i1bkaHDqigGKswzfR6ruhbkuBTf
         9k1hjT+RQUNUqwj5D3MGSZMWPqWodc5g3tdFjAAJsjieQE44JDBnKbVh6OnZBFL1sSco
         TyFwYUH4FZAVDGzw8kSsHjQK7Bh+wqiO/5GJVzNC1o6xBfj9R+Wm/e2iOZJLS2z0W0zM
         Y7kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="W6/RrsC4";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n7si2019456oie.95.2020.02.11.10.09.15;
        Tue, 11 Feb 2020 10:09:15 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="W6/RrsC4";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731144AbgBKSJO (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 11 Feb 2020 13:09:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55174 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727764AbgBKSJO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 11 Feb 2020 13:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581444553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cvWT08/WflUIvbNwwiYodUIPz5SYW+7c7HDtxodvSyY=;
        b=W6/RrsC4pwnN6zq1fVK73Kknq2zCFLHDpN8652dY/fYkWZE2PnBwPSCg7nHm8wSviac7s5
        a4RnW41/7p61Nedt1oxPVlwstJUUXB45RMfgyqDutVZYfJgPl9jmMskTFwk5104RnzQONU
        QLvrK7ncOv34AZ4yIgR9NfMK7Y5HhcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-OeXjBtt3PWWnfP3RTAnh4g-1; Tue, 11 Feb 2020 13:09:08 -0500
X-MC-Unique: OeXjBtt3PWWnfP3RTAnh4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC05918A8C8B;
        Tue, 11 Feb 2020 18:09:06 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id EB2A360499;
        Tue, 11 Feb 2020 18:09:01 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v2 4/9] arm: pmu: Check Required Event
 Support
To:     Peter Maydell <peter.maydell@linaro.org>
Cc:     Eric Auger <eric.auger.pro@gmail.com>,
        Marc Zyngier <maz@kernel.org>, kvmarm@lists.cs.columbia.edu,
        kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        Andrew Jones <drjones@redhat.com>,
        Andrew Murray <andrew.murray@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>
References: <20200130112510.15154-1-eric.auger@redhat.com>
 <20200130112510.15154-5-eric.auger@redhat.com>
 <CAFEAcA9rsncts+s4tVn4tY4zaMHKeqyJj1O4J=Ufx33fb=Nrcg@mail.gmail.com>
From:   Auger Eric <eric.auger@redhat.com>
Message-ID: <45a29624-764f-acb2-dcc8-294bc591032e@redhat.com>
Date:   Tue, 11 Feb 2020 19:08:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9rsncts+s4tVn4tY4zaMHKeqyJj1O4J=Ufx33fb=Nrcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: xOH6dYjySN5Z

Hi Peter,

On 2/11/20 4:33 PM, Peter Maydell wrote:
> On Thu, 30 Jan 2020 at 11:25, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> If event counters are implemented check the common events
>> required by the PMUv3 are implemented.
>>
>> Some are unconditionally required (SW_INCR, CPU_CYCLES,
>> either INST_RETIRED or INST_SPEC). Some others only are
>> required if the implementation implements some other features.
>>
>> Check those wich are unconditionally required.
>>
>> This test currently fails on TCG as neither INST_RETIRED
>> or INST_SPEC are supported.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
> 
>> +static bool is_event_supported(uint32_t n, bool warn)
>> +{
>> +       uint64_t pmceid0 = read_sysreg(pmceid0_el0);
>> +       uint64_t pmceid1 = read_sysreg_s(PMCEID1_EL0);
>> +       bool supported;
>> +       uint64_t reg;
>> +
>> +       /*
>> +        * The low 32-bits of PMCEID0/1 respectly describe
> 
> "respectively"
> 
>> +        * event support for events 0-31/32-63. Their High
>> +        * 32-bits describe support for extended events
>> +        * starting at 0x4000, using the same split.
>> +        */
>> +       if (n >= 0x0  && n <= 0x3F)
>> +               reg = (pmceid0 & 0xFFFFFFFF) | ((pmceid1 & 0xFFFFFFFF) << 32);
>> +       else if  (n >= 0x4000 && n <= 0x403F)
>> +               reg = (pmceid0 >> 32) | ((pmceid1 >> 32) << 32);
>> +       else
>> +               abort();
>> +
>> +       supported =  reg & (1UL << (n & 0x3F));
>> +
>> +       if (!supported && warn)
>> +               report_info("event %d is not supported", n);
>> +       return supported;
>> +}
>> +
>> +static void test_event_introspection(void)
>> +{
>> +       bool required_events;
>> +
>> +       if (!pmu.nb_implemented_counters) {
>> +               report_skip("No event counter, skip ...");
>> +               return;
>> +       }
>> +
>> +       /* PMUv3 requires an implementation includes some common events */
>> +       required_events = is_event_supported(0x0, true) /* SW_INCR */ &&
>> +                         is_event_supported(0x11, true) /* CPU_CYCLES */ &&
>> +                         (is_event_supported(0x8, true) /* INST_RETIRED */ ||
>> +                          is_event_supported(0x1B, true) /* INST_PREC */);
>> +
>> +       if (pmu.version == 0x4) {
> 
> This condition will only test for v8.1-required events if the PMU
> is exactly 8.1, so you lose coverage if the implementation happens
> to support ARMv8.4-PMU. Hopefully you have already bailed out
> for "ID_AA64DFR0_EL1.PMUVer == 0xf" which means "non-standard IMPDEF
> PMU", in which case you can just check >= 0x4.
OK thanks

Eric
> 
>> +               /* ARMv8.1 PMU: STALL_FRONTEND and STALL_BACKEND are required */
>> +               required_events = required_events &&
>> +                                 is_event_supported(0x23, true) &&
>> +                                 is_event_supported(0x24, true);
>> +       }
>> +
>> +       report(required_events, "Check required events are implemented");
>> +}
>> +
>>  #endif
> 
> thanks
> -- PMM
> 
