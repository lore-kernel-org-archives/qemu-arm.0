Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F14C5DF8E
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 09:50:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxLsk-0002O6-Vx; Fri, 21 Aug 2026 05:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxLsj-0002Nb-EA
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 05:49:49 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxLsh-00021N-Q1
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 05:49:49 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-66c67a73eb7so3036729d50.0
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 02:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787305786; cv=none;
 d=google.com; s=arc-20260327;
 b=NgUWIvapQpkQKJa/+71vMOnm1r4Ov67dHP3IL8DymiHDcq2ES6ooe6juKa8uJtbSQZ
 JgHxNCGumOroBfm+rd9wKOwGzQ7ZZhp5nxtu6FemXE70IUJQmZ8gR96kVkc4fGsANeBP
 1+SxHtcAJfm06wL0fOakTCV7DjbUypebnNNUUwd8m21GrmHQtS5vGRopzTf+AAVPbbAb
 ESqAQfi7SBwVocNHW2fNxMMauisTbGOBT4XxG6ZrUqFVsx4O3qNC10Pjibbd9tjavT1R
 3pVfDWsmR66BzIEACgcEnF+iDPiIfm2fY6axGSxoCqlRu/YEaui+6kvC6kCdnyExAX0J
 8HHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=tg7EuQje/tPVZdyMbR4UCbpPTRRW2oBS8zrQvxBp0pY=;
 fh=cBeQNL9hgIPKU7N+BkYYU9bjkuhUJxniDo5frDH5rlw=;
 b=dJYYmnISz4EMNjUGfQCGLWt1TBSEuwtj3RqIqzx1nCsAefB2bibrUqQqrn/FAz0Z3b
 VGTa3VqcduSNEXItYvgzpzDTBAWs2Y9unRp1w1vlXu8bGMowtS1RYPUYji8Q86j45buJ
 DoT3dGyBbCFa8g5ZedHZVHT128i7bZT3v51x+lfAu4E8aPmcyhQZQRWcQCGCPohjTVEt
 ANmfX1WRYhasa6BF14ygdZgIwgq2BaFFr40i2MSm4TGKbZN9WlmiYZ+LKG44nBy+5V90
 NRW2lRiV0tzyHw9x9TZvBooXl/LzKf5fm484wuwPVEKpNKisGjCKnvYYjxucV9Qar4nw
 M/Ug==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787305786; x=1787910586; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=tg7EuQje/tPVZdyMbR4UCbpPTRRW2oBS8zrQvxBp0pY=;
 b=iI6Ebnh12HVPWKGFb2osMPEEQLT4ryKvyt85zVEAnVXRfwXN/k67pHneLkZdu9nH5c
 EFkJl6mKJUwi5A2XEwtF82wCd1Kp1LQC4uIiuRl/5eESyYxIGIAL1tfu/A1Jalqc15mE
 ZRH3V1bbBEAUEeWzdB6JBXtmrFzZJw/8Z2WLDz90hVrNHut8vHH9M4JUHWdm9pHcXGBA
 9Wp+/XL76/IAyxdLtxHa2Q/5JCYlHiE+BrSi6XmI4MNkdYAzqiGpSa4ZC9vGUh45iDzQ
 96/WGAeRK327Rs5S76Io+ujKT/ZgkNGXr6rKMswgYju7xCb6aUyumGVZoWvxBeo+l5Ro
 IAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787305786; x=1787910586;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=tg7EuQje/tPVZdyMbR4UCbpPTRRW2oBS8zrQvxBp0pY=;
 b=o8NHKK10q99j/i90wqihr5UqAvnB1aH2/CwhGFWmimCeqBahEJwGscyxQpbMv6ET3+
 52cJDMeGhHXA0zzHSFZCCRqQGrf4Y8JQ1DBEOmFXTAaa9xtqYSlU5Ksu4sAX39Z9HhJB
 AOL4ff1XCN2bHI27ooUU4RqC2PAJB+xoqHA1vxSZMLl4QyN/k3Qy9m+/ubtwOzXWmNZk
 NOgrKMO5FDGr55Qm6DzlCAHGwuuHEzIwwD/RlHoCDT7LQJi/zQqbqsocHCvWqNl7Imtt
 AZGDbhNfO96qM93Zm611j4V8ZL15KFmhxQtukIE50SVs03Bm4aYeUCAhkogoYEDvnlY4
 1nQQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RokCDU4XyJjUroq3nAcYobLs07ZqSyO38zY94aytL/shVCTH5u9Ut4eulcNqoita37gUkCzCNWb6Q==@nongnu.org
X-Gm-Message-State: AFuF++mB36LwZwpnynyyJejlp21IjFpgwRVBssD7gjpMsgv+Q0mfLOe8
 VJ80yOOpDtASOB4XJNoyu2t6MYqulV1z8NgSxMFObj8u32Mi4pwtChD2VH5KLmHVDJNfCoduHOu
 mKmxaBuViUF7loFic2J/pm5vWLYg51I4aGj+Zr2h8HmafzL6njIK1
