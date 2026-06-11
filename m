Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B63CD98CE
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 16:13:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXi22-0007wq-29; Thu, 11 Jun 2026 12:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXi20-0007vl-8K
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 12:13:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wXi1y-00026B-0T
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 12:13:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781194400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kf6Sev/w0rBNUJxDj3vhxE/lISnasr7flvFzrUIZvwQ=;
 b=TNANkiTzh/YJUzS/zt4yH8oQaGHwlyF45mFk9lm1LOMN/iAt+2j1+2+SuOpELxGDg58vZ9
 7GwNVCYUp9fLTB1uJE+BMFJ8cwrMp7fu9jWXH+tH5nLqeX1CXCMFj/0hG5NldhoatQV+G2
 pdC3ntczEo5VVdnzVPATVe0w7gumr+A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-4nmc2dvgOjKi2Zyxu0NqhQ-1; Thu, 11 Jun 2026 12:13:19 -0400
X-MC-Unique: 4nmc2dvgOjKi2Zyxu0NqhQ-1
X-Mimecast-MFC-AGG-ID: 4nmc2dvgOjKi2Zyxu0NqhQ_1781194398
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-45eef10d5ebso12044f8f.0
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 09:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781194398; x=1781799198;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kf6Sev/w0rBNUJxDj3vhxE/lISnasr7flvFzrUIZvwQ=;
 b=joNWjBSCY4zK8YIgQqUlyjdCqWc9vcL0O01UEc6rwD1wKZ6AagiMEB9b6Cq3c69sih
 dXJGEOwISPBZlxdmJ+PD96u082Px/zqRvctxEP6sqSfTe2VkCSWY2iC4Qd0MzcgVSjUZ
 Vg15OsHK4vH/JTEtVmciJbriZ6427VMrTqRq1KF+qZWNHMS49iZCe2xA0a8WlS3EvfHX
 6Ac+Ys75o0KrxqrwKceN68wPOboS7Zw0kaPt9XjQblJ5V6Tms+8hwqjglrEpzKb2L51F
 BtAeRRcc2Tqrbtz5SiMSs7CnRTC3vRIfDZGvvs+TFEI1HI5SyClmEfQbUfzIdjvCAf47
 1a5w==
X-Forwarded-Encrypted: i=1;
 AFNElJ83KlkzjVGxg1a3emJWq6/EJcUehqHcBn6/oPinrm7HayRuQJslNX0L38xrWTLhUn6g3YyfeDyckA==@nongnu.org
X-Gm-Message-State: AOJu0Yz7s8kZIAz/9Wb1On9tOzlQZlIpD3574lEep3vQ5wLYkXQaGkqj
 YVWhj45W61AHcAdidGHyCbflm6pQxIR7GDmH4WMw1L4zAD22pFLX43dmq1XxFlShZ/Kep/inLUj
 B+j4D8cTGHTfNOM0nFHj7Oqbmp2UIQ2J6pY055yCV8U0+x01vBokbkg==
X-Gm-Gg: Acq92OGAQKsawmzVkK2bYo3ZjllSckcTJxPbRSSFTEdDurfzM0VFf1QalHdxHkcsvXm
 YZkt8gjH+3WGGsadVBHPlldpMB7evFSdLbvBXdky+mAdtJ2wi57u2MK/3FTYe7lxQlPHr+aElPw
 QF4UPr+0V/+0pb6S3B7ove9he8MemNI0xcHivbtFAcUgC4SLOS9wNrqNEwjU1Hx82SblLTld8am
 4MaPtJL1qM99APJLdhcksdtqOx1igIijEzc4eOoyGvFXHvuPvOfz6ztoHvA24VuVCaRPV0SmUeP
 /2Wxgn4aoPLjS1SNIQ2CZnQ6PnDPmCL+l9LRnppcpFb/ndrrqPkesZpbtoP8bFtRQPSnlCZMEid
 Eh0aSmJDhMZKni9o9phchT0xyrhBCUVuAedlcA/9O07U=
X-Received: by 2002:a5d:5f82:0:b0:460:50a1:b23a with SMTP id
 ffacd0b85a97d-460677ae8e3mr5525637f8f.27.1781194397967; 
 Thu, 11 Jun 2026 09:13:17 -0700 (PDT)
X-Received: by 2002:a5d:5f82:0:b0:460:50a1:b23a with SMTP id
 ffacd0b85a97d-460677ae8e3mr5525589f8f.27.1781194397565; 
 Thu, 11 Jun 2026 09:13:17 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcbe3sm76782849f8f.8.2026.06.11.09.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 09:13:16 -0700 (PDT)
Date: Thu, 11 Jun 2026 12:13:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, Peter Xu <peterx@redhat.com>,
 Pavel Hrdina <phrdina@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, jugraham@redhat.com,
 shan.gavin@gmail.com, Alex Williamson <alex@shazbot.org>,
 David Hildenbrand <david@kernel.org>
Subject: Re: [PATCH RFCv1] virtio: Inherit max bounce buffer size from bus
 parent if possible
Message-ID: <20260611120325-mutt-send-email-mst@kernel.org>
References: <20260610121026-mutt-send-email-mst@kernel.org>
 <1e9515c9-7e32-4d95-9b73-aab8bf10bddc@redhat.com>
 <20260611012217-mutt-send-email-mst@kernel.org>
 <3726a607-6cac-41f1-b402-0eed7c4e3fe3@redhat.com>
 <20260611023428-mutt-send-email-mst@kernel.org>
 <0c3f1dba-3b2c-43c5-b181-1426f6da0951@redhat.com>
 <CAFEAcA8Q9qEaZS8wCpZQ-4jpAnQ9JXvnb7iSeRTdhJ9Y3BcCRg@mail.gmail.com>
 <20260611093049-mutt-send-email-mst@kernel.org>
 <CAFEAcA-8Hv0o3PibjH=8jixsHyunH2HkOAMQVqHkGr34b1Ascg@mail.gmail.com>
 <20260611110156-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260611110156-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8jsUKG0olAL75NI3_Fs2sQOj4_MHHVDG-KKsiJ6CrJ8_1781194398
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Jun 11, 2026 at 11:05:35AM -0400, Michael S. Tsirkin wrote:
> > If and where we need to provide guarantees about "this access will
> > really definitely only do this size access and it won't break it
> > apart or anything like that" then we need to either be using compiler
> > atomics or else inline asm.

BTW you meant intrinsics, of course, but speaking of atomics, they do
not work on device ram, or not yet. E.g. kvm does not support them
when exiting to qemu I think (only if emulating within kernel)
and it prints "emulating exchange as write".

We are quite far from "arbitrary access" even on pure device RAM.

-- 
MST


