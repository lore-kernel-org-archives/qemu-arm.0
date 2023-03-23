Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp42612ejb;
        Thu, 23 Mar 2023 11:00:02 -0700 (PDT)
X-Google-Smtp-Source: AK7set/1K2G8Rc7NXCUdbv7DlnKHs91SrHHEJlGcEoe1goLQC/ObkydKB3Mh0FevcqYZIsaM1+bd
X-Received: by 2002:ac8:5fc4:0:b0:3e3:8032:908c with SMTP id k4-20020ac85fc4000000b003e38032908cmr282123qta.45.1679594402410;
        Thu, 23 Mar 2023 11:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679594402; cv=none;
        d=google.com; s=arc-20160816;
        b=Jk1ddMkrWfxvTVL+1iO3mTkyyVyj2aAdLhDcnZOBfFmvj6iohvrSjzo0qBVw4q7I3q
         8gMl2e3Cjs265SeeJTTrOA3NUxBaCJ5xON+uduWuT7KI4IproOWYKLT4Vk4boV29G1al
         KkFpIOZOxTcQmqNAoj+eCQbNPrnWrYCiZWgnx5jzAy4fYyUaWxeJaTrQajRC1b/ACb+L
         oWEXTgjywS8eHAP514g1mr98XKytghsDxrvffNUXpgkmJuoy57uVDR1xiIb5SCvw0xU7
         8XE3D14y7c43/sH9mpF3AGnXFKlaSnpCnHzgVB3Thqw6TM0nUf48PH5No86mi0wukNpJ
         qO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=edPREUHUsUeV6RMoNQ/B/Q+71/SbtA+YJ418Q+PnN/Y=;
        b=kmUX55jRRYQxWbHFM8CdjEhqY0MG9CuyUZMAY3UQ1z1idakQ/LOVt+jE5DccrXBHJk
         0IDEgXQ8f2VrqEfNjV7sDM+ptCt9muoryrFPh2927CZ3n7qaBKAFuB/t21NK195ROB5W
         JmkCJR243CjYbcOi2DbWceoHWFKyslUYjkTd7AbILXbEM0KJR2kzzt8AuCSZ6Q3v9duW
         dNePedWFusskYpyGn94PRONPDS1vahyLWaeI8++4YMT93nfXk36dx7RaEJ2jiONZ33/A
         YgZDaFBTrIZTRGDG5YsjD4I5xYX4cd4RTT9ZdTvqdC99oOui5t3feYoyiZgl+Tg57xLU
         y0FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nIMBsGly;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm22-20020a05620a199600b00746abc156e7si3571674qkb.332.2023.03.23.11.00.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Mar 2023 11:00:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nIMBsGly;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pfPE4-0008WV-Lc; Thu, 23 Mar 2023 13:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfPE2-0008Vq-Nf
 for qemu-arm@nongnu.org; Thu, 23 Mar 2023 13:59:46 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pfPE1-0004q9-6H
 for qemu-arm@nongnu.org; Thu, 23 Mar 2023 13:59:46 -0400
