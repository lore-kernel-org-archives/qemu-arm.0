Received: by 10.223.172.38 with SMTP id v35csp227297wrc;
        Mon, 4 Sep 2017 07:18:14 -0700 (PDT)
X-Received: by 10.55.23.13 with SMTP id i13mr880583qkh.237.1504534694280;
        Mon, 04 Sep 2017 07:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504534694; cv=none;
        d=google.com; s=arc-20160816;
        b=mx0Z0ne5soBAsjyFGKyyeCIzQhVmJrhhiJABR4dCl7eB5L9BxKG6zyOe24kFZ4fglK
         b4BBRArchkB7pqhAOJN8Geby5XjVmNtEqNKNNjX1qA+qIU4tDCApGTmyAwLWy6I0ILA/
         0oUAP+YUeQFCecintuOBiW+3jsOCoe4nu6CrUsTWsSE4DkBzXmFouSdyO+pwCRKmNjBa
         66+XaEjp3V3O88WGxrpyWTmpHeJoGsWvJI5i4m9AgWJTg+gq22/ZAS7qvT32OrmA3AGi
         8wRdZR0Sx2O+JrNTJPQoHUFGbI7P8flwbwrk/BZeU3SzGtZE65f7PU0gavTNWyWVa7GK
         dVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=nfma6rPvV+W0zAyxTpga7OlP3Ja6tFK6Dz4UP6tBgBY=;
        b=D1L+WJ8nh/PnX1mkmNcIffGnUcxiuh92VoMfzzVIpvTv3qTMavNkBjUyqXEx6gEUk2
         YDG4JfQyQqqLiHbfgF4pRnymzY95atj7BPBaTMSM/5VCdGPbPL9h1Lfe+HsrxmbcbQcN
         GK+iiBu7Q9u+1GQIzwZfXGHWh5hbF22geFoiCvD6idSZxEtRw+Qy07e11EDNuKdCc6Ek
         Aolskf0bC96RlqNHbfgkO6tgIGq96P4/3aoYt9Tkx5qiSPiBVTOLsn5Thjm5QwZlY1OH
         l7rsNmx2LzZdt1B0tmAv1dsmldnt7k/cGCaE5173klWU+BISJwSAfsmQuh/L1WJ8jkIR
         vdvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h6/ZzSFY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r17si6930380qtf.294.2017.09.04.07.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Sep 2017 07:18:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h6/ZzSFY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dosCZ-0004fV-To
	for alex.bennee@linaro.org; Mon, 04 Sep 2017 10:18:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dosCC-0004Zc-9Q
	for qemu-arm@nongnu.org; Mon, 04 Sep 2017 10:17:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dosC7-00065r-NS
	for qemu-arm@nongnu.org; Mon, 04 Sep 2017 10:17:48 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:35376)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dosC7-00065a-Fv
	for qemu-arm@nongnu.org; Mon, 04 Sep 2017 10:17:43 -0400
Received: by mail-wm0-x232.google.com with SMTP id v2so5827196wmf.0
	for <qemu-arm@nongnu.org>; Mon, 04 Sep 2017 07:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nfma6rPvV+W0zAyxTpga7OlP3Ja6tFK6Dz4UP6tBgBY=;
	b=h6/ZzSFYog4tQILVsX/Wh197MrQPJk57Tbcdknv+obI+h5GDzY3wGTCcl3doS9o8Tx
	2l38UJcGhDXSAnZEsINKRHeDWfFD1b1QG/r+GZIpBvZAaVIcYJAxlCm0VtJ03lfGba4q
	fLa7zCJSwVg5rLQWkMBtkkyJkG73gHzQEl9j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nfma6rPvV+W0zAyxTpga7OlP3Ja6tFK6Dz4UP6tBgBY=;
	b=qfmgDerWsgAK/s2CwMMwoTIiWfhdjVIKQGYSIw1IpGAbq0ItjDNCe/Rzv4mv7O/j3l
	y5spulhC82YA7K2b8gxrB6g7PH1xFViXy6vQqKoRsgrdEhuaCQqbhiGL9ygoz+khHyti
	a1Ttr9m2GFUUcGXX0r3WItbjRrOpruDde297spKtAs/M2lnjAiH4PTuc2FLRlTt97J6E
	ry02vC7q+tQTpQPPJdLR7zFD7BuN19VSqFbYSvOfuV2pg5YbyRK+Kq2o6LpfCxhao23x
	VRA4gnBNRDwn3ZQT/7KymMiGVumKmNd6blM9805H5FXcxPk7XcnQc3zhyBDVjMPoLMnx
	g36w==
X-Gm-Message-State: AHPjjUgVCv+KYMbR1mDNXj8MMKaCn1x1NDaKd3UAVB/44zA33uGGmBxx
	jfMhE7OL9/1oWzdlFg6GmJrBh0/+5rtL
X-Google-Smtp-Source: ADKCNb5bD+w47Bxw8qdadYn0Y0XyBVXi3+65g0p4ZaTrSNmYLsWdvz+xzYjL+AI/ok9PjMRMp7qEoKKQYuBE0OtwEU4=
X-Received: by 10.28.34.198 with SMTP id i189mr723535wmi.165.1504534662456;
	Mon, 04 Sep 2017 07:17:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Mon, 4 Sep 2017 07:17:21 -0700 (PDT)
In-Reply-To: <1500471597-2517-5-git-send-email-drjones@redhat.com>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
	<1500471597-2517-5-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Sep 2017 15:17:21 +0100
Message-ID: <CAFEAcA_xDei18gfdLuo5=aPM=9D9Ou6LBLfT+gtGUKgcpDC88A@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-arm] [PATCH v2 4/4] target/arm/kvm: pmu: improve error
 handling
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Christoffer Dall <cdall@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uZQp+FECTYeP

On 19 July 2017 at 14:39, Andrew Jones <drjones@redhat.com> wrote:
> If a KVM PMU init or set-irq attr call fails we just silently stop
> the PMU DT node generation. The only way they could fail, though,
> is if the attr's respective KVM has-attr call fails. But that should
> never happen if KVM advertises the PMU capability, because both
> attrs have been available since the capability was introduced. Let's
> just abort if this should-never-happen stuff does happen, because,
> if it does, then something is obviously horribly wrong.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt.c        |  9 +++------
>  target/arm/kvm32.c   |  3 +--
>  target/arm/kvm64.c   | 28 ++++++++++++++++++++--------
>  target/arm/kvm_arm.h | 15 ++++-----------
>  4 files changed, 28 insertions(+), 27 deletions(-)

This breaks compile on 32-bit ARM:

/home/peter.maydell/qemu/target/arm/kvm32.c:530:5: error: conflicting
types for 'kvm_arm_pmu_init'
 int kvm_arm_pmu_init(CPUState *cs)
     ^
In file included from /home/peter.maydell/qemu/target/arm/kvm32.c:21:0:
/home/peter.maydell/qemu/target/arm/kvm_arm.h:199:6: note: previous
declaration of 'kvm_arm_pmu_init' w
as here
 void kvm_arm_pmu_init(CPUState *cs);
      ^

Looks like you forgot to update the 32-bit version of the function
to the new API; I'll just fix up the patch in my queue.

thanks
-- PMM
