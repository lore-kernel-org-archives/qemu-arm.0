Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp570157ejb;
        Wed, 6 Mar 2024 07:25:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVFd0QA7pfUZimN/fHJ5z4aSc4a0aN1zrNtGiCKciIoMdfXje8TlX6bdxUX5+Z/RN+lVXMvDIYHEP4HjmwxL7xL2reC0mOU
X-Google-Smtp-Source: AGHT+IH6Nv0U3Gsxxiuz8uAfGotiBzdXxwVYxacbj+BKg6xvsK7uW5w5ASSJpMgQGu/jsvrbnCH/
X-Received: by 2002:a05:6870:f14a:b0:21e:7751:312c with SMTP id l10-20020a056870f14a00b0021e7751312cmr5560175oac.30.1709738725548;
        Wed, 06 Mar 2024 07:25:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709738725; cv=none;
        d=google.com; s=arc-20160816;
        b=xAp0iFCWokiQMLofbLP2BGG/D7Z65Vq3HperDbTkFJpJj3IYpZWYlWDCeSHMOA3lGG
         BhTu9Ylzndbv5iTdgdd0QudsKV16EuNhu3t/09A2vdLQVu9R+TXz0atLI213YDxBroWt
         eZigqYS8RmOZV1bHaxQ83lH2IYWY2pArEMfGO61y2TPnl0ZN+vEtruEVcshx3IK1gjbU
         1yNnlrE/hs5I4WXO6D//xBn4qa8xGMaWx68xggVKPM+HTkNlCd1qvgC3STFOY+YaNYqO
         cqqQJS5qOV56RTEDoum2vl+vy5zOU23Yb3GlOLjT05KBuhB+flmUcSbLB3/Ea6HxB7+4
         UQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=dk1wRfmU/3CVJ+4OuvBHsDiwajqgn9heU0QJ/zHMlAk=;
        fh=jlaLHKqZ59PovtHBj3aeROgei107c93OAg4BItRbtHM=;
        b=PSD2HQp+6Y1vMKCN820V9AQmQCfWIG8F6YoZPd2JTLcFTw9LdKZ+bddXiKZHmP46HF
         G0DkP8bodD5HL9uIjXkHJMo4sfKUpFrBUrXG6cFiJFJa5ZFKiMclfIyNnvUw0/yHovyO
         aemoGu/VOsBXwGLXJLBmku+/KrOagsOogJul7+5/hGy5CXXj/VcUV533/avA1q2VTI6I
         Tz9EJtTKfsfCRYEhuD/ya+w2GdN6CT+u0SfkQ9aUuV6Nz4XlviZR6zA+yQQ88Rt230DF
         t8807+OuVfuDNcp3VRzC6a3qwPgn3Gbd4INfqYI4Yc2nuuqGda0iBPxTjRo2Nxa/nXZr
         aQ0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gFlwZUnP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cb22-20020a05622a1f9600b0042f08b6c340si2883748qtb.753.2024.03.06.07.25.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 07:25:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gFlwZUnP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rht8i-0007lv-Ov; Wed, 06 Mar 2024 10:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rht8e-0007fr-Mz
 for qemu-devel@nongnu.org; Wed, 06 Mar 2024 10:25:00 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rht8a-0002yj-Qm
 for qemu-devel@nongnu.org; Wed, 06 Mar 2024 10:24:59 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso1266126a12.2
 for <qemu-devel@nongnu.org>; Wed, 06 Mar 2024 07:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709738695; x=1710343495; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dk1wRfmU/3CVJ+4OuvBHsDiwajqgn9heU0QJ/zHMlAk=;
 b=gFlwZUnPCeSv9yrIDeeRoLOVM4YR29Y2m6F9ymU+qg1GD00p3JUBGm88/gbDy57LRA
 Jx6gyAV48MLVcQ/Yn8wlN4QXj0FSG/nR6MNjtbIm8ashU+A2jX+qBWQxjD86LRKYLF+q
 5oSuQkdN2fL7H+1Mo3V0fBDGwepthW1vxCcKeMDeWlm7mPB5/5ZXy/4XJYdvri5BNnvV
 yNqYx8AJY6ehIPU77r5F7OE0wpJwSqa44uoSqdJlicCeF0497GwQXQDO/TR0nz5qXiNN
 CcrFTwpfh7NHy1YKyyQqgIh+tU+9ySyAN65C0JIzKQMHjVEdA7gaSS9yzlfXSxE7GUmp
 kiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709738695; x=1710343495;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dk1wRfmU/3CVJ+4OuvBHsDiwajqgn9heU0QJ/zHMlAk=;
 b=jOi3QAAM+mfdyXSRcJkEI/70undYnLm7a/y8e6dzHRKigT2pnof6QVm9dr4NI0RsIf
 1aMxZ3DXVouSq3NHKdI2fNCvAhkwMFJn/Mcu/w/Oi4c1psOVrBZhGSIcJJMTWyPuKTGD
 VIw47xiDKKYjmoXnttQ6uP8mP8w7n0iohnf4+RQkkziFRwQJrTfvhHRsg3R4u5UHEqJF
 12ApixmIk3aMFK3gIRE/L5swWk5HmcAK3Pop5ookXdzyhnaBURd7Qh5Rzz9xykp4yBCb
 3ZIx9bIHELcZMWu4NirBnUs1SouMI3ZILkadxKUpnO0PrH+vGLzrJIQdLlYHwnjJl3dV
 qhBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW46ltxMaMPxRothujiBhVCxbq0uZrTkJgDqztdyAdZ87U8GMADsQBJe7G6rjhKv/wxzEL7d8otfKrhu/ncTkEthRERbJo=
