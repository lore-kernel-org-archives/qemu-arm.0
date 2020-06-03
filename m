Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp304233lfc;
        Wed, 3 Jun 2020 01:54:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYOqISF0Po+M23L0iw6GDDsfuuw23tHnGtWbrmLHBCjxmGVMXRwqHUo6Hviq7FhiZViTb0
X-Received: by 2002:a25:5284:: with SMTP id g126mr50618759ybb.245.1591174453584;
        Wed, 03 Jun 2020 01:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591174453; cv=none;
        d=google.com; s=arc-20160816;
        b=NxkhPL5nHz1F5ZRjpjaf9taxOQAHfLgeY3+BPkYfUQU3aUFl+VL6PgaGlJOgih6Cbp
         /s4nhiocvpK/KqixQO6Vci8j42bvUoJxDXt8vfIkaSnSdBf9pQ8VxPMIm7CAVrOOvqPP
         XVG1lianRIfV8vx1++Y0/8lNgpvQzF/mONXix/eJMWU8j6uVUsUr0rrcE+t+uMXK69u5
         7tD98HMYxIlLfmz36l1tlraIP8VMN1KXDuvrwz9PMPd93SFfaJilIL1l6V1zRHJiIfPr
         Wfw6DN9NpP1JeYTrb4CgtRcORhyGkrGWA9tsP2Cst8djfxDCtz0uBKa2LT4FQa681n8P
         9UiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=QWex8TjGTKA0jX7oHTGYYPKn0RoT8P7MfBM5P+sCLNQ=;
        b=dp8T9tgXtwUidarzskkSnm1Ee0msfJB0PRa5j1vVmtircLiM2sNeR15FFkItYF1u9N
         BsUUXzmDVlsg9PmWVQLs+b9TPkpi6iLxqqM+RPCCr7rB50b8QvsMZBrIzaUILgC+Zyte
         2+EM/tOn4lJ2+bgxBR6w/XcwWWv1HJt6fdTJxx5EuxlQqtcEUYnGBB/LQFvJ4VK6lPDc
         trlrevOlwAGP3k5TBa6rYa4c/8jHa1rDFAWNCSTm0270mUoZwvZyk7RqA8EeRVinycgo
         vB05gjMiHNt7HzxA7yDOABizw1iN8l5FrhKl1qRAIisFrUd12Ur07eEulnlZz+t9Ii0/
         5e2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ue6stcLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i205si1127468yba.151.2020.06.03.01.54.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 01:54:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ue6stcLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgPA4-0005HT-W5
	for alex.bennee@linaro.org; Wed, 03 Jun 2020 04:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgP9z-0005HH-49
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 04:54:07 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36434
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgP9y-0000pY-3N
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 04:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591174445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QWex8TjGTKA0jX7oHTGYYPKn0RoT8P7MfBM5P+sCLNQ=;
 b=Ue6stcLRR13h6W4D2T93UOZuRQhPoXYUSaO30r1yovu3EPEL66YrFc1fTVOF9KeK5BpIHW
 LkvMOF14yymQAOFHSj9pEzSWW88FVM7u55xhbSXm+QKQL0W1LL340sEJD64IxRKb8Zj5Mh
 my48++aTgO1VSpGyVdlFJz+5okrmEw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-QxY7rB10MkCXIV5UbBeXBw-1; Wed, 03 Jun 2020 04:54:01 -0400
X-MC-Unique: QxY7rB10MkCXIV5UbBeXBw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CCB6835B8C;
 Wed,  3 Jun 2020 08:54:00 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C91FA5C290;
 Wed,  3 Jun 2020 08:53:57 +0000 (UTC)
Date: Wed, 3 Jun 2020 10:53:54 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: About the kvm-no-adjvtime CPU property
Message-ID: <20200603085354.wcbhhuq3dhvi3moc@kamzik.brq.redhat.com>
References: <b4389848-10fd-a906-9901-d1d354ce4842@huawei.com>
 <20200601080718.jul5r4qebpeieyfl@kamzik.brq.redhat.com>
 <3d8729db-067c-31f9-dd69-02a218f1b53e@huawei.com>
 <20200601122917.fyp2kwqzsodahnzu@kamzik.brq.redhat.com>
 <f994141f-0248-fd68-7cd5-9b948cfdbf8d@huawei.com>
MIME-Version: 1.0
In-Reply-To: <f994141f-0248-fd68-7cd5-9b948cfdbf8d@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:04:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wu.wubin@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gOBjyCm8eOFC

