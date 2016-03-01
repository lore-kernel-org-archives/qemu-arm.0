Received: by 10.25.208.211 with SMTP id h202csp1725301lfg;
        Tue, 1 Mar 2016 08:45:56 -0800 (PST)
X-Received: by 10.55.82.195 with SMTP id g186mr27167552qkb.47.1456850755928;
        Tue, 01 Mar 2016 08:45:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t39si31614020qgd.0.2016.03.01.08.45.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 08:45:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:50915 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aanQp-0000Dw-GH
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 11:45:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aanQF-00084n-Ii
	for qemu-devel@nongnu.org; Tue, 01 Mar 2016 11:45:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aanQE-00047b-QI
	for qemu-devel@nongnu.org; Tue, 01 Mar 2016 11:45:19 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:36319)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aanQD-00046H-Kf
	for qemu-devel@nongnu.org; Tue, 01 Mar 2016 11:45:18 -0500
Received: by mail-vk0-x22a.google.com with SMTP id c3so173503834vkb.3
	for <qemu-devel@nongnu.org>; Tue, 01 Mar 2016 08:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=roVM9yZfySUlUzgrImf9GrHgfq4JEvmgUUGMOTkoXo0=;
	b=FQO8ya8zWhoVj/iMQf5lugI1J7WXxP/jNDuocdw3GzaNi13Bvs1oq2DdmYWzb/jqq5
	xkDLiLsivJIiFlNZvtI02CuuwxYhyshFBMc0IYRcP4SCgC885awEI9gNsmilhsH5SV/G
	1vQLyizlMjPfINysB4SzBxainatmW3d1v/wS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=roVM9yZfySUlUzgrImf9GrHgfq4JEvmgUUGMOTkoXo0=;
	b=KJ7H3QAbxRAJj8J/MxfaHsdK4/5t4muYQAzyzCDOv+t4Tb1ZXN4BCHZ70TmKTjykWs
	XsYbSphYHFNZNU8GrxNWruPGD0BhkJ28DDafuuXWb8K+7HR/llg2Q0Q9DtOb1do5E8pr
	vSGcSSGQh647MeS9FiUv/bw8T1vaPplCm3UF53spZpRQOJMNNefdSUXmf0hdnSLNfqYg
	aPXhcGEs8Kh/5hmPxr3zXwk2jnEJvMDaCoSYaQrAoJufEzWmN9sOlkccBbEmW1tJapiQ
	wZJKZCXcDum5ZRBTeAuCkHmIJwLiWhZumOH1njy4C+nd4FmYG8RDS7iANmJ3j/xOeIP5
	zcAA==
X-Gm-Message-State: AD7BkJK788YosjY+SDwUVUmG7PBNcOkxaimItj/lcecZS3a/Pad6m3VioG1IPnKzo2VHoR+0SZ1SSrtv8w8UdQuR
X-Received: by 10.31.1.6 with SMTP id 6mr13975903vkb.139.1456850717190; Tue,
	01 Mar 2016 08:45:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 1 Mar 2016 08:44:57 -0800 (PST)
In-Reply-To: <1456849517-26240-1-git-send-email-peter.maydell@linaro.org>
References: <1456849517-26240-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2016 16:44:57 +0000
Message-ID: <CAFEAcA_iVjMwXGy7GO+fJwD4=LvMJEsaisOOXbY=XmSc-3oLPw@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm <qemu-arm@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] linux-user: x86_64: Don't use
	16-bit UIDs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HdrS7Dtfrzza

On 1 March 2016 at 16:25, Peter Maydell <peter.maydell@linaro.org> wrote:
> The 64-bit x86 syscall ABI uses 32-bit UIDs; only define
> USE_UID16 for 32-bit x86.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Obviously I only cc'd qemu-arm on this (and the other UID patches)
because my brain was on autopilot...

-- PMM
