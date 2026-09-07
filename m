Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF79C79F99
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 10:16:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3WOg-0006IX-SJ; Mon, 07 Sep 2026 06:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1x3WOf-0006Hd-FO
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 06:16:17 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1x3WOc-0001DE-M9
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 06:16:17 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c9aea40d799so1785186a12.0
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 03:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788776172; cv=none;
 d=google.com; s=arc-20260327;
 b=lI7+jZWRXLW0Myu/O6wdxBGQS7zvLCAF7UDep6xDlMoavKXTT1oaYmcyw/xpz6rcWW
 2FwvxBpmGIw44eaLjJw8IMNz2Pccix6gvWRQPCvt4qlJ+cXbQQOLGS91FilZdCc/hlAR
 I8VxI/ckBOV0ZtHbGV/PcMoCVV2OYY4RhfZ/eSPRrq+iokN+mPHDlpb7klrIMM24NGcJ
 PvHiknZJ+53EmlJqxRnMdLj4dRJN1aac7dp6lnSlit/JxTgLvuKy2Bei0k9yyQpN49qG
 lZhrbvYPv/9ZL9leH6hFzvIUJwS8PkdAD4rrZlaEnekAB7uNrVUWtX5U3sZKu/Js011U
 S8ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=imnYvxmVFLPolgSKPTG89lYbtpJMcua5FiADRdGXlfQ=;
 fh=LVEUPC3HWMt+M/7lF1FMX70U0/jhHCD7yu80Ng233xA=;
 b=mfzhA5vapDFd4OYele4vonrmc/pUlUFbPrxMbRzMVGCtGMsGqhCfKhWpsrKT06W01d
 7wTjKP6x6XUzNDt7ONjVOkZHdQ1taBhGeHo9EzYeN8dGfqqTlKODMfqLmjDFdBmw2ETF
 Vz1VNKR9TL1xqGQLizuohPnEH4Ibus7YVe1GgSpe/6FiStaKDhk50Ss49shpIwRbvQal
 MOZGnv4vKoQjCRKfTVl+h5qJFEr+3vmUITEfR5IK/X4eUGvRKVQQ76gdHwqYGzMrVXaQ
 ojk0OisZZBt+RpKyFIZqdlpK1ZsS0kEvPxj31Y4gzbtv/P04gn6PdBpqo5VIFEo6bRc5
 wLOw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; s=google; t=1788776172; x=1789380972; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=imnYvxmVFLPolgSKPTG89lYbtpJMcua5FiADRdGXlfQ=;
 b=ot9Mp7amyGxct+11fzHYeAepew0rphZe+32JHgCnY1J7r0PXmApe9YVvD4dtxXjSHY
 YeP0pbWlEKyR3Y2ZEM7lCSxUGhSrD/KaxUdE3t4eDX9DpVcuhod0W/xDFR4hRFJ2FsEP
 gmkio4jz5a4DSJ1kwTb3sPryvDaGDU2Ua9UyCTwnNzjtz7c+UYxBsU0deZz7SasMIJJ0
 P9vXNpOhQsDizBVjp700QRGK8SBGNgnYAMIB1Uro6Raovb9zFOJ6hrtKYx8ycCbb6v2q
 6F4ijdOIFWMe/6Eycyi/3Gg8Ptnj53XfIzJWt9joL/82vUx+cxjCkqK8K32Sy5RcBySM
 6flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788776172; x=1789380972;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=imnYvxmVFLPolgSKPTG89lYbtpJMcua5FiADRdGXlfQ=;
 b=gCRu2k0MATxyq48iAOq2g5CMzdS9TkzinXUayrFg8iEelxvPPqnM7s9KEvpbam1ZJY
 j4FcwqC8RLSSEyZ12Sy7bNg6Ma5HVnmC8e/0hOba6xKax2BwWQ247rELCdCSmGfrggSw
 gOfrlUWy69E63m3SqJMAUsuAW1QGORlXdHJkInBCjPAfzdWkyxIIBjm9TNadKcEe4Dxx
 HjK5nSs88x42qgORHX8Zy0uGQSBPMc7nUY3C+ZFY67SiRpUhPFk6udDxbNGFJ9rQo52y
 OUy/YLNDhLldop2HldOlt0s+cFnz5O9ZtpbqjJCR5peV9S1oSiGu0RRM7N5WuE0KKCSI
 1zmQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBweS3LqF/ZrFROQ3H79ui8VGxAz1LkReYtacTFDEhpBEx4FnBj0buKSnstJXS1qE0zoM7+hXMxMXA==@nongnu.org
