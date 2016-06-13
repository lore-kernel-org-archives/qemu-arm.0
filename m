Received: by 10.25.85.209 with SMTP id j200csp1116974lfb;
        Mon, 13 Jun 2016 03:12:46 -0700 (PDT)
X-Received: by 10.55.70.66 with SMTP id t63mr10777202qka.162.1465812765770;
        Mon, 13 Jun 2016 03:12:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 23si12205594qtu.73.2016.06.13.03.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 03:12:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCOrN-00040s-44
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 06:12:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCOqE-0003A2-J9
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:11:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCOq0-0000WL-M9
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:11:34 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:36572)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCOpz-0000Vz-ED
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 06:11:20 -0400
Received: by mail-vk0-x22b.google.com with SMTP id u64so60961163vkf.3
	for <qemu-arm@nongnu.org>; Mon, 13 Jun 2016 03:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1F/NNlPmdSEnkqr4tWCWEYI4nkOSfK7/Cw4j/9H9+h4=;
	b=CjtlJ3WXgLPYtD6PATABC4OmvuQuZBrAf1kCPt5rbuX+YLceZSyMR0mV6xT2xeX2cU
	oCc/znEoa4K+bEMdNKxkdGrh+WSe3w3sNq+fMDHStRSV+N8+fR3244eZKs8PXfs8U/51
	vc31+ANOx0DxjCAG0IltpyS30NVEUNVMsRKww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1F/NNlPmdSEnkqr4tWCWEYI4nkOSfK7/Cw4j/9H9+h4=;
	b=m2jKpfLMqJkVX/q/a5L4d1/jn9YEA3v1yTCvPpjbRyxzlKb3vKnI5TKGv3DNXcukOC
	oP4sFsDvPf1nmbArdUtrg1UKmeEvF5Q4pXi2NFbhUvLqy0U+L0jW2uy5ZrclE+a75dmk
	obUa2RaVm/GO4xA6+/ac/slblj+roXjrPRJCVoFgIbbJ5fO105Q78nr+L6foXxHdWjM6
	A+bAj2QSlCHng6mAk6nc5xkWVIlHoPxft7UtnLrksxEH+uaJIlDwzfwOQE8T61wBebiy
	3k9KaYQt3hGlZQqkBoQdxmJ09wcH4IJtcemIFTDcKwkDvXcAWfBKRmfnAkd98YoojFeh
	vTBQ==
X-Gm-Message-State: ALyK8tI5tPgYoLbR2uECi5kyIYtOyGI5SOKk4Hj5xAqZ14kHZlUp4wlAnkAw6VXfhcy/cWagthaTBNR0D5QnXhhc
X-Received: by 10.176.1.238 with SMTP id 101mr3857245ual.119.1465812678895;
	Mon, 13 Jun 2016 03:11:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Mon, 13 Jun 2016 03:10:59 -0700 (PDT)
In-Reply-To: <CAFEAcA8+qWep8E3+k30n1gTUexoTrqipg=bnxS5yYPNvfFpTYw@mail.gmail.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
	<1465808915-4887-5-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA8+qWep8E3+k30n1gTUexoTrqipg=bnxS5yYPNvfFpTYw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jun 2016 11:10:59 +0100
Message-ID: <CAFEAcA_dBDhUEZr+mLPJkiiMRyjqUuXMaaYfZX3PUwZdKFk9uA@mail.gmail.com>
To: Vijaya Kumar K <vijayak@caviumnetworks.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [RFC PATCH v1 4/4] target-arm: Compute page size
 based on ARM target cpu type
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
Cc: Vijay Kilari <vijay.kilari@gmail.com>, Juan Quintela <quintela@redhat.com>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Vijaya Kumar K <vijayak@cavium.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 47M+3NUkJjN3

On 13 June 2016 at 10:43, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 13 June 2016 at 10:08,  <vijayak@caviumnetworks.com> wrote:
>> +/*
>> + * Holds TARGET_AARCH_64_PAGE_BITS or TARGET_ARM_PAGE_BITS
>> + * based on the the cpu type emulated at runtime.
>> + */
>> +static uint32_t target_page_bits;
>
> The CPU page size is not specific to the 'virt' board, so this
> is the wrong place to do this. You should identify the
> page size in arm_cpu_realizefn() based on the set of feature
> bits the CPU has: anything with ARM_FEATURE_V7 has a 4K page
> table (this includes a lot of 32-bit CPUs).

Actually that should be "with ARM_FEATURE_V7 and not
ARM_FEATURE_MPU", or we'll break the PMSA code.

Note that you'll also need to handle systems where the
different CPUs in it disagree about the preferred target
page size -- the xlnx-ep108 board can have both
Cortex-A53 (prefers 4K) and Cortex-R5 (prefers 1K) CPUs in it.
"Use the smallest value required by any CPU on the board"
is probably the best approach.

thanks
-- PMM
