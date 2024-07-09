Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3121687njb;
        Tue, 9 Jul 2024 00:22:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+YPeAlyZUaj6r2+odDPN7WVFSwOfQWxEHkQApPYJgh0CwTSBOTifwczhunT5wY85Oux0vREwuHhL/PdjCqDJO5VdTGFj/
X-Received: by 2002:a05:600c:48a5:b0:426:59fe:ac27 with SMTP id 5b1f17b1804b1-426707f83d7mr13209625e9.26.1720509734574;
        Tue, 09 Jul 2024 00:22:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720509734; cv=none;
        d=google.com; s=arc-20160816;
        b=mX36sHdAiJCgC4vZtn8JbfIG+bXGCYilCKgQ9JmD7/pw3bVtgQyvMmogE0TRP96C7p
         C2CGkMRNV04JDkyTY7BHnU/h84seYTe87nj9tH1+8KuWU8MD0xJj6MOhzNa0Wg85Ow68
         t+Zrh4e2AzJPAImevTtp5/vTQahTmPc+7zwPnJptiurER1an8O49Ga1C9dhc3U0ultH4
         2TP+uygTgY+sJ5xNzVTdjuFnkXDmDfuLTVMkXzBgBQ6E6WgFLj37BtpcoRy1urwLSfMY
         d0oyWX9NerSdGcaBeqcqmFjPXSGDe3eRqdZa0+W4Wt4HBPVsT2sa7tEdzLRuKF670vyv
         eQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=HiOIKrydel/3/HIIHK7QbyCDjwoGhDbVXvljvVWuRkA=;
        fh=2PBhAfjfz73kaskIBSRdpMi1TCuIPmaBj4VF8aKmqyQ=;
        b=HKwVYH2oZ+wV+fe82qx+eytRc2m6CxaAIKWxpO1gv1/KDGzUvYGV0ge9lehHZxwr/n
         98d4du9hbFfbbIU1xGu1CK4uwkPi77pLShVtpitIBSiSPE3dWIR59UkuNVBFVBkZTDiP
         igodp3bSYbfeL3xLhANPiDv+ryNXOOXdcoknaoxWJyB3AILNvtL++OmOkrEbkijKn+0C
         zy4CajfuIaTJP4u8sJtZjIv2IN21Dx07wCiA/Mq35lsl8cksf3dJz9dZ6JBYgVCeD1BA
         4gZNut9c8jrH6EXPm59Q3WJStJ6Keu9BwDTRvmUkf8rqmL4xMJ9zEIyZnvILsE9rmv9p
         mM9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Da0CvfI/";
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4267263af15sor423615e9.8.2024.07.09.00.22.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2024 00:22:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Da0CvfI/";
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720509734; x=1721114534; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HiOIKrydel/3/HIIHK7QbyCDjwoGhDbVXvljvVWuRkA=;
        b=Da0CvfI/qnygwIA+CZ2hHlWNq21wDKGtiZTJEGuzki4iPlmZaLxBr7275fM4VBA2qW
         v2zWo1qi6gPd8PV6xqDoNSklQlonmD/rtVpXMZk92YexjPyLJ7B/nsFC+E8hgF7r0+j8
         3I9pqeCanXsqaT3f7t+9731lni8fuvzHf27V+cyO1iK3MlKrk131lHmZNJfJfwDXzmc0
         8bTX3a6EC6rn7M+kBWapKAlhKAfIr9BikVAChpjhg2Xp6wipaua+YV5IOWWUW0M1q5BI
         sElCNZXTCnvvQLiChLubwJO9QdEkT5l0iY1cB5wL/E9Rah75JNlEIp2XBZ4k6mLATs0a
         mbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720509734; x=1721114534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiOIKrydel/3/HIIHK7QbyCDjwoGhDbVXvljvVWuRkA=;
        b=pq1Pvv++tr/5SG0StpA4In/Z5/UvRssUlnL83CqCFo3RNxa6b6tTOtk2j31wlXctEe
         nK2HnOb14KtdASCrPAES84Sthylby3Lwe99uWY37A/88y3wbeqngRx16kr9P9bfGpEKZ
         JepAScwFrpQ5EipH7AH6WcY3S5MAahSxl/hgCNXBKee00mzg2JkHF7p/Lf3aUf1Xds5l
         Dm6zNMEjKq168rGOiYxE7qYWplb/aPjzJji5Vch9q0SKTY//KgYBEdBoSBtbtyO8LUAJ
         Sr1dXgbeZLUuv3rJ8CT3CoGz1AGuStbNcgMTswoHmtpe8/fFgBT5kV4KdiDP5/H07V8f
         cbWg==