X-Gm-Gg: AR+sD11wMFl+xgH3VNcU7nA2AL8yiHQDx2aK2qtA9/vlfI2BzGllwISI9kC1d45SWPz
 1CWllPGgch/MYsQe/vzqZYesMtEoad5UAC+aIlVGRmXlay4ZZcIBVcXg3iBOtKYl4cSkEH1aNye
 NdAY3Ijji+ewY1ZDy84Kuy8bjuULIvwLe1Doa62kodrFsSoomRYZr3lY1Tzvra3lBfsuO294rfm
 3EUXV2x+eG5K0qEXknAWFU6hBtFi+0wu2AKy6Li/9z6AH8NWOPqpO/jM4EQFzXR9AIBa4dATKwL
 /tCoA4/1nbRT6yCva3dSCUsZUUoJfXBui8WQFxgzmncjKY5u6AgJWk5nbol4AoQwNdCMCszoE3X
 wAzrx2e8QebiSEt97q0am9VElFo1f
X-Received: by 2002:a05:690e:454c:20b0:66c:e9ae:d90 with SMTP id
 956f58d0204a3-66ce9ae0e82mr533447d50.18.1787305786480; Fri, 21 Aug 2026
 02:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260816131300.51799-1-bin.meng@processmission.com>
 <20260816131300.51799-20-bin.meng@processmission.com>
 <10643a9a-8b04-48d9-a8ad-6dd86a4f29d1@oss.qualcomm.com>
In-Reply-To: <10643a9a-8b04-48d9-a8ad-6dd86a4f29d1@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Aug 2026 10:49:35 +0100
X-Gm-Features: AcwNN1XKI7dyak-hFl1wBBn7Epxb8hO4yMquCFY7uZoQL4qHgnRy5WIXjxXQ4lY
Message-ID: <CAFEAcA_U9dwtJqigcaPJHWUgn5bRACG+zz4q+pDETzMfk5qXuQ@mail.gmail.com>
Subject: Re: [PATCH v2 19/20] hw/arm: versatilepb: Store boot info in the
 machine state
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, 16 Aug 2026 at 16:07, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 16/8/26 15:12, Bin Meng wrote:
> > arm_load_kernel() keeps a pointer to the boot info struct for the
> > lifetime of the VM, so the struct logically belongs to the machine
> > rather than to a file scoped static object.
> >
> > Give both machine types the same VersatileMachineState instance struct
> > and store the boot info there.
> >
> > As in the xlnx-zcu102 and raspi machines, the boot info belongs to
> > the machine rather than to a static object:
> >
> > 4d1ac883a7 ("hw/arm: xlnx-zcu102: Move arm_boot_info into XlnxZCU102")
> > 0f15c6e338 ("hw/arm/raspi: Move arm_boot_info structure to RaspiMachine=
State")
> >
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> > ---
> >
> >   hw/arm/versatilepb.c | 16 ++++++++++++----
> >   1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> > index c6991a52e6..520af79c80 100644
> > --- a/hw/arm/versatilepb.c
> > +++ b/hw/arm/versatilepb.c
> > @@ -182,10 +182,16 @@ static void vpb_sic_init(Object *obj)
> >      peripherals and expansion busses.  For now we emulate a subset of =
the
> >      PB peripherals and just change the board ID.  */
> >
> > -static struct arm_boot_info versatile_binfo;
> > +typedef struct VersatileMachineState {
> > +    MachineState parent;
> > +
> > +    struct arm_boot_info bootinfo;
> > +} VersatileMachineState;
> >
> >   static void versatile_init(MachineState *machine, int board_id)
> >   {
> > +    /* versatilepb and versatileab embed the same state as first membe=
r */
> > +    VersatileMachineState *vms =3D (VersatileMachineState *)machine;
>
> Use OBJECT_DECLARE_SIMPLE_TYPE() and the defined macro?

That doesn't work, unfortunately, because in this file we define
two machine types (versatileab and versatilepb) which are separate
classes directly inheriting from TYPE_MACHINE but which share
a common init function (both classes have an instance_init
method which calls versatile_init()). OBJECT_DECLARE_SIMPLE_TYPE
wants a 1:1 relation between the state struct and the type.

I think to get this into a shape where we could use the standard
QOM macros we would probably need to define a common abstract
class that both the leaf machine types inherited from. That
feels like it's probably a worthwhile cleanup, but I'm OK
with what this patch is doing rather than making the "create
the abstract parent" refactor a dependency for this series.

The same applies for the omap_sx1.c and realview.c patches
in this series, which do a similar thing.

thanks
-- PMM

