Received: by 10.80.166.35 with SMTP id d32csp2611751edc;
        Mon, 24 Oct 2016 05:30:16 -0700 (PDT)
X-Received: by 10.200.56.233 with SMTP id g38mr15168715qtc.140.1477312216833;
        Mon, 24 Oct 2016 05:30:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e4si10776686qkd.242.2016.10.24.05.30.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 05:30:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byeON-0001JP-Nr
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 08:30:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byeOD-0001Bo-Br
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 08:30:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byeOC-0006iJ-HS
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 08:30:05 -0400
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:34334)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1byeOC-0006i2-3P
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 08:30:04 -0400
Received: by mail-ua0-x22f.google.com with SMTP id m26so40013798uaa.1
	for <qemu-arm@nongnu.org>; Mon, 24 Oct 2016 05:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DMGvXLXwzs/Mwvf+It66REHV2A1zCGFNq8NjAQMb+/w=;
	b=bFK3Dp7iU1JlRmI+EzHK/AWmifY/vB5dpktLb0QtkwBaA4wencT4HwsEPcqS/nhFnv
	AC8Wuf9doxd7vxr3spWfoGtr4kMtahe/XY52qzKeWqlkYwio8WDNGmRjD2jq2Hb+qCZr
	kUJcOq+9artBibK5EkSRbBN25d5/SXCQKJ6yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DMGvXLXwzs/Mwvf+It66REHV2A1zCGFNq8NjAQMb+/w=;
	b=FbfR3FJbZRyk2q7Cc26+4g5VwM8VRD3RGqE3qslL0TDheHofbSsJ7RXnp/nL8tEiND
	OSf9rgCzc+0zL8P/sT9+a5NCtvleVa5u2m0Uwmw1WFvpmmH9L7fjnSy5Bq/93w7JosHU
	pm1BkEAVRMcxWLQfepUiI6HTnPq8ZA03I7DsN8NHRh5hj7CA6jMCJb1Y09wI7CyUQUH0
	gl0nhLoEgBE03okOtHVaZxF+729l2N+7WioacuwT+el4/8yExHzqs6j3xPKmjAh5onhz
	dCMmKl4IWIRqfIJ9mq1uBL2bAyW39TwLxq0qNs4V5oERG5Z/6rVxTnc8pD6WUUxgEL0x
	TayQ==
X-Gm-Message-State: ABUngvf0V8s+QyEqr6iYYqvVdlLid+2HjW8G5mH+ZeMu75p+ZzxQl/E+yueowYDOVe+trFEFU56QMvdmB7nI5Pq+
X-Received: by 10.31.165.74 with SMTP id o71mr8655334vke.95.1477312202872;
	Mon, 24 Oct 2016 05:30:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 24 Oct 2016 05:29:42 -0700 (PDT)
In-Reply-To: <20161017140707.ygezwdokyw4lj53s@kamzik.brq.redhat.com>
References: <1476707466-14300-1-git-send-email-eric.auger@redhat.com>
	<1476707466-14300-3-git-send-email-eric.auger@redhat.com>
	<20161017140707.ygezwdokyw4lj53s@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2016 13:29:42 +0100
Message-ID: <CAFEAcA8MGaRf5ytu3VcKGZj-kBAXoPdYvFN6k7Bx+zPaPsLXPQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-arm] [PATCH v3 2/2] ARM: Virt: ACPI: Build an IORT table
 with RC and ITS nodes
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
Cc: Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Prem Mallappa <prem.mallappa@broadcom.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JmPbKtafdeo0

On 17 October 2016 at 15:07, Andrew Jones <drjones@redhat.com> wrote:
> On Mon, Oct 17, 2016 at 02:31:06PM +0200, Eric Auger wrote:
>> From: Prem Mallappa <prem.mallappa@broadcom.com>
>>
>> This patch builds an IORT table that features a root complex node and
>> an ITS node. This complements the ITS description in the ACPI MADT
>> table and allows vhost-net on ACPI guest.
>>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>

>> @@ -667,17 +722,6 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
>>                               ACPI_BUILD_TABLE_FILE, tables_blob,
>>                               64, false /* high memory */);
>>
>> -    /*
>> -     * The ACPI v5.1 tables for Hardware-reduced ACPI platform are:
>> -     * RSDP
>> -     * RSDT
>> -     * FADT
>> -     * GTDT
>> -     * MADT
>> -     * MCFG
>> -     * DSDT
>> -     */
>> -
>
> I guess it's still debatable if the above change should be a separate
> patch or not. It'd probably be best if it was, or at least the commit
> message should contain an 'Also ...' sentence. Anyway, I'll leave it
> to the maintainers to decide.

Did you want to suggest a suitable addition to the commit message?
I have no idea; I'm just going to apply these to target-arm on the
basis of your review...

thanks
-- PMM