X-Forwarded-Encrypted: i=1; AJvYcCUhEb8yv/6VXvIx5pFbtCI4VCGTfxMO+UyYB+ZJIAnmkXmGuqMjpCuVF5tKTocBxSjPXW+4XV0wuyjIsRyuXv37S08XtyG9
X-Gm-Message-State: AOJu0YzTyhCANvgQmsJvtOD33+P4gndHzsnjONI/6VH0DxJZwJuiygwc
	l5DiAJKi+YSVM9pTJFEr1NdCL7MA82664RPcsErCTicw2RkhoKHlTV/XlUW8Pg==
X-Google-Smtp-Source: AGHT+IFigFM4qLBDIL/jnti/JdOMcdBFg7vSicH1cKrWsJTkP2El7x4n7FDpiyQDqhBlW6r3Ey/Ibg==
X-Received: by 2002:a05:600c:1d1f:b0:41a:444b:e1d9 with SMTP id 5b1f17b1804b1-42671c0a692mr1305655e9.4.1720509733760;
        Tue, 09 Jul 2024 00:22:13 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (205.215.190.35.bc.googleusercontent.com. [35.190.215.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891d9sm1688249f8f.65.2024.07.09.00.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 00:22:13 -0700 (PDT)
Date: Tue, 9 Jul 2024 07:22:09 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
	peter.maydell@linaro.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, maz@kernel.org, nicolinc@nvidia.com,
	julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 18/19] hw/arm/smmuv3: Advertise S2FWB
Message-ID: <ZozlISfFI48-rrYY@google.com>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-19-smostafa@google.com>
 <20240704183658.GO1693268@myrica>
 <f2a17216-1a03-4c84-85af-8c3145f305ae@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2a17216-1a03-4c84-85af-8c3145f305ae@redhat.com>
X-TUID: OwlgqN6wnkoQ

Hi Eric,

On Mon, Jul 08, 2024 at 07:09:02PM +0200, Eric Auger wrote:
> Hi Mostafa,
> 
> On 7/4/24 20:36, Jean-Philippe Brucker wrote:
> > On Mon, Jul 01, 2024 at 11:02:40AM +0000, Mostafa Saleh wrote:
> >> QEMU doesn's support memory attributes, so FWB is NOP, this
> >> might change in the future if memory attributre would be supported.
> attributes here and below as reported along with v3
> >>
> >> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> >> ---
> >>  hw/arm/smmuv3.c | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> >> index 807f26f2da..88378e83dd 100644
> >> --- a/hw/arm/smmuv3.c
> >> +++ b/hw/arm/smmuv3.c
> >> @@ -287,6 +287,14 @@ static void smmuv3_init_regs(SMMUv3State *s)
> >>      if (FIELD_EX32(s->idr[0], IDR0, S2P)) {
> >>          /* XNX is a stage-2-specific feature */
> >>          s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
> >> +        if (FIELD_EX32(s->idr[0], IDR0, S1P)) {
> > Why is this check needed?
> >
> >> +            /*
> >> +             * QEMU doesn's support memory attributes, so FWB is NOP, this
> > doesn't
> I have just seen your reply on my v3 comments. I still do not understand
> why we expose this bit at this stage.

As I replied to Jean, I will drop this patch for now, we can always add it later,
as it doens't add much value.

Thanks,
Mostafa

> 
> Thanks
> 
> Eric
> >
> > Thanks,
> > Jean
> >
> >> +             * might change in the future if memory attributre would be
> >> +             * supported.
> >> +             */
> >> +           s->idr[3] = FIELD_DP32(s->idr[3], IDR3, FWB, 1);
> >> +        }
> >>      }
> >>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
> >>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
> >> -- 
> >> 2.45.2.803.g4e1b14247a-goog
> >>
> 
