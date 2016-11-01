Received: by 10.80.166.35 with SMTP id d32csp581258edc;
        Tue, 1 Nov 2016 03:19:30 -0700 (PDT)
X-Received: by 10.99.219.81 with SMTP id x17mr48500148pgi.138.1477995570168;
        Tue, 01 Nov 2016 03:19:30 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id x5si6652361pgj.136.2016.11.01.03.19.29;
        Tue, 01 Nov 2016 03:19:30 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1168438AbcKAKT1 (ORCPT <rfc822;xinliang.liu@linaro.org>
        + 7 others); Tue, 1 Nov 2016 06:19:27 -0400
Received: from mail-vk0-f46.google.com ([209.85.213.46]:34131 "EHLO
        mail-vk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1168421AbcKAKT0 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 1 Nov 2016 06:19:26 -0400
Received: by mail-vk0-f46.google.com with SMTP id x186so67083848vkd.1
        for <kvm@vger.kernel.org>; Tue, 01 Nov 2016 03:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=gygPn4dCZ1tnU6NP5wmDQyYihmJCZofXl0v+tAuK9js=;
        b=L9NoiWQvQHiv+BOC2gLtEqVLolAA8/8vz26gDqR7lywVEoJxAP0PiXTDL4rVAl+iI4
         HWfgNT/1r/bT/VlEORaGyLxClgeQyU/aIyD+jkT0cQodGLI+0uKBiheXSImV8EUzMO5n
         HlHeCCtUqmFVcVpnhfWpv3UcRCDRdWUwScs70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=gygPn4dCZ1tnU6NP5wmDQyYihmJCZofXl0v+tAuK9js=;
        b=Yy0sMRKstmCVV9l8jNsOdo7DXgwpE9F6S1uGjNrRfCwUyfZho+raUFjvmZSgo2+jxU
         Uvw8xWtW4y7zeYYTCke/cvUZS+NMgTYjUyE/pIujPD158PkfF/7C01M1okYi69WYte2R
         gJKh1RO/zllyyGAQqnLTP3z1LYWdu5/K4jo0HZfyPd76dZeide6qWyMr33YC9egvhQIp
         i6i87qA9ZQ8enKrIn3tLoiZUUh1kkVzZ9GI01WV7reb/jI0AvhC4XMpUBbggzjeErs4u
         e4cZX6XlAkhghnmN3bKwkx+maafVsoCnep4OS3cX3Vt4bZ6GoMlJEvNLxpqNgDdC7S2U
         B7Qg==
X-Gm-Message-State: ABUngveF6yaJ09sQHvVMX3UTdE7IcyzJChaWN51mw9fR6ppG0X32SphZ0kWydE6+Sn9GgJjbXr31AcXwI8Vftjo4
X-Received: by 10.31.16.36 with SMTP id g36mr17461334vki.170.1477995565861;
 Tue, 01 Nov 2016 03:19:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 1 Nov 2016 03:19:05 -0700 (PDT)
In-Reply-To: <1477775449-115472-1-git-send-email-agraf@suse.de>
References: <1477775449-115472-1-git-send-email-agraf@suse.de>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 1 Nov 2016 10:19:05 +0000
Message-ID: <CAFEAcA96Cqfk4QEok-nEV28wnv6BJavgc9XWJVTWmJxi2RbrCw@mail.gmail.com>
Subject: Re: [RFC 1/2] linux-headers: update
To:     Alexander Graf <agraf@suse.de>
Cc:     QEMU Developers <qemu-devel@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>
Content-Type: text/plain; charset=UTF-8
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: cscUVqo0tzGX

On 29 October 2016 at 22:10, Alexander Graf <agraf@suse.de> wrote:
> This patch updates the Linux headers to include the in-progress user
> space ARM timer patches. It is explicitly RFC, as the patches are not
> merged yet.
> ---

Is there a cover letter email for this series ?

thanks
-- PMM
