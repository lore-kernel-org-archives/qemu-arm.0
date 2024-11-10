Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp6093519njc;
        Sun, 10 Nov 2024 07:15:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU59253fvKTOXRR1ni7ZQgIKW1r7uVVeJjc/Do/iBjMgn4rnvwGUzwOuIEpWKm9yAzfZL+OYv869X3wbw==@linaro.org
X-Google-Smtp-Source: AGHT+IEpN3W9HgkE06PORafgRj8FhP8TL3O+ABnY9LwD00ASTp0dct5sVJD7cI2jzqOHc3aGS3AP
X-Received: by 2002:ac8:664c:0:b0:463:112f:4ab9 with SMTP id d75a77b69052e-463112f4cd2mr93412881cf.25.1731251740968;
        Sun, 10 Nov 2024 07:15:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731251740; cv=none;
        d=google.com; s=arc-20240605;
        b=ALbWiA6c3rBqVuUSFGuQICT50iVnQR3apsJp1q/ftHrlYcmSM4w0jkO1OAMh+VLMT6
         eaxyNyeL8zmShRL7aye3dY0QLVeWb37hIB1E2W0vMKFaK3kM0CJ0FYeYJ2uiwkzhgnX7
         qLzBBrxT0N8arVWaH0L7KJ+e+vnEGjTM7AIlLK298xoDYqIef4ps1eg8nr1o2vI+KXBS
         6se5jTEivR8vJ+fZq7EVHnGk7XxOYcHSqgqVK+uUu0CG9U4VKtZCszE6dTp/l5unYfSY
         ZVRn3q3bsoJcBAQkaasmlE5RxUMaCB7RNMhlgm1FRPXw5PKnsA4LaiMWMko+Ti06pREJ
         rY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bRIElRIkbSkGcDEyJKLsexpTiPct+QzbWRnM08FSXYA=;
        fh=k97Q3GuPdxm74FUI4BbLMYNtlUQvoR+LkqvARGxBk7I=;
        b=NYTlY76cDUY5CNkqGgAHQz0g5GFfcWCa4sLMOIAtzJmTtqXQ12yGjFcEHb9AaeWIsm
         qqBrTKmUnQ5N7j9StuqOptMDy9/3iIKStQqz4A9CMWMWk7K71H8o562U8fru7uqLyBEk
         XMbDrEUkLPHGkskguB6aKbB5cMLoW2y9jj/qzEBTaLFdShsTd5dxFmdvDtPzSgxTAlfr
         3++VW8TBoeWxjzRIdga3uU0wWN3ayHdoJ5i/q+QvLSC9APu8MPDBZVviWF4Hx81UpLfg
         JsdZTgjL8hFTlZHv01MKHVV4rZMFPChCLF0XyIepfmXXsm3IFo2APmZmjthTdbTbAan6
         A1sQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Gqn9qmiO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff40f41csi83803201cf.89.2024.11.10.07.15.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Nov 2024 07:15:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=Gqn9qmiO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tA9f3-0007dK-EA; Sun, 10 Nov 2024 10:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lists@philjordan.eu>)
 id 1tA9es-0007bE-8F
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 10:15:29 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lists@philjordan.eu>)
 id 1tA9eo-0002L4-SG
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 10:15:22 -0500
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-7edb6879196so2525891a12.3
 for <qemu-arm@nongnu.org>; Sun, 10 Nov 2024 07:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731251717; x=1731856517;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bRIElRIkbSkGcDEyJKLsexpTiPct+QzbWRnM08FSXYA=;
 b=Gqn9qmiOdrBf5KMxmEb4PZRgLuL0umL9pPgFRvxTklYu3GNeBAlETxvh0a1YAjGH2/
 Ic2dwb7rzn5piHO1O6Leg6AmUhKCOysECxxFF+FkmFByfahiJjq+D5wt0Kj2RCxoPEBz
 sftDvEm28e2Jv7Bt9iG0GJL8u1j3QjEb4Rso0SK50aPOg7HDp14W1v8+GpiCLYYvNtrv
 70AHzDDCHCAbXocJRNmsm8vJXsNOt1gTGzTeQT/2hDQ5z97JAVGyAcxsZXoR0HCW3LSy
 3fGm3DyuQN1C5INxds8lwoEGopgfD+SbD9IzrbHaLBl9xDt8OnYFb8k7m6cEpacCVcSx
 ZP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731251717; x=1731856517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bRIElRIkbSkGcDEyJKLsexpTiPct+QzbWRnM08FSXYA=;
 b=GXx+IzcAbeRD1KehMsdTzFBfhJ9IG39JgwLXKSCl/wQkwAGSpsyFwbEAP+Blt1cdRH
 zSFBsPV3Az3FYIZ64aZDWZuXufM22DfOlbAAgnGh8qZzdRi14TVL5XMPV0CWEw99vP7H
 MVS6AolJtjxe/1gX4NsVgPVhn+P+EkjDRcKuA9Xof8mOTs99SRvDr2bqlMFWZdQ9R9gW
 UVzVBLo3kBIPOjUC1wVS8tJJpojvMv3w9KaH5WIQ1P+GexvYx2IWOP8eX4J9az1ycCCz
 eUAq5ZI3TJMOR5ryD+tOHuLJXib/vdVwMRD0uP4a9+iY4iDGhvFLZepOn1h6NvSPvcv1
 XVEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLng+3pG0fQU2oSsU8IV0iYxAMH4zUziyMBpLSxFgN5AoE92c8pnvDFg7FfHNEcTVmnRNjsM4MZg==@nongnu.org
