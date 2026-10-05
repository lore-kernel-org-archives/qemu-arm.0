Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00227CA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 13:24:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDigN-00065W-Nx; Mon, 05 Oct 2026 09:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1xDifo-000612-BB
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 09:24:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1xDifl-0004PN-Fl
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 09:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791206644;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KV90x+3zFHk7cNPd+HxS6xQi8Qt1QYZt5hhvtroAleM=;
 b=T/Y+YnvXbmvaLw8lQ6MX75OXGbS93refGl5w/m82I/GxVtdRZrAW5XDSP3xCv3HiCMSvIE
 /572UkrBE+Wz2I6deATUtHQuZkjXWYDLh/TMQ0TomgUx/YXgLoRUYj/5RHJuwAGtPRkqO4
 3N4Uo/R8kXx7N7Ioc+DVVbvvgntRXg0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-63-obwuuQIhOZGiBRqBapSW4A-1; Mon,
 05 Oct 2026 09:24:02 -0400
X-MC-Unique: obwuuQIhOZGiBRqBapSW4A-1
X-Mimecast-MFC-AGG-ID: obwuuQIhOZGiBRqBapSW4A_1791206641
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B00DE18345B8; Mon,  5 Oct 2026 13:24:00 +0000 (UTC)
Received: from redhat.com (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B0D4F1800446; Mon,  5 Oct 2026 13:23:57 +0000 (UTC)
Date: Mon, 5 Oct 2026 14:23:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 01/28] hw: mark secure machines for x86, s390, ppc, arm,
 loonarch, riscv
Message-ID: <asOk6i4CNT9P6Bs-@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-2-berrange@redhat.com>
 <f1481bad-4dbb-414c-801e-aa24a6977b18@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <f1481bad-4dbb-414c-801e-aa24a6977b18@oss.qualcomm.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: U929WDgGlhmooGFuiZBsLp_6OQl-BDtjTdarfnbw72M_1791206641
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.24,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Oct 05, 2026 at 03:06:08PM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 11/9/26 16:36, Daniel P. BerrangÃ© wrote:
> > The versioned machine types are typically present for use in
> > virtualization use cases and can be expected to provide a security
> > barrier. The only exceptions are the m68k versioned machine types
> > which are only used with TCG. There are also a handful of other
> > machines declared secure in docs/system/security.rst, notably
> > the Xen machine variants and microvm.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   hw/arm/virt.c              | 1 +
> >   hw/arm/xen-pvh.c           | 1 +
> >   hw/i386/microvm.c          | 1 +
> >   hw/i386/pc_piix.c          | 4 ++--
> >   hw/i386/xen/xen-pvh.c      | 1 +
> >   hw/loongarch/virt.c        | 2 ++
> >   hw/ppc/spapr.c             | 1 +
> >   hw/riscv/virt.c            | 1 +
> >   hw/s390x/s390-virtio-ccw.c | 1 +
> >   hw/xen/xen-pvh-common.c    | 1 +
> >   hw/xenpv/xen_machine_pv.c  | 2 +-
> >   include/hw/i386/pc.h       | 1 +
> >   12 files changed, 14 insertions(+), 3 deletions(-)
> 
> This patch should be split per machine / area of maintenance,
> so maintainers can officially Ack their commitment to security
> boundary for their machine.
> 
> I'm not sure LoongArch / RISCV / PPC are. If this was previously
> discussed, then pointer to the public discussions should be listed
> in the patch description.

Those are explicitly documented here:

  https://www.qemu.org/docs/master/system/security.html#virtualization-use-case

so this patch is just encoding what has already been defined.

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


