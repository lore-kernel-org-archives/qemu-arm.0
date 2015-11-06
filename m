Received: by 10.182.105.169 with SMTP id gn9csp1107354obb;
        Fri, 6 Nov 2015 06:46:19 -0800 (PST)
X-Received: by 10.31.169.9 with SMTP id s9mr13865192vke.103.1446821179542;
        Fri, 06 Nov 2015 06:46:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h200si414750vkf.66.2015.11.06.06.46.19
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 06:46:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:39138 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZuiHT-0003qx-6h
	for alex.bennee@linaro.org; Fri, 06 Nov 2015 09:46:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiHR-0003oH-22
	for qemu-arm@nongnu.org; Fri, 06 Nov 2015 09:46:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiHQ-0003NL-0o
	for qemu-arm@nongnu.org; Fri, 06 Nov 2015 09:46:16 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:36678)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiHP-0003MV-Lv
	for qemu-arm@nongnu.org; Fri, 06 Nov 2015 09:46:15 -0500
Received: by vkex70 with SMTP id x70so15308830vke.3
	for <qemu-arm@nongnu.org>; Fri, 06 Nov 2015 06:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2k2Nk4xnaveRpYh4hL3W0rFvQMoHW3uVULAAaab6yh8=;
	b=gg64gpqkeZxpdvs/Mu/XXAvMl78iWXNNqA5q+Tz8Q7sX07A7cDxqVoPpLWwVHCmC1b
	whbD6KQmWeiluqWQmXvFReVESP4jYZ79Ze+ppRGW1z7iYgjOvjFTO6N04X05/ZtmuVQU
	kslNFGL1oAnwrqsm6wqxZYBaVfQPxVGMCARp6o/wESBSRt+edw981PkKk60ZFFJC//ch
	hteifIpZsp/FkMncQPXNJMWQwMR/1pfVBz6EJmDrPkKCF2FBUwNR5ogh76PycV0/DPCU
	yED5haUmORl6GWlXbki0iIjgC5K9vsVfwy+x13RnY4MWwHiAqkfnT+Qp/usHQ3hwfmud
	AjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2k2Nk4xnaveRpYh4hL3W0rFvQMoHW3uVULAAaab6yh8=;
	b=PT0iVJSvDsi/Wb2/wEqKX6Nbz/So+UBteMajAWHiHf6z2kawQJI0EN34ADQuFbdFl6
	m2wkuOFdCRLxlzQxpO7reJ9m8M6xmdxj9Zt6IOvIEnxSeX++e/HocmE5fes80+iHxIE/
	oW586WSoSZj+URj7uKeSuzhV/9uTo1XQXwqJWKUv1wGbt9gj8RERiOARQLpXR8BIsv9c
	lfJarVTxVeDVG5jN0sl4kuSf0gEmew4U1RTBoVIQsgardFg/DIxTV/ug4mEmBZyMqk2D
	k2yDNetTyWU5ZZA7hoYH/z9LFBiHWePkuGC8Jlx8r3a4W7KIra6ShNdBEKbxk0UVmOSV
	4rUQ==
X-Gm-Message-State: ALoCoQn0TJhnlFRuxHlaDHrbcWGTl12VJQJ+P8qq71ObkyPudU0TiUZmFEJPO+9mhWPfW7VRhWMN
X-Received: by 10.31.160.79 with SMTP id j76mr13882257vke.37.1446821173202;
	Fri, 06 Nov 2015 06:46:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 6 Nov 2015 06:45:53 -0800 (PST)
In-Reply-To: <bd4f60aa2f8ad0c5b739643459cd50b3bbe14d9a.1446428067.git.crosthwaite.peter@gmail.com>
References: <cover.1446428067.git.crosthwaite.peter@gmail.com>
	<bd4f60aa2f8ad0c5b739643459cd50b3bbe14d9a.1446428067.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2015 14:45:53 +0000
Message-ID: <CAFEAcA--GNLbyYSvPLt4TScsXCVVtL++Jb7mKNa81XwfxDp3fw@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22c
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
X-TUID: 1g5lLK2sCBfz

On 3 November 2015 at 04:30, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> Add a flag that when set, will cause the primary CPU to start in secure
> mode, even if the overall boot is non-secure. This is useful for when
> there is a board-setup blob that needs to run from secure mode, but
> device and secondary CPU init should still be done as-normal for a non-
> secure boot.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
> changed since v2:
> Assert if running KVM and board_setup_secure is set
>
>  hw/arm/boot.c        | 8 +++++++-
>  include/hw/arm/arm.h | 6 ++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index b0879a5..f671454 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -495,7 +495,8 @@ static void do_cpu_reset(void *opaque)
>                  }
>
>                  /* Set to non-secure if not a secure boot */
> -                if (!info->secure_boot) {
> +                if (!info->secure_boot &&
> +                    (cs != first_cpu || !info->secure_board_setup)) {
>                      /* Linux expects non-secure state */
>                      env->cp15.scr_el3 |= SCR_NS;
>                  }
> @@ -598,6 +599,11 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>      struct arm_boot_info *info =
>          container_of(n, struct arm_boot_info, load_kernel_notifier);
>
> +    /* It is the boards job to make sure secure_board_setup is actually
> +     * possible
> +     */

I think we could improve this comment a bit:
    /* The board code is not supposed to set secure_board_setup unless
     * running its code in secure mode is actually possible, and KVM
     * doesn't support secure.
     */

> +    assert(!info->secure_board_setup || tcg_enabled());

This assertion causes us to fail "make check", because there's
a test target which starts every board with the "qtest" accelerator,
which is not TCG. You need !kvm_enabled() instead (and
to include sysemu/kvm.h).

> +
>      /* Load the kernel.  */
>      if (!info->kernel_filename || info->firmware_loaded) {
>
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index 9217b70..60dc919 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -97,6 +97,12 @@ struct arm_boot_info {
>      hwaddr board_setup_addr;
>      void (*write_board_setup)(ARMCPU *cpu,
>                                const struct arm_boot_info *info);
> +
> +    /* If set, the board specific loader/setup blob will be run from secure
> +     * mode, regardless of secure_boot. The blob becomes responsible for
> +     * changing to non-secure state if implementing a non-secure boot
> +     */
> +    bool secure_board_setup;
>  };

thanks
-- PMM
