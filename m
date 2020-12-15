Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3743246lfq;
        Tue, 15 Dec 2020 10:28:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYVC1nflCeSY6rUI1s85C6pa16Ngb0dCeueJbLZ6fjqy5IlGhi1UnxQvzgRjtuUFhUaYGu
X-Received: by 2002:a25:d24a:: with SMTP id j71mr25299841ybg.13.1608056904468;
        Tue, 15 Dec 2020 10:28:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608056904; cv=none;
        d=google.com; s=arc-20160816;
        b=cF6buz681rY5i1RULs6mvYJPu35dsILb1SVFNsaiJWbi1AUug6EBUjzfHGBMHtfb51
         0SZAVDA38P092Jog9go19NbgHvxf+Sa6pWywtkuwfhkKvt9uOevIEgMuTTekgdsm/0hP
         RY+jT4vlUK+xEpSu22xk/0ty4+qsYEfS8RKsHlsyIlg3gU2PT5JDDya2LHyupwdqCUur
         ZbJeHgMrwolcqDaqdjWssQ9WE+2Kh/48ejnzE8Kr0eXV7Vi98eOowBAlxtEvJbaJ9x7G
         isCsSeu3TVABMaX1SF7yBJoTbodkmHML97KDG6d7f3OEC2Zzr+Cr4VnudS2IY3HEqfRU
         PvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=4CB21XuX7IC3rWEyM+sw6INdL1I1099WrsPqWSGbeXU=;
        b=I5APUSyhC/51EwqCYlIX5ltnxmDL+M+gNFYr7quKdbOs72g1I/BujSjwsTOTOBy2M1
         iPm/Dl59nribSCTaNKIugVrJv4ctHESZUNcaahOTJx7ULsWZATyo6Nd7CIgHussfE6wQ
         08tDpJIzjy3sQUW8YvEpJhU/ypN0t4JO1aLqKpnsxqV4R/5hLbvyh7jnWhqSQHA3i1WC
         1rUem4HvOYNsoHwmXwHmxJQNR1mECYdKXooCv90+QDZH/fIRchnAYbwFQ1gATAp6SNpU
         9P6CE6m9/mbaD8/wjl0LmqA44/cfVe3Xc52j7ZLJV32PApMCLmXTAY19zVhwwt5Y0oSy
         ms3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bd7TPi6V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v80si20745904ybe.399.2020.12.15.10.28.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Dec 2020 10:28:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bd7TPi6V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpF3f-0005Az-Ss
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 13:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kpEfI-0005hX-MS
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 13:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kpEfG-0002ik-Br
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 13:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608055389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4CB21XuX7IC3rWEyM+sw6INdL1I1099WrsPqWSGbeXU=;
 b=bd7TPi6Vf05edq2MhdAcdQ0fWfbyrcD40VGLfYCuoMotjyVNhEPMipRuR+5aeIQa8jo3C1
 jxzxPKu4zuMPidgcZJi9MArhdGTmTe+WDV4jKZk7e60wUdR6O58fGPeSIo0Ze/MwMRVMl3
 Arf0KZJH356gqNALIuQf5DvS9x/Yg6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-C1uoRqtTOGO5m9DB4nYvsA-1; Tue, 15 Dec 2020 13:03:05 -0500
X-MC-Unique: C1uoRqtTOGO5m9DB4nYvsA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6971CCE646;
 Tue, 15 Dec 2020 18:03:04 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-113-73.ams2.redhat.com
 [10.36.113.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2481B1F078;
 Tue, 15 Dec 2020 18:03:01 +0000 (UTC)
Date: Tue, 15 Dec 2020 19:02:59 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH v3 01/13] hw/arm/virt: Spell out smp.cpus and
 smp.max_cpus
Message-ID: <20201215180259.kc64njsagfpf3lxn@kamzik.brq.redhat.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
 <20201109030452.2197-2-fangying1@huawei.com>
 <1ed3b150fb3d4a96ab15638e89422f3c@huawei.com>
 <900b570d-735f-8303-833a-44babe0addb1@huawei.com>
 <20201120124313.5pcljtoj7ocu56k7@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201120124313.5pcljtoj7ocu56k7@kamzik.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Salil Mehta <salil.mehta@huawei.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 556qzD2+moJz

On Fri, Nov 20, 2020 at 01:43:19PM +0100, Andrew Jones wrote:
> On Tue, Nov 17, 2020 at 06:27:54PM +0800, Ying Fang wrote:
> > 
> > 
> > On 11/9/2020 6:45 PM, Salil Mehta wrote:
> > > Hi Fangying,
> > > A trivial thing. This patch looks bit of a noise in this patch-set. Better
> > > to send it as a separate patch-set and get it accepted.
> > > 
> > Hmm, this patch looks like a code reactor for the somewhat confusing
> > *smp_cpus* which will tidy the code. Maybe Andrew could do that.
> >
> 
> Sure. I can post the first two patches of this series after the 5.2
> release.
>

Just posted this

"[PATCH] hw/arm/virt: Remove virt machine state 'smp_cpus'"

Squashed in 2/13 and changed the approach a bit. I'm not quite so against
the "smp_cpus" string anymore, now that the global variable of the same
name is totally gone.

Thanks,
drew

