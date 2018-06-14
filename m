Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1738666wrq;
        Thu, 14 Jun 2018 01:32:54 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKJNFqi+32zuthwOOMKbK8EmccNghcPg2LCb2Crl+UWLi5EgEwfCC79062e0/TRpMQf71VY
X-Received: by 2002:ac8:388:: with SMTP id t8-v6mr1375744qtg.194.1528965174461;
        Thu, 14 Jun 2018 01:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528965174; cv=none;
        d=google.com; s=arc-20160816;
        b=MWRh/VR/3c6R+x5VW6mqkjjGuZgog2iwS/nZrlYwixq/6jwcTVnFdQYtqQDhoUxapW
         ylwrtSjp93180BcumKYeQ4ZmOWCDPk0bPcOwX5ui43qJ/A1rH9xLC5aVP5PsFBgq2re7
         M7KUjvfrLWaKMaVNwlphKVqFFjs8rBMoFn9FxJLFzJhPmUkp1+06BsNe9jT/DFJ/eIeF
         GL7NP5sctpmvmCynUNevMbGP23CE1w2ouR3+0Z19UDvdtW6cKZIrMLTDdZk33zqGZIKV
         lJA1n0sKZmHuCL7MpiwJU1FUfzJH09PSSCF3euztTZiidREujiI3YL/fzuQ1N9Od89kU
         3Abw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=xT5r9mbL1j5rOJnnR6GrM96Rfev144WhDoNlkxzLk4Y=;
        b=SohQ+9l8udcBiF5vCGboDZ/OQkoDzgHBfK2nweG3QgwlBp3jGZRQDkotcpxWSDQCSc
         it06zuivn0MyUX3B4gpEvjhGezlSm3Wtzf7Z/BJ/O3lgf6Ph0ttbCa24YD/rrVzv7ww0
         9E5pyQw5EYFfpvHh5rryGwh/VFUgnn3NmWaXfYOj4yRlrPRjLkW7NH5u3fm+Fiqokr6Z
         X2x4o7B/0KuyZr9Cp0yPtQAe2o95lKhqc0xRtCqSL6jD9RZBO4OHi1lFDwfQ/SShQf4z
         g0t5ny8v9YKu8LMr+Sd7W7/mv0wIiiXrSDgEMBi1nPWSEcWGQgjFIROqdLI9zGxF53ez
         nqIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37-v6si202725qtn.360.2018.06.14.01.32.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jun 2018 01:32:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39222 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTNgc-0006zo-0M
	for alex.bennee@linaro.org; Thu, 14 Jun 2018 04:32:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fTNgV-0006zd-TB
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 04:32:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fTNgR-0000aZ-UK
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 04:32:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51148 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fTNgR-0000aQ-Px; Thu, 14 Jun 2018 04:32:43 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 251E24023132;
	Thu, 14 Jun 2018 08:32:43 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-139.rdu2.redhat.com
	[10.10.120.139])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0483320284D6;
	Thu, 14 Jun 2018 08:32:40 +0000 (UTC)
To: Gerd Hoffmann <kraxel@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>
References: <20180613084149.14523-1-kraxel@redhat.com>
	<20180613084149.14523-4-kraxel@redhat.com>
	<20180613135047.5c1ce227@w520.home>
	<20180613223625.lf6xkzgipzkfslit@sirius.home.kraxel.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <c259c930-6082-cb2b-5adf-d8f6c9de7100@redhat.com>
Date: Thu, 14 Jun 2018 10:32:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180613223625.lf6xkzgipzkfslit@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 14 Jun 2018 08:32:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 14 Jun 2018 08:32:43 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v4 3/3] hw/vfio/display: add ramfb support
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Laine Stump <laine@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TBlN2YqFgLFn

On 06/14/18 00:36, Gerd Hoffmann wrote:
> On Wed, Jun 13, 2018 at 01:50:47PM -0600, Alex Williamson wrote:

>> I suppose in the UEFI case runtime services can be used to continue
>> writing this display,
> 
> Yes.

Small clarification for the wording -- "UEFI runtime services" do not
include anything display- or graphics-related. Instead, the OS kernel
may inherit the framebuffer properties (base address, size, pixel
format), and continue accessing the framebuffer directly.

Thanks
Laszlo
