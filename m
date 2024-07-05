Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp3900846dlb;
        Thu, 4 Jul 2024 17:09:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEPvoDnatP0k54QTc2wMOQkkvAzHOTDKyDHGMR8sKxmGOTURDHhlA8fJKAjNb5/gzgRV6zMyPl5pW1FZkRz8z/fKNEzKen
X-Received: by 2002:a05:6808:2114:b0:3d5:6754:7f5 with SMTP id 5614622812f47-3d914b76173mr3494526b6e.0.1720138146527;
        Thu, 04 Jul 2024 17:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720138146; cv=none;
        d=google.com; s=arc-20160816;
        b=jr9tqZEZtYL54hYUAtBF5hkoaiFVixTrXtTCMU1OoUAMrRURLAgwy71XxtYYx6B/Dl
         emUVhXDQ8s1tNMJjx15FG2F7oPPDpRpnfUdVHHxFuZRkboYw9pYBK+umui+ip+kOfco3
         xeto9hM7VDHKCA7QGTMrZVtFvPJFmPm0T/FOFFBIkTpSMfXVsPpws+Vrz/Hf1INLBbwH
         s2tylj5AFMTJSzbgTKlBaNTJbrfElRD8BzOyuKxrckfnVDFT+goUyTUXXnkZWOw+EhTe
         xhuv+LUfQKjSbcTNP+Dg9ibyhGd8hsx6aUKKnTbtPqONMjg5ZPCUmO17b7QdGZKU8Vae
         HRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=J8c4Rfno6JWt6kSJcMhwkFgcGjBQpKGVlBEZqrrKONs=;
        fh=kwPy0mz6lgYwxOl7U0wxfNXijbxx0iJPxkD3hl78qIM=;
        b=hB1hNwHBginD9qQ81lD+EEwAScR3Sb3sqaDdKoQoR20CYSPLOf0TXFX/Cam9ul+qwf
         0/275IRFtUgV8d3AZvYIumdoA9t6l3G3OmAO83XdxmUCpN0eDlyX7MT+zPQ5BO+ljGCH
         lXN0HeAteG5zaPZrwKJ/+C9AUUjj5CyzaLvp8Ws0H5QKdQSxQsjPiaxbOVKWfYOd75kp
         Mvp8FXMs8cwhjFWPDYslr/K74rrD4QmHj7fNykzXbQFeCfSS9SvYSj5xsIzaa33KfcAx
         vtgbwbxNPHPc5TF9Bbhb63vi4Q/R/bu3ATyUOarrCs5qGLT9R9SALfn3K0pVeIxWJxkI
         Gmbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NIphUIRe;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7274a9faec4sor5754109a12.9.2024.07.04.17.09.06
        (Google Transport Security);
        Thu, 04 Jul 2024 17:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NIphUIRe;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720138146; x=1720742946; darn=linaro.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8c4Rfno6JWt6kSJcMhwkFgcGjBQpKGVlBEZqrrKONs=;
        b=NIphUIRewvFuPSFWJFrTfzGAa4AYnUlJZmFV9RAn+2+nUCzaDpGG4wvyTjW5kGKi9W
         J8jAsJoffdY3LvOwlttmkkt8aAO6QswBIVGalpKhlTReB5VJhIQHLMsFXM7z+72IhyIa
         s3LX7jrW0rNUhQG3teF3zCyMCGX4f6DF1lTaEX2LK9lf/M3YRsAASPlop539cn+nX+z3
         rFWKGqHSbgmX9xTWQSRb1pgEIkvAtzSWz3KyyFZaJUfd4gcyrrWwPhSAYqwCLglzIvxr
         ZmkZAnr+nKB3Py3naL+vC3bkAgzhvIy7O4y331D1MXnfei4xS6a9Sn/fiwbmrRfBK2OW
         lnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720138146; x=1720742946;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J8c4Rfno6JWt6kSJcMhwkFgcGjBQpKGVlBEZqrrKONs=;
        b=TvCNCYJyFSFR41EKVRHVmJIf/UjnXENG3Z1anpPFoIJj+zsEo9PCxi3o0xV6Umq1j/
         Ah8jjHbEjxmhCF4nilf05FzKcXD44zmqQBZ3GF/OS6TRt9hGDRfRQwYJb4ynbgdXHNzc
         A2P/sgaDEy7XZhXoQ3L9Rvn0R1OGMrEQEyhjtCTqKHclcdEU/F8qfKB5o91hIRQn1xlf
         vz59jWtzk4i2uaquhLqOjJWAf2osxPkfi/aB7o/lySXlphAWLJLPqhrv0vW9pAm6FKKu
         4jJ5700cy1uB1UKiiQrW//BSui/zd/KZAjAKjNTxQIOE1IqrOkvgINCxL5HxHoIxskkF
         LucQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkJlow9dQOdUIELl/4tYS6YGTTjj8emVNZY5f4+ur3Ud3ybUfV74igyp4dRCziT+UQpkEL5gtM5MW8QXiJzAe/n8KYW4EaGokXv0phpGETQdejDvLQSR8vvSD2chJa4ywxBsLsF5UKTfbPN/qIUeYyxEOERehhuYRsJw/tcQ3Oiu+sUj6mj3Kw+h6sP7A9VheWpYYeuTZJA/9hp1ZF4UrveQuLUfzqL+oZ/1Y=
