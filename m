Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp5422653wrx;
        Tue, 26 Mar 2019 11:42:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzSvDf2qiAz2urbqw7THYvgeBDbRyGR0is6lyzeTRGxa4ztbdQWaAhrU0ArHGgNtJYJjsOy
X-Received: by 2002:a24:dc41:: with SMTP id q62mr333378itg.94.1553625770209;
        Tue, 26 Mar 2019 11:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553625770; cv=none;
        d=google.com; s=arc-20160816;
        b=SWWexwFT70CEyTOXApX3BYYygGwWfm1+OUFFf0Cza8W7EmNFcYQMEmFWp0UYI7AfDA
         jIZuOUCAVHMvQScE1a9g1d00EQUSCfCgEiVJesYRvlCaQp8/1NY3tylUrbzIDYqBKORM
         KRx1t0Fx/qo61Gex1cl/k8zOg7gljAB3qNkeftOJgrU3BTpo5PNvZSt5BJXTwSmcrc60
         OS9+sQNklIi+ol3GnkTdz7tU863ihuvAR+c8pDVeK+ha7qy9gR5B8+wPulClrzZTFVUs
         bemgspy5I3/ae42c2vjynHzIXosTVmBwiR2dDCaIHPjteUtEV5dpalb4nU00PRr1RzqB
         OSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=M3tEBT/JUmnB8xDjZdI4XRtJhHIh2Qc+mlC8Z7fdHDc=;
        b=UKkYTFrkGYOlIFuOtX4AcgqZI5VHXdDX7NNl9A4IKwefByCcahywSiMuhF8gJlxk/z
         piTBqUC2LwGjE6XGIQb5ANAigjUaFvniiwDbHG1XIdioT9yzcPVjEm7yJpSnQ9Nw3Cwl
         uXtTSrQjFiwPCQSWqaOdhFtOcG4PReDRI02DWhSet0HBgabOCCjPrP0jIHZuApbiPxCQ
         uwP0WTzEGB0Cbp0Q3Y/k3WZCe/3twFFIsXHn5xxcjZ0i6GtBDJqc+JpL6Uyy3uHRXbUm
         kM2EUZuPYRFPYXFjmDkNnoRFlXAbW4t8f5Q6Ik8EDCIcJgHJlQOFMb1adW8aKU5StZdo
         gclg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22si8941661itc.99.2019.03.26.11.42.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Mar 2019 11:42:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8r29-0008CG-Hd
	for alex.bennee@linaro.org; Tue, 26 Mar 2019 14:42:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h8r06-0007Ba-R4
	for qemu-devel@nongnu.org; Tue, 26 Mar 2019 14:40:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h8qvw-0000Mf-Vv
	for qemu-devel@nongnu.org; Tue, 26 Mar 2019 14:36:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59566)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h8qvv-0000LL-1e; Tue, 26 Mar 2019 14:36:23 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 947EA811AC;
	Tue, 26 Mar 2019 18:36:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-116.ams2.redhat.com
	[10.36.116.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DD0C17595;
	Tue, 26 Mar 2019 18:36:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 81E591138648; Tue, 26 Mar 2019 19:36:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
References: <20190325125142.11628-1-zhengxiang9@huawei.com>
	<CAFEAcA-O5+A0Q=14k2vrBg3KNM7MmqbcyhBoZZOe=AsyE-UDbw@mail.gmail.com>
	<19929558-9f2d-148a-4357-d48b46f8b62b@huawei.com>
	<87va06kvm6.fsf@dusky.pond.sub.org>
	<59f100b4-f6e9-973d-532b-58fb172a7009@redhat.com>
	<87imw5fv45.fsf@dusky.pond.sub.org>
	<abe1d9cd-85bb-2ef8-630f-af28cae6378c@redhat.com>
Date: Tue, 26 Mar 2019 19:36:19 +0100
In-Reply-To: <abe1d9cd-85bb-2ef8-630f-af28cae6378c@redhat.com> (Laszlo Ersek's
	message of "Tue, 26 Mar 2019 18:10:36 +0100")
Message-ID: <8736n9eb4s.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 26 Mar 2019 18:36:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH] hw/arm/virt: use variable size of
 flash device to save memory
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Zheng Xiang <zhengxiang9@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Heyi Guo <guoheyi@huawei.com>,
	wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W7re17mzCW4r

Laszlo Ersek <lersek@redhat.com> writes:

> On 03/26/19 17:39, Markus Armbruster wrote:
>> Laszlo Ersek <lersek@redhat.com> writes:
>
>>> With the dynamic sizing in QEMU (which, IIRC, I had originally
>>> introduced still in the 1MB times, due to the split between the
>>> executable and varstore parts), both the 1MB->2MB switch, and the
>>> 2MB->4MB switch in the firmware caused zero pain in QEMU. And right now,
>>> 4MB looks like a "sweet spot", with some elbow room left.
>> 
>> Explicit configuration would've been exactly as painless.  Even with
>> pflash sizes restricted to powers of two.
>
> I wrote the patch that ended up as commit 637a5acb46b3 -- with your R-b
> -- in 2013. I'm unsure if machine type properties existed back then, but
> even if they did, do you think I knew about them? :)
>
> You are right, of course; it's just that we can't tell the future.

True!  All we can do is continue to design as well as we can given the
information, experience and resources we have, and when the inevitable
design mistakes become apparent, limit their impact.

Some of the things we now consider mistakes we just didn't see.  Others
we saw (e.g. multiple pflash devices, unlike physical hardware), but
underestimated their impact.

[...]
