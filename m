Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3929366wrg;
        Mon, 24 Jun 2019 09:03:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJdmsGFBGaOUwfwUUU9WjV5hWtUxSILDVUV6V0ZZ5PdD74AICzmseaAgM47GNi/Sot4ASr
X-Received: by 2002:a17:906:49ce:: with SMTP id w14mr10590060ejv.168.1561392193495;
        Mon, 24 Jun 2019 09:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561392193; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBXJEhVEa8ADEhY35biJPmSNfYdST3imTDeG3EFEs6t8i3hoQWJRQJymklRZl+QeuG
         pq0yw1YX3dCtRwd4yV6Z81Yj7lmFEtW4ULOxZfOIEMKOHClIjbNRi6nYzOK1wCbQSIK1
         pjHJbG4qTagafBu0mCS4yb2kR4v6sSgGQ/sdHJTNWR+4cG8NPxmFT5sSCKmHINzFjO1/
         wLD066BK8E9kiSiVw0lmoEQls4gwmRdhLtona1AT3rkKnpEUsoFStkesW8+1/xGbZnkH
         sV1UFv5eMMd2ZGjMgN/bp0JYatoMtMyEq5zyVcXcccQL5+w+cSZGQaZkerk9CT6tbppm
         Bsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=m0qrnc9MmbdwT7L6sTUyir73QyEnqY/+Sn1q4wnqmEE=;
        b=tP8Pi5u3WQCaB3hSLatxHG3V3Nj3cZ58dOcC0lCs41w8Kl2ax4qm3ZxPv2qVEi12tL
         Z9RGuqCWt/NqO4nAjer2OCnq57hPePu0MIoA9iy+n6JENPpwbtX7duGturShDNSeAF0o
         zxLmZcv/e9gvlqwysHRFIoGnge1aFOpeBjPTV/1dES+VuG+91b3y3mD7fLfwO72DpNJt
         OqEjHPrn4pya9shD/Zogo9fXdr+0fD9tFQkTAO1DnhtwWEFjF3z5VGVRYqkWKuHzs2Ao
         zGCVb0LTEwYjFy7eIFYqgZPjdPm2ocApXpfS/lHQgbDuSCVbNnjOyeHy89ROfvJgtiru
         811Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id w25si9806484edt.27.2019.06.24.09.03.12;
        Mon, 24 Jun 2019 09:03:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DE2B2B;
	Mon, 24 Jun 2019 09:03:12 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C67833F71E;
	Mon, 24 Jun 2019 09:03:10 -0700 (PDT)
Date: Mon, 24 Jun 2019 17:03:08 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 05/14] target/arm/helper: zcr: Add build
 bug next to value range assumption
Message-ID: <20190624160308.GT2790@e103592.cambridge.arm.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-6-drjones@redhat.com>
 <20190624110507.GG2790@e103592.cambridge.arm.com>
 <20190624113037.m5onedluc4x7c5ej@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624113037.m5onedluc4x7c5ej@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: aSCUcS3lCJ1O

On Mon, Jun 24, 2019 at 12:30:37PM +0100, Andrew Jones wrote:
> On Mon, Jun 24, 2019 at 12:05:07PM +0100, Dave Martin wrote:
> > On Fri, Jun 21, 2019 at 05:34:13PM +0100, Andrew Jones wrote:
> > 
> > The purpose of this check should probably at least be described in a
> > comment -- i.e., what actually depends on this?
> 
> I was thinking the already present "Bits other than [3:0] are RAZ/WI."
> explained that, but how about this for an improvement?
> 
> /*
>  * Only the lowest 4 bits of ZCR_ELx may be used to constrain the vector
>  * length, the rest of the bits are RAZ/WI. Since the vector length of
>  * 128-bits (1 in quadwords) is represented as zero in ZCR_ELx, and all
>  * vector lengths are represented as their length in quadwords minus 1,
>  * then four bits allow up to quadword 16 to be selected.
>  */

No, maybe the existing comment is enough.

I thought there might be more code elsewhere that assumes that checks
sve_max_vq <= ARM_MAX_VQ then then assumes that sve_max_vq <= 16.  But
if not, we probably don't need an additional comment here.

I haven't tried to understand all the code in the series beyond the
user/kernel interactions, so maybe I was just paranoid.

[...]

Cheers
---Dave
