Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2229088ejb;
        Tue, 30 May 2023 07:47:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4fOkOYNn+SBzneA6DGmLPjaBcwwpxnt+U9pYwnnLLBHqIeTA2Im8EHoo/DPqzvg9L/5bKK
X-Received: by 2002:a05:620a:2e2:b0:75b:23a1:8319 with SMTP id a2-20020a05620a02e200b0075b23a18319mr2275054qko.20.1685458028790;
        Tue, 30 May 2023 07:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685458028; cv=none;
        d=google.com; s=arc-20160816;
        b=aIVnHAk6jxiniMATKvWTMxDVsx2He7joIXJLTcdPtZqieukOWj34/jh/Q888eUrgeH
         PXiWJfOwCzvVVqx0P8QnFzAjbf0MZHjZLaWDfBTGLglFOn/cmW9cmoLwUEY7VuXwkdG/
         uBD8v6wcVdYCa9OrZNn1LTCUeyqrENiBTJLI6ifk/1Ug1hmNVb2TYuF8jMG5grnxb/D9
         YcLna5STZY9fmRIX+k3fd75RlvqwC3YBp42y8tprppW3yfKk2KYXMvewUzW2HzfegqiY
         j6pIVBk/9LBdJCB1dXZpDNY/kDNXBEPbkUAvsbg9td34eIZHF4Gfk0HO4hQjEkuGNzS+
         K37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=O1HxeF5m3sFufMGO0E7IjEwfIpmMk+aQrABXPvWZqeg=;
        b=AJdGK9gtbZkYqbPwUEq2OwsFh5qhnSidipxZk7GLr1Rjboso/Mi2N0BqGwhQg8XZtw
         PFdak1PIRfKPirH868gOpZSbYhdhYI7mNVdZZdmTdNnKCKobcB68CYvwkrVGknBScdAp
         a4SgY7sH4Msf+4ef2fxKqvs3gwBqZOhuhGsKEJPN+EfZr7C+vsJMqLGYaMknyedZnVwc
         SeF+syaB/wbq637V0JSlm/oiAWrxR4lHl3LWb2iUxFrG6z292crkhzpNQyOLGq6B6xtF
         fqJ5dtJ8j74JGipLVFu2YTimLV+pxK6Sp0DXXPTCS+hiB15iaKKBvqG4PA2AT1O9FiFe
         u5Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MwVmGI2N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2-20020a05620a128200b0075b08d7b0c7si6411763qki.187.2023.05.30.07.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 07:47:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MwVmGI2N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q40cW-0006tc-OZ; Tue, 30 May 2023 10:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1q40c9-0006le-Re
 for qemu-devel@nongnu.org; Tue, 30 May 2023 10:46:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1q40c6-00077H-VK
 for qemu-devel@nongnu.org; Tue, 30 May 2023 10:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685457978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=O1HxeF5m3sFufMGO0E7IjEwfIpmMk+aQrABXPvWZqeg=;
 b=MwVmGI2NzKYVlpcIwQ6YfcWAa8fy9dCrFI0CqIYQqoIEXISgcp0fGh7IvBXzMOt4WuYnGI
 nG5W1K6pEvF5E8jOm6YQK6OfEr7xSmIorfSBRIifGN7TsOdcXKUsk8ELUjTWtWFjctXgc6
 4RrIPxGDT2Sn2J77/GoID57ApEIAl78=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-Gb7TNTmDPUGFVONUsbexMw-1; Tue, 30 May 2023 10:46:17 -0400
