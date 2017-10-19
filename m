Received: by 10.223.197.9 with SMTP id q9csp6900438wrf;
        Thu, 19 Oct 2017 07:57:21 -0700 (PDT)
X-Received: by 10.200.43.120 with SMTP id 53mr2534149qtv.127.1508425041203;
        Thu, 19 Oct 2017 07:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508425041; cv=none;
        d=google.com; s=arc-20160816;
        b=0SanfLHgJLYpPRnese8Vp/r+SFBP3jDCo/b9YevUJu94Gwky1SijXp1YB77Oxi73eR
         qffQJlBI0gxzkU5y95Hi7jN2DmCVBh/jI6OH112/b+d1npR2DbBQZRUwfEnsmPbAuazj
         ESNsCbBvTLZIWGuqRURu/pNa1jRTC+H0p5eojvn3pNSqWJGBCSSLkG+7WpL1gX4+IO1W
         kE9Z2pWeinCZ3P4CxgUgevi/tICsCbHTt1ElcTxmopXrlLnwkD/mpfdg2lDZdu6pCiC8
         XlDs1BWs2GiwJrNnQ2noy8eM1JQq9Y/eM2ZfJt/KoTaKTtfkJ5t5sErEELtEJrlsLUOo
         Vx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Q3LnXEIoYJnI0c0yWkSV0Kd+uMu8xRAbUVJYrd6++ic=;
        b=geD82/7vGjD+d1X8ohJ8vNtGKvW0ciDsMTxrnonAVjSpUkGrQNX9cg0OttLZ7m82JB
         llI60IXRqDgNu2dsjOzluRqI/e19CZYMC8uWYXR3AN2ter1QE5J+x+9ZOr+CtQZfd3RK
         kStC9FXy/S8+VxpwGOVPqiP42wlix7/7qfck7C/Y+NI0sxKOZf2yElE42cq8Mgf/hUV1
         vr/HMJtPEmlrN2RFfzFcSNBkCzjL4FyTwde4kiF1JueXeiIjg2knFwZNiwo23HhISZ+N
         JrriiF+W7fWyI+TvN7ZDF8Z94p7YfavF50Geao1+k4TFjxqw1QDZwOqDCmGUuihQEusP
         /vbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=de9kzvXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g16si1772314qta.328.2017.10.19.07.57.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 07:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=de9kzvXs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5CG7-00079z-14
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 10:57:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5CG0-00079U-R9
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 10:57:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e5CG0-0007tH-4w
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 10:57:12 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:46671)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e5CFz-0007sg-Sc
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 10:57:12 -0400
Received: by mail-wr0-x241.google.com with SMTP id l1so8641238wrc.3
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 07:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q3LnXEIoYJnI0c0yWkSV0Kd+uMu8xRAbUVJYrd6++ic=;
	b=de9kzvXsi3bmsS6mY9iakhKQfmeMULhXTUkgB2bdLTalQ47mvNr0nV6/mulp/Scf6d
	XvW5mhLkQg+onO4NXKRCXvgB8OnPMX6WWZ18Rqm62TW4ypdgA6kMXqDLKynla653dSrI
	3bvb6Oxd2engxEW4NVd9H5Xa3YrUq84ybQtl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q3LnXEIoYJnI0c0yWkSV0Kd+uMu8xRAbUVJYrd6++ic=;
	b=W93hRWVLTHxHgtmjR3BZBcjlkubyFVtX+YHnmOi7ztJCSHQBnYBeFoWmRlYYBlpvVK
	JNxuS2iiBT3pn8Pw8fuHeORNhTzwjls2kP4MYZv39ueFdRx+TBYY+2vi3qfdKn18Ri4n
	vnwVmheYqj6t/ejTICyC4yDLKiMUqZlli14TcCE5Ic3OmUpBFXcBdFqLVv3gbbE1u0PC
	dzimCOjMbeLanHxraw9pppNU/WEDrIvK7/hbhRBKK2qje/3r8/Vc6O72JcPShZTN+aun
	7WWmp2Pa5/0Fdt5W5W9DveAWZrDeinzAGZAsZrEZaGmzPqNZaVRj7dH11kUOQ5OahaTP
	qpAA==
X-Gm-Message-State: AMCzsaVqbFvFEA/eUD9l12dQHNXxgj2OMOOCHn6RcPEB6Pc2oI5EypSh
	dRTDB+cCNDbWtrPbQ4Vce4aPEdXy/XwTshRz7GC/Dg==
X-Google-Smtp-Source: ABhQp+S+4sIAeI6YmNRPhoj5Nag6tGZs442g2ERaDFqT2k8wQQUF37Ey0X2FuzY68PZ7hgNY75sHRsqgzBdx6u3yqsI=
X-Received: by 10.223.161.218 with SMTP id v26mr228614wrv.178.1508425030499;
	Thu, 19 Oct 2017 07:57:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 19 Oct 2017 07:56:49 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1710181439060.27209@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710181439060.27209@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 15:56:49 +0100
Message-ID: <CAFEAcA_v=UsQ4hfn2oVLt3MPU3yJUnHLfzZHrdkstQ0VVgSDbw@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-arm] [PATCH] fix WFI/WFE length in syndrome register
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Julien Grall <julien.grall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O4OFJvOSD/Zr

On 18 October 2017 at 23:03, Stefano Stabellini <sstabellini@kernel.org> wrote:
> WFI/E are 4 bytes long: set ARM_EL_IL_SHIFT in the syndrome.
>
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 1f6efef..cf8c966 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -398,6 +398,7 @@ static inline uint32_t syn_breakpoint(int same_el)
>  static inline uint32_t syn_wfx(int cv, int cond, int ti)
>  {
>      return (EC_WFX_TRAP << ARM_EL_EC_SHIFT) |
> +           (1 << ARM_EL_IL_SHIFT) |
>             (cv << 24) | (cond << 20) | ti;
>  }

Hmm. What we do now is definitely wrong, but WFI and WFE can be 2 bytes:
there is a T1 Thumb encoding that is 2 bytes.

HELPER(wfi) doesn't get that right, though:
    if (target_el) {
        env->pc -= 4;
        raise_exception(env, EXCP_UDEF, syn_wfx(1, 0xe, 0), target_el);
    }

So I think that HELPER(wfi) needs to be passed an extra
parameter is_16bit, which it can then use both in its adjustment
of env->pc and to pass as an extra parameter to syn_wfx(),
which is then syn_wfx(int cv, int cond, int ti, bool is_16bit).

(In theory HELPER(wfe) should also be passed is_16bit, but
since it doesn't currently ever raise an exception it
doesn't matter.)

thanks
-- PMM
