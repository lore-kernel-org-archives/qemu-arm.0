Received: by 10.28.173.206 with SMTP id w197csp3904112wme;
        Tue, 9 Jan 2018 08:51:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBov2CKjZTqauVa/ruACaB867RctUnSg0oSf0JboAPCylXOsKYTRwFeC7PzywmpnfW+Bz2OxG
X-Received: by 10.101.81.5 with SMTP id f5mr12255762pgq.78.1515516715913;
        Tue, 09 Jan 2018 08:51:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515516715; cv=none;
        d=google.com; s=arc-20160816;
        b=Nft8B7dECQL1DqjoGt1C1wxQu50w25++V2WWxkEAWXDRRO0DCzUtNWfmP6bp50lB1p
         GbM8UNTCaNXC2HhUIS4Iwgt01Mt/E7C6nWDsJbXzYvJBEM4839qrpzZ/7bXEXbBbKZya
         BZ40Fxh4KyB0EXoGf+p+gGkwIT+XniqelYghNDlsNehVyrthACE3sFN3O9MBAnECrH/N
         Kb2jAY+7K9xLKFiF/hIOLR5uOBQc69nVh0fyF5JOC9oDXCnHQLgwRRQ8pmvMvblwBfpu
         rOzjTrTQ2Oq2xJcS0pU39J7yVjuWzMERhmXjWwXoKDfQnDrJDEhP9DcrlV6auED1TyU3
         w+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:references:in-reply-to:mime-version
         :dkim-signature:arc-authentication-results;
        bh=gVGKqgFZk/NRv25oJrpvShq1g9zD4rriFJKQ6cU/XNc=;
        b=nU1AtNWmOpF1JkTrQIEOYlizgAQ2yxh2YJNfmW1y5CqLMbDkB8SdiMe/irX1GgYlGB
         VOEwR6E4z+p+w1AwH+5kGYQ7ppROkiUaY+GvxJvXmogQlmvc49SSYHL0uuJ+OlrvRQdk
         HmIvd3ffnF/FbELNTBGWDpSS/pnyanQgJWezfW8q2myW72UoNHuSo2G/34FrPd7Zoyx4
         BhkLiMw8SxSGcthZ0cCb2u1VsW9icCGGWeUqKEu8qt55mxgwfNRrJx/63jQHORO0uBgM
         soq6y+uwtbEDzfVX02UPYwjdwitkRP9jHNHVWd/yd8VMSRvnt/x5mNZajg0Udpu89iO/
         32og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRd8Nsi+;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id u23si3652286pgb.745.2018.01.09.08.51.55;
        Tue, 09 Jan 2018 08:51:55 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VRd8Nsi+;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759882AbeAIQvx (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 9 Jan 2018 11:51:53 -0500
Received: from mail-ot0-f193.google.com ([74.125.82.193]:33740 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755925AbeAIQvw (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 9 Jan 2018 11:51:52 -0500
Received: by mail-ot0-f193.google.com with SMTP id x15so11873796ote.0
        for <kvm@vger.kernel.org>; Tue, 09 Jan 2018 08:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gVGKqgFZk/NRv25oJrpvShq1g9zD4rriFJKQ6cU/XNc=;
        b=VRd8Nsi++parmt2kNGy4MD0DgRPyllB/N4Ql2xSebaL40kQIBXmV2Vi1TB5q1dG7KF
         m/F+q4LQcpf8bQYt1971UBzRjqaoffi4FzzA6l44bWQBcpa32fMfHNeRJs3ONDDRkzV7
         8upprlVw1UyC9i974Fr0uC1qzmcyEcS8JWOWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gVGKqgFZk/NRv25oJrpvShq1g9zD4rriFJKQ6cU/XNc=;
        b=VbdE/NmaxGi7bCTBS3ktFl4tH/bhgCOEOECaZxOFZSUYM6HNezOfFbcmeJ1D2CtgAb
         8P9lqignnEtgEHTrIZZx9ir7r+Kdi0uEBv1E71hh2FKSIQ0F+A7n77cFziLnlkc11JpU
         N7BIBAbwQbsTva1/REKA79acfSyNXOj1j2ZLIgM5MFTYFs8gb5WD5SZn+xEmn1l5HnpV
         BRFlBlhvel362PK+94RcGK/k3D91gtzMbfzRlUwTm3WPJPhrtj7SqyEdD3V9W3N0ijZw
         iSjGvh3FbrTZQwfqjBI8rnFFZ6775MMbzbITacCrqwtwodRK8sS0HL2l1hZIgL2EiKmY
         bTnQ==
X-Gm-Message-State: AKwxytcNjUx0S750Hwp9sOxg4K3wEHx4q7NQckXn5YdoXvd+MwRV2Cwf
        Su1bQdRnbwTSbZ8cZpevgsxpHsSLnyj2rew//lJROQ==
X-Received: by 10.157.52.215 with SMTP id t23mr982783otd.54.1515516712112;
 Tue, 09 Jan 2018 08:51:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 08:51:31 -0800 (PST)
In-Reply-To: <10087bbd-28b0-b5ad-101a-e6d5ac648548@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
 <1514440458-10515-3-git-send-email-gengdongjiu@huawei.com>
 <20171228151809.10495a90@igors-macbook-pro.local> <10087bbd-28b0-b5ad-101a-e6d5ac648548@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 9 Jan 2018 16:51:31 +0000
Message-ID: <CAFEAcA--f5eK0_zij55o09M+FyRUVH+Pnwc3tsT6rLm1kpvbBw@mail.gmail.com>
Subject: Re: [PATCH v14 2/9] ACPI: Add APEI GHES table generation and CPER
 record support
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     Igor Mammedov <imammedo@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        James Morse <james.morse@arm.com>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>,
        Xu Wei <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: PtQ/JRj+FLjK

On 3 January 2018 at 02:21, gengdongjiu <gengdongjiu@huawei.com> wrote:
> On 2017/12/28 22:18, Igor Mammedov wrote:
>> On Thu, 28 Dec 2017 13:54:11 +0800
>> Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>>> In order to simulation, we hard code the error
>>> type to Multi-bit ECC.
>> Not sure what this is about, care to elaborate?
>
> please see Memory Error Record in [1], in which the "Memory Error Type" f=
ield is used to describe the
> error type, such as  Multi-bit ECC or Parity Error etc. Because KVM or ho=
st does not pass the memory
> error type to Qemu, so Qemu does not know what is the error type for the =
memory section. Hence we let QEMU simulate
> the error type to Multi-bit ECC.
>
> [1]:
> UEFI Spec 2.6 Errata A:
>
> "N.2.5 Memory Error Section"
> -----------------+---------------+--------------+------------------------=
-------------------+
>         Mnemonic |   Byte Offset |  Byte Length |        Description     =
                   |
> -----------------+---------------+--------------+------------------------=
-------------------+
>         ........ |  ............ |  .........   |        ...........     =
                   |
> -----------------+---------------+--------------+------------------------=
-------------------+
> Memory Error Type|     72        |       1      |Identifies the type of e=
rror that occurred:|
>                  |               |              | 0 =E2=80=93 Unknown    =
                          |
>                  |               |              | 1 =E2=80=93 No error   =
                          |
>                  |               |              | 2 =E2=80=93 Single-bit =
ECC                       |
>                  |               |              | 3 =E2=80=93 Multi-bit E=
CC                        |
>                  |               |              | 4 =E2=80=93 Single-symb=
ol ChipKill ECC           |
>                  |               |              | 5 =E2=80=93 Multi-symbo=
l ChipKill ECC            |
>                  |               |              | 6 =E2=80=93 Master abor=
t                          |
>                  |               |              | 7 =E2=80=93 Target abor=
t                          |
>                  |               |              | 8 =E2=80=93 Parity Erro=
r                          |
>                  |               |              | 9 =E2=80=93 Watchdog ti=
meout                      |
>                  |               |              | 10 =E2=80=93 Invalid ad=
dress                      |
>                  |               |              | 11 =E2=80=93 Mirror Bro=
ken                        |
>                  |               |              | 12 =E2=80=93 Memory Spa=
ring                       |
>                  |               |              | 13 - Scrub corrected er=
ror                |
>                  |               |              | 14 - Scrub uncorrected =
error              |
>                  |               |              | 15 - Physical Memory Ma=
p-out event        |
>                  |               |              | All other values reserv=
ed.                |
> -----------------+---------------+--------------+------------------------=
-------------------+
>         ........ |  ............ |  .........   |        ...........     =
                   |
> -----------------+---------------+--------------+------------------------=
-------------------+

There's a value specified for "we don't know what the error type is",
which is "0 - Unknown". I think we should use that rather than claiming
that we have a particular type of error when we don't actually know that.

I agree with James that we don't want to report a particular type of
error to the guest anyway -- the VM is a virtual environment, and
the exact reason why the hardware/firmware/host kernel have decided
that a bit of RAM isn't usable any more doesn't matter to the guest.
We just want to report "this RAM has gone away, sorry" to it.

thanks
-- PMM
