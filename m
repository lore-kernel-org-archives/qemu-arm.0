Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3527793njb;
        Tue, 9 Jul 2024 14:02:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+KO/IYQxocW1WXN82+zUM1/nVT0njRpSzgcgIw5Fx3j/lNzIQl+se8Lp802R50uEKIRHwIXg4G7m3dhOPxR6TuMaQETo9
X-Google-Smtp-Source: AGHT+IEZCawVkj2MuXLY5bXCks5vxbHMRHMavVhL/vDMGvuJvEJ4xlbXJFioVgRFXcvBDXGEDUSV
X-Received: by 2002:a05:620a:5a5b:b0:79d:5cd6:9f60 with SMTP id af79cd13be357-79f19bf8542mr353999285a.67.1720558926101;
        Tue, 09 Jul 2024 14:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720558926; cv=none;
        d=google.com; s=arc-20160816;
        b=P+3bObcpDFyrsQuhK9lTX1+1qZQs6nck1+fokBGxyhh5hvuml4Vl11o/UEx36+CQf4
         tC6yNd5Yed8IhePyy2CItTMYABxJXH+JYAX65djjitZTivHU9hVJS4/gZcCV2N5loK1C
         TG2BPQJm1BB+gM53hrVy6pT11hDDiIz5xftiTa7UfCGHdtuuLEAC22FHUNrhRndqyLyw
         /qBa/fsl5o0zFdFTo/hR5GDMn6E/tSOX+ZeSG2q6MyTaVaNNaZdC97Qn7neEQJWlXZbQ
         0FJB+Xr0Y+/oLGPp2YwXCftQdWUXEwMztt6ie+Cpk4p1JGJ2KPbkxM/cIswJM9c/Emfh
         ABCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=TsxXBMowcezJEDRjoUPV7HFIcgDlWTQTz4rGgv9pKho=;
        fh=OdG38iNvVAMh1JkPfnAV3uJWLj6ED6bQVIOuaRWoIJU=;
        b=QZs9AsTnbXwhBYCxJBj3qd9OZcOtJ7/hanzaRkJoXWgosaod5bRbWfd1j0rabF/iiH
         ArDMNf1AcLnsEWH2VzZ0CCBqp/4e++SLshllBsRsyQicVzifc+zmSNhLHXfKbu4MC/YE
         uaplcSvFE9XFAYpdQMq5IeQ+RyyjD75Vx3YZMpb7saClKjNJ78gcUCYbvMeuGEyz0oeN
         YA0nW2LMhw3CHeiR5QvatHdGkA5+0Bzsb/DjlwyTNCwVOthQe65CRPkaa1a9VfG7zAat
         2TKYoECVPVjAtWjoNg3C1/xnxSwQQ7D7z8ptk8zSUYVO04/01QUI83Khjja3cAgTfJlx
         mo2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CqjhBCwC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190d7ceesi289747685a.650.2024.07.09.14.02.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 14:02:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CqjhBCwC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRHyF-0002Vx-B4; Tue, 09 Jul 2024 17:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sRHyA-00028k-Pr
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 17:01:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1sRHy5-0006Cf-OR
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 17:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720558900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TsxXBMowcezJEDRjoUPV7HFIcgDlWTQTz4rGgv9pKho=;
 b=CqjhBCwCG+uega1m2XsLHmwf3CBwWmVOUkW2B+HVfTnDeb7gNv2+ui881CwGcd47wm4rj3
 OowjOBIuxX0hnA/uE1ldLMYawNhp99s4S2SfkmnJQyklNb2e+fKRVeuUJS5RYbFNro9Qdh
 Nx5ADEe+mLyN3GS2crVvsEiNelbVQ4A=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-0rvCwnxnMG-LygwZmIeh0A-1; Tue, 09 Jul 2024 17:01:37 -0400
