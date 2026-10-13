Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C6ECC6B03
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 10:51:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGa6a-0004gp-6f; Tue, 13 Oct 2026 06:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGa6R-0004bx-VI
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:51:29 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGa6Q-0005x6-9R
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 06:51:27 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8ab8d96d02aso20948577b3.1
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 03:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791888684; cv=none;
 d=google.com; s=arc-20260327;
 b=l+JEsT2PHorqgeUgju5I2dG+imVzlyPfJwfHsgRs74nUyB3WL8DTBDBGCqc9pGGxnd
 rOx6rqb4pALcfG6mOQzYt5PiXrU4wqUIETI7PUm1fmPTV4PL9RJMoM/6kAEnvL0n3g+w
 BK+gqFmBXW1iNgRxeOxMEtmZBhPJe5VgBdiDk1pys+nhCPS3kxK5W1bRdqezBGsTWo+v
 rHh4uYJDGlOqIYWjKKj+JT/bSxwE15cb22PzTRzQdQFsDH6yi/G2DaaVtcfuzH+cUlGo
 tOhrhH3r4p2DtaO0BsPqIslVbDBvI8Ppy7mCLlsaoo7ALzIP93xKBwyCjk7SRhn5gfOa
 IKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=LoKCVYnEg+V3D99jGOttC+5BQDWr1A0Npmf+EGdswzE=;
 fh=bylHTlXKagR60JR6hlKikcBZkjoax/Kz3v/HLA7SjSY=;
 b=GPhi5pMe6M4BlRbkh/44vNJjvFozr2Z00tjdI5DdJQr43RhK6g5DUm29wHhELw20gr
 bQAfNtABbQ80n29IWEQjJFLRL0o+Vz6uar+7mTjvLXUDjP2x0MSFg+y/eFY3NncSlprz
 00uvPZ8nFmD0j889y/GHGBwBzC6Sntb2Qbd/aXgtcs/GhkyWGuH9muVojzFSgdsZrbXb
 K9f0VaB8W02wi9K1JX4uH7sB+BPf4O8siIW3HcY+jYX9D6IKO2fv5awQ4oOloRuzubib
 MebUwbtyQWvrm2Ugk5pHc46IkXr13Cg3uxIBstONaYI9Q9JMSl8wX4uO3gKaDmWj4z7H
 mnDA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791888684; x=1792493484; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=LoKCVYnEg+V3D99jGOttC+5BQDWr1A0Npmf+EGdswzE=;
 b=LJJybHQ8TljQyJTuqzC4wVKMW4dErdnSzIKDL3WJ6ZMFmBCQeCQEHUQSUJEltYBOFS
 tmOpUktsZdW+uzGkP+qdVhR4brw2FBDbggwe/8AgViJw5vWx5Cxde9107BUTKgFMKjUT
 QRbyRw6d68CH7XmeGymRJVGhn8aRlSCIEpw7hxOucH9NbfC9RPPUS1zrCitiP+7RG9lS
 TlytZHJhZVSG13/oi52wPeNc0KVdPSXrOca4mur2AWbrn0N6yX2XRxEH9WhDg330cNNp
 wL6jkRg5WVtz0uerIETowVY8xPdcsYDsoc+RGjbUZpvequ34hWtTgCTcFQBCyeYiLdYK
 iHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791888684; x=1792493484;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LoKCVYnEg+V3D99jGOttC+5BQDWr1A0Npmf+EGdswzE=;
 b=JnFVYVSCM1FqGjwU8BnP/7cdGK+qlt6HrPNTlE9UGzbGsMudMp9HCObvjz2X8HtR1G
 1Vaavl7TkYLzY49A2Wi7ow4iP9ZPqS4gmPdRy/F+yJUsZC0r0ewQpEGUfC9sQxpsGIQb
 Ii0R3V7Krf6Ncd8SLiFfzHgRqrhuRwsOxfT3WlIABYbRMh8bYehxXExgsrRbcRMkuzFh
 Q9g88y6+Rg230iQ7wzePDGVz3XiLLOgjQIoHV+SkSCMGup0/es6PCeBBUip24ZRXS8ft
 /r9ZYR82TuwwYRZQE8w+ZVeJ3WILjjTZTTwKBnVY8E8KlwYw+UIwQqLgMYbeJQ++/izJ
 VtnA==
