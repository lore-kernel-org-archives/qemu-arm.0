Received: by 2002:a05:7023:b15:b0:92:a90b:6588 with SMTP id qd21csp425895dlb;
        Tue, 4 Feb 2025 09:58:44 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVy25O8ynGVq4o6i5SPKhczHHwI8tXRIXCECw4zmPpyXq8hlRa3rClizx81XvzX8rDK32zGMDai6wVxQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGzEJrI/0BDJWbnT4oLQkEmjMM9ErZbQgdirrUo6Ou1VmOK2Ux+rJXznQjiw4nNGcQXcw5G
X-Received: by 2002:a17:907:3f8c:b0:ab6:e5d9:5027 with SMTP id a640c23a62f3a-ab6e5d95279mr2419790266b.49.1738691924588;
        Tue, 04 Feb 2025 09:58:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738691924; cv=pass;
        d=google.com; s=arc-20240605;
        b=g58NjMew6DJ5RtQU0r8XXVhyZUfATTNiWlBYUH8a+uZIZ3+HS1uxwN9obPlwO0MyiI
         pX2KOMQXuE4HnrBaGxRvpV3H+4pRVcLL5RnWRbM4vWf6T9Vj/rFVmptJ7N9iIkbmiNni
         wbbTSSdtSr261wYbiYZfFOMKe/tvrV92iNsRg2Hs0kAGFX4g669vJ+dSDnrGvNU6Mt2W
         MBzU1sWbr/Hv4hQudFfknjaBBYTt7jPmSwZHIHbRBGvDJoU6uB2+9dFO8P65ZhqCzWhC
         sJe3V50THVerxTM4/S1W7B1Ai53bi8aHOX97Vf1wItBm29r+wCZcbHn9ERftrgEwLzQj
         Lo4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=owgwA1AqBMYapk1PTsUUK3tzyPfXfho6a/nVAj1EryA=;
        fh=o14E+mvcbY96TMpEeroLS2sknOgfs0rNoG5A5kSMTs4=;
        b=QI1IUoRDKfgL+RHMZPZ80Hed27FPxNEFwd7MTcoucaf3XljYJG+EoQ3M+scWtR05mw
         9IJVuM84X7/rvySp8g4PwzPYajJOzKigLsi3Kpv3Mk3uKAYu/aEfiGdNQFgdyh7UeXvJ
         OQAJDUM1s0j34YAjVdrkuSUvjbaKaMMd8r+kY+Jt6AjYkjF2852uF5AYIeG4GnRhztj9
         MNsvQ0z2xgjRZtxI3t96xkX5mTJWZwtrMe942mCLUtxdKtFRzOpG4touJ9nF3L+pztmX
         rwTqAHM7BRP5x/B3LQilBWEa+5lwCW/yUnfgfvfjtMVwCV7NeESMMjRc5QMhHxkPqLM3
         Ta8g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SAkBfgKj;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-37258-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-37258-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-37258-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab7592d232dsi43237166b.279.2025.02.04.09.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:58:44 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-37258-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SAkBfgKj;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-37258-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-37258-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B3FD1884767
	for <alex.bennee@linaro.org>; Tue,  4 Feb 2025 17:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5363721661D;
	Tue,  4 Feb 2025 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SAkBfgKj"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F42C21660B
	for <kvm@vger.kernel.org>; Tue,  4 Feb 2025 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738691913; cv=none; b=AbPXfYJfxPF5XZK9yhJHyalLHCPqpl9OR8oWDhMgCVCUHq8YzQU33u+9V22tUWUIBrNh41ndpvfAK97oPDXszFu9+oCfEnAwDUzKaDvya7Fxu+otPjutDxdPfl1Z4Nii9nXPwI6mXFZ6a9qwV6CYrk8ohklG9mYJzByzXvYhsBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738691913; c=relaxed/simple;
	bh=lqAA5rDhyg7vKCGMAbNhx1XpNgJ5mRsZ0zuEhWpEaJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1zaItAoxEoIWlH9FGDQrlKA2Rr1PwPqagsRepRI1WPL1hS65Ani8DoD8QVhTAuBTbMUEi+y+mrSqXwTlBuAlTYq3chsl1AWDofFg9l+D583O7G6iC68QrUw1H/Hkk3DBU0ctUtgELvKT5HgBrj6q3VsKAk4kT/8uCiWT0Z4vRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SAkBfgKj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738691909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=owgwA1AqBMYapk1PTsUUK3tzyPfXfho6a/nVAj1EryA=;
	b=SAkBfgKjRSb6NPVdq4kAHjYeHqinujoRKKG6mCGB9ltjd2z35jxft/CwzJP08kIQkY57bd
	T1kVJFXw2/OAdlB85MAnzvTy+nrxK2hQ9lTMerH7mEXbQFBtAvRdfteh1JTmUIF07vwOL4
	hJ9p214s0cfkJevvXPZya94FVX8PlDU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-qCVAGBozOuSyRSUVyi9afg-1; Tue, 04 Feb 2025 12:58:28 -0500
