Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B7FEBFD20
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 09:09:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCDIC-0003uw-CK; Mon, 13 Apr 2026 05:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wCDI6-0003uG-9z
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 05:09:11 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wCDI4-0006AL-Qi
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 05:09:10 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-651d692e833so222971d50.3
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 02:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776071347; cv=none;
 d=google.com; s=arc-20240605;
 b=ZxPUe5n61lhheVCB/73AS6DfZ1Nbagq7HUSKlVbIWP3fRjvsljWM5PwU1FS8eC6tyH
 6EVtZf51ghYbO6c6frLjo9zrNELUHmLSdPMPa53A1N+1S3BdKmS0UvYtOm618ShIBI4n
 sxqUR4u4jP5UtK6hCCVzESn516bJgammR+XdDNz5LTEosI7BcoJ6yQwMHoGRp5uyKY5h
 4ei7VmWlIOpLGl6OxnrUDZ7Poj9XU5W7G3/lWgsbcnGukjqACd3jusLsPr0PQDRpuWa2
 WXxY1Rh4SmUu39Ke5ZBLSAzQspqPeoAezIbW34xNIPbD++/A30uWuhcOwDU1+YA/aL1J
 Qj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=f8ilX+gdAZ9g1XYXS1qMUyfc+GbkP+U+4MtaUgVSn78=;
 fh=C9Vc7eVkDJI2mhqAXE6NpJIWO6co0K6OR0m1ef0YH0U=;
 b=eLMPRsAjv9hQmu/EfAZbkIcPhUAaKeikb4NHxCiEjRGPeY/2jkCAQLntkmOq/PKrhY
 Ihw8SmcosSdPKIFdKKMlq/8EVhNvtKxiXgP9pTIZei5W2SGOjy+i0jQxHVk75w9m2AFb
 bLMQ6O4PHkFdQJ4ABNvsZXXnk+oiVELteuiweu6R3r+WzKXV90RquzsWP4eEArWURNxh
 hg0RBhYDq6NTEHLE9HSiQqAfpQ5HpSoTXdfeFBsHSRECHgXIn8DUYQBjbsZbBUc1217y
 jog+wfgTggQ19Yp82AdVo/9j0vQ+hRNrj2KXKi7zsvalCKgrfUK9w93nwYDZdEeavZb8
 aoyg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776071347; x=1776676147; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f8ilX+gdAZ9g1XYXS1qMUyfc+GbkP+U+4MtaUgVSn78=;
 b=Oy7+SihL8fDQUVDhngiqLDQgxrDUX+nXn3CrDiCfLOXRirj8z33lneSuVT9/DZSzUE
 7F2IAC0ZYJ8WCJynPdZRzeL9C1s+ioOvj2eUV1mGMxtYPSADlQgdHLx/2UCn8X2ihwjS
 VlipAjQgG7RbPXxqViDELX92rE5uI/pbL6I4JzQunRJnyrtGLcJLDPxShpqxwYF7o8Gc
 kWI4sc649FUJspPcPmRtvYWavCyLZpJwScqxcxWgRexVpho6YRFUxaMSq+DIq8kopkYj
 u70YFn35yIajEUoPhtPz4HRqB+v/sTbSDsAZMqjg5GWDwR7mJ3s/obVTY+gGoWG7ffSj
 Hmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776071347; x=1776676147;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f8ilX+gdAZ9g1XYXS1qMUyfc+GbkP+U+4MtaUgVSn78=;
 b=Bqu+NMFOkAOdy9ND3aNAzVfYA7DV9CZ4LuXO+dYjuW68WgsRHOIWqbZ+s+0TTaBKge
 ckwSrpFx7cEjC5A9zgnZINjqyCjp72+UqZe66sHAUvsNDJWXGvkp18l1GHU2azTuqSEh
 ZXWtw6seRC0L1VIlrnR7gtOKINqvHbxDn3paWmmLZbypitH0E63OY+oOFTzDEtW5AhPc
 SllzQ60k5XLtzXyTwgp9lvnj9V1Sy6nt+w7OA/UTyTMQsVYM7CX8uRtYcBSJxs+VHNcQ
 bUIyC37Gvn7yg8zlqtyY5he7An4WJZAg/nyWf7MTH9mJbz4oQagAELo42vAeVjc6GS62
 qwXA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/yjWF3CvZuB1yXSj37pE5VX69F6yERN7tCPJ9UahaVZzKbRAbrTiCzqPSdvmCI+09ao1/O8rz74w==@nongnu.org
