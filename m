Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp457863wrg;
        Mon, 20 May 2019 10:52:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwPVwqjtimCStNGt+q+ryP/ZpfFywbACSAXTEe77g9EFEDkOIFlZ7LsoH2HwzN5M7rOS+zo
X-Received: by 2002:a50:f599:: with SMTP id u25mr77718886edm.102.1558374777816;
        Mon, 20 May 2019 10:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558374777; cv=none;
        d=google.com; s=arc-20160816;
        b=iIjVMnk/5AkLsyqJPg8CNnkWpaWS96Y8z0NKZ08wMDe9rR3MVH3acTOSQYKLifd9iO
         8tgLBInSa9l5RmqgmA69JVc1fJM+xaZkOmjbT5uskKW8C9zQRexZI0YHKRRuqR5ncJWl
         oYX9kdWZ7qFTjXxhTemm7IXtcyWVPM1iyVoQzKn1eM5nrX2HGGnxKubKg61PCl6FkICn
         mialgcXo2xnZ/hrr+aNTVEqDVXZogU5gMomGeBB+Uytcj82lCz3XF2ZXSwAb1NolLppH
         p8n3jR1aHL3gD7x35T65xBJKVe5e6pGA8mXaifZy+nE+gbRZ5H8ywrY0a2cIpAnwEA3i
         978w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent
         :content-disposition:mime-version:message-id:to:from:date;
        bh=FBC222hiUGYMsVrQuYv38PHwrw2yueT6Sl6CAvNe33c=;
        b=WruQlQcr3AWlScpUHnMC3wKrs094EKCYlLaqt9O2gkeIsQ2q6DPxVr9nbgKRxkoMCT
         0lynZqPbk2/4PyK4oAzClB1On57qc36VmQouUBkq+eEXI7AIUaXZBmPHOWIpCJccnYvo
         alx+zGTtdGZggGA9BDpZfqlWzDApMhEtgIQrgwLAmHpjTmTr8KOEVFnXHwd4HOHieUhl
         ETNfpTx192QXJfMvnlfxLZ7lwxdVprCkMToLYHYVMaa3s/IPFHgp9JDPBsjnMXQ9yR2R
         86xmW9mT7dW6EMbcJj6RNdyMzDHV60FnYnz3H6fPbiW33r5tJdUrY9Ab8CgweQkPjDk1
         pD9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 34si874728edz.153.2019.05.20.10.52.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 10:52:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39629 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSmT2-000884-Rk
	for alex.bennee@linaro.org; Mon, 20 May 2019 13:52:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hSmOZ-0004eB-2G
	for qemu-arm@nongnu.org; Mon, 20 May 2019 13:48:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1hSmOX-00015p-NA
	for qemu-arm@nongnu.org; Mon, 20 May 2019 13:48:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49042)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>) id 1hSmOX-0000yD-GP
	for qemu-arm@nongnu.org; Mon, 20 May 2019 13:48:17 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24F9085539;
	Mon, 20 May 2019 17:48:03 +0000 (UTC)
Received: from dhcp-17-231.bos.redhat.com (dhcp-17-231.bos.redhat.com
	[10.18.17.231])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEF42100203C;
	Mon, 20 May 2019 17:48:00 +0000 (UTC)
Date: Mon, 20 May 2019 13:47:58 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190520174758.GA31098@dhcp-17-231.bos.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 20 May 2019 17:48:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [BUG] qemu-system-arm/aarch64 QMP hangs after kernel
 boots
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Qx2mYE/RHdB

Hi,

This is just a FIY about the following bug report:

 - https://bugs.launchpad.net/qemu/+bug/1829779

And add some extra clarifications that I've tested extensively the
behavior of other targets (all that have a similar test under
tests/acceptance/boot_linux_console.py) and none exhibited the same
behavior.

Also, because qemu-system-arm and aarch64 sometimes fails on the very
first QMP command, the regular boot test sometimes will hang on a
"quit" command that happens when the test run its "tear down" and
attempts to cleanly shut down the "vm".

Let me know if I can be of any further help.

Thanks,
- Cleber.
