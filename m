Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2177156nji;
        Mon, 15 Jul 2024 04:13:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUt1k78HWfyfhgsDQxLxnSx3XBiTdFCzbnNdbOPcR6cdX8vwNT3zf6dPk1wSe8vvFWhVmEbvEcoVSrZ9gn+KwJW/soo2ERs
X-Google-Smtp-Source: AGHT+IGxhPVTC2vco9zUfGZ9lVsqg7ZGKbVCOc8tn/x1NCYha1mPVCEosLkwUKRJL+qzyhMZyaa6
X-Received: by 2002:a05:6214:1245:b0:6b5:655b:99be with SMTP id 6a1803df08f44-6b61c1c5b9fmr222843056d6.43.1721041998314;
        Mon, 15 Jul 2024 04:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721041998; cv=none;
        d=google.com; s=arc-20160816;
        b=y7SA3bOoUIKcYuyurGA3BHTVPz26eMiNFwtkYx9Asy1I5c0kouzIOWXokcd0kKpL8T
         Ui1YfWNHKZWPlQ+2qLNcJ72tx3bE+CStVBKGE6BspXiCmkTbRYCAFSWwt4GjrXZqLetG
         fuTrQemCKrpPMSxA86p/W8Pb7VaX++fUiVui4Dfzx6GiuFIXhsREmzXE2DOqR6wdyhGi
         nyPrZp7M7C7PNt0ZYwiF4xo3rteHvkArPvjV/kkZJ0c02pme4/vtFCVnq2sZIFERuqSA
         3vxvSOu9idTcv/B7fSJN3DYN+meHAi6FspXvOr3fe7Ow/fRTXSsGZMvF9IU3shWyQhEv
         WXdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=VdC3poWepDQ+k/rcKiFhNKt7cgjIrB/WBi7CvX15gr0=;
        fh=lQgnUyVWa8IYuB7Wb71xAPiJ8yCA7793lIJ3g+GlLvo=;
        b=SvcBB29PlPLZ+uKauWjj/SKt+8vBUY1RXJuxZ71iOpBYsJ9a3d5l0VAg28VGVtff38
         X0RkSnDvrTYtmBdRaytzUkHCmgnhmIanyIDUp3sZgXMbexA6ncqyGL3WlcttYcoMVRf4
         kKWGJplZ10Wd5iOk6l+AVwyn7FwqhAYTlxThFb2L/XDPIWPzGcYS3vxMZXu2P6P60NLB
         nILENLQ6T+GAAnZN24tWoMLRNrCcN3dr/fElWgPSYF4+ObN/bSuA+14xIzXxcIEwpa7K
         5vSluIqJz9zN/RV/BS1onMAepuThdesndcfq5rSW5QpHPCuYmvil2kxE6/UYJcObV1W/
         vViA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I8LcwiCY;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a7e6f9si48850766d6.587.2024.07.15.04.13.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 04:13:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I8LcwiCY;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721041998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VdC3poWepDQ+k/rcKiFhNKt7cgjIrB/WBi7CvX15gr0=;
	b=I8LcwiCYBRD3xnEBriZL5TuGLeptCxI8/yVMUx1ai9ScL7kkIef8Brk5nt66V7cG+Dpoev
	xgdUfKmp9bWyirPEjJlIviumsX+S8rRB6N5DhmQInr4+ZzzF8yLv8iznvzXo3G5pTIrFbr
	OIXGg6YANShn0aXok4axLB2Wlekv3D0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-233JYOG4PQGL2akI3g6k1Q-1; Mon, 15 Jul 2024 07:13:16 -0400
X-MC-Unique: 233JYOG4PQGL2akI3g6k1Q-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-426683d9c4bso26857695e9.3
        for <alex.bennee@linaro.org>; Mon, 15 Jul 2024 04:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721041995; x=1721646795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdC3poWepDQ+k/rcKiFhNKt7cgjIrB/WBi7CvX15gr0=;
        b=kye04WmtNyxZQax5BT9k3wnAFJ4Fy8bT/NNJOwlDh62uCG0Ya1robDjWsIrERoYH5/
         fpfJAGNrTmh0PrCpYxUaZ2dBat0C14dzGSXcB60zMzq8PaVJs9+eiiD/MHrrUYFQntBL
         yxQ4d3hAe5h6ImaRWUqy42i0biUrYGeEb+aL7UzgWLcwR48F0YJL3WcnWFQAlyJlaPI1
         5m6YdNXHJGsXHZhuirSQjvHfeRIUixC0xsZCHIyJgZe0u3lwbPskjNbqSbgPlfKMcxlM
         lIx1gyZkP4KAGLKUcjWnuhY6//q7hdHr3RAlkpobEc17bfV2c/0hABmXA4VIhk6IcLX5
         i9Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW+ZwpFNh0HBkBBfyMzPqfwRZY+NTwdVFdrBCzXPwmrXz5+Y8Nzov6ql3iXdVDFfAF4jMJuHCqO2DLeB5vrI/1uLsO6DZe0
X-Gm-Message-State: AOJu0Yz5yXOg4RkGe8T+CtykeZJXQlFQkJ0U6r0WoBlw9B8GXNriwG71
	tawVVPTe+9DkFYgNTOweXR1t5SQQLZ/xfbS4czK+2fRFs/gR9BfCcyKyosqnMrcHvhfTJAtwhaw
	aT7trX8kXtAQVZkE1y/IzA9THQb+WsB5/6/vQOdX08ipEMIwLqfHjcGpiCQAUOA==
X-Received: by 2002:a05:600c:3042:b0:426:6eb9:2643 with SMTP id 5b1f17b1804b1-426707d890amr116656025e9.11.1721041995199;
        Mon, 15 Jul 2024 04:13:15 -0700 (PDT)
X-Received: by 2002:a05:600c:3042:b0:426:6eb9:2643 with SMTP id 5b1f17b1804b1-426707d890amr116655735e9.11.1721041994656;
        Mon, 15 Jul 2024 04:13:14 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a02:14f:1ec:fefc:5135:163e:495:83c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf195sm6057344f8f.42.2024.07.15.04.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 04:13:14 -0700 (PDT)
Date: Mon, 15 Jul 2024 07:13:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
	jean-philippe@linaro.org, jonathan.cameron@huawei.com,
	lpieralisi@kernel.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, imammedo@redhat.com,
	andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
	eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
	will@kernel.org, gshan@redhat.com, rafael@kernel.org,
	alex.bennee@linaro.org, linux@armlinux.org.uk,
	darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
	vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
	miguel.luis@oracle.com, salil.mehta@opnsrc.net,
	zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
	wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
	lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
	linuxarm@huawei.com
Subject: Re: [PATCH V15 0/7] Add architecture agnostic code to support vCPU
 Hotplug
Message-ID: <20240715071232-mutt-send-email-mst@kernel.org>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20240713182516.1457-1-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-TUID: DhiAgc1GPx+3

On Sat, Jul 13, 2024 at 07:25:09PM +0100, Salil Mehta wrote:
> [Note: References are present at the last after the revision history]

Igor any comments before I merge this?

-- 
MST