X-Gm-Message-State: AOJu0YxS92RQiX6m2/h2NSjAAEYHOjKmkTEEoYUfwWSkZml4djjAmSgt
 8OE9QK6grNlHL7kVuLhvBBDektQa6WFS3z5Y91SrZJppGYvcyU4oIB19WHg7BILAbbJVPpfynvo
 C+FA3Oz2pUfzx0Vip+844+TYah0y8sy7jdQLPLBNjsw==
X-Gm-Gg: AeBDiesCSEY7AyyjBH9SVH7IJPoCYQACfqzN1gvukeZ/f5fDzcaqbiv967Aw3IvH+2+
 UIf1VXDF/6cbRkEn4Mw1k1xQdjD+8NqQZME/z1lJIwb3nesbwYNZyX1Vu7JCaRsFH+uiOq6anPO
 e6erKw7DzBKITKzFPaOVF3PsYfwi6ZioZ2abysb4YeE1eH9/1daXj7DOLcV1GAHO770LemPMMk0
 q4U3s+tSPSJ2fybqCyaX+rxOaXrNrxZhnsOFUHwePxFLYkDFv6mDbhZzJZ9WMvg8sTLvvf6RfOH
 Syi6hP3FwXOLiBIK3sNrQ1MIwtzexC2dClPBEBr2nMAu0EUNf4gTcM8FKv2+jtecMXU=
X-Received: by 2002:a53:b1ce:0:b0:64e:a7d4:473a with SMTP id
 956f58d0204a3-65198c356e7mr8118513d50.67.1776071347088; Mon, 13 Apr 2026
 02:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-edk2_arm_serial-v1-1-c25e237116f3@redhat.com>
 <0b4976f9-cf83-47b4-8f00-cc68c9cf47fd@linaro.org>
 <abkPy4Xzf6YT6g5Y@sirius.home.kraxel.org>
 <CAFEAcA-dTkoKs0tgF+VV0PayFbDcmH_t64P6AOT18ShwEKTW_g@mail.gmail.com>
 <adyZm41cp_nZHPYj@sirius.home.kraxel.org>
In-Reply-To: <adyZm41cp_nZHPYj@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Apr 2026 10:08:53 +0100
X-Gm-Features: AQROBzC7EEDvSlCe2iUcRzrsWd7HluxJeV69VGH7eYYSFlAF3QoGTZlHxDouMsM
Message-ID: <CAFEAcA-pZCrti_==m2u-Kq55dmqBcs8S=Ztns8moBxSe2fV+ug@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: add serial-debug-level property for EDK2
 firmware
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Luigi Leonardi <leonardi@redhat.com>, 
 qemu-devel@nongnu.org, Oliver Steffen <osteffen@redhat.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Mon, 13 Apr 2026 at 10:01, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > I'd like to have something more convenient than that to turn on firmware
> > > debug logging.
> > >
> > > On x86 we have a dedicated device for firmware logging (isa-debugcon),
> > > so logging can be easily enabled on the qemu command line by adding that
> > > device.
> > >
> > > So the idea here is to have a dt property added to serial port to
> > > setup firmware logging, so we have something roughly comparable to the
> > > x86 functionality ...
> >
> > My rough rule of thumb for DT properties is "if it is a binding
> > officially documented in the binding specs in the kernel with
> > the relevant semantics, then OK"; but not ad-hoc bootloader
> > specific stuff (we have turned down requests from u-boot for that
> > in the past).
> >
> > Would using the fw_cfg mechanism work here? That's intended for
> > passing configuration info (and "how verbose should debug be"
> > seems like configuration info), and we already have a command
> > line interface for it:
> >  -fw_cfg name=edk2/debug-level,string=1
> > (or whatever).
>
> I'd very much prefer to use device tree.  A device property is maybe
> not the best choice.  There is this /chosen node though which is
> already used to pass around guest configuration information (kernel
> command line for example).  Maybe we can add properties there?

Sure, if you can get consensus on a device tree binding for
it and get that documented in the kernel's Documentation/devicetree
then we can implement something.

But fw-cfg seems to me to be a much better fit, and it has
the advantage that it requires no changes to QEMU at all.

-- PMM

