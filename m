Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8960C44501
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 10:48:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viVkt-0008WV-6S; Wed, 21 Jan 2026 05:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1viVkr-0008QC-Q4
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 05:48:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1viVkq-0004vQ-26
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 05:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1768992482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+vEGM6XueGM1k54WR55mXkTwPqR248mBuPTaVKfXT/Q=;
 b=am4YMRBoBu4k1k8mk6CLzRDAGXz0TDjLA1u06MeD4jeTb+9FwdDhLuKIGvSeJovnWnQrhV
 jTb0C86QsM3vxghBhJhKeTAQ8FoHSU+HaRdvse4Af9j5pfkbr/NhAWUmdSeBTl+WZGyeJ5
 UVJ10KWgSqk5cPv3KcsORuQNlSOw/+I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-bkFz_gC0MVa7xT1ZYuSPog-1; Wed, 21 Jan 2026 05:48:01 -0500
X-MC-Unique: bkFz_gC0MVa7xT1ZYuSPog-1
X-Mimecast-MFC-AGG-ID: bkFz_gC0MVa7xT1ZYuSPog_1768992480
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-430f4609e80so4366581f8f.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 02:48:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768992480; x=1769597280;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+vEGM6XueGM1k54WR55mXkTwPqR248mBuPTaVKfXT/Q=;
 b=COovYTQ71s8FFZJe1U7uBaofhk6eOvWnkQUOz8BaUK43IV8bXF2ftbFqqRFkrz0wOy
 Ons4jyOI9gNNWpVTw1EtBziWz9BJDC7gTRdvyEp2ZR/OcdOi/ElWIsI5sRjmlPfpp+3H
 VMT+i2Jb/iaISESC6zUicBfsAaAO4KPC09sVq4IeDmfcx1Mx4LVgNJgPpyyK8vOXLRwH
 tVT6GOQNdJyY97XAfC1FdwhQPJc9rkDpmKaFg5Qd+k/Ywc1Xm1m9GzHlUoeOwDbtN3Oq
 tDERDa5uJ+LqmRMnyyzLiCY92q5YHGN7EOp6wFro/BngL3kcxQsXVTI1NS8g6U2Gamnr
 42+Q==
X-Gm-Message-State: AOJu0Yyk1Et0lOuTD1m2esK/QpYxrGEchLjkLWUk3jPKy8yY+UbNElwQ
 qprt/PonJb9OXJPlf/QsM0VnFoCRzvALU99nrtDqB/Xe11Wwl0sHKzXoECQUDcgmCl3E9i6/E+k
 CSf8kkVh6ZhMvOGhZk3kZ7mG0GnekGbg4TfSoQWf0ATvrFtPwTiJAlQ==
X-Gm-Gg: AZuq6aIVTleeJ81iIPEfWsc9D9pjIKwvhDGsO3ei7Y76eXPd2sJtlnRbpuKLZ0iKtV7
 RzSa+nFhXpa4ufao8+viKgWoIYCTII0hqm8AVOc+ro6yuWWmjBc8gHHVrhPlrnuCMN+n7gzdkQl
 zRk6d0dm9fwSAaaUHUOH2LbyxINQHm6rvwtC+qhCIaHSNjDkDSy9pFzkHVdG6Xjjdyg544SqKk4
 q4lisDnBKV0ABoWRIBohdqG3kcQgijsWQqxqPPCl9WP0laXfmTyFcnNc+cJ/o5BCRHDDGemrAJA
 OSvhUHaTkilKBNPII9DQr2FSjsNLucVaKEnORWqRKwNeDr5i/nwSv7xZpvvVJRzHLFmviyJoHwD
 fDiM7cKoSzq4u6PQGJSjZ1MW7S4tjikE=
X-Received: by 2002:a05:6000:420a:b0:430:fdc8:8bbd with SMTP id
 ffacd0b85a97d-4356a053899mr23120719f8f.41.1768992480186; 
 Wed, 21 Jan 2026 02:48:00 -0800 (PST)
X-Received: by 2002:a05:6000:420a:b0:430:fdc8:8bbd with SMTP id
 ffacd0b85a97d-4356a053899mr23120670f8f.41.1768992479708; 
 Wed, 21 Jan 2026 02:47:59 -0800 (PST)
Received: from redhat.com (IGLD-80-230-35-22.inter.net.il. [80.230.35.22])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43595e0a6fasm7575519f8f.10.2026.01.21.02.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 02:47:59 -0800 (PST)
Date: Wed, 21 Jan 2026 05:47:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex@shazbot.org" <alex@shazbot.org>, "clg@redhat.com" <clg@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "vivek.kasireddy@intel.com" <vivek.kasireddy@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
Subject: Re: [PATCH v3 1/4] linux-headers: Update to Linux v6.19-rc1
Message-ID: <20260121054736-mutt-send-email-mst@kernel.org>
References: <20260116092950.15796-1-skolothumtho@nvidia.com>
 <20260116092950.15796-2-skolothumtho@nvidia.com>
 <20260120135151-mutt-send-email-mst@kernel.org>
 <CH3PR12MB7548E062FB7E82F29093E1B3AB96A@CH3PR12MB7548.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CH3PR12MB7548E062FB7E82F29093E1B3AB96A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IpxBHet8hTawXWjLnQHWIo6QnBLUfJmDlpiyk9Q4lt4_1768992480
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.087,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Jan 21, 2026 at 08:24:14AM +0000, Shameer Kolothum wrote:
> 
> 
> > -----Original Message-----
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: 20 January 2026 18:53
> > To: Shameer Kolothum <skolothumtho@nvidia.com>
> > Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> > eric.auger@redhat.com; alex@shazbot.org; clg@redhat.com;
> > cohuck@redhat.com; Nicolin Chen <nicolinc@nvidia.com>; Nathan Chen
> > <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Jason Gunthorpe
> > <jgg@nvidia.com>; jonathan.cameron@huawei.com;
> > zhenzhong.duan@intel.com; vivek.kasireddy@intel.com; Krishnakant Jaju
> > <kjaju@nvidia.com>
> > Subject: Re: [PATCH v3 1/4] linux-headers: Update to Linux v6.19-rc1
> > 
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Fri, Jan 16, 2026 at 09:29:46AM +0000, Shameer Kolothum wrote:
> > > Mainly for adding support for VFIO DMABUF. While at it, update all
> > > headers.
> > >
> > > Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> > > Reviewed-by: Cédric Le Goater <clg@redhat.com>
> > > Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> > 
> > This breaks bisect (next patch fixes build).
> > Pls come up with some way to avoid such breakage.
> 
> That's right. Can we fold the next patch into this one? That would be
> the easiest thing to do, if that's acceptable.
> 
> Thanks,
> Shameer

That's one way to do this, yes.