X-MC-Unique: qCVAGBozOuSyRSUVyi9afg-1
X-Mimecast-MFC-AGG-ID: qCVAGBozOuSyRSUVyi9afg
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467b19b5641so121863021cf.3
        for <kvm@vger.kernel.org>; Tue, 04 Feb 2025 09:58:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738691907; x=1739296707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owgwA1AqBMYapk1PTsUUK3tzyPfXfho6a/nVAj1EryA=;
        b=E0B/ssFyoF2XTXAnILF7YdUi+xQiCATZ7NPWDhGxGYJlqa7kdq/MkVb2azT64PAho6
         vDEFQzzn8tC4O4zo9x5V17tSXzbUWAaW1sJ7KuF3iLG22A2iW8zS8Ldt9QNcH/nv2cKh
         CArea/WOq8se5SBB13WdXPQbrZfZfE+/IX994Wn5xmF+fwRsd3gGtuhQPmHTO7bgzTcp
         U3s/yZr/1Baszeo4XTz1Mzw1S1s/5Ul5T41I1Wuf69/csDE0DEKkqrKe+LzzQ8pQbvAj
         vK2jgd9CDfKQOefhmcJMpRsgFhmV+9FChPkqyV0OloPaAvUISXrXL/aOsJHZFkm6C9u/
         93/A==
X-Forwarded-Encrypted: i=1; AJvYcCVX7vMjJKtHT7bpDXOpE8u5X/3B/EMESKq4jy7IBqgndfW1ctdOKWYOEtbnOQJtykEA+lk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz17bZgTQXGNOvfiMKPKdBF+o5qEGYEGIvJOnXaCNgbubvc+Et
	9GCm0q/XBJWOirCyRmiYFXsKbs+BxLW04BYTX2XEbguS9/djLlPUr0sg1/GAyN82axrGrm0DtOM
	k7+TsXlctkHHU9QEK+BMDxolwA01pXMSZytWBCzYkdRFhIyWBtQ==
X-Gm-Gg: ASbGncuA3DXxPbbLC5TdDraNwaNXOG/2ocJxWcgPUeXEp0Ezx2gKfjC/HbrkNRdOTz/
	zEgTv/yKdqVLaVzElhen50oHbZeJsowHoPB6n5Fx2tUMfPH2h+R3rYGW/rKMVm4j1VuPTL9CfK+
	nYAJFer7qlnqv67uCl24Z39ZWukqARYg/cxEFHnroe3EXJ5a46ulLmfJMwrqcFCuec+pSiog1In
	NHiLvEG9f/deSTkdh3NZOgecPFKSsS2hJMTH+HvhOIuB82xvh9s8y4r6BIVxWmN7wXKkvo8g4Cl
	cuiV5nkuYEuvrExB+4HUdhf8EP5g+icTVtHDAJ6Sm5WrMqAi
X-Received: by 2002:a05:6214:412:b0:6d8:a84b:b508 with SMTP id 6a1803df08f44-6e243bb84e7mr355731806d6.12.1738691907532;
        Tue, 04 Feb 2025 09:58:27 -0800 (PST)
X-Received: by 2002:a05:6214:412:b0:6d8:a84b:b508 with SMTP id 6a1803df08f44-6e243bb84e7mr355731546d6.12.1738691907241;
        Tue, 04 Feb 2025 09:58:27 -0800 (PST)
Received: from x1.local (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2547f3e17sm64619076d6.22.2025.02.04.09.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 09:58:26 -0800 (PST)
Date: Tue, 4 Feb 2025 12:58:25 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: =?utf-8?Q?=E2=80=9CWilliam?= Roche <william.roche@oracle.com>,
	kvm@vger.kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	pbonzini@redhat.com, richard.henderson@linaro.org,
	philmd@linaro.org, peter.maydell@linaro.org, mtosatti@redhat.com,
	imammedo@redhat.com, eduardo@habkost.net,
	marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
	zhao1.liu@intel.com, joao.m.martins@oracle.com
Subject: Re: [PATCH v7 6/6] hostmem: Handle remapping of RAM
Message-ID: <Z6JVQYDXI2h8Krph@x1.local>
References: <20250201095726.3768796-1-william.roche@oracle.com>
 <20250201095726.3768796-7-william.roche@oracle.com>
 <7a899f00-833e-4472-abc5-b2b9173eb133@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7a899f00-833e-4472-abc5-b2b9173eb133@redhat.com>
X-TUID: nCRzpXpRB8dp

On Tue, Feb 04, 2025 at 06:50:17PM +0100, David Hildenbrand wrote:
> >       /*
> > @@ -595,6 +628,7 @@ static const TypeInfo host_memory_backend_info = {
> >       .instance_size = sizeof(HostMemoryBackend),
> >       .instance_init = host_memory_backend_init,
> >       .instance_post_init = host_memory_backend_post_init,
> > +    .instance_finalize = host_memory_backend_finalize,
> >       .interfaces = (InterfaceInfo[]) {
> >           { TYPE_USER_CREATABLE },
> >           { }
> > diff --git a/include/system/hostmem.h b/include/system/hostmem.h
> > index 5c21ca55c0..170849e8a4 100644
> > --- a/include/system/hostmem.h
> > +++ b/include/system/hostmem.h
> > @@ -83,6 +83,7 @@ struct HostMemoryBackend {
> >       HostMemPolicy policy;
> >       MemoryRegion mr;
> > +    RAMBlockNotifier ram_notifier;
> >   };
> 
> Thinking about Peters comment, it would be a nice improvement to have a
> single global memory-backend notifier that looks up the fitting memory
> backend, instead of having one per memory backend.

Yes, this could also avoid O(N**2).

> 
> A per-ramblock notifier might also be possible, but that's a bit
> harder/ackward to configure: e.g., the resize callback is passed to
> memory_region_init_resizeable_ram() right now.

Yes, that can be some fuss on code to be touched up.  We could avoid
passing that in when create the ramblock, instead we could allow ramblocks
to opt-in on hooks after ramblock created.  Maybe we could move resize()
out too like that.

Either way looks good.

-- 
Peter Xu

