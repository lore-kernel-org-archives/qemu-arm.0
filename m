Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp464918lfc;
        Wed, 11 Mar 2020 01:16:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv8BBlX9T02yIpyIl5Ejlkx28kjRO0EBfwCbRN+HJIdFvnCshsKFeVfCarkv1QayM2mnIYU
X-Received: by 2002:ad4:58d1:: with SMTP id dh17mr1776244qvb.121.1583914565636;
        Wed, 11 Mar 2020 01:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583914565; cv=none;
        d=google.com; s=arc-20160816;
        b=USTX/TOP8ffAWNjf31wmjHBeik6UOlmXapjBT4TkaBWySC7etRLcOlqR7x2bZz8kOL
         za1Z84YeFqVCMvd/AiHv4O8xEjA/lEmVbfEaCWWgfATg1inkhokdA3gZmiaa66b8BJcI
         R+po7L8WFswFmLSGJRX/2CUDirYV5EeJArMBNOgrp58rU8IGrDjX9tofgboRuuvu4Ks6
         Td9VepD358QlIQ21wWTKjKoMzJXXysqirVRzGiQx6Si7PJENeyd465ozPSnuuqxlLvVm
         P8+FQZWxJD7T2cPKL824TzYpBhvfHAt+DEpvqpm2xcjwAmbn1L8Ebe6I6pgZd4KfSVjg
         3yew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=IVsgANGq7xvj2F/J9GyXr61+wsMoZpXHOc0Sgji+ejs=;
        b=uP4SplS98HX76Dq8kWNuBgTz7gZgdD3AbSFjHV+ubh1NmD/4BRV9hfFhwZSTuOv6Ui
         lcwNOgs0eZCOcFFvdpNlvcJU42FK+ThzDRzBr2F7Sj0m778fpIb7UdaKMMQt1eRSk4Ci
         vAC8p85embOQU2ftSEP5djx8QUXiZblqMQGtltBmXGPn7GcMdZC9drOwMPxPkSbZPez6
         zPu31P2N9qds+g6Lz5WVGNKduYUXpD4I+jSSA9OVNRLImOSJkyAlfc9YnYxLj8pYD22q
         MFdrsg9940Hev9wdcFj+XxiFsHcFvckIt6joSjJ8S03dd/B4uy/Vc7egCLeSA+MAktBo
         BEJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ejp3Pw5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a28si581756qto.295.2020.03.11.01.16.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 01:16:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ejp3Pw5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBwX7-0001sv-4n
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 04:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59539)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1jBwX0-0001sh-4q
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 04:15:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1jBwWy-0008DS-QX
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 04:15:57 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46906
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1jBwWy-0008D3-MG
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 04:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583914556;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVsgANGq7xvj2F/J9GyXr61+wsMoZpXHOc0Sgji+ejs=;
 b=ejp3Pw5dLAZpUstMowHucC6my1NqkRY6BW0rCPfQOzy3kD9D73jzFoSzchNLFmBvO2+5lj
 5qkrMs5jk1PrAZ+M1ddE1jpmNZkoo9/2yNh/ydjdijvOXIA/5Mr4XFZgbyNuUbFeMIqOhN
 DfabcwH/h2jkj179HMF8vBSqdlOyAok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-JTVUCjd-M2uooFXWXrpUqg-1; Wed, 11 Mar 2020 04:15:43 -0400
X-MC-Unique: JTVUCjd-M2uooFXWXrpUqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F34DE800D50;
 Wed, 11 Mar 2020 08:15:41 +0000 (UTC)
Received: from localhost.localdomain (vpn2-54-67.bne.redhat.com [10.64.54.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0779091D74;
 Wed, 11 Mar 2020 08:15:39 +0000 (UTC)
Subject: Re: [PATCH v3] hw/char/pl011: Enable TxFIFO and async transmission
To: qemu-devel@nongnu.org
References: <158390180818.945.5263842815462048004@39012742ff91>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <8b9f1061-5a13-2e45-fe8d-8f72d4a170cb@redhat.com>
Date: Wed, 11 Mar 2020 19:15:38 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <158390180818.945.5263842815462048004@39012742ff91>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: as7a8x7im772

On 3/11/20 3:43 PM, no-reply@patchew.org wrote:
[...]
> http://patchew.org/logs/20200311040923.29115-1-gshan@redhat.com/testing.asan/?type=message.

Is it possible to be a false alarm? The detailed errors extracted from above
link is shown as below, and I'm unable to reproduce it at local:

Error message
=============

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}  QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64 QTEST_QEMU_IMG=qemu-img tests/qtest/dbus-vmstate-test -m=quick -k --tap < /dev/null | ./scripts/tap-driver.pl --test-name="dbus-vmstate-test"
dbus-daemon[8241]: Could not get password database information for UID of current process: User "???" unknown or no memory to allocate password entry
dbus-daemon[8241]: Could not get password database information for UID of current process: User "???" unknown or no memory to allocate password entry


[gwshan@localhost qemu.main]$ MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}  QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64 QTEST_QEMU_IMG=qemu-img tests/qtest/dbus-vmstate-test -m=quick -k --tap < /dev/null | ./scripts/tap-driver.pl --test-name="dbus-vmstate-test"
PASS 1 dbus-vmstate-test /x86_64/dbus-vmstate/without-list
PASS 2 dbus-vmstate-test /x86_64/dbus-vmstate/with-list
PASS 3 dbus-vmstate-test /x86_64/dbus-vmstate/only-a
PASS 4 dbus-vmstate-test /x86_64/dbus-vmstate/missing-src
PASS 5 dbus-vmstate-test /x86_64/dbus-vmstate/missing-dst

Thanks,
Gavin

