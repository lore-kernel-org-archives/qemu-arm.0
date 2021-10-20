Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1696883lfc;
        Wed, 20 Oct 2021 08:19:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN2+yVAVHVKwsK9H4Ch1Uef8u2LttfluXhalE/lnzuYeRSDvwRFEA2HuhI6yaekVwo53YP
X-Received: by 2002:a05:6830:4c8:: with SMTP id s8mr364552otd.359.1634743170611;
        Wed, 20 Oct 2021 08:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634743170; cv=none;
        d=google.com; s=arc-20160816;
        b=TZuliSYHlhmfxSvUs46qyKMXKT5qCRdgiZia5fMpld8zhXopK1JJb/4/hvGUJu52tO
         qV3Ps5alZGaaEjjeF+uKrW5DRbEseIZg53RXh4c6bBlvDI/Y0AwXqU5BVH4QMS305Obr
         ptu+oZNG+ttZ5UUxC7J7yPWpsz2/otULaMuHoX+G+CsrNDtQ40ItaESRaLen1ilO7XIE
         +IDfY98g02lrD4mGte0tO8I8YkC4W3XUl3cN2AxASsNkuEbJ/tYFCW02Jc7vDJojzWD2
         UDnMse923BlM2heRVETAt8XFzrynJdvv2QEwAH3lvpVthK59Zk+HRNUE927q+X7/wsHn
         21nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=LF+oqdbhhv44LY9JasX2H465wzrRGDRDwrw3Hf8U89c=;
        b=hyXm3eUOGPp+FiQzM+ILxweAXzryYDtnjmQ8I+iMkjmuWvqPrZkpZFRSQl4GsgGUbU
         bK1kw6X1EfgIQx61mV4bNxe/xqdudFFeSadPDggHtLUJ4rgZh1+twaOXVv0dw5bG94Jj
         /oxvfjsoUBFyKvhbeLsZmKydFqps/YsFGoBAupfa9w85ah1lnsR5/W5UIkPl5nbUxiVA
         aCly2Zhw4ZQYD7MqmZ3q0x5PQg0dPFne9swlnhke/vlhEEJxsHtTo1fS7v1qeFYFpm6A
         rXTMxiikPNJGaJQ5PdxhUADe7oJG7QPYGswQvxVVffQGVsspnRKT6xpWuKsCwYHpp/67
         PxMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZelD/iFe";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si3869273ois.123.2021.10.20.08.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 08:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZelD/iFe";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdDNJ-0001vK-Rz
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 11:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdDLp-0007lP-US
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 11:17:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdDLo-0001WS-Dj
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 11:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634743075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LF+oqdbhhv44LY9JasX2H465wzrRGDRDwrw3Hf8U89c=;
 b=ZelD/iFe2nfabg0Y8t9q7y0oybIHR6odSWtxa7cY5qboSkruATPQTJqiBQINtTENEQNa1A
 7gX3MPQ3TSm0aLtDGrQqsxEssjh8gdQshVBRyRK+Kxojr3YJNGmqt4KT/Kun9iCVqDNDMk
 r5BDDpzq1n+8c7uj6ungcE+htwuFiVs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-HH4dh2iONzSYi1bEnG7Hpw-1; Wed, 20 Oct 2021 11:17:54 -0400
X-MC-Unique: HH4dh2iONzSYi1bEnG7Hpw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o22-20020a1c7516000000b0030d6f9c7f5fso4408308wmc.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 08:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LF+oqdbhhv44LY9JasX2H465wzrRGDRDwrw3Hf8U89c=;
 b=jT9gBqMWPAVKOwvmksU1JWYL50JDjMYHhaVqGsODXu/MzXNTKsjpF6wJdfWvSR4PgJ
 /ZCCJox0drnoEvTdWOtlyXaeTKI4VGczdPpXwWkxEsHD8tCp43H6tzKFwb73rRTDGFsV
 c1RuZmyG85KfxI70xCbvDX6qENj/m5alsMOJxEE5lXIWI169yyS4OnFhZug29Ya8U7eT
 phXrSl5noGEiE5fZzPzZJ3pKTWv1tXOi70r14qgt43sIQVC7/c+VFyX5WBZkv8N/Y/co
 VD/OWZMTlMxfPPmivf0ZArOa6gx9oq7UOX6an511ovoxsdX7VdzAiyhqGEk4/4Wup1k+
 Y4Ag==
X-Gm-Message-State: AOAM530ztQiHjQ4c3X2FoYaQSI4zukDCmgCKDgCqdRroqzLiWCsIjI1l
 DxqDf3a9ayKgd2USJ+hFjAQbHrLigxcbk2myZcgKlwS9Bxarw+2sl4ldOFD9XboNQ0O+iZJnRsN
 4RvYCf/KpGpPbkRI=
X-Received: by 2002:a5d:698a:: with SMTP id g10mr469407wru.14.1634743073287;
 Wed, 20 Oct 2021 08:17:53 -0700 (PDT)
X-Received: by 2002:a5d:698a:: with SMTP id g10mr469360wru.14.1634743073004;
 Wed, 20 Oct 2021 08:17:53 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id q17sm2286951wrm.6.2021.10.20.08.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 08:17:52 -0700 (PDT)
Date: Wed, 20 Oct 2021 11:17:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 00/11] virtio-iommu: Add ACPI support
Message-ID: <20211020111729-mutt-send-email-mst@kernel.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211005113719-mutt-send-email-mst@kernel.org>
 <YWBhEQxM4wRyZWzs@myrica>
 <20211018112402-mutt-send-email-mst@kernel.org>
 <YW7mqILh/tYNH56L@myrica>
MIME-Version: 1.0
In-Reply-To: <YW7mqILh/tYNH56L@myrica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Q3hkyHifiLN

On Tue, Oct 19, 2021 at 04:39:20PM +0100, Jean-Philippe Brucker wrote:
> On Mon, Oct 18, 2021 at 11:25:05AM -0400, Michael S. Tsirkin wrote:
> > On Fri, Oct 08, 2021 at 04:17:37PM +0100, Jean-Philippe Brucker wrote:
> > > On Tue, Oct 05, 2021 at 11:45:42AM -0400, Michael S. Tsirkin wrote:
> > > > Looks like this can not be applied yet because the bypass bit
> > > > isn't in yet. what's up with that?
> > > 
> > > The boot-bypass bit isn't a hard dependency for this series, but it will
> > > be needed for full support eventually. It will be delayed by spec and
> > > Linux header changes
> > > 
> > > In the meantime we can work around the problem by having the boot disks
> > > bypass the IOMMU (virtio without iommu-platform, or iommu-bypass bus).
> > > 
> > > Thanks,
> > > Jean
> > 
> > OK... how do we want to apply all this?
> > If my tree I either need ack from an ARM maintainers, or
> > post a partial patchset with just x86 bits.
> 
> Either works for me, with preference for keeping a single series
> (otherwise I need to split patch 8, or add the tests later). I'll send v5
> whole.
> 
> Thanks,
> Jean

Then you will need an ack from arm maintainers.

-- 
MST

