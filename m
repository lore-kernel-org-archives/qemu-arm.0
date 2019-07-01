Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2576643wru;
        Mon, 1 Jul 2019 05:06:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2SmfnwcowhYT2ctk1e/Lu0KHEej2IZBrnLfVH6HrXAL2VWdVFpwkno0fJFVKR1gwgR79h
X-Received: by 2002:a17:907:20a6:: with SMTP id pw6mr22411913ejb.111.1561982792337;
        Mon, 01 Jul 2019 05:06:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561982792; cv=none;
        d=google.com; s=arc-20160816;
        b=KvAF05/EgHXGdqgVb9qJrkcdUF9WwyheidRuPjHlGyIkB7SGJJSwrUxhD8XcurNETA
         GEAu/nUzaoed2SvgrADfIDb4FHYoMreMgdTAX9ar/1OjHt+WbphGpUtD245r+si7fxNK
         vmiI949PINaAmyY0K0LtJ+NplM3yuJq6Z0FwHi0iLB2+kKYCZZyWJ/pfG7NxMRN5TDzy
         bdCMdJ0Q9dmNWXAPKmXCI8yajjUr3/GYLV/Qat3cLtIP6XQl45ohXWWI0Gfy84MJgf2s
         oUUVcbb7pALfZB6zK4C1hIGw5XGZP+Bh60sF8WEPSkg+NEvZtXZzsl8yzIAbj/2S+0if
         ytyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mjliL6SGD7W1mzlrS/SGIU2L53Tm1xC2mwquCwVdnAg=;
        b=NRUIQ0DsLOPnFGXurXiahMz698WWDlewkVk6obFj/yX9tTuk6sIYN58LA9dDBzGLFn
         NOzYsXXvlrkJzXlKwoHB4H96vLfsa2oJucJTzTPH10kG4YC12MKrVV6F2+3NKmEbDbhu
         TjtLMy8iGeqTG4mQa/a0FbSjl3DYdLK6mtVI0tcQIcw9Kw/e9REORaqAXufPLaqr05b5
         jM/2tfUqU8318aOoKRAzSVTZlI+sB8Z4A+uHx9SK7z2qt7jAR4jxNSOpIDg0RgmFlWOb
         J4dTVQrH4VrbQHwYFn1vGUFaBy6AfFoJBDfGZtJL3KCUSIyk5M59fThAtelmDHYk0sCm
         An7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kAtQLg79;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m32si9291353edm.415.2019.07.01.05.06.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 05:06:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kAtQLg79;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhv4p-0002u6-EI
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 08:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51768)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhv0Y-0000Xd-Du
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:02:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhv0S-0007yA-V2
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:02:02 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38507)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhv0S-0007wm-OH
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 08:02:00 -0400
Received: by mail-ot1-x343.google.com with SMTP id d17so13223035oth.5
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 05:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mjliL6SGD7W1mzlrS/SGIU2L53Tm1xC2mwquCwVdnAg=;
 b=kAtQLg79yqP8rfCNjn58girppAbLKYpuAHzC81rJfGt9etH000zegyjDgkfkd0rCj0
 hcMy26SDIcE3cDPnAueIRHDfIkqCQZq94euymcu954wfKun9sh3GicYBR5kLCULAFGyd
 7bBIhJs6Uqm1XIWtj9CcEfnUJ2l4asIPvD4105uC+GSOcwXa5jzAGrAMWziBFlUN0Usq
 HmgtMVDa0LK9n9CIjBIDKtbSkaDLBuqeWAtzfeoNBtmsbMCK5mDlexa0CeB2J5MMmU9v
 ZY4ZHspxtPtqb44tNCAvZNC5RpuwvSpUpzLZZq8zjvubZW4p4t69m7eYT3d68vkPvFFd
 cOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mjliL6SGD7W1mzlrS/SGIU2L53Tm1xC2mwquCwVdnAg=;
 b=I2R6xi+xbBo/Nw1QO1Jvko+GVQtsv2lGClpJ0uoW3P1dFZ9aYT9666A9NLC2b0Kk3q
 lpW06F8WGystjlZoZpwDo4E5qRUk7XB5ZFBlLmqOpIxhpLIWzRPMDIySFv5uuyEhBufj
 vjFwVJhq2suI87A4nVOpJfN1qFRa0dLTV0IUpOAu3MEomJR4J35gacPi7V1urYyXiy4W
 1PHB9dSOLxrTlor3a+kE+5zPqQOM90XGUxBHVXcI6QYV108Vlj6VjCowfhTXSGNOKba+
 OqQVECeX7+tGY8UPjVeru6+MM4d5IjGHE4vcqKwuqGRRnXU6F5iuSdxmIdXsvNtmftgB
 NYyg==
X-Gm-Message-State: APjAAAUDrXsd0E6yutzx4LabyBcIrQZqKdmc7My6QD5NTQxtDjLi8jgF
 PogaaOpirDr492AWa1ucEdJUPRMvjXK4H3WE/YawPg==
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr19993893oti.91.1561982519462; 
 Mon, 01 Jul 2019 05:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
 <20190416013902.4941-6-andrew.smirnov@gmail.com>
In-Reply-To: <20190416013902.4941-6-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 13:01:48 +0100
Message-ID: <CAFEAcA9hGvpafJkVS3o+n=4S_=UyZ=iz352L5DtCkit5bvysCQ@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 5/5] i.mx7d: pci: Update PCI IRQ mapping to
 match HW
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IVNTLjvGTEgI

On Tue, 16 Apr 2019 at 02:39, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
> Datasheet for i.MX7 is incorrect and i.MX7's PCI IRQ mapping matches
> that of i.MX6:
>
>     * INTD/MSI    122
>     * INTC        123
>     * INTB        124
>     * INTA        125
>
> Fix all of the relevant code to reflect that fact. Needed by latest
> Linux kernels.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> ---
>  include/hw/arm/fsl-imx7.h | 8 ++++----
>  hw/pci-host/designware.c  | 6 ++++--
>  2 files changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Compare Linux kernel commit 538d6e9d597584e805146 from an
NXP employee confirming that the datasheet is incorrect
and with a report of a test against real h/w.

thanks
-- PMM
