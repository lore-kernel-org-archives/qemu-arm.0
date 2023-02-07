Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5402363ejb;
        Tue, 7 Feb 2023 06:16:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8hz3J2Hmefq9WTULJEud/uBMG24pPW7fgB1n1Ui/3dyDQtFaNHdCxWLWKv1VfaOI4WbxAG
X-Received: by 2002:a05:6214:c2f:b0:531:7ff5:9932 with SMTP id a15-20020a0562140c2f00b005317ff59932mr4460206qvd.28.1675779391701;
        Tue, 07 Feb 2023 06:16:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675779391; cv=none;
        d=google.com; s=arc-20160816;
        b=Py4H7WITIhG0LNBOInMTfgkU6jJEdZRfYLFdNk+3uOFSp6yhQX7O/SZyjJ9a/BztA6
         56NM2u4WwU7f5EnJFfCMnjRzgGT8dglylAWwHZmoBkAYCmlGbW4ZsJO6C05rOA8YJwKG
         GDs1amiedSdDQ+b8p4zcJU+NxG0SRSZ/B/4XD7rBgi7IndwP6jOn3oPihNPPJ1ewbb1O
         FWqkFulgZrzAoWs/CJwt0KTxTa7ZY9dx9rb8TELKImfB1TLHNy9eyBAKmfncRXg35wS6
         Airbe892xe32bPxDXwi2dRRmwwC7zDb3QlkXur+dwq7qMZ8COywIoEM70vA2aVTzY8m7
         6BeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vMKOCtRl6tfc7/LnEHG8xUDz7jFiTEmPSRpALH6vf8g=;
        b=VU+ygBdSGPjXg+weJiOrKHe8Q8wLhCIPo8//ex5A/IWkK4KHOX/eLO7m4Ca0AC1klM
         Vpm2MuieNgC6OXE7w1WzaZw8JnOKO4TVcu1Q9KCJFSMSsJM04YB9LZnhVigsMrbmsQnI
         W0xzn7vMYzcCw9kQX7M6ZBfvPAgIO9i4EiInbA78rZS7jh4Y6WoChSwgPYdS2SmfJ17y
         jInCeQakAXvrtn0ILrqaaVU155fpLkRkkHsxHI5SDUSBMBtGSsyyQOP3vdD++e/tn6El
         oe/Yr7XWdPlssfcubgvYK50ZNf7Al26q1KFPcMbsu0I8NAEbdw1lVllk58ayiEPgWJbe
         8NxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bCGDO71+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6-20020a0ca906000000b00569abf34d8dsi9577110qva.585.2023.02.07.06.16.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 06:16:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bCGDO71+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOlb-0001Iu-Q2; Tue, 07 Feb 2023 09:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPOlV-0001IG-4a
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:16:09 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPOlO-0003wl-EJ
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:16:08 -0500
Received: by mail-pl1-x62e.google.com with SMTP id u9so11483821plf.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vMKOCtRl6tfc7/LnEHG8xUDz7jFiTEmPSRpALH6vf8g=;
 b=bCGDO71+xvpTB3yjreLzLLnU/IL91/15r0TcVYJt79RXptcyqxln4GoRrVcflKA6CH
 s68eyBw3mlojwsqt1dD/PNRcfNwoJfl1mJfrvi2LZ/3JTykN7jvhqh3h2MDuP9tiKu2X
 VSiMkFe+wwqS7YvNIyMQbtaHYIVTQ/q6B9fWl/Re+0IS/aLa9ghMGbFHNMt6xJZQdfe7
 D4jC/jYL5d9kLcXpF23gSqZ/UsUFGrVnxcg9GOeCtm/6QTgXzXrFu60iF6bKUq+3eGFr
 RbuPYcmQv43GGQRhUwP55odwWISEbSs2yu3izhIoOucGdYhOZ6JRgyHHDcVK0WT9RDWL
 zd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vMKOCtRl6tfc7/LnEHG8xUDz7jFiTEmPSRpALH6vf8g=;
 b=3dnAAzq1xM42hEkPqawhE5A/sQufkaa8+N7phAmqZ59ZaBTzG+mJrYkUxh6myXQ15l
 qefECIrgOn9Thpev4//1XUTNf1f8j2/rhdhFZDAOkDdn3v7p5kS/FUgotlz35hjOJNL2
 uSKUJ5rZHVyqhmpZD0coNBFmnuEbUYjKyqtIdlS9HK0QASiXvd+7AYNd4hIVesIf72RC
 7qiEseoRsSpd0XETJ3VOErWI2w+tT70GrQXId3OpN/uR88MQ9bQx5/T7LfIK5lkyNjHG
 CD0kHFoVj/0ugPReRB7hLyuXMqfGAJtMOtA373Wc5H4ic5AM/KdbwumnfGVFxpQeGkSu
 Rtcg==
X-Gm-Message-State: AO0yUKWOSvZrzxGtiSh8hz4gfBh+Lr64+qA2rqqM3TYGfzgZZDTdoTe/
 Q5fwoL23UxcCVBhz/K3dtvJKIKmSUAdMtm5RRFB8Fg==
X-Received: by 2002:a17:90a:a38d:b0:230:81fc:db1b with SMTP id
 x13-20020a17090aa38d00b0023081fcdb1bmr2872228pjp.89.1675779360856; Tue, 07
 Feb 2023 06:16:00 -0800 (PST)
MIME-Version: 1.0
References: <167547085745.18032.9674021893886143814-0@git.sr.ht>
 <CAFEAcA-gftmFa9H1Q2g3TkLdwh4e=G8jYXmVou81Jy0+x98ODw@mail.gmail.com>
In-Reply-To: <CAFEAcA-gftmFa9H1Q2g3TkLdwh4e=G8jYXmVou81Jy0+x98ODw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 14:15:49 +0000
Message-ID: <CAFEAcA_3o=UrER0oQb6T7eBCaP1FbH1L+ge7dzpQtHZCCgX=EQ@mail.gmail.com>
Subject: Re: [PATCH qemu v3 0/2] ARM: Add support for V8M special registers in
 GDB stub
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PHnXN6ieAtOE

On Tue, 7 Feb 2023 at 13:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sat, 4 Feb 2023 at 00:34, ~dreiss-meta <dreiss-meta@git.sr.ht> wrote:
> >
> > Rebased and updated to use NULL as a sentinel.
> >
> > David Reiss (2):
> >   target/arm/gdbstub: Support reading M system registers from GDB
> >   target/arm/gdbstub: Support reading M security extension registers
> >     from GDB
> >
> >  target/arm/cpu.h         |  25 +++-
> >  target/arm/gdbstub.c     | 241 +++++++++++++++++++++++++++++++++++++++
> >  target/arm/m_helper.c    |  29 ++---
> >  tests/lcitool/libvirt-ci |   2 +-
>
> You have an accidental submodule change in here. (It probably crept
> in on a rebase -- git's terrible submodule handling makes that very
> easy to do by accident.)
>
> I've removed that and applied these changes to target-arm.next;
> thanks.

...the linux-user target fails to build, though:

/usr/bin/ld: libqemu-arm-linux-user.fa.p/target_arm_gdbstub.c.o: in
function `arm_gdb_get_m_secextreg':
gdbstub.c:(.text+0x41cd): undefined reference to `arm_v7m_get_sp_ptr'

Could you have a look at that, please?

thanks
-- PMM