X-Gm-Message-State: AOJu0YwMA9xeCSztkySgtprakeV1c85OZsuOFivNs45z8fFRFT588R7B
 CB7Ekvum8NlLMbPk5KO3J42wvrwRNymhsBakplxrJ2dlZRKE3tritTadt0ClEXptHN/tLK82ix1
 HM1hITEVPzr86eWAWrvIpB4WJCqfqKJ1f1L9h
X-Received: by 2002:a17:90b:4f43:b0:2e2:e82d:48cf with SMTP id
 98e67ed59e1d1-2e9b1724271mr14520256a91.16.1731251716985; Sun, 10 Nov 2024
 07:15:16 -0800 (PST)
MIME-Version: 1.0
References: <20241108144709.95498-1-phil@philjordan.eu>
 <20241108144709.95498-2-phil@philjordan.eu>
 <9c2e0b96-2125-4041-9f66-116d54accb04@daynix.com>
 <CAAibmn3NbtOEwWLQFOo_UmAGTehOj+dDP04A=-JGMZVK9AYMDw@mail.gmail.com>
 <07ec41b8-922c-4c6a-b550-63fc4481d019@daynix.com>
In-Reply-To: <07ec41b8-922c-4c6a-b550-63fc4481d019@daynix.com>
From: Phil Dennis-Jordan <lists@philjordan.eu>
Date: Sun, 10 Nov 2024 16:15:06 +0100
Message-ID: <CAGCz3vt=jCBU8UpXhcLEXC20mJZ=4Mx0hL4ixzhSPAKF3rV64w@mail.gmail.com>
Subject: Re: [PATCH v8 01/15] ui & main loop: Redesign of system-specific main
 thread event handling
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org,
 agraf@csgraf.de, 
 peter.maydell@linaro.org, pbonzini@redhat.com, rad@semihalf.com, 
 quic_llindhol@quicinc.com, stefanha@redhat.com, mst@redhat.com, 
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com, 
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com, philmd@linaro.org, 
 shorne@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, 
 berrange@redhat.com, qemu-arm@nongnu.org, qemu-block@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2607:f8b0:4864:20::52c;
 envelope-from=lists@philjordan.eu; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: 3qnfIDvYqtuc

On Sun, 10 Nov 2024 at 08:10, Akihiko Odaki <akihiko.odaki@daynix.com> wrot=
e:
>
> On 2024/11/10 16:08, Phil Dennis-Jordan wrote:
> >
> >
> > On Sun 10. Nov 2024 at 08:01, Akihiko Odaki <akihiko.odaki@daynix.com
> > <mailto:akihiko.odaki@daynix.com>> wrote:
> >
> >     On 2024/11/08 23:46, Phil Dennis-Jordan wrote:
> >      > macOS's Cocoa event handling must be done on the initial (main)
> >     thread
> >      > of the process. Furthermore, if library or application code uses
> >      > libdispatch, the main dispatch queue must be handling events on
> >     the main
> >      > thread as well.
> >      >
> >      > So far, this has affected Qemu in both the Cocoa and SDL UIs,
> >     although
> >      > in different ways: the Cocoa UI replaces the default qemu_main
> >     function
> >      > with one that spins Qemu's internal main event loop off onto a
> >      > background thread. SDL (which uses Cocoa internally) on the othe=
r
> >     hand
> >      > uses a polling approach within Qemu's main event loop. Events ar=
e
> >      > polled during the SDL UI's dpy_refresh callback, which happens t=
o run
> >      > on the main thread by default.
> >
> >     GTK should also do the same as SDL and requires treatment; I forgot=
 to
> >     note that in previous reviews.
> >
> >
> > Although it=E2=80=98s possible to build Qemu with GTK support enabled o=
n macOS,
> > that UI doesn=E2=80=99t actually work on macOS at all, and apparently h=
asn=E2=80=99t
> > been supported since 2018, see:
> > https://stackoverflow.com/a/51474795 <https://stackoverflow.com/a/51474=
795>
> >
> > I don=E2=80=99t think there=E2=80=99s any point making adjustments to t=
he GTK code by
> > guessing what might be needed if someone did fix that to work with macO=
S
> > at some point.
>
> But there is a GitLab issue saying it "sometimes" crashes, implying it
> works otherwise:
> https://gitlab.com/qemu-project/qemu/-/issues/2539

I spent some time trying to get the GTK GUI working locally on macOS
with no success (with or without the pvg/vmapple patch set) until I
found various info online suggesting it was broken. But I guess I can
add a qemu_main =3D NULL; line to gtk_display_init(). This will retain
the existing behaviour both on other platforms (where qemu_main is
NULL anyway) and if anyone does manage to use it on macOS.
