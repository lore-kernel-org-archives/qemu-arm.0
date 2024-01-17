Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1654504ejf;
        Wed, 17 Jan 2024 08:29:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhJhfYbJWQC3ws6yx/UIgXmGO2x4m12nwxTv9aZ8jFex1gc8cdFmArweDrlMU+umx8/3Bc
X-Received: by 2002:a05:6122:1988:b0:4b6:e467:ec9a with SMTP id bv8-20020a056122198800b004b6e467ec9amr5098983vkb.16.1705508983470;
        Wed, 17 Jan 2024 08:29:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705508983; cv=pass;
        d=google.com; s=arc-20160816;
        b=QIJ+f4EsL/2WQMy/s4woLdP5vzLw2ppMbGFj7g70mR/KRbkMBoxvu0ZFqOe8jgXC0b
         Z0xAOYR6Ft26x+c8zUeauzglPAfzGc/um+RFzqHTR85NQsqMR/Elx6OQuJ1MnoPHzXQt
         q+54qUCVUPdAPvp24NwI2UNN849Gd5M4wuRUuR4uROpeiqCBgRChOqlp73Zhcap4Qw/u
         4oZ6yBx5iOn9tQainERnQN1j549pAL6FtY5PdMoFpvTwV1BDljR6HTdgLzPZBuTqKPpK
         9xIJ2kiROTFoopPFAh19uxXyP3vgQNtB6gYG/jzfDgfk619krtSXWPdAEflfv5BMFaSB
         UDcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:in-reply-to:subject:cc:to:from:date
         :dkim-signature;
        bh=rkyNsJCwFGqJTPhySJfa88JUu1UflHNy/NLPsLpoA3A=;
        fh=wqED9Q9ZlK6y3nFhsa3u5vM7PNHG2omZV0+nduxKJMw=;
        b=w0T43ReETqLuJUY/JEficXOpEU20wg9w8bkwfe5ZMaKi5z0SXuwPxBlVvkkMetf+uf
         UEly2qmjT/n9qx+JwUGrj2Xg/EGS+PEcTR0iKy5eIZAZmuyphhgNeEQ/d2RbjsP2rHHR
         hUjWMW2l/6hs66sa9aWQLlJB3wA67s/9Ppt5NBnQcpCd2KXhtgNNASwRrCO5cA58EXP0
         HRzGbqDrXlBQ+rziKb72tGAMUJeT60hTDUVWF0wUeDKxQvTbKIL5ZmO29MrZe4TBkI2W
         E9cIkSELknQUxoO2A97DICj5CIFAkCDX/aYHxeHrV7TGKkvlhFVwT5fui6o78+zE+dTy
         Qeuw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fgtnriVi;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-6399-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-6399-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-6399-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id g13-20020a0cdf0d000000b0068171ee32basi2889352qvl.213.2024.01.17.08.29.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:29:43 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-6399-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fgtnriVi;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-6399-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-6399-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 232C11C24081
	for <alex.bennee@linaro.org>; Wed, 17 Jan 2024 16:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FCB22335;
	Wed, 17 Jan 2024 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fgtnriVi"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5331A279
	for <kvm@vger.kernel.org>; Wed, 17 Jan 2024 16:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705508979; cv=none; b=A7gncbVwPx8qQ4s5TlP5kfYFNofCx0W95/lKa4WJ12UnqdNhE9k5EzhGJjGTD0uBihi6+NQSMOcy6fcrZjxJo+Edx1B/POcQFt7/TLOmBKl3oy9aGs4ZpKEu+DZqeEXIy7w95EKNEUIkFEy0c0yjDxlnm1Hjo5DS/iqsFhKOGVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705508979; c=relaxed/simple;
	bh=6yGwBR0c+K41gLeDUTr3Fxw8cpalsWU0WvsVCNOkDBg=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Received:
	 X-Google-Smtp-Source:X-Received:Received:Date:From:To:cc:Subject:
	 In-Reply-To:Message-ID:References:MIME-Version:Content-Type; b=ZAy/wyZieWFNSumJU31Npqb/xxJLnZOaBECzyvHvQ2PyHzgxiBUTpQZH1NvW2z7h10GK0HCY6GSg1SyZwMeLnH3wePKc+i7efiWDuPd5lm5fAY2W6TqMQE2itsGOqCSAhuVxGhIhZWcKYt85+DVjm7LJhheIPs7pa/uAEPr/Ji8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fgtnriVi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705508976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rkyNsJCwFGqJTPhySJfa88JUu1UflHNy/NLPsLpoA3A=;
	b=fgtnriViNFuWkCG3HHVJSTIW01CLBC/M67DdCtQErOzmW7wgjndYFmaNXpUQW6QeGvwwzR
	AsjKlGAr/q9UOQgswfNW7owrv+eeFC1oyvBPhBdzQdVf511GgTv2HrpfY2jgu9ZvVn9kx3
	AvYuygkUmTgXof2jk7e6EWUt7xJzCsM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-PPXKv_FDOhOqZ99NgtlrwQ-1; Wed, 17 Jan 2024 11:29:34 -0500
