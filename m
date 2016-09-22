Received: by 10.80.163.71 with SMTP id 65csp83618edn;
        Thu, 22 Sep 2016 10:07:07 -0700 (PDT)
X-Received: by 10.237.54.164 with SMTP id f33mr3051717qtb.139.1474564027394;
        Thu, 22 Sep 2016 10:07:07 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 87si1808678qks.19.2016.09.22.10.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 10:07:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bn7Sk-000503-Ov
	for alex.bennee@linaro.org; Thu, 22 Sep 2016 13:07:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn6mi-0006Mm-HW
	for qemu-devel@nongnu.org; Thu, 22 Sep 2016 12:23:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn6mg-0002nu-HD
	for qemu-devel@nongnu.org; Thu, 22 Sep 2016 12:23:39 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:33832)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn6mg-0002no-BP
	for qemu-devel@nongnu.org; Thu, 22 Sep 2016 12:23:38 -0400
Received: by mail-vk0-x234.google.com with SMTP id u196so29568063vkd.1
	for <qemu-devel@nongnu.org>; Thu, 22 Sep 2016 09:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XriTpep6kqD+QvYQ82ipWiq+/IhlBdvP99Uc6qhVLkM=;
	b=F8Bx/rdidRMmeVNnU+PITQ7oRjXtdrUmwUJeBLzulo4MVCsxt63synpI4QLncl4p9p
	MloA1WPqmxnzAw0PzqXzXZsKF8SUaZA8AfD7sUCx1UDPKdPS8IzgFwz6h1VjlWSVOaof
	twVNdT5TTWNv1hvUgNVNusw06INoFfgg8FerE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XriTpep6kqD+QvYQ82ipWiq+/IhlBdvP99Uc6qhVLkM=;
	b=ViQkAHKrIyRXel/z98mLt711nr+mLhfYyAyr3cg+Zjk7Jc18FUIx7I/vS+FdoDSNKj
	klxHJ4tnH2K08EIjdWU+umHXY2aO4ufuF02pkikolbnwYA/ka9NRixJMnPjHvMusBdah
	lHALaTrdyM+lQYhSHagiG8aMlURyttW43CK36/BKSjf+Dk+0Ke3u2PDRX63PDUO4EwbA
	0YwV+TN06QKvP1D0XbYZV3gcBDvuZrKeyK41KLzDSWz6K+ReIFmbSUR1CwH0mqDoD0R7
	EfDvU0DrEsvOwgHyDgtBFetk+HGq0k3RNXXeeN/VR7+AARr3OtHK8dwa6E9lFz/O01QO
	XrQg==
X-Gm-Message-State: AE9vXwPwsBNF7nwdnaKwxi+P2rfPcNyd2S7PdYR0jhssRwYQcXqUpgfW+IQSVWO4nQoU70CGIe/xHNvQ3IZrDdEt
X-Received: by 10.31.51.70 with SMTP id z67mr1950715vkz.170.1474561417715;
	Thu, 22 Sep 2016 09:23:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 22 Sep 2016 09:23:17 -0700 (PDT)
In-Reply-To: <1473520054-402-1-git-send-email-m.olbrich@pengutronix.de>
References: <1473520054-402-1-git-send-email-m.olbrich@pengutronix.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2016 17:23:17 +0100
Message-ID: <CAFEAcA9UoqKSqH+b_zF435u+pZQCdGWu_KDGFW=MH+71Q_j6ng@mail.gmail.com>
To: Michael Olbrich <m.olbrich@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-devel] [PATCH] hw/arm/boot: allow using a command line
 specified dtb without a kernel
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IHJsEpqEGWY7

On 10 September 2016 at 16:07, Michael Olbrich <m.olbrich@pengutronix.de> wrote:
> When kernel and device tree are specified in the QEMU commandline, then
> this device tree may be modified e.g. to add virtio_mmio devices.
> With a bootloader e.g. on a flash device these extra devices are not
> available.
> With this change, the device tree can be specified at the QEMU commandline.
> The modified device tree made available to the bootloader with the same
> mechanism already supported by device trees fully generated by QEMU.

Would you mind explaining your usecase in a little more detail
(for instance which machine model are you using) ?

> Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
> ---
>  hw/arm/boot.c | 4 ++--
>  vl.c          | 5 -----
>  2 files changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 1b913a43ca65..942416d95a6f 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -773,6 +773,8 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>       */
>      assert(!(info->secure_board_setup && kvm_enabled()));
>
> +    info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
> +
>      /* Load the kernel.  */
>      if (!info->kernel_filename || info->firmware_loaded) {
>
> @@ -833,8 +835,6 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
>          elf_machine = EM_ARM;
>      }
>
> -    info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
> -
>      if (!info->secondary_cpu_reset_hook) {
>          info->secondary_cpu_reset_hook = default_reset_secondary;
>      }

This change definitely makes sense -- we check info->dtb_filename
in have_dtb() so we need to set it before we call that function,
not afterwards.

> diff --git a/vl.c b/vl.c
> index ee557a1d3f8a..bbea51e0ce7d 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -4335,11 +4335,6 @@ int main(int argc, char **argv, char **envp)
>          exit(1);
>      }
>
> -    if (!linux_boot && qemu_opt_get(machine_opts, "dtb")) {
> -        error_report("-dtb only allowed with -kernel option");
> -        exit(1);
> -    }
> -

I can see why you want this change, but what worries me a little
is that this is changing the behaviour of -dtb for all QEMU
target architectures, not just ARM (they no longer get a helpful
message on user error). I'm not sure how to address that, though.

thanks
-- PMM
