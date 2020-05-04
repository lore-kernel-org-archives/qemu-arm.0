Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp371517lfb;
        Mon, 4 May 2020 05:07:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypImiZJ1JN04LnPOWVpYEmHUAespB2M7PS/eiaqLL4TK/go2Uo10ETlUgy+PnS2gNXZPCxZV
X-Received: by 2002:ac8:2fda:: with SMTP id m26mr16529707qta.80.1588594033975;
        Mon, 04 May 2020 05:07:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588594033; cv=none;
        d=google.com; s=arc-20160816;
        b=Q8EwZ19mP6SbuR/Wg1BE4D58r0YzxqtCLQEE5MrlXPFRTG6Zw1SCloPjyIcjy2ijgV
         FuIG9CN6PohsnjJPxKNjr/BtN64/12uv8n+6++ZUxPvTlP8K3JclSbGH9NLf48u0+GVK
         jCOzMn44BWfTMnPujaLt7eZsF6g/9Fi25rm2VJTT4ms12zptMDEoBpq0WiXnhU+5Fmgv
         DUbThcfkyYcbLuSwpxxuAM5i9eLmJHPpbEGB0VJRwS0aSLKLRTvpVFYXhOvPGlfmPXHt
         f2Ikq2gMDM3EuRq+hazlffUKyFlnXv1Ro5hPCkkvuMlX0Us40W8gc1c9TChzTsP/uD4l
         y7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mc2OiBAeuadvg7stvx74vegh5mSzJafd3UHWJqIoSzs=;
        b=grT1kZO5BC6NV0coT8Pm3ChI0U0VdoyYlTeE2B7P/IUurlsP3pN4W8iS1dYb4QdoIb
         YgyRdZYzKT8OBdVyWEs1hsa0I0QTsr1DcMrMtMzrtPP+zgD17M6Hyg8Dm6rMjrTrIYlA
         6YkR0SSkpqsZ7epzqRWXGO31tRr81U+vgRaGzjc87QNUQa87dE9XxgNRz4mlATdwUjI7
         HZDhsVYkNu/CkoDv7BRI0mjo9LUjZ4MZGM77pT36enVIt4IRr531uaAAQ6A9u09BWXrY
         A4c5yqgXW7YAhPZssVMMOzwNO4bs8LKHiM0I/CreAxOlXwiMCO6oLlbKC2khqFEMkzcF
         U6XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e187l9xj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id m7si6049497qvy.110.2020.05.04.05.07.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 05:07:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e187l9xj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVZsP-0006a5-Cc
	for alex.bennee@linaro.org; Mon, 04 May 2020 08:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVZpx-0003PN-Cm
 for qemu-arm@nongnu.org; Mon, 04 May 2020 08:04:44 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVZpq-0006lU-IJ
 for qemu-arm@nongnu.org; Mon, 04 May 2020 08:04:40 -0400
Received: by mail-ot1-x341.google.com with SMTP id g19so8613915otk.5
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 05:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mc2OiBAeuadvg7stvx74vegh5mSzJafd3UHWJqIoSzs=;
 b=e187l9xjj6PQbjOyV6L1iupjQMquEJaN5Kx5SevW4lkyTNsjVub/ZWNAmvC+cN+Bps
 RmsZiHnIFQPfzBz3at3f83ULzvZrorfcmccX3m5v0HQW1a7KLVs1miUwMP9VUKY2TjM9
 YunpEK6alP4ptRlFVT+XooAV4HfiAnths7FzhHvfi6GAEVl0+pve6UvXJjLSvbae/6E3
 lAa31YJK4LfPGxSWcJAfzpZN7l/GBJmFTeYly/nBr9H6bc3fcFIQ93/bJrbDLh370kTs
 8Umm/tBaMpRphiEBVkx4vgU+k430TI5+v19s3pZ1lf7e9Fn3hnW7PESlMnKw2mXrXhck
 RQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mc2OiBAeuadvg7stvx74vegh5mSzJafd3UHWJqIoSzs=;
 b=aCyoA757Fcb0caSm1wTmykzBf1FXjFbpHijyhSp0SUwGkLJ84sTMVJbS1JaTMs4aNs
 ouSXgdmY4xa3guGizHCOGuYHWuJ3JXlUho5uzsR8nY+HlYUxIWJ7+7nGErd6oqH//vz4
 nxK0fbhtiMGBNGfRD9+9n3ZaJWmcz80x1pFRrM6wpRPkAwPCLLW4fHcFWxe9dZcAK3fn
 hetxgIvSUHDptBC3mNzT4xISP5M9IeZOhHhUt0eawWkb2qG4xvMFiomF514ONQCLf6F+
 g85+ztT2g/r0XW1j7s890K0/DkPPzZl/uWuobt9X4nUby9LUnD9KP9iUARa0zhEVrOZo
 vMiw==
X-Gm-Message-State: AGi0PuY48nc6Y1BjA+QkkxFkWbUazaJk3zkSEITkDFL0TKF5WMU5A18D
 f05oAu/GBIFoFQL4z4BthlEbuIQkFJKuceyyKdaDB3uM7ZRn3Q==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr13706916otj.91.1588593873068; 
 Mon, 04 May 2020 05:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200430181003.21682-1-peter.maydell@linaro.org>
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 May 2020 13:04:21 +0100
Message-ID: <CAFEAcA_-yGrEqF5PEa+Lx0Cc1QuqSKkKHjZk4P-jJOxCWR1qsg@mail.gmail.com>
Subject: Re: [PATCH 00/36] target/arm: Convert Neon to decodetree (part 1)
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wwketiz0RNmy

On Thu, 30 Apr 2020 at 19:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchseries starts in on the job of converting the Arm
> Neon decoder to decodetree.
>
> Neon insns come in three major parts:
>  * the 'v8.0-and-later' extensions
>  * the 'loads and stores' group
>  * the 'data processing' group
>
> This patchset converts all of the v8.0-and-later extensions
> and the loads-and-stores, plus the "3-registers-same" subgroup
> of the data-processing insns.
>
> I'm working on the rest of the dp insns, but this seems like
> a pretty large chunk of conversion patches to start with.

I'm going to apply patches 1-19 and 22 (that's up to
"3-reg-same VMUL, VMLA, VMLS, VSHL", plus the "move gen function
typedefs" patch) to target-arm.next as they've been reviewed.
That will leave the 3-reg-same in a partially converted state
but it is not too confusingly so (or at least not much more
so than having the rest of the neon-dp group unconverted) and
I think that it will be easier to deal with this series and
the rest of the conversion if we get the completed parts into
the tree sooner rather than later.

thanks
-- PMM
