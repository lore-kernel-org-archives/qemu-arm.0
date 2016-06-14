Received: by 10.25.21.96 with SMTP id l93csp100289lfi;
        Tue, 14 Jun 2016 07:08:26 -0700 (PDT)
X-Received: by 10.141.0.133 with SMTP id b127mr20769031qhd.9.1465913306328;
        Tue, 14 Jun 2016 07:08:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d143si18457970qhc.106.2016.06.14.07.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 07:08:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35547 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCp0z-0006eM-NU
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 10:08:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCoxy-0003Kv-Ll
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 10:05:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bCoxt-0005Vn-LX
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 10:05:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59056)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bCoxt-0005Vh-GJ; Tue, 14 Jun 2016 10:05:13 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECBF77F6A7;
	Tue, 14 Jun 2016 14:05:12 +0000 (UTC)
Received: from [10.36.112.73] (ovpn-112-73.ams2.redhat.com [10.36.112.73])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5EE57CO010007
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 14 Jun 2016 10:05:09 -0400
To: Andrew Jones <drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-7-git-send-email-drjones@redhat.com>
	<d4b656c3-757d-7922-bd1b-38b4101a4519@redhat.com>
	<20160613203529.6ln7dlgnrcgda5x4@hawk.localdomain>
	<60ee196d-0292-3fb4-5d59-68c2d742eaa4@redhat.com>
	<20160614113904.2u5qvf7kasv5hact@hawk.localdomain>
	<c1f094e3-c41b-88d3-9bf2-91b334d9513a@redhat.com>
	<20160614140329.6oz6mzlgs4gswjls@hawk.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <587c43df-c1f3-38ed-e241-f7f7654cd173@redhat.com>
Date: Tue, 14 Jun 2016 16:05:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <20160614140329.6oz6mzlgs4gswjls@hawk.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 14 Jun 2016 14:05:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 06/16] vl: move smp parsing
 to machine pre_init
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	imammedo@redhat.com, dgibson@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i7n2xhaM/s/k



On 14/06/2016 16:03, Andrew Jones wrote:
> However, I just chatted with Igor, and he says cpu hotplug operates
> on logical processors, and thus it's fine to talk about hotplugging
> threads. Even real hardware does this. Real hardware will plug a
> socket full of threads, but then the firmware may keep most of them
> disabled until they're "hotplugged". So, I think the value of cpus
> can be anything. Even the useless value of zero.

Fair enough!

> I'd keep =0 allowed. In most cases it just means =1, same as if the
> property wasn't input. In some cases, cpus,maxcpus it creates a
> useless machine, but maybe could accelerate QEMU runs for the purpose
> of probing? Eh, it probably adds more complication than necessary...
> Considering cpus should mean logical processors, I think that can
> have any value on (0, maxcpus]

Ok.  The machine can warn if necessary.

Paolo
