Received: by 10.25.205.13 with SMTP id d13csp2195335lfg;
        Tue, 13 Dec 2016 05:21:14 -0800 (PST)
X-Received: by 10.99.111.78 with SMTP id k75mr177284687pgc.114.1481635274447;
        Tue, 13 Dec 2016 05:21:14 -0800 (PST)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 63si48026312plf.32.2016.12.13.05.21.14;
        Tue, 13 Dec 2016 05:21:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753260AbcLMNVN (ORCPT <rfc822;xinliang.liu@linaro.org>
        + 6 others); Tue, 13 Dec 2016 08:21:13 -0500
Received: from mail-vk0-f53.google.com ([209.85.213.53]:33218 "EHLO
        mail-vk0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751567AbcLMNVL (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 13 Dec 2016 08:21:11 -0500
Received: by mail-vk0-f53.google.com with SMTP id 137so60719616vkl.0
        for <kvm@vger.kernel.org>; Tue, 13 Dec 2016 05:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=vV72AwBFPF66HA+DSv2dSDNfwWll3NDy3PGyljpV1Es=;
        b=DscQMWXjxYaMlyGuNn2r/NPYchUtO+lZc1j2WFFBbTJDuoRMYMk+Be8smhydkK5UEu
         oyip9QgR30zqQ55H645v8AY6Ox9p9+hhPMmpFKz5dXlamjKVTbgvwwHEttgP0b7AD9jz
         7ECi58NUDF6JNuW77vaoVg62Jv91FalZRSUjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=vV72AwBFPF66HA+DSv2dSDNfwWll3NDy3PGyljpV1Es=;
        b=koQcZ8lCK9sxrEwiSJWScS7HID7Cvr3ph/Wv6pXwsLGAG3Jh3XpVT3/GLLv8Oj8YfM
         TOvq1IsNEk2ZKlVFLl7cLzyjmM5r3uOI+/LOecE1R6RLamua5qyl4/MT9XrW/1UKHiOJ
         yU50qHsKmyOuTzV4qih9izUpGU7HaFLcimL3pXRtvOFVgeAuSW3URBQUdHpMW+6urCRz
         KQz1zmwMzX8Tv5se/jIl5r8vjIkF1qY5swxVdShIZ2aQ9MD9KWyWAgzucQ6vn81F/Zr4
         viyklmlRdnBN79vCTVKCqdugGBOfxTiswB8WJTfuKOcSflFhojdDy5DN3jAvVCPzeB8H
         55Ug==
X-Gm-Message-State: AKaTC00yD4KJQAQvqmJ8n8pBu/t2TyfJXWXBaWBjta67YPUd4y30PqV2LVfCHt1WpyE8KGRQHRsjbcgSNlpA8WUc
X-Received: by 10.31.7.204 with SMTP id 195mr41006612vkh.175.1481635270467;
 Tue, 13 Dec 2016 05:21:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 13 Dec 2016 05:20:50 -0800 (PST)
In-Reply-To: <1479133935-63848-3-git-send-email-agraf@suse.de>
References: <1479133935-63848-1-git-send-email-agraf@suse.de> <1479133935-63848-3-git-send-email-agraf@suse.de>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 13 Dec 2016 13:20:50 +0000
Message-ID: <CAFEAcA9yW+pOcdE6d6-FUxtVZtEcEXZyEkjwACZa89CbnJ9Y8w@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/2] ARM: KVM: Enable in-kernel timers with user
 space gic
To:     Alexander Graf <agraf@suse.de>
Cc:     QEMU Developers <qemu-devel@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: WR+RDWZylVCX

On 14 November 2016 at 14:32, Alexander Graf <agraf@suse.de> wrote:
> When running with KVM enabled, you can choose between emulating the
> gic in kernel or user space. If the kernel supports in-kernel virtualization
> of the interrupt controller, it will default to that. If not, if will
> default to user space emulation.
>
> Unfortunately when running in user mode gic emulation, we miss out on
> timer events which are only available from kernel space. This patch leverages
> the new kernel/user space pending line synchronization for those timer events.
>
> Signed-off-by: Alexander Graf <agraf@suse.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
