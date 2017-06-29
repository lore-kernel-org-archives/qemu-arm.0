Received: by 10.25.227.6 with SMTP id a6csp4492219lfh;
        Thu, 29 Jun 2017 08:22:56 -0700 (PDT)
X-Received: by 10.84.175.3 with SMTP id s3mr18506721plb.105.1498749776257;
        Thu, 29 Jun 2017 08:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498749776; cv=none;
        d=google.com; s=arc-20160816;
        b=YV2ylj2npNmWmDTNOqz52UAEGNX1cNy7N+3v4KNkEi5AInFb5yB6HCnz06owTnU01j
         R6WUhNQBVo6jqAAK0fdL72XTuXBDfcyk/tYGWzzGPa5PqekLg+arBCvHwJ/hNOoPRBjo
         Dszm4Srv0Wo0DLx+/sAlupub8H7YPIfdAVTYCcvFAkynHIYmouaoGjTzZztYRSScEUq4
         NPC1nSqtEmz9ZoD2JHkZVIc7cJJ/w85964q3HSHZsOqxXBCCh9ONYhBWFOcy7HXIfrA3
         xLqCDjrbv2JOUgc9FtDbXiUAaiP1MSI174bvrAivjzTVWncvHmYtnVHKsHYMgjWpXLiO
         RbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=TgweJEvGok0xa//dO9cLQ2u5Z972ULkjffFxmz+CHBA=;
        b=uVGI7k0hlpFpyUIRQPGBMji6oB3xljRlevNbbzsSqKHt4EmNgMun6YvREDz0SvijFo
         SLpO3q7ne3zYa8c3YCTrMr3a007UQmwW+WupeKVDDCKo41k7mKnaSfN1M0LcvdEY6E7M
         rvBCOpW8Zv3cATv+F8XwvtvR5y2FAP4s0ZPL57Id5Ev1+yuc7In8K4nOMpsPiqj+4Mdv
         pTNIb82ZcRRIuSzek78b0l2zyetzNJDudukj2JGIjBvJ850vHttGjHC0dosoRUzIP7vp
         dKJ2UmB2NlesaxoC4abJyxx+KA2e79L3Zkadr/GP962xg4Rq4mmbYRzeLJiJ14TaKPSR
         m+RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=FkFEhKp9;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g34si4147717pld.336.2017.06.29.08.22.56;
        Thu, 29 Jun 2017 08:22:56 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=FkFEhKp9;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753560AbdF2PWs (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Thu, 29 Jun 2017 11:22:48 -0400
Received: from mail-wm0-f43.google.com ([74.125.82.43]:37956 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753519AbdF2PWl (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 29 Jun 2017 11:22:41 -0400
Received: by mail-wm0-f43.google.com with SMTP id b184so18463066wme.1
        for <kvm@vger.kernel.org>; Thu, 29 Jun 2017 08:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=TgweJEvGok0xa//dO9cLQ2u5Z972ULkjffFxmz+CHBA=;
        b=FkFEhKp9ejNYI36w1Ido0lPtUR9whjgeUfQFe/01UdmFtX5SHoGPmzIVMcMnBYX3hR
         U+be/YQgJ5ODaCRNdiP4dhDdsj50untzZRlCWRGZfqQ3r4BLtWdoY8Z/gO7bPblm1ad1
         3XAP9BdMz9WSAiIk3j2gzEAgUhwEY5DFmLXPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=TgweJEvGok0xa//dO9cLQ2u5Z972ULkjffFxmz+CHBA=;
        b=ceiXGJ/LF7VfP9nIUT4EwIdAobnifqpohZ97uOHMgUaQCQwBcPVDyGSpGToE0JjiuV
         5yWV2YvHA5J0Ztq/+0UeHEZxfv36K+PXnz1gX9YNCDnlfeX0LC48KTb3poLqBg/IsSZ0
         z1YE95VvU34/1QMezkb0C9eLlVU7L2/zwNixVi8DyfckqQpGk/y6ZYljt1IDI3yvTAuk
         1lf2YJxf2YtaPAQ871UgMrxsgioGnR1KdSBF/++HMWNJ4R9Ql35LSNJV9xCtCwtlOnb2
         8ZZUvhk/R4T82OaSIsA3q4565+Hk/tlWb9mIg33/7DoYWPIygo8M3hzU09icuwBhpBoe
         c3Wg==
X-Gm-Message-State: AKS2vOx4SAzOZeLfZX3IY8LuY0tVYt+spMQuyNUNxe7Ddkeh7TkwkeRe
        BzsivHU7RJEz8K36zAdyLjVdFettX+OX
X-Received: by 10.28.66.23 with SMTP id p23mr2361132wma.38.1498749759298; Thu,
 29 Jun 2017 08:22:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 29 Jun 2017 08:22:18 -0700 (PDT)
In-Reply-To: <1498577737-130264-1-git-send-email-agraf@suse.de>
References: <1498577737-130264-1-git-send-email-agraf@suse.de>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 29 Jun 2017 16:22:18 +0100
Message-ID: <CAFEAcA_fFgcZb0Zrhn3gN0bYd6JjAzyzRdn1fbqDzp_1=G_ebg@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: KVM: Enable in-kernel timers with user space gic
To:     Alexander Graf <agraf@suse.de>
Cc:     QEMU Developers <qemu-devel@nongnu.org>,
        kvm-devel <kvm@vger.kernel.org>,
        Christoffer Dall <cdall@linaro.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: q9xLS8JQYQ3D

On 27 June 2017 at 16:35, Alexander Graf <agraf@suse.de> wrote:
> When running with KVM enabled, you can choose between emulating the
> gic in kernel or user space. If the kernel supports in-kernel virtualization
> of the interrupt controller, it will default to that. If not, if will
> default to user space emulation.
>
> Unfortunately when running in user mode gic emulation, we miss out on
> interrupt events which are only available from kernel space, such as the timer.
> This patch leverages the new kernel/user space pending line synchronization for
> timer events. It does not handle PMU events yet.
>
> Signed-off-by: Alexander Graf <agraf@suse.de>
> Reviewed-by: Andrew Jones <drjones@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
