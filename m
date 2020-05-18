Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3170822lfb;
        Mon, 18 May 2020 09:08:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR72iZbCIn7q0L4Uc6VseefcL0Os32PAiL562h2BIqhZXU1r6N+Q8PQlYhD4td59/l9gUr
X-Received: by 2002:a05:6402:946:: with SMTP id h6mr15029822edz.245.1589818115868;
        Mon, 18 May 2020 09:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589818115; cv=none;
        d=google.com; s=arc-20160816;
        b=ObdW+nrxyWsAjTT/gKHsJLjA28AUGSO50kTKmw7kfu7EzpG+kGIqTv8oKj/9ilWU8S
         og0T55yLLDNrfAbL2cSr/miQc5/REWTRUyL5xPBPYB0IerEPQ51TXGnY+x2GswKt5uwp
         fZXxozQKZfJbmwTaSC90tr1O/bJOb+Azpu0mv5hm714Lkz9jSvtD5bdkDlZutKyXtQyf
         YFsbXQkLA9P9KeuGJNrD1+pD58MOkx5XNajxx0os7RvPwAkmOm4HbWV49C6GTlYWj3Gi
         WGugSdUHYPYv0xQZTKQ9iBOCpqzv4l4KbN7maoiOD13eVnG/p4VZI4GVbB3jMPxEqyWY
         JbEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=aEvHPXNLYXl7vuRStaAwfAn8MfOBGgU0vV6HazBxAbQ=;
        b=A5ctM7Jiy0e4jBMVd++HjPf/drTC1VqFfk8i9mSD2RMbwWhJ5FKCaol7LfgqX0ugij
         P/8Bx+JK84B6mOLKKfjXdMeCwo4AAS4s9X2uYbOLKSevZymloHzCjojdRveaZRnCk62u
         sfvRiE9uqD+zHrDeF3Rpn5cVPzqfDOgZlg+rrFR8Bu4IQAIReV1vF/R/ZyiHsN9LLhmp
         ytGDRAekJOmrZvoVo66mcqpylthR9kamPruas0+Qpcpr+9dnkXYhK1RQ2Dg0xkTmMYfR
         uB4PqAOSsfvxgbhC0hP+FWXPYSYvdeHBMT9IbqJpbL/OCQJSmJ+7zm+jm7ExvnexQ/kL
         Wiog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZmaULcU;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id e30si7350810edc.267.2020.05.18.09.08.35;
        Mon, 18 May 2020 09:08:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZmaULcU;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbgERQIe (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 18 May 2020 12:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbgERQIe (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 18 May 2020 12:08:34 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC7DC061A0C
        for <kvm@vger.kernel.org>; Mon, 18 May 2020 09:08:34 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id 72so8515151otu.1
        for <kvm@vger.kernel.org>; Mon, 18 May 2020 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aEvHPXNLYXl7vuRStaAwfAn8MfOBGgU0vV6HazBxAbQ=;
        b=kZmaULcUCuC5rGz5m3brTjaDP9cEzdfKcaeMbPHGQi55NYO859kdMylN7xaj/ag/bv
         SreSZqJEUMFVpQ4KJaDU7lvW3SbOr8FS0g1dYWTyRM8Hd/aQeQ4yLQLg3Z+PzBicRxuY
         O2vLG7K+AfvV2wYisVqz3Mipw7AE+NdIxrQHSc9tQ6QYfdCcMgvONyfPTx/kbx6pk4rk
         qxAMCyhbgvUu2To7RfjfpHc0yOm3/7CUHXjoLAzJ3SO0m1PIax1mk23pgxzuxEH1z/v2
         1Ox09rG2WRS/gMxa23xMj7MEPuMCo1/LaeBAbqpWIEQ7kdhaU+LSQSfUXOoFhijijwXv
         vNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aEvHPXNLYXl7vuRStaAwfAn8MfOBGgU0vV6HazBxAbQ=;
        b=tbKL4wYU/oEsa5kVbCWQKhUm+ZSp4mXrCh1Q45RRhQuYCjaQiDx4jlSmiGHAVBrhp/
         sD5cxXhVmC9Y2085RmY1PtqMfmiGDCj8VwBW5PZzZ9CLD3cGpM31rxVd2E6WxGnVhguj
         Lx+f2yNDXMEu/Zuu8Oy9n9z1zmPuZRTGNq5qN9bT1NU1NCGg8L7zV9aV71iU5Wp5FTew
         sd0gCze8qdRTsvDmmYpV+Svd651VABe7aUnNp3ykbdQqg/TqzLPdfKJPPNARdMCp7MaG
         EvrMK1rVucEAn3hpnxsgjAc1sVfir9EbPi0eR7oKX7u8o7FicmvvopWrk7+Wlk1aXhdb
         Yi6A==
X-Gm-Message-State: AOAM533e6UQEgSbtWC4E7xFz7EmSMZ+CJR7YPdbdXor2d0EsoqfwSIuS
        xBewirgjlVbeYdDXVk7Sg1FviviyS/ccCPeFS7Za8+75hso=
X-Received: by 2002:a9d:b82:: with SMTP id 2mr12243999oth.221.1589818113522;
 Mon, 18 May 2020 09:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200518155308.15851-1-f4bug@amsat.org> <20200518155308.15851-6-f4bug@amsat.org>
In-Reply-To: <20200518155308.15851-6-f4bug@amsat.org>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Mon, 18 May 2020 17:08:22 +0100
Message-ID: <CAFEAcA-rmLFZy5oKB_-Mg5MgWV+=V1rJJcLVi_Bp_jMbivcJxw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hw/arm/boot: Abort if set_kernel_args() fails
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc:     QEMU Developers <qemu-devel@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 8uaU6valmEZP

On Mon, 18 May 2020 at 16:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> If a address_space_write() fails while calling
> set_kernel_args(), the guest kernel will boot
> using crap data. Avoid that by aborting if this
> ever occurs.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

I think it's reasonable to make these be fatal, but I think we
shouldn't just assert() but instead make set_kernel_arg()
and set_kernel_args_old() return a success/failure indication,
and report failures to the user as fatal errors.

thanks
-- PMM
