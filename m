Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1502855lfq;
        Mon, 11 Apr 2022 03:06:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFf2c/Srk8uc+rYzCdpi1VwmgUhJIeR714DZZuF1o0bfq9ihCSW33BjbTn1v7Kj5JND3um
X-Received: by 2002:a05:622a:1c10:b0:2eb:b308:f65e with SMTP id bq16-20020a05622a1c1000b002ebb308f65emr25190230qtb.115.1649671580114;
        Mon, 11 Apr 2022 03:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649671580; cv=none;
        d=google.com; s=arc-20160816;
        b=cua320kPzbYxPl6ut1fK4btW4kDtRRiCeVtfOSmRHWPEWBnFa9NYw5/hKBTHMFX9YC
         GuElSZ4cl4igQwx/9r/vfD8uX7zHISRy4tDfb0Of6xPDgLunpvpfgJ8zLM8PXf16NTvc
         ZvJfDUwEgg377SJMF0harQDbSJ1osnGg/PAybEzrryDwJbs7dCPLYHnptoiOuzg+jPtu
         PqWTfnneCJebgspA0xJ7O1rZ54VQM3b3gkCZrK8ZcyCuA5YHTl8pOE5DMvvUz1USo0tB
         Ycz7j1Bl2AaKtFG6pU+j89zsPnT5z2YHaAD/sFufjlRXvLXA4X0SXWoMGhmdGL00vR4w
         WqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MQHV92TYlvvoXQVcqqsrVIVfrq5V/AryidSPM1RzZTg=;
        b=SFTbk7HjECshGRW5C8Iq33TUV6Puu/7J1JY5lmjIOk3F0w0INDndic9a4ItNP2Dlly
         Ck6n+ln8wOrewhMkdF25jAzA1+/AQhNJqiTSJoC6mOoLGHYoHYxKN/21Teh1to0qW9vM
         Cz94TODq34BT551eaMVcl4z4Usy4pSwljt2xdB+e+rDT+/CyY4xw8G33rzAgIUg85RCf
         fUN2NmJXlBpKaSv3P0JJIeaE0+3nkphR2CJQjlWxG1P5OcuRM8sX0CG0Vg0vguHSgj4j
         KZrEc24HXrmJcELi3qHHSOFuWE2mZEctuSm6+95OVL1CMlk2hcZFVu9w6spbIsfTherm
         DGlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G0yq1sVC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020ad45aad000000b00443ca5bbf8bsi3477942qvg.576.2022.04.11.03.06.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 03:06:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G0yq1sVC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndqw7-00019c-Ii
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 06:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndqvn-00016M-L4
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 06:05:59 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:45827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndqvk-0003Yh-7L
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 06:05:59 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2ec04a2ebadso39175817b3.12
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 03:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MQHV92TYlvvoXQVcqqsrVIVfrq5V/AryidSPM1RzZTg=;
 b=G0yq1sVCVC6jd1yP4KvBbj7uBNqFV6De26Jwicy3JYwHT1KUUBcjNCNoe9z0RLA8sU
 z2CmXQyevRIJhNMgP4CScZryHtTJTy45XMjdFVkfTVuXt9ooTvS4cNa2dQHRj3whKcqe
 1n6oKO8TSSPIo8xbWFg/2exjAL7GK+SMaxHaVHx9Xz9g6eGh3bZo0IwRFoC8/rK787hX
 XHfl9BUGUbniim+ekYqLDLKXoFcz+dlVRGiDE2CAvYp3Vb2aAnY+BhpEVNftEJQvCECL
 bAeMEXlxeyxP6MpFdUf09XquLx7HRHCOj2sEENUmq1+w0b44HBvyt2RWIRLOa0GQ/CjW
 py0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MQHV92TYlvvoXQVcqqsrVIVfrq5V/AryidSPM1RzZTg=;
 b=UUSwMfBgi3sMjUFNc1NGK1Hyz20pLaSPu5SCLMFXjijhyFmBRY+X+tzaDfdJA4qUQL
 XA6m2suYYZ8nnwVAlKG24mYXdnf1f8g0Tp7tVDlHoZrMh7tvT1vK2Rh0PfJlVl9t+7AZ
 3rILT/fjjpVliWd2h3AcoTewmup2zv0i1TXnL6jqlvUXZnnZHPVNpO3gWnX2Pa8N1Woo
 Fiv9RJEuKmBQ/s5XVL2SPhBwdxa0qSc9W86R8Pzi0rkTD72Lb9d51yL3ae19rgB6NQSb
 lpgj9Q/flCgUpgCO6IyagY+8fZL3alQbmjb5vyChReRRsrfpBfznu+EFuzskL3xXZ1Ym
 0ldA==
