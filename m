Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp108054njg;
        Tue, 25 Feb 2025 02:01:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWDtfmj3R9Gmg3HhmdX++W3M9gWNZ27cGGxcEKejZnF1zNvPGuENxMHbobW85GtpM+2NoexJd4RI3jxPw==@linaro.org
X-Google-Smtp-Source: AGHT+IFggOCve1rMOQ4N+MkcbKPDNRWSVIO8dj7WqUDFmpbv6e2CSzFuHZV4/7i4nVaCA7Yuw8Lt
X-Received: by 2002:ad4:4ea8:0:b0:6e6:6c18:3ab7 with SMTP id 6a1803df08f44-6e87ab536efmr41195396d6.27.1740477699457;
        Tue, 25 Feb 2025 02:01:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740477699; cv=none;
        d=google.com; s=arc-20240605;
        b=R7b7nUwFilVyOJb1FG/YjGysa3d0TNKbuieWggnZ/+miWLS+6UE07+MBxGhf+BbZDh
         Ckq3ch/XvinEErYeuAyYedhoOzfOdXxNEd8ySG5zRP52ZBaZdHOli45+6SYyE3Jta9AR
         OUeseMrcid1FB9GuO1D3sEY6cckIXhiu9gwP2p9CEDa7E5/9oNCujhe5Q6bZW9nX0qJ0
         6yzJVa7TQ1fwkaFybuVLo3I6hwvmyaU7xLACszdGDq09EFymr2AVm8ce66S9wVo7B+jr
         pW4PEUgzhZ6W8lxqOdM6bDVTjuJlvOcq8EwGZMH55r3uhFgXZrGWWUOVe2K8yIexd6xf
         v7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=/oob05Zz0uyD/XBE51wa6Mc8C+ILDhC8TNNOox+clSQ=;
        fh=75EJXk5ge5PwWUTifiRE7FSHWUIDor5IHS9mmPIrFRg=;
        b=QwbvTcz3jLBIZihLhZlfW5f8Uc6io6flNbYoDLF+RDO1R2rQpnxc+P30gN3wf+BmQC
         Ernyvhj056u7irIOZrL7Qlo7qyOLZ9+oYKpSNvUcuQBP1TzYlTY+CAEBscC94Hu59wEL
         OCbkDUbMrROpjKCC3BKQt2EJqTGC4qAgzPrwrT0+cmbEzU2EFqbO9BRoxAwtrjJ7H/Et
         kvOsfjKxE+2qUQzGZgR5aQvCWwSnqLDIsQMBdMXCOJykkLz9/qrsJSIDB/4jNC0E2zdv
         V3739+HRNjbif79N8yTh9EGiaZyDC15oEK1FXZG/ouhP+ltogvsB/zYfP1njTOtpH1xN
         0ByA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NuJk0njB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b119e77si12437556d6.375.2025.02.25.02.01.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 02:01:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NuJk0njB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmrki-0002kd-UJ; Tue, 25 Feb 2025 05:01:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tmrkh-0002kR-MP
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 05:01:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tmrkf-0007gz-LY
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 05:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740477680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/oob05Zz0uyD/XBE51wa6Mc8C+ILDhC8TNNOox+clSQ=;
 b=NuJk0njBeay5WXEX76OOtSdP3gnJdAdQ/BxY+BqvI8RnIWYI4jhCoqwEl4WIq8fQNrw0zK
 Opu5b6zNGXuJ5DuFxdDNIc9ieqvD00oQE457hOT9rhVyy8zlLOpwZ70x0vmlRCDD+iJ9oV
 rHRViRMcxYtPfYoCRsZ65KGJFn5fYSo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170--TUGhpq-MFSOv7NlAq__QA-1; Tue, 25 Feb 2025 05:01:18 -0500
X-MC-Unique: -TUGhpq-MFSOv7NlAq__QA-1
X-Mimecast-MFC-AGG-ID: -TUGhpq-MFSOv7NlAq__QA_1740477678
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4393b6763a3so23206105e9.2
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 02:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740477677; x=1741082477;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/oob05Zz0uyD/XBE51wa6Mc8C+ILDhC8TNNOox+clSQ=;
 b=A9rrloxKecvUMXUxBOsibFc7Jd43QETE1T7GYHhBP8YrN0wQSva5s4pCOrURBR42RW
 INIZtNexA+2UfGgMR4lNwL/Q5cSr/6B2WMxPUQdKEtIc4eveofGQ2z2vrvpQ5gN+tH/c
 7pv0K4PF6eoadkVYP7P+HQdcBdDT6KvvM1bebTBzJRcBLzWCiTWUyAj2U6gnGkDhggG6
 lTtvW0JzSMkTfvYHhkGvDXBHkbgCzTz05leAEURtItp58EqF+31innXWShZy+DXRB3//
 7KgDEeVfpWW522PMKXa4BALhIHfyHUIY0l6VhNdkf6/PMrHGu/fPfPNzcOSIYe/M0T5F
 2vFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/yPs40tucEFHx0umseShFwb7GoLoZQPFZW5FTp81Nb5YKdZgd0aBYXOJAi+Ga83XLRfpwE0rZag==@nongnu.org
