Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B3EC44512
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Jul 2026 05:58:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmPyY-0005i3-DH; Wed, 22 Jul 2026 01:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wmPyR-0005g5-LJ
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 01:58:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wmPyP-0004Zs-4a
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 01:58:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784699907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7BkccaR1uokwsOjKCRUwtV+a/1p1EBlXJrKJxvfWhKw=;
 b=GsIHtihTLDzElxsXTJ7zDWAwOY7+hgMidX5BoWYHuPh/iwT3Ord9TB6u9bJ75d54j8xa0v
 XDSF1uwqD+Bq9HM6SsElzjmv5tEOS4V2eFjSFhZiPfyn01i5k6Kl4KjrgMgU3i6r1OM0rL
 hf08aB6vZol+VNK2wsVp6QkxL2OKqEM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-kFQv8VteO8-mLAj6cLe2Fw-1; Wed, 22 Jul 2026 01:58:24 -0400
X-MC-Unique: kFQv8VteO8-mLAj6cLe2Fw-1
X-Mimecast-MFC-AGG-ID: kFQv8VteO8-mLAj6cLe2Fw_1784699903
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-49554715277so37519515e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 22:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784699903; x=1785304703;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7BkccaR1uokwsOjKCRUwtV+a/1p1EBlXJrKJxvfWhKw=;
 b=UhyyxCjt9dhVQuEOo4/D7ilQ9HQB1SGlD43/mjZ4+QRm4fEz1jZMxUKaRsySZ14RSP
 Rf3Zd8/NGdEn1xXiGtumOP2lmrCt10tBS5Bf27CWghVuGeFmGVSBpm+e5Ty7PfSNoDNZ
 vizwD+KMq37UjIKJ5b8rSSQQbgr0DTvJhwhFNctO/ydKs01gANym+wJybBLgHvrBsB4k
 7vjdU9E4wwaBzFZb+J1Z4s+ZqTUXnsUF0V+4wDBDqz4NB0GeNcrORMdMSUyBd1o0AO6A
 q6jZH2L25JTH86xan9VXKACRMlBPmUotfretn+QfmSb+ahHj/Z4++F4hpfbRPy3/9sje
 AnmA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrH1KoV7bImd9jZ/IA0xVsXPo40xsuUfCJmo61WtqYjgDr/+lCmhrP+EJweamWV9X7X7mnmQ2jQJg==@nongnu.org
X-Gm-Message-State: AOJu0YzUDUV6maQAQ17zVviH97FqxN48uovH1+kkHiI3RRAFvfLI4K8f
 i2mXFmsBBZD0/I1Sb15opuRHSKZJKjVIe+JqrQa/GPHNbfkRGg8khquIy82LeZQr26wEgddX5Uo
 1kWn7umWtIvsw4VZq77EbY19O3J5npS3K1SPNOCLnw25GFUUsTbmIBg==
X-Gm-Gg: AR+sD11NadT4iuBa0GDk0yKPTukp7ZjTaFPwQqjiO2w5Hdz+c+TWsFohiL8veWgCirM
 XMn8/LyKzpnpeOR8a5OLECd3xLzVOCVRQI0xrySw6nMru+ZDOXXx5Ac/hNvU2Jw0d38v5z81nL/
 VOei5Q+IhorYddU/X2XCUOVyBDv4sO98IlSi0oaNUs7Igxo6VDefXCz1KdesOIXscOmcy5aM0lU
 vZi4vUh7+6OPf3aDmWyoIPv2QFFdkIk2GvkEsNJnU34jG11RwhnCrprzUM9g9W6whyteMpvWz0+
 aaZrYUl2jujIbI8RQntFbTJbGI8kx70Fx+fbRK4B9EhT1X/sv6IKHfPMAKjqVDXkAg2qK2WhmRx
 yKVTwbskkxIfBM7J+QesQDA==
X-Received: by 2002:a05:600c:b85:b0:495:5365:c0d1 with SMTP id
 5b1f17b1804b1-49553d85ea0mr194619055e9.14.1784699903264; 
 Tue, 21 Jul 2026 22:58:23 -0700 (PDT)
