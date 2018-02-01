Received: by 10.28.71.27 with SMTP id u27csp1345569wma;
        Thu, 1 Feb 2018 10:07:18 -0800 (PST)
X-Google-Smtp-Source: AH8x227uuIjFDy1DYftjaH/p1ECXMgPqtQssIH+tBSQ9oF07ZVMm2ugEt/gewwhR20hCkNSAIa0E
X-Received: by 10.37.250.2 with SMTP id b2mr7667042ybe.231.1517508438540;
        Thu, 01 Feb 2018 10:07:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517508438; cv=none;
        d=google.com; s=arc-20160816;
        b=09jfmUBh+sI9P2AoIsRBZOuEZpBzJrNr6/KmvOFghsG2dbR6dZEnUIsKNi/w5cugCi
         Q6xK/IRYdKRv48sS9ArgjD5bPHpvD2cFL/HfLcSWinSQ2AA0aW8EJ+fYop0JLvosXCAq
         17KJVowkUFJFkQa//6XI0sOnWOxREo4+B8TxhHBFIG2OLsbn/aapo7HE5b9A7ATxud8j
         JQFbRGFS7G8GmY2APuY0v4inv7sx3vHT7iXz8T24mmx7S6lObH1qtz3RrN7U8PnzP5eY
         HaMrWNIPoWC4i+mkfFOT7HPkttaPHqx1aRHoX1jgf1+lemGU0ng1vORrdxi7+Sxq0lTC
         dR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=IReMnCFzEqRgAQ86MiAxhQTu5aaeK5kKa+vqJBGHYa8=;
        b=vs9iO01DgSXsVLiXhPG7nezFJL43R8gQ3rVXiMySqmCdSpIEPy6CYVmtNrrkPGj+aI
         x4Livr4OFp2USIMDMXScQc8kag67aCAQtVUvwp2m+Xs19ybPfMP8g1tDMq650REVGnTl
         j/z08mxQB5KelsaMJCLOzEnV2YtOjjXXilww68NLTHcI5mRemgKI4Zk5JKbU53qaY+ry
         5Qefv2O1CH2vWOdO4A+tx6NeXO9SLuHFvZMMmL+WxHuz8Axxc3I4GiEE5MMEdoveIKLh
         b+P2acApxqlbyqFqEsRjTWEQxZnqkPVT+7y+EOOP1Kl8Fq+87gKNv3TB6Pbf9e3xPIXW
         Hrmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jJoleb+O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i64si24375ywe.713.2018.02.01.10.07.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Feb 2018 10:07:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jJoleb+O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ehJGX-00024h-Qp
	for alex.bennee@linaro.org; Thu, 01 Feb 2018 13:07:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ehJCy-0007aM-E0
	for qemu-devel@nongnu.org; Thu, 01 Feb 2018 13:03:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ehJCx-0006Hn-Iy
	for qemu-devel@nongnu.org; Thu, 01 Feb 2018 13:03:36 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:36117)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ehJCx-0006H6-Cz
	for qemu-devel@nongnu.org; Thu, 01 Feb 2018 13:03:35 -0500
Received: by mail-ot0-x242.google.com with SMTP id f100so17758359otf.3
	for <qemu-devel@nongnu.org>; Thu, 01 Feb 2018 10:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IReMnCFzEqRgAQ86MiAxhQTu5aaeK5kKa+vqJBGHYa8=;
	b=jJoleb+O6US6ogJM7pMlsXQnUiqwXVziAAgloYnFx2pW46CebZ9QYbcT1r9n4VchL6
	KgoRsXrv2hpUs0FhGzPulya9QufccOEeeSls5CElObjlJR9DO1r2lO3ihnU0yLB0XWPc
	dC5bDy3IHI7K2iBF4f2tCbndCx56EkPy+X+ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IReMnCFzEqRgAQ86MiAxhQTu5aaeK5kKa+vqJBGHYa8=;
	b=b9HHM/S8gjlD1IxrhauavyTyPK0wukdjxO5X3DoepnOhCO15eSHpm3qIvCu9P8MKtN
	znymvSUVQqk+fbo4Egt2eiM2dRFbM97+GJJZoWvfh12BS9qYMDyux/msUR6oatEwMx/G
	Ov3Mq2fA9XC68vupIfnXjzWj42YJrJpe//let75fpKaoZ1wb+sVHuzCxlZpa3dCtBklF
	Ry4lRCUeJ4slqs//F7ZKpB6AHwj94FBF7lJsx8gTRocwHMvyXbh2oj/d7c6LFo1fM4vH
	oyk0l8nUx4zsgKS67FaEdRjvDrvPmbQ1DhAnm450AklkiKMdoifECTz23t0vUNDWk39Y
	wwZQ==
X-Gm-Message-State: AKwxytduoNvAyiFuyDyhDGH3P0TCowEy8CBkaSf/BUpHDSXg0q+QVpvC
	Xz2+zeFTpVpVfjCYdQHZ5rxlx/MB1BY7BzgBB7qGPg==
X-Received: by 10.157.13.72 with SMTP id 66mr4494076oti.116.1517508214722;
	Thu, 01 Feb 2018 10:03:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Thu, 1 Feb 2018 10:03:14 -0800 (PST)
In-Reply-To: <1517506091-10396-1-git-send-email-wei@redhat.com>
References: <1517506091-10396-1-git-send-email-wei@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Feb 2018 18:03:14 +0000
Message-ID: <CAFEAcA-AVqDdVwdwYM6vRkNSymGbOiEEqU5+sAN2w4pjpUtiig@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-devel] [PATCH 1/4] hw/arm/virt: Set default machine and
 CPU types for mach-virt
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dasQ2wjWiA0j

On 1 February 2018 at 17:28, Wei Huang <wei@redhat.com> wrote:
> Unlike most other QEMU architectures, the default machine type for
> mach-virt is not set.

This is deliberate. There is no single "right" choice for
a machine type for Arm boards. We had a bunch of problems
back when we did have a default type, because it was the
ancient integratorcp board, and users got confused expecting
QEMU to just work without specifying a machine type.

> This causes problems in situations where the
> default machine types are not provided (e.g. qtest_start() function
> in many QEMU tests). This patch designates the latest mach-virt
> machine type (alias of "virt") as the default machine type. It also
> changes the default CPU depending on the target.

> +#ifdef TARGET_AARCH64
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a57");
> +#else
>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> +#endif

This makes the behaviour be different depending whether you're
running qemu-system-arm or qemu-system-aarch64. The two are
supposed to behave the same way if you give them the same
command line options (like x86 QEMU).


thanks
-- PMM
