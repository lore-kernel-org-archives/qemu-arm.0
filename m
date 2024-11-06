Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3490585njc;
        Wed, 6 Nov 2024 05:00:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUkuEqzBQoWRa7Js9YkHWLS3fJ9VPtMp6+PoF2NGDQ0Yf93qzAs9nPV6ZEZDASjCMF02KcfqVg5yUSkJA==@linaro.org
X-Received: by 2002:a17:907:3e8d:b0:a9e:c5a2:9cda with SMTP id a640c23a62f3a-a9ec66e9ef0mr205174066b.20.1730898055502;
        Wed, 06 Nov 2024 05:00:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730898055; cv=none;
        d=google.com; s=arc-20240605;
        b=lfRuEPuaTf4C+mLk3D36vAKZ8nASwbGIL12/eoRspn+lBIYqgsMxOf/J/sOkOVvwxY
         dKCxH94PYGux5xwHEBoMXgTJMUN4ID2SCkrvgQOzSOhB3sjCXUQqA4M8drvIf2Fgowsa
         dzmd80mqmnxQS50U+6dgEr71wrw2ZLEGrPlP04O9jM9QjQWEQ/n/Dh1TERJnqvqhq1OE
         X/ymD5B0bch/7JHi6VXh/+Y06CRH2lg1mPRINV7Zdghf8PYGgZ6MalVoHKsfhAdkDE9f
         91H0RXKJuUgb7bkuXHSwKNriRRsUsKT2PiEFdyc0k89o2pmDwDWPmnlXjTY1kdkMzAF0
         RWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jhFk8sXF0+0vMDlC/wtmfmSOJXSyyl3ZNW10dFJvH8s=;
        fh=+ImPzBoK7pZ2dovt6mU5t/6gDBRjO7uoIO7zGVAbwWQ=;
        b=Z5By4vsRoAcH5u7+fEEdVq0rIenkl1x8wCxoXgdXNuVS29XQZENyKUTdso3Qu371Vw
         FWPzoPh0MHCD96gYX3L0dc7bTUmRxkdBo91pztcDVrR72He5yi/47+Mo1YZ6TNpWc+YV
         kzPfVUX/takGQGxzPd1jvpZeX7uviKNQLy8/IbYmTYLM7OauDzwYH44gP4wHXYHjccXm
         FK21z+NP2TMxRVSpnabaypYUmRPvIaHf4AMUqTJVOx4haREYCm51xYyfkfvHOB73OtZR
         99BhlFr2jpdpXTrQAEom/+ACqQbQNGz35nqquuTQ3riRxUX+2PXX677oC9NGMU2J5ICj
         4Fag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=beDhyOmI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a9ec8c1b392sor44096466b.9.2024.11.06.05.00.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 06 Nov 2024 05:00:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=beDhyOmI;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730898055; x=1731502855; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jhFk8sXF0+0vMDlC/wtmfmSOJXSyyl3ZNW10dFJvH8s=;
        b=beDhyOmI2/4zOk3Gm++GjmZYNFPYNpkHA1MH9svWKM4Vz5ISMQMfhkvaXQbo1CNGhq
         91ZRP3rKT6L/hDLuCbtfPYY79RvkZmCD1DUkg6cTcONiabN4YUn52oKabkZk4Aiva5vR
         YX9kIW/Ts9y2NuQtM/VIM065DUT49Yi1+Atwl2FmRrv9AHL33edrAl+EqIJgaKvlenYg
         7qSfxkWcVxBuzEgoHtbtQ84/A18vFvS8qIGjeTbSp2YcIPeV9ncSX1KqGE8euHpdl5MW
         SWwGaEfyToz4yqAp5VU3vbp6ywe1H32RgDM0nFhPHk9mlO0HtelZIRJ+D0Pb/TkhUzh3
         PjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730898055; x=1731502855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhFk8sXF0+0vMDlC/wtmfmSOJXSyyl3ZNW10dFJvH8s=;
        b=ZtGCha8Q4J4Smi4SXfGboXaZW6F1FS6Le98k9tt3p3Mt6+2TyZJE38I+3JLUDZLGYD
         jy7Cmew4uT7a0lf46hNekegGw+qQZV/Pp8Yj4JyrA7U3d3ESuXOB9hmVOkVubI8KKoV6
         i4BCR+ZiM3nNtQnd3vvYwS8bZV4t1mdCpF1yB3y2++h6iyczdHFFHzj3lW3NpLBWZFUv
         L07vbEoMlQyFn1tdNsKY1fyoSrSwz5dageKojsyQddL8astyAzjwWzBaiRDJcjHRryg9
         cttPy1BYqJyckNyJ+2elsbpwFUTJLoAnSDU2r4+lZbv16x/x43CEVRDgS29Q9VjXKYEs
         VmBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/2wtNhAehsioLE4FJPEFPgdw2Xgnk3LGdxWc5NfdSbSncxrK0yk4lXOygw07sWMRoFfg2bLFpABlnug==@linaro.org
