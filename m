Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3249095dye;
        Tue, 1 Jul 2025 08:42:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrpOcdQGQX661pPRPR8gBfYc/TV4kCaEc+qhTyA/gQCXGTBD4fR+Tp2j/+/UxOm63JM7AK/9N49d8lgw==@linaro.org
X-Google-Smtp-Source: AGHT+IFOmzfNxTGC1JtVXGN2PBoGW8ed18q8XvFl45XnFuEILpcO1qXvY6g+Z/7LjAoJq9Frn/Lk
X-Received: by 2002:ac8:7d84:0:b0:4a4:30cf:c213 with SMTP id d75a77b69052e-4a83d1edd65mr44496741cf.48.1751384528624;
        Tue, 01 Jul 2025 08:42:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751384528; cv=none;
        d=google.com; s=arc-20240605;
        b=UHNbNzQ/Jm09kc61JumEthe7lhTyNjlMxEtj2tEKerD4Yp86xYMkZ2Z+4YKUAFX/RH
         agpm/1tpW4ubL4Xmj/1rtRuZMsOHZdVdjp2NmebeNLw1D4Ax27j6QTyh7rHQL7HJJhGJ
         PA2/IamDzNqBfMzEAJByeqdLRs3I9p79hTC0FzEI1EHzdp/MBCKgJVrqnRRDhSDmV37L
         wI57dv9C2imMYNmynAr+PCFJjc/DSkNdC9PfmEEsWTJOyrVU7b7k6zcJI0Fl8fKfgJ4B
         6nmySlizvLiJlxhcp3pjvqE2NWGl7TwgbQqR3JZZHfUFjdd+l+24hLKvQHCJUHl8Mky0
         vNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=knpxdZnqXLQC9XtqfBwzd0/gTVLSukHtyaVrMMe7/AE=;
        fh=AuLT32ChdzoQTPLrhUn6HHMuYvJ9gFPaJPP+sm2eFNE=;
        b=P4U4q1KKfMVMK8vs9+r+4r0ptdBUQK9byziXeAerIP4f33Ty3rUfHOT9+Vz7tK27qD
         g0HGfwGuZ2FXRlBdIF9K3mY/9mXWZAuwPa0o/bU3f6uZONezvRWezvIsUmq9BnSQqpVe
         NmBLl+AQ0Qdd4jtNKrHpLrLo9Dzvga/6pAh0LKSstHwdRYoSMbaM3CdJcOVKITBSMxBk
         7m2ki5bL91JIQWAEK6ssEYdJ8TPyVePNEVthQ2nzQUkZzc5xTljXQXQwAZJUGdfdIih1
         oqgQkuL3KEjnsCKvysZOcUjIh5FP/ykbpn/xAY2Zc6vgo/XKZqX+EkRu1GUSA8ur0qC4
         SHrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eKiaorNw;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc23fb1csi103046401cf.368.2025.07.01.08.42.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 08:42:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eKiaorNw;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751384528;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=knpxdZnqXLQC9XtqfBwzd0/gTVLSukHtyaVrMMe7/AE=;
	b=eKiaorNwMzfpUKP+h9RHEkwF/1IZPZ0qVF0gTsSHSsceHEyRKHwK0UfNGVlxXNzBWmcxwu
	dc4MpT08aJvRis9nzSvrsHSEVhzV/yjvY3hgRPWX+xDzDo/42GYBtN9QmJD3y6YF3RlHkA
	jb8UmKWWyqE6w9jikrypLJPRg3JMVI8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-xIsIksgCP3eT9tYc2-aJ5A-1; Tue, 01 Jul 2025 11:42:06 -0400
X-MC-Unique: xIsIksgCP3eT9tYc2-aJ5A-1
X-Mimecast-MFC-AGG-ID: xIsIksgCP3eT9tYc2-aJ5A_1751384526
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so28226635e9.2
        for <alex.bennee@linaro.org>; Tue, 01 Jul 2025 08:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384526; x=1751989326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knpxdZnqXLQC9XtqfBwzd0/gTVLSukHtyaVrMMe7/AE=;
        b=rx+k0Y5Fi+nO1xFpsRXgj3/e9vTqlZYIVMktlOux0hKr1C/J1UwrskU9RUldyOD44n
         jALQCxh2vWZf2FeiWHUb3tD+cD6g0c2P06C8Ek+8Xa4XPtQ46AL5VJRvwgfCw9rsS9UX
         jnXBTcPjW/eDZICiARpta5oHynqGZgL/47iIyLHvQQho4rcypvsXTPCRIcUIdXceVsEA
         IVX38BQVHr+CTXjz3ceEpxsS8DF7NL85D4idL+uuZc4ixLQ/Jfq+q+YBG6Qigv4lF5rW
         4VnuPUxKmMmiLEcXMTUQC0JcL7Pz7oB6Sq+EDBSRzMvNtRt/H8pbIhN+sBqTSugvrhaw
         xHCA==