X-Gm-Message-State: AFuF++kBwgWBHF2WqMr7XX7y94jABXO2IWHmNMDkHvm1FIH6LGOTlBZr
 kBg+m4mUb49NzE83d27GyjbiLc332ynP5oPEpq59vlwHmhZLO2/UdxAOb6YskUmEhei2c3KduXB
 I/otomTksAR/t7sghR2ohOHXD3yKf5uQ=
X-Gm-Gg: AYBFou0CgyaQsD+X2twvTJnrsvSCPGwxZ76fCNhc/9NJEOZ/l7tsmQATlTkGLKULxJM
 Clhx2E9wRJFJdzrHWKLNOM4rXNc3QBsvfg7rRSsIqp5feAZMX0qbbjPkW0c66Q4DKjrT4hSx7Ty
 q2MlZPBuoyMJ0qH2QgvO+a/ESYzTRiEBu9MN3GQCyhdBR8GJ5d/Lf4NH/NODQ3+fkjj+ajDMK9E
 lL0f28dtAafQo/vT6IEXtP7/o0hY3m90a2DWNUkJah91Lve1pmnKC/dAij7ueuMqcGD2apBSJ9t
 rgXR/k24NqkLTaaBMx1j6Jds5TzOdychltPCL4Gk9DLou16kayPEYsIQOPOhj5h9EC+6UzVFk1k
 C
X-Received: by 2002:a17:90b:4c86:b0:395:5f43:4ec4 with SMTP id
 98e67ed59e1d1-39b25f78ab8mr31373847a91.0.1788776172513; Mon, 07 Sep 2026
 03:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260906-nohmp-v1-0-daee96491c43@redhat.com>
 <20260906-nohmp-v1-2-daee96491c43@redhat.com>
 <20260906130649.6fafc3c4@tpx1>
In-Reply-To: <20260906130649.6fafc3c4@tpx1>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 7 Sep 2026 14:16:00 +0400
X-Gm-Features: AcwNN1UZZFQjFTmbeqR5-kDss6ekzU0jbl5OOsYJJEi1F57fYS63p11RxJwaN_w
Message-ID: <CAJ+F1CJT+jdKArkc-xge=mU=zbR3GuU1XEttJ2ArPZeHCXEd=A@mail.gmail.com>
Subject: Re: [PATCH 2/9] tests/functional: replace HMP with QMP
To: Thomas Huth <th.huth+qemu@posteo.eu>
Cc: John Snow <jsnow@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org, 
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Glenn Miles <milesg@linux.ibm.com>, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

Hi

On Sun, Sep 6, 2026 at 3:08=E2=80=AFPM Thomas Huth <th.huth+qemu@posteo.eu>=
 wrote:
>
> Am Sun, 06 Sep 2026 12:42:33 +0400
> schrieb Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>:
>
> > Replace HMP with QMP equivalent.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  tests/functional/arm/test_integratorcp.py | 7 ++-----
> >  tests/functional/m68k/test_nextcube.py    | 5 +----
> >  tests/functional/mips64el/test_malta.py   | 7 ++-----
> >  3 files changed, 5 insertions(+), 14 deletions(-)
> >
> > diff --git a/tests/functional/arm/test_integratorcp.py b/tests/function=
al/arm/test_integratorcp.py
> > index 23ae919359d5..fefed26266f4 100755
> > --- a/tests/functional/arm/test_integratorcp.py
> > +++ b/tests/functional/arm/test_integratorcp.py
> > @@ -72,11 +72,8 @@ def test_framebuffer_tux_logo(self):
> >          self.boot_integratorcp()
> >          framebuffer_ready =3D 'Console: switching to colour frame buff=
er device'
> >          wait_for_console_pattern(self, framebuffer_ready)
> > -        self.vm.cmd('human-monitor-command', command_line=3D'stop')
> > -        res =3D self.vm.cmd('human-monitor-command',
> > -                          command_line=3D'screendump %s' % screendump_=
path)
> > -        if 'unknown command' in res:
> > -            self.skipTest('screendump not available')
> > +        self.vm.cmd('stop')
> > +        self.vm.cmd('screendump', filename=3Dscreendump_path)
>
> screendump is an optional command - it is only available if CONFIG_PIXMAN
> is enabled. That's why there was a check for "unknown command" here.
> Does your new code still works if pixman is disabled?

My bad, let's skip the test when PIXMAN is not available. See upcoming v2.
thanks

