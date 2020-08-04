Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp661282lfy;
        Tue, 4 Aug 2020 08:54:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2zcHGn4SmkuSCM5Vwe2nRY+zErQtJBImnEsy9SAUurSZK+sM8kiPx8qW0HWsAYA7DJlr7
X-Received: by 2002:a25:1943:: with SMTP id 64mr34753684ybz.14.1596556481814;
        Tue, 04 Aug 2020 08:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596556481; cv=none;
        d=google.com; s=arc-20160816;
        b=iQ/udkZXh2PR0e3JRO58zV/3fAvxhnsUpGsFrQX/CF9A6dDayHJqiJeFz36n/J8xHS
         OZxcH5oNFAGhjel6ZSm5P6ce/d+tjbkZ22ffDDr702s4aTaJJdWardEGV+n3FlyavStX
         lKvTCFMwCnKT8HrsA3NnYNwP6uJT+WWWZK4w8dpvm98lHw2k7qnoQvS4F79VS9914spb
         rOus2egs7iTrCeAvlX8N6RRWaJdA8t6CDqaGQmEJfi7KM67vZVyQa5517xJ8wQ/u8TfJ
         j43sCU/cIqZXirTSWqLMfn4Z5t2upL2q+pOJT9gqQT63aAS6G7VoDnLObcjkoWmHwluV
         /ABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xoK0WiUGhLpGnrJ2vhZq1Alo3LimPJFn34EgjQ1/4EE=;
        b=xgtmdTD60iF6+uQ3vKfEXBYusRsYP7BB4AmOGQ2/nQ2mzCsvkrIDLBnhc7wz/UpSzn
         bgbQDaMrnP8U/kUwyC+D/WxBysgriSkoTlBZDtQUwaP9y/NyyR/X/wF9DK31DN2IV8AM
         DO3j68ECxzYhHUSg3JhNQ3VaDyH5txrhDK+EfFTJNZ4TeSjktxmJ8in8SAt+QYym4hTP
         4LAPo834XsKOF4AFuNyjIBB3JNkcn7riddImGkDx3dd8j5eMeWDIuhwlCVYOGSxfKHxA
         9HuzN0JWCgXu0h8W9ZHC/UW/vhKuJb/57s2B5t5+ikwRC3NBai/+xOSydll4Qxo7YPsB
         fxTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n6iEtASl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si18121200ybs.77.2020.08.04.08.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 08:54:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n6iEtASl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2zGz-0001DE-5s
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 11:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2zGg-0001AZ-8v
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 11:54:22 -0400
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:44994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2zGd-0002Wz-CN
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 11:54:21 -0400
Received: by mail-oo1-xc44.google.com with SMTP id o36so8093734ooi.11
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2020 08:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xoK0WiUGhLpGnrJ2vhZq1Alo3LimPJFn34EgjQ1/4EE=;
 b=n6iEtASlM5Znt1jxtgPCEs3pLJevPlrIe7U8LgzS4wvJHu/BiM6rmBcZM42KEiEkrj
 mFVtp21c34ZSYOiM79eYBUv5r4tmezSZo5qbUHSpSyvd27lhCE7YIxDVbTCWAw2Plg2y
 RjxDt1ZAWlZI3MZFI/AiVvwEhXzXCJkd4jVj1AD5J5KIzNAQ5n2ZGKtpyuammh1edyDn
 +Z8++gBURElHbp+j3+I4ZMl2MYU1rHYC4qQ64WPnMuDTCAO4RF23hKcIobRREN8l/5ub
 TXamsE3Pn9EPkU0VDIsmxq6KEkimw9FcnOtmnQgiWgrGFPtayfSbcgBvhzV8z7vxIhpV
 EkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xoK0WiUGhLpGnrJ2vhZq1Alo3LimPJFn34EgjQ1/4EE=;
 b=EwSObKzWy4WgDOnwUrVRrvQx0SBz9eIvSqgPSk8Kw0IgHDRevf6Hh/YDlJqN0sX2AX
 IiI4ISENyCnzMIFLE2tDlHiq+YPLNLorFh6b1en8mmO35cGN7LRxyQxect8FvHlyE5e5
 laDXkcp6l7vUV+QpxEPtDAVYgx8TfSI17orJTJ1FkLRJdKk1FaT1479vxhOzSd+FJx4g
 HF+AHn8AA/G8BwGZM+e84bKFASOSydJoJiBzbIeb4xGxNQFtmmFkuycfw+mVZzVXruTZ
 6NuxuKplbwlvQFf6MDCPsNW3FV9l2LmPgot+AURMfOBftnID/dh6dvSam50axcOmsXwR
 l7wg==
X-Gm-Message-State: AOAM532LGru3vHaUuhWB7h6hUE3t/MfXeB1eTzDYBLAoF3hdi2ZlLUGJ
 F9gydtV4T/6YHYIbf6ZrbB2IjJxR4UPycNDaXl3BGg==
X-Received: by 2002:a4a:8dc1:: with SMTP id a1mr19299856ool.69.1596556457357; 
 Tue, 04 Aug 2020 08:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200804002849.30268-1-pcc@google.com>
 <8d966244-acaa-5f69-5148-414fb63871d8@linaro.org>
In-Reply-To: <8d966244-acaa-5f69-5148-414fb63871d8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Aug 2020 16:54:06 +0100
Message-ID: <CAFEAcA8JkDPNqLXx8OUDWDXdH1brkTm=Lv8Pocqkf5sLLi5SeQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Fix decode of LDRA[AB] instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc44.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Collingbourne <pcc@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: egVT3ucoG50h

On Tue, 4 Aug 2020 at 16:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/3/20 5:28 PM, Peter Collingbourne wrote:
> > These instructions use zero as the discriminator, not SP.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> > v2:
> > - fixed commit message
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
