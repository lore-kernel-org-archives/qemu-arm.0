Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp3621768lfm;
        Tue, 1 Jun 2021 06:22:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGvsyKuUsWej9CdeKBY/L9rEZlKMcPq6UyUxy8IBGmaOZdqmXOhkMfDAC5ZTJkYDttUoND
X-Received: by 2002:a17:906:22c6:: with SMTP id q6mr29447322eja.275.1622553723234;
        Tue, 01 Jun 2021 06:22:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622553723; cv=none;
        d=google.com; s=arc-20160816;
        b=LlhggsbHBqJR39NCMqygX5CotOsX5EI1WfhV1P6XuXk1zvoqN5rITmjyeZl2TEFAiz
         PSREBuTWCJyTHQjmq669jdG7WWpDISv0eMkWRUuxGhaGHGj9VB/Z61Ymu0OhIfDa29k1
         3MnWlfizlIcZWq8pbYFgXx/GcFfudWX9oRlx4u8WvyfolcUDDCm9RAk6FZbpYxu+Jx/s
         mO8MepEtuuea/ahwYlwutrtBFOnPkbaFV8awvlVXNjWnoRcF9AZEBuF4dYmE5e6hFiYU
         GJaHAxDPlv5F4zS/fcfXFBIOCAeW/AY6/5NmhND6wmvbcam134isw30mI1EvQao7kdza
         q6nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=ThmhXV5C1Mdx87JvqBPyBVcdeP2i7QEeRJhDPg8Jb0Y=;
        b=xn1BN8GhFrROFJis8S4+lf2OsL5rR1Uto+Rp4Fbtdl/kwFF6zC8g02z7Dl0gVCbBD2
         FODm6QWbpFnNWFlkP2i86dX/ZmYTLTXoThLqB1W/EU7zZhu9gH+sjJxedq3n2XFqrnjz
         YUbSdXs5e23DIh9iwNSIUP+cmWFw8/EqnayaNpcAjTcnmNKkQncSWsQ99Q4Q/zMVxEGc
         f0EWIUC3FCNfosMEDVszusKIUkGAVzMr+DHvAsqkTenNbceXfr2oSZEMbb1lJb+OytUM
         uUR0ynZRJJwVSmCUGzt51vWYnTN9ke+vLJjAIoe6johkQ7rPDv84V0w+8iFWCM6yG3E8
         /nsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UJR7GtPI;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id j1si16629491ejs.728.2021.06.01.06.22.03;
        Tue, 01 Jun 2021 06:22:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UJR7GtPI;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbhFANXn (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 1 Jun 2021 09:23:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26552 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233758AbhFANXn (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 1 Jun 2021 09:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622553721;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ThmhXV5C1Mdx87JvqBPyBVcdeP2i7QEeRJhDPg8Jb0Y=;
        b=UJR7GtPI22bYDieQRkOQP5b0jdBIHRfEETEjU13DSu/xMYUEs3VpmCk5gIDvLx+/5ie24E
        ioIaXtfrPOe0bBncJZbCT/dRvSFmmQ/HnR7Jp/bmJ83oUxjtfNTRxitBhuW1PiP0CwxQXW
        T4m4fG7Cty/tI9RLrV6yMI0GWZH+2xE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-BcLfYdDjOVSfYufOFlYFJw-1; Tue, 01 Jun 2021 09:22:00 -0400
X-MC-Unique: BcLfYdDjOVSfYufOFlYFJw-1
Received: by mail-ed1-f69.google.com with SMTP id q7-20020aa7cc070000b029038f59dab1c5so7849240edt.23
        for <kvm@vger.kernel.org>; Tue, 01 Jun 2021 06:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ThmhXV5C1Mdx87JvqBPyBVcdeP2i7QEeRJhDPg8Jb0Y=;
        b=qNdWc6XeDBsTduTCt5jvNu6qOhwHPruNrJprU28qfO+FzZIDZdy2mTd7YS45voBACM
         z8lB1jVPsiA3DiHYvN4iXHMQ+YWAqybh2XkpCLudEiD36//u0TMMGkyWzxhdxGsZAEVU
         VkAbhZ08mp4YrCzWwyJV/frG9Dwp+O5xIiAKcDkgOi3fgC8YNIBxDBCWoG7iRyd9nQW2
         8QCQXVOeNBqhf0NKyS2rqWx0ejsXvjDLc1vMqXoKohvQZSmae7i79QhUB+aYBKQDUp1X
         kqGtEiYJ7DBjnQLq3fr3rrssELEbJbl/yqkeC/aEALSQuxaUI44KU6AA53kEmzjgIU+Z
         Sw/g==
X-Gm-Message-State: AOAM530lI4IOTwNJCUNcJ8uX95U4rQ0Bo9awizgunBug2d8cTOzfos6D
        ayExQJhvWa5KpiilgeXTZmynYmVdRJbeYkypVXJIN8a+X1zP/5A9DtbuAjSD1l6OUK4GLL4Ijml
        JaaFfiTiJyZ8z
X-Received: by 2002:a50:fd13:: with SMTP id i19mr7558988eds.280.1622553719256;
        Tue, 01 Jun 2021 06:21:59 -0700 (PDT)
X-Received: by 2002:a50:fd13:: with SMTP id i19mr7558970eds.280.1622553719129;
        Tue, 01 Jun 2021 06:21:59 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
        by smtp.gmail.com with ESMTPSA id nc26sm1596965ejc.106.2021.06.01.06.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 06:21:58 -0700 (PDT)
Date:   Tue, 1 Jun 2021 15:21:56 +0200
From:   Andrew Jones <drjones@redhat.com>
To:     Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc:     kvm@vger.kernel.org, maz@kernel.org, shashi.mallela@linaro.org,
        qemu-arm@nongnu.org, kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH v2 4/4] arm64: split
 its-migrate-unmapped-collection into KVM and TCG variants
Message-ID: <20210601132156.qtgcfkvlr7i7rf2d@gator.home>
References: <20210525172628.2088-1-alex.bennee@linaro.org>
 <20210525172628.2088-5-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210525172628.2088-5-alex.bennee@linaro.org>
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: bjYWzaPFB+8T

On Tue, May 25, 2021 at 06:26:28PM +0100, Alex Bennée wrote:
> When running the test in TCG we are basically running on bare metal so
> don't rely on having a particular kernel errata applied.
> 
> You might wonder why we handle this with a totally new test name
> instead of adjusting the append to take an extra parameter? Well the
> run_migration shell script uses eval "$@" which unwraps the -append
> leading to any second parameter being split and leaving QEMU very
> confused and the test hanging. This seemed simpler than re-writing all
> the test running logic in something sane ;-)

Yes, bash is a pain for this. I may try to get migration with more than
one parameter to work at some point though. But, for generally determining
if a unit test is running with tcg or with kvm, we have the QEMU_ACCEL
environment variable. So you could just do getenv("QEMU_ACCEL") in the
unit test. However, I wouldn't use it for this case, since the purpose is
just to force errata to be ignored. We have the "ERRATA_FORCE" environment
variable for that already. You can set it yourself, e.g.

 $ ERRATA_FORCE=y tests/its-migration

or, if you plan to run all tests, then with

 $ ./run_tests.sh -a

but that also runs nodefault tests. Maybe we should teach run_tests.sh
to always set ERRATA_FORCE=y when running with TCG?

Thanks,
drew
