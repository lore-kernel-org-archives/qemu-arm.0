Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp1489981njl;
        Thu, 3 Oct 2024 07:51:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVU8eEfHqpmvFLrGAZQ0Pv7YjkI5QSMnwl6Fmy/RgSH4Ih4RoNYQsg5YFoEDSLpTSEdR9NRkki3ybxUKw==@linaro.org
X-Google-Smtp-Source: AGHT+IG2z8UWozQG+mN0AR/9wgG0KEjTRRh6qQfiqb8p2XPVNKrcb67s1xhtcmgCseK5WCMJgMEc
X-Received: by 2002:a05:6870:e2d5:b0:278:245d:cde7 with SMTP id 586e51a60fabf-28788da6c25mr4171781fac.36.1727967106345;
        Thu, 03 Oct 2024 07:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727967106; cv=none;
        d=google.com; s=arc-20240605;
        b=dkOz0dUhhhcSyVL+NUtVOyOlI3/9gMCUfCzJaAfogSUmvguRhLN4wU8iwrrsqeWxIV
         WxkZXBpK6vBhuaqfk/2AQgUzhSxhKrH97a8si6Dh6j4Eo6JojIZWOmDuGNEdyjzkMmC/
         Zh8RV/aMJLXNu2Vob+foNpvu2O3+bVP9BgLrf/LKb8GpEGFnqqXeVu/JkuwiD015uqY9
         NJASPo6HHO6Zq6rlmNSiC8qeJgqmuQQFihCjvI9fN5n4rmLiPMX48hSt+MuwD/ytIh3Q
         NWRtqhlrYj+5zLjzFb2KO/hqchARaS0Wx5Bo5bCeS7YsWaNo8L1pdQcRZUMK1DzbNKAn
         hyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=GFOC5ltxjnukHbOiTZnLdPhdjlEFGzr/Dkn5csRqcok=;
        fh=SI5/GAG2KTLIxqhgSbg4VMjQGbpi6/ra6mm3Kjtfyh8=;
        b=XhSQHiu0MC5EntS2zSEgNHJbosBGCKfsK8FuXlz/sWnsqsd0ubR4mg1GG8Z55tBPbO
         a1rICEOaHJkd/k5czSeUa4tb5Aag4JhWSKVQ2oq484srikFlRnmPXzLj7+Wz4nRZkjDD
         SLCVsLhePufqXGwqGqMgMfYfyDZu7SArm9Fkh4431PXLw58/h43Y4tCHYjeio668fkQd
         37BjMa9tpShiQDMjzm+Kq9hIO7ACKwqRL1Bt8Xe/V1RTaNMvkOEP/G6uI9mJIsqBP8in
         zUb7Jw58Ms0sJ+9sKwdmK8t3coYCMaanmenij65vGlJqln9aZNPOEj+YeF3pwvkBhg3t
         qV8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FDtK/xN8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae6b99666asi113206185a.359.2024.10.03.07.51.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2024 07:51:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FDtK/xN8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swNAz-0005uq-Pi; Thu, 03 Oct 2024 10:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1swNAw-0005uO-C7
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 10:51:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1swNAu-0003RU-AK
 for qemu-arm@nongnu.org; Thu, 03 Oct 2024 10:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727967087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GFOC5ltxjnukHbOiTZnLdPhdjlEFGzr/Dkn5csRqcok=;
 b=FDtK/xN88MSfVgz0opIvRwHSeukVAdOnKoQUuLfITDSLunS1Nan4IHTkAS3ZMjqUVdSh5t
 o62CRvNYaG2UQ9qxWLOhhHnO3GcZaelHkUnGmM5teocnk19Nc+t6jERYt+FWxoBhWA5n8v
 zwaNrCFWTu1ZKYrk2J+Ua5t0ffV1G4o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-DXv_7DjbOsuNG_gtakGtGQ-1; Thu, 03 Oct 2024 10:51:26 -0400
