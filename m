Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp615196lfy;
        Tue, 11 Aug 2020 09:40:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCDG6446yK/Mx/yV0BYXl4LRROQCDXsErXmJMnQdMsT4TV5HQF/zsiQz42+yqNlMneju6y
X-Received: by 2002:a25:40cb:: with SMTP id n194mr48426391yba.380.1597164020155;
        Tue, 11 Aug 2020 09:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597164020; cv=none;
        d=google.com; s=arc-20160816;
        b=SwUPTNDo/mfI+Vr630lIuSf5Os2nA3/mq+H65nzSKsbYENojJorYUaZOiztw++qyFR
         1g2MZIoHEuP8XjnhqfxSFBak3x+Hhz01lv5fXHf5bbJmNhb4rVsvhqvII6ffBYXmdiX0
         buwUTxitEbUZN2AXyuB2xZHh+YcduerKSjinbcoRukeVFa0MMVlIsO9bdLRk4+jLu1nO
         dlqmHEZGdCan5AhML/2hwZO347B1cw21nJxhVXAHRbCsayDK//cHMd+cuiib95EUja3I
         TOqI1TY6Ef+pCC2tIs0OMKeh3bGb0WkmuPlhz9EFe3ZPlm68hkbbzwT6eB4MTXzwwlke
         2zMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=QUKWicgDbR+X+BhAVZGE26I5tIGZe1Qz8U4lzrU4fuY=;
        b=rhHxgD9+b6cp2kIiB2Z7Ig+g24ztVw5DNBc/8WsIFqD9JwzSjvwWqSorjRzvHM5dyC
         GI2mUulEfXXAACBkN8O3mg5/ouX2d5R3vZNMD9WWZBRhoSD36wz6qLOt45XfwPVnAOiq
         ty24hgHWW0MnlFdXIFdEsKbL9HYtAx4oY5c62AO8Vshq7HfuJXtjieidjYOHk5myXO6u
         IvIH55O2MoCsQr/F5HIrgAcXCOWkh/AgaV/OscIYdaDCEf5gMDnnTQaBI5IytPFL4ozb
         ZV4fEEYSidsugFkiexUG3yy4Oi4H3N918ypjhXGJnFXlkAZXWDrcHzVMYMovGNYEMyO4
         DeFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hJGLstCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p198si18841948yba.131.2020.08.11.09.40.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Aug 2020 09:40:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hJGLstCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k5XJz-00023U-GC
	for alex.bennee@linaro.org; Tue, 11 Aug 2020 12:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k5XJq-00023H-Ap
 for qemu-arm@nongnu.org; Tue, 11 Aug 2020 12:40:10 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22647
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k5XJn-000246-ML
 for qemu-arm@nongnu.org; Tue, 11 Aug 2020 12:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597164007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QUKWicgDbR+X+BhAVZGE26I5tIGZe1Qz8U4lzrU4fuY=;
 b=hJGLstCDUKi28ufvQMzF/CVnyPD2A6cEXeZHI0juqx9SP7oqsAyIbpZN8duRlpZLB1soqx
 VKWSq6E708Y/o521ptv0EWS6HonZe/w7srLX1wdxwgaHrJcRNF1AufOLfC2Zk4zfiF5nX7
 e/AvmGDPRTcia/1jGZnrzAB6y1xThJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-qWWe4mjzNiag5uFp_1EbEw-1; Tue, 11 Aug 2020 12:40:03 -0400
X-MC-Unique: qWWe4mjzNiag5uFp_1EbEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F5048B78A5;
 Tue, 11 Aug 2020 16:38:37 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8753960E1C;
 Tue, 11 Aug 2020 16:38:35 +0000 (UTC)
Date: Tue, 11 Aug 2020 18:38:32 +0200
From: Andrew Jones <drjones@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [PATCH 6/7] hw/arm/virt: spe: Add SPE fdt binding for virt machine
Message-ID: <20200811163832.roxay4uafcyp3sed@kamzik.brq.redhat.com>
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <1663d06172cffa723e00893837ba04634f061fc8.1596768588.git.haibo.xu@linaro.org>
 <20200810110521.4hodliv4tl64v463@kamzik.brq.redhat.com>
 <CAJc+Z1HDokOuTA4=hzS5KHPU9w3Hm0UV=nJbjnvHEbtTpDY0Ag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJc+Z1HDokOuTA4=hzS5KHPU9w3Hm0UV=nJbjnvHEbtTpDY0Ag@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 06:40:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3NkZ7oMrMipR

On Tue, Aug 11, 2020 at 10:38:02AM +0800, Haibo Xu wrote:
> On Mon, 10 Aug 2020 at 19:05, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Fri, Aug 07, 2020 at 08:10:36AM +0000, Haibo Xu wrote:
> > > Add a virtual SPE device for virt machine while using PPI
> > > 5 for SPE overflow interrupt number.
> >
> > Any reason PPI 5 was selected?
> >
> 
> No special reason to choose PPI 5. Just re-use the setting in kvmtool.

Please write in the commit message that kvmtool has already selected PPI 5
for this purpose.

> > > +    fdt_add_spe_nodes(vms);
> > > +
> >
> > You didn't add any compat code, which means all virt machine types are now
> > getting an SPE FDT node, ACPI table change, and, most importantly, PPI 5
> > has gone from unallocated to allocated. We definitely need compat code.
> >
> 
> So the 'compat code' here means to only add the SPE node in KVM mode?

No, it means only add it for the 5.2 and later machine types. You'll see
what I mean when you study the patchset I pointed out, which is also only
for 5.2 and later machine types.

> > > +        if (switched_level & KVM_ARM_DEV_SPE) {
> > > +            qemu_set_irq(cpu->spe_interrupt,
> > > +                         !!(run->s.regs.device_irq_level & KVM_ARM_DEV_SPE));
> > > +            switched_level &= ~KVM_ARM_DEV_SPE;
> > > +        }
> > > +
> >
> > Did you test with a userspace irqchip?
> 
> No, I just tested with an in-kernel irqchip.
> Actually, the current kernel vSPE patch doesn't support a userspace irqchip.
> AFAIK, the userspace irqchip support should be ready in the next
> kernel patch series
> which will be sent out for review in the middle of September.

It probably doesn't hurt to do the above hunk already, hoping it will just
work when it's possible to test, but I generally prefer only adding tested
code. Maybe this hunk should be a separate patch with a commit message
explaining that it's untested?

Thanks,
drew