X-Gm-Message-State: AOJu0Yy2LLOEt1QxVW7q3aGhUZRq9fDgiaJ3F0W0F71YJ2jZl6gaeGdF
 /mXXy8x5HpamwfBP53MTB/mJhPX21xQLM2eHpy+q662thkIAWZvawIxX/mSmbYn6ow6Tdq3uSY0
 kZ4Dj+qatMfvz37NaS0PFzBTdyJSjau/V4Ey/hqIM3lS1F0e6xA==
X-Gm-Gg: ASbGnctUp/PYubXHkYmvaYy6aqI4thsaCWiqa++iqc4bL0Lrn+I1dZcyspQEOm4SGCg
 M+uzoQlNiN15IDyXqe3OHtaXxMBZdCnKp3QOUeS/60ylYmZi8ugzyjSASwU2Dc/Wa0r41TnySoh
 4MK+EzTaXA/DjTftOieAOCAqCOT9V8icNSdckryGYLqmgyCTjrLU97ZeY+MNA+8YSAMT7A/gxBw
 VKJp6vQkf/nJ5QwXyHkGbdg3jl33lTdSe5FYW01trYt+LeooqceXzKZxIZnadSy0utp25S/ldvu
 kGhYCYJHjCECijuaiZpjWDkKQ0JSPoo1JQeZkdSWQ2IG73AZQNP+U7PWT+qTnis=
X-Received: by 2002:a05:600c:3582:b0:434:f131:1e64 with SMTP id
 5b1f17b1804b1-439ae1e960dmr126912655e9.9.1740477677424; 
 Tue, 25 Feb 2025 02:01:17 -0800 (PST)
X-Received: by 2002:a05:600c:3582:b0:434:f131:1e64 with SMTP id
 5b1f17b1804b1-439ae1e960dmr126912025e9.9.1740477676935; 
 Tue, 25 Feb 2025 02:01:16 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab1546f77sm19802945e9.20.2025.02.25.02.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 02:01:16 -0800 (PST)
Date: Tue, 25 Feb 2025 11:01:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Philippe =?UTF-8?B?TWF0?=
 =?UTF-8?B?aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Cleber Rosa <crosa@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Eric Blake
 <eblake@redhat.com>, John Snow <jsnow@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Markus Armbruster" <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, "Paolo Bonzini" <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Yanan Wang <wangyanan55@huawei.com>, Zhao Liu
 <zhao1.liu@intel.com>, <kvm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Gavin Shan <gshan@redhat.com>, Ani Sinha
 <anisinha@redhat.com>
Subject: Re: [PATCH v3 00/14] Change ghes to use HEST-based offsets and add
 support for error inject
Message-ID: <20250225110115.6090e416@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250221102127.000059e6@huawei.com>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
 <20250203110934.000038d8@huawei.com>
 <20250203162236.7d5872ff@imammedo.users.ipa.redhat.com>
 <20250221073823.061a1039@foz.lan>
 <20250221102127.000059e6@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qYdaBqw-l78GrdfeFU450CSPvU_So7vrqNoUNo9wSAY_1740477678
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: 5uMsR1v/7y4k

