Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2916870ejo;
        Fri, 15 Dec 2023 01:56:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFcB5PapfdbmJarD5A1k2HPckChuDvsGfdjJBMyp/KLhq7IdKovOm98wY/TMR9DS9GsjqBm
X-Received: by 2002:a17:902:c113:b0:1d3:3f41:a9b8 with SMTP id 19-20020a170902c11300b001d33f41a9b8mr3324923pli.47.1702634170614;
        Fri, 15 Dec 2023 01:56:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702634170; cv=none;
        d=google.com; s=arc-20160816;
        b=IIVv+kPYiPhSThESbG/Ra39XomDrIQRqB+aiZk7+PZoHdHUZ8VLEYpYUK7vRcygx82
         VLr+I3LA5X0O0h5/JV9kv2kk8vfAu3rKMHVOHmMan57xyzE0nKma39LYnbvJ2G9ZF1Fz
         tqzbaUpbltjsPoz1R95s/lYlYz3780663y+b3GnhMS9Otdv5sLUoiGeA6TdW1cVI2ys/
         Tq/KLJO84eCymIIJNJhysFyxCa+3nGzHL5zDdkPyIQaPhwvOTb2q9nw6meuB/cEqVG49
         guNOx+OdTgqxSsqbqYU0IpOCRYqokFV11G6YY1p2/duygB77jnN5DI2DpPDq9YOofSde
         0Jxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:in-reply-to:subject:cc:to:from:date
         :dkim-signature;
        bh=XsVx4MsxXeqsM9UmamEQoOhQwuatdwZpdHk8xWe7cXU=;
        fh=5wlUWyMuD+JqCOmHa0udg/FWBJZSC4QRfhDxCTE2BTg=;
        b=atL+UXprJBJGfCiGwNJfe8TlZapzKpp/Nk+pkHzrp8+ewwoe/uXFzLjJ7UdXIIqunX
         Hml9OzoaG0vu95KjWPKv/melGl6tuwXZCWOzQ9/GIBX2qvALDp8rhDW5NlBlt/5D3RBb
         8oEjor8r79viNbAlr1Dgw5d1uw/fZC8o6/9BXfRULxDVyNtbEwtx14Jhv5B2QXVYy6kj
         zREyhgehPozrHfpRT6nWfs46O3zPB6BO2X3fvACdo/Y8hM5uO5UbXPQdghq7OG70PeRe
         ymJULip0lv5n1nWHabtyGDBVkAEnoM6vdHyRsMcQIJWDKLTfh6chTyMzaBJIB6kJ/cGN
         gdvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BhWdUJ/4";
       spf=pass (google.com: domain of kvm+bounces-4556-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-4556-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-4556-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id c1-20020a170902aa4100b001cfc4fd2a64si12587520plr.599.2023.12.15.01.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 01:56:10 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-4556-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="BhWdUJ/4";
       spf=pass (google.com: domain of kvm+bounces-4556-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-4556-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D548B227BF
	for <alex.bennee@linaro.org>; Fri, 15 Dec 2023 09:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B7F24B51;
	Fri, 15 Dec 2023 09:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BhWdUJ/4"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEF324B22
	for <kvm@vger.kernel.org>; Fri, 15 Dec 2023 09:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702634159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XsVx4MsxXeqsM9UmamEQoOhQwuatdwZpdHk8xWe7cXU=;
	b=BhWdUJ/4947x7hKIo0aCfsgf1Dxfl7TXoXvNhNd5NmBgy+BXsBs9qAsu/vfoLcFpmwNc2R
	7QNxbt9VfV9mY+kU+kC/hym3jlM/+nm4BCPX6JruoyI6ZqPvbn+Xn2+QI+XkOrCK/uYAF6
	rQPZG3I/G6MR39u8JFk/i1GRr1CwB6M=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-S88MhR2WOzWHxLQIT3r8Gg-1; Fri, 15 Dec 2023 04:55:58 -0500
X-MC-Unique: S88MhR2WOzWHxLQIT3r8Gg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-421b20c9893so7833331cf.0
        for <kvm@vger.kernel.org>; Fri, 15 Dec 2023 01:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702634157; x=1703238957;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XsVx4MsxXeqsM9UmamEQoOhQwuatdwZpdHk8xWe7cXU=;
        b=hOIezWwim+BVq5NZeqPUcEWybgeH3oGCvEyCMyKvqxfGv5Zlc8srekYKXx6NfpSPoX
         lSwoF5ufAb+jwT4G1Y32OQMvzQ4UELJYARSviLReO/E5wQAwnVR5GWEBYaV82QrOXyYH
         nuQV/ommGq3VNh3VlMgxIKwZd+G9dO9vVCHKThU0xYQxmjlrs9rNYY8OFiCuWXZeEzOR
         t/ZaGtLWh8NiTnhNtFW05BKjx9J4FZ5Q1HCH5R9HqvbKId8xayAPiKN0TELN3NqA38be
         Q8z8WZT6+d6TLoUk+orlwl8D7LNBa3QlyBP2H0Uqe9JAVWV0k/rGa7kbcNrFJehVQa3I
         ywhQ==
X-Gm-Message-State: AOJu0YwONPU3D/X4qwtO9jAlID0Oj17Ho4nmXvw4zPr+HkcH1MMvXS9t
	ErYvBg9qMVSQQUqpR884EqF36rU8VWtha//g6jJAIHYxfGBCIxP60ezcDzkUi6MF2uepbK5p7cn
	9YlDU7RaDVfCWXOowqz6B
X-Received: by 2002:ac8:5d46:0:b0:425:aa00:cdd7 with SMTP id g6-20020ac85d46000000b00425aa00cdd7mr16876846qtx.85.1702634156952;
        Fri, 15 Dec 2023 01:55:56 -0800 (PST)
X-Received: by 2002:ac8:5d46:0:b0:425:aa00:cdd7 with SMTP id g6-20020ac85d46000000b00425aa00cdd7mr16876839qtx.85.1702634156712;
        Fri, 15 Dec 2023 01:55:56 -0800 (PST)
Received: from rh (p200300c93f174f005d25f1299b34cd9e.dip0.t-ipconnect.de. [2003:c9:3f17:4f00:5d25:f129:9b34:cd9e])
        by smtp.gmail.com with ESMTPSA id cd5-20020a05622a418500b004255fd32eeasm6318380qtb.7.2023.12.15.01.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 01:55:56 -0800 (PST)
Date: Fri, 15 Dec 2023 10:55:51 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eauger@redhat.com>
cc: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org, 
    Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
    Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org, 
    qemu-devel@nongnu.org
Subject: Re: [PATCH v4] arm/kvm: Enable support for
 KVM_ARM_VCPU_PMU_V3_FILTER
In-Reply-To: <be70b17c-21cf-4f4e-8ec1-62c18ffd4100@redhat.com>
Message-ID: <f1b6dffb-0a23-82d2-7699-67e12691e5c4@redhat.com>
References: <20231207103648.2925112-1-shahuang@redhat.com> <be70b17c-21cf-4f4e-8ec1-62c18ffd4100@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-TUID: vq3c5ZUrUw+u

On Thu, 14 Dec 2023, Eric Auger wrote:
> On 12/7/23 11:36, Shaoqin Huang wrote:
>> +    if (kvm_vcpu_ioctl(cs, KVM_HAS_DEVICE_ATTR, &attr)) {
>> +        warn_report("The kernel doesn't support the PMU Event Filter!\n");
>> +        return;
>> +    }
>> +
>> +    /* The filter only needs to be initialized for 1 vcpu. */
> Are you sure? This is a per vcpu device ctrl. Where is it written in the
> doc that this shall not be called for each vcpu

The interface is per vcpu but the filters are actually managed per vm
(kvm->arch.pmu_filter). From (kernel) commit 6ee7fca2a ("KVM: arm64: Add 
KVM_ARM_VCPU_PMU_V3_SET_PMU attribute"):
  To ensure that KVM doesn't expose an asymmetric system to the guest, the
  PMU set for one VCPU will be used by all other VCPUs. Once a VCPU has run,
  the PMU cannot be changed in order to avoid changing the list of available
  events for a VCPU, or to change the semantics of existing events.

Sebastian

