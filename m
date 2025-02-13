Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp469297njc;
        Thu, 13 Feb 2025 01:52:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVyy035irNnylXvGvxtkf52qe3RHESkW1Luk56VmgfNNeK+xjCfWPcJjdDXgTi5x8IrHH20mm1ToH0qfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IENJDWbYNAikpMjMaA3MBykqYI81G3ARG8+/vxNcuEEF2vXGUFlNr/l+kjbnm7lC6Cmck51
X-Received: by 2002:a05:620a:27cf:b0:7b6:7257:1359 with SMTP id af79cd13be357-7c07071a73cmr1045371785a.13.1739440359297;
        Thu, 13 Feb 2025 01:52:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739440359; cv=none;
        d=google.com; s=arc-20240605;
        b=EhhnaN+h0C5e6yXft7BPgiZlv92e/uklpq4Z3ftG6ZXEdL8zqtp+FhmlfGH64HqIZZ
         TH1jAbqyc9bKJGeZwiq8hFdRgvtFdJyYiVwUGxjwHaEYOM2YpWIcfVoIpH+zF6aE5AC4
         YnYMoqiAFt/dSQhxQefzsixxAuwdLb8oGMhRZV7H+eaGoaNAF8iTcWdrKAUhY8ZQo6Uz
         ynn/90cLyz2/lVU+oz8ZOKMsvio6xlaBuEhBw9t0FK0xxZJIfgbnab2ljLJDu7pySYW4
         uJaxqpUFAU10BKWJFjG1lTdoLXKs1dDweTaMUe7/xF6RPsmA5T/94ysBxE3IeDPM0tDd
         nDXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=tFNBp19PlskggX+XxDmTx7MkQZoyGay4JhSLOld0Fuo=;
        fh=rrua58aPyIBHnRLYa6DhwCQw1Suzf5rAWcQoGwyatcE=;
        b=ax5gXjvPep+44KmeMRMJFxxxQtkr7Tr1NNLWD0baJqjfaRBGqeQ6zNijVpplE46wle
         aLQGHeU4qKB/Z+pNDrgP6U9MgmDt8Cg8wqhEWo47FZiqmd51lkbUWiNFYdaSmEzRtpJ9
         4qJsMA3vHMb6BDpJiU8IJ3vh18DsOIJV7o/03HeC3DjaWhhD36o4lOctcN9uQ2mkm8pz
         KylxbkNFu1DyXqSvITVbyGDCs1i+iDrI/MWY/JvCE0j4n+MpzPbHGrmLCGjnaMkxwUxo
         zb8g3P50M+IB9k6iWFIKJ7TZHOANlX/zIfo1FveaJAysP7kYy8W0EntIx3wh2hZv7f2b
         FmJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aD3N70it;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471c29ef8c5si10859201cf.110.2025.02.13.01.52.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 01:52:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aD3N70it;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiVtW-0004Fw-Q7; Thu, 13 Feb 2025 04:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tiVtS-0004FM-IG
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 04:52:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tiVtP-00044I-Ew
 for qemu-arm@nongnu.org; Thu, 13 Feb 2025 04:52:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739440341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tFNBp19PlskggX+XxDmTx7MkQZoyGay4JhSLOld0Fuo=;
 b=aD3N70itjmFibxV7zPE+rIMb4QOvYxGJmWMQpMmVWwb9wmn20tMa9LAHvHsFkTkrGhPFfw
 D4VySJYBjJWEu6w0Oj7noDIvDK5s0JbBGt06Kz5IXhfMKLZO3/BjmwjyW3vfEdd6SIWMEp
 En6aqTyWOoXhsgKUo2vxgfUcKvQOM+w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-W4fu4iEWPcWhuVv-8EOmaQ-1; Thu,
 13 Feb 2025 04:52:20 -0500
X-MC-Unique: W4fu4iEWPcWhuVv-8EOmaQ-1
X-Mimecast-MFC-AGG-ID: W4fu4iEWPcWhuVv-8EOmaQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D55BE190F9E8; Thu, 13 Feb 2025 09:52:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.69])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 37A25300018D; Thu, 13 Feb 2025 09:52:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C4F7A1800097; Thu, 13 Feb 2025 10:52:13 +0100 (CET)
Date: Thu, 13 Feb 2025 10:52:13 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 09/23] hw/uefi: add var-service-core.c
Message-ID: <2vgc4scgezmb3med6dypykcym7te7gzlx7wp3vm5ehtfmxj3xr@kswpu35wt5ns>
References: <20250211092324.965440-1-kraxel@redhat.com>
 <20250211092324.965440-10-kraxel@redhat.com>
 <da0ac9ed-fdca-433e-b793-5423f430a852@amazon.com>
 <iuwaykfdm7bwtvblyz7lkew3em2ksi5xeztdphqjdv7tsp2ejw@s6j64y3lfmrw>
 <ea1d355b-7e56-47ef-b1e7-158003b6d85f@amazon.com>
 <kk4f5e3olb26qfjveqefkuzrjc45djikkk7uspz4yj7iesdmbj@zointitbvhdp>
 <73fe41f7-dff0-4506-8769-1997323c0a76@amazon.com>
 <4bwjwcs2k4hbrj6mokc57a5dy57jjssfxnvd4qm5257dgnid3x@yqdx7e47o2mf>
 <2c06a98c-f286-4632-a352-8b47dc4cc43c@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c06a98c-f286-4632-a352-8b47dc4cc43c@amazon.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7BV56nqIiEGR

  Hi,
 
> That will bring back all issues with cached vs non-cached memory accesses,
> no? So edk2 will always access that memory as device memory which means it
> bypasses the cache, while QEMU will access it through the cache. So that
> buffer would need to actually be MMIO memory I suppose?

I don't think so.  The firmware driver knows this actually is normal ram
and can setup mappings and memory attributes accordingly.  The situation
is a bit different from vga memory bars which are handled by pci bus
management which doesn't know anything about virtualization specifics.

Well, unless macos thinks it knows everything better and goes setup
uncached mappings ...

> > Not sure how to do that best on x86 though.  Find 64k unused address
> > space over ioapic?  Do we have enough free space there?  And how
> > future-proof would that be?
> 
> I'm not worried yet about where we place that memory, but more about
> ensuring that we actually have a working path to access it. We can always
> find space in the PCI hole, as long as we properly advertise it to all
> stakeholders via ACPI and memory map.

Well, the host can't easily place stuff in the pci hole because the
guest will manage that (map pci bars etc).  But making the pci hole
a bit smaller to make room is an option I think.

take care,
  Gerd

