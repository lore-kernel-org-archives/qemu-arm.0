Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BC9CE7A8B
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 08:46:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJpRT-0003oE-MQ; Fri, 14 Nov 2025 03:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vJpRC-00035E-Ud
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 03:45:50 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangfei.gao@linaro.org>)
 id 1vJpR8-0008Az-IV
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 03:45:44 -0500
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-59445ee9738so1277276e87.3
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 00:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763109939; x=1763714739; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pSZgTDfVYlYzcaesvXH7Usk9xJWzM+icnOyNSLsUgGw=;
 b=EpwnlRvpHjm6EyZFCauKmv5kq+5EZo6MAQOIe2kSO13d0XAQAapQGJ3ZU1qi9dTnvW
 FGOmH8b9/vQ7KZldsWXvJG6nsH4TWi4AqoptolcIpGRBg2gSEPUmVQA4UKFVZYGSMDjr
 4ChPcg4RRP1iDilF06TX9PwP9FJorlZVHfjZt/cEPpTeUK1qx3eXdUdDETQfZL85o+yK
 xiBhFY8q6YCR3ad9c/K0WfNtQLPnGg7l9olnbgGgh/xQIHkOkkliBtNvQ23AsPb+dMVD
 00Rqd7jli2ZcvGozo8UOzVtc4uXF9SV64Fs49waV8Itexo2IPoysBeQTqPfqQW0X7pY4
 NtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763109939; x=1763714739;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pSZgTDfVYlYzcaesvXH7Usk9xJWzM+icnOyNSLsUgGw=;
 b=iWoYF5r+zorp62udrNN9oDniBk29i8xlVvDW2onBEOFxU29APO76NN890qgARozBEJ
 M5jKwmEDVoJ+FjTrNrpb9D2wn+zBSkkO4bQY+j2p+VPKwkpMNUOxzA1LO7RlJp5xzM+t
 89EOxrTZahyGvMOFkEctOcWlijMyaiEY7aMfD+84v8frHuRZJZ2CNPGNGWkuqFIDh7u9
 m7WyNhzB4XbTsBLwTZKYp8UfCPsn2O/BS0pHYmKgQtvLzVFELZA97UDLQkb2ARm3gUmR
 SVmqsmwfJuDkyuVfoImklb6kL5vPckBEeEfUMkmEg17OuusoiLK3PjSHYBGb1zII/CeU
 dknQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDAisvyXlxPHbLcX+vdEg58zs0bUAMj5p2cp6qf/SYfuprioA4nBZqvERJ6WfKgFfrlhW8g62ESg==@nongnu.org
X-Gm-Message-State: AOJu0YxjsbSZaUlfKXcjgjsPvxfJWU47DCIK6yUfB6jxLW+JgvxE/W1a
 YRWwJOnUgS+UpVPmmLD8TAQjPZGG5vHOs0nxiRUPl7vawiyC8ak8Lo9vLmVt6rhL+HM37//ijiK
 b82Mupzq5QPQ0TfEryCGTLAqEX7iaiO8+PQIjqj5sCQ==
X-Gm-Gg: ASbGncsKPzOl/FYO9k9d1SiKKsFhwgPmnfg/17+wL/U/YnqKgsnVyNUABb/FBP40QvV
 RQSgGFlol3FbDu545A3TcjKNPbrvAywkLy8bB6e69orao3XVchWjOcEo68nDISmWNBmocnbRKRb
 OfNiD/slt1s6KyOwyn6fqJkcI0R+khiEoZLRC2V6SrZBIdv5+jlqm2eZWXL9NA6R2G+UGLJPlVt
 D1ZZB7nN1M/5ilDWTVAgM1TonYuftffv3srDAizhypZDvDollLmFUA7rlrUjHDYCQ==
