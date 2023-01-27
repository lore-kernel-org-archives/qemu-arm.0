Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1216246ejc;
        Fri, 27 Jan 2023 06:55:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsj/YrWcGaEUoDz0+hevdnAt4WxPRwhU+ga7a80TdkIJiT/HXvDtQYbwdTnwUVXz8AefUcF
X-Received: by 2002:ac8:5497:0:b0:3b6:3038:d4df with SMTP id h23-20020ac85497000000b003b63038d4dfmr54907936qtq.34.1674831311237;
        Fri, 27 Jan 2023 06:55:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674831311; cv=none;
        d=google.com; s=arc-20160816;
        b=GgyCLVoYA2ffIDYZvVnWMeFjeam1NjwwDw4eOcdNzcwHePJ+2EmJEz9rivQUHzpRR3
         NYkRcYvEGVq/twsUgWs4RAfLfqh9Sgrph4T+V/WRr5GcIdA+4HxIXitPYcYXVM5C7Rpz
         yByAPlVQZRWOuYJLiDdZRlAoV9kgui2A/vIq2UzXhM5yd6dhB8SCWw7tJqFcDz3ixgSO
         CvyxOj6z7fKML3uDk7HGQ6sA+NIgH15D9TmJnmp5PE/q6CI4TLOv+c+KKSXY3TyVIF6s
         XEoKlATtRJht05mmNjUgwkWXquMX5T9VwFZG+htba12Sy3elI7PbGAm2zQ5ShsZJqRQu
         QuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LkDqyGrdQP09P8B3VOXn+2snrIqZ+RVtQwBSGQWoOuE=;
        b=QJSoNcnZ+ehtRTAg5HAfnbW3b1XW/R9c9xvy4eFSeuCRsC3uoh/olzTmkDUdq+fuV9
         +weY6mBH9ZMHo77PfUvQgS3263Jd5TI+Mb7XJ23QgGWV7AcEHCm6t1KPArRjdkCBUAHo
         7oJtP2zM8hV+dsawdDgNDpB3g7ZE4ExcFtw0FPuQFMvdCx2J1Yu9Th8hbMFlrPeATdpA
         VhpurS4QohNHj3o60C8/4/+TvX0M6tF4bIK6+qaLZZBT534qD5EdU1k4m0T9qVu0rsh0
         OEmUL9Ld2KZBrpORxjHfzm6HNqL465SXH4aIFH4rEUHevGMx/l6+am8cbhsxRyGHLsLe
         3HZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tbV+DtYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi40-20020a05620a37a800b006fed545443bsi2826846qkn.488.2023.01.27.06.55.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 06:55:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tbV+DtYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLQ7u-0000wM-4C; Fri, 27 Jan 2023 09:54:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLQ7s-0000vT-96
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 09:54:48 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLQ7n-00032v-Q1
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 09:54:45 -0500
Received: by mail-pl1-x634.google.com with SMTP id jl3so5168139plb.8
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 06:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LkDqyGrdQP09P8B3VOXn+2snrIqZ+RVtQwBSGQWoOuE=;
 b=tbV+DtYfL0Tt3h2SY0kE72VJ3f3GRcNM3eERMngALVTmFr4w3HvaHqdRSl/yJUNkfD
 8KEda7J0BuobaAq6VsFTrGQBThFt6Tj9pra9379MYarW87eRD7Mij4dk1O3m2TTV0daQ
 V3uS9MpvkY+bPFmOCoB7tzKqzwRgCdDFhfpoTF0kkCwaobzit8vutClr+rSYX2R//XjB
 rgjArxqS+KjE/niw3FHKeefz8atQnLwnv/t396aRMcPhavopo2IWwtP5JhM2n5H8tk25
 F3e4+UPYqlM2BJotAbFwRBq9Dsw8w/85a5xnj6gB/YaSAp1kR03Ez8iBW397pbhgohU4
 aKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LkDqyGrdQP09P8B3VOXn+2snrIqZ+RVtQwBSGQWoOuE=;
 b=bNkOukdg9UUFgLLm3nJbFGcA7YlU1bZBvYVtbqkhfyA4QQhBgxjZSqF7C3UlaMvLDM
 3J/7YxduQujkqo9GAuHHDpMLTy9MUWfDmniRkKPYcDL5ztwApnoPYvYOAlj3r17kIJ9O
 eZymCFcZb/EyUYZeknWFAUCs4+8rwlfbPP3ScugOt4jHmew/MEwge+vToe/fEERdCRL8
 zHQ5yA0dlT8/qmnvSA+HjUDROwCSI5YuA/cseosskFPxGqI4RMNYyBKbz8HuxnZ9L2na
 Zuv29AR7cXnZCObPaWb2gu+DkBy14Bv9svFGxPVuLQf7vUnrwXhi3VASmBP2dy3XYNi8
 vj8g==
X-Gm-Message-State: AO0yUKW1XhAcuT28+GKx/duaqQ7X6dN0mWGyRHh/PqWQGBWb0/aOuZm0
 Eqcx43dIkO08xRJojjg6gmIXBB6QFf3wnWcFKaWZYw==
X-Received: by 2002:a17:90a:71c6:b0:22c:dfb:a9da with SMTP id
 m6-20020a17090a71c600b0022c0dfba9damr1928136pjs.115.1674831282251; Fri, 27
 Jan 2023 06:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-5-armbru@redhat.com>
 <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
In-Reply-To: <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jan 2023 14:54:30 +0000
Message-ID: <CAFEAcA8E98v5X5ekA16c6Fby2HAhOC5G4JYnN9TkrA9G7rVzvA@mail.gmail.com>
Subject: Re: [PATCH v4 04/19] bsd-user: Clean up includes
To: Warner Losh <imp@bsdimp.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, 
 pbonzini@redhat.com, kwolf@redhat.com, hreitz@redhat.com, kevans@freebsd.org, 
 berrange@redhat.com, groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, 
 philmd@linaro.org, alistair@alistair23.me, jasowang@redhat.com, 
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de, 
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com, 
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: w2unSpd1bkoB

On Thu, 19 Jan 2023 at 14:42, Warner Losh <imp@bsdimp.com> wrote:
>
> Also, why didn't you move sys/resource.h and other such files
> to os-dep.h? I'm struggling to understand the rules around what
> is or isn't included where?

The rough rule of thumb is that if some OS needs a compatibility
fixup or workaround for a system header (eg not every mmap.h
defines MAP_ANONYMOUS; on Windows unistd.h has to come before
time.h) then we put that header include and the compat workaround
into osdep.h. This avoids "only fails on obscure platform" issues
where somebody puts a header include into some specific .c file
but not the compat workaround, and it works on the Linux host
that most people develop and test on and we only find the
problem later.

There's also no doubt some includes there for historical
reasons, and some which really are "everybody needs these"
convenience ones. But we should probably not add new
includes to osdep.h unless they fall into the "working around
system header issues" bucket.

thanks
-- PMM
