Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7070982wrm;
        Wed, 16 Oct 2019 05:21:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxsqpGac1AAv7zjlkSxYW3ZzH+yQN1lG50wHcrr8qjLWg02Jr8digV3pTjZnszc5Q4KlIDv
X-Received: by 2002:a92:8c1b:: with SMTP id o27mr11864524ild.42.1571228473153;
        Wed, 16 Oct 2019 05:21:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571228473; cv=none;
        d=google.com; s=arc-20160816;
        b=Y2v7Mopmx0t+pZ/BfC8LTTkVSvoYagiNoZBmzqOyPCfSOA8eRgY7cfYVCWVbu2LbCg
         wccJaIdh/XbJ0GMgrOGNBadhDWuKo3zlGaS8jJf0n+PXJWZMgz77hplC8ryMzn4jRkSf
         VDo2phdPx7CL60jnFKIlqnap8MAf3g5lUOO6lNe6X/0mXDyd3JqpmoZxyjUoFBgRMVNN
         VWll6vCHUWPzhjKr8ZOkGSSxjJ9/lxUK5r2uVKEDyWCAw41Nhz+Ot2VIQJuhMIMV7/PW
         GfRJqgIe+aeQK4JSHqf9n36/nuHJHHzNt4XtopDEe6Iy1i7ogXFEqTJBVnUBisvZE2eT
         iCUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=tqW/kAlSHjtZy5uCI30x8CRsxQM/PhiJk4s/qU97Jtg=;
        b=FhlmbQXQ86cWsfP5SEpnNy2e3aq6S2/lNcA4LshoiwIAt/0mvtHoHHi0k0VyoHv2kB
         Nb/qox39cSywdHl63FVr6DR9VpsOrUqm/HPDmeLHttodb3VG1zfbA+I/3Ka/w80C7myG
         XXQoIo11wPilMtl40Yn6+CKg4Oq0Vs8cfQ4vvtZJwFbZvlLbpP6RLfKHzsYNhUx9H24W
         DMtgGh8882J2V0M4RX8aTuexCx6UpTrqW/6ivLvrCD37s9nxSbttvZ6c+Gl4ccs3ZQyG
         tikNJEGPrGmCshRMnPvqvCbj0sgIU8arHhg5G7M8p/oUpsZNePxyWh8EubTEuNFCy+uN
         1ztw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g3si37283373jam.24.2019.10.16.05.21.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 05:21:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4EE8BA3CD8A;
	Wed, 16 Oct 2019 12:21:12 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F346860852;
	Wed, 16 Oct 2019 12:21:05 +0000 (UTC)
Date: Wed, 16 Oct 2019 14:21:03 +0200
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	eric.auger@redhat.com, imammedo@redhat.com, alex.bennee@linaro.org,
	Dave.Martin@arm.com
Subject: Re: [PATCH v6 2/9] tests: arm: Introduce cpu feature tests
Message-ID: <20191016122103.l6vz423k3gpdr2bv@kamzik.brq.redhat.com>
References: <20191016085408.24360-1-drjones@redhat.com>
 <20191016085408.24360-3-drjones@redhat.com>
 <cec54f08-9508-13e5-600f-3442962a1642@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cec54f08-9508-13e5-600f-3442962a1642@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]); Wed, 16 Oct 2019 12:21:12 +0000 (UTC)
X-TUID: 7+dlCU+ZrWzj

On Wed, Oct 16, 2019 at 02:05:24PM +0200, Philippe Mathieu-Daudé wrote:
> > +static void test_query_cpu_model_expansion_kvm(const void *data)
> > +{
> > +    QTestState *qts;
> > +
> > +    qts = qtest_init(MACHINE "-accel kvm -cpu host");
> > +
> > +    assert_has_feature(qts, "host", "pmu");
> 
> Have you tried this on a ARM host? I wanted to but don't have access to one
> :(
>

Yes. All code in this series has been tested; covering these
configurations

 - TCG aarch64
 - TCG arm
 - KVM aarch64 without SVE
 - KVM aarch64 with SVE
 - compile tested arm code with CONFIG_KVM enabled

Thanks,
drew
