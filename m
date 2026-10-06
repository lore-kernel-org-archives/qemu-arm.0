Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A898CA6002
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:53:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENGK-0002wj-8K; Wed, 07 Oct 2026 04:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEJA1-0002tu-Rh
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 00:22:20 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xEJ9x-0000SO-RT
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 00:21:44 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-43bf9548df4so809346fac.0
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 21:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791346899; cv=none;
 d=google.com; s=arc-20260327;
 b=oraYqQRiIJsxyXwYC3OP6zrVQRyS+noIfrqGKjsuREFU9BjT8vjO/68d3dQal073zt
 +S8VNrMRk2t/ncrgcL9upI5H+Y7M0XnJzVWPCPZNR3bLRmRxgjYSRxb0ggnev9t+yNaj
 MsNEobOramJ0PpQkRexuKXlDauXGYmH7/snn+Y8aWbEbURmMmymHjDULQYVqCphAd94Q
 hohORyr33n22urg8/L9DVV4FvRHkDmitPsFQlncJw0mlyIcYJpZsXvU1MwG41BI74Ie7
 ikhbqj5SQ7ruRoXl1dgQNCELgeUfmKvf1fMmwaFTpKu8FZd0vkqQddM2fG+oLgdmqoos
 3H9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=HkwWpUWf1Y20pZlisA4CbYTVY7eX0xphQ5BeJwKWgLk=;
 fh=1M1xZGoZhTLDv9BnQzUpd//voByUJW4w4zcpnqO51zI=;
 b=XjL0o9CxiE5RGZK9CJ6lchApOeF+d+hbuG+NNPEMDECMZRGEL67wsFEhCTZEvJAiKY
 HF1VIwN2kIJA7s7D31GE9yyBWwunZ3HY9qTA/v0v2gpNRtAhR/WN6a+PFw8a++nSqc+u
 5gzfAGBWEw/I+iu7kdqB+1iYADXMt/rf2Zyce6Rfr4yhxl+sNprlqkADLUvk2hYpvT+0
 1+IB/CKs9O8jkIJPl4fXRy5kq4jxyNSYxPRcZwQTnzoCJx3oL/jXXqKbBz/wQjtGIxJN
 qnyetMaMAJ+RcBgQD803+k5ECbp1w0IASc+CJ50bejnvFo5sNFMWMxpl22Pkrp9+IQv1
 34Dg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791346899; x=1791951699; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=HkwWpUWf1Y20pZlisA4CbYTVY7eX0xphQ5BeJwKWgLk=;
 b=b8v3XeYLv50ZulchkaWjRMUXKe7jWeM9xS21cyRgn8WK4KIpcb4/FwVWGftrBgAheS
 j8FRhFuKBglt3O/LRkwMm6x0+nPgnJLUrSZBZqyuTfssBb8207IIDdu4ndGXoqRqXDxQ
 flIwmbU2PJLei8T9pyBLXpObdI4vCicuB6fS3yD0PINhaBZ66kulOOn4H/i9dU+4CgnD
 WC3R+WxEQSYKFRcSJThc1y8zxqfZQ5vUVxgmKqRY3YJRytUaJ0RFvx3hVcWq/OUlXOxf
 mXwjmI1+uMeYp3sWNH8UO7X5PlLnvVfWsV7Z+dM91/EWOxMumoGHgcXTioiaDiBtK3SI
 t1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791346899; x=1791951699;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=HkwWpUWf1Y20pZlisA4CbYTVY7eX0xphQ5BeJwKWgLk=;
 b=WZ+rRwkGQ1dSbVV26VRWQNJ6WI+fQ+lnjVBGbKiV5u+L1URFiz6+pPxg5WQTnaqdQM
 1GsKTS4aFNvWEEOpJFDyly2mEvy715ug1y+2GYEtCblL3bsVK0yX+sxH69ukwnzrrFin
 zsehDjfsRuUCQOR9EwUpJaks3fJ5yG605K4/FRhtZe4qSflYAsdhIiQBbrxVv/OCWyVl
 lzTdEsAXuMcl8h4sa4oG2gXaMYfDU5wbS1hYaxsKeEqfyhyL3R9dpopboP/0SqoEHo6/
 D/oTm5hy6C0bRGSCPrZZPoY2QHhZyM8ip/poy8vACgAj+8hUQY0zuGFU7tAAnn+xM+Up
 Q1HA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzLVH1XlDOHyPGH6D0sfFT3IsuJTwmyg1rfNBy1EewgbubeyqRtZJieTxRZY+0b6UV7imVZOyqAfA==@nongnu.org
