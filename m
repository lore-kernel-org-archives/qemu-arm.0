Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E73105F7B0
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Mar 2026 14:39:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w13fM-0006M0-SC; Fri, 13 Mar 2026 10:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osteffen@redhat.com>)
 id 1w13YU-0004o6-2d
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 10:31:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osteffen@redhat.com>)
 id 1w13YR-0003uh-G4
 for qemu-arm@nongnu.org; Fri, 13 Mar 2026 10:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773412313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xTwvEzJBWCB7RbCDEKlCHonjnrwir4x2Pvfboo8omj4=;
 b=C6qXTOi5crxcAGlo+7PzWPUyh8hPI/dAKsSvOXWOiXrXoFuCgrPEFjkynkYO9w4LFHvhip
 424/8sCfq0wcJUfdE4ANZizmLCRKik20KQ6uxCKp1qahmKbYIL+YBBSGS73gnZTd9HVpEn
 A5wrHYueSBvk8fkoln0aH1in9qz9y6Q=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-L9UUowI-Nr2MkGg9CfWvvQ-1; Fri, 13 Mar 2026 10:31:51 -0400
X-MC-Unique: L9UUowI-Nr2MkGg9CfWvvQ-1
X-Mimecast-MFC-AGG-ID: L9UUowI-Nr2MkGg9CfWvvQ_1773412311
Received: by mail-yx1-f72.google.com with SMTP id
 956f58d0204a3-64ad2a28349so3956953d50.3
 for <qemu-arm@nongnu.org>; Fri, 13 Mar 2026 07:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773412311; x=1774017111;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xTwvEzJBWCB7RbCDEKlCHonjnrwir4x2Pvfboo8omj4=;
 b=GWvETX4BARJMVUmnhVBbGMMxbQa8E2b9LyylZaD2Fh0t4pzdgEBEBDpWhuRlCezjQt
 v3MeVdQga1000ioqiuC3G0+IEakIMtWGsul1tFTzSbvFaH6Gbu/DT02IWnqffhJYSleZ
 cuKzyRlgAH0F737Wa1EDEcZuO/EpYmS1bYdCDjGZifgdlvnT2s1rLuDxqfB4nem1/Cri
 5fOu1Xfit4RwxYgF+tBGOnvqhtUZKUyi2Jr0Ma+a1tJe+x8MDSL3Vp4JVfDBz7v99UNg
 j7Y87U9rEjNPWeWu9iI1icFCgKTRoQOyrltIuv/yC+ys21gCW68+d+WwNTKfzzfvQvrJ
 8UXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVah/pnhLU5eTRJ03c/zkVtqCsridMUXZApOTEJ/4CuJKw3GJJOb4DeoTqaRCG1FfFPe10yEpEYWQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz0cZiRjiIcJoN7abbRHMP7Fqi1kxAsOGERpQT2KcquWOZhcTmN
 sxhbsHprS5m/vPSIPOdFatxZLky7GKQ0IKL0A4aarGBKX6hxM80PRXwZT2OJPdkrEo0/pYzn1z+
 8dqk5IrnYpSGHsXqRGx0huewN/esgKw1FWl2v9LgZSoy33hHmhd6QKHoEAcUeVztiHoHvJrukO7
 Q1Gk9GwII7KaUdbHlgI2gpEiGI8DvL
X-Gm-Gg: ATEYQzw3FXE/0iChnSkqnqninI9uXBVJOB8SJihlBnAojEYan7piSXCy09sKPd48fU+
 EL5oV/AN8hHs9YnUl0bM43EfPbCeEvNRqmxT1kNS9f4XSyaRLFAbRpTbwxuSQrEkMmurY9vU3vG
 4XVTJGRHCclykz/v7Yb3E1pAwITxTsmp4vLfvAPccrk+pd5i/DgQpEgmOO5mLtpHdVbEWzpNF/J
 ZhRs9BWxjFWv5ZRygS1bcXYi1HKk9vnXAWW/Q==
X-Received: by 2002:a53:e686:0:b0:64d:60f2:8186 with SMTP id
 956f58d0204a3-64e62fb9a7amr2716329d50.40.1773412311262; 
 Fri, 13 Mar 2026 07:31:51 -0700 (PDT)
X-Received: by 2002:a53:e686:0:b0:64d:60f2:8186 with SMTP id
 956f58d0204a3-64e62fb9a7amr2716287d50.40.1773412310669; Fri, 13 Mar 2026
 07:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260311-edk2_arm_serial-v1-1-c25e237116f3@redhat.com>
 <0b4976f9-cf83-47b4-8f00-cc68c9cf47fd@linaro.org>
In-Reply-To: <0b4976f9-cf83-47b4-8f00-cc68c9cf47fd@linaro.org>
From: Oliver Steffen <osteffen@redhat.com>
Date: Fri, 13 Mar 2026 15:31:39 +0100
X-Gm-Features: AaiRm53ZdLDBxSqfd-bzrXZ0ZZlydqUIwTqk2ogNbgqI15AVy4Qdu_vAaZjr85k
Message-ID: <CA+bRGFpcmkX=O1+7L5dHFRGh+M3BAd3BfHbQ+TXHYmcea8_pnA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: add serial-debug-level property for EDK2
 firmware
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Luigi Leonardi <leonardi@redhat.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BY54V37CDQbOmUXDCwxvoWerMscU4BwlUX-KtKbYON4_1773412311
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=osteffen@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 13 Mar 2026 10:39:01 -0400
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

On Wed, Mar 11, 2026 at 11:24=E2=80=AFPM Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> Hi Luigi,
>
> On 3/11/26 6:43 AM, Luigi Leonardi wrote:
> > Add a machine property to pass a debug level to EDK2 firmware via the
> > device tree. The value is set as an "edk2,debug-level" property on all
> > pl011 UART nodes.
> >
> > This is to create a runtime parameter to set the verbosity of the debug
> > log on the serial ports in edk2. Currently, the only way to set the
> > verbosity is a compile-time option.
> >
> > DT is used because the fw_cfg interface is not yet initialized in early
> > boot phases.
> >
> > Corresponding edk2 PR: https://github.com/tianocore/edk2/pull/12277
> >
> > Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
> > Signed-off-by: Luigi Leonardi <leonardi@redhat.com>
> > ---
> >   docs/system/arm/virt.rst |  6 ++++++
> >   hw/arm/virt.c            | 38 ++++++++++++++++++++++++++++++++++++++
> >   include/hw/arm/virt.h    |  2 ++
> >   3 files changed, 46 insertions(+)
> >
>
> I am not sure if maintainer want to have bootloader specific options in
> machine code.
>
> Alternatively, it's possible to dump virt dtb, modify it, and pass it.
> $ ./build/qemu-system-aarch64 -M virt,dtb=3Dfile.dtb

I am sure you meant
qemu-system-aarch64 -M virt -machine dumpdtb=3Dfile.dtb

Yes, that works. Thanks for pointing this out.

> $ ... modify dt ...
> $ ./build/qemu-system-aarch64 -M virt,dtb=3Dfile.dtb
>
> It has the advantage to be extensible to any other kind of options you
> want to pass through dtb without needing modification on QEMU itself,
> the downside being that it's less convenient than a command line option.
>
> Regards,
> Pierrick
>

Regards,
  Oliver


