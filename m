Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp5101738lfy;
        Mon, 10 Aug 2020 03:29:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW9RzPnPrN6yBVCkRVQ/Z0XW2I5fyhHdoBL6pz2hHWcNyp3N0ny3VI6r0o8SzgcKaEynqT
X-Received: by 2002:a25:138a:: with SMTP id 132mr38234046ybt.334.1597055381506;
        Mon, 10 Aug 2020 03:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597055381; cv=none;
        d=google.com; s=arc-20160816;
        b=z7/sdu+0FtdbFTstI12krlNLxtXjHgvWeGKk8z1diC0NiRotWU0/uL+CdCijpGMhK7
         PQeR5+Y5o/utYLbCa0okG4BHmD/+v6ToZW0GjxgLa8dfHcu51U2z3em18vAfNTnoTGGx
         n3822YXVnnbaUlKwJB8iw9Y04aJCVJ6wUNkMfUnIqko82moiYmWiT7GW4yC7bODS4tVI
         /uOxxSyMcBLtvSEM/cwqeWH1EYewgBc/RLFCvku31r+Fe5gZDj/WXfuvlx94JJovezHy
         iOgUexojnHT8xGzq0segxh9WlZ+hj2i3tH6IgYiCe/F2DbhrkHwX7EDqWLjC6/T9J9cI
         6DDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=FHUfhpQhwyb0I1ZlBeS2Grmm1hIPB3mkmWg+QqlOrS8=;
        b=MNTu+mQyCqONqXmWhxPRWJvDp/XhAlrd8UYO8PDx93ncWytr1von+md10/nyFjUax7
         DJZhYfN+X+vDw3GEV+q7DDYEysrDIe3ls6hhx+IpS9dPYv5g+yqBfxK3AbcQzIw+rUMN
         LoK8Z7LRSTsRFdzXAw63y2YPHolHUU9z15sV2uElSy0fuQYF2BslxDn4IVxAAQ0H9pvc
         wR3cRx7a+pi5wQdk11QLKvG2Liz70cUd1VvwxoNpcXBCfh81Zg4T+wsAHFP1Mlpvvauw
         WgA+gmV/nv8YH3IgYdQmdiu/vjzIeYZB9E6wMitDFc5Vh8MKJ6C+dOTL7qz401zF8Ig1
         R9rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EuM7ksPH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si3621440ybk.304.2020.08.10.03.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Aug 2020 03:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EuM7ksPH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k553k-0006YZ-TX
	for alex.bennee@linaro.org; Mon, 10 Aug 2020 06:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k553c-0006Xt-Om
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 06:29:32 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46334
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k553Z-00026B-RN
 for qemu-arm@nongnu.org; Mon, 10 Aug 2020 06:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597055368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FHUfhpQhwyb0I1ZlBeS2Grmm1hIPB3mkmWg+QqlOrS8=;
 b=EuM7ksPHAedTcLC4p5xYyR6/mJgFSAmEQlpV8ojVJgtDBrG7sJwI1PUaOjC93fvL8ARhzU
 6EwGzrjOlAVjrPxnULKBh4fY/EFB5DnAr9p+vR5h/V0FMGVjJvZ02aFx5uZZ+7KkFMiHj7
 1RTReV76EJ0lZIOHZHQQzS7jiIl0VsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-oz64s7J1Pk-iTwDV__NXxA-1; Mon, 10 Aug 2020 06:29:24 -0400
X-MC-Unique: oz64s7J1Pk-iTwDV__NXxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D658D8017FB;
 Mon, 10 Aug 2020 10:29:22 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.194.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C4395D9CC;
 Mon, 10 Aug 2020 10:29:20 +0000 (UTC)
Date: Mon, 10 Aug 2020 12:29:18 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH 4/7] target/arm/kvm: spe: Unify device attr operatioin
 helper
Message-ID: <20200810102918.jjzqt4awirszsen4@kamzik.brq.redhat.com>
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <3cc31df5191ae6b03e060ccd8e82df74416a3ef5.1596768588.git.haibo.xu@linaro.org>
 <b4790af9-38b7-f74a-4ebc-a7e9d3684ae0@amsat.org>
 <CAJc+Z1HzoREjCfbwct4ARmOZjszuLQEw9vqidChWjVGo19FngQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJc+Z1HzoREjCfbwct4ARmOZjszuLQEw9vqidChWjVGo19FngQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/10 04:13:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lX35IcSFTDjV

On Mon, Aug 10, 2020 at 10:48:41AM +0800, Haibo Xu wrote:
> On Fri, 7 Aug 2020 at 16:19, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> >
> > On 8/7/20 10:10 AM, Haibo Xu wrote:
> > > Rename kvm_arm_pmu_set_attr() to kvm_arm_dev_set_attr(),
> >
> > Maybe rename kvm_arm_device_set_attr() to match the structure
> > name?
> >
> 
> Thanks for the review! I will update it in the next version.

I've already renamed it to kvm_arm_set_device_attr() in [1]. Also, it's
not enough to just rename the function. The error messages the function
may generate have "PMU" embedded in them.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg727590.html

Thanks,
drew

> 
> > > So both the vPMU and vSPE device can share the same API.
> > >
> > > Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> >
> > Regardless, with the typo "operation" in patch subject fixed:
> > Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> >
> > > ---
> > >  target/arm/kvm64.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > > index 1169237905..75a417d65c 100644
> > > --- a/target/arm/kvm64.c
> > > +++ b/target/arm/kvm64.c
> > > @@ -398,7 +398,7 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
> > >      return NULL;
> > >  }
> > >
> > > -static bool kvm_arm_pmu_set_attr(CPUState *cs, struct kvm_device_attr *attr)
> > > +static bool kvm_arm_dev_set_attr(CPUState *cs, struct kvm_device_attr *attr)
> > >  {
> > >      int err;
> > >
> > > @@ -427,7 +427,7 @@ void kvm_arm_pmu_init(CPUState *cs)
> > >      if (!ARM_CPU(cs)->has_pmu) {
> > >          return;
> > >      }
> > > -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> > > +    if (!kvm_arm_dev_set_attr(cs, &attr)) {
> > >          error_report("failed to init PMU");
> > >          abort();
> > >      }
> > > @@ -444,7 +444,7 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
> > >      if (!ARM_CPU(cs)->has_pmu) {
> > >          return;
> > >      }
> > > -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> > > +    if (!kvm_arm_dev_set_attr(cs, &attr)) {
> > >          error_report("failed to set irq for PMU");
> > >          abort();
> > >      }
> > >
> >
> 

