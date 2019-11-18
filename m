Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp47102lfi;
        Mon, 18 Nov 2019 05:36:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwuwdow2uIA1s8UQm6pbV/kfnyeL8EOOhkWeBfh3fuAjZhjRkI4Y11qD0pdOi9lzOsS719J
X-Received: by 2002:ac8:1017:: with SMTP id z23mr26252926qti.94.1574084172196;
        Mon, 18 Nov 2019 05:36:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574084172; cv=none;
        d=google.com; s=arc-20160816;
        b=Cj+RbdMCFd7Am3VQSMxvpfT75n/3F9E4+JZEXAZRmMAk0PmDrvYFREBxsXDY3UAHQk
         Qf5cn3qsKJnUR1qXpRV4eHxWLmxo16TBN5tQn5rGAH+oRVnOhcB2jOBFUTdlMZZHQZxk
         eyzfnjV4Z/DUOU+4ArVHG53Dhxfuc0utwV16JjJV6fxzcmzhI/LgLDISaUOGWyxFFELE
         7PuyoRETHacCNLpihVUJ11bK/gFpzv5CMHzubNXB5gkOcrmWcDNpXHuVAmFTENNkknxu
         F2XYQ45JpMAfQ4PPndJuM99hQMF4uJa63jn8+BLxkC8Qnsb/6bQr2RIHy+4jTnBtZ7Hs
         5yWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GuOtEJ5z4Wnwzz524426jAKDDbWyqt68knGVTzMGhXM=;
        b=YjTqYZF+4o6iX1mxUm2iqMqstjwNWnXMcjrXaaUEpbkPOYIwoGVB0KYl5xTIJ5Qapk
         BnQlVP1D5KuigNUkPLBdabs52SSpTnlpW1wJ5YkUGr7qtpUdMgMrIGUOy6HEejBvTiGH
         1YlTlpGhsS17HNMiVAIGFRKWSd4JWawBiS+uIQO8HLaEBBdXj0WRsStjXqGdEK+chgRc
         ZXMqIj7m4qVNbpbZfdDEV1dLXKngWZAd2Fyj8ZHX+kEij/XTZlOynbJlYqMobdXRYaV0
         du0P0ORlwPY+tCm4cAH0cmYh/mEU21q2Yk0CkvWMEvhsDAaDmKM0MYj5rI+jkc7nf/gI
         0KqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MgpAT8ij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si11374026qtp.377.2019.11.18.05.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 05:36:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MgpAT8ij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWhCN-0000Rl-JL
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 08:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46209)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhBu-0000PG-DW
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 08:35:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhBs-0006Wp-J0
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 08:35:41 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:39324)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWhBs-0006Wa-C5
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 08:35:40 -0500
Received: by mail-ot1-x32a.google.com with SMTP id w24so14018729otk.6
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 05:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GuOtEJ5z4Wnwzz524426jAKDDbWyqt68knGVTzMGhXM=;
 b=MgpAT8ijWPqkJtg1Y/Pe7HXWuw6Whs2A2JKpD9Za/OvmfrK8/LfNdTibz00VoIqyfl
 Wf94CKvM+ohuF5aWgQkQTaF1oqZ4hC38h5kaGaOAkXNOGrvyetwevtPQaceYkdU7D+bG
 nx7ez5c0Z59ggA4r8r+z2j1/iHpui/utWxCQ+HDKom1Rvlo8T29EAN5CVY02gAlEs/mG
 AXXS4cOiT86mMCGdZ8GEo3ahTV3+fIYqtKVPGlzXkVpl7y8dM+fky0xUVI+C5HBO3Xn8
 IrKLXfHjqlV9Nq3FV7pCmn26E8ujqYk0lELJCPE/iaOv2/WRXkdGCskId1NSMpdmMmz3
 B28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GuOtEJ5z4Wnwzz524426jAKDDbWyqt68knGVTzMGhXM=;
 b=rMFBdIz4ekSEc0J9WgmhpZiPP+90bcH55APbZPmrx0Z4+lLvxmMJTlsx6QSgplZnsb
 PQcAS1Lm5T805oOxlnrvjEu5q52gOSunLzB59vED9Lwz6SE8cREGbD6mYnBVwqaK60El
 5B2M/UsU3eNVsnYXig6rJsnvDRj7DOMFDoeOAH794+aEmJ5NOKe8J4/eI5wW9w6u7Yr5
 43LvolYohRCH4mjpA7lf5y18k4ZAj1RtYveD6D1BE5N/UZE38FL5pMPpHzdyPktK5/Zw
 x5jRxRDAp4EsPo/VxuxqFr91wWvkAPPDxlc+kTvXrA8vW+GBwOaqScQK1FLVxjttWYW5
 VTiQ==
X-Gm-Message-State: APjAAAVogh6KJDwceLpe/bI3PRo+Nx0GZ6XbyQMGN/bO/4pUY2sfaj9H
 DQ3N7TyP6luru2hXH2aMrBDyPrdrGoACXWaKRfSheQ==
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr20661837oto.97.1574084139661; 
 Mon, 18 Nov 2019 05:35:39 -0800 (PST)
MIME-Version: 1.0
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <9d7a2c5d-df78-ef67-87af-3860fcb7aee8@huawei.com>
In-Reply-To: <9d7a2c5d-df78-ef67-87af-3860fcb7aee8@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 13:35:28 +0000
Message-ID: <CAFEAcA8dAOiqRX2Uy9g2f=hO56Zx6pbEaLY3AQ8-3SX4YK9FkQ@mail.gmail.com>
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
To: Guoheyi <guoheyi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32a
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ls2j3k4AMqJP

On Mon, 18 Nov 2019 at 06:55, Guoheyi <guoheyi@huawei.com> wrote:
>
> Hi Peter,
>
> Could you spare some time to review the framework and provide comments
> and advice?

This patchset is on my to-review list but there are also
a lot of others on that list...

thanks
-- PMM
