Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1148801lfc;
        Mon, 9 Mar 2020 06:28:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsqXhlCBb5SBVyXGfdOPOoyeHfDIOeMpXKj5nb/uczSOUwnu+UdwHAt26/U5LdGQp9CQfdH
X-Received: by 2002:ac8:5485:: with SMTP id h5mr14178440qtq.56.1583760539054;
        Mon, 09 Mar 2020 06:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583760539; cv=none;
        d=google.com; s=arc-20160816;
        b=uYKVK5ood7xJT7D/1HlXYYM18SG3fsQl3iRIVemZwMSuAlI2ZcQx0I1NSjEeu0N18b
         DVIlpthLS3+0tEcOBw39GzF5JgorN27GkV2Hhg1A+1O6tLst0bZmy8EFN+IzA7teX5kn
         +2cddKXq/b9Uj6XEvohIjt4RVriEdoFs0fRBjlEfYww7Xjsv6PQlk7cRAPbrKcPacfaQ
         xB6ESu9mTNpPMifDHARh5hyc9gVJTtGjyzh2GZn2muhiovjlLGUxtHd02GSthB/GrsWy
         F9AjpG4EwXm67Ta6sDHkeWeCVlGXy2b4EWsU6UsAuxsuBMpOIiX+H2U5XDPGiTTZiIK4
         5Xog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cfPlssygrlRP1RqqE9U9UFYMY69kVxQSNIUP9JvVdvg=;
        b=gkFBwG+5P7rBUS0X/R54rMbVbo7nVELxLXPGurY6KwfXrOqeKd5xX0iU3vnUom/s/D
         2Zc1fFbTzVIYMUezTnJhvUKU0dOzr86q3wrlsdnJ2xjpWBaw2OF5nuODcNeqqjcATBX7
         lxd0wH9iQqzzrFttgLiEn1+F6yvqMja4jqqRk+sCeyeqswCW+168qCw1sZFkj1lcxG/9
         oNd8tzNpcS9gR7GvHqqxeChNO0Ie6nE3powWLeQ96PZl6UQcU7j8rpQwCGlblSYRVldW
         FHOc/EHC/BdJLUxn4rm5gvpRU5L4fQTNSDi9mRh/OgMJYJ3odNMo1K/1rhlnVCy24zBG
         Q26w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L2OJkH2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si6157714qkv.351.2020.03.09.06.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 06:28:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=L2OJkH2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBISo-0006c5-Gh
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 09:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40886)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBISe-0006b2-4b
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 09:28:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBISc-0002YB-UK
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 09:28:47 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37946)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBISc-0002Xo-Og
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 09:28:46 -0400
Received: by mail-oi1-x244.google.com with SMTP id k21so3199156oij.5
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2020 06:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cfPlssygrlRP1RqqE9U9UFYMY69kVxQSNIUP9JvVdvg=;
 b=L2OJkH2USO3acp42xe0i5l+YSXk+/71fFTdqCZx1MpAwIBKkMtEzE1IFPoyEZE2Zha
 oiESSd5adLnZ5MmHi5y6go4v1S6oQsC0FsEHt+DEdPhWx/AlSkBjWzMwYPEB5uGRcYwO
 bAQt8CFUc1DEh81T1JGWuidLF+7XnWQTAWOcNJM/La5E8K6RBLxxt9xgJJe7GZoj9WYy
 J9nEjv48jONGKoPyylokgW8ZJ9YPUxygBIetiTuBw+VYVp/KJZg6hZuVC8TpuAFJanvu
 hAhgMHihjTCcUabaEVY5Df50o4FO24SvzHW8Nz0nhUuEYeynX7/tLftE8ZnZwyM2cDLH
 4dsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cfPlssygrlRP1RqqE9U9UFYMY69kVxQSNIUP9JvVdvg=;
 b=b2NrjlTq0OxIkQBrCb4/Cvq/aDM4Kgi0OmylSq+2ddecSaejvu6FHgWXW6bTurvLZx
 U9GaPXin7rrMpCZI93NC0tnlXKc739hdOZ27WRoBGIhqfJIMCytOu87HFlT41hg7cH4A
 VZJGMEPj1SzVkgf51yv5heC2eBZbCDiO13jUM8XX6tKMR6FEeDiQ/J/eevDa4KO7FyWm
 DOI+iq7PuSy0lOEBherZTtPI61gwEbVWL7tKdImypJqY9fBZWWV8Q6C5VJX/FnJvcvZ/
 bKBB+qLpGdHQIHpNP+33N9ByV4UO0/a3h8FVIIYrwqtf9WT/11MVGOskrMNAIMPAanX9
 5+HA==
