Received: by 10.25.21.156 with SMTP id 28csp1591163lfv;
        Mon, 11 Jul 2016 11:04:52 -0700 (PDT)
X-Received: by 10.55.115.196 with SMTP id o187mr27319975qkc.49.1468260292172;
        Mon, 11 Jul 2016 11:04:52 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q72si2315318qka.110.2016.07.11.11.04.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 11:04:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35361 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMfZb-0002Tr-Nd
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 14:04:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMfYk-0002BL-0y
	for qemu-devel@nongnu.org; Mon, 11 Jul 2016 14:03:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMfYi-0001DR-4R
	for qemu-devel@nongnu.org; Mon, 11 Jul 2016 14:03:56 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:35865)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMfYh-0001DC-Mr
	for qemu-devel@nongnu.org; Mon, 11 Jul 2016 14:03:56 -0400
Received: by mail-vk0-x22d.google.com with SMTP id f7so134603399vkb.3
	for <qemu-devel@nongnu.org>; Mon, 11 Jul 2016 11:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=abgQ6aQjnV21zFhrxY4WXQnBU8i4aEZDv0A4oRnG2cI=;
	b=DiWxgDQSgLJJasgsL3mJ5QZcvJiP5kl/6Q6Htw9xbnZa2Og9Zr+/oIfQb5Pw2pq13N
	4OYBy7y0w3Q2pUwfltmoVWI8zcoJGShPZ2KaF/Ty4S/oM3ZFxYAa6bSOW2CpvRVMkBAN
	kxXiJtsyZ95OHzxfWdkEY5kQciDD2vcPFQI80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=abgQ6aQjnV21zFhrxY4WXQnBU8i4aEZDv0A4oRnG2cI=;
	b=k22i2PMShEqNTraCHoTpXpgF+01zVpEaPUnCcWiprImrAT62UPaYIIKovRzUaaONcJ
	RkzkVlzkQAQKeqZAbS3xH1kr8w6aARr0jcDIuKcYdYIu2PzWJahzezLhhS1TVUgEf7CA
	xmHinAa6gLE7tn7y3O966xgJQY8euvaKyAXyHiGR/lMbeYfKMbOHwVCX+H4Waarov8L8
	JI8ZlpIX9yA31FEvq4xEJppQtYjPXIkbaVH6T3WX5YMK96S8QCPReFjE1ZsN7qNLC0lg
	CGEKceWz3sGoczgUkaFZ4d+FX6T84pvPzUS1j8K/SKSbeBw63Fi4cMUpy8yHrszd8H2R
	VZTg==
X-Gm-Message-State: ALyK8tIY5A9B8nFq5i7JuQ2FnvFDgwlVqoKgI/wD6+4yjgcaSd+kb4psjat1WLGPffZgqTyB5gapI5HNYjR2a/Ue
X-Received: by 10.31.208.196 with SMTP id h187mr10297025vkg.120.1468260235101; 
	Mon, 11 Jul 2016 11:03:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.69 with HTTP; Mon, 11 Jul 2016 11:03:35 -0700 (PDT)
In-Reply-To: <1467378129-23302-1-git-send-email-drjones@redhat.com>
References: <1467378129-23302-1-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2016 19:03:35 +0100
Message-ID: <CAFEAcA8OGkq6=WTiurar2uKaAZXAF-WhLb=JuORHpaStyV4BgQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-devel] [PATCH v2 0/2] hw/arm/virt: tcg: adjust MPIDR
 almost-like KVM
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vg/E1OzGuRet

On 1 July 2016 at 14:02, Andrew Jones <drjones@redhat.com> wrote:
> In some ways this v2 is more of an RFC then the initial posting, which
> had a different subject, and is here [*]. In this version we point out
> the real [current] goal, which is to get the guest MPIDR consistent
> with KVM. However, what's debatable is we purposefully neglect 32-bit
> consistency, as KVM likely needs to be changed, but will likely not
> be changed until it gains gicv3 support. Also, potentially debatable,
> is how keeping the 2.6 machine type compatible is approached. I think
> it's right, and likely the pattern we should use going forward for
> similar changes, but, hey, a patch is always a good conversation
> starter... Way better than most centerpieces anyway :-)

Looks like a good approach to me, and nobody else has complained...

Applied to target-arm.next, thanks.

-- PMM