On Tue, Jun 02, 2020 at 03:47:22PM +0800, Ying Fang wrote:
> 
> 
> On 2020/6/1 20:29, Andrew Jones wrote:
> > On Mon, Jun 01, 2020 at 08:07:31PM +0800, Ying Fang wrote:
> > > 
> > > 
> > > On 2020/6/1 16:07, Andrew Jones wrote:
> > > > On Sat, May 30, 2020 at 04:56:26PM +0800, Ying Fang wrote:
> > > > > About the kvm-no-adjvtime CPU property
> > > > > 
> > > > > Hi Andrew,
> > > > > To adjust virutal time, a new kvm cpu property kvm-no-adjvtime
> > > > > was introduced to 5.0 virt machine types. However the cpu
> > > > > property was enabled only for host-passthrough and max cpu model.
> > > > > As for other cpu model like cortex-a57, cortex-a53, cortex-a72,
> > > > > this kvm-adjvtime is not enabled by default, which means the
> > > > > virutal time can not be adjust for them.
> > > > > 
> > > > > Here, for example, if VM is configured with kvm enabled:
> > > > > 
> > > > >     <cpu mode='custom' match='exact' check='partial'>
> > > > >       <model fallback='allow'>cortex-a72</model>
> > > > >       <topology sockets='2' dies='1' cores='2' threads='1'/>
> > > > >       <numa>
> > > > >         <cell id='0' cpus='0-1' memory='16777216' unit='KiB'/>
> > > > >         <cell id='1' cpus='2-3' memory='16777216' unit='KiB'/>
> > > > >       </numa>
> > > > >     </cpu>
> > > > > 
> > > > > We cannot adjust virtual time even if 5.0 virt machine is used.
> > > > > So i'd like to add it to other cpu model, do you have any
> > > > > suggestions here ?
> > > > > 
> > > > > 
> > > > 
> > > > Hi Fang,
> > > > 
> > > > The cpu feature only requires kvm.  If a cpu model may be used with kvm,
> > > > then the feature can be allowed to be used with the model.  What I find
> > > > interesting is that the cpu model is being used with kvm instead of 'host'
> > > > or 'max'.  Can you explain the reasons for that?  Currently, when using
> > > yes，the cpu model is indeed used with kvm.
> > > 
> > > There is a situation where the host cpu model is Cortex-A72 and
> > > a 'custom' cpu mode is used to keep insrtuction set compatible between
> > > the source and destination host machine when doing live migration.
> > > So the host physical machine cpu model is Cortex-A72 but
> > > host-passthrough model is mode used here.
> I mean host-passthrough model is 'not' used here. Sorry to make it
> confusing.

I guessed as much.

> > 
> > Are the source and destinations hosts used in the migration identical?
> > If so, then the guest can use cpu 'host' and disable cpu features that
> > should not be exposed (e.g. -cpu host,pmu=off).  If the source and
> > destination hosts are not identical, then I'm curious what those exact
> > differences are.  With the way AArch64 KVM works today, even using the
> > Cortex-A72 cpu model should require identical hosts when migrating.  Or,
> > at least both hosts must be compatible with Cortex-A72 and any difference
> > in ID registers must be somehow getting hidden from the guest.
> Yes, you are right.
> We have AAarch64 server with cpu based on Cortex-A72 and some extra
> instruction set added. Source host with cpu based on V1 and destination host
> with cpu based on V2 and they are compatible with Cortex-A72. We want to use
> a 'custom' cpu mode here to make it possible to do live migration between
> them. This is the scenario where the 'host' cpu model is not used since a
> 'custom' cpu model Cortex-A72 is used here .

What you've described here is indeed the reason to use CPU models. I.e.
enabling the migration from a host of one type to another by creating a
guest that only enables the features contained in both hosts (as well as
maintaining all state that describes the CPU type, e.g. MIDR).
Unfortunately, unless your KVM has patches that aren't upstream, then that
doesn't work on AArch64 KVM (more on that below). It may appear to be
working for you, because your guest kernel and userspace don't mind the
slight differences exposed to it between the hosts, or those differences
are limited to explicitly disabled features. If that's the case, then I
would guess that using '-cpu host' and disabling the same features would
"work" as well.

Here's some more details on why the Cortex-A72 CPU model doesn't matter
with upstream KVM. First, upstream AArch64 KVM doesn't support CPU models,
and it doesn't even have a Cortex-A72 preferred target. For Cortex-A72
it will use "KVM_ARM_TARGET_GENERIC_V8", which is the same thing 'host'
would do when running on a Cortex-A72. Second, if V2 of the Cortex-A72-
based CPU you're using changed the revision of the MIDR, or any other
state that gets passed directly through to the guest like the MIDR, then
that state will change on migration. If a guest looks before migration and
again after migration, then it could get confused. A guest kernel may only
look once on boot and then not notice, but anything exposed to userspace
is extra risky, as userspace may check more frequently.

In short, without KVM patches that aren't upstream, then it's risky to
migrate between machines with V1 and V2 of these CPUs. And, it doesn't
help to use the Cortex-A72 CPU model.

Thanks,
drew


> However the kvm-adjvtime
> feature is also need. So I think we should move kvm_arm_add_vcpu_properties
> to arm_cpu_post_init, instead of limited to 'host' and 'max' cpu model[1].
> 
> 1: https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00091.html
> > 
> > Thanks,
> > drew
> > 
> > 
> > 
> 
> 

