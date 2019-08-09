Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9387829wrv;
        Fri, 9 Aug 2019 09:09:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyEvccRKBfOEgwUEFES9VQJWTcnaJQTAzsL5zKmc/606627FwLS3fMSXZ0241cH0hjEBqKE
X-Received: by 2002:ae9:f707:: with SMTP id s7mr2047460qkg.0.1565366973042;
        Fri, 09 Aug 2019 09:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565366973; cv=none;
        d=google.com; s=arc-20160816;
        b=zLx032equb+TRgIo6a94L9eMZBv3esT2IzlWlxr/miozJ8gu2jREghVuzO/cHrwSQH
         RMQBuxt4QOtELDzdmRqFdCFx98gWa/MFBuL7hM+ylsRKwCQf7ZI7J/DW9KoblcNmqUSe
         gwmA+3vVBCPbVAnn6Dz+eQdP2e37PZkInLb0JN07TKHgFgN7tN05BSpd1gxgotckh1P+
         ICTU4F3yiDl4uOotdpSNxQvZnwh6nKRoFLRNVfHykcJQPinukFQl9piyhHT+afawQOO6
         UDjdngp7WMmSIE5KxZKyIj0u6rf6l+tAzum8qUNt72R5khgZfhSv4raM24/Tuhfr2Tw8
         ubwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=RTMkiEB2kfdQYO/Qqd+nCus9w/bWOvwjRm7eP19GkAk=;
        b=D05fvrNF6poN1kSiacb5h1LrDUB6XZaFE8MokCxpdurZzW+/g2aZ8K41Y4AwhHod2/
         g8C/GzAZvASaVthu/0Vd3ToFQSPeyBauwrRDGyGU0BYiWIk3DGD+VT7MEdlDc99lcZa0
         Fqi2SqbLAZUqI0I7lomqmlYjazBxUUFlMWhJJc81k8tiQX5Bvu+GhNkNtIVDY0pVEaQd
         YVroqpuZF7nWUn+3CqBcYPvFn4gVX0qqwVcVxbyp705gCSt5/61Tv8yU2Pk2RDB3FuG6
         3AkJhueLVsdn7u+aTTNgdg/pA9ttZaYUPBuIMWUk9j4DfrmzhPwSczdBljsfvM2i491/
         w/Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t54si56726929qth.352.2019.08.09.09.09.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 09:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 322D5308421A;
	Fri,  9 Aug 2019 16:09:32 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E519760933;
	Fri,  9 Aug 2019 16:09:22 +0000 (UTC)
Date: Fri, 9 Aug 2019 18:09:20 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
	eric.auger@redhat.com, qemu-arm@nongnu.org, imammedo@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v3 03/15] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
Message-ID: <20190809160920.f4sz72irkuj4pqr7@kamzik.brq.redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190802122540.26385-4-drjones@redhat.com>
 <d0983bd5-c1a5-adf6-324d-2b199ca0e23c@linaro.org>
 <ec44ddad-c33c-918b-e94b-a534a2519a9e@linaro.org>
 <20190806122144.bb3klk7aaaqdhgwi@kamzik.brq.redhat.com>
 <39a4d205-d291-8962-2693-6bbcce89c332@linaro.org>
 <20190808085012.23aokly34zo4wxbk@kamzik.brq.redhat.com>
 <bb477706-e09a-c992-38f0-d3f8725bb4c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb477706-e09a-c992-38f0-d3f8725bb4c5@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 09 Aug 2019 16:09:32 +0000 (UTC)
X-TUID: OezvSVQuJRA2

On Thu, Aug 08, 2019 at 11:37:01AM -0700, Richard Henderson wrote:
> On 8/8/19 1:50 AM, Andrew Jones wrote:
> > I'm not sure. Of course I'd need to experiment with it to be sure, but
> > I'm reluctant to go through that exercise, because I believe that a
> > deferred validation will result in less specific errors messages. For
> > example, how would the validator know in which order the sve<N> properties
> > were provided? Which is necessary to complain that one length is not
> > allowed when another has already been disabled, or vice versa.
> 
> My point is that we would not *need* to know in which order the properties are
> provided, and do not care.  Indeed, removing this ordering malarkey is a
> feature not a bug.
> 
> The error message would simply state, e.g., that sve256 may not be disabled
> while sve512 is enabled.  The error message does not need to reference the
> order in which they appeared.

OK, I agree it doesn't make much difference to the user whether the error
hint is the generic "sve256 required with sve512" verse

 sve256=off,sve512=on  "cannot enable sve512 with sve256 disabled"

or

 sve512=on,sve256=off  "cannot disable sve256 with sve512 enabled"

> 
> > Also with deferred validation I think I'd need more vq states, at least
> > for when KVM is enabled. For example, if 384-bit vector lengths are not
> > supported on the KVM host, but the user does sve384=on, and all we do
> > is record that, then we've lost the KVM unsupported information and won't
> > find out until we attempt to enable it later at kvm vcpu init time. We'd
> > need a kvm-unsupported-user-enabled state to track that, which also means
> > we're not blindly recording user input in cpu_arm_set_sve_vq() anymore,
> > but are instead applying logic to decide which state we transition to.
> 
> Or perhaps, less vq states.  You do not need to compute kvm states early.  You
> can wait to collect those until validation time and keep them in their own
> local bitmap.
> 
> bool validate_sve_properties(...)
> {
>     // Populate uninitialized bits in sve_vq_map from sve_max_vq.
>     // Populate uninitialized bits in sve_vq_map from on bits in sve_vq_map.

And disable uninitialized bits in sve_vq_map from OFF bits: auto-disabling

Also we can't do these populate uninitialized bits from on/off steps when
KVM is enabled without first getting the kvm-supported map.

>     // All remaining uninitialized bits are set to off.
>     // Reset sve_max_vq to the maximum bit set in sve_vq_map, plus 1.

I wouldn't always do this. If the user explicitly sets a maximum with
sve-max-vq, then we should generate errors when other inputs would change
that maximum. I would only assert they're the same when both input types
are provided. Of course we do the above when only map input is provided
though.

>     // Diagnose off bits in sve_vq_map from on bits in sve_vq_map.
> 
>     if (kvm_enabled()) {
>         DECLARE_BITMAP(test, ARM_MAX_VQ);
>         kvm_arm_sve_get_vls(CPU(cpu), test);
>         if (!bitmap_equal(test, s->sve_vq_map, s->sve_max_vq))  {
>             bitmap_xor(test, test, s->sve_vq_map, s->sve_max_vq);
>             // Diagnose the differences in TEST:
>             // test[i] & s->sve_vq_map[i] -> i is unsupported by kvm
>             // test[i] & !s->sve_vq_map[i] -> i is required by kvm
>         }
>     }
> }
> 
> If you prefer not to experiment with this, then I will.
>

Ah, the ol' I'll do it if you don't motivator... I do see some
potential for a reduction in complexity with this approach, but
I'm not sure we'll save many lines of code. I could do a quick
hack on top of this series, just to see how well the validator
function looks and works, but I can't get to it until midweek
next week. I won't complain if you beat me to it :-)

Thanks,
drew