X-Gm-Message-State: ANhLgQ2u2Wlagxh6eGnX/Ih2TeyXM5PZPVpoyWEZjvwwkXZWPskd0/fP
 Ap8Yk7DKm5qUhXhFF2eeMOLN8gyGPzLK4npkQ7j1vA==
X-Received: by 2002:a54:478b:: with SMTP id o11mr10839846oic.146.1583760525661; 
 Mon, 09 Mar 2020 06:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200302105516.5972-1-eric.auger@redhat.com>
 <20200302105516.5972-6-eric.auger@redhat.com>
In-Reply-To: <20200302105516.5972-6-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 13:28:34 +0000
Message-ID: <CAFEAcA-XD9LiokquaHj+kCYWA3N=7k3V3R8r5gA1HZM9Adus1A@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] hw/arm/virt: kvm: Check the chosen gic version is
 supported by the host
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Marc Zyngier <maz@kernel.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qT0ZfbJZdmJe

On Mon, 2 Mar 2020 at 10:55, Eric Auger <eric.auger@redhat.com> wrote:
>
> Restructure the finalize_gic_version with switch cases and, in
> KVM mode, explictly check whether the chosen version is supported
> by the host.
>
> if the end-user explicitly sets v2/v3 and this is not supported by
> the host, then the user gets an explicit error message.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>
> ---
>
> v2 -> v3:
> - explictly list V2 and V3 in the switch/case
> - fix indent
> ---
>  hw/arm/virt.c | 77 +++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 53 insertions(+), 24 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index eb8c57c85e..aeb6c45e51 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1542,33 +1542,62 @@ static void virt_set_memmap(VirtMachineState *vms)
>   */
>  static void finalize_gic_version(VirtMachineState *vms)
>  {
> -    if (vms->gic_version == VIRT_GIC_VERSION_HOST ||
> -        vms->gic_version == VIRT_GIC_VERSION_MAX) {
> -        if (!kvm_enabled()) {
> -            if (vms->gic_version == VIRT_GIC_VERSION_HOST) {
> -                error_report("gic-version=host requires KVM");
> -                exit(1);
> -            } else {
> -                /* "max": currently means 3 for TCG */
> -                vms->gic_version = VIRT_GIC_VERSION_3;
> -            }
> -        } else {
> -            int probe_bitmap = kvm_arm_vgic_probe();
> +    if (kvm_enabled()) {
> +        int probe_bitmap = kvm_arm_vgic_probe();

Previously we would only do kvm_arm_vgic_probe() if the
user asked for 'host' or 'max'. Now we do it always,
which means that if the user is on a really old kernel
where the CREATE_DEVICE ioctl doesn't exist then we
will now fail if the user specifically asked for gicv2,
where previously we (probably) would have succeeded.
I don't think we should put too much weight on continuing
to theoretically support ancient kernels which we're not
actually testing against, but it does seem a bit odd to
probe even if we don't need to know the answer.

More relevant to actual plausible use cases, if
kvm_irqchip_in_kernel() == false, we shouldn't be
probing the kernel to ask what kind of GIC to use.

thanks
-- PMM
