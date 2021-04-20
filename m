Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2083061lfb;
        Tue, 20 Apr 2021 05:46:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybAwa6vUN1BARrN46ExXboweU+XKgTRASMgw8t+9qTDdzra/7OdzBfvgBmgsiP2DkeGh6q
X-Received: by 2002:a9f:3601:: with SMTP id r1mr12039634uad.54.1618922804847;
        Tue, 20 Apr 2021 05:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618922804; cv=none;
        d=google.com; s=arc-20160816;
        b=JTVXQOwQgmLGFlb+WmFfNvI+j01+AKDIkkrij1ML5I+iy0bBViwPf0nLczxjjhLBQm
         t9dznx2d0/KMx0tlqBD6c3UdQROOHTA+9uKEEdv+jPkiERvUq+pdhtZj5d13oMHXFwwv
         DQ7mzXY4xeFmXttzOJHmIhgC/WFkRyFlFqZPKKDAvO1trOUuQthquUPpSaU9CrLWorDP
         5gy5jvAvKRqcLXX5idgychpUVwiYZIFxqWmG/d9KARn8WFbWs0d/X5uM/P+MpsoMZLO9
         tUIkT5D7QVwGgweu5A8tSda3bDaxVWweuBoblbN72WMaV8jOtWqRntW2pp1yT3SYTKDn
         pVHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a2XHWKLD5lxI17OV8Z1HMszFDbeXH9zC+F+5aHYxxkQ=;
        b=YcKZsIMEb4S8mPJ1gc9NnDp+QhPPRGpvWSAx+kH87/wE6wnwtuoKvGb1Oy5cDj1fEX
         3lpQ1L40w1F0EBR7PcsLZDog76+atDERlRnafWu3B1orAw0a35nbRyRMlY4LMqo/y8jw
         ysc97xHBYcoUohpNe7PxlUqewrk+jkyZ0CT/qN3p4P6R622AME5KPYbMvs+o1uKKL8QY
         RO4cCuEdAVEczYSUbR2e6FkWy4IV3Hus4HVWxQsvAubyRIKne5Kzhf33uOh6WTfx7XEt
         u/iyL2A6tc3MrrARbdQuZeV70XSK6HZrzwnceQCMGD9CM044IUNZXHU485DGq/w7q0Up
         KB/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l2XA9RYv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12si7241768uam.30.2021.04.20.05.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Apr 2021 05:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l2XA9RYv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYpm8-0002sz-4v
	for alex.bennee@linaro.org; Tue, 20 Apr 2021 08:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpfj-0008HJ-BM
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 08:40:07 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpfh-0008OQ-Hr
 for qemu-arm@nongnu.org; Tue, 20 Apr 2021 08:40:07 -0400
Received: by mail-ed1-x52b.google.com with SMTP id j12so19831353edy.3
 for <qemu-arm@nongnu.org>; Tue, 20 Apr 2021 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a2XHWKLD5lxI17OV8Z1HMszFDbeXH9zC+F+5aHYxxkQ=;
 b=l2XA9RYv2G02YbXrJqDm9D2SCgYZail6i4sIayFdac10+RNHVxgTGMI35tMKhE8pgx
 jioiWJk1v42PoZNockDV88o8plnN890BQrCA4iFkLEoZj+PGijuMTxi5mN5amR5fwlAL
 d9Lv16ZYJtKCdY7FXtghuDjAWvTZVbmKKxmEyahJmvy5L8afxS6k6tX5WvyGYklONgvY
 JoGJQRYk7cL+2qhysrlwMG/GZpD7QBTHitfdNVg0oGY4RAK8qjnjyZUZeE14+6pEe4XY
 OtRSOTiBC8UG1pvJTKjaQepymjbYmOpKG0vn0/c68+LWL1M9q8+ToPfwC6S4WPdVARU0
 afSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a2XHWKLD5lxI17OV8Z1HMszFDbeXH9zC+F+5aHYxxkQ=;
 b=Kwlrj7HxP5GoN67CsF6iVXHTTUFjBzSZNfIpBO6DqpQrkyC5NODC4rzbubejGr9HSO
 EgV+QRGpwXEfdil1MQTa3YZRaNgbxGVckGrWNXwGHCKT7OZHJoW9pFqcjeTpVf3Md1RA
 LhCJ6GCdh5bhArzCk+fysHg0VJ6yW2vCIAr1fEARlOnoSsuuCSn500wFu1BKx4cHG6hZ
 qUCvqBUzIqzfagn4T+oqx1ncbxqp17xN1QhzDYTGEJUf+r8xNHxfJDukjl7pwP6YXLBK
 +SZ1QNyp6feJAi0TXDXK/RKkW3plsyaDTbAAj71ixPZd4sStj1uGscXCH2ou+IIV4qSs
 b2aA==
X-Gm-Message-State: AOAM532JCyUCwkNfXRQztHhT78aw7O/YKwKzwhegVbi7UqkbWyCzNUSj
 6mwoXdvpHzwahDoT8WdQuR8jlfWZUixojnn41UWfbQ==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr31792707edv.44.1618922404127; 
 Tue, 20 Apr 2021 05:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210325163315.27724-1-peter.maydell@linaro.org>
 <20210420062357-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210420062357-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 13:39:12 +0100
Message-ID: <CAFEAcA8Cye=jxLX+wKFimov8bo=F_6VF=tFbjskDo3Qe=6O8+Q@mail.gmail.com>
Subject: Re: [PATCH v2 for-6.0?] hw/pci-host/gpex: Don't fault for unmapped
 parts of MMIO and PIO windows
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Arnd Bergmann <arnd@arndb.de>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KSnHPcCMYNGB

On Tue, 20 Apr 2021 at 11:24, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Mar 25, 2021 at 04:33:15PM +0000, Peter Maydell wrote:
> > Currently the gpex PCI controller implements no special behaviour for
> > guest accesses to areas of the PIO and MMIO where it has not mapped
> > any PCI devices, which means that for Arm you end up with a CPU
> > exception due to a data abort.
> >
> > Most host OSes expect "like an x86 PC" behaviour, where bad accesses
> > like this return -1 for reads and ignore writes.  In the interests of
> > not being surprising, make host CPU accesses to these windows behave
> > as -1/discard where there's no mapped PCI device.
> >
> > The old behaviour generally didn't cause any problems, because
> > almost always the guest OS will map the PCI devices and then only
> > access where it has mapped them. One corner case where you will see
> > this kind of access is if Linux attempts to probe legacy ISA
> > devices via a PIO window access. So far the only case where we've
> > seen this has been via the syzkaller fuzzer.
> >
> > Reported-by: Dmitry Vyukov <dvyukov@google.com>
> > Fixes: https://bugs.launchpad.net/qemu/+bug/1918917
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
>
> Looks ok superficially
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
> Peter pls merge if appropriate.

Thanks; I'll take it via target-arm.next for 6.1 (it'll need
a tweak to use hw_compat_6_0 rather than hw_compat_5_2 so it might
need to wait until the patch adding hw_compat_6_0 hits master.)

-- PMM
