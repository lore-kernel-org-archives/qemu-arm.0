Received: by 10.80.166.35 with SMTP id d32csp792950edc;
        Tue, 1 Nov 2016 11:20:24 -0700 (PDT)
X-Received: by 10.98.214.20 with SMTP id r20mr5188532pfg.59.1478024424209;
        Tue, 01 Nov 2016 11:20:24 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id bf12si26414464pac.239.2016.11.01.11.20.23;
        Tue, 01 Nov 2016 11:20:24 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753115AbcKASUW (ORCPT <rfc822;xinliang.liu@linaro.org>
        + 7 others); Tue, 1 Nov 2016 14:20:22 -0400
Received: from mail-ua0-f172.google.com ([209.85.217.172]:35454 "EHLO
        mail-ua0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752292AbcKASUV (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 1 Nov 2016 14:20:21 -0400
Received: by mail-ua0-f172.google.com with SMTP id 12so135506604uas.2
        for <kvm@vger.kernel.org>; Tue, 01 Nov 2016 11:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=gO2XkKEdEPg63nHbJBFuGr49Km4bRkZ1woPC51TsrjY=;
        b=GR6n0rQsnFAZS06ShfqFg/or8AQn1muX6yNgZ1Kg9O1rCLCL0gpd/csmfwH3e0LsrM
         qrQWEsaDZ8LwtwqY2Ande+iVedsqb5YQ/VQGCwlF7pHMLUHd4w9aR86Pp1NMVr4DWf0m
         9MfKdYzxYiPZ26HaVbgyMRVcHwUG3W9SZlXd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=gO2XkKEdEPg63nHbJBFuGr49Km4bRkZ1woPC51TsrjY=;
        b=GJLIlbv9kV3M99pGdZlf12VT4dbNGSLzvxchx3LBUbd24B4z3htVOBERK1CFNcy3sz
         dkq7cw+NuP6bWb2xL0UlXLTylcx04byHrz1nCHgf9HEYPZVrCwL+L3Zpx2QlRCJZf6MO
         xEzL34/cZyOgpuyw5FpwqA8C9hJbMKxaQsFgaKf96GOmOAnKp0zX6aY6Sb40883wvNFb
         /ZrHdsrsAaI2pjILmJ0gAt/GshuouF+VQwCkyGcLiul0zqj/Rc2bTPuMoylfhWpzObFv
         MD2tnLbc+EODam2ywpIFdV2fKKD3cf/6PUhRQtYTY4sC8QFVQ917UqOrIqIMkN+754eL
         5Jjg==
X-Gm-Message-State: ABUngvc6dcqwg0k8PWcnKi27FmAGWUW7G4xy+Nfo9aJFdS+tlZgdUofrWI8acUIRQ6KfKVGipt5gd6gVC418xWUz
X-Received: by 10.176.2.110 with SMTP id 101mr8167907uas.8.1478024420065; Tue,
 01 Nov 2016 11:20:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 1 Nov 2016 11:19:59 -0700 (PDT)
In-Reply-To: <343970da-014f-2edd-d865-e20293e32f78@suse.de>
References: <1477775449-115472-1-git-send-email-agraf@suse.de>
 <CAFEAcA96Cqfk4QEok-nEV28wnv6BJavgc9XWJVTWmJxi2RbrCw@mail.gmail.com> <343970da-014f-2edd-d865-e20293e32f78@suse.de>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 1 Nov 2016 18:19:59 +0000
Message-ID: <CAFEAcA9s=S45LOYTUUMJejCaZy2gvuhbqr6OETsDS4RmHoGqPw@mail.gmail.com>
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
X-TUID: kXKeLft2ZPpZ

On 1 November 2016 at 18:13, Alexander Graf <agraf@suse.de> wrote:
> On 01/11/2016 11:19, Peter Maydell wrote:
>> Is there a cover letter email for this series ?
>
>
> I figured that the set is so small that it didn't deserve one :).

The usual rule is "one patch: no cover letter; more than one
patch: cover letter". Forgetting the cover letter is a good
way to cause a patchset to miss my to-review queue, because
it's the cover letter that I mark as "to-review" (and gmail
doesn't thread patchsets).

thanks
-- PMM
