Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp1629243njj;
        Thu, 31 Oct 2024 05:24:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnd783Rb7/ZDcveHpsLuE3CRllCB79FoaBHB8qQLIls0DU/C4259W4bO0ySc80uSged3BEbVKYXnkrHw==@linaro.org
X-Google-Smtp-Source: AGHT+IGc4P8SGHcdZN+DE5UsyI6Q09JHdttWIAlPYCuvRjryA/JyW7OtQaarrcVrzIdVHT25+nOo
X-Received: by 2002:a05:6214:468c:b0:6d3:4055:e92c with SMTP id 6a1803df08f44-6d358f7e36emr9568606d6.8.1730377496067;
        Thu, 31 Oct 2024 05:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730377496; cv=none;
        d=google.com; s=arc-20240605;
        b=PJE8IA8VMG2Vheozj0oK4JEtaORxhpUBKT1754Q40a8IDlQx3fyF+EM9dvMXvHbPWK
         61LmJ3D1QoRTeHwPDo9kcrH4xdcvw7JCKZjFfxFgrodi69eF6qgMRWo1cbsJ6fohDcYt
         sjgOXfwPP63HFj0pliWTwG5Drt7nTi9HW1FHf3K9i+Q2Kbfh3N4m3Dqvgp1FFomjBdBA
         6McvPSgNdUlgFwbRK9vclsUlnV95WsFbV05ukYMxjjyCFCQSa4Mux2rhpq3+SP84JytF
         ehzbTR+8FP4ddMVLYBjt6UmBPnMrU5LffCzz2h9eeuVTMxr6kR5GuRgE1Sx2BcNejFwt
         Audw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=KPd7oDcX9eG7TVtE1AQlSacTh7/i7Z+qfMhr0px/qxo=;
        fh=7r7oxc+g4nVVAEN+VaFTzOkagYVS3hFO/mrQRa4U+/I=;
        b=j03WNyJMJxsZwFmWsGiqrUAqZ+B3G6mKPrUUK+4tX3CzoYvyZ2LtUlZX+881lCGvRn
         C4mRpVok8mhmSIXwE2yMPfhrF5eUMLMgyDEn9HwH9nGlfo1ox3gJvIjGVfR07Jl9aHVM
         pzUbnZADcpBpNCPpRoQlO2EdlOMyX835vFZtpEv8YOVgnViKbsC+BOGK1NCiuEB+JDTd
         D5eQw2jSMrO1DUAJDIJ4Wb9uhsu/FBAvDrSRNTP4VmUdldVHXYrOBtSsOg8bUffzZVkv
         bqkcwQKgOrLbU/sEEHYnzhLBrllsnFl8zeVlnrrfpltISlEYIlbUL7oJ2D6VpznvPXlz
         UxCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZGgIgDWh;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d35417fac8si17340136d6.368.2024.10.31.05.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:24:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZGgIgDWh;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730377495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPd7oDcX9eG7TVtE1AQlSacTh7/i7Z+qfMhr0px/qxo=;
	b=ZGgIgDWhagVF6sp3UOaBpAWT8idhmdTj3LOnb3CwzIshuvk/CJQbo9Nz3puDnEvKiBuQMY
	nJ4nW2t5ZL5tYYaX9z3B9a5K5LVLCg3zgIT8ivclrhhV6bSLnl1640HTYxf/WbRsTCQLkp
	oQeKHAkfFWdj8DtpLqs0+RjIymXMQts=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-410-oLV_MKhvOJit6ANUPC0mtw-1; Thu,
 31 Oct 2024 08:24:51 -0400
X-MC-Unique: oLV_MKhvOJit6ANUPC0mtw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 562F919560BC;
	Thu, 31 Oct 2024 12:24:48 +0000 (UTC)
Received: from pinwheel (unknown [10.39.194.127])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB1821956054;
	Thu, 31 Oct 2024 12:24:40 +0000 (UTC)
Date: Thu, 31 Oct 2024 13:24:37 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
	pbonzini@redhat.com
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
Message-ID: <ZyN3A6dAEDkx51yb@pinwheel>
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-22-eric.auger@redhat.com>
 <ZxuZkUFz_bwAA1pf@redhat.com>
 <0700af51-a1a6-4b11-a4bf-0eaf6e279c6d@redhat.com>
 <Zxudl5-fZV1vIaEL@redhat.com>
 <87y128nrfr.fsf@redhat.com>
 <Zx-3OUioG1l47hW3@redhat.com>
 <87plnknqco.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87plnknqco.fsf@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: ewLNbYv9BKYx

On Mon, Oct 28, 2024 at 05:29:11PM +0100, Cornelia Huck wrote:
> On Mon, Oct 28 2024, Daniel P. Berrangé <berrange@redhat.com> wrote:

[...]

> >> We could consolidate that to the current "host" model, once we figure
> >> out how to handle the currently already existing properties. Models
> >> based on the different architecture extensions would probably be more
> >> useable in the long run; maybe "custom" has a place for testing.
> >
> > If you can set the features against "host", then any testing could
> > be done with "host" surely, making 'custom' pointless ?
> 
> We might differentiate between "do some consistency checks" and "allow
> a completely weird wolpertinger"; if we agree that we don't need it,
> then we surely could drop it again.

Yeah, FWIW, I agree that it's best to drop "custom" if all the
meaningful tests can be handled by being able to add/remove CPU flags
from `-cpu host`.


Related: I don't see any mention of `-cpu max` here.  Is it not
relevant?  It is currently defined as: "enables all features supported
by the accelerator in the current host".  Does it make sense for `max`
to allow disabling features?  Or is the idea that, why would you choose
`-cpu max` if you want to disable features?  In that case, go with
either:

    -cpu host,feat1=off

Or:

    -cpu some_future_named_model,$feat1=off

?

-- 
/kashyap
