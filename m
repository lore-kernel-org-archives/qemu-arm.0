Received: by 10.25.21.156 with SMTP id 28csp2524783lfv;
        Wed, 17 Aug 2016 06:40:26 -0700 (PDT)
X-Received: by 10.55.5.17 with SMTP id 17mr43669176qkf.283.1471441226630;
        Wed, 17 Aug 2016 06:40:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1si18581741qkd.137.2016.08.17.06.40.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Aug 2016 06:40:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ba150-0000yo-0I
	for alex.bennee@linaro.org; Wed, 17 Aug 2016 09:40:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ba14t-0000w9-AJ
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 09:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ba14n-0004D3-Hr
	for qemu-arm@nongnu.org; Wed, 17 Aug 2016 09:40:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45494)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ba14n-0004Co-CA; Wed, 17 Aug 2016 09:40:13 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D55A68553F;
	Wed, 17 Aug 2016 13:40:12 +0000 (UTC)
Received: from [10.36.112.58] (ovpn-112-58.ams2.redhat.com [10.36.112.58])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7HDe7Sr025500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 17 Aug 2016 09:40:09 -0400
To: qemu-devel@nongnu.org, vijay.kilari@gmail.com
References: <20160816160204.482798.21750@ex-std-node742.prod.rhcloud.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6a7cee37-10e5-5ead-8618-d78a4c377327@redhat.com>
Date: Wed, 17 Aug 2016 15:40:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160816160204.482798.21750@ex-std-node742.prod.rhcloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 17 Aug 2016 13:40:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH v2 0/2] Live migration
 optimization for Thunderx platform
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
Cc: peter.maydell@linaro.org, famz@redhat.com, Prasun.Kapoor@cavium.com,
	p.fedin@samsung.com, Vijaya.Kumar@cavium.com,
	qemu-arm@nongnu.org, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: peAAy3vqYQnt



On 16/08/2016 18:02, no-reply@ec2-52-6-146-230.compute-1.amazonaws.com
wrote:
> ERROR: architecture specific defines should be avoided
> #24: FILE: include/qemu/aarch64-cpuid.h:4:
> +#if defined (__aarch64__)
> 
> ERROR: architecture specific defines should be avoided
> #62: FILE: util/aarch64-cpuid.c:18:
> +#if defined (__aarch64__)

You can ignore these two, but the others have to be fixed (just use #ifdef).

Paolo
