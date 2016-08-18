Received: by 10.25.21.156 with SMTP id 28csp509962lfv;
        Thu, 18 Aug 2016 14:20:41 -0700 (PDT)
X-Received: by 10.237.45.135 with SMTP id i7mr4998464qtd.30.1471555240963;
        Thu, 18 Aug 2016 14:20:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n187si2549688qkf.84.2016.08.18.14.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Aug 2016 14:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1baUjw-0006Ge-0Q
	for alex.bennee@linaro.org; Thu, 18 Aug 2016 17:20:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laine@redhat.com>) id 1baUjs-0006GW-Gp
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 17:20:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laine@redhat.com>) id 1baUjo-0004xM-3p
	for qemu-arm@nongnu.org; Thu, 18 Aug 2016 17:20:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laine@redhat.com>)
	id 1baUjn-0004xH-U3; Thu, 18 Aug 2016 17:20:32 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE0EC19CFF0;
	Thu, 18 Aug 2016 21:20:30 +0000 (UTC)
Received: from vlap.laine.org (ovpn-116-25.phx2.redhat.com [10.3.116.25])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7ILKSFd008847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 18 Aug 2016 17:20:29 -0400
To: QEMU Developers <qemu-devel@nongnu.org>
References: <CAN76PtR4dBm8DgTMGE73zSN1aYzbYY-ohnAveUbm_XQmWKm+bQ@mail.gmail.com>
	<20160817161303.jdglwirs522vn2wa@kamzik.localdomain>
	<45cfb252-6690-f274-d641-d1d3bff29ae3@redhat.com>
	<3a31e28f-15d6-d061-abc8-264a51375f96@redhat.com>
From: Laine Stump <laine@redhat.com>
Message-ID: <bb83a727-a34b-9111-9d06-0b26649b66c6@redhat.com>
Date: Thu, 18 Aug 2016 17:20:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <3a31e28f-15d6-d061-abc8-264a51375f96@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 18 Aug 2016 21:20:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] Help: Does Qemu support virtio-pci for
 net-device and disk device?
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Kevin Zhao <kevin.zhao@linaro.org>,
	Gema Gomez-Solano <gema.gomez-solano@linaro.org>,
	Marcel Apfelbaum <mapfelba@redhat.com>,
	Andrea Bolognani <abologna@redhat.com>,
	Thomas Hanson <thomas.hanson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gw2WsTISvg6i

On 08/18/2016 08:10 AM, Marcel Apfelbaum wrote:
> On 08/17/2016 08:00 PM, Laine Stump wrote:

>
>  What I'm not sure about is whether we should always auto-add an extra
> pcie-*-root to be sure a device can be hotplugged, or if we should admit
> that 1
>> available slot isn't good enough for all situations, so we should
>> instead just leave it up to the user/management to manually add extra
>> ports if they think they'll want to hotplug something later.
>
> Why not? Leaving 1 or 2 PCIe ports should be enough. On each port you
> can hotplug a switch with several downstream ports. You can continue
> nesting the switches up to depth of 6-7 I think.

When did qemu start supporting hotplug of pcie switch ports? My 
understanding is that in real hardware the only way this is supported is 
to plug in the entire "upstream+downstream+downstream+..." set as a 
single unit, since there is no mechanism for guest kernel to notify the 
upstream port that a new downstream port has been attached to it (or 
something like that; I'm vague on the details). From the other end, qemu 
can only hotplug a single PCI device at a time, so by the time we get to 
the point of plugging in the downstream ports, the upstream port is 
already cemented in place by the guest kernel.

I think that would be a really desirable feature though. Maybe qemu 
could queue up any downstream-ports which are pointing to an 
as-yet-nonexistent upstream-port id, then when the upstream-port with 
the proper id is finally attached, it could send the right magic to the 
guest (similar to the way it allows hotplugging all non-0 functions 
first, then takes action when function 0 is hotplugged).

If that was available, then yes, it would make perfect sense for libvirt 
to simply always make sure at least one empty pcie-*-port was available. 
If you have plans of doing something to support hotplugging a 
pcie-switch-* collection, then that's what I'll do.