X-Gm-Message-State: AFq9FYLYC1xMU7hFiJ4HtY0aGX5fGU0tgJhsKEQ37eYjp4uHMKwL/fGm
 pNgjDK9qGrkjUJ0pP6AQqGmEeAYuDCHYKWbuNLcMZqXPBHP/XBQ+eKH3NpRsseDKK/VlBxWchF4
 S+z7RUH+mE/FaYwUTLti+b22/odNv/ChlLv+QX61UPg==
X-Gm-Gg: AYBFou2W5b6JRjpiMW0z463th70McNyRp9kFUe12PFnZ8uf4k0qXPMu3jwT/sqJ2LNg
 BFlXlTUYxckPsLc0mN4dQs4qn0wWxpvbUN6tsPfUWWjVP5qLCheLr57C/mysiwS90eXrYJJNDVt
 ztRJeUkH3X9tGbuEL+q0Idx5p2vbUxubVGySAJVW5BkFcMip2zthe8YLyWEjpPiFJZCbnhw9CH/
 EnSGFvblcEYfljDS29+Z2gFcATzXLo2Xjg20UDEEzR0CCN+DxJYGoemcu8OVttEFUY2Owa558/K
 0Qdus3QxCOOHI8P+lcWW84QF6X+J0sc0viugFoKDkESeqaQb1x/t7RYitnjm63ewkxnJOY7uiGE
 NcCD8veagpKMGHpMUfDhoCtXMKeeeJiKhD27S0SU5ld7NSD/RkQ==
X-Received: by 2002:a05:690c:498f:b0:8b0:a08f:2ab8 with SMTP id
 00721157ae682-8b0a08f2c5bmr19711707b3.42.1791888684260; Tue, 13 Oct 2026
 03:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
 <de4fe97a-83ff-4f56-b3ba-f506d03e252e@oss.qualcomm.com>
In-Reply-To: <de4fe97a-83ff-4f56-b3ba-f506d03e252e@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 11:51:12 +0100
X-Gm-Features: AclHuK-eT80DED0SjkgUtG6LtVdQJhH9P220XEHp2tNUToRv4ppzESw8WFEvenY
Message-ID: <CAFEAcA8w9yQCr4gH+iOwX5V7A3BcHQTS33OgD-recLR3MDG8dw@mail.gmail.com>
Subject: Re: [PATCH 00/86] hw/intc/arm_gicv5: Implement virtualization support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 13 Oct 2026 at 11:30, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> Hi Peter,
>
> On 13/10/26 10:38, Peter Maydell wrote:
> > This patchset adds virtualization support to our GICv5 model, and lets
> > the "virt" board use -machine gic-version=3Dx-5,virtualization=3Don.
> >
> > Virtualization in the GICv5 is more complicated than it is in GICv3.
> > This is because in GICv3 virtualization is mostly delegated to software=
,
> > and only the CPU interface has hardware virtualization support. In
> > GICv5 the hardware does a lot more of the work, so virtualization
> > support is needed in both the CPU interface and the IRS.
> >
> > I've structured this patchset as:
> >   * initial preparatory and bug-fixing patches
> >   * add virt support to the cpu interface
> >   * add virt support to the IRS
> >   * remove the check in virt that stops the user enabling virt
> >
> > The first 11 patches have been on this list already; I've copied
> > across Reviewed-by tags for those patches which got them.
> >
> > The current spec for the GICv5 is at
> > https://support.arm.com/documentation/aes0070/00eac0/
>
> Now A.a: https://support.arm.com/documentation/111701/latest

Whoops. I should have checked more carefully the google search
result I got back :-) (We do get the URL right in the comments in
the code -- we updated it when A.a came out.)

> > The kernel support for using GICv5 virtualization is not yet in
> > mainline, but it has landed in the kvmarm/next tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
> > Similarly kvmtool support to run the inner guest is still work
> > in progress, but the tree at
> > https://gitlab.arm.com/linux-arm/kvmtool-sb.git gicv5_wip
> > will work with the kvmarm/next tree.
> >
> > This series can pass the kernel's vgic_v5 selftest, and boot an
> > inner guest to userspace with kvmtool.
>
> Could we have a functional test similar to
> tests/functional/aarch64/test_kvm.py?

kvm-unit-tests currently has no support for GICv5.
We should be able to have some kind of functional test eventually,
but it will need to wait until the kernel patches at least have
hit mainline.

thanks
-- PMM

