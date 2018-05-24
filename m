Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1806163wre;
        Thu, 24 May 2018 05:29:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL/ori1Fjx4HyfZW1o5USz4Ph6auCOVchmtTgFsi7lu+b3sJ/qD9SoQ9xyc8qSyG1BRMte1
X-Received: by 2002:a37:ddce:: with SMTP id u75-v6mr5570958qku.147.1527164968181;
        Thu, 24 May 2018 05:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527164968; cv=none;
        d=google.com; s=arc-20160816;
        b=KEgzTYvFO/4l2skQ6y1iKgz6aQo/0boUMko4r2wT+TFQSkK7v9JFLhjhbFjoIMZn+a
         yxhcNWIBp1tEViZ2LJE6xr+CKDsxOqareY1E2oYHto/Z6EjLnv4CkocfIf+XsRVAclea
         IdqfOzOunONZfmfMOq+77Yr4bYrsb3kkdl53S+uUAyFDPE6Hov+wD34d6N8KoDofBVy9
         tm3zLiZXKMUg4BcVXlz7ykRYWYAV9nqX5EoBKuqVGQSwSI8mwuEyCrs4srPbLQtXorMv
         27IN+f1DuhswrYglXXD9NOdwz5IYz9KfaN4prolkfntPCaN/njUTnHDpJyc1aF0VQfe0
         8WxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=89M9EwgyGk+Pi134D7dU7Mc/PgKUqk/GkOvkZc/vT48=;
        b=e5JeJEQqZnhlXa4gNTTrCjLGjVsCGcVjsavr+9WyPaKmkkq9v1I2xe+KSUbNpjG/B5
         EZPwMFtxGcqjux6OIi61ZbLufZ4guFkcEKjQH+nQzjzuN6z7JX7pvOwg8FSslP67bqDI
         2mnMMCtYNEY91PgN6hiklbP1oGoL2aPsLzhezxx0KnPMDtGxxi62PQeY238CsezIFX4H
         XaIsLHLPGxD4gcUiyW4RHIQGBjrzGrv9DXQvgOqX9ya6m0UHlJ5K0wHNPxIjy11wIRHM
         kLcCIPJ8DTyfd2ZAJ/asLEyWbBi2KpvCXWP55LdeoEslcx2aLzjlmvQe8JYEpBqUu6zV
         2tNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HdadXFk2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l7-v6si7839852qkd.186.2018.05.24.05.29.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 05:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HdadXFk2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLpN1-0001eQ-PI
	for alex.bennee@linaro.org; Thu, 24 May 2018 08:29:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLpMu-0001cd-9K
	for qemu-arm@nongnu.org; Thu, 24 May 2018 08:29:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLpMt-0004qg-Bt
	for qemu-arm@nongnu.org; Thu, 24 May 2018 08:29:20 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:38590)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLpMt-0004qE-7A
	for qemu-arm@nongnu.org; Thu, 24 May 2018 08:29:19 -0400
Received: by mail-oi0-x243.google.com with SMTP id k17-v6so1256234oih.5
	for <qemu-arm@nongnu.org>; Thu, 24 May 2018 05:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=89M9EwgyGk+Pi134D7dU7Mc/PgKUqk/GkOvkZc/vT48=;
	b=HdadXFk2bf2GIcNlO9wiWfaBVcou+vJJQXe2Z8mIcjULVJJSYKjcNpXd2UjBGumUaf
	NmoyNDSJDAsj/BVIf3xTcF1i422IdBKr+XqcE3ixNBibrKhYftZ7PJyPUVSjEZHWUh0j
	0h7lLYLj6u/2i4X6QJ0ibLKF29hH9yLimcwSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=89M9EwgyGk+Pi134D7dU7Mc/PgKUqk/GkOvkZc/vT48=;
	b=NYjz0XOmDLVKhojLppnkOJnGixSA4GFYoa6tJFk3ytnVY7MJsgG698NaD0Q82nZxcD
	Te/o6YqX6GBL7wSNmYPU+mUUse2QmoL0wf3b1lW2fiiE4mh7FqR8Gt75d6/2yES72Cq3
	XXeULBsXIgybgFLnc1f9aRkCdd/TSK2xZMTPJk9uDYBvwGmfbVZWPUgBInXgFQvdJsMG
	5Wp95ummeTKNIwg7stPxiJEiSikMqsAL/WQ0CJVuSY4/lEVGWRhENt1ECkq82kJKkSTt
	bf2qfJ/OjiqDYpaEVWvP9yEs4cmtgF1Od5MVFBBkQejIkJyQXOwOf+n/ppR7P9fSbeA8
	pX9Q==
X-Gm-Message-State: ALKqPwc3nyDLOGlGmCgHNBUg8jGN2p8Rzxo2jdkK/zUVu6IWi/972TBP
	k0s1RGVbFzlPsswpouqlmeajBEJ1FQMgsd22Q23yPQ==
X-Received: by 2002:aca:b855:: with SMTP id
	i82-v6mr3878067oif.12.1527164958396; 
	Thu, 24 May 2018 05:29:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 24 May 2018 05:28:58
	-0700 (PDT)
In-Reply-To: <CABoDooOCO+NCjZaPVa6jFzEWztHSBDEMfsmjbJ_gOGNk3PRWNw@mail.gmail.com>
References: <20180522175629.24932-1-richard.henderson@linaro.org>
	<CABoDooOCO+NCjZaPVa6jFzEWztHSBDEMfsmjbJ_gOGNk3PRWNw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 May 2018 13:28:58 +0100
Message-ID: <CAFEAcA_YoGsJ_Yuc5EFBJwnANdNXb6YQ3tV5pyDr8RD=0itXbg@mail.gmail.com>
To: Laurent Desnogues <laurent.desnogues@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] tcg: Fix helper function vs
 host abi for float16
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1R7Yukjqr3pU

On 23 May 2018 at 06:10, Laurent Desnogues <laurent.desnogues@gmail.com> wrote:
> Some AArch64 tests I had that previously failed on a x86-64 host now pass.
>
> Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks for the testing.

> Perhaps the two occurrences of the following comment in
> target/arm/translate-a64.c could be removed along with this patch:
>
>             /* write_fp_sreg is OK here because top half of tcg_rd is zero */

I think this comment remains correct, doesn't it? At this point
we've just called a helper routine which is 'f16' return. With
this patch, that means that (by virtue of being uint16_t return
type as far as C is concerned), it will have returned a 32 bit
value into the TCGv_i32 whose bits [31:16] are zero, as the
comment says. We require that because we're using
write_fp_sreg() to update the vector register, and that function
zeroes out bits [127:32] and assumes [31:16] from its input
should all go into the vector register; but the instruction's
semantics require [127:16] to be zeroed, and it's only because
we know [31:16] are zero in the return value that we can
get away with calling write_fp_sreg() rather than requiring a
new write_fp_hreg().

thanks
-- PMM
