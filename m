Received: by 10.25.208.211 with SMTP id h202csp890110lfg;
        Thu, 7 Apr 2016 23:21:35 -0700 (PDT)
X-Received: by 10.140.144.132 with SMTP id 126mr9458396qhq.102.1460096495528;
        Thu, 07 Apr 2016 23:21:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 76si8674749qhi.39.2016.04.07.23.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 23:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54171 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aoPnT-0000G7-1d
	for alex.bennee@linaro.org; Fri, 08 Apr 2016 02:21:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1aoPnP-0000DT-W2
	for qemu-arm@nongnu.org; Fri, 08 Apr 2016 02:21:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1aoPnO-0005Df-Q4
	for qemu-arm@nongnu.org; Fri, 08 Apr 2016 02:21:31 -0400
Received: from mail-ob0-x236.google.com ([2607:f8b0:4003:c01::236]:33621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1aoPnO-0005Db-JF; Fri, 08 Apr 2016 02:21:30 -0400
Received: by mail-ob0-x236.google.com with SMTP id tz8so61696589obc.0;
	Thu, 07 Apr 2016 23:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=yRdyLKzTnl6JKPWmTLFv7MV1KfsRFKo6mIzmM8hd2xk=;
	b=eCKMuInvPLRbCO5oG7AvKr3Pgs8ml8Y/OsIFzBnkgt2Uxi40tC5E7eLmDzyxXLYFKw
	oul5sO3nT1f7If8Dzk0GOkID6PRumBu9SVvfVjdWmyFKtKhp3Cotcyy5+qFCO2ASc4+B
	dYt8FzZF9biAqAoWCYVb5KDfd++KFymOlVcsIva+AsoUJMlIcoRnrdHUiFk2xRNrGcUp
	jvevkzFUGxdb65cwPMidBRp8cm7Nz1w1GXBoitQtjwNHmiDNeKWNh9PHOkqqNJQrCfK+
	QPu8dl8EZWXIXB6GEwfGXxjoA78PLBibywIMPuIw7AYfyRS+oIqwgJGyg9ZGcYgH/6Jr
	tDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=yRdyLKzTnl6JKPWmTLFv7MV1KfsRFKo6mIzmM8hd2xk=;
	b=YkAgrtuo0gYNmex3OoJ1HmpBRJfZSC+PwvRpuoOK6VZ6OHzAVXilq0CbGV+LfAFCWR
	ct/DjoVYpvqupnNqDVz/pyA5NnJZh6EOKavAQhgM6ECRbrl99Vbvey1/JfCTjXu6SL5F
	wVDzKzHPd64DCHVHJUtF62WzUbBbhD6x6JTJymxvJfAYCl2VPqQZvtmiUOS2j2om7p1s
	ddGjxHqKIN9bw9WscK2H6GShMqmYjxByqpax0rO8Q41msRk3VuqedurdF1PwB7hqowgZ
	jdReYCw/eK8nSR+pXqX13x58wAT5SU3sMxLfoI57v5lu2OYQj3B+wMw11icIXEE8Os1M
	qQpw==
X-Gm-Message-State: AD7BkJL/EcxBvmx6kNDkU1CnaXQ3ooORxEi5rihMQH/uWLOT+DS7L7oDkhdqrbTXZ1/GnDMwhp8enGoxFcAUOQ==
MIME-Version: 1.0
X-Received: by 10.60.80.196 with SMTP id t4mr3626117oex.51.1460096489917; Thu,
	07 Apr 2016 23:21:29 -0700 (PDT)
Received: by 10.157.29.134 with HTTP; Thu, 7 Apr 2016 23:21:29 -0700 (PDT)
In-Reply-To: <CAFEAcA8T-90NFw_fMWRZ7JuQ4UpxRGfwsbHLi9cigsiD=zXupA@mail.gmail.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_0ssT32oNrgTHChKsAJNkjUfCHFGg2vPtk8-AWsRjVqw@mail.gmail.com>
	<CALicx6tM6__TWjVPLdNzMMpoyQYHZOnArFwz4E+QyyxN7TLruQ@mail.gmail.com>
	<CAFEAcA8T-90NFw_fMWRZ7JuQ4UpxRGfwsbHLi9cigsiD=zXupA@mail.gmail.com>
Date: Fri, 8 Apr 2016 11:51:29 +0530
Message-ID: <CALicx6ubAgfGJhGX5wRTeHfmj_RHX__hkJxAnBA8v=e8n=HgZg@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::236
Subject: Re: [Qemu-arm] [RFC PATCH v2 2/3] utils: Add cpuinfo helper to
 fetch /proc/cpuinfo
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
Cc: Vijaya Kumar K <vijayak@caviumnetworks.com>,
	suresh knv <knv.suresh2009@gmail.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Suresh <ksuresh@caviumnetworks.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qRnMkEtBc8QO

Hi Peter,

On Thu, Apr 7, 2016 at 5:15 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 7 April 2016 at 11:56, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>> On Thu, Apr 7, 2016 at 3:41 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 7 April 2016 at 10:58,  <vijayak@caviumnetworks.com> wrote:
>>>> From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>
>>>>
>>>> utils cannot read target cpu information to
>>>> fetch cpu information to implement cpu specific
>>>> features or erratas. For this parse /proc/cpuinfo
>>>> and fetch cpu information.
>>>>
>>>> For now this helper only fetches cpu information
>>>> for arm architectures.
>>>
>>> As I understand it /proc/cpuinfo is intended only for
>>> humans to read. Please don't write code to parse it;
>>> find a different way to get this information instead
>>> if you really need it.
>
>> Also unlike x86 there is no cpuid.h where we can get cpu identification
>> information for arm64.
>
> I'm told there are kernel patches in progress to get this sort
> of information in a maintainable way to userspace, which are
> currently somewhat stalled due to lack of anybody who wants to
> consume it. If you have a use case then you should probably
> flag it up with the kernel devs.

Can you please give references to those patches/discussion?

>
> That said, I think we should probably hold off on this
> discussion until we have clearer benchmarking info that
> demonstrates that doing these prefetches really does make
> a significant difference. I would much prefer to have a


Thunderx pass2 board does not have hardware prefetch. So
explicit sw prefetch instructions is required for this platform.
Here is the benchmarking result with and without prefetch.
of an idle VM with 4 VCPUS, 8GB RAM.

Without prefech, total migration time is 8.2 seconds
With prefetch total migration time is 2.7 seconds.

Without prefetch:
------------------------

(qemu) info migrate
capabilities: xbzrle: off rdma-pin-all: off auto-converge: off
zero-blocks: off compress: off events: off x-postcopy-ram: off
Migration status: completed
total time: 8217 milliseconds
downtime: 86 milliseconds
setup: 4 milliseconds
transferred ram: 212624 kbytes
throughput: 212.08 mbps
remaining ram: 0 kbytes
total ram: 8520128 kbytes
duplicate: 2085805 pages
skipped: 0 pages
normal: 48478 pages
normal bytes: 193912 kbytes
dirty sync count: 3

With prefetch:
--------------------
(qemu) info migrate
capabilities: xbzrle: off rdma-pin-all: off auto-converge: off
zero-blocks: off compress: off events: off x-postcopy-ram: off
Migration status: completed
total time: 2744 milliseconds
downtime: 48 milliseconds
setup: 5 milliseconds
transferred ram: 213526 kbytes
throughput: 637.76 mbps
remaining ram: 0 kbytes
total ram: 8520128 kbytes
duplicate: 2085014 pages
skipped: 0 pages
normal: 48705 pages
normal bytes: 194820 kbytes
dirty sync count: 3

> single aarch64 routine that works for everybody, rather
> than a thunderx-only special case.

Now, I found that the generic existings function by name
buffer_find_nonzero_offset_inner()
 can be made to work with neon. So no need of special function by name
buffer_find_nonzero_offset_neon() for arm64 creating in this patch series.
However, adding prefetch code needs to be added for performance
reason.