X-Google-Smtp-Source: AGHT+IE1ENK/8zyQrs2bYplJ6X5ZU6UqHbQUAkaeq1/0Ev4+Mkoox49MJRES5T8aNqBwBGOMCQXOl83pBs+tMXM33+E=
X-Received: by 2002:a05:6512:2216:b0:594:522b:c6a4 with SMTP id
 2adb3069b0e04-595841c0afemr783032e87.23.1763109938625; Fri, 14 Nov 2025
 00:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20251105154657.37386-1-skolothumtho@nvidia.com>
 <20251105154657.37386-5-skolothumtho@nvidia.com>
 <CABQgh9HzB9yCD_rYjGFX5ZC7RX2e2iVu_FZPU2Vm-kuf3jfm+w@mail.gmail.com>
 <CH3PR12MB75481A1E302DD0C6F5FC195EABCDA@CH3PR12MB7548.namprd12.prod.outlook.com>
 <aRYY5eBnlw46nt2f@Asurada-Nvidia>
In-Reply-To: <aRYY5eBnlw46nt2f@Asurada-Nvidia>
From: Zhangfei Gao <zhangfei.gao@linaro.org>
Date: Fri, 14 Nov 2025 16:45:26 +0800
X-Gm-Features: AWmQ_bnsvrFWbogDzWDZ-TG7QQSX7YlDucAbK35a8B_SsciMeTJ-1ywwO4X9m38
Message-ID: <CABQgh9FYE6Jfm2iV7xGrydS5Yyk7L-VgArL4jOz=bCSdy5+HiQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] hw/arm/smmuv3-accel: Read and propagate host
 vIOMMU events
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Shameer Kolothum <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, 
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>, 
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>, 
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Krishnakant Jaju <kjaju@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=zhangfei.gao@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 14 Nov 2025 at 01:44, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> On Thu, Nov 13, 2025 at 05:07:50AM -0800, Shameer Kolothum wrote:
> > > On Wed, 5 Nov 2025 at 23:49, Shameer Kolothum
> > > <skolothumtho@nvidia.com> wrote:
> > > >
> > > > Install an event handler on the vEVENTQ fd to read and propagate ho=
st
> > > > generated vIOMMU events to the guest.
> > > >
> > > > The handler runs in QEMU=E2=80=99s main loop, using a non-blocking =
fd registered
> > > > via qemu_set_fd_handler().
> > > >
> > > > Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> > >
> > > Still don't understand how to use this vevent.
> > > Is it to replace the fault queue (IOMMU_FAULT_QUEUE_ALLOC)?
> >
> > No. IIUC, IOMMU_FAULT_QUEUE_ALLOC is to handle I/O page faults
> > for any HWPT capable of handling page faults/response. The QEMU
> > SMMUv3 still don't support page fault handling.
> >
> > The VEVENTQ, on the other hand, provides a way to report any
> > other s1 events to Guest.
> >
> > See how events are reported in  arm_smmu_handle_event():
> >
> > if (event->stall)
> >     ret =3D iommu_report_device_fault(master->dev, &fault_evt); //Page =
faults
> > else if (master->vmaster && !event->s2)
> >     ret =3D arm_vmaster_report_event(master->vmaster, evt); //This seri=
es handles this case.
> > else
> >     ret =3D -EOPNOTSUPP;
>
> Yes. We can say that FAULT_QUEUE is exclusively for PRI while the
> vEVENTQ is for other types of HW events (or IRQs) related to the
> guest stage-1. They can be used together.
>
> > > And only find read, no write, only receive events but no response
> > > (from guest kernel)?
> >
> > Yes. And I am not sure what the long term plan is. We can still use
> > IOMMU_FAULT_QUEUE_ALLOC for page fault handling or extend this
> > VEVENTQ  to have write() support for responses
> >
> > To me, from an implementation perspective, both this FAULT and
> > VEVENTQ look almost similar.
> >
> > @Nicolin, any idea what's plan for page fault handling?
>
> No. I think PRI should be done via FAULT_QUEUE.

Does that mean FAULT_QUEUE needs a response, so read + write
VEVENTQ only notify, no need response, only read.

page faults need FAULT_QUEUE to resume.
dirty page record in userspace for live-migration etc, just use VEVENTQ?

>
> > > By the way, can we use vevent in user space application? not in qemu
> > > environment.
> >
> > I didn't get that. Qemu is userspace. Or you meant just to receive any =
events
> > from host SMMUv3 in user spacel?
>
> If user space application follows the iommufd uAPI like QEMU does,
> it can. I am not sure about the use case though.

Thanks Nico.

>
> Nicolin

