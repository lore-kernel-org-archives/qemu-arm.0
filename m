Received: by 10.223.172.38 with SMTP id v35csp7240834wrc;
        Tue, 12 Sep 2017 08:36:53 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBiKEC0xBPPECyeZ4yvZFiG0RTEktCYiHCgR5RLDeS7z+R4NiJmP4AWnQMyJz7D6nn0qER8
X-Received: by 10.200.5.132 with SMTP id a4mr22754340qth.316.1505230613540;
        Tue, 12 Sep 2017 08:36:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505230613; cv=none;
        d=google.com; s=arc-20160816;
        b=IoqTeM3vDc06orZRvFLbGrp/c5dmrEkN2X1Hmt/3b4FvxUz7DqnNsOqANwd7HpZM/8
         sDtjBzre6gLjQ/9rAHTIsL5rQbUieHrhN/KhB754fdJQ63qcSE8bdqpLHkhOSsJFa/RM
         CfQqRUKnyNPfaSIxvq4/XRUvsO/FFLwGm/fcAUTIdzziG1CIHjbNAq62sQAdzblECkde
         mPSQ4AeIWw80bDRw5ORYqWcR/s9O++hsamOnlnA4QIlN6VUBluBiHxZs+H6nKbSWv2ji
         8Z2810VeW8nMIN8zIqn6FsNskzQWdFBM48oYN3x9FKlfIwIfb7rtYOLmTIDvHobvJolh
         CcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=mK66QM0lG9W0XH8P4YcQu1sZxdviG/wMMU+GFmw2o1A=;
        b=Acx7hV7GZuEAXMbw3TaGarBQX9OOLPqF12t0uxMoEYOxedCBuzmC2Al3EtRblOZ5AH
         84dESMa4yOvRA29chK5/PHi9flf8uf7byozH4RLazvtNzqPZ8c+AdI5Fzvd3G8c3i2PY
         dCQ5z1l1dw5hbIGIVmvPKILG7NKXemxEGfqE66TRRJEsxDNsXniJNxRZVy1JQGHweZ8v
         VpY7Rc1CEXdVe+cttxwwWE8SBOnIS176TVsXoZt4i0KUH55hMOgyYbYgHBz7HYsMsSVV
         PHyJccCZOHhquT+DVvHgZ2gTi6a5+MA6EVhegWO+QkbqvtA4+X4OeyaLiyW/vkf1Edff
         Q40w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h135si12552905qka.285.2017.09.12.08.36.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 08:36:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drnF5-0007PC-98
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 11:36:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1drnEx-0007P3-16
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 11:36:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1drnEs-0007A2-02
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 11:36:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53394)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1drnEr-00078t-Mx; Tue, 12 Sep 2017 11:36:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDFA2883BD;
	Tue, 12 Sep 2017 15:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CDFA2883BD
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=dgilbert@redhat.com
Received: from work-vm (ovpn-117-186.ams2.redhat.com [10.36.117.186])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60E9C77DE9;
	Tue, 12 Sep 2017 15:36:33 +0000 (UTC)
Date: Tue, 12 Sep 2017 16:36:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20170912153630.GC2225@work-vm>
References: <20170912140149.7692-1-lvivier@redhat.com>
	<20170912164644.2a0b6977@bahia.lan>
	<6198350f-a694-cf1b-ec00-4c42ccce39a6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6198350f-a694-cf1b-ec00-4c42ccce39a6@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 12 Sep 2017 15:36:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 0/3] hmp: fix "dump-quest-memory" segfault
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>, ehabkost@redhat.com,
	Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vCCMArMpOJa5

* Thomas Huth (thuth@redhat.com) wrote:
> On 12.09.2017 16:46, Greg Kurz wrote:
> > On Tue, 12 Sep 2017 16:01:46 +0200
> > Laurent Vivier <lvivier@redhat.com> wrote:
> > 
> >> Fix aarch64 and ppc when dump-guest-memory is
> >> used with none machine type and no CPU.
> >>
> >> The other machine types don't have the problem.
> >>
> >> Update test-hmp, to test none machine type
> >> with (2 MB) and without memory, and add a test
> >> to test dump-quest-memory without filter parameters
> >> (it needs the fix from Cornelia Huck to work)
> >>
> >> v3:
> >>   - remove blank line after a comment
> >>   - forbid memory dump when there is no CPU
> >>
> > 
> > So in the end, we would forbid dump on aarch64 and
> > ppc, while it is allowed on i386... I don't really
> > care about which behavior is more appropriate but
> > I guess they should be consistent at least.
> 
> It's kind of consistent: Allow it on architectures with fixed endianess,
> but disallow it on architectures without fixed endianess ;-)

Another way to put it is that you can dump unless you need
information about the CPU.

It also makes me wonder what happens on those CPUs that can
change their endianness dynamically.

(I'm not fussed either way as long as it doesn't crash;
'none' is full of corner cases)

Dave

> Honestly, it should not matter - we're talking here about the "none"
> machine without a CPU ... as long as it does not crash, there is no need
> for a working "dump-guest-memory" function here.
> 
>  Thomas
> 


--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