X-Gm-Message-State: AOAM533zxbahYv62Z1YPPVw9l1NssqwRg8xRXPjFkJw5UP/ISsCqXz0M
 go0jI+XpZB+5juNtiKkwRBu5WxYWASzhYG1BwMFbVA==
X-Received: by 2002:a81:db05:0:b0:2ea:2b92:c317 with SMTP id
 u5-20020a81db05000000b002ea2b92c317mr25563805ywm.329.1649671555119; Mon, 11
 Apr 2022 03:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220411065842.63880-1-gshan@redhat.com>
 <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
 <a84ed377-2428-11ca-ee17-0dc8debebcf1@redhat.com>
In-Reply-To: <a84ed377-2428-11ca-ee17-0dc8debebcf1@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 11:05:44 +0100
Message-ID: <CAFEAcA9=eSt+R5OmJUn0KwUrWpnZT6C=O1mq4xUefZJXqyXrUA@mail.gmail.com>
Subject: Re: [PATCH 0/5] target/arm: Support variable sized coprocessor
 registers
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, agraf@csgraf.de, Oliver Upton <oupton@google.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HJd0smUxylWB

On Mon, 11 Apr 2022 at 10:50, Gavin Shan <gshan@redhat.com> wrote:
> On 4/11/22 5:22 PM, Peter Maydell wrote:
> > So, can you give an example of coprocessor registers which are
> > not 8 bytes in size? How are they accessed by the guest?
> > If we need to support them then we need to support them, but this
> > cover letter/series doesn't seem to me to provide enough detail
> > to make the case that they really are necessary.
> >
> > Also, we support SVE today, and we don't have variable size
> > coprocessor registers. Is there a bug here that we would be
> > fixing ?
> >
>
> [Cc Oliver Upon]
>
> Apart from SVE registers, I don't think we have any more large registers
> whose sizes exceed 8 bytes for now, until SDEI virtualization needs more
> large registers for migration.
>
> I'm working the KVM series to support SDEI virtualization and last revision
> is v6. One of the requirement is to migrate the SDEI events and states.
> In v5, the migration is done by the dedicated ioctl commands and it was
> suggested by Oliver to use {GET, SET}_ONE_REG. Note that the series isn't
> merged yet. So I had the prototype to support SDEI's migration through
> {GET, SET}_ONE_REG. Note that those newly added registers are inaccessible
> from guest.
>
> https://github.com/gwshan/linux/commit/c2e5de5e210de6b003d1e1330eeb0958cf7007f5
> (branch: kvm/arm64_sdei)
>
> https://lore.kernel.org/lkml/20220403153911.12332-13-gshan@redhat.com/T/   (last revision: v6)
> https://lore.kernel.org/kvmarm/YjtYuk+Jx1dFPQQ9@google.com/                (v5)

Could you please describe what you're trying to do here rather
than asking me to wade through a big kernel patchset that's
adding support for a firmware interface I don't know?

> There are large coprocessor register sizes, like U2048, exposed by KVM.
> However, it seems we never support those large coprocessor registers.
> I'm not sure if we have any challenges to support those large registers,
> or we don't have the needs yet?

The general idea of the coprocessor register accessors for aarch64 KVM
is that we're giving the VMM access to the same registers that the guest
accesses via the msr/mrs instructions. Those instructions by definition
access 64 bit quantities. In a few places we've borrowed this mechanism
to define KVM-specific pseudo-registers, but that wasn't the primary
design intent. So maybe it makes sense to extend it to do what you're
trying to, or maybe that would be the tail wagging the dog. It's hard
to tell without more detail on what exactly you're trying to expose
to the VMM here.

(The ONE_REG API is used by more than just aarch64 and more than just
for coprocessor registers, which is why it supports lots of different
sizes.)

thanks
-- PMM
