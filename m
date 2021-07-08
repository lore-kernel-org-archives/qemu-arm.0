Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp151354lfg;
        Thu, 8 Jul 2021 02:40:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq5WQqIg8CuivupgtTFudrqYaToppabhkSCfGWKtL1euz/jgdcq9TO+FtnQaI8KBmITk5q
X-Received: by 2002:a05:6402:ca6:: with SMTP id cn6mr443139edb.252.1625737221401;
        Thu, 08 Jul 2021 02:40:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625737221; cv=none;
        d=google.com; s=arc-20160816;
        b=ikSI7QBrQi9tVv0NcMF/vsEnJQcTOI6sSzVbbo+3RA6HbaCPMsBqJxQxlDcMGfSMoY
         rReSmbSs9sX42lWTI84ojSFDzOEMv65GTN712z24MUHpOYqzFhHTVkOq1CDS4k0gpROp
         LQoDV6wEv4KUcqzNtesWz5oLjz6HBZ4J5YXn4cQ/5o1l1kujPvqj032QeCLH9Ykw0Fe8
         18AdGbgcCAPpkkDrZQp0rIjL8VMpKblsoLVAmWCmLukeaxkqW3sOGAJHOMKMbsH9ELUQ
         QZMmGBUQEhfWMjP3lZYhqOwvuD5PY2iMRunM1AAce0P7tVI4/2Q7XatsUP7Csv47lDjM
         ps7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rxMCSrLHA4c1UVGNUvl9ZeYs3baYk4tMWFmR7eoSoTs=;
        b=JBGx4TBrThYX/FYujNoIKp67jNvLOYYsa18fZWobeGED5jwWm6pUooJ6mNdnG6DMAR
         wq9s57W+Y0loARvYUigh30oSlW9sgsgWaPctnVIqdxeXcvkJHnV/R7BPNOZ+zFq1xy8R
         fPXO0m6BlXl/XoU13v0URLvwv5Akj+MEHCESD76KvpfbHIu5A5hcLC4rCK/Xw3GxtCOQ
         QooAG17WK45/FCKR7dQj4V7852XI77nXm+iBayBULIz/9ZaBUrpLwIarktpch+GT+bAV
         bbXMNw98AJQc3K66TFKFPlvSGCK63rqcbDqQlxB2uZLSgWrm2pKfAOe1f0j2Q3LBMxn8
         BEZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OdbAoak5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id zd9si2279073ejb.524.2021.07.08.02.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 02:40:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OdbAoak5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1QW4-0007Q7-Gc
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 05:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1QVq-0007Pp-NT
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 05:40:07 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1QVn-0000dK-VH
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 05:40:06 -0400
Received: by mail-ed1-x52a.google.com with SMTP id l2so7636600edt.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jul 2021 02:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rxMCSrLHA4c1UVGNUvl9ZeYs3baYk4tMWFmR7eoSoTs=;
 b=OdbAoak5vVaYhFZKO/qIqiXyNqs88QJzGIoJkMrMWsY9cbZP60Tpbs5o+lFAjYxsRY
 Uc5xFECaz7Uajv8OL6R4MFu5yJNbTz74rHO6I4oiXlz/QmZ7evyu0Jkuc+ZGZ2FZxo5I
 QMVySHRcJho8Sq5tdDAnDcwoiwDqzrKvHwhKA/HAk8RAd5zGE8bccF+I9AMXsIIgzgJv
 YcgmO33btnw0vUjQv7yF5kGGUVpLqmyfY0niQkcHg5QVSPWFnvF8wwsYEXJ+HQEcizF6
 E9st6V3PMypS02v3io7cxX8FgXDgCib3oH4FYDXkGRm7ceMOJIlaImhYShTJB7QFg+oB
 l+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rxMCSrLHA4c1UVGNUvl9ZeYs3baYk4tMWFmR7eoSoTs=;
 b=aXPJgpvbDFojJFYnEggVEOZDXdzKGfhpevsBSgm+k5ZjD9KwCSslbV8IbCBH/AodY8
 bUiVikxKg/Zq3fUzGV0bwXjEi5WcqVH17phgev7LvXhM1TAe+zpoghFgKgVgWSlmTaga
 uFurYjZzeL4YqSO6DMoD6F4f5f+QOAV4qTkqSuJaEgbGjTsJabhRpWuu0W4xw5npXlj7
 X1+LK1AgD7k0vGMw8KGBb3HItdWbt8MTea4fFp4AQrPkQbXoWg7qfFwMAH8OIUecvj+4
 KUTHngYuasH/3RqbanMmhugRZxTOYvBFf372jm3//EqcYN56t7yJn+jfzkTOopBWEalj
 ijbg==