X-MC-Unique: Gb7TNTmDPUGFVONUsbexMw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f60f085cd2so17498055e9.0
 for <qemu-devel@nongnu.org>; Tue, 30 May 2023 07:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685457972; x=1688049972;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O1HxeF5m3sFufMGO0E7IjEwfIpmMk+aQrABXPvWZqeg=;
 b=gYaZszPvJZAB19POak8Fh+eMuMuZ6movcBP45kaLtnA1GizHTXUXhmoT5PZ62ffmfV
 p1z5bVj0ELxXBnm7l96HASzBn+4z44L1qyQY/tBzT1Z8Yz3pg03ViSx8LsPBvkmQoglF
 eIt3/i4fl/FCjZZAqbOmfgwKZOczow3AdzrmYtXtAUc9TGDhoKv/r7A/+9SzOKVz0yCZ
 dtXP1WdVMbtACBV5eYA0j6pKJ7ui22Uxe5SNKobbAhIu9M+UCRqDE9s1irrAVua8HFk5
 uHGn30bm/nryNhSA7zO0+Abt5m7RCNrgK7zy4ilNtEcyszMtwHZDvC0m52p2JBMpYGiy
 NIqA==
X-Gm-Message-State: AC+VfDwReFWNHodDeFxSPU7ceMRWMlCt8GxuWbYO4xzwYAOFZawn3e35
 qaMDtLy1mV9Ht+lY/uuKM9/skc92GmFe6VA2XmCvS0vrmsejeqf7GkKQ1jAlnnZVmPsDL+193wJ
 aZyzDE4K+pW7iW1c=
X-Received: by 2002:a7b:c048:0:b0:3f6:2a6:e2c with SMTP id
 u8-20020a7bc048000000b003f602a60e2cmr2077405wmc.9.1685457972288; 
 Tue, 30 May 2023 07:46:12 -0700 (PDT)
X-Received: by 2002:a7b:c048:0:b0:3f6:2a6:e2c with SMTP id
 u8-20020a7bc048000000b003f602a60e2cmr2077385wmc.9.1685457972011; 
 Tue, 30 May 2023 07:46:12 -0700 (PDT)
Received: from redhat.com ([2.52.11.69]) by smtp.gmail.com with ESMTPSA id
 k10-20020a7bc40a000000b003f606869603sm21221562wmi.6.2023.05.30.07.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 07:46:11 -0700 (PDT)
Date: Tue, 30 May 2023 10:46:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: Re: [PATCH 08/10] hw/i386/pc: Remove PC_MACHINE_DEVMEM_REGION_SIZE
Message-ID: <20230530104504-mutt-send-email-mst@kernel.org>
References: <20230530113838.257755-1-david@redhat.com>
 <20230530113838.257755-9-david@redhat.com>
 <20230530090655-mutt-send-email-mst@kernel.org>
 <9d395d6f-4da9-45c6-bf20-ed33f1c4bca5@redhat.com>
 <f73dfa5c-4efe-a1ad-3ed1-a2c8e783bc27@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f73dfa5c-4efe-a1ad-3ed1-a2c8e783bc27@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4aRgcCSgMpVG

On Tue, May 30, 2023 at 03:41:58PM +0200, David Hildenbrand wrote:
> On 30.05.23 15:11, David Hildenbrand wrote:
> > On 30.05.23 15:07, Michael S. Tsirkin wrote:
> > > On Tue, May 30, 2023 at 01:38:36PM +0200, David Hildenbrand wrote:
> > > > There are no remaining users in the tree, so let's remove it.
> > > > 
> > > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > > Cc: Richard Henderson <richard.henderson@linaro.org>
> > > > Cc: Eduardo Habkost <eduardo@habkost.net>
> > > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > > Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > 
> > > 
> > > This (with previous patches) means any user changing
> > > device-memory-region-size machine property is now broken, right?
> > 
> > We only had a getter, no setter (for good reason).
> > 
> > > How do we know there are no users?
> > 
> > We don't. A quick google search makes "device-memory-region-size" and
> > "qom-get" only pop up in BUG fixes for something that appears to be QEMU
> > developer driven.
> > 
> > I don't consider it any useful, but if we want to be careful, sure we
> > can leave it around.
> 
> Looking further, libvirt doesn't use it (and never used it).
> 
> I already renamed it in 2018 without anybody complaining:
> 
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg532101.html
> 
> So I'm quite confident that nobody will really miss this property.
> 
> -- 
> Thanks,
> 
> David / dhildenb

OK. In the future we need to be careful and use "x-" prefix for what
we don't want to expose.

-- 
MST

