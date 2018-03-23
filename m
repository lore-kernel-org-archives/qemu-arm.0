Received: by 10.28.71.155 with SMTP id m27csp400580wmi;
        Fri, 23 Mar 2018 05:20:29 -0700 (PDT)
X-Google-Smtp-Source: AG47ELv7uR1muEoK+OzLWSdKQUf8D5IBlyn1uOoWhTrIizhfAkbyAGrt0ST3JUiSScGBiYqOgtvg
X-Received: by 10.55.16.145 with SMTP id 17mr23828915qkq.49.1521807629381;
        Fri, 23 Mar 2018 05:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521807629; cv=none;
        d=google.com; s=arc-20160816;
        b=L/B9LdPr/uPM7rWdXJvRRfTq0lIUdo3fcZwJxpjQYOD+G5xSZjhkKcOBYmLz3Msfpc
         PS3ciVOVNLNBhhxFrhtHj2pNmpvzLYjysAlQKsudOUb/hqKRKN8FsPjAiDJeCbLkjWNU
         XLpk8e/yVp8CUSdB23UBeI+uRgpL/m+131QEPfnqioHEss+8Vy8yu3+yV4oe8iyzM6CX
         CE+mOr9rEQA2nJjtxEDpnNTX7hmnDjFQetacdfp1fpGI5MZnkLpYD1cA1AKBiPdNA/P0
         EjumTFY6l4I80JBszF5WD56Qc78ClFcFCYb/D8Zo1hg7M/2teSkM9vpJJxJlmfHRhvJ8
         TqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:arc-authentication-results;
        bh=1VYLM1cGqHeQp+Zd4bVCTzmCimjfkKLR9mubG7BFP9Q=;
        b=D6sMDqyOtMWDNOadOJ4VlPWcT+TNsvohm57eaqj8HhAvnILkX97SJr+dP2FYSaRvBP
         aFvjYwo7N11Gv2qdAmM0cyTLnxcE8WrdZnb6uL6+lgd/y2zD1eHzbGA+18IYuTWrTCCv
         ZzFkyuVU9ZFd5pk1TC7UPyx1buPpNmUBZWsPRkL3aYFxb32JTLbn/rK66cvoQR7+LJVj
         khanHRqCECciv8I3ZoRLJ8OlgDtHda7zFaiFEJTtQKpn2Zfr0LnPDtx9jxx8etTO4OIG
         /6kfEI5BqjgK2xZj8fXzoi3/8ud9EvQ3kulKvIfTF8wHp33UUeJpAhOWNgCr4mg1PPjE
         a7Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si5724729qtg.30.2018.03.23.05.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 05:20:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezLgK-00018Y-Ry
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 08:20:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ezLg5-00014d-DI
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:20:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ezLfz-0006IO-52
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:20:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54272 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1ezLfz-0006I4-0t; Fri, 23 Mar 2018 08:20:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95DE0813F73C;
	Fri, 23 Mar 2018 12:19:56 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FC5610B2B2B;
	Fri, 23 Mar 2018 12:19:45 +0000 (UTC)
Date: Fri, 23 Mar 2018 12:19:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180323121943.GO16270@redhat.com>
References: <d29ae6aa-5758-277b-b754-4e6fe7666e6b@redhat.com>
	<CAFEAcA9dHPLj6aF=JsS8dXaDWf_ONQ_A+SD1xXQO7DdsWK3yAw@mail.gmail.com>
	<6b4fbb94-2c28-27c2-17e4-b3ce593eb04d@redhat.com>
	<CAFEAcA_rJ_=-dKauAmrJPGRJ6C09_9CQzRdXK53va4NB_xXKpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA_rJ_=-dKauAmrJPGRJ6C09_9CQzRdXK53va4NB_xXKpg@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 23 Mar 2018 12:19:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 23 Mar 2018 12:19:56 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] Regression on KVM qemu-system-aarch64
 since "monitor: enable IO thread for (qmp & !mux) typed"
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	qemu list <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AB7qqTcLLwdR

On Fri, Mar 23, 2018 at 12:11:17PM +0000, Peter Maydell wrote:
> On 23 March 2018 at 12:01, Auger Eric <eric.auger@redhat.com> wrote:
> > Hi,
> >
> > On 23/03/18 11:26, Peter Maydell wrote:
> >> On 23 March 2018 at 10:24, Auger Eric <eric.auger@redhat.com> wrote:
> >>> Hi,
> >>>
> >>> I observe a regression on KVM accelerated qemu-system-aarch64:
> >>>
> >>> Unexpected error in kvm_device_access() at
> >>> /home/augere/UPSTREAM/qemu/accel/kvm/kvm-all.c:2164:
> >>> 2018-03-23T09:59:59.629439Z qemu-system-aarch64: KVM_GET_DEVICE_ATTR
> >>> failed: Group 6 attr 0x000000000000c664: Device or resource busy
> >>> 2018-03-23 10:00:00.085+0000: shutting down, reason=crashed
> >>
> >> Can you get a backtrace for this? (I guess you'd need to fiddle
> >> with the kvm_device_access() code to make it assert rather
> >> than passing back the error).
> >
> > OK. I will try to do so. As I could have expected, I cannot reproduce on
> > a standalone qemu command line. The problem observed above is seen with
> > libvirt launch which may be doing some other QMP stuff concurrently?
> 
> Hmm, that could be a bit painful to debug. I dunno if libvirt
> has a "launch QEMU under gdb" option. If not, you could try

Nothing official, but the following trick should still work:

https://www.berrange.com/posts/2011/10/12/debugging-early-startup-of-kvm-with-gdb-when-launched-by-libvirtd/


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
