Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp50467lff;
        Tue, 7 Jan 2020 06:31:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMbehLvKAT6zHqkJCaQJGEeEVZZbjuwQFJvNPdHoon07jtRHhxnUx4qNAuwJZIytLvcQpQ
X-Received: by 2002:aed:304e:: with SMTP id 72mr77784319qte.113.1578407498600;
        Tue, 07 Jan 2020 06:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578407498; cv=none;
        d=google.com; s=arc-20160816;
        b=jWWG0xLz9s1w0L3Z1ND6DMr+XDs6f2SFYj6JJHHoChY3nR+u5CNI3crKoKIwnO8TvA
         I7npVlbIfPrZYFe2LlMM5FHGm4/E6NqFkrK2N7qojCGkgPSfE7rl8UIKyaEFVyFNIZRe
         iOGKHaxyvP8lcn3k9SC9okHKc7RaUpDUe488pVc9LEtjf4XIskRqxMD8D85vrOQoF6kT
         rVH97K8SLA9PI4HIAOEBE7b6nb1FK1UWWDegMk58f0X+Te9uH/iqFrAWtIM0z1fT+jEx
         TwUNYiR9/373MT6vIQG5N5utmrG+MDhDvZ2nVtXRVtKcbp/ZFgrvcL1PThjcYZ4v3VFj
         nE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yr5cOy6W7NPRHMaNkz5yekAYUOlSuE8t7GjWPJE+NI0=;
        b=EA1fERkzQiEMolOiKZkPpKOVLHbVU5lY9N3EjYZo412yIi/ji2xPBLvOibH8dMTJBG
         UdLxJYMuKw7nTuEWOc/U1NqlrP+5x23cFwRCxrxl/AJKOh9cfLVNJHdIf3nn9fY0k0hf
         9tgZl9/9iCfweBzchrJS6thJBYFy1x5CiBg/zrngqgFDv52A2L/3YXOazQyI0Dlz05ck
         kn3c4aYT1CaPhuzSnPtuD3qPhWMIdndUALkhyoAb0s0yH7SOSOjf33yHgSeMg/3FYJC9
         qdHsS6AAV00WWW1kllplvuOFVPdsFjznTMOU/wdF9UEko4x61qXkWU81ROuZgZTtpLm1
         oQBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="yY/vYJ9C";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x184si33664116qkb.104.2020.01.07.06.31.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 06:31:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="yY/vYJ9C";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioptR-0002M2-E9
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 09:31:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38994)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iopqs-0000JS-Ae
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 09:28:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iopqr-0006py-6K
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 09:28:58 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46138)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iopqr-0006p0-0v
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 09:28:57 -0500
Received: by mail-ot1-x341.google.com with SMTP id r9so3272910otp.13
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 06:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yr5cOy6W7NPRHMaNkz5yekAYUOlSuE8t7GjWPJE+NI0=;
 b=yY/vYJ9CB2CamlYkxJ+ZdrNJhSKMr2e0BCq5R1a6k0OPbfPGAaozyoNpA63lD7x1Cu
 Kxge36E4DqXZdLVXO9pUfNCKTBTNCTbS5+NeePmQ+3maxOFAlb2uNUzO93UL3AGdK5Dp
 S1b/QwhN5TM9UQvTK54O+GiWXxtBwESKvkkyL2SgjvIoK8CmIPypUD8Uf5VwW0ngOxda
 2N0YFUxBL+G5GWRrp/e6bQgxQNflSmtPkBU60lO0hyThhnDNd9yyjL25Ovqw5vBHDcG2
 TUhoSy/tJnSAOwIVmvOXhey/yUaJgbN1HHioJWzrfRds5v84r1D8ZR3OAPsd4rJLE6RW
 14/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yr5cOy6W7NPRHMaNkz5yekAYUOlSuE8t7GjWPJE+NI0=;
 b=mUriUNeCZ8/fgrQIbDsFvGWMS6pzmZzynrQ33qRjBo+wIHFvMY6P/dRWcpv58e2PFk
 QC8L7GXW+1Bv9Tbir1Py7K976vDtgtFM8vwj2TJHwjaJ/0IzhmtHxH184qsZVzJi5D04
 wtXAPhdSUG60cFaiI/2WWnVNQbwgZYzS6q7rq+Kk43KX8A57bmfinUN1gvdI4l84Xcnw
 aNk/p3BaO3d6cDyHYyBQ9TKnd709eQpBebJuZh1i40WVigDACt0J0ZcvjbUCBt5j45RA
 kHUR3XQgmtME+4IjGOPOacnDpOr86FFwsZXOZ5Y/YAI5YSD64+pXZmQpJ5N5XgUfVcx9
 ZGWQ==
X-Gm-Message-State: APjAAAXh9KF7qC8P4YbfZuP96aa8WjHbFNCd2Kld2+RG6rlDbGR87ZCk
 e71KtGWLMV1ocYk8QjAjUtI9nn6xwHRROjXLhqHv0w==
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr113889887otq.135.1578407335784; 
 Tue, 07 Jan 2020 06:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20191220202707.30641-1-beata.michalska@linaro.org>
 <20191220202707.30641-2-beata.michalska@linaro.org>
In-Reply-To: <20191220202707.30641-2-beata.michalska@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jan 2020 14:28:44 +0000
Message-ID: <CAFEAcA-M=P=-6t5RX0bdO-8fbcd-_Ar_aBNskzs49aspvZ0+7Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] target/arm: kvm: Handle DABT with no valid ISS
To: Beata Michalska <beata.michalska@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christoffer Dall <Christoffer.Dall@arm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XguNE+G+Y1x2

On Fri, 20 Dec 2019 at 20:27, Beata Michalska
<beata.michalska@linaro.org> wrote:
>
> On ARMv7 & ARMv8 some load/store instructions might trigger a data abort
> exception with no valid ISS info to be decoded. The lack of decode info
> makes it at least tricky to emulate those instruction which is one of the
> (many) reasons why KVM will not even try to do so.
>
> Add suport for handling those by requesting KVM to inject external
> dabt into the quest.
>
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> ---
> +        /*
> +         * Get current PC before it will get updated to except vector entry
> +         */
> +        target_ulong ins_addr = is_a64(env) ? env->pc
> +                                /* AArch32 mode vs T32 aka Thumb mode */
> +                                : env->regs[15] - (env->thumb ? 4 : 8);

Another thing that occurred to me last night -- why do we need
to do this adjustment of the PC/r15 ? If this is the kernel
handing control to userspace to say "this is not an instruction
I can handle, maybe you'd like to try" then surely it should
do so with the PC pointing at the offending instruction?
Similarly, if we ask the kernel to inject a data abort I
would expect that the kernel would do the work of adjusting
the PC forwards as the architecture requires when taking
the exception.

thanks
-- PMM