X-MC-Unique: 0rvCwnxnMG-LygwZmIeh0A-1
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-5c696b8e759so61998eaf.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 14:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720558896; x=1721163696;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TsxXBMowcezJEDRjoUPV7HFIcgDlWTQTz4rGgv9pKho=;
 b=IVEOb8YuTgNHK/dBRq3Q4Q6wl2rLHne9HICEMB9b2ONtW46C1TK3+jvnfrtsZCgO1X
 O1y3g5ry25Evkw4Ei0D3OqcCt+2UJiLvZ2/W8AXE3m3XG8EFgcjZhYhAMUHsl39jfd8S
 czP1Gez0DJiX8j1lfn9IeoUaZO1TQ0baSUuzTeYDwHTGpdYtMc6qdvW7FjXyaF7X23dc
 j9BqOpv5zOISiCOQjONaJl+YVEBYt+SunuouA6IAIaz601s4HU36c4mMPj2CiqNGF0ps
 PWSSSNmyXgBHR6gTlqdCIN90OI04ZG4yY2dFlL9s/foCe4X9hfC2cg9SktWT1ztCludu
 AyfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmjR6A7f28lPqHWVbRrhaxrcbmIxXtUCnfy+l+Cwx/ndDjqI/LeEkUe1wK0eW9wf49ivQSmr7lXUjdqi7cplivsf3M
X-Gm-Message-State: AOJu0YzAwJ7fA/CMgdMukRqbi3Qmt5KTIa0tT6ruXpRiiB7b1WTkU75c
 gPJapkKFm/3j//3RGbx2hGXHa5f9zIhe4UG5nn7YIEy3P+jvHu+byIX7qmLXUdGtRy8tawJ7Dx7
 wdKLgoQJWNByb+2zBO0+V1o69fOQ5v2AsuWqF4vjnnAzTSJ2FjQ==
X-Received: by 2002:a05:6359:4ca1:b0:1ac:2b8b:a185 with SMTP id
 e5c5f4694b2df-1ac2b8ba310mr161877155d.2.1720558896625; 
 Tue, 09 Jul 2024 14:01:36 -0700 (PDT)
X-Received: by 2002:a05:6359:4ca1:b0:1ac:2b8b:a185 with SMTP id
 e5c5f4694b2df-1ac2b8ba310mr161874255d.2.1720558896104; 
 Tue, 09 Jul 2024 14:01:36 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f19012068sm133098185a.31.2024.07.09.14.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 14:01:35 -0700 (PDT)
Date: Tue, 9 Jul 2024 17:01:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, Bin Meng <bmeng.cn@gmail.com>,
 Hao Wu <wuhaotsh@google.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, devel@lists.libvirt.org,
 Luc Michel <luc.michel@amd.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>
Subject: Re: [PATCH v3 06/17] hw/sd/sdcard: Do not store vendor data on block
 drive (CMD56)
Message-ID: <Zo2lLLAwcZ8bBvO2@x1n>
References: <20240627162232.80428-1-philmd@linaro.org>
 <20240627162232.80428-7-philmd@linaro.org> <87cynmfggx.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <87cynmfggx.fsf@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oapUBhySxfIM

On Tue, Jul 09, 2024 at 05:38:54PM -0300, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
> > "General command" (GEN_CMD, CMD56) is described as:
> >
> >   GEN_CMD is the same as the single block read or write
> >   commands (CMD24 or CMD17). The difference is that [...]
> >   the data block is not a memory payload data but has a
> >   vendor specific format and meaning.
> >
> > Thus this block must not be stored overwriting data block
> > on underlying storage drive. Keep it in a dedicated
> > 'vendor_data[]' array.
> >
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > Tested-by: Cédric Le Goater <clg@redhat.com>
> > ---
> > RFC: Is it safe to reuse VMSTATE_UNUSED_V() (which happens
> > to be the same size)?
> 
> Hi, sorry it took some time to get to this, I had just left for vacation
> when you first posted.

And I totally overlooked there's the email.. until you replied.  Welcome
back.

> 
> I think it's ok:
> 
> {
>   "field": "unused",
>   "version_id": 1,
>   "field_exists": false,
>   "size": 512
> },
> 
> vs.
> 
> {
>   "field": "vendor_data",
>   "version_id": 0,
>   "field_exists": false,
>   "num": 512,
>   "size": 1
> },
> 
> The unused field was introduced in 2016 so there's no chance of
> migrating a QEMU that old to/from 9.1.

What happens if an old qemu 9.0 sends rubbish here to a new QEMU, while the
new QEMU would consider it meaningful data?

-- 
Peter Xu

