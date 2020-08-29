Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2279586lfc;
        Sat, 29 Aug 2020 06:52:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa5F10SF4rcxnyZ+3XgjMBGNYfj0HX57RhLfIMKmGHDJTdD86adtpGQavZeNmY1PTJ+Qk4
X-Received: by 2002:a25:b92:: with SMTP id 140mr9099537ybl.406.1598709168317;
        Sat, 29 Aug 2020 06:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598709168; cv=none;
        d=google.com; s=arc-20160816;
        b=hDomzTzXSvrqp0IbdarQVZLyEmj+pv7WPuNmLmTfco6kR2FNp1nA+yH8aBfhzEWFSJ
         Rmqm6jrpMYQpGlHSFnMLsLu9hRUCLFKqdggOqcy4baXo46vRo2jfCkJURBHhVfJiEYM7
         kQzuRMEFrGvNwMz6DJQiJmidwe8u6NvixYX4EbikkniYMYaHHmGjGmupXAj9neDfFahu
         /kqq3NqnT35u6141XGIRBVImH/Z0EYi8uz4CXVblIOL2VAJ9epCJnNoY7TyBJOVSqjgh
         VQQYWRGf+WIrPl/DnqkEE4lyIeihIcr8HmkB+ch00sTSx+JRy+y2uCWc+g0TFRGsn90P
         PyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLoBdnrYojAW/6644vytV0Fe8KUqij1xapHp9AFymdU=;
        b=tpffuTMXxjyVDI64+6kpnuKbV4R6f2eR4sIDWfLFfJYhdaKxWN+kA5CfRkvAdSgu26
         sz2lFBknxX6I1XoHfhD+8Y2W7ICUCswbezZOoDWwnaYsltMIyJVoWJ4TN9vTmX9GjcFP
         DxsBTJQEP79nLsIjlbV98q1wj8d3+QcSh9yzBqOMpPIGySP4J3N0omdpHZgCKKF9XZcI
         Wz8PNyhHoMbbJB11n0HTlI629Y0epD2WnKkebesOjVIQgSFejX1UYbDtggXrFzlygHyE
         cLEOIez8xBIutG46c3BRp1ck4+FVdG0writFQl5buQlf/b3+YT7Uutqv9cp3tI8x2XOx
         rKEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v3rbjyZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c132si2141411yba.438.2020.08.29.06.52.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Aug 2020 06:52:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v3rbjyZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kC1Hj-00071N-Ok
	for alex.bennee@linaro.org; Sat, 29 Aug 2020 09:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kC1Hd-00070z-Ut
 for qemu-arm@nongnu.org; Sat, 29 Aug 2020 09:52:41 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:41045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kC1Hc-0003Cu-Eu
 for qemu-arm@nongnu.org; Sat, 29 Aug 2020 09:52:41 -0400
Received: by mail-ed1-x544.google.com with SMTP id ay8so1571408edb.8
 for <qemu-arm@nongnu.org>; Sat, 29 Aug 2020 06:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TLoBdnrYojAW/6644vytV0Fe8KUqij1xapHp9AFymdU=;
 b=v3rbjyZBCjtVgZ/xg7DvhCKQAop21zsHEJHJfMZPmLXrIoBm+l61D9sv5lVPjmOmxo
 r31q/Aa9le8mTTWEea/WzPIBSVzmYQ69/hB4svxGmCkdL+/wwFdt52qbbUL9cZnrocqh
 sfeWyi1bWpVKPj9m3xPlUNDvzb6mjrmGtMtK2niVL6l8/sd/2slIZLpp5eF0Q0wVX7sl
 r4oeBANtK6wB9E8f97eQWAAinfaAGN7/zrUQCNql40P+iqiqMAQCcAP4gyJiJLORjkDx
 YRTjjtJb4+Jo6X6ZYT3sQj9tRSbgPPl/eepfcSvbjHUR/2ttQYWuozBNNvF9p6xecvhG
 TXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TLoBdnrYojAW/6644vytV0Fe8KUqij1xapHp9AFymdU=;
 b=i3WHiTKNtZQ8SBeTsoudp65bBsHmwrVv36rbnyJAvQ7N4JteZth//KU+wkfpyPZ5n2
 uV099mBos9/ld8GE+K8sk0ME2syZdxsRi9zYjot8Ep81O1UwItJkggYaF5nwKSx5TPVd
 cDAAYulu2mrYc3Cyju8PXJMMzV5jlBtwXBDg/rg4rMHW5bRT8mpo0RTxtWeFMbsaHdnj
 rTxAT2m3pyhL0GGxNpljv0XwvId/30Rp8qw4Jzl3DOEthglCbzJotuBHMLEBT/zBysVq
 wONkLajaBZsnse+xs/9BOlQBvIXGxtPu/bcdUFcX4XlB39S84S5nm8h90WGhYFXZxG5W
 4k6Q==
X-Gm-Message-State: AOAM532GafdObKpd3KdVlKZnOQt9v5Ab+KXoKIOBlpUKkIeT3i2tkvsc
 76lxgZgdT62A5XDgS7kyXtL1p2IIXNKU5x+AudLHAg==
X-Received: by 2002:a50:8f45:: with SMTP id 63mr3646506edy.52.1598709159264;
 Sat, 29 Aug 2020 06:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200828183354.27913-1-peter.maydell@linaro.org>
 <20200828183354.27913-45-peter.maydell@linaro.org>
 <1306a667-216c-533c-9107-e42aa9ebfa24@linaro.org>
In-Reply-To: <1306a667-216c-533c-9107-e42aa9ebfa24@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 29 Aug 2020 14:52:28 +0100
Message-ID: <CAFEAcA9nVMS9YhemLcBbVKgqTwtubO0sB+jb=FTLQ8sTUANm+g@mail.gmail.com>
Subject: Re: [PATCH v2 44/45] target/arm: Implement fp16 for Neon VMUL, VMLA,
 VMLS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GSMpF/uHn9VK

On Sat, 29 Aug 2020 at 00:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/28/20 11:33 AM, Peter Maydell wrote:
> > Convert the Neon floating-point VMUL, VMLA and VMLS to use gvec,
> > and use this to implement fp16 support.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> > +    /* a->vm is M:Vm, which encodes both register and index */
> > +    idx = extract32(a->vm, a->size + 2, 2);
> > +    a->vm = extract32(a->vm, 0, a->size + 2);
>
> I know this is what the current code does, but I tend to think that this is
> better done in decode.

Yeah, I thought that too as I was writing it, but I didn't
want to mess with the decode in this patchset, especially
given it would have meant I needed to touch all the non-fp
scalar-indexed operations too...

-- PMM
