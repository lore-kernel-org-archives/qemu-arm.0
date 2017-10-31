Received: by 10.223.161.27 with SMTP id o27csp3951825wro;
        Tue, 31 Oct 2017 10:10:59 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SeWL8tNl9PaDSjjX5XxbvGeCSx53fBfisG4cpEPoXqfBI1cOPLxz9+sKQ7uOcdWTRgBxLL
X-Received: by 10.37.239.74 with SMTP id w10mr1758130ybm.101.1509469859346;
        Tue, 31 Oct 2017 10:10:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509469859; cv=none;
        d=google.com; s=arc-20160816;
        b=FXB85jH1azRiJbi/eMD3yKSxtI6pwuJJ5TiuzTBzVNHrk6z9FIh76sW52+rObe40qm
         vEEdyHt/6k5KbRWMAVhvqhWepdX2GrKMXfUyW3G/Pp0cUUs+eGO5IxqB/TJtOIAEF117
         WHTW+LJxDboHyEbH3E0mXscuO5GokyZ1VlmOC51bqQw9JjxamxJU0fy+KvCDVMufkKSV
         WOtyYzqXfmcDPokqyhjvVIGpnvvQ3Ntefv6VGwmzBijdtaktFrVG23qnSeJr8GVpu5Qu
         /q5FJxCUkMgkJkOl1aghsxGiPieQKQesUVd0qmgadF6GidXlBuAU4D7KU606LUc0ud8h
         8KNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bgSFWeygu4YKPme8Vl2oZ8I1iARiGJ+yoA6MznwmA18=;
        b=sbqF1lMlfvAMdmEEkj+UYnP6cntkrmTt5rkQDJyctuwH6Sy3vfzyDIsH0+Lv14LFFz
         7wl9QGraOR7YUIbyl+L9VWKgB5z2rkUKvdhIiGCIz8OiCPDK5mJvisesmgc3VRN/FoIT
         zG/myanu112pIl47zAAMV8aapfpdqft4JhZKQF2XHP2paydjsZYGEZNeyiBpApR3W2vi
         KDZbHPP/VDUfQ+992aKVZXFDkZaJkl1JD7oMdd2XJ/mHxgnIQgrwBFWvudh7SRdC9SDE
         iA5DCpPkZFyN/SVRLvKib9Y6SnePnVe/wUwadNcHy6wXQ4KG8t0wBrnu9Dr8I5oEjX/F
         mRCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PPpu9e0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d12si231600ybm.221.2017.10.31.10.10.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 10:10:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PPpu9e0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9a42-0007JT-QB
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 13:10:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9a3t-0007IS-U3
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 13:10:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9a3p-0007m8-OU
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 13:10:49 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:53577)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e9a3p-0007kq-8A
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 13:10:45 -0400
Received: by mail-wm0-x22c.google.com with SMTP id r196so229325wmf.2
	for <qemu-arm@nongnu.org>; Tue, 31 Oct 2017 10:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bgSFWeygu4YKPme8Vl2oZ8I1iARiGJ+yoA6MznwmA18=;
	b=PPpu9e0U75yqu5A3fqSAGvd0P1ShSKAifJvqQiKfKYX+11y2EOZrT0XgoljF6PsYxt
	CrJ7tFglFFwPnMvoVI/LtdfuX9YxcUmrMO1qeP5lVF/HKvxN1v2WHUrNcw4GfqUUwEgm
	wERcz2I/v5/KeeAxlFiax/kD3DqUCQmHFDqKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bgSFWeygu4YKPme8Vl2oZ8I1iARiGJ+yoA6MznwmA18=;
	b=fI+9fZ+kQvq8YRU8JXDimqpaX8uetFpqaUTpMRQI/QugthAF1pSJFITJTVWlxMR3Id
	pzT1KQYqojW19FZxgd4gdkTCroHQXXntS4SiNkG6Cy9RK7ecR/bRErz9VgQ7jfuvyJL7
	NTC+ahz12gH00DIA+MLvZ7FU4KvxJErROGkuXo0Boqz6JZaMiDVCuAhMEeqBctnRX33m
	i/Wkc9i37RIXc5rExZvj14jw+jHKmda3QiZM9Ec+TjROI0wlanPoGURt6NG67sDShKUp
	LaUpyrj3MbLQL9xlIG78llqQSkDwEVpZA8dDluXKuKMwbv9yrwLttt9s9hVHy/5Xb1Zq
	ZeOA==
X-Gm-Message-State: AMCzsaVIEHy4Pk7Z8gckJbpY8qE3bBGDCMhMKbIXy+UjZLjxscT4OWJ9
	ozHvDRRTn6D27Q2IBPC3ZluY3XHIG9aWAn7fIc2VfQ==
X-Received: by 10.28.10.147 with SMTP id 141mr2257084wmk.40.1509469844120;
	Tue, 31 Oct 2017 10:10:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 31 Oct 2017 10:10:23 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1710310959490.13766@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710171708130.27209@sstabellini-ThinkPad-X260>
	<CAFEAcA9zXAmNPL8TsLKSPbm8Er_KLK8Ubwth6=nL6WD87OmBQw@mail.gmail.com>
	<CAFEAcA8jwN81ZBCLA8HW=q5GAWKmZ=kAZAP9vGNN8RYkzYe=Pw@mail.gmail.com>
	<alpine.DEB.2.10.1710310959490.13766@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2017 17:10:23 +0000
Message-ID: <CAFEAcA_8cimWtic=2OdvCmAN-mJ5MGGnVzDGYA5VgXGJG-fKhw@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-arm] [PATCH] aarch64: advertise the GIC system register
 interface
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
Cc: julien.grall@arm.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PRcB0wEvA2bv

On 31 October 2017 at 17:01, Stefano Stabellini <sstabellini@kernel.org> wrote:
> Fixing QEMU is harder than I expected. Would it be possible to update
> id_aa64pfr0 at CPU reset time? Like cpu->id_aa64pfr0 |= 0x01000000; ?

At that point we've already called register_cp_regs_for_features(),
which is where we read cpu->id_aa64pfr0 when we're creating the
cpreg. So if you change it after that it's too late. But that
function is called at CPU realize time, which is before we've
created the GIC object...

thanks
-- PMM
