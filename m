Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp349951njb;
        Fri, 26 Jul 2024 02:34:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWG6+qGhNvbUtjDMcH3ymmCsIXYA4X3aHIRE82Q29MRYbU+aITSH6Mv4y0KSU6LF/vWPr4PFHqB7Zi9nOHYZE/kCgsdEM1Y
X-Google-Smtp-Source: AGHT+IHoNVrW/7YmaZHoJpYPMAy3UKB/mo8V0kjCwwZQi6G9/BIxfxn2Vf2FSfIlApmSmTJTdTEf
X-Received: by 2002:ac8:5705:0:b0:44f:d986:fe4c with SMTP id d75a77b69052e-44fe32cf147mr67053941cf.20.1721986444287;
        Fri, 26 Jul 2024 02:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721986444; cv=none;
        d=google.com; s=arc-20160816;
        b=EN7IKfyfnSRPQ0xk6zsmEu35sliA9FycLhQl1IXZOXPCSULhcWNPeUZlKEM47iOo4R
         L3vGTd+H24+1n/Wb8R+SobDc6S2TtWuvamle99rIXRRzJ3lDu8b/lLd7GBmeqyeh+QSj
         aJYkx8kVH48opZC4nJulkSzMts4VLbSxiQH1IrWWFLzFz28MuEyvDYV2ukwSfYIFDlC2
         gfvNGmWA/WE74BtA5LJlORtWhvgvB6M+8g4gsyvp9Q28vuM0ngiqZPQUpj0hi02kYd/E
         7aQ8DjsL2OzkYChwvEzdMefazblgm9bGQGfrv7f9A0FNfzGDU8TyMMZUs8C/mHK5WaD0
         3mVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=EBGQoV6sWcBATxW+ew0QzqXcAltRs/UxQO6ZDiGBqPo=;
        fh=ldF6imX4cZmyuf8FwxaCuX4tcxlDVjwKzJ1aIaS2GHk=;
        b=wQ2ch665yRPzWabcJCCrE21wCAYTDWSU7CD7T1fJkzGFxXvVPivMckwRQaveu/bzUn
         JZ3za8Mse7AL6MkfWRgzVm1hhq0dd5woCkVzK2FxvReeGT9MOzua5wAnWSWuOtzHNKDW
         DGu60sZnbGEq8AsnE4gQvqCy+AVLjdXkqYgoAgbsWp2xm1jlQUHYXASg7mq9hi1zGIzo
         KWIqKy5yjqY1cojv6Z2lRlutYy/ggaHQbzaydQdEiMfLGRZlIpQ+1F2QAOLxW7gZNtOX
         1kHk/Vs+WqYGpx9yTaKZXjX5xePq3NRLooq/lEUaleI7JGOwjjodABNrkEkPI8mu0DeT
         ygYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xq3zL86L;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe84267e6si38421421cf.602.2024.07.26.02.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 02:34:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xq3zL86L;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721986443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EBGQoV6sWcBATxW+ew0QzqXcAltRs/UxQO6ZDiGBqPo=;
	b=Xq3zL86LdZr18xiz5JqdtWoqtBujxpE+7bTKJio8dUvcaTSl902JWxOov0+FLF/EWe3rsY
	U8PK157ZjRGJwnn0hFUOERMDLkNGdY8zM6ZIPApc2UGqqIpeFnUio+ZqrMk81/a6zjj5Ck
	EA1U5EdF9YvEl2UHf318JWIh3aE89w0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-7fCiKJdANLKotyCFhzG_NQ-1; Fri, 26 Jul 2024 05:34:00 -0400
X-MC-Unique: 7fCiKJdANLKotyCFhzG_NQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ef2a44c3dfso9273951fa.1
        for <alex.bennee@linaro.org>; Fri, 26 Jul 2024 02:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721986439; x=1722591239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBGQoV6sWcBATxW+ew0QzqXcAltRs/UxQO6ZDiGBqPo=;
        b=CIUEuwkIRh4HGGvZr6yrc/Vg9hs1fvvJdTNEQPOCx37kQdbCe9o9c+ixpVx82tj4G2
         zWSYJY/F03ntKpailI/ej/VsTvxb1TYaRUd+bwfmvU66kYMaJ+OwGW0UFLYvED++KtHj
         poW16jddM/SUw9lzNXitgfEzLqCOagGjdRt3cRZNBhjF7O70STtawrUimtHHweeDQgbX
         AYQlwMagYxCy8Mnaogs0qpWqjVk6WYJZCH47qo0mqsefm/maoFMI15vdml/Nr4gVh62J
         R+M/AlCYv6XRu7nlJF5mN18xMCzbv39OoZJq8Iu7lf1ZjMybG/FgTVRQGQntnRJQSkOx
         P7bg==
X-Forwarded-Encrypted: i=1; AJvYcCX08DtdbmNUe/ioXfE4DNgUHoDiD4ySrtUhHJq2mc5A++Tm7gaBumDv5yetYM+k+lTag1vxjkEAEIkPi2W1Yak+CpmTJvJP
X-Gm-Message-State: AOJu0Yw1+6KwODqFGNFESRw1fLTIYziLF2E/qOUrKtkT+G9m5SiWXhN8
	QaTW8Ne4qJSagMsuVpuRJbxG7k6MuP7NkBs7JzQBaIRaIrVVyVsS1piljXmOlev2C7gCrouBGkD
	OTDMdPtH5sLXCyHJoHWXkXwquGXTrOb2FoBTmc4IT6LPnGqTmfR9pgA==
X-Received: by 2002:a2e:880b:0:b0:2ef:2c86:4d43 with SMTP id 38308e7fff4ca-2f03db6cf16mr32242121fa.3.1721986439273;
        Fri, 26 Jul 2024 02:33:59 -0700 (PDT)
X-Received: by 2002:a2e:880b:0:b0:2ef:2c86:4d43 with SMTP id 38308e7fff4ca-2f03db6cf16mr32241831fa.3.1721986438827;
        Fri, 26 Jul 2024 02:33:58 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057b5f69sm70314565e9.39.2024.07.26.02.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 02:33:58 -0700 (PDT)
Date: Fri, 26 Jul 2024 11:33:55 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
 <peter.maydell@linaro.org>, <maz@kernel.org>, <jean-philippe@linaro.org>,
 <jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <will@kernel.org>,
 <gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
 <linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
 <ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
 <karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
 <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
 <wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
 <jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
 <npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linuxarm@huawei.com>
Subject: Re: [PATCH] accel/kvm/kvm-all: Fixes the missing break in vCPU
 unpark logic
Message-ID: <20240726113355.731e61fe@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240725145132.99355-1-salil.mehta@huawei.com>
References: <20240725145132.99355-1-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 6HEGORKk7lKH

On Thu, 25 Jul 2024 15:51:32 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> Loop should exit prematurely on successfully finding out the parked vCPU (struct
> KVMParkedVcpu) in the 'struct KVMState' maintained 'kvm_parked_vcpus' list of
> parked vCPUs.
> 
> Fixes: Coverity CID 1558552
> Fixes: 08c3286822 ("accel/kvm: Extract common KVM vCPU {creation,parking} code")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Message-ID: <CAFEAcA-3_d1c7XSXWkFubD-LsW5c5i95e6xxV09r2C9yGtzcdA@mail.gmail.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  accel/kvm/kvm-all.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 0aa4b4624a..c181297f00 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -362,6 +362,7 @@ int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id)
>              QLIST_REMOVE(cpu, node);
>              kvm_fd = cpu->kvm_fd;
>              g_free(cpu);
> +            break;
>          }
>      }
>  
