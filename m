Received: by 10.223.197.9 with SMTP id q9csp1594943wrf;
        Thu, 12 Oct 2017 04:54:59 -0700 (PDT)
X-Received: by 10.55.221.68 with SMTP id n65mr38118qki.27.1507809299714;
        Thu, 12 Oct 2017 04:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507809299; cv=none;
        d=google.com; s=arc-20160816;
        b=sUeunlBYTP5cVx8Tx0HU9MUAuJVW16C8avS+MVrHN6p6Sfbd7B3hgBb2gANk6Rp3cb
         LhATZw9+WKVpdipGYYccmf8LoMca3xiPu0KxETcjqCcq9gx7NH8xXQ/ZreJTj77SRjEC
         SEVnxqR7SS6Fo0QvpZZcgBfpiB/I4bhPYhkqX/Zt2QYwJg3x/B++x2ow5IITuMWAz+iV
         vOr/jP+h1plKARu5ZTTLk0PXE+8F4aeBmYxhfnef/UgEHi/4e7XEThYFbRCSLOs76v7z
         LUFxIs0NG5Qe/fn2HItnghH7gfXSgfgbm8lGzv+/lJhoaDCVSWvFzi40Yfx4OsYwBYbE
         LOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gK/vWGmH3BA6jMfKlhMNTTIKRq84C9kn5YEYEcRvTw8=;
        b=i0D0oxgN7NG9zMtev819FLT06eU7dRrKqafTepBLh4REdAGJ58y6ggjoSsa1t9sDDA
         egvLqAacnAgPmF5Af5TMcNkIhE+WAqE6QCjyj4wpx67CaoBLBLHe5wZtpmJz5gxA+r0e
         c40VUvvHx+tF7n51Hc9JdbcYDSH0MVFfJWdN46Ri5M9PzdSIalPnOMKOPDEO7iU3labQ
         YxBMgo0GOJQbGm/VHC/132nfNey23JR8kiJh2eTruN7vbea2dr/Dgsbs5If2ffwuQlw2
         octkRTkeRjpT5OY41zd7+51xn8UCwZpquV6VhNl2TNKN9vVq8GdcG1LZ3Cr7ezFcxV93
         w+UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OC2KC8NO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m17si3393758qkl.510.2017.10.12.04.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Oct 2017 04:54:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OC2KC8NO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2c4n-0003qj-Cz
	for alex.bennee@linaro.org; Thu, 12 Oct 2017 07:54:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2c4Y-0003qG-1t
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 07:54:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2c4W-0007rn-75
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 07:54:42 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:53905)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e2c4V-0007rN-UO
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 07:54:40 -0400
Received: by mail-wm0-x235.google.com with SMTP id q132so12623828wmd.2
	for <qemu-arm@nongnu.org>; Thu, 12 Oct 2017 04:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gK/vWGmH3BA6jMfKlhMNTTIKRq84C9kn5YEYEcRvTw8=;
	b=OC2KC8NOtstzyJoUk4RotRDQiVhRDdkfgN8V/CVM0Yd3PfrU3Td0GheaY8FOs4u1Yb
	YB4wsJ4av+wAl9CAwLbAZDhhZLd202HDe8A0eTRosj29lDyvk0DcqTNETeygfFEaCVxK
	m/WLG7y0R9sArH2Zqmhlg06VU2O+mleTlDHrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gK/vWGmH3BA6jMfKlhMNTTIKRq84C9kn5YEYEcRvTw8=;
	b=rs1wD7LsCRC3N4GslFR37a0Z1GjqGo3/pxOAXIcTc2KE/rTCPn3nBlb3TMBuSJAXiN
	G9CN9KEzRcC/njAoyzA3WfsIKAlesAMSLui+smAjqg+E3g1Mk8o4livj69z5ZJY4UjYW
	7w/334ldujcsXPDQIHDOHPgClduu2dLN2qBqk92uxPB5rOQdoiew86dtYIejmmaSysVd
	GR8+8avn4KmXuR4QRigYCWCJBYJc6jzLvt93x0NchA2BbhsclHh59KkHMrcGugcNNF8B
	CHBrTeS31dBMeiJmYvg273hIZAe98gbWZGrGHF/FIeN6mRFIMhDHsiBGJs//hdG0LPXC
	KAYQ==
X-Gm-Message-State: AMCzsaUpz4EsptlJs9MeMW+kFhmlbZz+3EFC6mH99OUaGDPBiVwD7p0M
	UHzxhY+i1m4G7iTcbFGSjSRhaIvC92JCPt+Rc+nXY7QP
X-Google-Smtp-Source: AOwi7QADYusHfDnMcRiuTflD9SVej0kPyFxMW8M0PFINhxGhjhULJ680S1PVItNQX9xHppBcNQ4Ksz+Lt/ql1cvT910=
X-Received: by 10.223.147.166 with SMTP id 35mr2223791wrp.90.1507809278801;
	Thu, 12 Oct 2017 04:54:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Thu, 12 Oct 2017 04:54:18 -0700 (PDT)
In-Reply-To: <1506524205-20763-2-git-send-email-eric.auger@redhat.com>
References: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
	<1506524205-20763-2-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Oct 2017 12:54:18 +0100
Message-ID: <CAFEAcA9P51hn60vYErotTBc9m4REq=fgfp0ZN18mFtoLLbS9ZQ@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-arm] [RFC 1/3] hw/intc/arm_gicv3_its: Don't abort on
 table save/restore
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: feSWgk6RlWoL

On 27 September 2017 at 15:56, Eric Auger <eric.auger@redhat.com> wrote:
> The ITS is not properly reset at the moment. It is possible the
> GITS_BASER<n>.valid is set and the in-kernel ITS caches are not
> empty (list of devices, collections, LPIs) while data structures
> in guest RAM are invalid/inconsistent.
>
> For instance, this happens after a guest shutdown -r now or a
> system reset, if we save the state before the guest re-writes
> the ITS registers or map devices, the table save ioctl may
> produce a QEMU abort.
>
> Until there is a proper reset implemented, let's unplug the
> consistency error checking.
>
> The reset issue will be fixed in subsequent patches.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: wanghaibin <wanghaibin.wang@huawei.com>

When in particular does this cause an abort -- when we're
trying to save the state in these edge cases, or when we're
trying to restore it? What does the kernel do -- is it just
rejecting the attempt, or might it actually have done bad
things to guest memory ?

thanks
-- PMM
