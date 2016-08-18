Received: by 10.25.21.156 with SMTP id 28csp227490lfv;
        Thu, 18 Aug 2016 02:39:42 -0700 (PDT)
X-Received: by 10.200.50.20 with SMTP id x20mr1227810qta.71.1471513182592;
        Thu, 18 Aug 2016 02:39:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k67si694496qkc.67.2016.08.18.02.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 02:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baJna-0005Yj-3a
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 05:39:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1baJnW-0005X9-Rg
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 05:39:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1baJnT-0002kn-5r
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 05:39:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54248)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1baJnT-0002ki-0o; Thu, 18 Aug 2016 05:39:35 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 637603F725;
	Thu, 18 Aug 2016 09:39:34 +0000 (UTC)
Received: from [10.36.112.31] (ovpn-112-31.ams2.redhat.com [10.36.112.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7I9dU1m029670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Aug 2016 05:39:31 -0400
To: Vijay Kilari <vijay.kilari@gmail.com>
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
	<1471348968-4614-2-git-send-email-vijay.kilari@gmail.com>
	<151e49bd-d79d-0035-c775-86be29df3ac2@redhat.com>
	<CALicx6vzQyvhQPM2qgN1wkT_M+vr2WL+H5pc9HhuB=kWVU-JnQ@mail.gmail.com>
	<59517fd9-049c-adfc-5793-68165fe87f34@redhat.com>
	<CALicx6tGZ1z68nTBdYrSTcdBzCQwzHtGJ-DixKJjKSq7-cfkHw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f5f56ea7-795e-81d3-6892-f30772631e53@redhat.com>
Date: Thu, 18 Aug 2016 11:39:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CALicx6tGZ1z68nTBdYrSTcdBzCQwzHtGJ-DixKJjKSq7-cfkHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 18 Aug 2016 09:39:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH v2 1/2] utils: Add helper to read arm
 MIDR_EL1 register
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
	"prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WKxMbx6wDr4c



On 18/08/2016 11:01, Vijay Kilari wrote:
> On Thu, Aug 18, 2016 at 2:20 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>>
>> On 18/08/2016 09:56, Vijay Kilari wrote:
>>> The get_aarch_cpu_id() has check " if (unlikely(!cpu_info_read)) ".
>>> If we call get_aarch_cpu_id() from is_thunderx_pass2_cpu() which is
>>> called from inside the loop, we will be adding one additional check.
>>
>> On the other hand, you are making an assumption that the caller of
>> is_thunderx_pass2_cpu() calls get_aarch64_cpu_id() first, and not
>> documenting it anywhere.
>>
>> And given that you shouldn't call _any_ function from inside such a hot
>> loop, your solution is inferior on both counts.
> 
> Yes, but I could not think of better way to get rid of this check.

    bool need_aa64_prefetch = is_thunderx_pass2();
    for (...) {
         if (need_aa64_prefetch) {
             ...
         }
    }

The check on cpu_info_read is done just once.

Paolo

 However
> as Richard suggested (in another email), to drop this check and let prefetch
> be called for all the arm64 architectures. But I don't have any other
> arm64 platform
> to check the impact of it.
> 
>>
>> Paolo
>>
>>> What I observed is having extra check inside the loop is adding 100 to
>>> 200ms overhead
>>> on live migration time. So I added this variable extra is_thunderx_cpu
>>> static variable
>>> to make it simple single check.
>>
