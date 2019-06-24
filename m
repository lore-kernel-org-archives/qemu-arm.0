Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3643568wrg;
        Mon, 24 Jun 2019 04:05:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrBn7AgdXC9M800h2jPGZSt3UbrHF6G7qmviYIVflQvps9qHrU5NfZBS12fSGosMl1GP7X
X-Received: by 2002:a50:e612:: with SMTP id y18mr161512192edm.143.1561374339652;
        Mon, 24 Jun 2019 04:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561374339; cv=none;
        d=google.com; s=arc-20160816;
        b=PFS98w6lekE1z6W8VY5a3KXx9n9AzxbOY8NG9O1ZEUeHfyXAIqxYTVTCmj+wqK0Hg7
         f9u+LA+8KNFIHf5zqrtCEcdsmVyRAPYiSUAIAr2/t9R/2RBZzyU+k5Kq+Fjx7/3gqPTy
         Zb7ObzLH1N8hMb2XY/2Bdzq1eQmL/NoRaTTcg9DKhrhVwis38sdce3fo7mQQI/qisDFC
         3LDz+SOoINBu3ltq9gWhkuOVbv2ENLSFKATPbzpzzcY2galqNWjbDi6iCI8+DGO9My/Y
         W2C5VNcUrQ17ikzYLpcX1OpxAJiiCYm/oUb99DwOl5PL611XVcXT2BuvTn4slHtdaZVy
         7A6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=b1FfkKCTmVW8UCzO3Cq4sLdr53DemMHaN7Z2pqpAIhI=;
        b=UUWOhp+0OpQDGAV8zU4EQLeFB/oEHJQ0LV9BMlJQCXe1RHGAykTEalTHiEvsU4xITl
         laWMG+mqEnOZldfmkL/3cHhjSIIp8ZWqbP1jMOMG6lpcY6dPA11nrJP4gzLx0y4hVG8X
         gSWN4exOq8MicceZBswgSxPYqYp9/qkLJA23U2toEo2APfjwO4nYrU6/fognkGewDqxG
         9PaOT/knTC29tuzB7xv1WdRQONPZAIviM/7N7/Au8xI5Nj0vUw6QZJkNn/1X3zrAMdRU
         iVrxA/Q/COVH/rUDQK9Ta2kb9CTX15fqcgCy1+NPpRMg2ARv7rjPXau1C4+oHvJh1Z6h
         56rw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id h8si9436668edh.349.2019.06.24.04.05.39;
        Mon, 24 Jun 2019 04:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9781C15;
	Mon, 24 Jun 2019 04:05:38 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74A3B3F718;
	Mon, 24 Jun 2019 04:05:37 -0700 (PDT)
Date: Mon, 24 Jun 2019 12:05:35 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Subject: Re: [PATCH v2 10/14] target/arm/kvm64: Add kvm_arch_get/put_sve
Message-ID: <20190624110535.GI2790@e103592.cambridge.arm.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-11-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621163422.6127-11-drjones@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: BwK8MvROsNBB

On Fri, Jun 21, 2019 at 05:34:18PM +0100, Andrew Jones wrote:
> These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
> swabbing is different than it is for fpsmid because the vector format
> is a little-endian stream of words.

Note, on big-endian hosts the FPSIMD view Vn and the SVE view Zn[127:0]
of the FPSIMD/SVE common register bits has the opposite endianness for
SVE_{GET,SET}_ONE_REG.

This only matters if mixing the two views: just from this patch I don't
know whether this is an issue for QEMU or not.

The kernel and gdb were recently found to be broken in this regard for
userspace [1] but the KVM interface should be unaffected.

Cheers
---Dave

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm64/kernel?id=41040cf7c5f0f26c368bc5d3016fed3a9ca6dba4
