Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3558786njb;
        Tue, 10 Dec 2024 11:04:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVoeKzAaqqq2PFHQ2UlQ3gb+XOjpEV0S+2ldrWrCbffuW1Nwz6vEU7NbWrHDjLCk09GtOQOQAh+1vPNJA==@linaro.org
X-Received: by 2002:a05:6000:1788:b0:386:4669:571b with SMTP id ffacd0b85a97d-3864ce96edcmr183357f8f.13.1733857485556;
        Tue, 10 Dec 2024 11:04:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733857485; cv=none;
        d=google.com; s=arc-20240605;
        b=JFfGk72ZHejXvhhFzumSlw0ie+vu2/mtmSnEcWhb9afb7vFNDiEaeH+Z9dEKGc7fYO
         WJNOwChyItoGjxzLqhtVeXAkTMXn2suQ/3FF1EirE7WR/Rl/vhYKlHUMwKhg4CnxrVrF
         KmAzlP/x8VNjJRu7tiVncVOnattLz6AFHbLBMYI1uBlhoswrclpDx9XZloj5adVSJipf
         qLeMuEAu0E0DBV75MLWJrQpcrYtISMNWpPLSrBsV0Zyqx2CUsQJfBpTUqAm4datzBzLL
         ns2TUgmoJuj8XA+yQmUUDvWC9+E3ncXxO4tEN3//Ig4xlNqPt49pCokEUwbmk5Gbu81P
         pffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ljUsKKJFIIMXBs+YOwyJLCz2Wm/jIXRled6ZTXR5qxs=;
        fh=NRu08EIFfY1g+at5sB3DHuc+5UF0dOV9EWxDguFfN+M=;
        b=SmCmt3ZSFX+8bxtP1q6AfIRJ8nXd7AT0YFBy9/fEmeL8f/qHOEJT61FzQiEyB80Gd7
         RHl0QziDCEuF8rkdg+HAdzwichKiQbGYGU7ykhmcJHB5yi9VducQmLDY2quvpNUCwJNn
         Fpls+ei3U+PX43m4PtSkV4badGxLlSwe0Q/sQk19XEXNE43E14hEZEGXz0YungNpBPtG
         gM/XHKPrjhqK2DHB/gToY3lAkLEbR2KuLF6yybohSVbx9d7CCLkd9DuWFiByRWG6h2ik
         8C/nphiHkQ64FVxZQfUyTN+1txhbVB/9RVmqoPY6dfhJ9FlCEUc3bK4A/t0mogQVIt5G
         0U8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rzdSsdg2;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38622c291e9sor3177629f8f.10.2024.12.10.11.04.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Dec 2024 11:04:45 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rzdSsdg2;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733857485; x=1734462285; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ljUsKKJFIIMXBs+YOwyJLCz2Wm/jIXRled6ZTXR5qxs=;
        b=rzdSsdg2uXhVVmahbAzm1iCMTObmNZmDjM2LiCuG7pCqdk9pJjOuFH1jJ76ZTSyZmH
         02q6xUgCyat5LUZ1/I8MG/63J3i4Qt0KLSAPUTjEl2gZtLnKLPivJ5RzDOnLRC/EhoGy
         JDrRhxwxjRT/7czhpEdmIeKDWl24GH5vqQlkXSdgMmRLjt20RxkPc0lzcfPOYeNjk0nr
         wqzSctICOB/rb3HKNv9NldWAy60pKXKJ8BpiqJ6DfMy0afn0cI77bHUeVBreJ2Bn89Gc
         TQIJv53HHShcd//qX+Awu3K6+cwg08l7BuPfoqMVADTrMKkI4SOOJ4A82P9nIfQitXCK
         6B2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733857485; x=1734462285;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljUsKKJFIIMXBs+YOwyJLCz2Wm/jIXRled6ZTXR5qxs=;
        b=jowcNDJksw7D9N3VxskRnRk9GpurZ/m/qydv2LkCCLYrnIhyH3pe5HsgObZgkZd1Ps
         T4l/659KBewDJIVM3rJtuLqv3XYPy043PpuwF4p9/8sU7UhjxvITCvNOIbTYpDZIk0ys
         qgTgDP26lqVYsGVGlbYfRbe0sYVuujVr38w6Dynh4l/o0gMG3agULbWKZTrWyFM5Syza
         8Umk8Ew3WxYrvq/5zYtPG4qI+4NC+1OTw4tSt6pztrr6nv9Ie36Bvbc7u3l4UXtkZH6i
         wj6+jC964qkGCSfRWs9IvB7qZQTLNJMi9isK0TvdycQTX0dO487H/8M8vnp3OfVAez1I
         ZiYA==