X-Gm-Message-State: AOAM533KpAJ9q/wnG2mX1vzTXBwcAxXQ786u/oYFsseUwPBa/lf1X3xk
 tg6IDfugucOpT2HtHPf9ynlQHhnCwM5i4P64B2oY3w==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr35930648edt.100.1625737202294; 
 Thu, 08 Jul 2021 02:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-4-peter.maydell@linaro.org>
 <52e5cb6e-1be5-cc73-5aab-790c5b9b80bb@amsat.org>
 <CAFEAcA9n-3-0V4==-j5-vBFsMHtHmXtkctxsyYEVWi-obipRBw@mail.gmail.com>
 <137e8616-f4d9-9824-56aa-b20f8c784305@linaro.org>
In-Reply-To: <137e8616-f4d9-9824-56aa-b20f8c784305@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 10:39:23 +0100
Message-ID: <CAFEAcA-r_RAVHtL_4v8K3ZXF+-wCgwrBNoNebA-qnWHfykHR8g@mail.gmail.com>
Subject: Re: [PATCH 03/11] hw/gpio/pl061: Clean up read/write offset handling
 logic
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Maxim Uvarov <maxim.uvarov@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fOFGsgdJtO3N

On Wed, 7 Jul 2021 at 02:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/2/21 4:45 AM, Peter Maydell wrote:
> > On Fri, 2 Jul 2021 at 12:02, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> >> On 7/2/21 12:40 PM, Peter Maydell wrote:
> >>>   static const VMStateDescription vmstate_pl061 =3D {
> >>> @@ -151,16 +150,9 @@ static uint64_t pl061_read(void *opaque, hwaddr =
offset,
> >>>   {
> >>>       PL061State *s =3D (PL061State *)opaque;
> >>>
> >>> -    if (offset < 0x400) {
> >>> -        return s->data & (offset >> 2);
> >>> -    }
> >>> -    if (offset >=3D s->rsvd_start && offset <=3D 0xfcc) {
> >>> -        goto err_out;
> >>> -    }
> >>> -    if (offset >=3D 0xfd0 && offset < 0x1000) {
> >>> -        return s->id[(offset - 0xfd0) >> 2];
> >>> -    }
> >>>       switch (offset) {
> >>> +    case 0x0 ... 0x3fc: /* Data */
> >>> +        return s->data & (offset >> 2);
> >>
> >> Don't we need to set pl061_ops.impl.min/max_access_size =3D 4
> >> to keep the same logic?
> >
> > I think the hardware intends to permit accesses of any width, but only
> > at 4-byte boundaries. There is a slight behaviour change here:
> > accesses to 0x3fd, 0x3fe, 0x3ff now fall into the default case (ie erro=
r)
> > rather than being treated like 0x3fc, and similarly accesses to 0xfdd,
> > 0xfde, 0xfdf are errors rather than treated like 0xfdc. But I think
> > that it's probably more correct to consider those to be errors.
> >
> > (We could explicitly check and goto err_out if (offset & 3)
> > right at the top, I suppose.)
>
> Perhaps just better to retain current behaviour with this patch by extend=
ing the case to
> the ends.

Makes sense. I propose to squash this diff into this patch, which
should make it a no-behaviour-change refactor, and then queue the
series to target-arm.next, since it's now all reviewed except for
patch 11 which is a comment-only change. (If you think this is a bit
fast I'm happy to post a v2 instead -- as a bugfix patchset this is
still OK post-softfreeze, so it's just a matter of my personal convenience
to be able to put it into the arm pull I'm going to do either this
afternoon or tomorrow.)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 0f5d12e6d5a..b21b230402f 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -151,7 +151,7 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
     PL061State *s =3D (PL061State *)opaque;

     switch (offset) {
-    case 0x0 ... 0x3fc: /* Data */
+    case 0x0 ... 0x3ff: /* Data */
         return s->data & (offset >> 2);
     case 0x400: /* Direction */
         return s->dir;
@@ -224,9 +224,7 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
             goto bad_offset;
         }
         return s->amsel;
-    case 0x52c ... 0xfcc: /* Reserved */
-        goto bad_offset;
-    case 0xfd0 ... 0xffc: /* ID registers */
+    case 0xfd0 ... 0xfff: /* ID registers */
         return s->id[(offset - 0xfd0) >> 2];
     default:
     bad_offset:
@@ -244,7 +242,7 @@ static void pl061_write(void *opaque, hwaddr offset,
     uint8_t mask;

     switch (offset) {
-    case 0 ... 0x3fc:
+    case 0 ... 0x3ff:
         mask =3D (offset >> 2) & s->dir;
         s->data =3D (s->data & ~mask) | (value & mask);
         pl061_update(s);

thanks
-- PMM