X-Received: by 2002:a05:600c:b85:b0:495:5365:c0d1 with SMTP id
 5b1f17b1804b1-49553d85ea0mr194618795e9.14.1784699902790; 
 Tue, 21 Jul 2026 22:58:22 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-37-66.inter.net.il. [80.230.37.66])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956a6354a3sm68290795e9.10.2026.07.21.22.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 22:58:22 -0700 (PDT)
Date: Wed, 22 Jul 2026 01:58:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Peter Xu <peterx@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex@shazbot.org,
 richard.henderson@linaro.org, berrange@redhat.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com,
 phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn,
 shan.gavin@gmail.com, qemu-s390x <qemu-s390x@nongnu.org>
Subject: Re: [PATCH v3 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
Message-ID: <20260722015422-mutt-send-email-mst@kernel.org>
References: <CAFEAcA8UjtXgmPC27fOKMwbaWs2piwGYudtwCNWQHuu3E_7A-A@mail.gmail.com>
 <5faf04b9-d596-4a1d-9fe3-5e9ad5f0a99a@redhat.com>
 <73f79841-8cc7-4ca6-8f6b-fb97b53a6fe8@redhat.com>
 <20260717091756-mutt-send-email-mst@kernel.org>
 <CAFEAcA-O6Z4JrVV0DL_tta6khRyUta_Zz5mJt6OszaW1mu0o6Q@mail.gmail.com>
 <20260717095407-mutt-send-email-mst@kernel.org>
 <9c2ad22a-e768-4a07-85a2-01ce1fc14368@oss.qualcomm.com>
 <59882c5b-545d-4768-8bf4-723fed97a801@redhat.com>
 <al-eCtxGjG4HHEbl@x1.local>
 <6210e178-a93f-4411-810a-41edb1fb656e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6210e178-a93f-4411-810a-41edb1fb656e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: us-60c1Krjfghl9XPviu1g1lcMPLkZBLPKEXH8GaFPY_1784699903
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: permerror client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Jul 22, 2026 at 10:53:27AM +1000, Gavin Shan wrote:
> On 7/22/26 2:27 AM, Peter Xu wrote:
> > On Tue, Jul 21, 2026 at 03:37:53PM +1000, Gavin Shan wrote:
> > > If Peter is fine with two variants for x86 and non-x86 architectures.
> > > I can post (v4) for further review. That will be something like below
> > > and let me know if there are any other improvements are needed.
> > 
> > I have a generic question on the "unaligned access for x86": I think the
> > question is about the one Michael raised here on unaligned access may break
> > x86 here:
> > 
> >    https://lore.kernel.org/qemu-devel/20260617022330-mutt-send-email-mst@kernel.org/
> > 
> >    3. (theoretical concern) also on x86, unaligned accesses are
> >    possible on guest and host, so converting an unaligned access to a
> >    series of aligned ones can in theory break devices.
> > 
> > Is that a real problem we need to consider, or can we start with unified
> > approach and leave it for later?
> > 
> 
> I'm leaving this question to Michael.

Knowing what I know about hardware designers, it's something someone
somewhere does)
It can be made a separate patch, just to show - it should be all of
~10LOC.


> > PS: I apologize if I missed important piece of info along the way; I didn't
> > follow closely on the discussion on this topic in the past few weeks.
> > 
> > One thing to mention is, what we change should only need to affect
> > ram_device, AFAIU.. so most memcpy()/memmove() shouldn't be changed for any
> > arch when it's pure RAM.
> > 
> 
> It depends. This patch intends to fix issue [1] in the lower layer by using
> the newly added accessors (qemu_ram_{copy, move}) on all directly accessible
> regions including the regular (pure) RAM region. Otherwise, the newly added
> accessors should be limited to ram_device regions only as you said.
> 
> [1] https://lore.kernel.org/qemu-devel/20260527091711.3901-1-liugang24219@sangfor.com.cn/
> 
> Thanks,
> Gavin

using memcpy()/memmove() to emulate guest's atomics is generally
kinda broken.
but yes there are architectures where doing it to device ram is
more broken than doing it to regular ram.


-- 
MST



