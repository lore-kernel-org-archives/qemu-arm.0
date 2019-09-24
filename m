Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3942533wrp;
        Tue, 24 Sep 2019 06:55:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8ABDTIDMIMXs5DV8aTlM0eySsytoRuDVawo6VMXznRuSXRslR+miKcrPxC0YS5CEOKrZ+
X-Received: by 2002:a05:6830:101:: with SMTP id i1mr1975529otp.233.1569333340466;
        Tue, 24 Sep 2019 06:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569333340; cv=none;
        d=google.com; s=arc-20160816;
        b=EHH/9wwyYz2QPkYgi8PMk1HOhh3qqBPePq+CH55JYGdyzbAjQ6n/jqPHB9MOWLq/aU
         zvi7G+/P3H3w7HXhq446pOAAKDo2LfwuFCfdnZXEmcb7A1Gxa0W34lsxfdYZtd1sBCVC
         gRY5d+ZdJwlhNd9d/fnu5PZhPiadS9ULDhP2mc9vH0lUih7Bi99yHYUHaK0VVXGhPTaz
         iqBk1bTOtWK+qeJol9XAryEOQyv6+Jfi1qs5ntkv8Nlfw2jzlmQXcvD0wyFIHg9A8Q/G
         4Tbwu9XlNDZo65wmvPt+4Pdk2dKOy0PVUySsnrAnzP9IRq2zQYbjl/00G9avUtHAh9AT
         CuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=c+I2Ut1ycQS1BPaWsXnBcb/JidYDwC6fSp6zEfDZ6MY=;
        b=tMRgzFmDjOvj+ZRap5ca4h34K4zhouUrCgexrIptNWheEdD68A4yd5e4+Yt3oHGEFL
         I/51EfBeaoXb1CDmVOpel16E98XQKHDqqXeQ2pyhDn0LWPj5XTwsf/krSIZSdMzTldH+
         vWiY7bIwGPyb7iGqLXO3tdMTFPtUZsLLbaQ/1KLihnVpexpdtG1CAwwDSTm0615R+kHV
         YkyhR2fOVknCmrUt3TzcEep0o/pDzGZ5Ez8+kD3BfElK7HRWIQwURHkVePJ4PXSmqTEY
         coO0MYeBdvOZX4Co5DwQ3/+sPKfCOkgbAUMGkYX9eKYwK9+jxbniwHAY0kMw2WHcHBbB
         xumQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c22si912361otr.148.2019.09.24.06.55.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 06:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A111EC059B7C;
	Tue, 24 Sep 2019 13:55:39 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 554525B6A5;
	Tue, 24 Sep 2019 13:55:26 +0000 (UTC)
Date: Tue, 24 Sep 2019 15:55:23 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
	Dave.Martin@arm.com, eric.auger@redhat.com, imammedo@redhat.com,
	abologna@redhat.com
Subject: Re: [PATCH v4 4/9] target/arm/cpu64: max cpu: Introduce sve<N>
 properties
Message-ID: <20190924135523.bq75pl24xesb6vgj@kamzik.brq.redhat.com>
References: <20190924113105.19076-1-drjones@redhat.com>
 <20190924113105.19076-5-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924113105.19076-5-drjones@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 24 Sep 2019 13:55:39 +0000 (UTC)
X-TUID: 1PLkgzTCQxl/

On Tue, Sep 24, 2019 at 01:31:00PM +0200, Andrew Jones wrote:
> +SVE CPU Property Parsing Semantics
> +----------------------------------
> +
> +  1) If SVE is disabled (`sve=off`), then which SVE vector lengths
> +     are enabled or disabled is irrelevant to the guest, as the entire
> +     SVE feature is disabled and that disables all vector lengths for
> +     the guest.  However QEMU will still track any `sve<N>` CPU
> +     properties provided by the user.  If later an `sve=on` is provided,
> +     then the guest will get only the enabled lengths.

I just spoke with Andrea, who is doing the libvirt side of this, about
this behavior. He suggests that we change it such that an error is
generated if sve=off and there are explicitly enabled vector lengths,
e.g. '-cpu max,sve=off,sve256=on' should generate an error. It would
still be possible to have sve<N>=on and sve=off on the same command
line, as long as the sve<N>=on is followed by sve<N>=off, like this
-cpu max,sve=off,sve256=on,sve256=off,sve128=off, but I don't think
we need to worry about that sort of thing. I'll add an error for
the non-empty vector length map with SVE off case for v5.

Thanks,
drew
