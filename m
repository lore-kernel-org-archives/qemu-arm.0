Received: by 10.25.208.211 with SMTP id h202csp67714lfg;
        Wed, 6 Apr 2016 10:50:58 -0700 (PDT)
X-Received: by 10.55.24.208 with SMTP id 77mr50443723qky.45.1459965058009;
        Wed, 06 Apr 2016 10:50:58 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c197si2910486qkb.66.2016.04.06.10.50.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Apr 2016 10:50:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1anrbV-0004a4-Gu
	for alex.bennee@linaro.org; Wed, 06 Apr 2016 13:50:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1anrb6-0004DK-QI
	for qemu-devel@nongnu.org; Wed, 06 Apr 2016 13:50:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1anrb3-0004FK-8k
	for qemu-devel@nongnu.org; Wed, 06 Apr 2016 13:50:32 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:50651)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1anrb2-0004FB-Ro
	for qemu-devel@nongnu.org; Wed, 06 Apr 2016 13:50:29 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 6C64A2133A
	for <qemu-devel@nongnu.org>; Wed,  6 Apr 2016 13:50:28 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute3.internal (MEProxy); Wed, 06 Apr 2016 13:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=pJfnq
	8s1qd4tNfiWpbOItOTeweE=; b=DWGbfVfI+JDbk58hipUPkASAHWBaH7rEZIVPQ
	uQVeDM+PB/bpnmDcgFh3/DFLOD/gyFwah6WEQJ3KyiWQ+yoWwBrK1EBeSmt0gzt0
	BqD3jy3vnmCucK6+KYVJ1c+9E1aMtQga9m6i537+frR5Yd3kDM+U6HqupPYav4uL
	dGSdKA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=pJfnq8s1qd4tNfiWpbOItOTeweE=; b=Q2nt3
	LrACKwbq00TxWh11Zt1ZZn8qO4u5zx7fW98rsnec9oF4qa9M7MZyeSO/vIcxDqs0
	OtPOyUj7Rj9TljvF6lZZXnVLV+mS4F5IFeAlgceHAy/mrIiEfdqvB+hZAqQ5CgcE
	zBtlx4vn+PAdCEs9p7e/PvuIfSBWT2oolPePkM=
X-Sasl-enc: bzKLuo98eZ3VxembWLsF7bJwmTgX0tuS9gLhQySw46VA 1459965028
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3026D680265;
	Wed,  6 Apr 2016 13:50:28 -0400 (EDT)
Date: Wed, 6 Apr 2016 13:50:28 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160406175027.GA23359@flamenco>
References: <1458221140-15232-1-git-send-email-zhaoshenglong@huawei.com>
	<CAFEAcA_7ww3PBQ5Mf=ax69B2i6zOx4-pDaiEUVerGG5iru-pJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_7ww3PBQ5Mf=ax69B2i6zOx4-pDaiEUVerGG5iru-pJg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.29
Cc: Wei Huang <wei@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-devel] [PATCH 0/2] Add gpio_key and use it for ARM virt
	power button
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
X-TUID: 6QsFZ7psN1lq

On Wed, Mar 23, 2016 at 16:12:46 +0000, Peter Maydell wrote:
> On 17 March 2016 at 13:25, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> > From: Shannon Zhao <shannon.zhao@linaro.org>
> >
> > There is a problem for power button that it will not work if an early
> > system_powerdown request happens before guest gpio driver loads.
> >
> > Here we add the emulation of gpio_key and use it for ARM virt power
> > button.
> 
> I tweaked the type names to be 'gpio-key' rather than 'gpio_key',
> and added a comment to briefly describe what the device does:
> 
> + * Emulate a (human) keypress -- when the key is triggered by
> + * setting the incoming gpio line, the outbound irq line is
> + * raised for 100ms before being dropped again.
> 
> Applied to target-arm.next, thanks.

I might be doing something wrong, but aarch64-softmmu @ master only works for me
after reverting 94f02c5ea94 "ARM: Virt: Use gpio_key for power button". Bisect log
appended.

This is what I get when booting aarch64 as per [1]:
$ aarch64-softmmu/qemu-system-aarch64 -machine virt -cpu cortex-a57 -machine type=virt \
 -nographic -smp 1 -m 2048 -kernel img/aarch64/aarch64-linux-3.15rc2-buildroot.img  \
--append "console=ttyAMA0"

qemu-system-aarch64: Unknown device 'gpio-key' for default sysbus
Aborted (core dumped)

Thanks,

		Emilio

[1] http://www.bennee.com/~alex/blog/2014/05/09/running-linux-in-qemus-aarch64-system-emulation-mode/

git bisect start
# good: [4829e0378dfb91d55af9dfd741bd09e8f2c4f91a] Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2016-03-18' into staging
git bisect good 4829e0378dfb91d55af9dfd741bd09e8f2c4f91a
# bad: [7acbff99c6c285b3070bf0e768d56f511e2bf346] Update version for v2.6.0-rc1 release
git bisect bad 7acbff99c6c285b3070bf0e768d56f511e2bf346
# good: [9fd3c5d556b21e0020d98d4695c84a655aa056f0] tests/test-filter-redirector: Add unit test for filter-redirector
git bisect good 9fd3c5d556b21e0020d98d4695c84a655aa056f0
# bad: [e8710c2293c0f4652090b1434603715f2d9a410f] block: m25p80: Removed unused variable
git bisect bad e8710c2293c0f4652090b1434603715f2d9a410f
# good: [5481531154cf08ed53623a0184f7677a9b98d083] raw: Support BDRV_REQ_FUA
git bisect good 5481531154cf08ed53623a0184f7677a9b98d083
# good: [c98d3d79ee387ea6e8fb091299f8562b20022f10] target-mips: use CP0_CHECK for gen_m{f|t}hc0
git bisect good c98d3d79ee387ea6e8fb091299f8562b20022f10
# good: [f4e732a0a773c4e44c2c183a5d63cd850ffb57d1] iotests: Test qemu-img convert -S 0 behavior
git bisect good f4e732a0a773c4e44c2c183a5d63cd850ffb57d1
# good: [69bc7f5029db5ea55359f7905e9829777ae5a34f] Merge remote-tracking branch 'remotes/berrange/tags/pull-qcrypto-2016-03-30-1' into staging
git bisect good 69bc7f5029db5ea55359f7905e9829777ae5a34f
# good: [489ef4c810033e63af570c8a430af8b9858bfa5f] Merge remote-tracking branch 'remotes/lalrae/tags/mips-20160329-2' into staging
git bisect good 489ef4c810033e63af570c8a430af8b9858bfa5f
# bad: [94f02c5ea9430be935088b2574f72f2dcf902997] ARM: Virt: Use gpio_key for power button
git bisect bad 94f02c5ea9430be935088b2574f72f2dcf902997
# good: [e5a8152c9bfd3d40c37711ba5b704f277cbc0c54] hw/gpio: Add the emulation of gpio_key
git bisect good e5a8152c9bfd3d40c37711ba5b704f277cbc0c54
# first bad commit: [94f02c5ea9430be935088b2574f72f2dcf902997] ARM: Virt: Use gpio_key for power button

