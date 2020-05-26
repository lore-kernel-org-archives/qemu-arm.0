Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2733710lfc;
        Tue, 26 May 2020 01:03:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgnCgDrBvguOJ0CyR5u2ODvK6VmCmr5Nu73T+OR8yY2ksdkVhuAN2u1Do5R+GJzLG7WBP8
X-Received: by 2002:a25:ad87:: with SMTP id z7mr6689863ybi.342.1590480217739;
        Tue, 26 May 2020 01:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590480217; cv=none;
        d=google.com; s=arc-20160816;
        b=IVrV6+5rIA0YgxBvUoj0hCar73iJam0xJ7o6GzVrl8JOldV6QNxuokRxOMmtMgGOHL
         TrJC0mHREfEICxKjKKgRkGiuIDOopvu3xkSxOw6q0BMo7KK8sjxkeT1p4lBCmbXq1GlU
         ik2u/iMs/bUGq/fV+p+rzcflc0MjpGh/Kz9JssdCJTsLcM2hNlfwhecpcY2HTKBxFBqh
         4X9MoU9QT617hazpN9HYHzUyLCgHZqLfWnrdYQZB3BG+y9Ud4+yXqMA7jas6g/LprXyS
         eTjrFmdXAMuwfBpC8xs0VOOltp3CHqzOAL0/FNy62Avwtg5D5ktQqRjcPnYvLYh5ZNbO
         aUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=XRKd3HVkwMFDo9h1+ozzoJxrtyzcJF6y9QBACpjVzYk=;
        b=Kca9Dp+cLJ3jUd9smXIVHWAjYiRK/3LU49vqjzhxnd340IEOXPXu76LWf91+ZuXNv6
         CnX8YbkaGfkjtHAjO2wucyT2b8gZJB9Eim9UWtA51pHim5CV7MBYRnJfVqRc41cValoo
         IRi30uO5ns4LCPBvjdYg0lmUeKvM+yMBpgOq8/U4Ndiqa7b9voSlUXXPqUMrVgs0ibm4
         9SjncNo3N/FOPDD/0tb5N9MZ4pwOPIaVtPqebh1pqaUc48gH/5POCo08ZmcgVDAqpEvT
         2/V7ex2grcJLU83kXpk7wef7YFGFG6xwZzXCFULovVbLg63fWoJgc55dcvo7Xt7ngUV0
         NJOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=berQ5q3L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c195si16948741ybf.31.2020.05.26.01.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 May 2020 01:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=berQ5q3L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdUYj-0006eH-3J
	for alex.bennee@linaro.org; Tue, 26 May 2020 04:03:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdUY1-0005e3-Ds
 for qemu-arm@nongnu.org; Tue, 26 May 2020 04:02:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35427
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jdUY0-00043q-MA
 for qemu-arm@nongnu.org; Tue, 26 May 2020 04:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590480171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRKd3HVkwMFDo9h1+ozzoJxrtyzcJF6y9QBACpjVzYk=;
 b=berQ5q3LZeNkoe67yOnJijuq0MUz17wPWds7DjTPPauVm6Uq30nvoNylqbbqOLIxKmgmhj
 X1iwfXj/oQQ6uIFBQYOJ0l1UAR5EfIFi7w3gzteNnVeUFc1hsMAYzWEQ6jjEPT08ARK1fz
 NRX6W9bKFhxHA21SazMSKqbCQwX1+ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-4gsj2E1NPTOxfS86RZNLSA-1; Tue, 26 May 2020 04:02:47 -0400
X-MC-Unique: 4gsj2E1NPTOxfS86RZNLSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAAE9107ACCD;
 Tue, 26 May 2020 08:02:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F72B610AB;
 Tue, 26 May 2020 08:02:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 80EF217444; Tue, 26 May 2020 10:02:44 +0200 (CEST)
Date: Tue, 26 May 2020 10:02:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 00/14] hw/display: Omnibus cleanups
Message-ID: <20200526080244.cq7gqhriyr6aeke2@sirius.home.kraxel.org>
References: <20200526062252.19852-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200526062252.19852-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 01:19:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F0wehRQ4ZLDD

On Tue, May 26, 2020 at 08:22:38AM +0200, Philippe Mathieu-Daudé wrote:
> Hi Gerd, for your convenience I joined all the hw/display/
> patches I sent recently altogether in a series.

Nice service.  I was about to collect them from my inbox after sending
out the audio pull req ...

thanks,
  Gerd

