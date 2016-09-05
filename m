Received: by 10.25.87.130 with SMTP id l124csp200074lfb;
        Mon, 5 Sep 2016 09:34:35 -0700 (PDT)
X-Received: by 10.55.15.82 with SMTP id z79mr24754460qkg.245.1473093275842;
        Mon, 05 Sep 2016 09:34:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b85si14977206qkb.10.2016.09.05.09.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Sep 2016 09:34:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bgwqx-0001gR-74
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 12:34:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bgwqe-0001Ta-LJ
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 12:34:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bgwqc-0003p8-F6
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 12:34:15 -0400
Received: from mail-ua0-x234.google.com ([2607:f8b0:400c:c08::234]:34554)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bgwqc-0003ox-BJ
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 12:34:14 -0400
Received: by mail-ua0-x234.google.com with SMTP id u68so10385441uau.1
	for <qemu-arm@nongnu.org>; Mon, 05 Sep 2016 09:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MFm0EcBP442eNsuikwDxzewS898Kqzq00URPlSFNMd4=;
	b=G18jX48zQVADzfZJKuu04KU/lWb/Yjw8xUS/Fmp4n9rMZDD7f0lI4dWhaZj1yuBKoL
	lgB1kngVVrTCXIA2C1bEnpAxFIzvHTrumAG7kxPaluHJd+g6kgLtELnUFtRa0u9PuU7z
	YQqtRc2HF6a01s7KT781+upJjYoW+yAcGWKGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MFm0EcBP442eNsuikwDxzewS898Kqzq00URPlSFNMd4=;
	b=YAWWXRt42ZIbgJsY4UBdAkI71WVwMawkVzYqExd+Z4mEsnPsi3d5p6R3oX+kZ81XsH
	7IqPUwEeRNyVF+whXeuUfuZAGxB0L/vKcxuS0Wzjz75+LLZScnCWBYvKnoOMM+y3IiVz
	B7tVdzXnaxrwyCjSUxjYgm5MXcZFCLo4A1wzBqYWS1sgN7jeMVTdtt0wwz03qyywmYRu
	b4qCSzPRT6K8l5EGgwwGGegzS28vm2MoXNkoRxbpmInusANspDeLBOIcqzv7Vgd138Gw
	ngDKexpjIZu+RbEgY4YucCKWh0uX0QS6DZifGQFcQqY/Ua6HAOys3VOTtop/HZxsEWrw
	JdcA==
X-Gm-Message-State: AE9vXwPq3gc9qVTidfSa74dZLiJOQUv7RqZQl1lNXDAcSmZES0Se05z3kscCIxRUDcyx/3aLVCSrjfVP4iQ5RN8T
X-Received: by 10.176.0.120 with SMTP id 111mr9792685uai.17.1473093253965;
	Mon, 05 Sep 2016 09:34:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Mon, 5 Sep 2016 09:33:53 -0700 (PDT)
In-Reply-To: <1472025743-11484-1-git-send-email-zhaoshenglong@huawei.com>
References: <1472025743-11484-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Sep 2016 17:33:53 +0100
Message-ID: <CAFEAcA9hUAzgN9dbHf1sCeaXd=5rs9Z3Ct68bqk12_qA2e63ng@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::234
Subject: Re: [Qemu-arm] [RFC PATCH 0/3] target-arm: Add cortex-a72 support
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
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iqLs6V331/Fy

On 24 August 2016 at 09:02, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> This series add cortex-a72 cpu support for target-arm.
>
> Shannon Zhao (3):
>   target-arm: cpu64: Add support for Cortex-A72
>   target-arm/kvm64: Add cortex-a72 cpu support
>   hw/arm/virt: Add cortex-a72 cpu support in machine virt

Hi; just a note that I'm dropping this from my review queue
given discussions at KVM Forum (and ongoing in email) about
how we should handle cross-CPU migration, big.LITTLE configs,
etc. If after those discussions have reached a conclusion this
patchset is still relevant, please ping me and I'll look at
it again.

thanks
-- PMM
