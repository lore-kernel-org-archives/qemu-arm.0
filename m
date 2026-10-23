Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA54606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S2kPSjLf
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKE12-0000sS-HD; Fri, 23 Oct 2026 08:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1xKE10-0000s3-89
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1xKE0x-0000tU-NK
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 08:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792757090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ktFG9S7cIu86S66z6woz0uEJeRaYlQD7UfoTSNONZWI=;
 b=S2kPSjLfswkW3Ui3xIO+tGRdKjde7UuboyKe4nd9SiW3pwvCp+DmA+bPsGEQxQvMX+lXgm
 51hDMNY3Sw0Ikl2ujEMg3cosUeHuTxlVRo8XrNvYPSDbRd04ZQ6qHxRItUFTQXCRx/nd9a
 3lw1bbqGLdOu4BHQgojdUARnmCRmZzU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-BWDxzw2ONjKuTk9ofranZQ-1; Fri, 23 Oct 2026 08:04:48 -0400
X-MC-Unique: BWDxzw2ONjKuTk9ofranZQ-1
X-Mimecast-MFC-AGG-ID: BWDxzw2ONjKuTk9ofranZQ_1792757087
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-48af4046a3bso857180f8f.2
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 05:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792757087; x=1793361887;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ktFG9S7cIu86S66z6woz0uEJeRaYlQD7UfoTSNONZWI=;
 b=pr092fIGaxUCrFayu+2PqDTCG/4+o43d7QNhoLP3twLCTDAa6d1TDI1bvjhhDbzrUG
 rkjy+M6xfgfHyUvwl/XE0Mt3aEFBXpkcSrxgfDd4Qog9zFUFmNidwjqcVfGYDIzppW2j
 i3gL0vV6PZ/afYM51lHnO60qrynJh2PYQNKinggTYq2lfmfmtwpRuEJPPg1wqQ/kyMcp
 tN5ov4kwezAh8QBI7hJuTT0IeAkG87H33pAqWHurWanidcAMlXvFhNLZJz+T39fD5aZw
 JPi0lp93GaudYEOOD0jUJK8g5GOKnphu49YgZwnKBZm7Fm/yxsuBZjAgMdAGAtyHOa8o
 EGzQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBykltqGRyY3T1/LI1xup+xsMKP671K+el04u2WfP/jYOgVdmZffpkVcj+DlbM0mmKOffHsgdeVebQ==@nongnu.org
X-Gm-Message-State: AFq9FYI+XmiGHFslyy/YcCC8JFzf4xF0gzr95YKIVGaa/ncg5OIALM5X
 fnXr8REMfwjccSLL5zreQl7/XSDs9zoK7Vr7wIoAnfWVwTbiNy36YNDMDf/4mWqwIc4IohZRI9Z
 4oC2H43ztq4ubDATzIVMD2vbZ90x/xgiec6gnZ18yNWHU6ncCSAWOEQ==
X-Gm-Gg: AYBFou1CNtJc8UelXxZ0ZBB3CdDenPGnSuXKlbs3WDS8pzVpFCcRiy2leZ0xIcf+Z5b
 np5wmURmdUBzzbY6YQRkE3DJ49glzjno8TLIkVD7uMXAHsv6aTaHeNFOtF31jOFJvI90rbS6/0X
 6/tnfeMTNL5KuFFRClfsJ3OKaW+PizZrLJnYnB7U+b0mZyYGcFFTuIDe1kGvpSr1HuO0/lIxj7s
 uAlSJFkBmorEB3wt2iQ3tb3tGvQUH0SsAAB3dHOu0j0qfK1cudBh5dyhX7PX1hN41BflH1d9YPt
 oL4DVbea/1rHtMnTPYlZ7IEiM8hqEnMUc5ZpOej+y0+KzWhWDaRYKn0NVE1/WZeoxJYtkCY=
X-Received: by 2002:a05:6000:4a0a:b0:48e:1299:663f with SMTP id
 ffacd0b85a97d-48e385b0d95mr3400686f8f.56.1792757086745; 
 Fri, 23 Oct 2026 05:04:46 -0700 (PDT)
X-Received: by 2002:a05:6000:4a0a:b0:48e:1299:663f with SMTP id
 ffacd0b85a97d-48e385b0d95mr3400583f8f.56.1792757085931; 
 Fri, 23 Oct 2026 05:04:45 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73f6:2400:30a8:9e33:7d82:c035])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e37edce4fsm5022761f8f.6.2026.10.23.05.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 05:04:45 -0700 (PDT)
