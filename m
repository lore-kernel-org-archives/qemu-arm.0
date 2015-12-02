Received: by 10.182.158.201 with SMTP id ww9csp3375545obb;
        Wed, 2 Dec 2015 14:49:01 -0800 (PST)
X-Received: by 10.141.4.67 with SMTP id g64mr7778691qhd.34.1449096541096;
        Wed, 02 Dec 2015 14:49:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a3si5802223qha.10.2015.12.02.14.49.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 14:49:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60639 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4GCq-0000r7-PX
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 17:49:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4GCo-0000pr-Nw
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 17:48:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4GCk-0000MP-JS
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 17:48:58 -0500
Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c]:34110)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4GCk-0000MK-EK; Wed, 02 Dec 2015 17:48:54 -0500
Received: by qkfo3 with SMTP id o3so23025989qkf.1;
	Wed, 02 Dec 2015 14:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=0E2OA5Bf4ik53/MNJNpPCqBabLHNFefpV03eyY3/DCw=;
	b=gaULbXpp87/ZIurbd1sYCbLTxhN7EJQC4JwvkrtJMeiRGs+RxC+VWOHngukfsF8ooU
	pbofhIYWAGUkEYB/Szhu/LWtgIx7Sj8JQgWJxm6obLWKsPgKRIihNCWX5jcYm46EGbBU
	JUCvS5D9HeNhEsbpxHRMUF93iQkE+D1AU/CMv0fSYJcOfDicvMYPa28E0vyUGQ4hLw6u
	AJXt2S5Dw4UDRZg/t75iwADrtyYYsLAq8IQb6RjZgQuBsCJj0E1/Na7SgB+9Cdt3OV01
	frQOB3NvTHWNu31ua8FdCwItFMrkwZZeLuzVMhuG2Ne0PPvwYn+iir0oor57Rq/jH2+z
	I8bQ==
X-Received: by 10.55.79.207 with SMTP id d198mr6830241qkb.49.1449096533692;
	Wed, 02 Dec 2015 14:48:53 -0800 (PST)
Received: from [10.142.1.2] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	31sm2131144qgy.13.2015.12.02.14.48.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Dec 2015 14:48:53 -0800 (PST)
Message-ID: <565F7554.6010501@gmail.com>
Date: Wed, 02 Dec 2015 17:48:52 -0500
From: Michael Davidsaver <mdavidsaver@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA-WerwObfwekpnRbfpcsUdkvV3Gqxr+krfiSJAFP-CxAw@mail.gmail.com>
	<CAFEAcA-_g4BD-A6qka5iKFNufLO-=nzGjDHHEdf6opZ_afGPNA@mail.gmail.com>
In-Reply-To: <CAFEAcA-_g4BD-A6qka5iKFNufLO-=nzGjDHHEdf6opZ_afGPNA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22c
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 00/18] Fix exception handling and msr/mrs
	access
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uHNOjuhr2mVC

On 11/20/2015 08:59 AM, Peter Maydell wrote:
> I think I've now done that at least for the earlier patches.
> There are probably some other finer details that I'll get to
> in a later round of patch review but hopefully you have enough
> to do some of the fixes and restructuring of this patchset for v2

Thanks for the comments.  I'll be addressing them individually and follow that with another patch set.
