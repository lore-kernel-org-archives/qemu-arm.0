Received: by 10.25.30.65 with SMTP id e62csp823402lfe;
        Tue, 24 May 2016 09:29:17 -0700 (PDT)
X-Received: by 10.55.119.66 with SMTP id s63mr4305747qkc.169.1464107357552;
        Tue, 24 May 2016 09:29:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l23si3196666qhc.105.2016.05.24.09.29.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 09:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5FCm-0002oZ-Re
	for alex.bennee@linaro.org; Tue, 24 May 2016 12:29:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FCF-0002Sy-Ns
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:28:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FCD-0003ry-R8
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:28:42 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:34450)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b5FCD-0003rs-Mk
	for qemu-arm@nongnu.org; Tue, 24 May 2016 12:28:41 -0400
Received: by mail-vk0-x22d.google.com with SMTP id c189so28995250vkb.1
	for <qemu-arm@nongnu.org>; Tue, 24 May 2016 09:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aJmaj7G/OqDHSx243CLBK30RHqiqILsYfwIF1ErTiXQ=;
	b=XsWAJ1FE2hH5+7qilLVefXxMTt09TIi8DxdzhF5sNqZNYFKL9c8g15EgQg+fhu4/WN
	g084e7RM8bokXR34blan+o72IGJwyJlmv/UV+qXlnBuT5Bw6NtuZJPtShvRi+S8iqoaN
	YGFgglawVWzJz6Ls09No8AccnFg1FjFaFSOu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aJmaj7G/OqDHSx243CLBK30RHqiqILsYfwIF1ErTiXQ=;
	b=KJ3RjjAobdPzl+tHW2s7PdeV4LLRMzDCzk8Li0kDZn5K1elmEV1g28Cyg4fjYbk2jl
	QJkq6JmRq6G4vdW7HZCtlIVhvSskGqoYYHMGFSOfjCmXi/5GfddRaalAPI5+ZdUu5bK3
	IvZ9R7mUmgM1hs4Q9x7UogbdB5miNRA29JLmAiZjeYOGhC9SynnxZOWvHUX6Yj07BcUV
	XZ34Sp66SX/W/BbX5GcbErpB9UK6qJzuuN0XA7mJ6iVabmp3Zc8snoxYu1eihHOtO1Ug
	7sIu59iAcQsn6cbSwfhxO6ePvQJrmCpoOsFOJP9RKKt9ZInWzRo1BKNnv7TNEcUhkXIT
	kavQ==
X-Gm-Message-State: ALyK8tLHLmW4sW96hPsbi4Dn0dGgLuBaCT8vzwsDgdAtr64cisS+s/6Krt616MFZ3zVJ8b/PLexOAdFNRyBQsAUb
X-Received: by 10.31.62.70 with SMTP id l67mr2914575vka.82.1464107321213; Tue,
	24 May 2016 09:28:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Tue, 24 May 2016 09:28:21 -0700 (PDT)
In-Reply-To: <1463698459-31312-5-git-send-email-edgar.iglesias@gmail.com>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
	<1463698459-31312-5-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 May 2016 17:28:21 +0100
Message-ID: <CAFEAcA8M_oxFnDMH4B6mAPDqZNr2LYorP9dZk2hEg-tPqHWbSQ@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-arm] [PATCH v1 4/5] xlnx-zynqmp: Delay realization of GIC
 until post CPU realization
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YEw230MG355H

On 19 May 2016 at 23:54, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Delay the realization of the GIC until after CPUs are
> realized. This is needed for KVM as the in-kernel GIC
> model will fail if it is realized with no available CPUs.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
