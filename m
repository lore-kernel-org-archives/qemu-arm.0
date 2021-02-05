Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2041774lfo;
        Fri, 5 Feb 2021 06:08:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylJG6VYbKAiqrg1OOT+WvpujsW1/ronYfK55c0w3qNB2ORZUYviPVWLu6R+PwK12A3u3U9
X-Received: by 2002:a25:2693:: with SMTP id m141mr6532595ybm.104.1612534101596;
        Fri, 05 Feb 2021 06:08:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612534101; cv=none;
        d=google.com; s=arc-20160816;
        b=NgRPdDVVOyIeMpKbdrdggxIY64aq8zXZUH6bVU6Y3xdDo+7IPcwD5U7UK141wGCiju
         isXOV+JqBQCI/yc56lyDyar7hfieN/JYOGwPpNRzGoUl4vYAVd3IezmokdwZRNwvHczN
         lxTT/qnME56msusIYxxwtP2yKueVX8BWFmmRL5Y6U0RoO04OxykfTp816531/U5hNE6I
         qT3Wd33ZOMQl0KaVQqClFuVg38IfCiFh8o+cpn5jz2d4R85VaFns2fyB/4b8scINZa5h
         K1KlloCihVIoeSRF+eistxvqVpQE1LcNjLA8o9iB8OUTFfD/HSoEDPIiiMVw7QHwG6il
         H06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=mkljodUMFPRwb+m6aBJQT8Lo5+kaLRlqdFzwYBBCSgY=;
        b=TiHpA9XBNZnyJPH89Jfom490PvJnbLz3P26yxxvxoJHkBCvfwpQLm5v58x0XPSfHvu
         OZUs89nDZQbhTT9pBaHYlY4iLEu2Lo1XCtqONApCthhwO9npoTMu1jnz/A4Uakjq/Rce
         08+p/0MTAJD9xMbq0TZvdKbdP+g+sIRFYU7GZnhyLB8mMW1JvkgGll50BcwJ3OisPEwy
         04qQOaqZAHu3dsLOG9p1kHRfiQT6tr8palGh/DJhP4dUM6zVtIYgN7O2nNYyhhy01STz
         qILpHYDdqQPIhxCZashaEKSjLeShmWQGYmr+WTHJ9/iLJ0eWWYfwA5/A5tg+S1SNJeQY
         7wzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AsGffv9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17si8953315ybj.391.2021.02.05.06.08.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 06:08:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AsGffv9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l81mW-0007c9-UX
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 09:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l81mO-0007bG-Jv; Fri, 05 Feb 2021 09:08:12 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:45106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1l81mN-00039F-65; Fri, 05 Feb 2021 09:08:12 -0500
Received: by mail-lf1-x12e.google.com with SMTP id q12so9984436lfo.12;
 Fri, 05 Feb 2021 06:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mkljodUMFPRwb+m6aBJQT8Lo5+kaLRlqdFzwYBBCSgY=;
 b=AsGffv9hiGJ+KOsCwMzWjVQkU+7NxU6Kb4T3QWB6TL5e23Z1gzu8pXh70Ba3Jc8Ipz
 UhkU8Y7QV+fg4Q+9XBTqM+DRcGBvL+K4gOP4RS6YiDhzuk6/x+yhDSjTuCQQty4IYx+i
 ixqqYEt8ci101Z+Lfta/YnStC3uWuf7c2yVsc3q4eibnPoKHrWR0hOcgnOgFdShfDoa9
 cwknkwN8bQlmIzoy7s+KQhqSKPHUVYiojgycDLblx1x9v5yP7a1/shr1OxBNYonqkWch
 kXIrZMGPIG6EQ6U7vhC6pBrthyyfk339aQV35Dm9yxZ0WlmoIRYgtCQhRJLwVq1hHGfO
 dUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mkljodUMFPRwb+m6aBJQT8Lo5+kaLRlqdFzwYBBCSgY=;
 b=rocCdURcXyTU1x+zRtavcUvBug20ZtMcdTY1poZnwbJDRfDvAwNQRRaS0p0tZU9Y20
 JcsCpgW0jANil17tiHn05r8XKTUtJ5SWFIrwKiYMds6+gMJhw3NZtDTuqKbxPk8E23nV
 WVEUDAoY+eJcu7CdkckPpPf0ieHlaqWXzohKCQpRhp1jjN297GUm7JBdeplTghF4pBKD
 163XahaBKD/W2VvrzvvHoe957qehaKLaE9UmpBkwDFORdJOg9ikpXaQv55DKCnbYLZ9R
 X0EBoRDSYqJrwJL83te9IKeUhpnCtaCIpdMtfAGjg0NNAmf9QLCVus3gr48CSYwKOun+
 JZVw==
X-Gm-Message-State: AOAM532D/hL7ecx3G2CtMNSkFJ7V1smlV9GAh/7wwVp8Rue6wELpN7+Y
 FrgBANEdAmaCxSa/HTZ4a4c=
X-Received: by 2002:a05:6512:118e:: with SMTP id
 g14mr2515235lfr.205.1612534088708; 
 Fri, 05 Feb 2021 06:08:08 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id b1sm1000038lff.77.2021.02.05.06.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:08:07 -0800 (PST)
Date: Fri, 5 Feb 2021 15:08:07 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] arm: xlnx-versal: fix virtio-mmio base address assignment
Message-ID: <20210205140807.GH477672@toto>
References: <3362132240927a23ecca7b9d8cfd6e4130509eea.camel@gmail.com>
 <dbcfce3c-3140-01b7-06ca-497cf7fdace7@amsat.org>
 <6f6a803af5941346050d84e77fcaa52e0175a8a7.camel@gmail.com>
 <f4862169-28cc-82a9-32fb-da56b000cf54@amsat.org>
 <CAFEAcA9JkTEOhmoFjWYfR5d7ANhKnc9URk89Xe36q7qMVxkMmg@mail.gmail.com>
 <aa8ccb78-c977-20fa-a814-4223b678d9c4@amsat.org>
 <CAFEAcA-+dS5r5LvW5DTEH2vBrm1S2rs7sjjh2V7zjtD6ut0wBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-+dS5r5LvW5DTEH2vBrm1S2rs7sjjh2V7zjtD6ut0wBw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, schspa <schspa@gmail.com>,
 Kevin Zhao <kevin.zhao@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TPKJxs6UXXlU

On Fri, Feb 05, 2021 at 11:18:28AM +0000, Peter Maydell wrote:
> On Fri, 5 Feb 2021 at 10:31, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> > 1/ virtio-mmio must be sysbus-device,
> 
> Yes.
> 
> > 2/ we can not sysbus-map out of main memory so private container
> > is incorrect, and Versal can not use "mr-ps-switch"?
> 
> No. If you have a sysbus device, and you want to map it somewhere
> other than into system-memory-map, you can do that: you use
> sysbus_mmio_get_region() to get the MemoryRegion*, and then map
> it into whatever container you need with memory_region_add_subregion().
>

Thanks, that matches how I thought things should work.

I wonder if virtio_mmio_bus_get_dev_path() really should be peeking into
Sysbus internals mmio[].addr?

Sysbus mmio[].addr looks like a candidate for removal if we ever get rid
of the default system_memory...

I don't have any good suggestions how to fix this. I guess we could wrap
memory_region_add_subregion() with a sysbus version of it that sets
mmio[].addr but that seems like a step backwards to me.
Perhaps there's a way fix this in virtio_mmio_bus_get_dev_path()?

Best regards,
Edgar
