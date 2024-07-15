Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2187369nji;
        Mon, 15 Jul 2024 04:33:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwjqtvF1YJh/NnnYx3Gc12+KVdfcjfWlhj090pUrrMVofiYgj/pGpjc0Lid3ui11D1aFgda/8Mw8mpVOfphsDmHD1E+AGa
X-Google-Smtp-Source: AGHT+IHw8qNcP4kgZcnAfBY2MjwviwjMhVXQKz+G1pduuBVnxK9l33+twLmEzvukl0psWXYTrRLr
X-Received: by 2002:ae9:f701:0:b0:79e:ff64:39c4 with SMTP id af79cd13be357-79f19a53624mr1903239885a.6.1721043213596;
        Mon, 15 Jul 2024 04:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721043213; cv=none;
        d=google.com; s=arc-20160816;
        b=miJh5R57Wsv5SZm/8PTYxkVLDFhjCXuDur/d50ZGfDg2Bu0+oYmd6dDyLlATyarNyd
         xLSW0j0KTKvqn8wISPcq7+FpkhEZQnS99p1styejpdt22z1u7Q9ZkkKUXKaGQBBTs4O9
         nIJOMRxAI2kR6d/Aw0bJQ+syvxJ/dt/mJz9O4EEi1LRNHeM4YHb1Lss/MNj3+BzJeeRK
         i3/jR4QsnTDsyiR9P+cBEwHAQ/TDybnIpOasI8wG31YqE4LQycNXeRUz0xpjsD/+DoWG
         C2hSs/cr6CaTY4g9Prpz617wdqCLIGBeliHQjGPR21t+2i3Fuu8zhA8YfEM4QOWLLA/W
         0dQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=npDbXbhJ85FSXMLm85o+LYd1iikheLpPs3dveHdC+fg=;
        fh=i6Ae+TYZt3Vow5G+slUtm2XJyXCluLRuyqPBnECKQhQ=;
        b=0me62lL5X5uBpdd8FTq0t4gS7AvDwUV12pyL8k2XRAOTziQ+Dts+yEQqGQfjuIiGBJ
         Ks/BZli9PJKfKiRXhzmmv9mPfixSdciNsxJgoUoT5Q+yuT9osKpAsU0GaXYys9P2+0T5
         2axS6IOISD0Ztz3y7Os47uc50yDsTqHUXzkIzxEebuEtI3IKrrBHN7AUvg2W8aJxiwbE
         uzRC161b2i6rvEW0He4wmOL6gk8Q+gbNkoeLDk/7SM1zSI2iESqxJjrquJWb2i2DE3vh
         lg9ozBMytFJ1wigGdMDwpe456LqX4SheZYyOoJ0nf0UTZ87at4EjlGLmR54LNFgFrYfy
         BYAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ckr1UBEj;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c8f098si488333385a.734.2024.07.15.04.33.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 04:33:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ckr1UBEj;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721043213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=npDbXbhJ85FSXMLm85o+LYd1iikheLpPs3dveHdC+fg=;
	b=Ckr1UBEjy0V91xZJYsR56MYa06e9HahMyg1ormA1FcRbyK1r5yXGfSYfzeDjp780mZ06Fd
	Q9aNTiV1iY7SJCzHELz736bjI+g9oSB4SNw66aw/S9qOH6B3CLJo/ZZtK1S6bmaE1lRAfz
	xE6tgjxwAaPLmILH3hJuI06CvZB9dto=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-MSWzWbkwM8yvI4QdMAKpXQ-1; Mon, 15 Jul 2024 07:33:29 -0400
