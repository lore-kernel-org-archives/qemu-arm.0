Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5171288lfq;
        Tue, 22 Sep 2020 12:02:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI9XTaXTnfSVMkD5MNNULULYjLSB0XaYDa2Y4buWT2Wbg6uArKmTwDLAJpaEr6NGk3DSeI
X-Received: by 2002:a25:1581:: with SMTP id 123mr8157544ybv.480.1600801322764;
        Tue, 22 Sep 2020 12:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600801322; cv=none;
        d=google.com; s=arc-20160816;
        b=Px8dbyoDq+/I1xmIzWTCKp6dgsj8pbD6ieduLEJjayQXJ4Yrc4htyP3wUCXajFOr8Z
         me4DZQKpTWsMqEEN3AE9AdN58QQbPJx1P0/6GnkfvXCx9Rq4/kUC8yc3XOY4AcWBB5JJ
         Q+lCUeoTS34qujp1LODJxH/pBa1cAC18+YplXPpNzS3CUzTi4FXPJQxjfzyS/CMXniIN
         GuEzSWesF1POwaQXRWrbAJOE2ocE+aIodl9BSeUGJLQecX6ge72ithNeIeGoSzzm3iL3
         EqDz5PNc+5EroUQdnbgARItSvz1oTkeaufk1yGkR49bt8cvsV5aOpPZPBM750Lpkq+oI
         UdHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=ts3rUxumwHNEOgoOcA6EATOfig9A0L6p2VG+NpBMRwk=;
        b=PZr2g5+EL8O82qRJrYgujDfpEZn3i/eP5qwJomPeaxkJMeseQZY8JCSw6cPrS1abmg
         qI9j4eROJ81SEf0lLebEZpXsyJv4NHlB90syNTB0u6DJfPt3iE/LynUsRYH9I/j49yiW
         SmZPNEDggofj7ZqWbibcPSX/TrlfgEf+HRGr/LOBuoLW2QnyS4q9zIUe2BdnVp4yEXyX
         wax3X6iBHDPWJO13yvVIqghX5srM5KUIdt9BcrqPzMvONxQUslBvWtk+TW98KoXhbZgy
         QNmRqdODaZwBICthzlIhPmi0X8VADJxivCZsHSJ2y2tCubQXz+KZE512dioM6hVf2/1X
         n3dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PbqcGA4j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si15311387ybk.348.2020.09.22.12.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Sep 2020 12:02:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PbqcGA4j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKnYA-0001ux-4E
	for alex.bennee@linaro.org; Tue, 22 Sep 2020 15:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1kKnXf-0001uh-Lx
 for qemu-arm@nongnu.org; Tue, 22 Sep 2020 15:01:31 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:42501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1kKnXW-0006Bw-In
 for qemu-arm@nongnu.org; Tue, 22 Sep 2020 15:01:31 -0400
Received: by mail-io1-xd32.google.com with SMTP id u6so20819369iow.9
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2020 12:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ts3rUxumwHNEOgoOcA6EATOfig9A0L6p2VG+NpBMRwk=;
 b=PbqcGA4j0yg5aYDB0i4hbf+lA/LtcKVK9j73DIZvJLGO1qeINYQvch8wn3rjqlbGjJ
 eFNooWfI3XBRXm0o51FkQcZt7e/R9oj8MzCxjj2AWcgfJ6G2m/XeuAGOa5AQxTxuJMX6
 jIkNvly+9Hb9Ah/3EAOWXjxjCu2f62zXvewj2whyV8phgvgHFMPWRnauJe4x9lbr2cwQ
 GD6W/3N2gmCtsm14lkbWT0QM8QFdEkrwN390xnqEkTP23JrwdTqBFFH+rUkLsFOiQ3Do
 NPhdYUGqcki7fqn84GJtT9ppNdQbnlYKcPym2MNx8S+J3XWv7f+7mS7889JTkOr4gnio
 YcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ts3rUxumwHNEOgoOcA6EATOfig9A0L6p2VG+NpBMRwk=;
 b=duzopLhQDjLEWbiCrbLiQQBRBNwKuPazHyfig2IgogMGt4WQq+8R7XVa+Z5Jw2bhGd
 QDAQ2xcrrfKbBM/7YKJ6J0hZL0tfqB4i1vmft3YfMC1HsPfCbC62EFLHELV2/P49Zguf
 hCXmW69ivX+Y/tJKC8o1H2zi8p99f/lYWaeHOl88tZJV0L1eHz0tTpDHY+IjlhB+YTBa
 A/+cMfz2SFhdWFHbnOmWwIWwuBZ91m29Xca321ATd/NFQwKfwrpm9+bTMIn09RVVuKWX
 oUM+PKL73/1fWLsKzeYuktWAsO5YRgrTusZzBhsUN1Cjyd2Xcj2aKIbSAK6fSJapkkIe
 CFlw==
X-Gm-Message-State: AOAM530LuUiiPvWG9POKU5/M5G8XR2FnEI/NcY8oj9fK8YlBhvptQgMT
 oYyH8WgUt6+KXJ0Dt8VM2AaCwEmluwu5R22KSCGh8x88/jbQxg==
X-Received: by 2002:a6b:e718:: with SMTP id b24mr4707209ioh.9.1600801279127;
 Tue, 22 Sep 2020 12:01:19 -0700 (PDT)
MIME-Version: 1.0
From: Jose Martins <josemartins90@gmail.com>
Date: Tue, 22 Sep 2020 20:01:07 +0100
Message-ID: <CAC41xo2yEoDvy15yExroY+ZX+qQns_rxQiqP9D2Xo3dqquP7KA@mail.gmail.com>
Subject: gicv3 maintenance interrupt not triggering
To: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=josemartins90@gmail.com; helo=mail-io1-xd32.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6rxyLFNrqIGm

I'm using qemu aarch64 virt platform to run my hypervisor. However,
the gicv3 maintenance interrupts (id 25) does not trigger. I'm reading
these values off the gic for the cpu in question:

gich.hcr = 0xd
gich.misr = 0xd
gich.eisr = 0xf
gicr.ispendr0 = 0x0

I think that for this gich state, I should be reading a pending state
for the maintenance interrupt in the redistributor pending registers.
I will try out the same code in real hardware asap to confirm there's
no issue with the driver. But does somebody have any clues on what
might be the problem?

Cheers,
Jose
