Received: by 10.25.27.66 with SMTP id b63csp1504318lfb;
        Mon, 6 Jun 2016 07:02:08 -0700 (PDT)
X-Received: by 10.141.2.132 with SMTP id e126mr16457079qhd.55.1465221728100;
        Mon, 06 Jun 2016 07:02:08 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j129si11005823qkd.267.2016.06.06.07.02.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 07:02:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9v6V-0003J1-7c
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 10:02:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9v5C-0002i8-92
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 10:00:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9v56-0005iT-MQ
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 10:00:45 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33732)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9v56-0005hs-EC
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 10:00:40 -0400
Received: by mail-vk0-x229.google.com with SMTP id d64so76557217vkb.0
	for <qemu-devel@nongnu.org>; Mon, 06 Jun 2016 07:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eAotURvhUfdDskO3pN1huScNEhakrMAqRbJpdAynuZI=;
	b=O/hI90zcAdNJK2Qmqt/TqF5JEcU7ErybWCupWT1yy8L3vnxMgVPI5uIy5Bx0NR0Et0
	aSpSSVrgMCrxc/mJVwM/uCiIrpm+ooxv5VnR95SdlSKtR4RxBhNdfm25/PV824XzUTCZ
	IamuiXjZc4Ct7NX90JnNXuZC8kCIKru1NwSEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eAotURvhUfdDskO3pN1huScNEhakrMAqRbJpdAynuZI=;
	b=bZWHTUwg8IzGn6JcpLTHfu2WzGw/D4FleAd9EdqH+d/kNqkWnyS5zUctnh4MZWdJBG
	H0QUtKt/PQC4hwf+/BbFJOJFRqfyP8PrvMOWBxzOPjGTy3kNmktLt0YDX35fL3Fkbix5
	q+naXYevVJwy4IT6lU9CZRnNSOjTv3k9pxS/L8kqMBZXxWAP/YtUiUW0HkM/hjUIFtIq
	LZdZw84mTNtmADK8GQqM20J3P//aQcwutsFcp7kzGHH9W8PBZXNmxMLhFU52XOvP1CGv
	T53WZ1hWRdgP1kIO3i0la1cSD9rolAr0fNkU0UIJ86AuCrJluGvGO18h79osocTigbbL
	3R6g==
X-Gm-Message-State: ALyK8tKjsAebViUMgc/eLHKMa4SU4pXIzMM2Ng5TV6CN5aXZDQUhlZxCWVJPsI8Cfuj5fEXLaGAXo7q16ggGewcP
X-Received: by 10.176.6.97 with SMTP id f88mr6645357uaf.38.1465221638512; Mon,
	06 Jun 2016 07:00:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.67.65 with HTTP; Mon, 6 Jun 2016 07:00:19 -0700 (PDT)
In-Reply-To: <1465028065-5855-1-git-send-email-zxq_yx_007@163.com>
References: <1465028065-5855-1-git-send-email-zxq_yx_007@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2016 15:00:19 +0100
Message-ID: <CAFEAcA8Usue736ZytesTCvBNYrN1UYjqC0P9z4nkb=mF7QNw3w@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Subject: Re: [Qemu-devel] [PATCH v2 0/6] Drop the qemu_char_get_next_serial
 function
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
Cc: Rob Herring <robh@kernel.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?B?0JDQvdGC0L7QvSDQn9Cw0LLQu9C+0LI=?= <antonynpavlov@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UIlNJ45qtiVd

On 4 June 2016 at 09:14, xiaoqiang zhao <zxq_yx_007@163.com> wrote:
> This patch series's main idea is to drop the use of
> qemu_char_get_next_serial. patches 1-5 QOM'ify the related
> device model and the affected board code. Most of them
> are arm related. The patch 6 get rid of the function from
> the code base.
>
> I only test the code with ARM versatilepb machine. The other
> machine need test!
>
> v1 -> v2:
> * fix a typo in pl011.c which failed the make check
> * fix out of bound access error in stm32f205_soc.c

Applied to target-arm.next, thanks.

-- PMM
