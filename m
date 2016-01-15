Received: by 10.25.159.19 with SMTP id i19csp511925lfe;
        Fri, 15 Jan 2016 06:53:34 -0800 (PST)
X-Received: by 10.140.220.207 with SMTP id q198mr14583394qhb.24.1452869614647;
        Fri, 15 Jan 2016 06:53:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v84si13632593qkv.88.2016.01.15.06.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 06:53:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK5ks-00077f-01
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 09:53:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK5kp-00077P-RS
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:53:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK5kp-00008c-5u
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:53:31 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:35654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK5kp-00008U-0n
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:53:31 -0500
Received: by mail-vk0-x22a.google.com with SMTP id k1so299482233vkb.2
	for <qemu-arm@nongnu.org>; Fri, 15 Jan 2016 06:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Nz8+LtdLkzfvcv0Hq/oIGYp8QJ2MmPZbGorscqUCXvA=;
	b=Zd82k131oLxkQd4nJiH0D6sGL2Ny90bxvdWwbKHT5Bz9bvjR7rQ/WiDp+G2kzhCyuf
	SDgh/P/NZAwr2StRjmYPhp/KomRcMtT33+FsrTdk3sJquAjyxolTb06zF1PHa1KwHxVL
	0hX5Uo3NijXBDW7DL+y/mzdLWn37BFbkJvo/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Nz8+LtdLkzfvcv0Hq/oIGYp8QJ2MmPZbGorscqUCXvA=;
	b=ExcPogbkK9zk6pibEvx7MM3i3mfwECCgHrUcxPgs7kgmTNcIW3Xykby4N/eHbJbtU9
	IvVie+cZcI2oU8Pb5MpRHwfG3O/HdjBP129wQoPiI77Zhdpl+iE2rX1lmoW9Q3oOGvza
	pFaTPW1M2+93kiTejUV4FbDvmcR9TlEpsPs68QWbuIKpbElFUbRbmmOK/2e8MPe9zt82
	P6Gbbf76ZtTdS+fa2PLyZ6ZrbvympSkv/05fVb8t9KTuhdIc4GzWD1T2CMQJwSVfzQ7d
	ADUMnCE9Dt1hkN9odDdBB66Smj+zEdnsI45uk3hbGl401G4DPNiK8d8i7un3pKPjcJcb
	mKkQ==
X-Gm-Message-State: ALoCoQk1OeWMKRoG7tY93MVzhkuStz43A17HPmkjcfCog1zgfGr9HEJXW9EGl27SdFOeqIgBNRTvi83ZHVn/liZtkAVqfBHVMQ2H6WUNosKeVJdnJop5jVQ=
X-Received: by 10.31.180.145 with SMTP id d139mr6837783vkf.83.1452869610550;
	Fri, 15 Jan 2016 06:53:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 15 Jan 2016 06:53:11 -0800 (PST)
In-Reply-To: <1452867091-4023-1-git-send-email-shannon.zhao@linaro.org>
References: <1452867091-4023-1-git-send-email-shannon.zhao@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2016 14:53:11 +0000
Message-ID: <CAFEAcA8GsEC6ARHThLX5pZY2oGQiDKVaYOGVD7OkABAYaHdxeA@mail.gmail.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"edk2-devel@lists.01.org" <edk2-devel@ml01.01.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3] ARM: Virt: Don't generate RTC ACPI device
	when using UEFI
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
X-TUID: Owxt5QzdZnsF

On 15 January 2016 at 14:11, Shannon Zhao <shannon.zhao@linaro.org> wrote:
> When booting the VM with UEFI, UEFI takes ownership of the RTC hardware.
> While UEFI can use libfdt to disable the RTC device node in the DTB that
> it passes to the OS, it cannot modify AML. Therefore, we won't generate
> the RTC ACPI device at all when using UEFI.
>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> ---
> V3: add comments to explain why it doesn't generate RTC ACPI device



Applied to target-arm.next, thanks.

-- PMM
