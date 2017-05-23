Received: by 10.25.0.6 with SMTP id 6csp1627919lfa;
        Mon, 22 May 2017 19:11:08 -0700 (PDT)
X-Received: by 10.98.0.8 with SMTP id 8mr17803510pfa.127.1495505468106;
        Mon, 22 May 2017 19:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495505468; cv=none;
        d=google.com; s=arc-20160816;
        b=D4Zmpw9vVTmeVlyHYSD+WW95+iJm7loe9tR3uL/lrpteYaRYqTUr8BXYkAJqDSxyW5
         PlyovyXVetytqiP0qrYu0N9VuklNDQRXNvql0KD1FCbbW0FCVnsPI/hQoDIV/LvtmoTm
         VIPymSDHXgW+a98GfvEZygcn15qdQd0xdQNN7tyXFz1f+zwMOZq3H01gIBS0UlspcrQv
         PHYy+2TnksVeTLtMt+wuzUJDlBkG++sSbDyscC+e0on42mXiuGOKVz1yhcuQLwLDHScv
         SU9xCKRVU/GIizmTFndJeX++SpBBIdWAe8cnDL9l7zAa4DUTfR75qw7ZDT4oq1ClEUKt
         +lyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=MmBQJZXWSvaI3Tnpztug2aSIWPchjgt8DDk9jAem620=;
        b=DmI/a2DM7174tFZm8hC7ie9+cgyEqpHpsEhXo9uKUv1uxHdgDGOKNe6NsDwRHolV81
         6Ztp0d+aazapN7B6e2fHXVWO/9HEO6HkECsytC0G/1rfcEYuaYat6FlSvZ5Pjbzz487C
         sVdo9QwO1dxa2TLzmZ2YKG6HIY7nu806eCF0U5K4eNxvFklY0U1noo3bqv4NAvc0oju0
         TUNiWP7rIHZXre1w1mr6RqPOssrl6WqBXk3iHoW2hqa/34bwoj5B4UDYqvt5F4qdqcSu
         FQa+5U/1SrzMsVkRovXcNRpEFquBZnCPdnjLSyhG8r7E1lAlVpKnM4QJOh3dznZNoyVQ
         Cdmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id h6si19986413plk.233.2017.05.22.19.11.07;
        Mon, 22 May 2017 19:11:08 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935905AbdEWCLG (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Mon, 22 May 2017 22:11:06 -0400
Received: from mail-wm0-f52.google.com ([74.125.82.52]:36624 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933119AbdEWCLF (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 22 May 2017 22:11:05 -0400
Received: by mail-wm0-f52.google.com with SMTP id 7so10032346wmo.1
        for <kvm@vger.kernel.org>; Mon, 22 May 2017 19:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=MmBQJZXWSvaI3Tnpztug2aSIWPchjgt8DDk9jAem620=;
        b=ALjiO6T719JB184a7aQeyrM/Hn9L/vQ31CXggCM9dYvLETsRcNYKBQLaliThJBU23O
         nyJde2x5HQBT9db3xAfFrBnJc5r+DU5aVwPnl+/eAMHDt60w7jHU+z/ysuT+PdDZ3/YV
         uXdg7yiAq60xY/IGhHPWk+tN3FNhqDzAp3kjMMNC3kZ9ol/xc4Nz0Vz26MSV32WthKoH
         cVjptz0fca97VctasMBG/fNLnN9j2aXaDVZM/PyjhslUGA93iP+2Vk4ha5OTi0HWQ6rg
         3NZG4ds5rE0YD8Vwhy20+Wgee1eKUSNSYMUw2/+k57cTcQHwI/roBLuYr1irZWGQN/WC
         kf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to;
        bh=MmBQJZXWSvaI3Tnpztug2aSIWPchjgt8DDk9jAem620=;
        b=IStESF9TEHqpWV/vGVWc47+STPzAbBnVuPg84paP/podib19T9ypv6dhF+R2SSOtqy
         fGY3kxifWJKJUszFOVGwIKrG6KmCzWIq7UCZwvlXh5M6ZAMXZocLLnv2H+UZMn3wNbWG
         aWJETcjxJMKDbfok6ieHyGHGNQT+aPNfYT825x5OvMBm82QGEID0DiTvIsOIijSkI797
         o/LI6cy3a9MAVjRa5S4eja0Shed2269/33M8JDxxAEvrS/2cY85fhUALI/t3VIXgZKl1
         DdVeJUc5yrPdJIQTU0Vd3x52E59pbDSlw+3HTLstPBPBWLobV79OhbxqUJwxYmb6Ti2J
         3jwA==
X-Gm-Message-State: AODbwcCz2K94oStVeHiNwD69g9SF0smblvly+qdbpzbgLEU8wJnJXtj0
        1BOb1hCyLGM/tGRVUrTquzrAxBu2pDue
X-Received: by 10.80.143.227 with SMTP id y90mr12492994edy.131.1495505463979;
 Mon, 22 May 2017 19:11:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.13 with HTTP; Mon, 22 May 2017 19:11:03 -0700 (PDT)
In-Reply-To: <CAD8of+qgOQyU3QBk6YmPd4RnXQV0W-T4AE868q6y7TkCwu1K2A@mail.gmail.com>
References: <CAD8of+qgOQyU3QBk6YmPd4RnXQV0W-T4AE868q6y7TkCwu1K2A@mail.gmail.com>
From:   Li Zhang <zhlcindy@gmail.com>
Date:   Tue, 23 May 2017 10:11:03 +0800
Message-ID: <CAD8of+rqi28HsV+6UYEa_hV-0SmUH4u98RgCabN17yNquqJgFw@mail.gmail.com>
Subject: Re: A problem of IRQchip in QEMU and KVM for ARM
To:     "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        qemu-arm@nongnu.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: syPVXXFwLqOl

Any idea?

Thanks.


On Fri, May 19, 2017 at 1:46 PM, Li Zhang <zhlcindy@gmail.com> wrote:
>
> Hi,
>
> I am looking into QEMU code in ARM recently and trying to add add_hot_cpu in QEMU for ARM,
> but it doesn't work when enabling KVM. It reports error:
>
> "kvm_init_vcpu failed: Device or resourc busy."
>
> By debugging QEMU with gdb, it failed on ioctl. In kernel soruce code arch/arm/kvm/arm.c,
> vcpu is created by this following function, it will report -EBUSY if irqchip_in_kernel.
>
> struct kvm_vcpu *kvm_arch_vcpu_create(struct kvm *kvm, unsigned int id)
> {
>         int err;
>         struct kvm_vcpu *vcpu;
>
>         if (irqchip_in_kernel(kvm) && vgic_initialized(kvm)) {
>                 err = -EBUSY;
>                 goto out;
>         }
>
>   ....
> }
>
> I set virt machine with kernel_irqchip = off, it can execute cpu-add interface correctly with qmp-shell
> commands. But VMs still can't work well with kernel_irqchip=off when executing "info cpus" in qemu monitor.
>
> My question is that:
> 1) Can we change this error status in kvm_arch_vcpu_create?
> 2) Is it that irqchip_kernel=off  isn't supported with KVM enabled on ARM?
>
> --
>
> Best Regards
> -Li




-- 

Best Regards
-Li