X-MC-Unique: DXv_7DjbOsuNG_gtakGtGQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42cb940cd67so8898145e9.0
 for <qemu-arm@nongnu.org>; Thu, 03 Oct 2024 07:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727967084; x=1728571884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFOC5ltxjnukHbOiTZnLdPhdjlEFGzr/Dkn5csRqcok=;
 b=JwriHTJombzcgebQ7zuNOI14Mt6KRMf5fC/FDMZ6CFLFoWi8AyrJDg6XZyJVutKwiq
 aciknjf7ynBlqGPoZrRyPqDa7b9wEh5BwByPQQzNnhl8YACL+grzuJSZ8EE09ZzcJtYu
 vq5wSoS8hFBKEfuqOgwRPSPsiVtJnWtPJpCFNjqDRueBDAVAjTg+VJ180h6S8dNTrFXE
 8sd50x8CM6mU2AKmMdsMFDGUw550vOeb7SoOovcPgT+rY1LZVGOSLlbjVskxlaX8Iol2
 +irNywJ9qBtyMS9Gsbt4IPcgpwEegTAVsGxCqDZ/kh8auOXqjVcoGdG0jEpxzGiXBgYN
 d6lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrYL9SjH/yw4/UWa7KfKmVdYcL+NdnCZThmBsOIBRvUG7PY1zaMvxJllvRF504fhHEsaylMaz1gQ==@nongnu.org
X-Gm-Message-State: AOJu0YylcX16cZE3nDeoodJpJURRgUGoZq6v8wDm5ONXZnBRTtGtL0p2
 EnvUzaMWvZ8mwi5E3tLaXfKSCXVgqshTs6mHVD8Rtis5uEOfaGKD1znrGCR6441v/mDsYl9IU0n
 BAzPwzDEiXpENPbEhVtfjKZI4Z3qj/J3UfYuvyQom5nPtaYcI7kfnjVybpw==
X-Received: by 2002:a05:600c:1c26:b0:42c:b77a:bd21 with SMTP id
 5b1f17b1804b1-42f777f00e0mr60514325e9.28.1727967083973; 
 Thu, 03 Oct 2024 07:51:23 -0700 (PDT)
X-Received: by 2002:a05:600c:1c26:b0:42c:b77a:bd21 with SMTP id
 5b1f17b1804b1-42f777f00e0mr60514045e9.28.1727967083570; 
 Thu, 03 Oct 2024 07:51:23 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f802a0216sm17413925e9.33.2024.10.03.07.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 07:51:23 -0700 (PDT)
Date: Thu, 3 Oct 2024 16:51:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 07/21] acpi/ghes: rework the logic to handle HEST
 source ID
Message-ID: <20241003165122.542dd026@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241001135759.474452d8@foz.lan>
References: <cover.1726293808.git.mchehab+huawei@kernel.org>
 <0dd7081717b23b4c1536bc86abfa926388cf2139.1726293808.git.mchehab+huawei@kernel.org>
 <20240917135934.38579213@imammedo.users.ipa.redhat.com>
 <20241001135759.474452d8@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.143,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: IERgui/gwphH

On Tue, 1 Oct 2024 13:57:59 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Tue, 17 Sep 2024 13:59:34 +0200
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Sat, 14 Sep 2024 08:13:28 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > The current logic is based on a lot of duct tape, with
> > > offsets calculated based on one define with the number of
> > > source IDs and an enum.
> > > 
> > > Rewrite the logic in a way that it would be more resilient
> > > of code changes, by moving the source ID count to an enum
> > > and make the offset calculus more explicit.
> > > 
> > > Such change was inspired on a patch from Jonathan Cameron
> > > splitting the logic to get the CPER address on a separate
> > > function, as this will be needed to support generic error
> > > injection.    
> > 
> > so this patch switches to using HEST to lookup error status block
> > by source id, though nothing in commit message mentions that.
> > Perhaps it's time to rewrite commit message to be more
> > specific/clear on what it's doing.  
> > 
> > now, I'd split this on several patches that should also take care of
> > wiring needed to preserve old lookup to keep migration with 9.1 machines
> > working:
[...]


> >  6. cleanup fwcfg based on x-has-hardware_errors_addr,
> >        i.e. for 'true':
> >           ask for write pointer to hardware_errors like it's done in current code
> >           and don't register hest_addr write pointer
> >        while for 'false'
> >           do opposite of above.  
> 
> This doesn't work. without the fw_cfg logic for both, QEMU/BIOS won't boot 
> and/or the hardware_errors won't work, causing ghes to do nothing.

we should look more into it,
only 1 of them hest_addr(9.2+) or hwerror_addr(9.1) is necessary
so if it breaks, it looks like a bug somewhere to me.

> 
[...]
> 
> 
> Thanks,
> Mauro
> 

