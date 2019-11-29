Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp9410207lfc;
        Fri, 29 Nov 2019 11:04:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqxi9k0ZheTEsSNosxEcVCwkxaPvENvBj2ij+gB6oipUPQMKgws6rXibjd375ckvMmyHtCqi
X-Received: by 2002:a17:906:f2c9:: with SMTP id gz9mr37578177ejb.171.1575054271968;
        Fri, 29 Nov 2019 11:04:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575054271; cv=none;
        d=google.com; s=arc-20160816;
        b=swK8yZWi3L1w3uBiUlCQ+yQ1WPn+GFtb/rb0UOx+B1uPPF5oL2y0u3/K/KUVsKTPNT
         iahBAvtWtzbBA1vfsgFhvQPvh6NSKMtICtVQs2KheCQYlPgRy8YYYcJHq8GD5kBiiC30
         E+urva7bwPnrOJ7OE382zkc7nTSt23YXpH0Js5NEDOp5IrVmqOXrLC+Q9ZcwQmWl7iAv
         XHJtMDnSllJ9n4wHA5aRrBHUeihO0rMuTWXkPkjELnbuXt/UB8Z5RjYic0uO9I9QNIjs
         lh1MkvYa22kKn6QOjdCsBE6er01N7rGTm3g0AZ+P33lWI05l/qvFuNUSON/2ShIgxZuN
         94TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XNMHPRJf7NX4zIxzIyJqa1bB7RVy5DxMdwYmmbkL0uY=;
        b=QKjcVPTiYX5v9q5oGiZ1C1CzV2ZzE2v479Y6ZYOf/ZoptF85QvR7dmh4yfSV/aRxx/
         9KuArMGXKJz8Ur+vZPWD/4o0QvkruCC8mybhCAA2AGliFl1Q++0T1mSH7n7qsJveoAH5
         fb28fpDNXTJ3xSatZdYpWgoJQToXVBqLb2kUsdj41PHCb+BpS+v4HbNtdJMSkN9DxCFp
         z31DRBiv9lf+zXqL+V2qp7oQx03bbSvSIE4Fz2PwDNRL5gblunfMpicIV1ByxTjl89RD
         9MxCZzbksbYA7PXbgmKwhMtb63zM1GZUuJ5Gq/Gc3oeZmWZ4S9yb4jXNMrsYlKBolLm9
         90KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s60gmHhx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k24si15896665edx.418.2019.11.29.11.04.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 11:04:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s60gmHhx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ialZ6-0007UG-LC
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 14:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48168)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ialXo-0007NK-FW
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 14:03:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ialXm-0005vi-BK
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 14:03:08 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44232)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ialXk-0005jd-D1
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 14:03:04 -0500
Received: by mail-ot1-x344.google.com with SMTP id x3so1040006oto.11
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2019 11:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XNMHPRJf7NX4zIxzIyJqa1bB7RVy5DxMdwYmmbkL0uY=;
 b=s60gmHhx4pvqe6li5zizwIYX3jAsP1G8IfSZ2bNJ/uA6Le64aihajegOO5Uv2Px86o
 qSb68919UCMvqdDCnW8BjWhGh4aHM2XWnYLyyHI9E09v4y9wv5LZj2axcGHPRuUqkTSz
 JFj4r+eZcneeA9nysMl5SNgyZ+WihzqOLTfwDxWadM4Oakew7o1mIrauhHjL1unT1U4J
 CsOL+UuPOL716rGY/MmfrkPk/nFHna75AI79ygSmxghlXpNV+oNaHcObNs1hcJN/DtZo
 JDy0DOaBddIbbGXzaK3J2V1s+mmydFxsHmx6ChE7SU3EVhnYlWuobve0BW8tJec7mToi
 TFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XNMHPRJf7NX4zIxzIyJqa1bB7RVy5DxMdwYmmbkL0uY=;
 b=SCOacjD/rkfzxuhSXwAouT2J6t6TgNw7gKaz5KXDz3UB7gmB3v3TuLdivioUnWm/3x
 /iWVP/NAr/Dag5P3CPSH463KO6Jm640FKavBDMw61+HGvzzs1L43HxRjwZ4ZbzwTaKTC
 ABnNfZzvDltMCaHcL4ZicuLRyvK/BFPLuTLBpma3tivIEqYqWCNkEkrspMNkaG/QImv4
 7MqoapIljUnLBAI7cpsVL9YhWvUR4nz8MREddwImxPAAxsl+ECrMjL1fVnPJ14VkAPvg
 1mMR8moi7baRkQOmc84VziNuPsOYpJMEVPUaeyPCNXGE7+ENTxp/g64usXyggRewhhBh
 neCg==
X-Gm-Message-State: APjAAAVpOTv9S8c3bS26AfnHTo99YpqfOPZaaSAkW4ObOHWnFbG8Avtx
 Tliy1KBj1sXJUKJ00Ev50uUhx8r8ZwkTqWRqzagSdA==
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr11206932oto.97.1575054181206; 
 Fri, 29 Nov 2019 11:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-14-damien.hedde@greensocs.com>
In-Reply-To: <20191018150630.31099-14-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Nov 2019 19:02:50 +0000
Message-ID: <CAFEAcA9ScnmyFXec7sdqjUdKJ1FcJCnOdiHZYqavveTWoQ78zw@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] hw/gpio/bcm2835_gpio: Update to resettable
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Edgar Iglesias <edgari@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GW8isJNqpRFB

On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Transition the bcm2835_gpio device class to Resettable.
> The sdbus reparenting is delayed in hold phase to respect
> resettable side-effect rules.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
