Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4614557wrw;
        Tue, 13 Nov 2018 09:07:25 -0800 (PST)
X-Google-Smtp-Source: AJdET5eV/+mNP6ydWFGZCc6Z7zBkp6r/YmzDXm1rlKcFMDucBoQHPj04nKnmb7fMI0Y6PXnO6mxB
X-Received: by 2002:ac8:28d2:: with SMTP id j18mr5678283qtj.191.1542128845315;
        Tue, 13 Nov 2018 09:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542128845; cv=none;
        d=google.com; s=arc-20160816;
        b=IcOX/7pagXfJUV1/nbZgiIR3Z1d9bJiELPdSlq0Z5exUydVioWfxs4vjJ8fZnx7BE5
         UXYAWztODspwWGKImJi+2nE3T4kmILJWVSJV4zZMFEdEAcDAjGN3ftFao2E6wMBZS+d1
         pNRZ8csxEKRlB+C3bNoQF1SiHXHsZebS1FRP3dxRfe76Rg6AFNSAHZlyIZpm2fiacsHP
         YR4ZzGY1iPJROqQt7yCjVcXZq7yn4zwb3s27GhOJt2h5cZQBMNLCqFR+6IEW/W5mS91U
         AvragDCB6calLYq41Etp32DYfxiA+Zlk5iBCk9dSed+tc+WCAaOxDUCuL7PAiddXMd9w
         Ud+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=B0zc3lxZ6hOboXZRp+3XWbagzhMykCxPfDeiYkhOmK4=;
        b=pTUUm25H7CYaR120bLq8+0STxymbaMe495Th2aVD8zwX4cjVe0BhCDiZ55D2oPApa3
         vYOQg6tbwlMkiYpgzLwhJaaXySpbfBOokO9pJuV9TE9wxBaU8adklvizIz5PjEZt8VJL
         07GbN/IHrNT5I5gPcrGgHNq6oVuPfjha9EY3i4TlaA2ANteX2o8NOw7u0TvmbhmaESqN
         S83+jQXzfMMhbhrSjQozWeXDdYn6uBoKLaAKiy3Lwfj8ALK1SVNCxxy85FLPc60qCzX/
         jJ9hMs8gqib1JnaaKr/m/dm4hchkv4bJ5exMDcnYwgFwtxkF9kketagcCIu8nY83nVOo
         /enQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bEqQgBGF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g24si15664002qtm.208.2018.11.13.09.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 09:07:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bEqQgBGF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55147 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMc9s-0007Yq-OL
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 12:07:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMc9c-0006aP-V6
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 12:07:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMc4K-0003EF-Oy
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 12:01:41 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37370)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gMc4K-00037i-Bk
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 12:01:40 -0500
Received: by mail-oi1-x242.google.com with SMTP id y23so1819975oia.4
	for <qemu-arm@nongnu.org>; Tue, 13 Nov 2018 09:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B0zc3lxZ6hOboXZRp+3XWbagzhMykCxPfDeiYkhOmK4=;
	b=bEqQgBGFkRW9WHI1NiMhQdHRFDfNde2Ohphh/ATiGalQHPLk9CLXAkfVX68bphLNyn
	B6mx4hp9NtfX5kdLYxLn0b3RpXMK+D5toXXcgZ1aZAn5ySulXPRYdo3FaptkTCQFXa3j
	qfBzmZAdXmtmaPp911FFPRtACPZF4KE5WUywo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B0zc3lxZ6hOboXZRp+3XWbagzhMykCxPfDeiYkhOmK4=;
	b=ZNBkPSvbXani1krfTFYcttDuls/4enOagYyFTAfk6vLVqCPnBVwOaXEqM6NUBS0eZ6
	aLKR4wd272G1gXf52Tdu7HQu0f4N6VFa8z3qD6mThFucdBjKnzlhWevw1Fv35gIltzSh
	PCEd0lmu/pTeRJI9P4ls3N4Dzi09nr0EALgxG3RDRk6NbAg1JaeLgCQzsLKrQbDYgzv5
	rsJK/njbld9wPmJdKuPx3QxjpBNLBkOs7GyIbarka4s88H9fcA24dKr95goy5T60QwAT
	vfQXWlG4f7s3nlXtGF8O2L8gPNTufFHFAZtJY1iEwWvekYVmqz+qOZS0ONUzKOrr0sjZ
	+Cjw==
X-Gm-Message-State: AGRZ1gKgQbe/opGZm0S2JxCO7ghDN7nt+AfKj9BSnrJlFPwiuIekjdMU
	6cVbHyc7DIlUIQKJTkeoQjmeIpyi4x0sOeeAksjAvQ==
X-Received: by 2002:aca:fd12:: with SMTP id
	b18-v6mr3563209oii.337.1542128491495; 
	Tue, 13 Nov 2018 09:01:31 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 13 Nov 2018 09:01:11
	-0800 (PST)
In-Reply-To: <20181113165247.4806-3-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-3-sameo@linux.intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Nov 2018 17:01:11 +0000
Message-ID: <CAFEAcA-R51dyV7gtS+q-eLNn5LBJbSMKtQu4-N3p0c4mJrU8DA@mail.gmail.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH 02/13] target: arm: Remove unused headers
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l395jWXrfAtw

On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wrote:
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  target/arm/helper.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 3d4e9c5c8a..27d9285e1e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -12,13 +12,10 @@
>  #include "internals.h"
>  #include "exec/gdbstub.h"
>  #include "exec/helper-proto.h"
> -#include "qemu/host-utils.h"

This is for muldiv64().

>  #include "sysemu/arch_init.h"
>  #include "sysemu/sysemu.h"
> -#include "qemu/bitops.h"

This is for extract32() and friends.

>  #include "qemu/crc32c.h"
>  #include "exec/exec-all.h"
> -#include "exec/cpu_ldst.h"

This is for cpu_stl_data().

>  #include "arm_ldst.h"
>  #include <zlib.h> /* For crc32 */
>  #include "exec/semihost.h"

thanks
-- PMM
