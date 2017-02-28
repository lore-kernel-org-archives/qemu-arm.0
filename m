Received: by 10.25.0.147 with SMTP id 141csp1455738lfa;
        Tue, 28 Feb 2017 07:59:42 -0800 (PST)
X-Received: by 10.55.214.209 with SMTP id p78mr3384681qkl.255.1488297582496;
        Tue, 28 Feb 2017 07:59:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33si1773207qth.121.2017.02.28.07.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Feb 2017 07:59:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cikBf-00079p-RZ
	for alex.bennee@linaro.org; Tue, 28 Feb 2017 10:59:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cikBX-00078C-Pd
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 10:59:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1cikBS-0004hA-Va
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 10:59:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53914)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1cikBS-0004h5-Pm; Tue, 28 Feb 2017 10:59:26 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDE4C33884C;
	Tue, 28 Feb 2017 15:59:26 +0000 (UTC)
Received: from [10.36.117.252] (ovpn-117-252.ams2.redhat.com [10.36.117.252])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v1SFxOu7011687
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 28 Feb 2017 10:59:25 -0500
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1488293711-14195-1-git-send-email-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <516283e2-27bc-83a3-de86-1df72f2daad2@redhat.com>
Date: Tue, 28 Feb 2017 16:59:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1488293711-14195-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 28 Feb 2017 15:59:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 0/4] handle reparenting of SD cards for rpi2
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
Cc: Clement Deschamps <clement.deschamps@antfield.fr>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f6y7qaLKGs4i



On 28/02/2017 15:55, Peter Maydell wrote:
> These patches are a respin of Clement's work on the
> rpi2 sd controller/gpio. They fix the valgrind issue that
> I was seeing because we got reparenting of the card wrong.
> 
> This patchset adds a new qdev patch which makes the
> qdev_set_parent_bus() function do most of the work of
> unplugging and replugging if the device was already on
> a bus. In particular it calls bus_remove_child() which does
> a lot of things that the previous "just call object_unparent"
> attempt didn't do.
> 
> Comments on whether this makes sense to people welcome.
> I'm still kind of hoping we can squeeze this into 2.9;
> comments on whether that would be unwise also welcome.

Looks good.  My first reaction was to add an assertion in
qdev_set_parent_bus, modify it to handle qdev_set_parent_bus(dev, NULL),
and then do a two-step unplug+replug in the raspi device models.

However, who knows what you could unleash when adding that assertion...

Paolo
