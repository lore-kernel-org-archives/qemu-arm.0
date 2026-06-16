Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA33ECD98D2
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 05:33:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZMPm-0000wm-OT; Tue, 16 Jun 2026 01:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZMPg-0000w3-7V
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:32:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wZMPe-00048B-Hj
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781587957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C4t95kqxTSnyqUQ+eitu6vWt2c24Klc9Ps680/Aq6pc=;
 b=HkeCeIsrUp+u5rsPSwTHS65HdyKcDBLXrMjNA9S4q2jXyrZ2818J4HmaO+4UuhQr13yPSu
 4cjbjcIoCN3I20N9j/FyrelHZ6bBqnL9CGv/hH7hyXYBtnD3LxbLtyfhCPm+CB4xy9ttxx
 71+8+75iqy6GQylq7xFT2YF6R+lm3LM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-4GZzKjAOPhGDRtSshv49yg-1; Tue, 16 Jun 2026 01:32:35 -0400
X-MC-Unique: 4GZzKjAOPhGDRtSshv49yg-1
X-Mimecast-MFC-AGG-ID: 4GZzKjAOPhGDRtSshv49yg_1781587955
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-490c56e2576so32409485e9.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 22:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781587954; x=1782192754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C4t95kqxTSnyqUQ+eitu6vWt2c24Klc9Ps680/Aq6pc=;
 b=LYWSnywofcK8VxnulXezzujtqHcfU4IL6j3mOzri9YzJzDBU3xMLlSPF8TQPdm/6SN
 0Vgc/K8l2f7FYpLMw7W5HlYsZxmenj4Ve3qKPj4z55zZuDBkyillJzYh/qo3FvdB1O1V
 IQj4GzKz5f56LPgf2YLa5Z/kY8Y/9S+IAEstxuipxcJZKQql4g7anZMKc3K5RzncnFE0
 RybLEhP7pHpCIw08JZsLeFmlDOD/C1xx2t/Jt90OKdGwTFu6KLrZsPpc7HK95ILadKKl
 BbVtMrIPFmf3Js/wl9EtTkC2MsA06YQRFyIRHOJzXhLJqdfP19HELAQj1Qgl9ZOlCQQr
 LYUw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9xzU/+QR/TeFPIMe4LVUM56/hMJYOznXYiJkE+ziL8SgdXQiGqhMuALDD5GxuGdNozmMbfFPFa6g==@nongnu.org
X-Gm-Message-State: AOJu0YygT7wGxXzhAlxpMO+M7Z8rwfEwFMYO28AgjQt2NuHnYxgvhInp
 nfb8RNqTDEqSdrHdnlVbaTz3877BWjw+R2jvU5jXM+TrikBu7TZBNpi+E3RRHS9HhrJ+q4W1Gs+
 br3izHKYdcg9iUvZ8Dxk5fPZu+XFO9wRDJiu+1oD/QWC0BbYwnflz1g==
X-Gm-Gg: Acq92OEOFX1+/ta50f3suNCBmDZKYBMUdtKUlKyiDG9SCnVPbxb5QqB4vxTumJlBs0s
 nJzW90dT4zBReJUM1NNwHt+EZN+1ux5MVzsdwMx24ScCln7+Vuv0xEX7pqJ2YgV+jQ1b42qlo+o
 UNkLHKuMo8QBZGtR1J+62OGhU7xqeLKPiglS2EWgT6+gKJbpzQohxi5hq+QPk6wPx1GsHOpSNnM
 kU8X4Wa4FRKfSvhrPo3sCwMWSWIcGjdrN3aXgo81LETfhO5H9mwY4YM9t2X0iWQwzh8pztbcxVQ
 3rbANTUofgOW1pUoTuHp2qjCM8odtQ245et2Jr95RtmM0cr7LLFXlhvapE0C5gAbBifjwdPK5ZR
 B7H0RFSwcCpT7GK/JQIhDWw+7B6CdX1xQdvFLMNnTogg=
