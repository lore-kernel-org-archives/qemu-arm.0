Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp619062wrv;
        Wed, 17 Jul 2019 02:25:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzGRDgDWkUpNVjsQ4liCjhABRzfeB1VKoMuoXf6yMR/DEUkky3+hor9hSFTyB4xcynDI6z9
X-Received: by 2002:ae9:ea17:: with SMTP id f23mr7367277qkg.236.1563355549632;
        Wed, 17 Jul 2019 02:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563355549; cv=none;
        d=google.com; s=arc-20160816;
        b=ikXyl381aMfwuTdTosGSqHfafgZQk2WeCoq3MwBjO5yL0TOrgCPuRVQ0awpnzutWsV
         2qQSdxjZamPZ0GMdRgBfIrb2InVLx/SvxGdyXlNnQ0YDctFUaJxf984oAoU1vmsJN9RX
         itZ5uWzH2gLUbF+N+zE+ahue9FV0YFSqK74XXL1wkkF6/v6ng8KM7GSE6sF9km2lYh8R
         e6RRNivWJWk9NK0H28BSwwm9O0D2LXVhqfd8zVLt1tvFhEYCN7Uxg0MI3Q6FkjRlc3I+
         KgA+yi+7UKl2G9ntPdfoD0mS7l3l1PIq48wXCnGsLJlolTt+sGrezM+KHljQ8bkFXTtd
         VBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=Mf2gFFmkF9YT7+d129DSOa6vCVTJN1ojRmxnxX/8gaQ=;
        b=me2yEIm00gGLy5bBR2kamwn/CZK5KFp8RhOZEMo2xMJl/8nIBvnX0oj/vF5rqEiCXO
         w3jt4H5sbWhtHFbemmil1/XQ69QIMy+KiGJThwqpwF7rvdh/xGT1rQ68RUuJvSCiXA5r
         Plt3TjyNOCy2oktVbbRXDIWlKgQGcV1LHbIGWPqgUw1MjABjToZvJ+oBkG/I98Pe5Lsm
         4gTuTB/sI1DX0qMe/c7oGMgZngHt2/rwmOg8N/rFU/gAPdFVHqy0FZKeGMigER8p6DPM
         nTNNMxNywLuo04JXruEAmT5XKaQlf4aTpoxOQ3jvXT68xtgHg91GTO3qdi0GBUmq98Rc
         39SA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d35si15463449qte.177.2019.07.17.02.25.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 02:25:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3A22302245A;
	Wed, 17 Jul 2019 09:25:48 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0B2660BE2;
	Wed, 17 Jul 2019 09:25:44 +0000 (UTC)
Date: Wed, 17 Jul 2019 11:25:42 +0200
From: Andrew Jones <drjones@redhat.com>
To: Dave Martin <Dave.Martin@arm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 10/14] target/arm/kvm64: Add
 kvm_arch_get/put_sve
Message-ID: <20190717092542.hkzcukvc3bwgvvk5@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-11-drjones@redhat.com>
 <1e0bc93f-42e3-087f-a4b5-d356879cb806@linaro.org>
 <20190627105911.GD2790@e103592.cambridge.arm.com>
 <3e935f36-1065-b82e-86e0-f3e4cd11f95e@linaro.org>
 <20190627150224.GH2790@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627150224.GH2790@e103592.cambridge.arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 17 Jul 2019 09:25:48 +0000 (UTC)
X-TUID: iRS98dshGoeC

On Thu, Jun 27, 2019 at 04:02:24PM +0100, Dave Martin wrote:
> Either way, it's entirely reasonable for userspace not to try to support
> additional slices for now.  We'll have plenty of time to plan away
> across that bridge when we spot it on the horizon...

Which makes me inclined to keep the get/put register code the way it is
in this patch, at least with regards to the hard coded number of slices
and the build-bug. The way it's written (to me) serves to document the
state of things, rather than truly implement anything, but also (to me)
it's easier to understand that code than would be a couple of paragraphs
of actual documentation trying to explain it.

> > Within QEMU, it has so far made sense to keep the data in 64-bit hunks in
> > host-endian order.  That's how the AdvSIMD code was written originally, and it
> > turned out to be easy enough to continue that for SVE.
> 
> Fair enough.  It's entirely up to QEMU to decide -- I just wanted to
> check that there was no misunderstanding about this issue in the ABI.

We do need to use/swap-to host-endian when we implement the monitor's
dump-guest-memory command, at it also creates ELF notes for the general
and VFP (and, coming soon, SVE) registers. Implementing those ELF notes
for SVE is on my TODO, right after this series.

Thanks,
drew