X-Gm-Message-State: AOJu0YwoADOF7uRL54NB8hC1sHb/KYNFKLYhJDWseER9pAMv7S23hCkg
	fbGf9mZhf1nSGpfoLFVaILWCUjfp05pVBd6+M9vJQ9lPq1l3enD/
X-Google-Smtp-Source: AGHT+IHmub6qh/qK2FE/TERFl+CK3kqBg5jQIkEn7YvlldKohJYfsG/VkLkzoBcHa8B0xXHQMXZrjw==
X-Received: by 2002:a05:6a20:da84:b0:1be:d74c:dd5a with SMTP id adf61e73a8af0-1c0cc74bdaamr2805646637.23.1720138145705;
        Thu, 04 Jul 2024 17:09:05 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac11d9685sm128330415ad.111.2024.07.04.17.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 17:09:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jul 2024 10:08:49 +1000
Message-Id: <D2H62RK48KT7.2BTQEZUOEGG4L@gmail.com>
Subject: Re: [PATCH RFC V3 13/29] arm/virt: Make ARM vCPU *present* status
 ACPI *persistent*
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Salil Mehta" <salil.mehta@huawei.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Cc: "maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org"
 <jean-philippe@linaro.org>, "Jonathan Cameron"
 <jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
 <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "gshan@redhat.com" <gshan@redhat.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "borntraeger@linux.ibm.com"
 <borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>, "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>, "salil.mehta@opnsrc.net"
 <salil.mehta@opnsrc.net>, "zhukeqian" <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>, "wangyanan (Y)"
 <wangyanan55@huawei.com>, "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>, "lixianglai@loongson.cn"
 <lixianglai@loongson.cn>, "shahuang@redhat.com" <shahuang@redhat.com>,
 "zhao1.liu@intel.com" <zhao1.liu@intel.com>, "Linuxarm"
 <linuxarm@huawei.com>
X-Mailer: aerc 0.17.0
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-14-salil.mehta@huawei.com>
 <D2GEV8KD5L3F.FRD8UH16X3GU@gmail.com>
 <fd0478a51e4e445da33dadafc00b33f6@huawei.com>
In-Reply-To: <fd0478a51e4e445da33dadafc00b33f6@huawei.com>
X-TUID: M5CmCO7+nApt

On Thu Jul 4, 2024 at 9:23 PM AEST, Salil Mehta wrote:
> HI Nick,
>
> Thanks for taking time to review. Please find my replies inline.
>
> >  From: Nicholas Piggin <npiggin@gmail.com>
> >  Sent: Thursday, July 4, 2024 3:49 AM
> >  To: Salil Mehta <salil.mehta@huawei.com>; qemu-devel@nongnu.org;
> >  qemu-arm@nongnu.org; mst@redhat.com
> > =20
> >  On Fri Jun 14, 2024 at 9:36 AM AEST, Salil Mehta wrote:
> >  > ARM arch does not allow CPUs presence to be changed [1] after kernel
> >  has booted.
> >  > Hence, firmware/ACPI/Qemu must ensure persistent view of the vCPUs  =
to
> >  > the Guest kernel even when they are not present in the QoM i.e. are
> >  > unplugged or are yet-to-be-plugged
> > =20
> >  Do you need arch-independent state for this? If ARM always requires it
> >  then can it be implemented between arm and acpi interface?
>
>
> Yes, we do need as we cannot say if the same constraint applies to other
> architectures as well. Above stated constraint affects how the architectu=
re
> common ACPI CPU code is initialized.

Right, but could it be done with an ACPI property that the arch can
change, or an argument from arch code to an ACPI init routine? Or
even a machine property that ACPI could query.

> >  If not, then perhaps could it be done in the patch that introduces all=
 the
> >  other state?
> > =20
> >  > References:
> >  > [1] Check comment 5 in the bugzilla entry
> >  >    Link: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4481#c5
> > =20
> >  If I understand correctly (and I don't know ACPI, so it's likely I don=
't), that is
> >  and update to ACPI spec to say some bit in ACPI table must remain set
> >  regardless of CPU hotplug state.
>
>
> ARM does not claims anything related to CPU hotplug right now. It simply
> does not exists. The ACPI update is simply reinforcing the existing fact =
that
> _STA.Present bit in the ACPI spec cannot be changed after system has boot=
ed.=20
>
> This is  because for ARM arch there are many other initializations which =
depend
> upon the exact availability of CPU count during boot and they do not expe=
ct
> that to change after boot. For example, there are so many per-CPU feature=
s
> and the GIC CPU interface etc. which all expect this to be fixed at boot =
time.
> This is immutable requirement from ARM.
>
>
> > =20
> >  Reference links are good, I think it would be nice to add a small summ=
ary in
> >  the changelog too.
>
> sure. I will do.

Thanks. Something like what you wrote above would work.

Thanks,
Nick
