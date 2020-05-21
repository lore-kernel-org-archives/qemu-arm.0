Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1686902lfb;
        Thu, 21 May 2020 08:45:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf8JdWJgzwQcXUMq6Kp1l2ZjdPTk+1RE4bhoqdsD0L7SHiuV90A02TQeOD5LWClCIHploN
X-Received: by 2002:a17:906:3041:: with SMTP id d1mr4266208ejd.7.1590075956584;
        Thu, 21 May 2020 08:45:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590075956; cv=none;
        d=google.com; s=arc-20160816;
        b=p/GegYtzRQLkEb0Te8ZGyWMqdNZkVkmLxIs9QqMWpLjM2k0YrgVVIFgEr3FqUIIIbW
         I0NSxq67n/3QGBS46/NCIBoEjjBedW8yZn2rdoH4CE4KI8O5YnKc1F8uCxAAJ2BmKwnk
         6S0q2EzgcdzvDu15cGS+Vo9zLvV7taVr1ApzuWS2zhHCkgNHZXilCqv6Vsg32VkVrcvN
         lckNCZFNMffZu9hSpyL3gH9Vj8VR2JvbDFQWm7nytakdmsaGG3lI3O02arb82PA2f0BW
         V76wqCk4GE0FX8besHGrsc3I2KD5tZXl5PMyQPNkn8BzYS59jvTbnrEvEpL+pqnRsBPC
         hhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8h1ZPoBxJvuQvx2ziXpdx/NQiUgWmqZ1hoQbkwoXnSQ=;
        b=zT8xkDUq6JzB3DS4+JaqmFt+88LJ4rm7tXvfblUFb7g2BrkKuPJeGaTAinKXb6glg4
         FhE9NLuDWo1SZqL7yf7yw7CTWTQpcWFMQBGvp3xNA/KObFIVk4+5fSsyN/wM0fNQIgtt
         YKgNphLW+A8kHqcj4DlxeU7roY3Jzi06+taGU3V54cC9e7CxeEgXU3iB8IoTTfrq4Sgh
         rBNdaRDwpK7Ry3mW+w6dHHhAwG6eDx3Dt8GGPkVbZkCT/cY18Sciujmb10/DymNUm3AF
         JSUmZQmeZhutp6THkekUPCmt9n2fcczV3m45qhrimV0wQjTl9fmhrMVBrhT5mDfT50jC
         IGrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SlQZLiB4;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id d31si3444608edc.462.2020.05.21.08.45.56;
        Thu, 21 May 2020 08:45:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SlQZLiB4;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgEUPpz (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 21 May 2020 11:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbgEUPpz (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 21 May 2020 11:45:55 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F14C7C061A0E
        for <kvm@vger.kernel.org>; Thu, 21 May 2020 08:45:54 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id p123so1522766oop.12
        for <kvm@vger.kernel.org>; Thu, 21 May 2020 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8h1ZPoBxJvuQvx2ziXpdx/NQiUgWmqZ1hoQbkwoXnSQ=;
        b=SlQZLiB4OFUSMtrURCnULNta22198oi+Z5RQAyBqo38LQk9Wha8N10/YPkuBWPYcSV
         v0dSGU9HBPNNIrm+eyaZTbxOTlAN/5UVuXo/cRYgucmP/HGV5nChW+Q00R9WpbIoCX6x
         PnDtVFdl4tD0EDId0iZ4Y8lp9MVazgA3g1/JGyZzN5QoT2KYF2uaj3bXRr4B5IhSI9Ix
         A+ZRl1caqAKOoRzSsN2cMlYXlQA5F+VlGNFj5+2ufUKqgS/NXx0aew8IzlZBikCPtrD5
         bMgxLoeMq5bcK8G35nZBb9ubrSzNanS+gwpQBB9ZWi77//UAfqBJZd82VOxRt5ykYr9O
         2Ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8h1ZPoBxJvuQvx2ziXpdx/NQiUgWmqZ1hoQbkwoXnSQ=;
        b=Km85YAtIGK5lxf81rCBs+ejWMZRz2SnGJtYzoxnw68QMZ8+tYfA9vmeOtaEZrZblcx
         94xwb4nXVsNQ5h4RHPin0gusf1E0kj0peKX1lhlo/uN+hmKYB1FQ23Ut5wOvYfwBSfJo
         SZoLuHQIbbdPUrGRpSzakzehJkbIG/cJAFrbPksIVmWK2m2XhiXAl2NBoLQUOFhF3fkx
         xQReVyPx4I4RZikncYVOmoujtoNrUhHtYNchXwBO3jjCOezxSMMYrn1HFmtAluiaXNZI
         8Opi7IH97L3JnBJl4cGUWzVmFdH6BCcO0kf/Zb/Bx7XmQSqetAKt5ExfG5w64atghNug
         nbmg==
X-Gm-Message-State: AOAM532bfOhBxUao/u6fIwFzLClsw1iOQwJNRY2dcSXdsvJmb27Qp29i
        gjaSiHjE9zET0jw14Nm7aLgRWJxCCnCPg9ZcfbcdFQ==
X-Received: by 2002:a4a:8253:: with SMTP id t19mr7809624oog.69.1590075954348;
 Thu, 21 May 2020 08:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200518155308.15851-1-f4bug@amsat.org> <20200518155308.15851-7-f4bug@amsat.org>
 <CAFEAcA8tGgyYgHXT5LVGz675JMq6VWR56H++XO5gtTrcaZiDQQ@mail.gmail.com> <0c0cbdc0-a809-b80b-ade3-9bdc6f95b1a8@redhat.com>
In-Reply-To: <0c0cbdc0-a809-b80b-ade3-9bdc6f95b1a8@redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 21 May 2020 16:45:43 +0100
Message-ID: <CAFEAcA_WOEeV53yr7SmWqyOnbfWYg3COr-C+mjaCuAPw=refcQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/7] accel/kvm: Let KVM_EXIT_MMIO return error
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: h5yxfPGx0NyC

On Thu, 21 May 2020 at 16:39, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 18/05/20 18:01, Peter Maydell wrote:
> > The "right" answer is that the kernel should enhance the KVM_EXIT_MMIO
> > API to allow userspace to say "sorry, you got a bus error on that
> > memory access the guest just tried" (which the kernel then has to
> > turn into an appropriate guest exception, or ignore, depending on
> > what the architecture requires.) You don't want to set ret to
> > non-zero here, because that will cause us to VM_STOP, and I
> > suspect that x86 at least is relying on the implict RAZ/WI
> > behaviour it currently gets.
>
> Yes, it is.  It may even be already possible to inject the right
> exception (on ARM) through KVM_SET_VCPU_EVENTS or something like that, too.

Yeah, in theory we could deliver an exception from userspace
by updating all the register state, but I think the kernel really
ought to do it both (a) because it's just a neater API to do it
that way round and (b) because the kernel is the one that has
the info about the faulting insn that it might need for things
like setting up a syndrome register value.

thanks
-- PMM
