Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3975149lfm;
        Tue, 23 Jun 2020 03:35:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT5ATPw2YARULcw/ZgJ3k2kX77OubTdXbROwLKFB/gpkuSa277o1JF1y6oAYVgqsQKy7jT
X-Received: by 2002:a17:906:3958:: with SMTP id g24mr4906391eje.26.1592908547691;
        Tue, 23 Jun 2020 03:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592908547; cv=none;
        d=google.com; s=arc-20160816;
        b=NzirpuMkGfaprAvLrHnueFp7fDZjkv5oOBJo6Wsv0So8YMYs8OvSdPZ+35+zhOOTdU
         AR4Of9XsxxcJv4MgLj3qt9eR/DJmEQIcvE3NzZYtTys72NWJOhWuhqJbujU679KafQm4
         2581Sj93WmNj/Ut17S8kEiTtIaorM/EojJ/XrE9LTw7ZzIeDaNrY4GskVp07cpIH9aT7
         KEJJfakD1frcG+pTts2ICnQLPGjW1QsQdOXGSkpdZ2BIS1u3zuGwq7WdGN+flCf6Ks8p
         4XBi0ZpPwk8tbNcEkvwmoim+qMd8BLTdSRgSanRKi6YRtkO9Y5OCJQsMX/UduIXPq1bj
         3bmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bIkwkdvNiJAf0orWIsRcV+UMCPxDrTLTXZw1i+6s9m8=;
        b=qJMeBhIZcaNtplODdvI1Srde1Lvy6serBqBPv8gnPzWyc/QqU8JZ8VdxUTSDmnaWQZ
         6lH2v5HOohWd3fsLF9t8UzkAd5FB3zhM2LqVEc9JPZH7ZF7Kyb9DrCE7GORmD+idit0n
         VtmdKMCAf2fc7iFiSl4QYB1UmBlYkZjktXAXNfWGl9KC38Smqp5/SyitiWU7QMj4oKsb
         kf+ZVBIPIlfod0k70SETLWSdHlGlHWyhDpuOJhVdlj7DhOPqnoqujvkXrpL/5pU+DcXF
         oFht9UHQaojoKMZKygV2b5MfNOnHRIBcG2zsd4+ib4UG6Phmq4A1s7dvG2sg/WFBEeey
         Q8YA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jsdGyXlM;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id ds10si13336135ejc.183.2020.06.23.03.35.47;
        Tue, 23 Jun 2020 03:35:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jsdGyXlM;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732191AbgFWKfq (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 23 Jun 2020 06:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732172AbgFWKfp (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 23 Jun 2020 06:35:45 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E939CC061573
        for <kvm@vger.kernel.org>; Tue, 23 Jun 2020 03:35:45 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id g7so16024791oti.13
        for <kvm@vger.kernel.org>; Tue, 23 Jun 2020 03:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bIkwkdvNiJAf0orWIsRcV+UMCPxDrTLTXZw1i+6s9m8=;
        b=jsdGyXlM+aozS095vIDQ9z3AsMIz2IuqvFkoRBLOHjAs2YFVra9Obs8pqRn/1N2kCA
         /UZQ7+V2uZ9q7LDElnCRdouBeEBcxeCj4bzwVos11VvG207PKfFJbefraEv3BipqzY3q
         tWDJkaCMD6OcUQvVGA5GzhKADn2+ZDRzPaLePVEUBD+kwzV5wMYjlCLh7PbyBlRu6k9Y
         YXvLk5zhMtILKsspnH/JLKcR/3VQTlmXU0pJAmwAd7jc+1ln4dh2iUddq7nhXCIKwmqP
         gFJWd7icMnFwhFl03riL14MKEQ6Ppz5PAmGOAccGXXyXXO43aKVvnxHwlWJO/1GQxIkX
         ifeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bIkwkdvNiJAf0orWIsRcV+UMCPxDrTLTXZw1i+6s9m8=;
        b=Zh0WZ8eTeMwz9hlMTGcRH4LHasl2kySxkEhC4T2c3b0YNVcYk93iECo3bLjYNeEh4X
         EGVTmlHW5s/CY9zJwfjJR7T45g1aYltegiBXpX7ow4+XDeQQegShCXC7aerZA++X5G45
         Lfz9PqQkGXOgiYO3uIHK3PjkkJau3UI0kdGXfp4Ejw/pbrgfNzsd0sh7eneUhCvILQVy
         fQGts7rW6I+JvaoCsP3v/7CwhBSrV/SbgXfWy0cUdvG2YsOu9edfVY0wG7osDAm/IWS1
         zP1hZu6Qa3yZ2MKfjABTGo6n0S4wkPgHHWQAti7F8rvbub6hc2A4lkvCOfoe2yHngEhk
         UBQA==
X-Gm-Message-State: AOAM5314Gz5EqtkW8jC6plHctXVhjmnNr6x6QflgT8ekqX0xgPRnrcD5
        XepYRW7Zoo03rD8sBX6+nk+akScEI7P2IuIeWhjHGQ==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr16897084otn.221.1592908545318;
 Tue, 23 Jun 2020 03:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200623090622.30365-1-philmd@redhat.com>
In-Reply-To: <20200623090622.30365-1-philmd@redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 23 Jun 2020 11:35:34 +0100
Message-ID: <CAFEAcA-HJ0Zd5Ad0EO3SeOue5NWyg=FSVwUquOQKweYtiBkJLQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] target/arm: Fix using pmu=on on KVM
To:     =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc:     QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, Thomas Huth <thuth@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        Andrew Jones <drjones@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: GOsakG61JLZD

On Tue, 23 Jun 2020 at 10:06, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Since v2:
> - include Drew test fix (addressed Peter review comments)
> - addressed Drew review comments
> - collected R-b/A-b
>
> Andrew Jones (1):
>   tests/qtest/arm-cpu-features: Add feature setting tests
>
> Philippe Mathieu-Daud=C3=A9 (1):
>   target/arm: Check supported KVM features globally (not per vCPU)

Applied to target-arm.next, thanks. I dropped the Analyzed-by
tag from one patch because I think we ought to stick to a
standard set of reviewed-by/signed-off-by/acked-by tags.

-- PMM
