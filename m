Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3538830wrp;
        Fri, 27 Sep 2019 07:03:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5gy2DVYv5vzHHkGWVzK2j+Yf8ybEvt77wlSngFDx3sAK/R+lw8MdO9j6bEnBmoyreZFZl
X-Received: by 2002:aa7:c614:: with SMTP id h20mr4586171edq.209.1569593039452;
        Fri, 27 Sep 2019 07:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569593039; cv=none;
        d=google.com; s=arc-20160816;
        b=pKWXNYC/+8XjPOIvIFYTUcdJSIaHK/A+0LeHidXFOWJHGm6CwjmeP8aMZkPFdjDzQC
         A99iayx8w0GcoG3woG+aG4O21Nq7jpwH4JoMbjnaVTKXrCNUkAuuj7T1IexzIwr9fbJS
         vgY8SrVco/Y5Lm1xAF/m2I4s4BkKNERb7eyUdzuFqU5h1+ay6Fs1ZunDgKmA1OPz9E0r
         y75P4zXHO/zaW+pvJ0SdyjGxsDbMT8nToDVfGFdeQJGVIuRAMF1PpEQMZ1EfPhW/fMpq
         0fs+3FMKZp+lRO7+ikHQrorapIDSiiU+BeSaMcP2qMa0v0lfOyurQBHDEiGUiujpXY96
         VKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+Xs4DziX2kpdYgxtkDru2a37dM2G00+Xc8J5f0/eIcY=;
        b=A4jRkL5mKjReOgIP4di86h8XvAG/RZNgA1zQ/YbjGCtoa0LnJgLhTjrJQdH+c4n+Fw
         kRDjuVsCYf5lN+dBbWjbWdZbNlmc2QY3W2Tk/GJ49YZPolFPn8eh3iHtNrYavhHgJCXM
         BsTRdf8Vanp0dvoyX8K4TCTpz1NxLKmmkhAJ+sKFuVbDUpcqO0vo1/bE+tlLIZ81LCgP
         gwrlRhKwgFpLGGz6w/QmeKvC3/1p1xoqOtpVoW1HbfGOqYm8jCe/eNjsyWmH6LNBJbFw
         +WNce2+RCJ4fuAZAssqu7NU+yP/0l9JHzKJxggkvFWebnpPC+32j5t20SyvnTzNh4zYv
         GH6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vvGA2OAw;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j18si2816429ejv.201.2019.09.27.07.03.59;
        Fri, 27 Sep 2019 07:03:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vvGA2OAw;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbfI0OD6 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 27 Sep 2019 10:03:58 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34694 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbfI0OD6 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 27 Sep 2019 10:03:58 -0400
Received: by mail-ot1-f66.google.com with SMTP id m19so2350575otp.1
        for <kvm@vger.kernel.org>; Fri, 27 Sep 2019 07:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Xs4DziX2kpdYgxtkDru2a37dM2G00+Xc8J5f0/eIcY=;
        b=vvGA2OAwK3UXWWsz/dwMyiuZPATgHxFnZ8CP7VqySKtzMUG86U3wJULEJ/NBfAM/aV
         +MgMT4ClJ6KmqYy4tSPMUJ27Kw8J7gnRVptQ5YleN8XHQ4kBLXByTs7o+IWMPjylOkyi
         9JnOMkxyH9KOeKZRZCiQBcO7sINXwXG7MrxZGPHZ5yq3aA+Nz+7SROUX3g7EFngJYK+I
         Xa1i6elrjT2KVKZnbSFMKmLbntkDSDOxy0v3NF0RhNbpo4MZYGFO0htirBX7omGZnqUn
         vKcHDFYOPAabn32qWt3s+pLuPmAjVDi1oPUM1YPQAnaCfiRsTVNM39aEud1a8FQQQDFm
         P7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Xs4DziX2kpdYgxtkDru2a37dM2G00+Xc8J5f0/eIcY=;
        b=dTyxcmCUEISZp1dpoBPCenpI8nSyrIX08YzDZ0PMt+YtFybvdMdgWjP0J5AX3bHab4
         +DDJ+nCcp/dCHQlot1aHzd5xb1tSxwNOH17fVm2qofdk34m68o90i7DprfebVvdLqY/u
         X1JPBXk/Tf2Ns1eim+cnkFq2Um7Ekser9E+k9/pahOJ6QiRPdJnn3o71aZCRzcAwgxY6
         8I0yq3KDwuCSZOrtqZLVM080/sNaW9l+x/PWTj+4r85hANWgLwnzYJxwAsC5+IuXUox0
         /njBTGQk23qtkGPijVE2TyubmwuRAnGl6x8OQuz8U7D9PZ1KoMcZ1cxNfOzo/uf9sN2N
         DSXA==