Received: by mail-ed1-x52b.google.com with SMTP id ew6so27361963edb.7
 for <qemu-arm@nongnu.org>; Thu, 23 Mar 2023 10:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679594381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=edPREUHUsUeV6RMoNQ/B/Q+71/SbtA+YJ418Q+PnN/Y=;
 b=nIMBsGly4w3mORR2xE0oYdNEW739HGq7rEjsaO40UuLrFB7vC+iJiuLJqAdPBfsZva
 Gb3exHYjpIF3RuSLGkG1PbT9P0NLaBPYKbLVbKBcU+LMJAJMEaZzm2xd6rA9BVfU2ESP
 jbLcOtceYpyc7BkqfJWCavRSr9dJCIz9N5jjqHpCh/SNkz2c3qtEkdMNiKO9n1tJjUy5
 t/7at83Y2Wc0b5Zdq9rwsPe80WoQwh8LKRW1Y+DIefLzkbifvP3tqir2W13+Be8Oe4NJ
 jYnCYA7l0NN3/uXZ+8KrLenrso3ioDxH/8hM7xrck8GfIwD/5njpX4EwTRlKMciDE/nK
 X98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679594381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=edPREUHUsUeV6RMoNQ/B/Q+71/SbtA+YJ418Q+PnN/Y=;
 b=8RQasgZQQFbxjpkjwRFrGwCG6a6SWSTIAUA+hw3Pd4HSayu9mCMHm5ZXZfFYRPQzp3
 3kl/KmHRzRCA31bMXAu7aurZYkkq1BLP1jtVkm2LD7PWXPXe3MV5s11FyiMTS6KeqgHe
 j6nXf5FPxEHCV4Bk2CyczGDwQvX5kZiyBLDp8IIz035TYfTheZ7hwFfvfaA2OJ9m+FlJ
 53LjCn91y+2O9f9mE+T/SO3Tf5y8L8zHMB0yhhEofydLCOBjKe9ZkPxz1c5qe8QtesMp
 jQha3dOLxvwrZfYMiDxXcMIKKiTNTRPkhw+nWjNdneL2gIgeieVadxL5617T8mswZYgV
 +rlw==
X-Gm-Message-State: AAQBX9fBfX0+FORQkyHi/R734x6mZQhkAFshat/aWtPU1No1GJl6oJ9o
 QYl9PVrwbDr4fZ/KHx+AayO6sPFLDoLDHriEmbR2MA==
X-Received: by 2002:a50:bb0d:0:b0:4fa:e897:7467 with SMTP id
 y13-20020a50bb0d000000b004fae8977467mr147133ede.6.1679594381678; Thu, 23 Mar
 2023 10:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230323161053.412356-1-danielhb413@gmail.com>
 <20230323161053.412356-2-danielhb413@gmail.com>
 <CAFEAcA89KN5SEi5hFoKKpzVSo=xV3gCn7b2bMBhb5qoQ=U9_mg@mail.gmail.com>
 <fda401e9-608d-a74b-9ff5-aa977d900cd5@gmail.com>
In-Reply-To: <fda401e9-608d-a74b-9ff5-aa977d900cd5@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Mar 2023 17:59:30 +0000
Message-ID: <CAFEAcA_MXhG7-J9qAv-9cmHKC-qx5nKfZPHi7jXyqdoYumH5-A@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/arm: do not free machine->fdt in arm_load_dtb()
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: 3A7yMHmFUADE

On Thu, 23 Mar 2023 at 17:54, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
>
>
> On 3/23/23 14:38, Peter Maydell wrote:
> > On Thu, 23 Mar 2023 at 16:11, Daniel Henrique Barboza
> > <danielhb413@gmail.com> wrote:
> >> -    g_free(fdt);
> >> +    /* Set ms->fdt for 'dumpdtb' QMP/HMP command */
> >> +    ms->fdt = fdt;
> >
> > With this we're now setting ms->fdt twice for the virt board: we set
> > it in create_fdt() in hw/arm/virt.c, and then we set it again here.
> > Which is the right place to set it?
> >
> > Is the QMP 'dumpdtb' command intended to dump the DTB only for
> > board types where the DTB is created at runtime by QEMU? Or
> > is it supposed to also work for DTBs that were originally
> > provided by the user using the '-dtb' command line? The docs
> > don't say. If we want the former, then we should be setting
> > ms->fdt in the board code; if the latter, then here is right.
>
> My original intent with this command was to dump the current state of the FDT,
> regardless of whether the FDT was loaded via -dtb or at runtime.

Mmm. I think that makes sense; we do make a few tweaks to the DTB
even if it was user-provided and you might want to check those
for debug purposes. So we should keep this assignment, and remove
the now-unneeded setting of ms->fdt in create_fdt().

thanks
-- PMM
