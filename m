Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1644249wru;
        Wed, 3 Jul 2019 23:19:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZ7A87K3ZegalrBN/8Z6KkKtfypGirvVWfdLmIt+yPIL603hhAPFrikHuNFDVApzsROyHd
X-Received: by 2002:a05:6402:12d2:: with SMTP id k18mr46196421edx.197.1562221152219;
        Wed, 03 Jul 2019 23:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562221152; cv=none;
        d=google.com; s=arc-20160816;
        b=XhpGk8TZLt0sXe92+wdhmykAvwfxTEKZk2M9kV3uUA3eae9jVpMIJWSTpUmAQ1lSlQ
         nsfyArCRSrUAD/FzZfy9fnYX48ipXmhL8U+Q37mu6L9Pi/o69s6xl5OfnNlHAknp9UMV
         JLZXvSd/QF5PoyclmFDfI/8Li7Ko+OMEPQ+SL7NU6vt3F1ZG116h2lsta6iqudRLAY+q
         c2G6lDY0MDQwSPGSWa6rC46GI3lNHWf4H83zcPa/yPUBQ7Oek3kh8+iiLhOH4GQDKtXM
         AV1Pjv7tiUc1OU65DNdQ/w4D87BmrGBT1ie+4QLagdo4zFkgDaxdm1Q7Sbt6iVVz5wGV
         AdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :message-id:in-reply-to:to:from:date;
        bh=8JtkDUp4J//q7U+c0rnGUXtChfJ3q4cZvw/NwmO9GQw=;
        b=yBltVDjKFne09CioZERwHgZyusZcGQJmDh+ClP9zeIdFG98SuPfdZr3UZEcKv4BJdM
         p4Ej6OFFjM6CyUV/r9EctV+PNeWW6xoyiuKESRylJz/n1iQKURQmQs5JY7a1njhirh1i
         eNzYGTSuLHO7erk4JClr6qHjdu8g5Y4pj7y7M9NhNL5CLdeo460/E31fIDKK8nlo188E
         h/vXdanBLsN8PaHNVLq5xUq6pfnPDOsMaTrEck7QSXXi61759w4b2h9G20Ht5oUoTbry
         EcSW2YU/vaXfE9rQksKokMLFtyQhQRay0inxYgAOu4inLeuwLY+KeASrpO5eQAs5L9rl
         SWdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si3851901edy.420.2019.07.03.23.19.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2019 23:19:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiv5K-0003I3-A7
	for alex.bennee@linaro.org; Thu, 04 Jul 2019 02:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38282)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hiv4p-0003Hu-UJ
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 02:18:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hiv4o-0001yi-Am
 for qemu-arm@nongnu.org; Thu, 04 Jul 2019 02:18:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34192)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>)
 id 1hiv4n-0001xy-Og; Thu, 04 Jul 2019 02:18:37 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C84DD300194A;
 Thu,  4 Jul 2019 06:18:30 +0000 (UTC)
Received: from kaapi (ovpn-116-120.sin2.redhat.com [10.67.116.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 829DA3795;
 Thu,  4 Jul 2019 06:18:28 +0000 (UTC)
Date: Thu, 4 Jul 2019 11:48:25 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: qemu-devel@nongnu.org
In-Reply-To: <156220045355.21218.10996548601675268562@c4a48874b076>
Message-ID: <nycvar.YSQ.7.76.1907041145470.6795@xnncv>
References: <156220045355.21218.10996548601675268562@c4a48874b076>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 04 Jul 2019 06:18:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/ssi/xilinx_spips: add
 lqspi_write routine
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, slei.casper@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mOzxbaeE61IR

+-- On Wed, 3 Jul 2019, no-reply@patchew.org wrote --+
| Patchew URL: https://patchew.org/QEMU/20190703190615.31436-1-ppandit@redhat.com/
| 
| This series failed the asan build test. Please find the testing commands and
| their output below. If you have Docker installed, you can probably reproduce it
| locally.
| 
| === TEST SCRIPT BEGIN ===
| #!/bin/bash
| make docker-image-fedora V=1 NETWORK=1
| time make docker-test-debug@fedora TARGET_LIST=x86_64-softmmu J=14 NETWORK=1
| === TEST SCRIPT END ===

This patch does not build for x86_64 target. Not sure what's causing the test 
failure.

--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F
