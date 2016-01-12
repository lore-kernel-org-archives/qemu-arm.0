Received: by 10.25.159.19 with SMTP id i19csp574826lfe;
        Tue, 12 Jan 2016 07:31:29 -0800 (PST)
X-Received: by 10.140.167.135 with SMTP id n129mr39227655qhn.73.1452612689314;
        Tue, 12 Jan 2016 07:31:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q17si8142151qha.41.2016.01.12.07.31.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jan 2016 07:31:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:60924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJ0uu-0008HP-Ki
	for alex.bennee@linaro.org; Tue, 12 Jan 2016 10:31:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aJ0uY-0007ls-Ug
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 10:31:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aJ0uS-00007C-Vi
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 10:31:06 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35571)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aJ0uS-00006w-RP
	for qemu-arm@nongnu.org; Tue, 12 Jan 2016 10:31:00 -0500
Received: by mail-vk0-x236.google.com with SMTP id k1so244658455vkb.2
	for <qemu-arm@nongnu.org>; Tue, 12 Jan 2016 07:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LaT7PHP0yHLoZ89lFaASa9OBJabvoF9N67TGqFzpvqQ=;
	b=e4CiLmzHQCVkqtPflbGgXAj/uitYv9frE7rsUKGPEsotXO6dQO3LdBqU3wBqjyg/Zl
	duvqKrpJx7NVdLS0y2jUfUvhNBjJDEm6eEEzQ7mHLFpCE8+3/VGH+PXoksZfIwkhoaBy
	X8mmDr1CPqWtB9bV+4A25UslyLtt4+0Gd1nZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LaT7PHP0yHLoZ89lFaASa9OBJabvoF9N67TGqFzpvqQ=;
	b=A5eLE/mjgjkGh4GgnIl82VzwumkQ9xqHzX34/L8Av8CH8pVExi7Qmz2BD/2z718ZK/
	4OAsff+WyZyA7CRtdtHIK49nUz4DBRjsoJdlREln2MNOcYJcCQhk4WW88YVI7/ko2g8u
	MOILMU2k/ULWzFxiffFzAgrcLjiIzIlVcC7beVsHbieucQf25LEWD4fuolmOZu7jufHu
	ypb0bWHTm4fSDeIDv19kM0AciTtHtIn3Tbx5Ng1UAsZJSxbC9vlW7DnqgJcdNg+qtjhi
	wwEaQz3Ir8tKQg9eSTb7JuyhRFAD825dkBB3w4NMS/Ce+zYKtXS/vWgNVptS2sTIxNHA
	L9wA==
X-Gm-Message-State: ALoCoQksyjJjcgVL3UD3GLhjBgT5cPGc2as8ZYi9EngFcNQe4mLQ/a+gyiEEobzs/3ckACluYnHNe7pK9M35e/+WmHBmwq31ch34Xq7Ec2SP6KVYLvaSrAc=
X-Received: by 10.31.52.147 with SMTP id b141mr85236722vka.82.1452612659171;
	Tue, 12 Jan 2016 07:30:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 12 Jan 2016 07:30:39 -0800 (PST)
In-Reply-To: <1452612274-30218-1-git-send-email-shannon.zhao@linaro.org>
References: <1452612274-30218-1-git-send-email-shannon.zhao@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2016 15:30:39 +0000
Message-ID: <CAFEAcA-=9h11a2AvJYBNzfeDsW7-KS7x_7N-T0udr6NZ9Gu9bg@mail.gmail.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, edk2-devel@ml01.01.org,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>
Subject: Re: [Qemu-arm] [PATCH] ARM: Virt: Don't generate RTC ACPI node when
	using UEFI
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
X-TUID: PtveM/24FOz1

On 12 January 2016 at 15:24, Shannon Zhao <shannon.zhao@linaro.org> wrote:
> When booting VM through UEFI, UEFI takes ownership of the RTC hardware.
> To DTB UEFI could call libfdt api to disable the RTC device node, but to
> ACPI it couldn't do that. Therefore, we don't generate the RTC ACPI
> device in QEMU when using UEFI.

I don't really understand this. I thought that if we were
using ACPI then we would always be doing it via UEFI?

Also I think if UEFI wants to take command of some of the
hardware it ought to be UEFI's job to adjust the tables
accordingly before it passes them on to the guest OS.

thanks
-- PMM