X-Received: by 2002:a05:600c:c04b:20b0:490:e1a6:25d with SMTP id
 5b1f17b1804b1-4922ff9b097mr23849645e9.26.1781587954422; 
 Mon, 15 Jun 2026 22:32:34 -0700 (PDT)
X-Received: by 2002:a05:600c:c04b:20b0:490:e1a6:25d with SMTP id
 5b1f17b1804b1-4922ff9b097mr23849125e9.26.1781587953919; 
 Mon, 15 Jun 2026 22:32:33 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a58fddsm29006145e9.8.2026.06.15.22.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 22:32:33 -0700 (PDT)
Date: Tue, 16 Jun 2026 01:32:29 -0400
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
Message-ID: <20260616012616-mutt-send-email-mst@kernel.org>
References: <CAFEAcA9Gi43qNZoZcGtq8ioffGwOc_XuhoFAjGx7-bt4U8qfxw@mail.gmail.com>
 <e399ceb9-bc4a-4ba6-8efd-ed2742d0853b@redhat.com>
 <20260615154054-mutt-send-email-mst@kernel.org>
 <22d55870-b521-4002-add7-791bce8ea96a@redhat.com>
 <20260615224658-mutt-send-email-mst@kernel.org>
 <0038f601-7647-4547-a67a-c6a17fae26ca@linaro.org>
 <20260616004924-mutt-send-email-mst@kernel.org>
 <3880910f-4465-46c5-a5e5-daa2f70821d1@redhat.com>
 <20260616010544-mutt-send-email-mst@kernel.org>
 <07119a34-d8d2-4e52-b566-267830b51a09@redhat.com>
MIME-Version: 1.0
In-Reply-To: <07119a34-d8d2-4e52-b566-267830b51a09@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iWec9UdWP92_PRK3yCzPLjcsJLs_uVKm-nEVSJX7f5A_1781587955
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

On Tue, Jun 16, 2026 at 03:21:58PM +1000, Gavin Shan wrote:
> On 6/16/26 3:17 PM, Michael S. Tsirkin wrote:
> > On Tue, Jun 16, 2026 at 02:55:52PM +1000, Gavin Shan wrote:
> > > On 6/16/26 2:49 PM, Michael S. Tsirkin wrote:
> > > > On Mon, Jun 15, 2026 at 09:48:00PM -0700, Richard Henderson wrote:
> > > > > On 6/15/26 21:23, Michael S. Tsirkin wrote:
> > > > > > B. Also on x86, I do not see why we should not use memcpy for large
> > > > > > accesses if we can. Better perf.
> > > > > 
> > > > > We have an example where memcpy writes to the same location 3 times.
> > > > > This is not appropriate for any host.
> > > > > 
> > > > > 
> > > > > r~
> > > > 
> > > > as in, same byte?  could you share the details pls?
> > > > 
> > > 
> > > This issue happened on aarch64 only.
> > > 
> > > https://lore.kernel.org/qemu-devel/CAFEAcA8dwHV8F48kb-013rxkG9kKcZhym9_qarKmoeUfeh0YWw@mail.gmail.com/
> > > 
> > > Thanks,
> > > Gavin
> > 
> > oh wow. thanks for sharing!
> > 
> > Still I think for sizes outside of 2,4,8 it's fine?
> > That is where the perf is.
> > 
> 
> For that point, I agree with you that it's fine to use memcpy/memmove
> when the length is 16-bytes or more,
> unless Richard is concerned by
> this.

yea size cutoff is a heuristic but i guess it's the best we can do.  or
disable memcpy completely if Richard feels strongly about it. But it
seems like a waste.


> I'm posting (v3) and lets continue the discussion on (v3) series. Sorry
> for taking your guys so many time to review and discuss ;-)
> 
> Thanks,
> Gavin
> 


pls do include the list of issues and high level solution in the cover
letter though.


