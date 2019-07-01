Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2714033wru;
        Mon, 1 Jul 2019 07:29:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGE/NfC8HyRIfwQjgWoeeD26DGAoBrhYKcd5Hd69nquhvbHgj3j7sRo7/1cdxH9uNp92BV
X-Received: by 2002:a17:906:d6a:: with SMTP id s10mr23055900ejh.180.1561991355629;
        Mon, 01 Jul 2019 07:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561991355; cv=none;
        d=google.com; s=arc-20160816;
        b=FtG+/yLCYa0XblnzhqdH74XKKbD0tt/k4aHtDotvNnWf2ZtEJgRpeBbmbxOZwqgWC5
         JUur69EvIVx7B+Gx71fzjWgfaKQyhoGldjWgToX4uG6VWyKatqLrqshoODIe/Zzrglik
         EfLjKqE/kiM1WzFYjedBuH7uU+HzmfhMKtfUoF/UmRJPpmkV900AilZTvyjogJxvRvyu
         6lLrjXhlzGqd+WApVwfXUbHlv6+Co6HSSHSu4e5d+ehW1bTjl1V7+NgAVgGei3oWdFUO
         dR1iHNE68+mssIDvqJbRNg5OVIOYk//sSj2+2GlcAxq8RIC9ywTp8b2aV8Xqezwi0TVJ
         /bRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7jKn/glfJZ7+q4vbaBGW+VsR/O9vJnh77TasloERjnU=;
        b=saHvILeCT13LfWltkrmzB/zmARwxVWlUTN+MaHJu4OdbrKAzYEdItITdfvObfnicBD
         m1q7GZT2G+lNzheHdU8BhqhxJYYlwEEIgufauYRwPfXTCqCliT4k2eIJm4Lf9wYpEXYT
         MolemsvRbXf9xREC9Of7pNFPn612y7aWJRuULwImvjDDTU0SMvPT3jtVVHXJ+hHatvks
         5ML1FpNJS87ftZlR1Xnis7iiRDYJfe9m45KD0drsCqmV+MN0l7Y9lIJuqppW0C/BfQ4s
         eV/BxKlxE/GawkhnTZwCIwPofhjOBG4sMzB8KAflK9T9+qtcVVLgr6Bku1AIXy4Rfoi7
         WrBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m2TPgg7l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e28si9370088edb.265.2019.07.01.07.29.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 07:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m2TPgg7l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhxIw-0007VM-N5
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 10:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53201)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhxBf-0006KR-29
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:21:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhxBd-0001Xk-LU
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:21:42 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45411)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhxBb-0001QJ-Fo
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 10:21:41 -0400
Received: by mail-ot1-x343.google.com with SMTP id x21so13633213otq.12
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7jKn/glfJZ7+q4vbaBGW+VsR/O9vJnh77TasloERjnU=;
 b=m2TPgg7lNbeLvOk7y3CLyI8upmKGyE65o4NU0MvULeyNvp6DgI2CidWXEAut398lU3
 0dbdSf1o1PS/RAD0CMsj6E13gD6+q+Rr7/hZj2l6IS96RMTAd4XCvuXjKL14I/QJTF98
 X0ucOHGDM/zQbXFJYDC/qQLQT/i0rcFVc7yDR8eujmCL9hGvKtm0HoVH1ofCEwPeDNj7
 Fpp9a20GpqLx7fFeZ4CrdiUfCn/0u/SkQ6qpINv39t1bouA8diM3ToYbdgfRrzJNTbBS
 QqFkiCbkb1dbATz6JgHBOvAfMSctTL7wNQIRttkr1gNRtKoMziak7A9hriiTdK2bvP2X
 kieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7jKn/glfJZ7+q4vbaBGW+VsR/O9vJnh77TasloERjnU=;
 b=s6iRM5cIJRqTyuea4u6DlLsiL+TlIGRCpAHkdKSsmKJzCHjC8QzUW9F9eVqWj4Dgwa
 71GqbTxfuYhzFu2gCSvRabIhD4/tjmo9gtg+nto82CiaNOIAirONf+SAUkecxtx9JC8b
 h+acblBBtmb+jpL3+9DPRDgzz/QfV7drIW4FlIQgpxknopMljZ4LfwGuErnj3AUUTREq
 OvDonPF9knQsCLEA6mZ6HXOlZleEHHXQlXxA337fpz2IyCn219UXse821cmGqHndAUFq
 aCTGQJJg//ZBVB3lVtI7+wzl9t7FV7XP2pFtFAMKIzbnlwTf5B2NmqKdWKG71jd7ad3H
 6HTw==
X-Gm-Message-State: APjAAAUBKqWPZLVL3YLbQz/d9XJVY2oB1N3qioeVV5JsbUuDqF6y640u
 byRQuxAn0tuhM/B1+y7rPm7cctOyqmfkV2659sCFcw==
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr8803580otk.221.1561990890402; 
 Mon, 01 Jul 2019 07:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190625121421.22280-1-shameerali.kolothum.thodi@huawei.com>
 <20190625121421.22280-5-shameerali.kolothum.thodi@huawei.com>
In-Reply-To: <20190625121421.22280-5-shameerali.kolothum.thodi@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 15:21:19 +0100
Message-ID: <CAFEAcA8TgTeia99880_CyEircQY_2cAnNQ-TPbaizh32+gqNag@mail.gmail.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v6 4/8] hw/arm/virt: Add memory hotplug
 framework
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Samuel Ortiz <sameo@linux.intel.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Linuxarm <linuxarm@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 sebastien.boeuf@intel.com, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: niD5CGQv6x1Y

On Tue, 25 Jun 2019 at 13:15, Shameer Kolothum
<shameerali.kolothum.thodi@huawei.com> wrote:
>
> From: Eric Auger <eric.auger@redhat.com>
>
> This patch adds the memory hot-plug/hot-unplug infrastructure
> in machvirt. The device memory is not yet exposed to the Guest
> either through DT or ACPI and hence both cold/hot plug of memory
> is explicitly disabled for now.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
