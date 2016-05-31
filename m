Received: by 10.25.27.66 with SMTP id b63csp1943816lfb;
        Tue, 31 May 2016 02:36:25 -0700 (PDT)
X-Received: by 10.140.148.209 with SMTP id 200mr30090191qhu.60.1464687385732;
        Tue, 31 May 2016 02:36:25 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p16si155515qtc.71.2016.05.31.02.36.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 May 2016 02:36:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7g65-0007Il-4n
	for alex.bennee@linaro.org; Tue, 31 May 2016 05:36:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b7g1F-0003TE-5w
	for qemu-devel@nongnu.org; Tue, 31 May 2016 05:31:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b7g1D-0008W9-7y
	for qemu-devel@nongnu.org; Tue, 31 May 2016 05:31:24 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:35203)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b7g1C-0008Vx-Th
	for qemu-devel@nongnu.org; Tue, 31 May 2016 05:31:23 -0400
Received: by mail-vk0-x232.google.com with SMTP id d127so91475734vkh.2
	for <qemu-devel@nongnu.org>; Tue, 31 May 2016 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UgLPK9VZxXAjwOX/z8ztETxgSTjdEtjQH/O4/yynK5Y=;
	b=cKmK/EdgEmEIfFK8Vm7j2UdBF2KSabshPyF+10gm+370iXT/Hu/HJIZC2o9Y57Crub
	9Fsg7sqRjfc84TPuDtCBM/sPZZajycWzoo1rWjeX+/j488ZeOEpw2a8tw0jnNh+WR7zt
	TpDThuKkEwTl9jwzhzDx81zKfb5z5UYE7z+EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UgLPK9VZxXAjwOX/z8ztETxgSTjdEtjQH/O4/yynK5Y=;
	b=ZRd/gp+ZD6Als0d+BS3cGBPuSMpQSTi98xedNL3h4mASrW5xeGruQtVeZIPQyvY24s
	rqpknlvGjhbaTU0GHoXMw+q5unjTwKIwLU/QkbRDm+g7iFcgWn/worAYLroFaSeqmBYU
	8zSmYa0mlJ2Zh6uEs5TiqVo2sIcoKpa0BVLcofXYeHM1+YENg0l4nLlixUlbFlEsba56
	orYPMFbbK6ibnx0IIwecW3ZYBpic/7owTw6k8ERuWq1Ve/McZ3zz1qjJjL/4rF08J65o
	mrKz70st55q01rjozfnzw3KRg9XGqJYKE5vJTZnrATiv9s/6zo9eg4h5TiYt2k4yB6KG
	rlng==
X-Gm-Message-State: ALyK8tKIqoVHt61InkqFHF9LHtQYJTxuVSZc9Dy75HDdo548Hs60z9FdcKsWcs0DV+TuM3I1DEPvqdrmKz4OzPGL
X-Received: by 10.31.62.70 with SMTP id l67mr16931134vka.82.1464687082334;
	Tue, 31 May 2016 02:31:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Tue, 31 May 2016 02:31:02 -0700 (PDT)
In-Reply-To: <CALicx6uv8hr_HguPa_gXbt0r5Zc4spCCQ5_QyYe3j_72Vyq1mQ@mail.gmail.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-2-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_RDSe=exvgo-yF57bQDk2=sx3kLnvKiKkXHPJHCTGE+w@mail.gmail.com>
	<CALicx6u3yCdFSUuLyQgt7yP08RSwXP=k0w3WKmeTRfn7jS6vRA@mail.gmail.com>
	<CAFEAcA8sCNFY7dF2MSZcELgEfJg9MhNERFAY2ZJrou=e1zKM5w@mail.gmail.com>
	<CALicx6u_YinmXd4xCZKsRVtWcnSUHqoe_7Tc1TOG7ai3cg_rYQ@mail.gmail.com>
	<CALicx6uv8hr_HguPa_gXbt0r5Zc4spCCQ5_QyYe3j_72Vyq1mQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2016 10:31:02 +0100
Message-ID: <CAFEAcA-o6h1zV3k37Vdb_M4JVQAY4pRD-fjPBz=sUk6tK-WDbw@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-devel] [RFC PATCH v1 1/2] target-arm: Update page size
 for aarch64
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
Cc: Vijaya Kumar K <vijayak@caviumnetworks.com>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijay <vijayak@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TKtxkvkDBZcF

On 31 May 2016 at 10:04, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Wed, Apr 6, 2016 at 8:31 PM, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>> On Mon, Apr 4, 2016 at 10:14 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> If you want to avoid defining TARGET_PAGE_SIZE to the
>>> lowest-common-denominator 1K, then yes, you'd need to
>>> choose it at runtime. That could be painful to implement.

> The L1 page table size, L1 shift are dependent on TARGET_PAGE_BITS(page size).
> as shown in snippet code below from translate-all.c

Yes, that's why I said "painful to implement" :-)

> How about adding CONFIG_PAGE_SIZE option to configure?.

I don't want this to be a configure option, because QEMU
should just work for everybody. Otherwise we have some QEMU
binaries which silently don't implement the architecture/CPU
that they ought to.

thanks
-- PMM
