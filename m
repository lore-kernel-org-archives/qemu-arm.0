Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3057588lfc;
        Mon, 1 Jun 2020 05:29:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDm2vy+puEfNO04oVHfHAlC2DR3gWPSBFtBbHFLHapnuKFJK25Rdnf5LDtFKJ7QrFoMV/Z
X-Received: by 2002:a25:3555:: with SMTP id c82mr34102253yba.378.1591014582088;
        Mon, 01 Jun 2020 05:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591014582; cv=none;
        d=google.com; s=arc-20160816;
        b=ane6R5LRPXpT7fWfcDlsVVhrVfi1ArAJIK7X4XPN32qPK0/NdyyLdjnf5HRrvEMNzx
         YMpsHSFGhlUCb5PcRTb9cGCSo+Ssy7vYbQR4aATqftabzTbDFi05xll+5EgWWEevn/tf
         mgMlDm33OcfnyJPQHcVVxWmxrzWNTBB/saWFHoXD7IMydXR3FUSkw2cw1qoDRr29hjF9
         vMNsD7N/Ymb+Po9sSU55YWsFHHX69CnDLI6FAunR8V40LEQuOwpBJa8CJ1QittXSH+jP
         atjxaaCfXgUIfgUYgvrL3p1QKixw7Pt/r8SHEAO981DWAPCur/NbghezYQ6+sZS2RYoU
         mXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=Y2AYaxn/6IwGDHHB/RW0wmGgaHhVlO6z2tV/aerIGeQ=;
        b=kORH6DVSbv+9cdrGRcqQqFpnpz9DFURtc4wJ1aju8lyhSEvk7/8H3hM5Akj6cdw/rZ
         FPTJHBDGpke2lp6w9/wxlwgJxoRvTMjoAc3i1mU63dHtyUuBTTNnMsFQ4oAtmTNAEUDI
         koJ+HjZ/tzG2hi+OXsepf74hwLaNWlyKbFdSKb61G6+CjhIwzSx3BEP+UAAhZEh2Pi0I
         wUozXpf+9e2XImjXOE+qV0N73HvtyctjEkWlwaRZrNTu0GbxYG0+gEYruDT3ZufA9cr2
         0cjVwjw3o6K/6ix3g2brY068skWHxkLIRWzi6Kmh/jYB7ZJuQrqO6SlFwE+gIcYrxuFK
         SW4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h545wEMU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u101si14761954ybi.301.2020.06.01.05.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 05:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h545wEMU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfjZV-0000B4-FY
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 08:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jfjZM-00007m-EG
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 08:29:32 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21304
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jfjZK-0001y6-MZ
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 08:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591014569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2AYaxn/6IwGDHHB/RW0wmGgaHhVlO6z2tV/aerIGeQ=;
 b=h545wEMUSiclWWMAIM9sBrhQlAIHUi3PuRQ2jr/r/S72IV5xq/wpMaqdC0QEvGrwkLu62z
 alSOTnfA+QaUZVWg5HO85lk04FhlLVV6j23Plfo4ofZTirhHSWCavnPdjMtS1WKxIXyA2y
 IYAnuQksBpIahoCvhaUqT+FEi1kf5qc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-P6yltwKhOSK0U390joYZDg-1; Mon, 01 Jun 2020 08:29:25 -0400
X-MC-Unique: P6yltwKhOSK0U390joYZDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 835F5A0BD7;
 Mon,  1 Jun 2020 12:29:24 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5C005C1D4;
 Mon,  1 Jun 2020 12:29:22 +0000 (UTC)
Date: Mon, 1 Jun 2020 14:29:17 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: About the kvm-no-adjvtime CPU property
Message-ID: <20200601122917.fyp2kwqzsodahnzu@kamzik.brq.redhat.com>
References: <b4389848-10fd-a906-9901-d1d354ce4842@huawei.com>
 <20200601080718.jul5r4qebpeieyfl@kamzik.brq.redhat.com>
 <3d8729db-067c-31f9-dd69-02a218f1b53e@huawei.com>
MIME-Version: 1.0
In-Reply-To: <3d8729db-067c-31f9-dd69-02a218f1b53e@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 02:05:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: 6eR6t6nJUtSW

On Mon, Jun 01, 2020 at 08:07:31PM +0800, Ying Fang wrote:
> 
> 
> On 2020/6/1 16:07, Andrew Jones wrote:
> > On Sat, May 30, 2020 at 04:56:26PM +0800, Ying Fang wrote:
> > > About the kvm-no-adjvtime CPU property
> > > 
> > > Hi Andrew,
> > > To adjust virutal time, a new kvm cpu property kvm-no-adjvtime
> > > was introduced to 5.0 virt machine types. However the cpu
> > > property was enabled only for host-passthrough and max cpu model.
> > > As for other cpu model like cortex-a57, cortex-a53, cortex-a72,
> > > this kvm-adjvtime is not enabled by default, which means the
> > > virutal time can not be adjust for them.
> > > 
> > > Here, for example, if VM is configured with kvm enabled:
> > > 
> > >    <cpu mode='custom' match='exact' check='partial'>
> > >      <model fallback='allow'>cortex-a72</model>
> > >      <topology sockets='2' dies='1' cores='2' threads='1'/>
> > >      <numa>
> > >        <cell id='0' cpus='0-1' memory='16777216' unit='KiB'/>
> > >        <cell id='1' cpus='2-3' memory='16777216' unit='KiB'/>
> > >      </numa>
> > >    </cpu>
> > > 
> > > We cannot adjust virtual time even if 5.0 virt machine is used.
> > > So i'd like to add it to other cpu model, do you have any
> > > suggestions here ?
> > > 
> > > 
> > 
> > Hi Fang,
> > 
> > The cpu feature only requires kvm.  If a cpu model may be used with kvm,
> > then the feature can be allowed to be used with the model.  What I find
> > interesting is that the cpu model is being used with kvm instead of 'host'
> > or 'max'.  Can you explain the reasons for that?  Currently, when using
> yes，the cpu model is indeed used with kvm.
> 
> There is a situation where the host cpu model is Cortex-A72 and
> a 'custom' cpu mode is used to keep insrtuction set compatible between
> the source and destination host machine when doing live migration.
> So the host physical machine cpu model is Cortex-A72 but
> host-passthrough model is mode used here.

Are the source and destinations hosts used in the migration identical?
If so, then the guest can use cpu 'host' and disable cpu features that
should not be exposed (e.g. -cpu host,pmu=off).  If the source and
destination hosts are not identical, then I'm curious what those exact
differences are.  With the way AArch64 KVM works today, even using the
Cortex-A72 cpu model should require identical hosts when migrating.  Or,
at least both hosts must be compatible with Cortex-A72 and any difference
in ID registers must be somehow getting hidden from the guest.

Thanks,
drew

