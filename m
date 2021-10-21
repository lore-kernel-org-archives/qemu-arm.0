Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp95178lfc;
        Thu, 21 Oct 2021 02:10:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwe9XxJZPFZIt+e+tPTA1BTEbxM3Rw/Tvw2inNz7mNxOVYcFqmkTY0Alrlyg6SnVwNG60a0
X-Received: by 2002:a4a:4fcf:: with SMTP id c198mr3468990oob.26.1634807409384;
        Thu, 21 Oct 2021 02:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634807409; cv=none;
        d=google.com; s=arc-20160816;
        b=wX/LC0+rbc36icy3txCuKlErBshy8H74AqClcdJMmym/bgFEBG4+6HzXiSQNYj8i0l
         GssYkZgNPP5cWLCGLa1vtZ3bpBsgqZaKVkBZn3AS5NVWFSGk8bj0dh6e40wa4rvh8V24
         Gh1/AIsH7DIHyYpo5fUDzl4ZZoC/7F3aCqqcrzHj1AnVXzG5cC6xt3+U/aFEvBG+Sftw
         d89y1Yi4UcaJV8T8GxPLCwNv43dI0zuZ2+GeKhDcs2Rer2oG0AAC+Kwf/dZAGVclEvlS
         uhi5BQfExI3gN4vLzOcZnOujrc+I0BdyaTp8OlAxVX0WHY2+MoUQeUMr+wIF9A1+2EOc
         VQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=DcTjt3MRoOSSA/34Ra7n4A8rKWESK5AOdqUSmFbo/TQ=;
        b=rfY7bMogesjCmNg+jMLgStLaPkS9lexA/yxBTS/tjJNwg7HZIymY+w8rP4l0qQeoT0
         kjKiiT3vX/be+hyr5T709W1dRDDBiqlJJH54eiFZLDV+BVD1wANQQdpMdAHqkXLGOqEy
         ffL+ll/f48VR9FuxfGSOF25yPbDRQF47v187VmnWI0QIl7eRcmwX9GWBNKZ/HKaOwq0k
         yjL1z7xM6G412mmNBnLBlmdt9pVD7FLsOqhcelc5ea11JRnUgeEgQY+x9Ntnfk9cxMfn
         XGZBGaH4xGiiu9u3q0dJo51wgmuPHejMkpl1YbQLPwTAICBe3KFd6vl+qUowuIMdEiAq
         ONgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LCF2e7kG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24si5308236ood.10.2021.10.21.02.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 02:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LCF2e7kG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdU5Q-0007se-Gt
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 05:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mdU3w-0005uQ-W5
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mdU3u-0005SX-81
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 05:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634807313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcTjt3MRoOSSA/34Ra7n4A8rKWESK5AOdqUSmFbo/TQ=;
 b=LCF2e7kGYTr+luk0xUdrn75x84TA/Zm62g59GNEvSu60XaRqR495kTVILcUyvbWTicrKfv
 ihYHJ/2Hqf1u3NtZ4oiSxrWdVBI/R5/tIGF1Ki+kiyMWgtaij4NROdS120Q1K0sSwIyCJ/
 Qq64dnzRa3LyyPPF2FzAat4UX0H9nLg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-s4g8GQLuPeuuhh0ZUMQNvQ-1; Thu, 21 Oct 2021 05:08:32 -0400
X-MC-Unique: s4g8GQLuPeuuhh0ZUMQNvQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 s26-20020a7bc39a000000b0030d9db6c428so4903273wmj.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 02:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DcTjt3MRoOSSA/34Ra7n4A8rKWESK5AOdqUSmFbo/TQ=;
 b=O9df5+I3WHg5dXxvdikZCEnZdlC18YmT4X4JDhhP92kI82Vbs/Kd/i2ViAN6ERXavp
 eDcnApZKiqYa4n8AI0FdKgOaM9XbFgkocMg/prON/GUU7Cufi4jQc68KK8tTWZoNgZHO
 mlxz4vh0CwzVSVQ3K4jww18qJzsf7kFwh0/Muofo2IXd8P/pgE5dfWdfxeXvjlCdy29K
 fX/STuZVEI8B0Rc4C5XSUkNllK7C1xKIWPJMWXzbcSYLXNWU7i1PcnoynbpCWsNTB1l1
 kP+hyAqMeyuwxolIIfMzl8fuW0WoRS6f7R1lDibr3N3FJjql/8UJhUJnULL2H3vRSFrO
 3JPg==