X-Gm-Message-State: AFuF++nKfEjB6f54ccLypGKAJJXAVoHjfvoa7CL94VSNIM3/c0tA1SNU
 +h3+GMj4fAZUKAMkK3CA2eTnLQR3BSwoIwxu6wfxaKHGWbQUmCJaVT7LgCe1TX2LyAHWFcGCZuW
 GF7XgiYPuOJ84b4ikDUxEbVz1w22W/Zrk8qb6l15CbmLN81I7460Yd3Q=
X-Gm-Gg: AYBFou1Vc6YnbU8DrnBoFId8ZPK0c8WeYbYNCjOBeKlm6SPk+kC78YOgKU920aYggj7
 NCXcy5w8fnVbiWHvrUfRKVY2CziNv+tDIgMy50BNrTE/CE83ehlUEUIhKhIqfJRouqDwxldTEdj
 w0omyAikqc92pL68OMf4YxsEDdfMNPafKvI+DzWwt6MFsPj0x7hM0nfxHIu3ed/Bx4jg7wlznzc
 N7wkknhbp1WRBo/sR2B5KOm8c0NsR2nGgk9ERUPFf60rodNCXatdHEF/xtCRIXmSG7gr1vbqxlb
 zFByCR1Aef2pg7tqGvjVbxr0nSmgWMhdAFASUej2aG0iy40hJds1PI47W3grYNfTn4PtalAz02e
 N3wjWkcRrDzgwGjuuK8+TDOptpZZ83XiUsus+dJU=
X-Received: by 2002:a05:690c:39a:b0:882:31:3af9 with SMTP id
 00721157ae682-8b04f12a3f9mr2223927b3.9.1791277438337; Tue, 06 Oct 2026
 02:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20261001175003.ttbr-baddr-52bit-0-fuad.tabba@linux.dev>
 <20261002070925.2627344-1-fuad.tabba@linux.dev>
 <l5hcpwnktn2hvbt55ux42xzb2euc5zqohnxtaiftr7lxynfx2g@myyytd4e4owp>
 <20261005214451.1036668-1-fuad.tabba@linux.dev>
In-Reply-To: <20261005214451.1036668-1-fuad.tabba@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Oct 2026 10:03:45 +0100
X-Gm-Features: AclHuK9ZcFrcVklEzJUIN7JogE4OZ7PYlAzE5S0LpUa8UAR5XOcsOZ2nhDstIMk
Message-ID: <CAFEAcA81JuAjk-aOnBWcT1ZXWy0U9tVrWRoa5yYQ4WtvhZJKjg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm: Clear TTBR[5:0] from a 52-bit table base
 address
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Gustavo Romero <gromero@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, Will Deacon <will@kernel.org>,
 Itaru Kitayama <itaru.kitayama@linux.dev>, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 5 Oct 2026 at 22:44, Fuad Tabba <fuad.tabba@linux.dev> wrote:
> On Mon, 05 Oct 2026 21:06:44 +0100, Gustavo Romero <gromero@redhat.com> wrote:
> > I'm wondering if the fixes should be separated from the tests as we usually do,
> > but feel free to wait for collecting more input from the other reviewers about
> > it.
>
> Thanks! I kept each test case with the fix it covers, so each patch
> carries a test case that fails without its fix. Both forms have gone
> into target/arm, including my last contribution. Happy to split if you
> prefer. I'll wait for more comments before doing that.

Personally I prefer "fix commit first, test commit second", especially
for cases like this where the fix is a one-liner and the test case is
150 lines; but I don't object to single-commit strongly enough to
require splitting it if it wouldn't otherwise require a respin.

thanks
-- PMM

