Received: by 10.182.105.169 with SMTP id gn9csp769876obb;
        Sun, 8 Nov 2015 09:59:13 -0800 (PST)
X-Received: by 10.140.143.17 with SMTP id 17mr26825962qhp.36.1447005553260;
        Sun, 08 Nov 2015 09:59:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d72si8162117qhc.8.2015.11.08.09.59.13
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 09:59:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZvUFF-0000d8-0t
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 12:59:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvUFD-0000as-B7
	for qemu-arm@nongnu.org; Sun, 08 Nov 2015 12:59:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvUFC-0002TV-6N
	for qemu-arm@nongnu.org; Sun, 08 Nov 2015 12:59:11 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:36611)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZvUF9-0002SD-JU; Sun, 08 Nov 2015 12:59:07 -0500
Received: by wmww144 with SMTP id w144so60064128wmw.1;
	Sun, 08 Nov 2015 09:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wTEZWJohOmkNcSPX299ZrgQycnguMBe+f3e+qBXhBas=;
	b=DGvqgzLemSaRH8uaMCkmGCRN8cWf5o88Vi3QfZFSCE/NZe0svpV2EZsVS7zmf/h88i
	ClKbq7lVCzWB8GGPaxoOy0J7HRFAOcOhwr1/eLbavsept0Fb+Vn12cfC0qF1I8DXbaYO
	7mH5czorUZFaSNX2l0shGI9dljRlj5YY3x/3cmt/zaNcelRLM+JOthieWIFxUe3ejNOu
	9iZJ4AvG7FB7YhUWw/WLx2cOBYyQ8ixFQpJ+IW4Zrh5NLTKzXcvZ/LXZr7KitsqrS0jT
	z77Wp2bV7uXqT1azYTOy3GJVTSfM4uXbPjjAikevt18sVd5bcmD5t0N150MV2jwAMfyI
	9QVQ==
MIME-Version: 1.0
X-Received: by 10.28.146.82 with SMTP id u79mr20366698wmd.96.1447005546636;
	Sun, 08 Nov 2015 09:59:06 -0800 (PST)
Received: by 10.28.88.75 with HTTP; Sun, 8 Nov 2015 09:59:06 -0800 (PST)
In-Reply-To: <CAFEAcA--GNLbyYSvPLt4TScsXCVVtL++Jb7mKNa81XwfxDp3fw@mail.gmail.com>
References: <cover.1446428067.git.crosthwaite.peter@gmail.com>
	<bd4f60aa2f8ad0c5b739643459cd50b3bbe14d9a.1446428067.git.crosthwaite.peter@gmail.com>
	<CAFEAcA--GNLbyYSvPLt4TScsXCVVtL++Jb7mKNa81XwfxDp3fw@mail.gmail.com>
Date: Sun, 8 Nov 2015 09:59:06 -0800
Message-ID: <CAPokK=oB9QO47yat_HCLUwg7Gz=QBzRcO5V4DjxrL33Gpv7xDQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22e
Cc: Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-arm] [PATCH for-2.5 v3 1/3] arm: boot: Add
	secure_board_setup flag
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m5BUhOg7oNFt

On Fri, Nov 6, 2015 at 6:45 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On 3 November 2015 at 04:30, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
> > Add a flag that when set, will cause the primary CPU to start in secure
> > mode, even if the overall boot is non-secure. This is useful for when
> > there is a board-setup blob that needs to run from secure mode, but
> > device and secondary CPU init should still be done as-normal for a non-
> > secure boot.
> >
> > Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> > ---
> > changed since v2:
> > Assert if running KVM and board_setup_secure is set
> >
> >  hw/arm/boot.c        | 8 +++++++-
> >  include/hw/arm/arm.h | 6 ++++++
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index b0879a5..f671454 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -495,7 +495,8 @@ static void do_cpu_reset(void *opaque)
> >                  }
> >
> >                  /* Set to non-secure if not a secure boot */
> > -                if (!info->secure_boot) {
> > +                if (!info->secure_boot &&
> > +                    (cs != first_cpu || !info->secure_board_setup)) {
> >                      /* Linux expects non-secure state */
> >                      env->cp15.scr_el3 |= SCR_NS;
> >                  }
> > @@ -598,6 +599,11 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
> >      struct arm_boot_info *info =
> >          container_of(n, struct arm_boot_info, load_kernel_notifier);
> >
> > +    /* It is the boards job to make sure secure_board_setup is actually
> > +     * possible
> > +     */
>
> I think we could improve this comment a bit:
>     /* The board code is not supposed to set secure_board_setup unless
>      * running its code in secure mode is actually possible, and KVM
>      * doesn't support secure.
>      */
>

Taken verbatim. Thanks.

> > +    assert(!info->secure_board_setup || tcg_enabled());
>
> This assertion causes us to fail "make check", because there's
> a test target which starts every board with the "qtest" accelerator,
> which is not TCG. You need !kvm_enabled() instead (and
> to include sysemu/kvm.h).
>

Fixed. Changed to De Morgan && equivalent with the two !s for easier reading:

assert(!(info->secure_board_setup && kvm_enabled()));

Regards,
Peter

> > +
> >      /* Load the kernel.  */
> >      if (!info->kernel_filename || info->firmware_loaded) {
> >
> > diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> > index 9217b70..60dc919 100644
> > --- a/include/hw/arm/arm.h
> > +++ b/include/hw/arm/arm.h
> > @@ -97,6 +97,12 @@ struct arm_boot_info {
> >      hwaddr board_setup_addr;
> >      void (*write_board_setup)(ARMCPU *cpu,
> >                                const struct arm_boot_info *info);
> > +
> > +    /* If set, the board specific loader/setup blob will be run from secure
> > +     * mode, regardless of secure_boot. The blob becomes responsible for
> > +     * changing to non-secure state if implementing a non-secure boot
> > +     */
> > +    bool secure_board_setup;
> >  };
>
> thanks
> -- PMM