X-MC-Unique: PPXKv_FDOhOqZ99NgtlrwQ-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42793cd9d33so145232261cf.2
        for <kvm@vger.kernel.org>; Wed, 17 Jan 2024 08:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705508974; x=1706113774;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkyNsJCwFGqJTPhySJfa88JUu1UflHNy/NLPsLpoA3A=;
        b=LmRx8LspWzKovQ69sb3+tLXC2KQMaS6afLnt9w+fKHgNxIAT9Omu4ITDBKh/AYXwIx
         56tjClGPyr7Gy23HWaeHtMv0RLo2nbGt4thLz+RcMyVB7BN7cMaG0l64MmgIKERTb3vs
         l1ImpOI16r9ZEOdkjPrPDf6jXe9tpbYpT6m0KTVOaJnk0r41BBlhEhTbPvzQGEZgWi9M
         pHbgnncNdMAphIWnUH49lvN0N4ISqfrkI8B3l7rKYwiW3055D+kZtb1XWnUq/g/y4/gm
         WypQd6ygxZoA6bRKbL0z7hUZ+581stGSO6VVZGiVE4Cj8oUf1UGFVACPS/7E5F6CYjkr
         wg8Q==
X-Gm-Message-State: AOJu0Yxt2jIOc1uY3i+4Q+Nc1OpS4mzFrgiPD5V1SDV+oHhc4+NtNxeU
	zur+iDiZ8EVHrhwe3SA0PacdqMPSThAy3lU21FrLr69FJYLMe5xLEIVy0HAhpFkyYLDCS8cgzND
	iqye7Kp0iNec0E08IrSZ2
X-Received: by 2002:a05:622a:291:b0:42a:ccf:9f85 with SMTP id z17-20020a05622a029100b0042a0ccf9f85mr2081554qtw.130.1705508974482;
        Wed, 17 Jan 2024 08:29:34 -0800 (PST)
X-Received: by 2002:a05:622a:291:b0:42a:ccf:9f85 with SMTP id z17-20020a05622a029100b0042a0ccf9f85mr2081544qtw.130.1705508974279;
        Wed, 17 Jan 2024 08:29:34 -0800 (PST)
Received: from rh (p200300c93f0273004f0fe90936098834.dip0.t-ipconnect.de. [2003:c9:3f02:7300:4f0f:e909:3609:8834])
        by smtp.gmail.com with ESMTPSA id eq23-20020a05622a5e1700b0042992b06012sm5998976qtb.2.2024.01.17.08.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:29:34 -0800 (PST)
Date: Wed, 17 Jan 2024 17:29:30 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eauger@redhat.com>
cc: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org, 
    Gavin Shan <gshan@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
    Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, 
    kvm@vger.kernel.org
Subject: Re: [PATCH v5] arm/kvm: Enable support for
 KVM_ARM_VCPU_PMU_V3_FILTER
In-Reply-To: <852ee2a3-b69f-4480-a6f4-f2b274f5e01c@redhat.com>
Message-ID: <36a1efb3-2538-c339-d627-843e7d2b6541@redhat.com>
References: <20240115080144.44944-1-shahuang@redhat.com> <852ee2a3-b69f-4480-a6f4-f2b274f5e01c@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-TUID: TZwK/iQb7jN+

On Wed, 17 Jan 2024, Eric Auger wrote:
> On 1/15/24 09:01, Shaoqin Huang wrote:
>> +    /*
>> +     * The filter only needs to be initialized through one vcpu ioctl and it
>> +     * will affect all other vcpu in the vm.
>> +     */
>> +    if (pmu_filter_init) {
> I think I commented on that on the v4. Maybe I missed your reply. You
> sure you don't need to call it for each vcpu?

From (kernel) commit d7eec2360e3 ("KVM: arm64: Add PMU event filtering
infrastructure"):
   Note that although the ioctl is per-vcpu, the map of allowed events is
   global to the VM (it can be setup from any vcpu until the vcpu PMU is
   initialized).

Sebastian

