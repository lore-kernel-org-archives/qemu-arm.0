Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4955507wrg;
        Tue, 25 Jun 2019 06:16:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/MYdgpNJA6as2lGu4MEvD1EofaJbGITpD6AePxJYgH/MzSPEzaV+InHypL//Ja+r6E6Uu
X-Received: by 2002:a17:90a:d996:: with SMTP id d22mr14747494pjv.86.1561468589358;
        Tue, 25 Jun 2019 06:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561468589; cv=none;
        d=google.com; s=arc-20160816;
        b=wUOJj+RX9M6usgKARNaXjRpAOADma42tWymbZbOcZBf2URLNIMVC+HiTpHaC58bsgY
         3OfamznYTHiwQkmzjpfVuT4z2yoKxv+1JZsgW4yg9xqTkSj1vQlt787kCl0N53rp2Rfr
         hra1mfKg6/BX1LILXMdbKpyTA12DNdcvvKqoX1trPlyeYPIjzCcUniDQn7OFlDFe6KoC
         /w8HoCPWucg+F9S9pspsRGgwacE9qalf159+xUWvxID1JKXgovTM8nzzeanjS8EsC4tz
         KvudhvbXUVJ6pARI4ERsM1CPq7yVaAEsbQjBA/xerSEAch7M1cFcc/nDWyV7iPPx6BTu
         5uLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date;
        bh=nZQB+LuW6coAi+4g9PuksxZuW2zv/R9R3HWLug6QJ7M=;
        b=gi9W6bvufedeHrcnZ2PZTJZJaI87MB9iC8Gw4AIu5QdL59kSBAgBtCiSVnEu/5UOYh
         XGXr0h6OZ7VMDJLSm1e8xjpAgzFhvIInR9m3XkD+8aVMFLMa8dZ0FVrqO3cj0yOTWGG+
         rQ86nRX2atQCv6+yzKMjJt+cBGN1lYlNUXg30GslaqSeYAZ6E4utO9JiXDckQjpT2C2H
         jdVHAQMpepLx3QqfujwM7FlbvfV5uBk6GeEJeW072jk44ufDKQzJN5TnIi3/iPOFgXf0
         RZdfZRxHSZbHAmKGUP28o8rkc1h1gSJfBh4Vv2IHWeBWVinfx3JDiHQS6cw7nnZIYTfE
         ibfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v197si1936133pgb.29.2019.06.25.06.16.29;
        Tue, 25 Jun 2019 06:16:29 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfFYNQ2 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Tue, 25 Jun 2019 09:16:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56858 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbfFYNQ2 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 25 Jun 2019 09:16:28 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id BE3F030F1BDC;
        Tue, 25 Jun 2019 13:16:27 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2C4565D9C5;
        Tue, 25 Jun 2019 13:16:21 +0000 (UTC)
Date:   Tue, 25 Jun 2019 15:16:16 +0200
From:   Igor Mammedov <imammedo@redhat.com>
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>, <mtosatti@redhat.com>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: Re: [PATCH v17 01/10] hw/arm/virt: Add RAS platform version for
 migration
Message-ID: <20190625151616.12e46566@redhat.com>
In-Reply-To: <fbd558d5-03b7-df5c-e781-549261207221@huawei.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
        <1557832703-42620-2-git-send-email-gengdongjiu@huawei.com>
        <20190620140409.3c713760@redhat.com>
        <fbd558d5-03b7-df5c-e781-549261207221@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 25 Jun 2019 13:16:27 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: wQiRNlabuAP9

On Mon, 24 Jun 2019 20:19:12 +0800
gengdongjiu <gengdongjiu@huawei.com> wrote:

> On 2019/6/20 20:04, Igor Mammedov wrote:
> > On Tue, 14 May 2019 04:18:14 -0700
> > Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> >   
> >> Support this feature since version 4.1, disable it by
> >> default in the old version.
> >>
> >> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> >> ---
> >>  hw/arm/virt.c         | 6 ++++++
> >>  include/hw/arm/virt.h | 1 +
> >>  2 files changed, 7 insertions(+)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index 5331ab7..7bdd41b 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -2043,8 +2043,14 @@ DEFINE_VIRT_MACHINE_AS_LATEST(4, 1)
> >>  
> >>  static void virt_machine_4_0_options(MachineClass *mc)
> >>  {
> >> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> >> +
> >>      virt_machine_4_1_options(mc);
> >>      compat_props_add(mc->compat_props, hw_compat_4_0, hw_compat_4_0_len);
> >> +    /* Disable memory recovery feature for 4.0 as RAS support was
> >> +     * introduced with 4.1.
> >> +     */
> >> +    vmc->no_ras = true;  
> > 
> > So it would mean that the feature is enabled unconditionally for
> > new machine types and consumes resources whether user needs it or not.
> > 
> > In light of the race for leaner QEMU and faster startup times,
> > it might be better to make RAS optional and make user explicitly
> > enable it using a machine option.  
> 
> I will add a machine option to make RAS optional, do you think we should enable or disable it by default? I think it is better if we enable it by default.
I'd start with disabled by default as it's easy to make it
enabled by default later and we can't do so other way around.

 
> > 
> >   
> >>  }
> >>  DEFINE_VIRT_MACHINE(4, 0)
> >>  
> >> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> >> index 4240709..7f1a033 100644
> >> --- a/include/hw/arm/virt.h
> >> +++ b/include/hw/arm/virt.h
> >> @@ -104,6 +104,7 @@ typedef struct {
> >>      bool disallow_affinity_adjustment;
> >>      bool no_its;
> >>      bool no_pmu;
> >> +    bool no_ras;
> >>      bool claim_edge_triggered_timers;
> >>      bool smbios_old_sys_ver;
> >>      bool no_highmem_ecam;  
> > 
> > .
> >   
> 
