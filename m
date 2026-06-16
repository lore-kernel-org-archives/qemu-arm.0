Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17593CD98CE
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 05:17:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZMB7-0004qH-8X; Tue, 16 Jun 2026 01:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZMB5-0004py-Ud
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:17:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZMB4-0000CC-Ab
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:17:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781587053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OCy4Ex5d91LHwkpXBa0T18tL4nURwIRokQbtf4Ze3/c=;
 b=B7ozDGwKy8yRhcwXc6Xx+ZbALtEVQ6JPHT3p+Heo6l68WspxmEyUOeOpxs5E7+hMRwFxef
 EbQfFUSxVksoWJKHggPz2fHfkr+f3am1xNWgplKAfv3XeVhp1CFQXee035NZFh9M4a4jCG
 aLaMFf4jqmseCqLw01xjgLLaTaew5QA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-EaUXd29tM92MRBQfRctX0A-1; Tue, 16 Jun 2026 01:17:31 -0400
X-MC-Unique: EaUXd29tM92MRBQfRctX0A-1
X-Mimecast-MFC-AGG-ID: EaUXd29tM92MRBQfRctX0A_1781587050
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-460129ef947so2818793f8f.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 22:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781587050; x=1782191850;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OCy4Ex5d91LHwkpXBa0T18tL4nURwIRokQbtf4Ze3/c=;
 b=ZXpCGQApM7L40bO5eW+R2EWoLh6glrvniWOEHruRLwbVtKPs9l09qB/3PeMiXkCOie
 TMxASVnH7Lu3ZWdkg52df+S7x5WkqApKZHbSj1W8ci9makPugWevE9whRr+C6+W0aNQR
 IXhOb+bLtLIOg0ZAxwiKjImdbTVbfSJ/g1CasT6mAGxH2hmiCnpDkQMw6GEWUlwToFLn
 /tCohXZFg5QtidMA6RF2oPeoMXIKypeA7luAW9U+SGDxyeS8EPZ4Q/tCtbUXMqocVPtT
 2yQX0UKRJCVwyVtBj6ilG1deSfS6Qm59ODj0sqplptOCUpd9gXEHFCyOamckdB5valAj
 m6jQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/JSMj0vjn7jGOF7ToiCsH4D01Z2sblgQ0rbuGMaibHN0MtuGWOnpcMCpuoZ4FXApZtARj45L1iVA==@nongnu.org
X-Gm-Message-State: AOJu0YyVUOwBf3KvT72LmD0Uw2OheLld+tcOCSt4b0cqy2JGIG43AKa0
 hFByNiNozreikav36h0Z5RH1Psgq1R3p8STPsXzKB15KfRKznX0XpmNjMXEFlyHaldHVmj+++go
 /1u6ldzK9z2mWqIsUgNFRR1T+K4oyGC437sp7oFrJc2U5rXCk7eFX9w==
X-Gm-Gg: Acq92OG0bkDQSC/ERh5n2vJMxIsAGNkJXnxowLQAU9PC13/nFOPwlwtUfbnLbmw2rvN
 KejP/n4B1YF43d1tn/VO+WMD31n9W7XEsTUNS6dy9HpFDN3WZFdmU5iP21SQyOFpS3Js6b2EbGE
 Z0qfCf796GR5Y5xHWXVR35nRNYNZ9Xw2LwXmJw3siLUrYK78lq7CbgnlaWL50FjjuXR2RALuLW5
 e4C4OlvecTq17M9s1fOzkk8A/7HuM2x9h7kHMCfHLOE1GGYxzJgi8+65YHpAEcomNJS9rali/HS
 6bPFBzQxpZ5TTi522QQ9ss41TlHBb7MqaRoJiDfXx1nmj72JU9bopC/tOdN9Jp0tIDJ7+ja6ygS
 N8p1Mw2gxDt8VziW8qNBMswXVJ0K3i9p+oal+Vn469BM=
X-Received: by 2002:a05:6000:25c6:b0:43f:e721:76b8 with SMTP id
 ffacd0b85a97d-4619f3c09f7mr3304258f8f.37.1781587050156; 
 Mon, 15 Jun 2026 22:17:30 -0700 (PDT)
X-Received: by 2002:a05:6000:25c6:b0:43f:e721:76b8 with SMTP id
 ffacd0b85a97d-4619f3c09f7mr3304215f8f.37.1781587049719; 
 Mon, 15 Jun 2026 22:17:29 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f4f6sm44690970f8f.16.2026.06.15.22.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 22:17:28 -0700 (PDT)
Date: Tue, 16 Jun 2026 01:17:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com,
 phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260616010544-mutt-send-email-mst@kernel.org>
References: <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
 <20260615105556-mutt-send-email-mst@kernel.org>
 <CAFEAcA9Gi43qNZoZcGtq8ioffGwOc_XuhoFAjGx7-bt4U8qfxw@mail.gmail.com>
 <e399ceb9-bc4a-4ba6-8efd-ed2742d0853b@redhat.com>
 <20260615154054-mutt-send-email-mst@kernel.org>
 <22d55870-b521-4002-add7-791bce8ea96a@redhat.com>
 <20260615224658-mutt-send-email-mst@kernel.org>
 <0038f601-7647-4547-a67a-c6a17fae26ca@linaro.org>
 <20260616004924-mutt-send-email-mst@kernel.org>
 <3880910f-4465-46c5-a5e5-daa2f70821d1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3880910f-4465-46c5-a5e5-daa2f70821d1@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qcSXH6IYrHqx6VycPnEBdccgAYX4d4Jv6jvwe1bavnI_1781587050
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Tue, Jun 16, 2026 at 02:55:52PM +1000, Gavin Shan wrote:
> On 6/16/26 2:49 PM, Michael S. Tsirkin wrote:
> > On Mon, Jun 15, 2026 at 09:48:00PM -0700, Richard Henderson wrote:
> > > On 6/15/26 21:23, Michael S. Tsirkin wrote:
> > > > B. Also on x86, I do not see why we should not use memcpy for large
> > > > accesses if we can. Better perf.
> > > 
> > > We have an example where memcpy writes to the same location 3 times.
> > > This is not appropriate for any host.
> > > 
> > > 
> > > r~
> > 
> > as in, same byte?  could you share the details pls?
> > 
> 
> This issue happened on aarch64 only.
> 
> https://lore.kernel.org/qemu-devel/CAFEAcA8dwHV8F48kb-013rxkG9kKcZhym9_qarKmoeUfeh0YWw@mail.gmail.com/
> 
> Thanks,
> Gavin

oh wow. thanks for sharing!

Still I think for sizes outside of 2,4,8 it's fine?
That is where the perf is.


-- 
MST