X-Gm-Message-State: AOJu0YxFkvtxdFh8ursL15StEgeNpd+Yp7az968dbakxrCti9eKzM6VE
 Tp6fcReLVN++r2A5uIhki71ruYRFIIczLGL7Kxe/cfvOMLDI5qLEXXUwds1BIzHaA5BP5huzj0X
 QUpkwBTP6nmPMArhV/1r40+svUyO1ef64dDyQpQ==
X-Received: by 2002:a05:6402:5207:b0:566:1e8c:78b4 with SMTP id
 s7-20020a056402520700b005661e8c78b4mr12146186edd.25.1709738695088; Wed, 06
 Mar 2024 07:24:55 -0800 (PST)
MIME-Version: 1.0
References: <CAKstcpWLhcNswkippmDyQQz2bPKSN+w9F0jZzcZRGpuNWvW55g@mail.gmail.com>
In-Reply-To: <CAKstcpWLhcNswkippmDyQQz2bPKSN+w9F0jZzcZRGpuNWvW55g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Mar 2024 15:24:43 +0000
Message-ID: <CAFEAcA-eDU_As==Yzd5+xhAPKGzfUp2DH_Kj1owL3jvm8s+qWg@mail.gmail.com>
Subject: Re: QEMU Compatibility for Cortex-A55 AArch32 Firmware
To: yb liu <liuyb845@gmail.com>
Cc: qemu-discuss@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: eTKZNEfIfIj0

On Wed, 6 Mar 2024 at 14:33, yb liu <liuyb845@gmail.com> wrote:
>
>
> Dear QEMU developers
>
> I hope this email finds you well. We are currently facing an issue relate=
d to QEMU and the Cortex-A55 architecture. Specifically, we have compiled a=
 firmware for Cortex-A55 and would like it to run smoothly on QEMU A55 in A=
Arch32 mode.
>
> Despite our numerous attempts, we continue to encounter an "undefined ins=
truction" error when running the firmware in QEMU. Our question is whether =
QEMU supports this particular use case=E2=80=94specifically, whether it can=
 handle A55 running AArch32 firmware.

We have Cortex-A55 emulation, but you may be running into one
of a few problems:
 * we might have a bug
 * firmware sometimes does very low level stuff that no other guest
   code does, so it might run into something we didn't get round
   to implementing (eg it is trying to touch one of the implementation
   specific system registers: we tend to implement these as "does
   nothing" stubs, but it looks like we didn't bother for the A55,
   presumably because Linux didn't care)
 * your guest code might be doing something that works on the
   real A55 hardware but which is architecturally UNPREDICTABLE:
   QEMU doesn't try to exactly match device-specific IMPDEF
   and UNPREDICTABLE things
 * your guest code might be assuming the presence of some feature
   that your real A55 has but which QEMU doesn't implement
   (for instance we implement only the absolute minimum RAS
   support required by the architecture, not the full RAS
   that hardware implements)

The thing you'd need to do is look at exactly what the UNDEF
instruction is (and what the guest code that causes it is
trying to do) to figure out which of these is the problem.
Some of these might be easy to fix; some would be harder.
If you're in a position to be able to modify the firmware
image then that would also allow you to work around missing
QEMU functionality if necessary.

The more usual reason guest firmware not working in QEMU is
not the CPU emulation itself but lack of a model of the
device/SoC/etc hardware that the firmware assumes it's
running on.

-- PMM
