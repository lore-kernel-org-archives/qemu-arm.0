Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2937109lfa;
        Mon, 26 Oct 2020 07:44:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTQ/njI+ShzTMFgFXoY86Yqc2jSubdzrtIRW0LiK3UmhO94OC//02PwU5kxfkvj+IvGcC/
X-Received: by 2002:a05:6214:122a:: with SMTP id p10mr17706992qvv.0.1603723487481;
        Mon, 26 Oct 2020 07:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603723487; cv=none;
        d=google.com; s=arc-20160816;
        b=Le7i3f3dWQdqX5Zbn5xEkg8aMq+h+YeJJ5+lFPGMpgIedX7kaMIIzLHWyQ99JmNAPN
         ++qJcCghc3y5ZU5sqKvUA42H1omaNFdHjS8vulx+8xpwEs1YBZK/ioOiqHo8xNgZO0TF
         dwPcaZXaE4bnh/eUdyfhkFac3bdg2hOsOeMGR1rw5I0hhdq8TrBgTvBTm8WN+m0+DypE
         euQ64utgo4MvwAh1Fn9LCZac2RdN56TXJKypyeL1WNC5css23pxQ1Lr+XZIWhGiAOYSL
         j4nzGOPwvbowSOUBDl/qJ+2LePz4cCOalPLvpP5nxfk/enUf6xwzB3ddihYp5hOjNPzz
         U7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uncv4OImQJQZbkjp9IT86wTIL1wthCu8fzrRY3mxxrs=;
        b=JvrT5hnLIB604/rC8yOgljlE24J9QL00A9RnbXkWVtajy9nX+jKoGufDB6izNgrDGh
         5v9W00Ilq+TO5q6jlyoPo6GAKarjLMZCsXXriiXWqTAGpErpIse/oEq3JBgVXE9qKOah
         V6LkQ7D3OMYbvDrOJcqftDWWWfrNeS2AlMnMyx+RSPGqMk+rT9QL2n/OZIGHx4ImTVBI
         nkcXmqt07hHYBS7mBi/RUmLUvg+k70+RcJ0FAdJfMpinxecz4k0i33rQj/YFnHmK7M4V
         P40d6comqPetz397lvByiE5oiP8+4mj2TVqg6/3RMEy4ENCtBWiX/jam7jp5thYj3mge
         xYfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jpMEIcoa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10si5823924qvq.10.2020.10.26.07.44.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 07:44:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jpMEIcoa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kX3jq-0003Jm-Tk
	for alex.bennee@linaro.org; Mon, 26 Oct 2020 10:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX3YY-0005zp-AA
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 10:33:07 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:33183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kX3YW-0008IF-3t
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 10:33:05 -0400
Received: by mail-ej1-x644.google.com with SMTP id c15so13926476ejs.0
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uncv4OImQJQZbkjp9IT86wTIL1wthCu8fzrRY3mxxrs=;
 b=jpMEIcoaWp4muwFgbwl1lO1mXLUyRBqy9TuUylteqjmoKnJ+jZJoMyv1PqH0ATj4uD
 M87/5rWZsnL1CJ2d/71pvOjBlopswuUuruV1snR3AXKMoAaUKGRkrzMXELxx/7w0Hm/v
 iZBw2PnbSsPEIZUmQfxDh41KBoONOe6DhXBuRm2TN82ub4pdlwE/mnt2kGNEOPgQisua
 HXH45nQxlEqzaKYA79qDiwa/8f4sLlRNPTgINU0GmgqvPu4QLTEd77wDCyekv19BwmmX
 qC7ETYPnVDyeQhfKK8gm91alVbllmLWMdOj5rnnIFqvjwO+mVBgswoMEAiVrTZDx8Xii
 GF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uncv4OImQJQZbkjp9IT86wTIL1wthCu8fzrRY3mxxrs=;
 b=hQWDVXrKgWQDreqAV+BnIPBIfhUxMB0NlKID5Bqb9DD0CG+cqE36HtuGWxsaei+sK1
 ToyH75PwVygZqio8+WvR3EU1r//Evu3V22WbC0kPEp8+PapI9Pk4z4rI6t/TU3BkOnjK
 GTnJati6aLXFZ8CjjICRtddQpAFng7+z3z80WvyaLTN6ml1LqkSnLT587h/Vli/MXLCg
 Fboylr21ezixDp+f7xuv7LFe2PcdbW3trJG1BeKS9Pv5U/fjpfGeAvxLNByYKzC+KBTQ
 n0zyuE7lqYQ8sP+n9MDdrpEHymPt6r1/CsHKrDsFfDU8aBvyKUofJ5R83j2pNMJeGitm
 Wjkg==
X-Gm-Message-State: AOAM5312VcLx2WSs+z8j13mw2g3c7RpngaDWwDhBRz7bn8bEak/Llk8r
 RhKDhH1+PmslBFM/3Ps3bxB1QPlXCwxwL1pSxldoug==
X-Received: by 2002:a17:906:c7d9:: with SMTP id
 dc25mr15912929ejb.482.1603722782244; 
 Mon, 26 Oct 2020 07:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <1603352576-21671-1-git-send-email-mihai.carabas@oracle.com>
 <CAFEAcA9n3T5MrBp2RbOQGWBptV5ObCssF00ygK8TDieP+V1Srg@mail.gmail.com>
 <a6065386-a844-9d06-21ca-57baa98c8caf@oracle.com>
In-Reply-To: <a6065386-a844-9d06-21ca-57baa98c8caf@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2020 14:32:48 +0000
Message-ID: <CAFEAcA_LtW+B3EOye9STciNR+JKsh8HKQ=ecy=W+Ey-SZDSUFg@mail.gmail.com>
Subject: Re: [PATCH 0/8] Add support for pvpanic mmio device
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rRfDRTmCMWHO

On Mon, 26 Oct 2020 at 13:51, Mihai Carabas <mihai.carabas@oracle.com> wrote:
> On 10/22/2020 1:17 PM, Peter Maydell wrote:
> > I'm afraid the answer is still the same. You need to provide
> > a convincing argument for why this needs to be an MMIO
> > device rather than a PCI device. I really don't want to
> > add MMIO devices to the virt board if I can avoid it,
> > because they're all extra code and potential extra
> > security boundary attack surface. PCI devices are guest
> > probeable and user-pluggable so they're almost always
> > nicer to use than MMIO.
> >
>
> Thank you for your input.
>
> The reason why pvpanic should be MMIO is that is a special device which
> is not used commonly by the user (aka VM), it is not need to be
> hot-plugable and it does not have a hardware correspondent to be a PCI
> device.

"Not used commonly by the user" is a good argument for
"just use PCI" -- users who want the functionality can add
it to their QEMU command line or VM config, and the bulk of
users who don't don't have to worry about it.

PCI devices don't have to support hotplug; I agree you don't
need hotplug for this use case.

Using a PCI device would match up with the way the x86 pvpanic
device is an ISA bus device.

> Another reason is that MMIO support was accepted in the kernel
> driver and it is pretty useless there without a device.

> I know it seems that I want to get this on the short-path, but at this
> point having a kernel driver in the upstream and no device to test it
> against it is pretty weird.

That's the kernel folks' problem to deal with, because they accepted
the kernel driver without having confirmed that QEMU was going to
implement it. If I were them I'd deprecate and delete that driver code.
(They should certainly fix the bit of the documentation that claims
that QEMU implements it.)

thanks
-- PMM
