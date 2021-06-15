Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2760399lff;
        Tue, 15 Jun 2021 02:19:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7vsDS2385uQxDrJ6YLtWvGuQASD4ocq92kKuV/X6krvWKKP0wsvRwgvPcN6RbHOWItS3T
X-Received: by 2002:a05:6102:208f:: with SMTP id h15mr3476105vsr.7.1623748791785;
        Tue, 15 Jun 2021 02:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623748791; cv=none;
        d=google.com; s=arc-20160816;
        b=qMR9N0u3SOISxZCxw7zUEgD7kysuI5aYsAbNYUCRZR8MJB5hy2a9y8fCV35ELd/Sqr
         lV1UhwUm7P+YOH0k6iswrmvdnjR9D3h4ey6+MyJwryx0ilwrw4l6F4mKK/AEL5jwUEVU
         gJL+EW+1oZUfKDr/14pR0SMKZuxsL7anO1QctZg3zjGDkICGNnh69uQs41oOX9uqnBTr
         BJ+HXpd6GJ8dXgU05RMNmhHOsHvoBtneRCGZjImAS65KenAHgQzz+ZA02bePrauLzMVC
         uso9PTWD0SqOMmbFLZ8ww+s9Q7gaNPX5pjfo7FHWeMXo/rqqOEc6htw77PDT3cKC0gW3
         C7ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xvKwHt8rra6AElWDhlqLXcIcLDgAbXP1fBEbpsLGWQs=;
        b=D+r2Rbfuol5+cH89ZFoDHmrWuLOE5zjj1dwwJj3tCb36qHuXQZJ5zkXKxLVIN6TM6H
         zt7FT9o+Z/WV4e08JNpYYSsL8SWBFhqNmckqaY6HOk5iYS4qoLwFHgtg6bn1iVe7vwrg
         XJeMCK9lpOlN/UA7oBtpxZWw07RbCZ63tSjYnJCP1e8/XhxvZoesp2J6AFKZwXROjra7
         xrvtTRtXXmvItNk6AUj9iVrz6PT55X3Tno8AoaoiOA/gi+L//2To2DJ+XNtKr8Gv+NzD
         sn/7Fq9wS8DuoHQL5wum3pwPh/HUGU8PHnNCctIU7yg4Nv1OI9OsN1jDXOsA5E1zHWtR
         IG7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kGsQb1yk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si8978987vsh.439.2021.06.15.02.19.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 02:19:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kGsQb1yk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lt5Ed-0001Tu-3W
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 05:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5ER-0001TS-Qo
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 05:19:39 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5EP-0000qC-V3
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 05:19:39 -0400
Received: by mail-ed1-x52a.google.com with SMTP id d7so2075144edx.0
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xvKwHt8rra6AElWDhlqLXcIcLDgAbXP1fBEbpsLGWQs=;
 b=kGsQb1yk4w7yjmyTSFb0qmszPdt2G9x8FihS2RxY+sA3ueTWp81/iuWnO2iUbAZh1N
 qfC2xcDSLQ1y5PwF8cAdiw37f7aJW+4MMX6PWO7QB7asc61HIoN64992JVYkdJBAr4nw
 fYBQfpgzXVxHENldKg4Ne9XTRvkJ/eQbmO/nPEWsYJGd0yk3MIAZTTYMmY+Xe/BFtgh3
 5rGbYnHXDq+XgxHm1GJWVQt3phgp70tUFS5wNzqKbSwe0EJbs16ckGMp8Cl0nNOoriOq
 CN2k3lhkPInAh74y2sr452a7+4Q+6ZYfa2TQkXvAWyTSoErucfybh1TtpmSNPNGsob2C
 wHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xvKwHt8rra6AElWDhlqLXcIcLDgAbXP1fBEbpsLGWQs=;
 b=fscZIkBBm9hJtnTQq3WUZLLDfdTdzOcEoD0VX5vLaQ3GLTuP3WYjkUhiFu12LNuELy
 AjVIAtqplQezYkGUsjheiFGyv+QK63s6c5+c0XaGN4rW/7czNY9yuJ6YA089SG64IrIq
 NeUgRqs6Gt+kzlqtrVU2u7cnVqch9DnWLTQvP1r15fVkqu7GcppFDcewqWyH/mEbY3va
 FYibM46FMs1jC8PxB42xzcRVowR41AHMf7SCc3hYpnRiP8ajgrm5OG40Uq3BUTYUAGmz
 j38b4p9R4M1wBuBQz1N4A53+xiygzBd8MvpdLYf71jpcrBVeQ7a/Eq/wXBh46eWWiyXH
 3LYA==
X-Gm-Message-State: AOAM530Z8VFTBCBRIh2s6nksPM/DfYHEdR2CZt7aWOu7i1syM/9TnQ0x
 qm4/P+w63ngKuG1Nr0JmdDbL3CKh3WdqSAYM50yXBnebNN8=
X-Received: by 2002:a05:6402:3554:: with SMTP id
 f20mr3938817edd.204.1623748776287; 
 Tue, 15 Jun 2021 02:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210603171259.27962-1-peter.maydell@linaro.org>
In-Reply-To: <20210603171259.27962-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 10:19:01 +0100
Message-ID: <CAFEAcA98cteF4aH+M9z5==dXUv8CJJnVzyB4YofX+htiBhqDHw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/acpi, arm: Provide and use acpi_ghes_present()
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Swetha <swjoshi@microsoft.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XmSZoTqAMpaN

On Thu, 3 Jun 2021 at 18:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently the Arm code in target/arm/kvm64.c which decides whether
> it should report memory errors via the ACPI GHES table works
> only with the 'virt' board; in fact it won't even link if the
> virt board is configured out of the QEMU binary.
>
> This patchset replaces those virt-specific checks with a single
> new acpi_ghes_present() function which tells the caller whether
> it's OK to report errors by calling acpi_ghes_record_errors().
> The mechanism we use is a simple flag in the AcpiGhesState
> which gets sent if the board calls acpi_ghes_add_fw_cfg() to
> set up the GHES stuff.
>
> We need also to provide 'stub' versions of both acpi_ghes_present()
> and acpi_ghes_record_errors() so that we can link even if no
> board using ACPI GHES has been configured into the binary.
>
> (You can test that this series is necessary by commenting out the
> 'CONFIG_ARM_VIRT=y' line in default-configs/devices/arm-softmmu.mak
> and building with KVM enabled on an AArch64 host.)
>
> I have tested with 'make' and 'make check' but nothing beyond
> that; testing by somebody who has a guest setup that uses GHES
> would be helpful just to check I haven't accidentally broken it.

Thanks for the review; I've applied this to target-arm.next.

-- PMM
