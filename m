Received: by 2002:a17:90a:1a54:0:0:0:0 with SMTP id 20csp7214810pjl;
        Wed, 16 Oct 2019 06:34:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxHYlNRBj5tGj+XTUSSZG+0j+YwPc1mlmRrV5XSqWfWfZNlv1OThqFIQSy4VziVZm+nGPyq
X-Received: by 2002:a92:a144:: with SMTP id v65mr12600596ili.228.1571232853941;
        Wed, 16 Oct 2019 06:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571232853; cv=none;
        d=google.com; s=arc-20160816;
        b=ZkOoBNK8ksueDkpIWEQYbp9nWHuaMX4EltiEHM2K4n1uY2I5DH055SCV504RzzJVo5
         nulyS3F2YKt4o1WAV13Niq114b2XAmFXdgyPoySpYzyAGxXGJ7+TEsH2TmCIWj1AAQDj
         /Jq424ki+Sn8z7f7A1tYDCIKekrxrkIC/rRskiPX+oW+XeScPAg3fZFs0MITswoyhaJB
         kgZaltzMYqdgT6iv7aKd4Fwd6xODBHLQLkwTfs3QN8Nj3sS3HebOcbhz6kICCDJMAqZA
         IymwGxySXFKq2BjHTrdNdCNTL7hQXlNXWN+955wVPVU5cpRzKb/gjd8ZcWt/4VheFZoK
         fAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=FwsZY26JCcQgVAKcHo6HXC/C9vPyejsqx8ys0poeo8k=;
        b=PeXD2CGUsnNFEJ8rHToDAwE4ytnQc7siE9oCTYUkjyxfP6hqIfaymBuSgTh8+UPFCn
         rGWFbGzGiOUZa4dMicaGynh9Wq4XsHj4R6TGTJ69+1IgmSopckgcscMTgE2DjUSQpTLn
         ckOZN9Fq1wZxJr4RkUF7ArwrWWkMAvvATiRJIPYDP69HwnTweLOrja2zC0aBAa/kUFbs
         tusInMVRESB4uJGoNmPdkhgMcPXKoGZfkQS4mlwTH5WmI8a0RXd7tVVaQ53/lRV7PIK0
         makYu7tjSVPkE93pSdxtivp6NVZNceZAOoAMoRvAJg7TD/nv4J2XhpnloAqIC/uqa8j9
         jEUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n11si10200522ilm.10.2019.10.16.06.34.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 06:34:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2828B10DCC94;
	Wed, 16 Oct 2019 13:34:13 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D1661001B35;
	Wed, 16 Oct 2019 13:34:02 +0000 (UTC)
Date: Wed, 16 Oct 2019 15:34:00 +0200
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	qemu-devel@nongnu.org, armbru@redhat.com, eric.auger@redhat.com,
	qemu-arm@nongnu.org, imammedo@redhat.com, alex.bennee@linaro.org,
	Dave.Martin@arm.com
Subject: Re: [PATCH v6 2/9] tests: arm: Introduce cpu feature tests
Message-ID: <20191016133400.sx3ypcolhxxtjqlb@kamzik.brq.redhat.com>
References: <20191016085408.24360-1-drjones@redhat.com>
 <20191016085408.24360-3-drjones@redhat.com>
 <cec54f08-9508-13e5-600f-3442962a1642@redhat.com>
 <20191016122103.l6vz423k3gpdr2bv@kamzik.brq.redhat.com>
 <626412a4-5c61-1f6e-0f18-7b0d9f754baa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <626412a4-5c61-1f6e-0f18-7b0d9f754baa@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Wed, 16 Oct 2019 13:34:13 +0000 (UTC)
X-TUID: j3c0kWNTUZEW

On Wed, Oct 16, 2019 at 02:26:05PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/16/19 2:21 PM, Andrew Jones wrote:
> > On Wed, Oct 16, 2019 at 02:05:24PM +0200, Philippe Mathieu-Daudé wrote:
> > > > +static void test_query_cpu_model_expansion_kvm(const void *data)
> > > > +{
> > > > +    QTestState *qts;
> > > > +
> > > > +    qts = qtest_init(MACHINE "-accel kvm -cpu host");
> > > > +
> > > > +    assert_has_feature(qts, "host", "pmu");
> > > 
> > > Have you tried this on a ARM host? I wanted to but don't have access to one
> > > :(
> > > 
> > 
> > Yes. All code in this series has been tested; covering these
> > configurations
> > 
> >   - TCG aarch64
> >   - TCG arm
> >   - KVM aarch64 without SVE
> >   - KVM aarch64 with SVE
> >   - compile tested arm code with CONFIG_KVM enabled
> 
> OK, I'd appreciate if someone with ARM hardware can test:
> 
>     - KVM arm
>

Me too, but if nobody is testing on KVM arm then I guess we don't really
care if the test code has the correct expectations for KVM arm. If
somebody does eventually try this test on KVM arm then it will either
pass, meaning its expectations are correct, or fail, alerting us to the
fact that our expectations are incorrect. IOW, I don't intend to change
this test code for KVM arm unless somebody with the hardware does the
testing and can justify a change.

Thanks,
drew