X-Forwarded-Encrypted: i=1; AJvYcCXUIn9kbhyb60sqMv9870RK6RATLR/VH2vUXlU129rRlG0rN2cxYuR68RJ5HdQpTKUvzUFjmmm211FTNw==@linaro.org
X-Gm-Message-State: AOJu0YyNNYyEwFhXNoKgzrktkhG+UuukW7kMuwBAJc2iJhxB3gWUSrGi
	2EkZts7XyWSPIb3uwM81LVL1PcX1ODGSUi83yQme7F4zsiNWeV2eysJWmtifHE0lWw730+npEfn
	+JZ9TDrzuXg1MWV7ixOwr8BpB7xcZazNfzqGGe4jxnmNJO1UHn3bfVjVZ/Q==
X-Gm-Gg: ASbGncv1Xo1u0jDYwvhwV5nUFIeA196NkjInB0wqHUpoxjxoHe8PIzc/Nwdu02jCv/z
	c2Tjw42kK46mUD1oSyEEPteRrJ8fS+EJNpetv7Il2NqYrOgSrVS3IDEZ7ziKf4EARSylT5gke24
	f3qfAPlaAcDO5OQF3p+/2tuO+PQR2mooS+8NVtuP1ofrbwwpoRjFd/m3+N7RoyOLCIRDJ+R+AJe
	gr32yia+SFS8Sn4UnmzALLUpjbEMSQGQ3ik8BeCmBRU9J12nDXZJDQzA7i9hUkciVOyjNLXQbOB
	CRlDBcGeZD0lODZPTn+Yr1Bay+0tJcYDCPyrdtVM+nV4S7oPIILuvczsGKJZcD/G/8r0Jw==
X-Received: by 2002:a05:600c:828f:b0:450:d00d:588b with SMTP id 5b1f17b1804b1-45392bc88damr174331125e9.9.1751384525592;
        Tue, 01 Jul 2025 08:42:05 -0700 (PDT)
X-Received: by 2002:a05:600c:828f:b0:450:d00d:588b with SMTP id 5b1f17b1804b1-45392bc88damr174330815e9.9.1751384525163;
        Tue, 01 Jul 2025 08:42:05 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm173282975e9.13.2025.07.01.08.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 08:42:04 -0700 (PDT)
Message-ID: <29373347-2b7d-4cb8-9b0f-7b53d5633890@redhat.com>
Date: Tue, 1 Jul 2025 17:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH qemu v16 4/5] docs/cxl: Add an arm/virt example.
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Fan Ni <fan.ni@samsung.com>, Peter Maydell <peter.maydell@linaro.org>,
 mst@redhat.com, Zhijian Li <lizhijian@fujitsu.com>,
 Itaru Kitayama <itaru.kitayama@linux.dev>
Cc: linuxarm@huawei.com, linux-cxl@vger.kernel.org, qemu-arm@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250625161926.549812-1-Jonathan.Cameron@huawei.com>
 <20250625161926.549812-5-Jonathan.Cameron@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250625161926.549812-5-Jonathan.Cameron@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T4qZVV-4KVkhtF0GReDLnHJNkTaLkFUDVvU8MXN7iCw_1751384526
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: +mx3/9G1rQz4

Hi Jonathan,

On 6/25/25 6:19 PM, Jonathan Cameron via wrote:
> Only add one very simple example as all the i386/pc examples will work
> for arm/virt with a change to appropriate executable and appropriate
> standard launch line for arm/virt. Note that max cpu is used to
> ensure we have plenty of physical address space.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  docs/system/devices/cxl.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
> index e307caf3f8..73e80e672f 100644
> --- a/docs/system/devices/cxl.rst
> +++ b/docs/system/devices/cxl.rst
> @@ -384,6 +384,16 @@ An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
>    -device cxl-type3,bus=swport3,persistent-memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3,sn=0x4 \
>    -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k
>  
> +A simple arm/virt example::
> +
> +  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8g,slots=4 -cpu max -smp 4 \
> +  ...
> +  -object memory-backend-ram,id=vmem0,share=on,size=256M \
> +  -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
> +  -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
> +  -device cxl-type3,bus=root_port13,volatile-memdev=vmem0,id=cxl-vmem0 \
> +  -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G
Matches the x86 identifical example entitled "A very simple setup with
just one directly attached CXL Type 3 Volatile Memory device"
nit: in case you need to respin you can add something like "featuring a
CXL Type 3 Volatile Memory device"

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> +
>  Deprecations
>  ------------
>  
