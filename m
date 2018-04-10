Received: by 10.28.71.155 with SMTP id m27csp3500968wmi;
        Tue, 10 Apr 2018 01:52:42 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48KaIdgGTogi05AzkZ0Rpk5TK6NeaHkUuQ1iZmQlMeaCM5olrRvBO2ZBPbBMJNlyEGzb9+6
X-Received: by 10.237.47.227 with SMTP id m90mr59129069qtd.33.1523350362442;
        Tue, 10 Apr 2018 01:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523350362; cv=none;
        d=google.com; s=arc-20160816;
        b=hiTBJ0TP2fP+PJxIO7Y+GVVQQYX7ZCh9f9Jw9VRrkWUxYpRqyWcX3pzl9MkCnV/nt2
         tjvgGfJ3rYTZ7WvbYSv/gzODX17ng7WHa8kXoylZJWrjZAV/bSTWss84fPuOsbybLu7C
         yVLhkunCZobtc3NW8ZM9UGQ+DszJdilAi64qAODBAMJkGdyCvGpNJdzMVTgysiMpmx21
         AA+19SV/1zXnISF6uKBOfwkvmSgBd0e1PZNNf63sDK61vpKkrqovNnJCenRpQdn6Pnmn
         HC3or5B9WpM2/zyuOw5YH7NKQ1/6kLYHujbduhAxXc1baX4CA7MuvJ9sYIPXpkuQBLu4
         wgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:arc-authentication-results;
        bh=R/wRQjgxN9j69sGrwVoCwkdKmx5NDDiDY23y+iK6Nrs=;
        b=n2BRcGgmKGNxTndQn5dMfGZXcE7rTejj68YCvG5TclhdErgjG8DfBk3inmI5/EZfCn
         +tbUNmT4fa9VcWRo3l/RuGcNryH7VHHz0HKcDWb0jcSfNQ0HLyn5FFBEEARQscjcC8En
         nZ56QjMTPKyGBUqUoDLVepGux2oB2uTckQ6ETiXe0SlxrWqa+Tx4FBzb6sObITAljIgW
         Ezx11hY7eg8bi69S/bFyree1F0/HSnBRem3OFqJp9/R2yvFNhDB4b285wtrsAOM6vUT4
         Cw9jFjTLhQHkuUZq8GFbkASNuicWgJM+1134EYPC2zTa/UBR7+2buZXNlwnOiOdJtNfX
         tCjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n137si299591qkn.283.2018.04.10.01.52.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Apr 2018 01:52:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54669 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f5p18-0007ws-0b
	for alex.bennee@linaro.org; Tue, 10 Apr 2018 04:52:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f5p0q-0007rR-LL
	for qemu-arm@nongnu.org; Tue, 10 Apr 2018 04:52:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f5p0m-0002sK-KG
	for qemu-arm@nongnu.org; Tue, 10 Apr 2018 04:52:24 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55368 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1f5p0m-0002sE-Fl; Tue, 10 Apr 2018 04:52:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 042E440201A1;
	Tue, 10 Apr 2018 08:52:10 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F37F121B2F58;
	Tue, 10 Apr 2018 08:52:02 +0000 (UTC)
Date: Tue, 10 Apr 2018 09:52:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Message-ID: <20180410085200.GD5155@redhat.com>
References: <20180409154921.29906-1-wei@redhat.com>
	<20180409155634.GO18283@redhat.com>
	<6bb12858-3b4e-e92f-93ea-b8708c8be870@redhat.com>
	<1523346093.16671.23.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1523346093.16671.23.camel@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 10 Apr 2018 08:52:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 10 Apr 2018 08:52:10 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Change default
 cpu and gic-version setting to "max"
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vOsTawWz1IRd

On Tue, Apr 10, 2018 at 09:41:33AM +0200, Andrea Bolognani wrote:
> On Mon, 2018-04-09 at 11:29 -0500, Wei Huang wrote:
> > > > Running mach-virt machine types (i.e. "-M virt") on different systems can
> > > > result in various misleading warnings if -cpu and/or gic-version not specified.
> > > > For KVM, this can be solved mostly by using "host" type. But the "host" type
> > > > doesn't work for TCG. Compared with "host", the "max" type not only supports
> > > > auto detection under KVM mode, but also works with TCG. So this patch set
> > > > "max" as the default types for both -cpu and gic-version.
> > > 
> > > Hmm, generally we aim for the config provided by a machine type to be stable
> > > across QEMU versions.
> > 
> > I understand this principle. But in reality, under KVM mode, the default
> > config most time doesn't work. If end users specify cpu type manually,
> > it still doesn't work because the host CPU is vendor-specific design
> > (e.g. "cortex-a57" doesn't work on QCOM's machine). So we end up with
> > using "-cpu host" all the time. My argument for this patch is that "-cpu
> > max" isn't worse than "-cpu host".
> 
> I figure the people not explicitly specifying a CPU model on the
> command line will probably also use '-M virt' instead of versioned
> machine types, which means they will get a different guest behavior
> after upgrading QEMU regardless.

Libvirt uses versioned machine types and does not specify -cpu unless the
user has added <cpu> to their XML. IOW libvirt assumes the default CPU
model is stable because that's what QEMU has promised in the past.

> Defaulting to 'max' for '-cpu' and 'gic-version' makes it convenient
> to quickly and concisely start a guest; if you care about guest ABI
> at all, then you are already specifying everything explicitly on the
> command line instead of relying on defaults - or using libvirt ;)

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