X-Gm-Message-State: APjAAAUyxKBFTOLrNgxzGZw+44rJRZU/aKcQKA7XY7eoOoEpyVwRfuUE
        57wVysuRLOOQ7y71syvXDcwXpJ7f7xZvNFU/2h9BNw==
X-Received: by 2002:a9d:5e11:: with SMTP id d17mr3390754oti.135.1569593037088;
 Fri, 27 Sep 2019 07:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190906083152.25716-1-zhengxiang9@huawei.com>
In-Reply-To: <20190906083152.25716-1-zhengxiang9@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Fri, 27 Sep 2019 15:03:46 +0100
Message-ID: <CAFEAcA96W-FLfYc2MdGnn3y5Kk_D4QN4tSJv7ZgLwO7WZU447g@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v18 0/6] Add ARMv8 RAS virtualization support
 in QEMU
To:     Xiang Zheng <zhengxiang9@huawei.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Laszlo Ersek <lersek@redhat.com>,
        James Morse <james.morse@arm.com>,
        gengdongjiu <gengdongjiu@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        "xuwei (O)" <xuwei5@huawei.com>, kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
        wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: QpEMphc0D5Uh

On Fri, 6 Sep 2019 at 09:33, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>
> In the ARMv8 platform, the CPU error types are synchronous external abort(SEA)
> and SError Interrupt (SEI). If exception happens in guest, sometimes it's better
> for guest to perform the recovery, because host does not know the detailed
> information of guest. For example, if an exception happens in a user-space
> application within guest, host does not know which application encounters
> errors.
>
> For the ARMv8 SEA/SEI, KVM or host kernel delivers SIGBUS to notify userspace.
> After user space gets the notification, it will record the CPER into guest GHES
> buffer and inject an exception or IRQ into guest.
>
> In the current implementation, if the type of SIGBUS is BUS_MCEERR_AR, we will
> treat it as a synchronous exception, and notify guest with ARMv8 SEA
> notification type after recording CPER into guest.
>
> This series of patches are based on Qemu 4.1, which include two parts:
> 1. Generate APEI/GHES table.
> 2. Handle the SIGBUS signal, record the CPER in runtime and fill it into guest
>    memory, then notify guest according to the type of SIGBUS.
>
> The whole solution was suggested by James(james.morse@arm.com); The solution of
> APEI section was suggested by Laszlo(lersek@redhat.com).
> Show some discussions in [1].
>
> This series of patches have already been tested on ARM64 platform with RAS
> feature enabled:
> Show the APEI part verification result in [2].
> Show the BUS_MCEERR_AR SIGBUS handling verification result in [3].
>
> ---
>
> Since Dongjiu is too busy to do this work, I will finish the rest work on behalf
> of him.


Thanks for picking up the work on this patchset, and sorry it's taken me
a while to get to reviewing it. I've now given review comments on the
arm parts of this, which are looking in generally good shape (my comments
are all pretty minor stuff I think). I'll have to leave the ACPI parts
to somebody else to review as that is definitely not my speciality.

thanks
-- PMM
