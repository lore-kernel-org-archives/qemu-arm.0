Received: by 10.25.27.66 with SMTP id b63csp1940697lfb;
        Tue, 7 Jun 2016 04:00:56 -0700 (PDT)
X-Received: by 10.28.85.3 with SMTP id j3mr2247928wmb.0.1465297254639;
        Tue, 07 Jun 2016 04:00:54 -0700 (PDT)
Return-Path: <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>
Received: from socrates.bennee.com (static.88-198-71-155.clients.your-server.de. [88.198.71.155])
        by mx.google.com with ESMTPS id ud8si12442377wjc.216.2016.06.07.04.00.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jun 2016 04:00:54 -0700 (PDT)
Received-SPF: fail (google.com: domain of qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org does not designate 88.198.71.155 as permitted sender) client-ip=88.198.71.155;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=fail (google.com: domain of qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org does not designate 88.198.71.155 as permitted sender) smtp.mailfrom=qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from lists.gnu.org ([208.118.235.17])
	by socrates.bennee.com with esmtp (Exim 4.84_2)
	(envelope-from <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>)
	id 1bAEkZ-0000Dx-Im
	for kernel-hacker@bennee.com; Tue, 07 Jun 2016 13:00:52 +0200
Received: from localhost ([::1]:48513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>)
	id 1bAEkV-0000Mr-NJ
	for kernel-hacker@bennee.com; Tue, 07 Jun 2016 07:00:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAEQh-00004z-4R
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAEQc-0003Wd-RO
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:40:15 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:33963)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAEQc-0003WP-No
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 06:40:10 -0400
Received: by mail-vk0-x235.google.com with SMTP id e4so100203225vkb.1
	for <qemu-devel@nongnu.org>; Tue, 07 Jun 2016 03:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AmCt5HThH5CSl4daiLqAselm0iTyJpnMV7Ar7O+5pUU=;
	b=FVgGsoCO06b8MDSBnvoAN5q8SjBYxXPuIBi8stBreLUdvLmLXls4IR594p5WQtUjtc
	jxaJK4Pa2bTOhbB6zALZaKotjSWY8sqyodde6HKhEE3UnqVUli+yNoqno3pn2c5Qxkj2
	fyf/5eiZ0cf4yEBsN1BGDonTvEh57ywZHvwLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AmCt5HThH5CSl4daiLqAselm0iTyJpnMV7Ar7O+5pUU=;
	b=hbQqDNbNcZLrtETjNmQO153QPFVlk0U1NFHgVG1wTjcwsdd8810VyQYa6RDdJggn2X
	YHqldk31l9iWCPDVz8yo+5Fe4Jx0OBCimdZPOi2Tosnr67JI0XtM/trL0dWw0EpvIE+k
	ZJQj3v+7+a670ZMQ4o6MmWq5hFKY+KWaN4d1CahvX7RukyecNuEd//l5zA8WVA4GCTrx
	4NrAMZRvVC9LoOL99dWDGOyZcOCCDFfmGZAtjtdWWN6kGGnRElgcZzBlfXXH1fgNuc6o
	+hiiNcysNdlSBFm/ayrf836VHvFpQQcrjeKUZ8WyokI56updNX3ly98KOizzrytdb/l8
	YL7Q==
X-Gm-Message-State: ALyK8tLGIzVQDqORUP1UW6eVson/9IxUbX+Sbx5EINpqT8gsMHJpcxjv+1SgB1GRgM9K2iN8Lpj+HLYtGs4lS/J7
X-Received: by 10.176.0.146 with SMTP id 18mr6283175uaj.17.1465296010259; Tue,
	07 Jun 2016 03:40:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.67.65 with HTTP; Tue, 7 Jun 2016 03:39:50 -0700 (PDT)
In-Reply-To: <1465267577-1808-1-git-send-email-zhaoshenglong@huawei.com>
References: <1465267577-1808-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2016 11:39:50 +0100
Message-ID: <CAFEAcA_kW27BYOphHxMuQn4e8pRw0Wx_C5UtB2OrJijWMOkWsg@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
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
Cc: "Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org>
X-SA-Exim-Connect-IP: 208.118.235.17
X-SA-Exim-Mail-From: qemu-devel-bounces+kernel-hacker=bennee.com@nongnu.org
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on socrates.bennee.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,T_DKIM_INVALID,T_HEADER_FROM_DIFFERENT_DOMAINS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Subject: Re: [Qemu-devel] [PATCH v5 0/3] Add guest PMU in machine virt
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:57:07 +0000)
X-SA-Exim-Scanned: Yes (on socrates.bennee.com)
X-TUID: RmTjMpLkoikU

On 7 June 2016 at 03:46, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> KVM-ARM64 supports guest PMU now. This series add the support in machine
> virt so that guest could use PMU.
>
> The ACPI part is tested with below guest kernel patches.
> https://lkml.org/lkml/2016/4/12/755
>
> Changes since v4:
> * fix building failure due to kvm_arm_pmu_create()
> * rebase on master
>
> Changes since v3:
> * if kvm_arm_pmu_create returns a failure, don't create pmu dts node for
>   guest
>
> Changes since v2:
> * address Andrew's comments on PATCH 2, thanks
>
> Changes since v1:
> * rebase on master
> * Address Andrew's comments, add a macro PPI, fix code style, add
>   cpu_to_le32()
>
> Shannon Zhao (3):
>   target-arm: kvm64: set guest PMUv3 feature bit if supported
>   hw/arm/virt: Add PMU node for virt machine
>   hw/arm/virt-acpi-build: Add PMU IRQ number in ACPI table



Applied to target-arm.next, thanks.

-- PMM
