Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7583102wrv;
        Thu, 8 Aug 2019 01:50:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZoyjUHFLF94JMKtQrkFaY2bGU8lgoVZbPuBEu9bbcX0F1PuFQqiyOsxzbuOHr4wm6c+BG
X-Received: by 2002:a37:7d1:: with SMTP id 200mr11985588qkh.96.1565254219858;
        Thu, 08 Aug 2019 01:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565254219; cv=none;
        d=google.com; s=arc-20160816;
        b=MQQGXJ8fDFSDfYDwDgJvXTcrSQEIDJg/vEMjxriyhgAzWrKdh6IKJ6y3YtRTgTUAnI
         mW5wRZxPKE/0Qcw6Pg+DlPoYFJDokSMmSZHVN0wVJpdIXq1O3F7nE2ibhfJ/5nJ53uLO
         mZr26/d8Q3Qt+loN0p3atWCi7RE2k4jKLSxh6jJ9x0ZLtjOqcI/Vpu1EzkcA4tTQ47EY
         fpGmaMAPtbjn2pijDNRDyg+BQHXRa3xewzX9WyNRb4I36jm7X4EF7l2duHabmSuCfesQ
         8M04HKbA78NQxuowfAnCa9RzyK9qbzabyLaSluE0kuj1UuvvP+aFxbmtYqLdBy/JlV+I
         AMAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=b9QZ0kiKa8QRXeVOE+rSFZlm2jwqskJ81hKAawXSGd4=;
        b=kUW3zab81dE+GkYkfYT656sk4C1Sb1Wqpe+zIGXgLaT4KlUgLdux0PT3Z+IuGwFKMP
         S7pr6VQlb+aCnPpcXeYokPp5mqRACmmXHbXEiSaCnJGImx/esyC3rVMltWb8C1G75nqA
         3k+naeEh9Dm2fx0WCoVhhCXv/suIMsVwylI8w9BIQHfNx1LLzr2b65GWGKxoxT7duLmB
         AjkDe+Vla+C4Muvji7w2/+yZ8HBt7pThrVGBKqOteXXEsnUvSMYawtrYZ3g5yzPgROrr
         +wTokCz4rNRbm5ExfEPTozjuGyxx24tfG/GkGaoqXqW5k63emOi5LYOEIQ6IhOwpVcy/
         IygA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id z42si12238449qve.206.2019.08.08.01.50.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 01:50:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0DD0C00A168;
	Thu,  8 Aug 2019 08:50:18 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 826365C226;
	Thu,  8 Aug 2019 08:50:14 +0000 (UTC)
Date: Thu, 8 Aug 2019 10:50:12 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
	eric.auger@redhat.com, qemu-arm@nongnu.org, imammedo@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v3 03/15] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
Message-ID: <20190808085012.23aokly34zo4wxbk@kamzik.brq.redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190802122540.26385-4-drjones@redhat.com>
 <d0983bd5-c1a5-adf6-324d-2b199ca0e23c@linaro.org>
 <ec44ddad-c33c-918b-e94b-a534a2519a9e@linaro.org>
 <20190806122144.bb3klk7aaaqdhgwi@kamzik.brq.redhat.com>
 <39a4d205-d291-8962-2693-6bbcce89c332@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39a4d205-d291-8962-2693-6bbcce89c332@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 08 Aug 2019 08:50:18 +0000 (UTC)
X-TUID: UAJpfXdBfKuM

On Wed, Aug 07, 2019 at 08:22:07AM -0700, Richard Henderson wrote:
> On 8/6/19 5:21 AM, Andrew Jones wrote:
> > That's a reasonable suggestion. I do like having self-contained
> > validation, self-contained, but when cross-dependencies arise, then
> > it does make sense to have a master validation function, rather
> > than interconnecting too much. That said, for this series we only
> > enable the qmp query for aarch64, pmu, and sve* properties. aarch64
> > and pmu are independent, and thus self-contained...
> 
> Agreed.
> 
> > and I consider
> > all sve* properties one big entity, so their validation is also
> > self-contained. If we add vfp and neon, then indeed I was wrong
> > with my suggestion in the commit message. They would need a later
> > validation check. Should we just cross that bridge when we get there
> > though? Or would you like me to see how that would work within this
> > series?
> 
> While the sve* properties are handled by one function, they are not handled as
> "one big entity".  You examine then apply or diagnose the effects of sve384=on
> before you separately examine the effects of sve512=on.
> 
> I think it would be easiest to merely record facts while processing sve<N> and
> sve-max-vq, with no side effects.  Then in the common validation function see
> the required side effects and diagnose errors all at once.
>

I'm not sure. Of course I'd need to experiment with it to be sure, but
I'm reluctant to go through that exercise, because I believe that a
deferred validation will result in less specific errors messages. For
example, how would the validator know in which order the sve<N> properties
were provided? Which is necessary to complain that one length is not
allowed when another has already been disabled, or vice versa.

Also with deferred validation I think I'd need more vq states, at least
for when KVM is enabled. For example, if 384-bit vector lengths are not
supported on the KVM host, but the user does sve384=on, and all we do
is record that, then we've lost the KVM unsupported information and won't
find out until we attempt to enable it later at kvm vcpu init time. We'd
need a kvm-unsupported-user-enabled state to track that, which also means
we're not blindly recording user input in cpu_arm_set_sve_vq() anymore,
but are instead applying logic to decide which state we transition to.

Thanks,
drew
