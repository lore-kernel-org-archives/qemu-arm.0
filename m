Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4770081njb;
        Thu, 12 Dec 2024 05:13:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUHlU+ex+pcQR8X3izihT8KSK1p5tNf/m0aXpQD3DvlIxsz3J5/LKiMpPpy5YqLTJuWfYfJ+lbCSahw5A==@linaro.org
X-Google-Smtp-Source: AGHT+IGF4hKyA/D1wQQ9nSY/aITG+sxAXiq4EFgORvCNKx51uY8wWPqj6LvWZVPrgyCNOdQtnWXj
X-Received: by 2002:a05:620a:6849:b0:7b1:1366:c251 with SMTP id af79cd13be357-7b6f8986bb1mr47502985a.34.1734009214269;
        Thu, 12 Dec 2024 05:13:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734009214; cv=none;
        d=google.com; s=arc-20240605;
        b=VRKJNkvNUrHzh11oOZSUCzautSuIJ5etoMzipdO452Cq3bmmw31cyEP3mf5Hg+/GsV
         niV1dasl53wLVAzsY3xVxlZ/a+7DodclSQEC5rghQDMOKxdewHLlqZcan1t66CAMXdnK
         8hdukgaqZT7W4IHqYYwfh5oFF+lWjbHgPGAS+9eVgzzrJ/E5UjGekJsbGLPqDJC/4afN
         Tae/msvhu0/Jg8LDzm1xgb3nM0kzxelTUgs/kqtSZm1J/Z+3V5mPxqM2nJlLBYNoBmqX
         G34f29pHtINfxk4mgrQDDHpxE2BzTLfvIo0mICU+5rKi+5vJij+lL9P4NylMsTJOUZLS
         CmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=Wxof28cpgCbDnkhoQWNSoVVTvYRkzUUHJ4j75bS+0v0=;
        fh=vHTes1JXrNL+YVUeTpY91P+e/aAdhEkYS/foaaEXSOM=;
        b=f+by0VrMd8EiUahWtaERx83bujE6xjL7UUBNoMdPIVhE+Qi521WY5NNhBL7VCRToPL
         Y04rWmlpQz9gBV8z2fMEKbi1IVve+vp12R52HWrt6UeRTIed6vdwGl4VBDOWHRcwAldM
         /CMU+26aE/5lVqu2sU22F3iPUa8G3/Ik/g8yxMmkRYnQKLyIJYtmOtgmMZweuZCz7cnA
         p3IE4L+X89/atZJvBq6bPfHzQUqO+0FyJhbVyEZl+rcawc9zcTVnk4OERcVNz4kSCrmW
         Vz3PbdutzrugOfhKpSbs0c6LAJ1OF/EMt1NkNTRq6GDbqjvDSUw2XTLBeVkavb5G685l
         zJDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z3DmMv9V;
       spf=pass (google.com: domain of sebott@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=sebott@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <sebott@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-85c2be35212si3850097241.186.2024.12.12.05.13.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 05:13:34 -0800 (PST)
Received-SPF: pass (google.com: domain of sebott@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z3DmMv9V;
       spf=pass (google.com: domain of sebott@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=sebott@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734009213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wxof28cpgCbDnkhoQWNSoVVTvYRkzUUHJ4j75bS+0v0=;
	b=Z3DmMv9VRJmQoN34NS6RAG+vqIdmEqFqtOW5fHufHzsaI6J1isXc721/w5nY6A/T1gslm5
	aYzLAky9WunAKTpxr8oOVuDSx1ostyn+KNj+FbQ3BclgZq8Na8/RRMj9rOpKeDkLdb+3NA
	BDzZO3zs5CAsJbi24/FN8j1rWBkvfJM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-5q3p2Hj6OS2gv6hjbTfb2Q-1; Thu, 12 Dec 2024 08:13:32 -0500
X-MC-Unique: 5q3p2Hj6OS2gv6hjbTfb2Q-1
X-Mimecast-MFC-AGG-ID: 5q3p2Hj6OS2gv6hjbTfb2Q
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385e9c69929so283031f8f.1
        for <alex.bennee@linaro.org>; Thu, 12 Dec 2024 05:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734009211; x=1734614011;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wxof28cpgCbDnkhoQWNSoVVTvYRkzUUHJ4j75bS+0v0=;
        b=dkik7BHyHGpIWbjW2E2PvuXg+ggjMNdPT53AUjpuC9uVNITO1y8MUv8c1alDdLwsPh
         H7A8s1Y2Mmh2X6hj7xIkMt+ru+A54Hi3IhOCzxfC8i94aPoJJhwZ6yRz/DyntcPPxvgk
         2++xLkwnjPLODWikHI5I4Wnt/dC8LX+aWwiHcY/H9d8+HfZJYwZj0gyJQGPw+bF2XpGC
         l+FemHSWuwsPWy3sBfuKk1NWGocqG9QoPWoVhZg+HtnCPDfVQo5ZP7im9wcEsKYmtro1
         F30SuUyiI3uRRrcjD+V2syYk6Zbdpc3dGDIrbMe5CXIw2keZHdkAw80+EM140xXscxk5
         FbVA==
X-Forwarded-Encrypted: i=1; AJvYcCWMgO1zNgk84yGN6V2Mn1RcaNlXMJwXb3gewaLAnTkgwinJrlJWSOkFrxcauAfyQnu2ZkihY9C7bRihiA==@linaro.org
X-Gm-Message-State: AOJu0Yw/vFY/boDuOXqD+e2YBYtv5LuOvKWksYX7HL8x3MbEmKOuwUVV
	2EfTSNGIuwBDwi/Eh7nFCI6wQ4o3lpIHVBwtu70JufWzwiOh8FikwrTs4zxOEVEmKEUVuyxPr1v
	KeKebiSO7K/Dy0uGstFCmX7tVZVVvUfCK7++nS5NlMgm1ESyO6OHWFg==
X-Gm-Gg: ASbGncu7X1HV5aj/L/wGGF9SPnofsn/c7WSOfNip4qsLEgXl4iwXFTa24dPsYOLO8JA
	W1EmjDwDYR3FFIcECz8coH4ndtbXxl9JXkcBO9p3c69qDdLxrA+ur+W7uanPSTwEZv0nQQq18ao
	e+hhEtCn8IG0zYvCt2Ffdw+b00jltBri7eDpRx9DvaomPF6FoY6paSvq+Z6NVnAk+9cqTWe+Ubu
	ErI1iUHRoRNEG8bclhnn4UGjuPd4pMzBEwhB7+s0chEwD1qmCbXb8o8HhFZEfK5Meye82xX7edg
	kp7tvevOeJSRLfQc4xs6ZDQeQMyl
X-Received: by 2002:a05:6000:1842:b0:386:4034:f9a8 with SMTP id ffacd0b85a97d-3864cec576fmr5319981f8f.38.1734009210948;
        Thu, 12 Dec 2024 05:13:30 -0800 (PST)
X-Received: by 2002:a05:6000:1842:b0:386:4034:f9a8 with SMTP id ffacd0b85a97d-3864cec576fmr5319966f8f.38.1734009210560;
        Thu, 12 Dec 2024 05:13:30 -0800 (PST)
Return-Path: <sebott@redhat.com>
Received: from rh (p200300f6af0bca008282df582fad0b68.dip0.t-ipconnect.de. [2003:f6:af0b:ca00:8282:df58:2fad:b68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782521dfesm3907401f8f.107.2024.12.12.05.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 05:13:30 -0800 (PST)
Date: Thu, 12 Dec 2024 14:13:29 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
    qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
    richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
    oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com, 
    armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, 
    jdenemar@redhat.com, shahuang@redhat.com, mark.rutland@arm.com, 
    philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64
 KVM host model
In-Reply-To: <20241206112213.88394-1-cohuck@redhat.com>
Message-ID: <90431f60-e366-50e9-e95e-2ec9c6812056@redhat.com>
References: <20241206112213.88394-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H3Rsf6ryCjRP08mhX7H-N2DZe7he11O0VtKB0Npp5hQ_1734009211
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-TUID: nSnzHBd2js7U

On Fri, 6 Dec 2024, Cornelia Huck wrote:
> A respin/update on the aarch64 KVM cpu models. Also available at
> gitlab.com/cohuck/qemu arm-cpu-model-rfcv2
>
> Find Eric's original cover letter below, so that I do not need to
> repeat myself on the aspects that have not changed since RFCv1 :)
>
> Changes from RFCv1:
>
> Rebased on more recent QEMU (some adaptions in the register conversions
> of the first few patches.)
>
> Based on feedback, I have removed the "custom" cpu model; instead, I
> have added the new SYSREG_<REG>_<FIELD> properties to the "host" model.
> This works well if you want to tweak anything that does not correspond
> to the existing properties for the host model; however, if you e.g.
> wanted to tweak sve, you have two ways to do so -- we'd probably either
> want to check for conflicts, or just declare precedence. The kvm-specific
> props remain unchanged, as they are orthogonal to this configuration.
>
> The cpu model expansion for the "host" model now dumps the new SYSREG_
> properties in addition to the existing host model properties; this is a
> bit ugly, but I don't see a good way on how to split this up.
>

I gave this a spin today and successfully migrated a VM between 2 similar
machines that only differ in the DIC bit of the cache type register using:

 	-cpu host,SYSREG_CTR_EL0_DIC=0

This allows me to get rid of my horrid qemu hacks to achieve the same.

Thanks,
Sebastian