X-Forwarded-Encrypted: i=1; AJvYcCW1QZpIBfkevE+qNKISE3uouKDC4d8rBIfxJGMe9qLxd16I+ENyVpCbyQNfq0JcyOJpqchSAtg1NAz5UA==@linaro.org
X-Gm-Message-State: AOJu0YwRJYbzLkvu2fnkMHYTthMcNyotd6sqMVeNDiRWnPVNw+EbaXsb
	CMYpQvw0ipfrZ8DEDWs+wh/gJBecWXqrDdDy+351dQNqEd4jEZJm3DdCFQbZd5WkAcyVqmUqwls
	DcBU=
X-Gm-Gg: ASbGncu5oqJI2Dm+Ua9oUVDJTVY6Q7vdJfIFeXhZWaF8pnnt9SH6E2mRE5u/tjlWUGF
	ghYkO5WC3KpFEDc8p9TWDf+5EKp8x/cgUvl7E9we7Dtd0bmVnnXqAP9Q7jg7SVTPAq4igBT8zmi
	ll+azyr1LK7voUSgFHIynzNez3Z0BwKM7xXmTZJOm8X6VPP6z69CsHfAJQFMafI3tpIAw2gL5BC
	2Dscch9PtBiRibPOBOo5aSDhB2vIw3pakrFGoJVMBMGk2lQS4q5
X-Google-Smtp-Source: AGHT+IGI6AglQsZO+TZNGmYOQ3qBudwye4+b2aIDG0eKqoZWMHnPjxC9IUwZ8A/YEZrxYNAhDBklUw==
X-Received: by 2002:a05:6000:471e:b0:386:3213:5b9d with SMTP id ffacd0b85a97d-3864cec5c24mr196504f8f.41.1733857484908;
        Tue, 10 Dec 2024 11:04:44 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862eb06e00sm12872989f8f.99.2024.12.10.11.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:04:44 -0800 (PST)
Date: Tue, 10 Dec 2024 19:05:09 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.bennee@linaro.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v3 26/26] hw/arm/virt: Add measurement log for
 confidential boot
Message-ID: <20241210190509.GB1212502@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-28-jean-philippe@linaro.org>
 <edae9f1e-1f80-4f22-9340-c88f440a5523@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edae9f1e-1f80-4f22-9340-c88f440a5523@linaro.org>
X-TUID: 2f4PJRZaTUk7

On Thu, Dec 05, 2024 at 11:23:09PM +0100, Philippe Mathieu-Daudé wrote:
> On 25/11/24 20:56, Jean-Philippe Brucker wrote:
> > Create a measurement log describing operations performed by QEMU to
> > initialize the guest, and load it into guest memory above the DTB.
> > 
> > Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> > v2->v3: New
> > ---
> >   include/hw/arm/boot.h |  3 +++
> >   include/hw/arm/virt.h |  1 +
> >   hw/arm/boot.c         | 47 +++++++++++++++++++++++++++++++++++++++++++
> >   hw/arm/virt.c         | 23 +++++++++++++++++++++
> >   4 files changed, 74 insertions(+)
> > 
> > diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
> > index 5fcbaa2625..f2518c4e81 100644
> > --- a/include/hw/arm/boot.h
> > +++ b/include/hw/arm/boot.h
> > @@ -147,6 +147,9 @@ struct arm_boot_info {
> >        * Confidential guest boot loads everything into RAM so it can be measured.
> >        */
> >       bool confidential;
> > +    /* measurement log location in guest memory */
> > +    hwaddr log_start;
> 
> One expects a stop/end after "start", maybe 'log_paddr'?

Sure

Thanks,
Jean