X-MC-Unique: MSWzWbkwM8yvI4QdMAKpXQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52e98c1a9d2so4558090e87.3
        for <alex.bennee@linaro.org>; Mon, 15 Jul 2024 04:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721043208; x=1721648008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npDbXbhJ85FSXMLm85o+LYd1iikheLpPs3dveHdC+fg=;
        b=PylK1s1Lh5kThOGmQVP/JIeR06Gd45TPNwyjaqj8tie21d/RouRpYa7DmsWpCNdKjK
         19GSq8Q++JzADzhVSyxPQz/mz0t7Zq7B3T0m3WUj0rGILh8fzOAPlzKSbIr1HicKhf1u
         a5fcB+fEf7F0Oa8+PpvOcJsLA95dejCEJSb0mUapaDVCCoe3eSEi+ei3Ba3f91jCqvYe
         q1QRYnEgdlsHYkWtRxFBzV5mycja1njc0ykOysXuS8CWWtZNgDTU3wjWPjvoTpKdpu2j
         8DAdfREBr3KT3AxJVRcAwkZhxad1AkXOUuTS+zlRG00GN45SdqEUfz/MERisK22h/fOk
         RIuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsPogZ5L+80FDh/Fz1l9Ij9SA91302iUUhdymjizY6Cx9f82WOrn99gns1mymKE3PDQvaqqDnEYrfaKwXiEy/3EwAYfuyj
X-Gm-Message-State: AOJu0YzMqt9ANQm22LMvCJNDrrCMvbPgfVKH1FpOnROtKJPSy93HrMkU
	9IJiYXIdZCMqOzK0zpmnRfcR8h3lWCaUfXHTcsoiaKy683yVxhaP73H8kiyXHEbUG8ToEXpkDNd
	5AhfG7G4tOOltgjOMOV/W99BZZj6+/VB/+HNW1E+C0VadYw1eG+5TsA==
X-Received: by 2002:a05:6512:3a84:b0:52e:93da:f921 with SMTP id 2adb3069b0e04-52eb9997854mr15232581e87.19.1721043207986;
        Mon, 15 Jul 2024 04:33:27 -0700 (PDT)
X-Received: by 2002:a05:6512:3a84:b0:52e:93da:f921 with SMTP id 2adb3069b0e04-52eb9997854mr15232554e87.19.1721043207312;
        Mon, 15 Jul 2024 04:33:27 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a02:14f:1ec:fefc:5135:163e:495:83c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm6147611f8f.24.2024.07.15.04.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 04:33:26 -0700 (PDT)
Date: Mon, 15 Jul 2024 07:33:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>,
	"david@redhat.com" <david@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"will@kernel.org" <will@kernel.org>,
	"gshan@redhat.com" <gshan@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
	"miguel.luis@oracle.com" <miguel.luis@oracle.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>,
	"wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>,
	"maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	"npiggin@gmail.com" <npiggin@gmail.com>,
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
	Linuxarm <linuxarm@huawei.com>
Subject: Re: [PATCH V15 0/7] Add architecture agnostic code to support vCPU
 Hotplug
Message-ID: <20240715073301-mutt-send-email-mst@kernel.org>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
 <20240715071232-mutt-send-email-mst@kernel.org>
 <a43a5a1636c84896be5930570c538031@huawei.com>
MIME-Version: 1.0
In-Reply-To: <a43a5a1636c84896be5930570c538031@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: QX96LIwvXZJH

On Mon, Jul 15, 2024 at 11:27:57AM +0000, Salil Mehta wrote:
> Hi Michael,
> 
> >  From: Michael S. Tsirkin <mst@redhat.com>
> >  Sent: Monday, July 15, 2024 12:13 PM
> >  To: Salil Mehta <salil.mehta@huawei.com>
> >  
> >  On Sat, Jul 13, 2024 at 07:25:09PM +0100, Salil Mehta wrote:
> >  > [Note: References are present at the last after the revision history]
> >  
> >  Igor any comments before I merge this?
> 
> Hi Michael,
> 
> Assuming there are no last-minute surprises and If you decide to merge this
> series, could I kindly request that you collect all the Tags (XXX-Bys) including
> the Igor's pending Reviewed/Acked-By Tag for the entire series, so that I won't
> have to churn out another version (V16)?
> 
> Many thanks!
> 
> Best regards
> Salil


Yes, there's no need to resend just to add acks, I collect them
automatically.

> 
> >  
> >  --
> >  MST
> >  
