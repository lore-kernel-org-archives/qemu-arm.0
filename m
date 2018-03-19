Received: by 10.28.91.67 with SMTP id p64csp3037517wmb;
        Mon, 19 Mar 2018 13:37:48 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvSVZHhCGvhUcI1p6e0bpO79eBG/0MqN4d3aLRIghnrCiLqv1godwirHHMZdlntiYCN2myC
X-Received: by 10.55.75.194 with SMTP id y185mr19512706qka.34.1521491867681;
        Mon, 19 Mar 2018 13:37:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521491867; cv=none;
        d=google.com; s=arc-20160816;
        b=sliQ5u9Qzfn3TLhYf/DIJ2nYX29BM+XHKk/4WZe8pgoYPmLJPVZVjNY8kffz88zVgK
         cSsYhUZynTnwmbWHWt9aew55IiPM3rFuiq/urSXL2c6Pa+p8kFfs2dXB/efNpJ0EpbCH
         5xQWFST9wSqXd0oUzTTjlqW81ZefYJp+VmTYXGP1ou/RoIfcF2RpNopps7AyZACBJmyf
         R8y/bmcZkTt1wMjiTWtNmq1IcemGPhoO+hn1i9Aarz8myK7PMcOpZy5XJaE2CoA5BJxK
         InTaAhMTblVkGTUujmjtpaljo0IKXAOurWzqAYrA1G2/XP/hXu72rqMlWltaxv3uGfjT
         8wRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=p9t4vQVyjyGQph0U4fMP949pbQylLJsZjYXZ4BX7hxc=;
        b=OeWko/GfqXBo2KjIs0CeUxd3WMUeCz0Xj1xyRw7ii3qt1ifGzUrIAiZ8TOzVPZHlIh
         kC7XrqavW7HNlp7191s21Ig+LMk0Gu/zy2swOvxVfGnKvZ1VP+SN2XgKkEkZiTjw46JM
         MO1Utm1NtH3tqxwu89W3wwIMMZmuSChbxrahkX1pe8dMDyXTPfyinJhCK58OSHogI294
         FPbGIejGRQOrH2cukGATcC632TTz/9OiThP7tPnameLowJ2d1ADa/30RxnAPQmEqR+fL
         ObZ5XZB6HT1KlUyIan/bPcmq2cJWfdi7LQ1ajA465mGHPzlteC/lhrDnG1KQz49LYujC
         t26A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 62si994155qkb.155.2018.03.19.13.37.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 13:37:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ey1XO-0005Ry-QY
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 16:37:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ey1XD-0005RU-6n
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 16:37:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ey1X9-0002UA-VQ
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 16:37:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40596)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ey1X9-0002TM-Oi; Mon, 19 Mar 2018 16:37:31 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC9052D1D2;
	Mon, 19 Mar 2018 20:37:30 +0000 (UTC)
Received: from localhost (ovpn-116-4.gru2.redhat.com [10.97.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B15AD1E1;
	Mon, 19 Mar 2018 20:37:29 +0000 (UTC)
Date: Mon, 19 Mar 2018 17:37:28 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180319203728.GT3417@localhost.localdomain>
References: <1521452376-25099-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521452376-25099-1-git-send-email-thuth@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 19 Mar 2018 20:37:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH] tests/device-introspect: Test devices
 with all machines, not only with "none"
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
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DwuvT0cq+xYU

On Mon, Mar 19, 2018 at 10:39:36AM +0100, Thomas Huth wrote:
> Many device introspection crashes only happen if you are using a
> certain machine, e.g.:
> 
> $ ppc-softmmu/qemu-system-ppc -S -M ref405ep,accel=qtest -qmp stdio
> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 11, "major": 2},
>  "package": "build-all"}, "capabilities": []}}
> { 'execute': 'qmp_capabilities' }
> {"return": {}}
> { 'execute': 'device-list-properties',
>   'arguments': {'typename': 'macio-newworld'}}
> Unexpected error in qemu_chr_fe_init() at chardev/char-fe.c:222:
> Device 'serial0' is in use
> Aborted (core dumped)
> 
> To be able to catch these problems, let's extend the device-introspect
> test to check the devices on all machine types. Since this is a rather
> slow operation, the test is only run in "SPEED=slow" mode.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  In case someone wants to help with creating some bug fix patches
>  during the QEMU hard freeze phase: This test can now be used to
>  trigger lots of introspection bugs that we were not aware of yet.
>  I think most of the bugs are due to wrong handling of instance_init
>  vs. realize functions.
[...]

This looks very useful, thanks!

I wonder if we could have something that would make it simpler
for us to cover more command-line combinations + QMP commands in
simple "validate output and check if QEMU won't crash" test cases
without writing extra C or Python code every time.

device-crash-test could be used for that, but I'd like to make it
simpler to extend.

-- 
Eduardo
