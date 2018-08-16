Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2070201wru;
        Thu, 16 Aug 2018 09:55:10 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzljaPaLC2wjYu9Eo6kDrBopak/WJwZg3ac72vmcaRXHNTHGuRPx0PFMq66s/RtN56t8uM3
X-Received: by 2002:ac8:5207:: with SMTP id r7-v6mr30617982qtn.11.1534438510113;
        Thu, 16 Aug 2018 09:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534438510; cv=none;
        d=google.com; s=arc-20160816;
        b=ralmmWQl34bq757L+vk/dsg03rkuPjevP27XkEyEFb9E0OfJhmD+XtynMtv99JyuJO
         6v6x8OaFJhwsfWlTFgcyBDOY+g1fsZF9+hvXruhGwDVc6XvafRa00cg4WCW5eSZid8NI
         vnMVUZ/AZKQ0bySPaDI7P9c2qkEmvuy9Qb/o92Mzfo/rknZgbcQ9ZOyJhd9PFSz0o9rT
         X2RsMYF5zho76uwaz7ymQ3hFc0d8tmrZMThj9ptsks/kL4up10TdEYigNkpPA8clnv6d
         YIby4gBQ6rCTluX1ByCgvbYsjTM2DsYwv7D03FoDMP7dT237iN0EQgX4RLP9HEHvS5Cr
         KJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=mO3hkgMHbVpOYnMWRKwWw5reJt+hbxS5p107MbNnRu0=;
        b=CSXuIXOQpLn9hYc8NV2DTzXBfqCawtABVMKFYr/8/swPV86WrIdzuPuWLntOkJYQnp
         ltePpuW+S2h8SaSOuL0eAuxuwLbJDHNBFpy94t4AEFZBzFcj/5lP4L3NPDOhnQOhv1XY
         Lj3zM8vtpQv8yYkojlqkcQ3xAhYg04+SBhjiKZy5/S3ZM4AteSzNU3QxBwJBMsKmh8Fv
         3XvKCXXk34gw0tOPsnBovPPrhttgDuwvoj/LeN4sJMcIhpnLos9rCx6VgmdavyHwSJVu
         5lqEtMsFmBuY2X5bz+JrTGzCywZGUxwpB3oR4yT59Cgn+lcGZGi4PsfJ6UNtNBL0YPvr
         XlZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cWPzrXRM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2-v6si4841408qth.11.2018.08.16.09.55.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 09:55:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cWPzrXRM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqLYD-000765-IP
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 12:55:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqLOr-0006gV-FT
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 12:45:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqLOn-000286-Gy
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 12:45:28 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:46246)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqLOm-00022j-Hc
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 12:45:25 -0400
Received: by mail-oi0-x242.google.com with SMTP id y207-v6so9136709oie.13
	for <qemu-devel@nongnu.org>; Thu, 16 Aug 2018 09:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mO3hkgMHbVpOYnMWRKwWw5reJt+hbxS5p107MbNnRu0=;
	b=cWPzrXRMkc3lmpLGjwhzyLlmrpkpDOUl8sacVozCBJxE6LEg8lA56Vx98aplEyQmtk
	iDsV7j9jS0/KWmQf17XfrcmFIAqFQZlmHlmr8k1y+WlMIkU96VqMspq9N9KhtTDyfYk5
	oHajB4Ouhycq6cGZ9Lvc4A5smgvBOYH2MnW50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mO3hkgMHbVpOYnMWRKwWw5reJt+hbxS5p107MbNnRu0=;
	b=SiZNsTPO2LD+HMv+VV7wRQYcZK/gcMXlJo5YxCNklXKGkkFhr7GghpoMFK5VkJpeGo
	147MoR6GwRQ5Fyb88sqVtXAYZBtwkPY6X0oFbXTCJcVWb/jP3CD+xWxod89KbQ2X5sM9
	v2jsGkoTpMXsZVF42WYHFwmlAokrFjwmTW1p8MZ9KrzN55z4llhnXRoOMHDofdd0CaYr
	3T+mwCZruxwR0h3Ediq+8ABxpVhAlJTer3w4dChEb7BefCJlo4FwXd4U9e8stEkfGJUl
	mtfdXPpR2AsDWsFJ8cCl6dRy/isXZS7VUdKXrZjnQsUWIpPcbj/AvEShebbq1p0XEIJi
	e9bw==
X-Gm-Message-State: AOUpUlHWh5pjZT8heNKDRlPsvYVTmh8VARcccBnNy2ynpwN/cUthxlny
	UTz2ySI6yjoY7GfpOkMl5++H0slTt0LKm2sE9KWz7w==
X-Received: by 2002:aca:b9c2:: with SMTP id
	j185-v6mr30473051oif.212.1534437921312; 
	Thu, 16 Aug 2018 09:45:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 09:45:00
	-0700 (PDT)
In-Reply-To: <1531969910-32843-1-git-send-email-jia.he@hxt-semitech.com>
References: <1531969910-32843-1-git-send-email-jia.he@hxt-semitech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 17:45:00 +0100
Message-ID: <CAFEAcA8a1z2DXRQwdR1+Dtdu5uGdypYa7TR_gGq0v3hd02X-1A@mail.gmail.com>
To: Jia He <hejianet@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH] hw/intc/arm_gicv3_its: downgrade
 error_report to warn_report in kvm_arm_its_reset
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
Cc: Jia He <jia.he@hxt-semitech.com>, Eric Auger <eric.auger@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bU+E5xMH+hK1

On 19 July 2018 at 04:11, Jia He <hejianet@gmail.com> wrote:
> In scripts/arch-run.bash of kvm-unit-tests, it will check the qemu
> output log with:
> if [ -z "$(echo "$errors" | grep -vi warning)" ]; then
>
> Thus without the warning prefix, all of the test fail.
>
> Since it is not unrecoverable error in kvm_arm_its_reset for
> current implementation, downgrading the report from error to
> warn makes sense.
>
> Signed-off-by: Jia He <jia.he@hxt-semitech.com>
> ---
>  hw/intc/arm_gicv3_its_kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index 271ebe4..01573ab 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -211,7 +211,7 @@ static void kvm_arm_its_reset(DeviceState *dev)
>          return;
>      }
>
> -    error_report("ITS KVM: full reset is not supported by the host kernel");
> +    warn_report("ITS KVM: full reset is not supported by the host kernel");
>
>      if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
>                                 GITS_CTLR)) {

Applied to target-arm.next, thanks.

(I'm still not entirely sure of our warn-vs-error criteria, but
I guess since we don't actually bail out of QEMU here it's more
of a warning than an error.)

-- PMM
