Received: by 10.223.172.38 with SMTP id v35csp3343817wrc;
        Fri, 22 Sep 2017 10:20:21 -0700 (PDT)
X-Received: by 10.55.178.68 with SMTP id b65mr8269920qkf.155.1506100821465;
        Fri, 22 Sep 2017 10:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506100821; cv=none;
        d=google.com; s=arc-20160816;
        b=bUeDSDY6u6g1NLNhw8F1hyRYgRmbIvK//oJ2bYPrBPHYQr+mMgwCCIUtR++o12R+7c
         kFX7L58sCAUuzTxj5f5bdqdzb4uGE54wNIJOpZQHYODIvcNsoKCqyQdMV/JBgexidSMj
         Nn6ZBvGMGcSgAb2t7vYoFvHelsMe71n8GKUmovLidFw1ZptgIBMggV0xnMbszBAet90T
         ONb9/bBatx9iajHtfyZOnOf22TfscTL/GjMkt9fA1++5eJXiAiINY6p5ix5bh+AJ/NJk
         bxV4fk0yc2gOCP5wow+vhFl/JpkCbetau/4+CgJt8rtvxMFLHvBax/SfEwwAUgzkVCm9
         KVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=HgwfLMc/hen0VFRLqkEZP5MkE/GO7wFKtZXRyIFt4wg=;
        b=J3LiFAg9K0j+S2nmD+LXGO+BdWKUBVRFFQnQUStI89ydKwFsLBc5vB4YuZ5HnJpISa
         i1E9meuUcp03EL1Z6uvvi2Degw4VrJBxt2CrfwI/IYG6v1np7ruTBVvynpn9NB4LR/K1
         ek2thmnK8MmWp8muM7sZq9tZdwQ3f31qtIpvTMNXwertel+QUA8ZU4uFiCXV4ToUCOqL
         z0bqWfdsDakGo15GVtyOJW9+M3TcShBG2ZnSkQ5xRQsIOM6c/khIOQfDTuaQdrGftZCg
         5Fse4M2EcTOFMrjx9NUfD683RPe1pk4QaPw3XQ/pMrlZ1AR+BgVIuAhM31U+0taGy4Jo
         FmSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jIyLrHNG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si31609qtj.30.2017.09.22.10.20.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 10:20:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jIyLrHNG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvRch-0000wL-8X
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 13:20:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dvRcO-0000uP-T7
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 13:20:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dvRcN-00077l-T2
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 13:20:00 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:37000)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dvRcN-00077X-Mf; Fri, 22 Sep 2017 13:19:59 -0400
Received: by mail-wr0-x242.google.com with SMTP id u48so961299wrf.4;
	Fri, 22 Sep 2017 10:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=HgwfLMc/hen0VFRLqkEZP5MkE/GO7wFKtZXRyIFt4wg=;
	b=jIyLrHNG0lFpWkzFqb0h9EkAEBtuxRYv6obcRqswENptOGoO6kGr3lIvJr8kygX5J9
	be3rEX5yE3gC/JzFdoFtov/l1CiCQnocBvLRLBe1eZxDAyTNLohQREeCbal9zv04G7wC
	WiqhzmcXJnNw5w7CCuVk9Z9ex1zn8bZt+OSCpyUzRqFF61p44lruODkhU7Y0i+Z9u49u
	MNApsJzkB6FtzL7mR6NiaaClibixHhs0shAfJqGgIABnJPc0uZGJWE2im1WwCFiOvr4h
	T9N16d7q03h9IhfQHOPW++nswcrvXWa5+DfOzyl3UCI7uw5/NxwqePxexmEEzEqTf1kD
	0ODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=HgwfLMc/hen0VFRLqkEZP5MkE/GO7wFKtZXRyIFt4wg=;
	b=jFsPZDOMn7DcfIlHjGtb3lYMyGxCFPkFSOnOh/Rno7insoE5/VEOTC6qb6HRVEsmoC
	z/a174Pno+tnmR9xeiDbXtUjXW3CUaVesWWKsDAxPwDVUZTNh+UXfI0MDdU0JsqjIf4/
	GFAdeHTPuijKeDy9mYsM6evvU9X4B7KzHnS7gJEcvYWD9+7kBWwUg7oRi/OenHqfkwRK
	0eSp6khm47civmwIISZNAugs1JVmhXGk4vsr1k3mi75qkgOKYWCzahCVYddudK1YWWVk
	a7Jsx1o00RbG2Kfsosds+Ki1T/FC6DYIy8TfMJmxlWw2+ZRUdtjbF1WSityAIq8g18ZN
	SQYw==
X-Gm-Message-State: AHPjjUhu1/gxsHup+ZxdTPSPadlaHYYJQJZ0zzrEkSUU7Lp7SCfQGcxn
	vStanPybYd+4Q3uiHfzXsRQXGIWyknjfUCu/QY4=
X-Google-Smtp-Source: AOwi7QDW/IG66N3ixY298yTbNQBkN5l5gryXgJsSuhyhR/h8pkjX4M9fne4Qts8xpDduElVtioybH2Dn9pHesMP2HVQ=
X-Received: by 10.223.169.143 with SMTP id b15mr5910215wrd.127.1506100798705; 
	Fri, 22 Sep 2017 10:19:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Fri, 22 Sep 2017 10:19:28 -0700 (PDT)
In-Reply-To: <20170922171323.10348-1-f4bug@amsat.org>
References: <20170922171323.10348-1-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 22 Sep 2017 10:19:28 -0700
X-Google-Sender-Auth: zuRzaNbAtb-C_gEbKJjDrAIx1IA
Message-ID: <CAKmqyKPQ2bKdQ9X=TDsbXnLtC3vpqKUPMRfM8CAsgOjb-4hGHQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 0/7] Generalize MDIO framework
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Grant Likely <grant.likely@arm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0CoCey2DUW/a

On Fri, Sep 22, 2017 at 10:13 AM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Hi,
>
> I have a follow up series using multiples PHY on the MDIO bus based on th=
is
> series.

I haven't looked at this yet, but it looks interesting.

We actually have this concept merged in our tree and it works pretty
well. You can see it here:
https://github.com/Xilinx/qemu/tree/master/hw/mdio

Thanks,
Alistair

>
> Regards,
>
> Phil.
>
> Grant's previous work:
> http://lists.nongnu.org/archive/html/qemu-devel/2013-02/msg00257.html
>
> "There is more work to be done, particularly in moving to the common GPIO=
 api,
>  but that work can be done as a follow on patch series."
>
> Grant Likely (7):
>   hw/mdio: Generalize etraxfs MDIO bitbanging emulation
>   hw/mdio: Add PHY register definition
>   hw/mdio: Generalize phy initialization routine
>   hw/mdio: Mask out read-only bits.
>   hw/mdio: Refactor bitbanging state machine
>   hw/mdio: Add VMState support
>   hw/mdio: Use bitbang core for smc91c111 network device
>
>  include/hw/net/mdio.h   | 124 +++++++++++++++++++++
>  hw/net/etraxfs_eth.c    | 291 +-----------------------------------------=
------
>  hw/net/mdio.c           | 280 ++++++++++++++++++++++++++++++++++++++++++=
++++
>  hw/net/smc91c111.c      |  27 ++++-
>  hw/net/xilinx_axienet.c | 189 +------------------------------
>  hw/net/Makefile.objs    |   2 +
>  6 files changed, 438 insertions(+), 475 deletions(-)
>  create mode 100644 include/hw/net/mdio.h
>  create mode 100644 hw/net/mdio.c
>
> --
> 2.14.1
>
>