Date: Fri, 23 Oct 2026 08:04:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Hildenbrand <david@kernel.org>, Igor Mammedov <imammedo@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowangio@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Alberto Garcia <berto@igalia.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Jonathan Cameron <jic23@kernel.org>,
 Junjie Cao <junjie.cao@intel.com>, Anisa Su <anisa.su@samsung.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John Levon <john.levon@nutanix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-block@nongnu.org,
 linux-cxl@vger.kernel.org, qemu-s390x@nongnu.org,
 Sergio Lopez <slp@redhat.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org,
 Song Gao <17746591750@163.com>, Bibo Mao <maobibo@loongson.cn>,
 Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>, qemu-ppc@nongnu.org,
 Zhang Chen <zhangckid@gmail.com>, Li Zhijian <lizhijian@fujitsu.com>,
 Alistair Francis <alistair@alistair23.me>,
 Alexander Graf <graf@amazon.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 zhenwei pi <zhenwei.pi@linux.dev>, Ani Sinha <anisinha@redhat.com>,
 Luc Michel <luc@lmichel.fr>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>,
 Samuel Tardieu <sam@rfc1149.net>, "Denis V. Lunev" <den@openvz.org>,
 FangSheng Huang <FangSheng.Huang@amd.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Jesper Devantier <foss@defmacro.it>, Aditya Gupta <adityag@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>, Conor Dooley <conor@kernel.org>,
 Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Titus Rwantare <titusr@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Peter Xu <peterx@redhat.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Hendrik Brueckner <brueckner@linux.ibm.com>,
 xen-devel@lists.xenproject.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Fam Zheng <fam@euphon.net>,
 Farhan Ali <alifm@linux.ibm.com>, Alex Williamson <alex@shazbot.org>,
 Tao Tang <tangtao1634@phytium.com.cn>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Fabiano Rosas <farosas@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v7 54/65] qdev: adjust PciDevfn declared type
Message-ID: <20261023072206-mutt-send-email-mst@kernel.org>
References: <20261020-qom-qapi-v7-0-431a86b02b58@redhat.com>
 <20261020-qom-qapi-v7-54-431a86b02b58@redhat.com>
 <atsxLV5YZo8dr-8G@redhat.com>
 <CAMxuvazd7G_NBOM_c6BxZn5PFSw=XQUHueHqBoQQfpzPPgi9qA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMxuvazd7G_NBOM_c6BxZn5PFSw=XQUHueHqBoQQfpzPPgi9qA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b-qmV_sCoqXwzpTgWBecI6rFYcLiJjiFlgmKmcIX33o_1792757087
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.339,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 03:39:22PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Oct 23, 2026 at 2:04 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Oct 20, 2026 at 02:46:11PM +0400, Marc-André Lureau wrote:
> > > PciDevfn is a bit special, since it accepts integer and string as
> > > setter, but only output integer as getter.
> > >
> > > Unfortunately, we can't declare an alternate str|int QAPI type for it,
> > > since: branch 'string' can't be distinguished from 'integer'
> > >
> > > Rather than declaring it as "str", use the common type instead.
> > >
> > > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  hw/core/qdev-properties-system.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> > > index 5bfdfe1ab9d9..3381de1144d6 100644
> > > --- a/hw/core/qdev-properties-system.c
> > > +++ b/hw/core/qdev-properties-system.c
> > > @@ -904,7 +904,8 @@ static char *print_pci_devfn(Object *obj, const Property *prop)
> > >  }
> > >
> > >  const PropertyInfo qdev_prop_pci_devfn = {
> > > -    .type  = "str",
> > > +    /* The formatted string accepted by the setter is a CLI convenience. */
> >
> > IIUC, this is not limited to the CLI, it will work anywhere the JSON
> > syntax is permitted which is both CLI and QMP.
> >
> > libvirt uses this string syntax:
> >
> >   -device '{"driver":"pcie-root-port","port":9,"chassis":2,"id":"pci.2","bus":"pcie.0","multifunction":true,"addr":"0x1.0x1"}' \
> >
> > > +    .type  = "int32",
> > >      .description = "Slot and optional function number, example: 06.0 or 06",
> >
> >
> > Changing the type to 'int32', where 99% of usage is input only
> > and string based, is pretty unpleasant. Even more so that the
> > description doesn't even mention encoding dev+function as an
> > integer.
> 
> This is purely a metadata change, the setter still accepts both str &
> int, so I don't think this change blocks this series. But I agree we
> could do better.
> 
> There are multiple options. We could keep declaring the property as
> str instead. In this case, the getter should probably return a string
> for consistency and correctness. This might surprise some existing
> users though.
> 
> We could introduce new properties like `devfn-str` and `devfn-int`
> that alias the same value.
> 
> We could also introduce a new structured QAPI type.
> 
> Markus, what's your take?
> 
> thanks

I like the idea of a structured type. Will be handy for other things.

> >
> > >      .print = print_pci_devfn,
> > >      .get   = qdev_propinfo_get_int32,
> >
> > With regards,
> > Daniel
> > --
> > |: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
> > |: https://libvirt.org          ~~          https://entangle-photo.org :|
> > |: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|
> >