X-Gm-Message-State: AOJu0Yxf+b/9nt0SbpEup4J+qfLBohUBTkxFeLSizY+Ljslmkjn+QI0U
	b5zc0I8Uw8z8stLpbjDEa8KdOrAIFSKPyk5FxH/dGAjI2QilWzrziXiHQVi2wf9hqQ4WVjcxJDA
	52rv5gdQZXUoQii9SRvU693M/ir0o8+hPU8eJ9TlY
X-Google-Smtp-Source: AGHT+IEIbv26AHpMeik7ogNJXmmv7jlx0fvLwc8iofMhChEjjQZWYkmy4g3sNHHoo06SCHcsU5ueSbiN9951z8EOu/s=
X-Received: by 2002:a17:907:9805:b0:a9d:e1cf:b9d3 with SMTP id
 a640c23a62f3a-a9ec66049bfmr283588166b.12.1730898054735; Wed, 06 Nov 2024
 05:00:54 -0800 (PST)
MIME-Version: 1.0
References: <20241103152455.202462-1-salil.mehta@huawei.com>
 <CAFEAcA91DoU4dAHYy6OOeMjEQ+0LGZX8KM-rKsCh89UnFS4yTQ@mail.gmail.com> <7d27ceab963441dc8355d06e6bc4b88d@huawei.com>
In-Reply-To: <7d27ceab963441dc8355d06e6bc4b88d@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Nov 2024 13:00:43 +0000
Message-ID: <CAFEAcA9Jhz9a-X0B_bW++3kUePzTENJfq520A0CEst1o+QES4Q@mail.gmail.com>
Subject: Re: [PATCH] arm/virt: Extract common code to wire GICC<->vCPU IRQs
 for reuse
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
	"mst@redhat.com" <mst@redhat.com>, 
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, 
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>, 
	"maz@kernel.org" <maz@kernel.org>, "will@kernel.org" <will@kernel.org>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, 
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"david@redhat.com" <david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>, 
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "eric.auger@redhat.com" <eric.auger@redhat.com>, 
	"npiggin@gmail.com" <npiggin@gmail.com>, "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>, 
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>, 
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>, 
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>, 
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>, 
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian <zhukeqian1@huawei.com>, 
	"wangxiongfeng (C)" <wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>, 
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, "shahuang@redhat.com" <shahuang@redhat.com>, 
	"zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm <linuxarm@huawei.com>, 
	"gustavo.romero@linaro.org" <gustavo.romero@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 3IzAwU8YxU03

On Tue, 5 Nov 2024 at 22:20, Salil Mehta <salil.mehta@huawei.com> wrote:
>
> HI Peter,
>
> >  From: Peter Maydell <peter.maydell@linaro.org>
> >  Sent: Monday, November 4, 2024 1:27 PM
> >  To: Salil Mehta <salil.mehta@huawei.com>
> >
> >  On Sun, 3 Nov 2024 at 15:25, Salil Mehta <salil.mehta@huawei.com> wrote:
> >  >
> >  > Extract common GIC and CPU interrupt wiring code to improve code
> >  > readability and modularity, supporting reuse in future patch sets.
> >  > This refactor is benign and introduces *no* functional changes.
> >  >
> >  > Note: This patch has been isolated from a larger patch set to
> >  > facilitate early merging and reduce the complexity of the original
> >  > set, as it operates independently. All original tags and author
> >  > contributions are retained.
> >
> >  I would prefer to see refactoring patches in the context of the series that
> >  makes them necessary. As it stands, there doesn't really seem to be much
> >  benefit to this change.
>
>
> Ok no issues. Just to confirm, your above comment is just specific to this patch
> or all the 3 individual patches I had sent for review?

It applies to all of them (and as a general principle).

thanks
-- PMM
