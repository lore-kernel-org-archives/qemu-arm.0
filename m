Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AF7CD8C92
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 14:14:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWaju-0002PA-2u; Mon, 08 Jun 2026 10:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wWajq-0002Oc-EX
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 10:14:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wWajp-0002d7-4m
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 10:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780928040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q4+4h5fFP1NV0lwD5Y4zUMevjL/wV8Vxk3yfpGhh9WY=;
 b=PcprDRgw3NfqwfHoaWzdyULeZdIKRnm6iT4hz1gsFAG5fe58Dh6G/hM7AchQMDjSl1klm+
 7TFtVK14NvU4WI1qlhdJ28otVQ1BZLNBJncnAttX8ryoH+llcu2EbwEf4Cw3qh+sEvUZTe
 VetER+eFbgXMDg2sv8hQBi7S97zllwE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-MtUBJEBkP164TWHfbDaVNg-1; Mon, 08 Jun 2026 10:13:57 -0400
X-MC-Unique: MtUBJEBkP164TWHfbDaVNg-1
X-Mimecast-MFC-AGG-ID: MtUBJEBkP164TWHfbDaVNg_1780928037
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5175b7946d5so35874221cf.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 07:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780928037; x=1781532837;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q4+4h5fFP1NV0lwD5Y4zUMevjL/wV8Vxk3yfpGhh9WY=;
 b=I5q4MIz0dIa9zua6dnBvOEFyKyno9jzS/JIKFkiI8p+ucAUgqM7IFrWgcsVnBg3QvA
 kmUP6XBCUvm0hCGch7kWDeC91dF3XX8KTA367XGFfJp0+o15senit+eiBSvciT/wDwlQ
 ozomfCuogazi6CGXSyBK0Gphs3PKmwQ96QHNILk/+fdGBW38nkPJ8CeT1xZsMyaV9Ruk
 WRPttTTD3dOhaSswMq4lO9zAeqe26gfodxN+0SKLb7VYu3cJfHFQVj1V76wAMUAY3Kwa
 xXqgOkStRM/HIY2XikHKbEA0yKs3U8zjlsb/hwxfsvpenZP+x/Rh+1UuminKRNSzwYd6
 M/Yg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+1Qa1aqt7KDf33+EniCWk+zbDmhFXIfWq8AIX7dDaRhBej7tu8oNslPMWbLZa7euILarwgc21UNw==@nongnu.org
X-Gm-Message-State: AOJu0YyzgE7zr3om11IKlWI4Vgr8G94YBS7Rq3xXKxmf0jbyPDV6OLPB
 lKppFkQa5V0mGje3aSGcN3nKRB1Z++VOBfS7ScPhk3XUlGEYN7PONytAxchR1MO1B4WufmwoM7X
 emaLoA3o/B7Ll0Bu1UgOeJ0/L25NMCihrlLZM6gZVA2hV9dK6TW1O/w==
X-Gm-Gg: Acq92OEkJrXkayfilRtfl/8E7cC8Ob5qzU6obZoQAkPtmhgExxM0Vo+8xoBHJXbDniy
 HakYGTNgqJz6lJD3R0knyVy/LEyXXPosnW/69EW4Pzqs8hEexpbyoX2+3xZYK4MwxC2QE9wkICU
 M7/6j3YiVVsvmutAr5i6/FnIQNHyx8Y0SY1PIROFXucPBUMvld+V2pMkLtqmgNtNyI2/iAC+Ave
 9vMwpQ/VK13wfcbTFliBFISePTFZ2WhkDtG+OwAVyVQW6PcnRH18SnwTppPrQR5saNNXReUphkg
 avOiVStwXjnbY0QL6+TTp66WWwmXX1qHk8Rc/mbl0G295hkgiYlM2iJdudouqBUO1ONq75fgnM4
 7zRR4st8DjPh/B+8MKv6PZCSb+A==
X-Received: by 2002:a05:622a:99b:b0:50f:c2f8:4081 with SMTP id
 d75a77b69052e-51795c5b470mr213794841cf.53.1780928037111; 
 Mon, 08 Jun 2026 07:13:57 -0700 (PDT)
X-Received: by 2002:a05:622a:99b:b0:50f:c2f8:4081 with SMTP id
 d75a77b69052e-51795c5b470mr213794151cf.53.1780928036508; 
 Mon, 08 Jun 2026 07:13:56 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51795d46f12sm98892481cf.16.2026.06.08.07.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 07:13:56 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:13:55 -0400
From: Peter Xu <peterx@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 philmd@mailo.com, shan.gavin@gmail.com
Subject: Re: [PATCH] system/memory: Remove MAX_PHYS_ADDR
Message-ID: <aibOI4LfV7Wci7zt@x1.local>
References: <20260608002303.851456-1-gshan@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260608002303.851456-1-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RoxI8SvbR6xjYm4kPTCPodO4Sgu2nRWKvdeF2LyDZWQ_1780928037
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Jun 08, 2026 at 10:23:03AM +1000, Gavin Shan wrote:
> Remove MAX_PHYS_ADDR and MAX_PHYS_ADDR_SPACE_BITS as they're not used
> since the addition by commit 052e87b073cb ("memory: make section size
> a 128-bit integer").
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>

queued, thanks.

-- 
Peter Xu