X-Gm-Message-State: AOAM531enNIhOIHOxm7cKzHlNXVKBTMRnvqn3lHXhq/7fFTvykg2Gt3w
 PLcWcLKhw6LuVAIVjVrDktiERwXiKAkqrrlBWxaNll706N3LHCo2flPMhU3GjsoeDU7e8H1qG39
 b9PtPGa24NCW7LQM=
X-Received: by 2002:adf:80cd:: with SMTP id 71mr1470169wrl.429.1634807310952; 
 Thu, 21 Oct 2021 02:08:30 -0700 (PDT)
X-Received: by 2002:adf:80cd:: with SMTP id 71mr1470138wrl.429.1634807310761; 
 Thu, 21 Oct 2021 02:08:30 -0700 (PDT)
Received: from gator.home (cst2-174-2.cust.vodafone.cz. [31.30.174.2])
 by smtp.gmail.com with ESMTPSA id i29sm868520wmb.6.2021.10.21.02.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 02:08:30 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:08:28 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH v8 5/8] hw/acpi/aml-build: Add PPTT table
Message-ID: <20211021090828.2nt6l55nrazzsa3d@gator.home>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
 <20211014132206.19220-6-wangyanan55@huawei.com>
 <316edbd3-2235-efb1-7176-e3f477aec6a4@redhat.com>
 <1f4eaecf-8718-fc8a-5366-7e32945b9953@huawei.com>
 <2651e5c8-8cd0-e912-2f62-f7393bf49aa3@redhat.com>
 <9c51d6bf-8ed4-6aff-c503-f123190efcae@huawei.com>
 <f6c0dc0b-aad7-bfe9-c355-9879ce6a798e@redhat.com>
 <97c13d4a-d464-015d-d901-cf93534cf0d6@huawei.com>
MIME-Version: 1.0
In-Reply-To: <97c13d4a-d464-015d-d901-cf93534cf0d6@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Eric Auger <eauger@redhat.com>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8VH14vEjFRZU

On Wed, Oct 20, 2021 at 08:53:00PM +0800, wangyanan (Y) wrote:
> > > > > > Table 5-149 of 6.2 spec (6.2 May 2017) tells the rev shall be 1. Or is
> > > > > > it an erratum somewhere I did miss?
> > > > > Yes, the revision in 6.2 spec is 1. And it's 2 in spec 6.3.
> > > > > So just to be sure, should I use the oldest revision ?
> > > > If you need (and use) features (such as flags) introduced in 6.3 then
> > > > you should say the code complies with 6.3 and update the above comment.
> > > The comment /* ACPI 6.2: 5.2.29 Processor Properties Topology Table
> > > (PPTT) */
> > > tried to explain the first spec version where PPTT is introduced is 6.2.
> > > But it may
> > > adds some confusion. I think it's better to replace it with:
> > > /*
> > >   * ACPI spec 5.2.29 Processor Properties Topology Table (PPTT)
> > >   * (Revision 6.2 or later)
> > >   */
> > > 
> > > just like our build_slit().
> > That's not my understanding. I think we usually point to the latest spec
> > revision you comply with, ie. in that case 6.3 chapter ...
> Ok, I get it. Would
> /*
>  * ACPI spec, Revision 6.3
>  * 5.2.29 Processor Properties Topology Table (PPTT)
>  */
> be ok ?
>

Yes, we need to call out the oldest spec we can for the functionality
we're using. In this case, we're using flags first defined in the 6.3
spec, so we need to call out the 6.3 spec.

Thanks,
drew

