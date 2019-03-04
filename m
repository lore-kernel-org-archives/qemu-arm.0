Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3665575wrx;
        Mon, 4 Mar 2019 06:26:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqyMxpBrRPGK7VLOdDpYI7MgSZ8xSNICWFRJ2xKs+69RGXYp3rWhoe/c+1Se15qNH6f6dZEC
X-Received: by 2002:a25:738b:: with SMTP id o133mr7983906ybc.150.1551709588069;
        Mon, 04 Mar 2019 06:26:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551709588; cv=none;
        d=google.com; s=arc-20160816;
        b=dUD2y/ifD6XA1+C3uTlUTLJrUEHvmgDN15l9Q0u+i857dHho7/r7E8qn6Ze7+Tl7mm
         PQ4m9uMcHvcdZqCw6e4wBIcN/BQ3LVL4wQO3fj55mbiy8qhJ8zLxEy2T7GF5Xq2TOGVd
         qupnDgtaoVWxOEyYIovwwnDhXWGma2A0km0W03sSR6B+XwfJ+tNOpEKuHrRpBvkgbuwj
         IMxuiPfpL9azyMTnpbzrf+wBo+L+DtXxUkrDgWLAfddZPS4eToL/0woTBdP3LY+VssPW
         aZU0u3EhpuZCqfzs+/qKYxD030Ot8G+0qcEIw0wOZ762UaHMHipG/o+S4pJX6M7a6FQy
         e6Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=5vuMRXQX9JLbD7fjS1bLvf9nd+uWsRunsgFalEZc37k=;
        b=cU6RG4+Rk57EmymFzKfNL/nEfVFtFzMwJ3Jl4Iz3839KIdgwThtM/Sza7Gxx4LDKgi
         GeM35KsP2cfsNr0gF59jGnIp+76P03SEaRxfRQ2ntMbyE0jf9WY8sdFXytiAVuFuq4Rg
         aR7IOrWQQJM90KgmtPGJMvxwT3PgNps+NGI2i0jaKU8zZMJNo5B1ASAJZhKSmtbf0uWu
         Q1mUGsUiLRyj/6FWWxxBk+pnyOgzcIMTCN5MZP9kL5oTRNphI+Pp+CoYAQttDPcgbkq8
         9zwamJKV9f/AnJA3kFaTjJ/4mLUnQ+AavcZUxQy3CvbfqvMy7VpXWXhXkY8WrIhvay64
         OIZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si2977463ybp.102.2019.03.04.06.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 06:26:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:54871 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0oXz-0003AE-HQ
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 09:26:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1h0oWH-0002NZ-V6
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 09:24:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1h0oWG-0006CA-00
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 09:24:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33852)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mprivozn@redhat.com>)
	id 1h0oWC-000632-2N; Mon, 04 Mar 2019 09:24:37 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 155EACA1F5;
	Mon,  4 Mar 2019 14:24:32 +0000 (UTC)
Received: from [10.43.2.30] (unknown [10.43.2.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 871C361B73;
	Mon,  4 Mar 2019 14:24:29 +0000 (UTC)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com> <87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304101911.GE4239@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <96d58188-65f8-6a39-4ce2-9fe88b89f228@redhat.com>
Date: Mon, 4 Mar 2019 15:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <20190304101911.GE4239@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 04 Mar 2019 14:24:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [libvirt] [PATCH 1/2] numa: deprecate 'mem'
 parameter of '-numa node' option
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, pbonzini@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m/7H6xiUdhji

[Thanks Igor for bringing this onto my radar. I don't follow qemu-devel=20
that close]

On 3/4/19 11:19 AM, Daniel P. Berrang=C3=A9 wrote:
> On Mon, Mar 04, 2019 at 08:13:53AM +0100, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>
>>> On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wrote:
>>>> On Fri, 1 Mar 2019 15:49:47 +0000
>>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>>>>
>>>>> On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote:
>>>>>> The parameter allows to configure fake NUMA topology where guest
>>>>>> VM simulates NUMA topology but not actually getting a performance
>>>>>> benefits from it. The same or better results could be achieved
>>>>>> using 'memdev' parameter. In light of that any VM that uses NUMA
>>>>>> to get its benefits should use 'memdev' and to allow transition
>>>>>> initial RAM to device based model, deprecate 'mem' parameter as
>>>>>> its ad-hoc partitioning of initial RAM MemoryRegion can't be
>>>>>> translated to memdev based backend transparently to users and in
>>>>>> compatible manner (migration wise).
>>>>>>
>>>>>> That will also allow to clean up a bit our numa code, leaving only
>>>>>> 'memdev' impl. in place and several boards that use node_mem
>>>>>> to generate FDT/ACPI description from it.
>>>>>
>>>>> Can you confirm that the  'mem' and 'memdev' parameters to -numa
>>>>> are 100% live migration compatible in both directions ?  Libvirt
>>>>> would need this to be the case in order to use the 'memdev' syntax
>>>>> instead.
>>>> Unfortunately they are not migration compatible in any direction,
>>>> if it where possible to translate them to each other I'd alias 'mem'
>>>> to 'memdev' without deprecation. The former sends over only one
>>>> MemoryRegion to target, while the later sends over several (one per
>>>> memdev).
>>>
>>> If we can't migration from one to the other, then we can not deprecat=
e
>>> the existing 'mem' syntax. Even if libvirt were to provide a config
>>> option to let apps opt-in to the new syntax, we need to be able to
>>> support live migration of existing running VMs indefinitely. Effectiv=
ely
>>> this means we need the to keep 'mem' support forever, or at least suc=
h
>>> a long time that it effectively means forever.

I'm with Daniel on this. The reason why libvirt still defaults to '-numa=20
node,mem=3D' is exactly because of backward compatibility. Since a machin=
e=20
can't be migrated from '-numa node,mem=3D' to '-numa node,memdev=3D +=20
-object memory-backend-*' libvirt hast to play it safe and chose a=20
combination that is acessible the widest.

If you remove this, how would you expect older machines to migrate to=20
newer cmd line?

I'm all for deprecating old stuff. In fact, I've suggested that in=20
libvirt(!) here and there, but I'm afraid we can't just remove=20
functionatlity unless we give users a way to migrate to the one we=20
prefer now.

And if libvirt doesn't follow qemu's warnings then it definitely should.=20
It's a libvirt bug if it doesn't follow the best practicies (well, if can=
).

Michal