On Fri, 21 Feb 2025 10:21:27 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Fri, 21 Feb 2025 07:38:23 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Em Mon, 3 Feb 2025 16:22:36 +0100
> > Igor Mammedov <imammedo@redhat.com> escreveu:
> >   
> > > On Mon, 3 Feb 2025 11:09:34 +0000
> > > Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> > >     
> > > > On Fri, 31 Jan 2025 18:42:41 +0100
> > > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > > >       
> > > > > Now that the ghes preparation patches were merged, let's add support
> > > > > for error injection.
> > > > > 
> > > > > On this series, the first 6 patches chang to the math used to calculate offsets at HEST
> > > > > table and hardware_error firmware file, together with its migration code. Migration tested
> > > > > with both latest QEMU released kernel and upstream, on both directions.
> > > > > 
> > > > > The next patches add a new QAPI to allow injecting GHESv2 errors, and a script using such QAPI
> > > > >    to inject ARM Processor Error records.
> > > > > 
> > > > > If I'm counting well, this is the 19th submission of my error inject patches.        
> > > > 
> > > > Looks good to me. All remaining trivial things are in the category
> > > > of things to consider only if you are doing another spin.  The code
> > > > ends up how I'd like it at the end of the series anyway, just
> > > > a question of the precise path to that state!      
> > > 
> > > if you look at series as a whole it's more or less fine (I guess you
> > > and me got used to it)
> > > 
> > > however if you take it patch by patch (as if you've never seen it)
> > > ordering is messed up (the same would apply to everyone after a while
> > > when it's forgotten)
> > > 
> > > So I'd strongly suggest to restructure the series (especially 2-6/14).
> > > re sum up my comments wrt ordering:
> > > 
> > > 0  add testcase for HEST table with current HEST as expected blob
> > >    (currently missing), so that we can be sure that we haven't messed
> > >    existing tables during refactoring.    
> 
> To potentially save time I think Igor is asking that before you do anything
> at all you plug the existing test hole which is that we don't test HEST
> at all.   Even after this series I think we don't test HEST.  You add
> a stub hest and exclusion but then in patch 12 the HEST stub is deleted whereas
> it should be replaced with the example data for the test.

that's what I was saying.
HEST table should be in DSDT, but it's optional and one has to use
'ras=on' option to enable that, which we aren't doing ATM.
So whatever changes are happening we aren't seeing them in tests
nor will we see any regression for the same reason.

While white listing tables before change should happen and then updating them
is the right thing to do, it's not sufficient since none of tests
run with 'ras' enabled, hence code is not actually executed. 

> 
> That indeed doesn't address testing the error data storage which would be
> a different problem.

I'd skip hardware_errors/CPER testing from QEMU unit tests.
That's basically requires functioning 'APEI driver' to test that.

Maybe we can use Ani's framework to parse HEST and all the way
towards CPER record(s) traversal, but that's certainly out of
scope of this series.
It could be done on top, but I won't insist even on that
since Mauro's out of tree error injection testing will
cover that using actual guest (which I assume he would
like to run periodically).

> > 
> > Not sure if I got this one. The HEST table is part of etc/acpi/tables,
> > which is already tested, as you pointed at the previous reviews. Doing
> > changes there is already detected. That's basically why we added patches
> > 10 and 12:
> > 
> > 	[PATCH v3 10/14] tests/acpi: virt: allow acpi table changes for a new table: HEST
> > 	[PATCH v3 12/14] tests/acpi: virt: add a HEST table to aarch64 virt and update DSDT
> > 
> > What tests don't have is a check for etc/hardware_errors firmware inside 
> > tests/data/acpi/aarch64/virt/, but, IMO, we shouldn't add it there.
> > 
> > See, hardware_errors table contains only some skeleton space to
> > store:
> > 
> > 	- 1 or more error block address offsets;
> > 	- 1 or more read ack register;
> > 	- 1 or more HEST source entries containing CPER blocks.
> > 
> > There's nothing there to be actually checked: it is just some
> > empty spaces with a variable number of fields.
> > 
> > With the new code, the actual number of CPER blocks and their
> > corresponding offsets and read ack registers can be different on 
> > different architectures. So, for instance, when we add x86 support,
> > we'll likely start with just one error source entry, while arm will
> > have two after this changeset.
> > 
> > Also, one possibility to address the issues reported by Gavin Shan at
> > https://lore.kernel.org/qemu-devel/20250214041635.608012-1-gshan@redhat.com/
> > would be to have one entry per each CPU. So, the size of such firmware
> > could be dependent on the number of CPUs.
> > 
> > So, adding any validation to it would just cause pain and probably
> > won't detect any problems.  
> 
> If we did do this the test would use a fixed number of CPUs so
> would just verify we didn't break a small number of variants. Useful
> but to me a follow up to this series not something that needs to
> be part of it - particularly as Gavin's work may well change that!
> 
> > 
> > What could be done instead is to have a different type of tests that
> > would use the error injection script to check if regressions are 
> > introduced after QEMU 10.0. Such new kind of test would require
> > this series to be merged first. It would also require the usage of
> > an OSPM image with some testing tools on it. This is easier said 
> > than done, as besides the complexity of having an OSPM test image,
> > such kind of tests would require extra logic, specially if it would
> > check regressions for SEA and other notification sources.
> >   
> Agreed that a more end to end test is even better, but those are
> quite a bit more complex so definitely a follow up.
> 
> J
> > Thanks,
> > Mauro
> >   
> 

