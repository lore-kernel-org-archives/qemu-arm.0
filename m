Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3643407wrg;
        Mon, 24 Jun 2019 04:05:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9XnL4QSoNKSaL4PHG5ejANR2DvN8zW444Htf1XxTSVaKyI+MKvKJ7kJKCP26I8sG3vd6k
X-Received: by 2002:a50:9730:: with SMTP id c45mr75213960edb.196.1561374331161;
        Mon, 24 Jun 2019 04:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561374331; cv=none;
        d=google.com; s=arc-20160816;
        b=ihpQ6EBrZrcCL1Wj5ClLntgNIIfXh1u6DVtUhLjEb+SwQDPFnruuuEl2CmZkm6zMhK
         Wl2LNv9FWu7uJkusSxUQcswuH4EQ9luIZPgmXmjDMdsmkliPNpOFb8quzebAgvCt+tPq
         gCppn8UgZNblbepucEjrbb7N1XQ/6HyunOeneja4fVO2nzPBGBSwVxIcp3tNhPypKq9O
         EQ9gFdSEx/FFQRwJtwyu1hwf1nHbcRVaneXysSoHmNFlOaBiedBEUbIw5FOxXOcVqMc8
         szbGpwRWwV0YkNj7SFvT1bTsFD8Kt1+Er/cxysv5fXkcTYa3tOZleoAATG6It6Du5oSP
         J+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=+12HQryMNKn9sR5WFEjpnvr7yF6qVJq7ti/yfR+GGLw=;
        b=H0rYkRsXw73TR3EPQEvX2Ikin8EBlcx0tydQvBHpDLI6YD5SoWdVA0uzs+ObiwFgG0
         ZYFEAdIUQjiFNByUrdV6TF32C3iHzVlBJJfuvbNHGxktAOCg4sW1yAqCmyi6S3fBs7/B
         NFNtm2mzO/GIVxzD0Cia+t6dbAsbnXST8zKyf3i2d8AmWoYrBlxWeOrTiVkIyIMbg5oW
         aKs3kkJI+VystxL6rEI5saxZ8YhoZ7SnCF1rMMhnlXh7053jqI0ie9H3YHju5RmkYMum
         KTjcaiMN5BNhYKIt9JQJw25ZlE71As3wpa1m9YtxMzwwsWOUQO3uMmQA+MEGUxl5qcVF
         MvSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id e57si9076712edd.263.2019.06.24.04.05.30;
        Mon, 24 Jun 2019 04:05:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 118ECC0A;
	Mon, 24 Jun 2019 04:05:30 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0EA23F718;
	Mon, 24 Jun 2019 04:05:28 -0700 (PDT)
Date: Mon, 24 Jun 2019 12:05:26 +0100
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
Subject: Re: [PATCH v2 07/14] target/arm/cpu64: max cpu: Introduce
 sve<vl-bits> properties
Message-ID: <20190624110526.GH2790@e103592.cambridge.arm.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621163422.6127-8-drjones@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: FM1LpOz4iDJu

On Fri, Jun 21, 2019 at 05:34:15PM +0100, Andrew Jones wrote:
> Introduce cpu properties to give fine control over SVE vector lengths.
> We introduce a property for each valid length up to the current
> maximum supported, which is 2048-bits. The properties are named, e.g.
> sve128, sve256, sve512, ..., where the number is the number of bits.
> 
> It's now possible to do something like -cpu max,sve-max-vq=4,sve384=off
> to provide a guest vector lengths 128, 256, and 512 bits. The resulting
> set must conform to the architectural constraint of having all power-of-2
> lengths smaller than the maximum length present. It's also possible to
> only provide sve<vl-bits> properties, e.g. -cpu max,sve512=on. That
> example provides the machine with 128, 256, and 512 bit vector lengths.
> It doesn't hurt to explicitly ask for all expected vector lengths,
> which is what, for example, libvirt should do.
> 
> Note1, it is not possible to use sve<vl-bits> properties before
> sve-max-vq, e.g. -cpu max,sve384=off,sve-max-vq=4, as supporting
> that overly complicates the user input validation.
> 
> Note2, while one might expect -cpu max,sve-max-vq=4,sve512=on to be the
> same as -cpu max,sve512=on, they are not. The former enables all vector
> lengths 512 bits and smaller, while the latter only sets the 512-bit
> length and its smaller power-of-2 lengths. It's probably best not to use
> sve-max-vq with sve<vl-bits> properties, but it can't be completely
> forbidden as we want qmp_query_cpu_model_expansion to work with guests
> launched with e.g. -cpu max,sve-max-vq=8 on their command line.

Supporting both options together in a non-idempotent way seems to
complicate things.

Would it be simpler to allow sve-max-vq only when there are no sve<bits>
options?

Alternatively, the two options would be defined so that their meanings
are independent of parse order.

So, way sve-max-vq=<max> means that:

 * all VQs up to max for which there is no corresponding sve<bits>=off,
   are enabled; and

 * VQ max is enabled; and

 * all VQs exceeding max are disabled.

While sve<bits>=(on|off) means

 * the VQ coresponding to <bits> is enabled (for on) or disabled (for
   off).
 
After parsing all the options, you check that the sve-max-vq and
sve<bits> optinos are consistent.  If you disallow duplicate sve-max-vq
or sve<bits> options, then there is no possibility of ambiguity and the
order or options doesn't matter.

(There may be constraints on the way qemu options parsing works that
make this hard, though...)

Having sve-max-vq in 128-bit units while sve<bits> are named in terms of
bit counts also feels a bit odd now.

[...]

Cheers
---Dave
