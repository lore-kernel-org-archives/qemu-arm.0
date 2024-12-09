Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2572333njb;
        Mon, 9 Dec 2024 05:22:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtk+3wnEghQgSY19kkR+BG0ovU4rGJrXm8U/FfXCh+7+0rDctB/9omDXMlllLUHChLJirAqPk0q+SLGg==@linaro.org
X-Google-Smtp-Source: AGHT+IG+cm4OW14d0RVTN5WyhXkvJF1ovvSMD7CxEYDfr2oW81IvBn8sLc/Z7Gwj1HyzRNIy/uU1
X-Received: by 2002:a05:6214:411c:b0:6d8:812e:1fd0 with SMTP id 6a1803df08f44-6d91e3741d9mr7149936d6.15.1733750522705;
        Mon, 09 Dec 2024 05:22:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733750522; cv=none;
        d=google.com; s=arc-20240605;
        b=SH2RDxGljidMbrvQ8U/HOBLbWNJcbhogLULgFpq3ed3rTZFJhd42Jv1j5Doj/ZNS2q
         DNAuLvcXwyppwT6pepi3sWIKmsvTfU5+SYTl44sIaJMlh+9V/XZT0DZR3JBlWqb/sjXI
         glilurXhNXDUB0SMtPCmZlh5v5bHOGr+nSAlJztuVjqnlysXnH+Ti1Mu7q7knb9MhTcm
         ZHzlnMDdGdwt/zUCyOGsbMb0+Z6K5+/vm8PuoNaz37T9U9hrlpP58vk0RZpfEhdaZYNw
         T48ZDmKbluQ9NTg7szYIy6v0FT1y4NyfcE1qleGckrESlQjCt0WIP5S/+Pero0r7NQJj
         8MBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=jrC64vfuasWzI50Ac1WvO0UeovJ22x37jEt9PiFRSDo=;
        fh=g42o9MvnTbaFPvTWf+jOl2y2NUeuqCvu8t4VV9RiNpo=;
        b=ExFBUGTaCaXxFl4xNoBAzq/FIWQbxJpB8j68ea/LWuefj5Z05/CxBGzL/GoHK7sUsM
         9muhPEICMG2uddbGfRSz+cFbqepbL6E8S/eVBl85hzOvcEPljV0a7kU1EKnMp9tNefH7
         arxxeyJ/byXaCrVSAqCguJTugLzsokZX5Ee1aWKHtkueAxbuH/ff2aNECBxaLIwEfHPF
         tIkOwuaz8r4OvI+YXsvY3qqdtpOVnd7ImFgfOKRO/QVdOWC7sFn/1qwr9xL5M3DvimWH
         qTuMfMWA0bUekInWhlJV5HndrqWkGpHSHOpFADQJqYVWRUkxnm6a56T6+RP9fGus1BIF
         qcJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iAEHN88D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8f977a38csi61328916d6.434.2024.12.09.05.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 05:22:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iAEHN88D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKdhr-0003b3-3K; Mon, 09 Dec 2024 08:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tKdhg-0003Zt-EV
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 08:21:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tKdhe-0005Nd-0T
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 08:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733750490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrC64vfuasWzI50Ac1WvO0UeovJ22x37jEt9PiFRSDo=;
 b=iAEHN88DuCkvPfrld3fJ7dOQGz6lHfc3ejbPyXEfvch/1TnL0e7ChXeaG1HGPXRJtKNwYd
 4FGrAxXAznBkg4vQvD2KvWDDmD4G05oFqu0v+c5GrKFJo3BMQvl7WFcd7Q+pKwC8Q1dCiv
 GbGpShjCA6Nssy1U/rWsi8RPwa+UWrc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-7Rtak3rENC2vzqSNQKlWtQ-1; Mon, 09 Dec 2024 08:21:29 -0500
X-MC-Unique: 7Rtak3rENC2vzqSNQKlWtQ-1
X-Mimecast-MFC-AGG-ID: 7Rtak3rENC2vzqSNQKlWtQ
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385e2579507so2644657f8f.1
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2024 05:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733750488; x=1734355288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jrC64vfuasWzI50Ac1WvO0UeovJ22x37jEt9PiFRSDo=;
 b=ezpmIHdezTBbf881zhI3CU2iISmV0MQJiMl9FITaAaJc/FPTGgGSS72dJ9it0DleLd
 wxouczhqlLGuc/rn+Z2Hh48jLNROCDVRzlMq9GOzuNU+7ShkTuK7njkkzL+3RDoG5s5u
 psLbbskGWW/2vNTrdXqysyu4Psdq3WNw/dewRNXbC4FewtESTVC3hewvWEDZiipYft6w
 WzvXRZXctp7LY6P/cdi0A6g09nIVqgDlIKUwBV43Y7Tw114LKFGd6dP/0v5umaRzCIRV
 iB0GAuUO46Gs+eHCtnyI3Ev3KpEjV1AyBGiVGPDwPU4fEx+GP8xecFLsnsQKvjlVmmBp
 dQLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzq3dk6o/EoUOKilD5HEr17ZHXvAqJteXZO8TvSrcqILjvY77SiEeKPz+IpMRQUTCBwPBwpTv2IQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy5OTE/G7rUEIaUGB4mljPg97+Dm5LeB1BEwX7qqtNMblCQrdLI
 lnNOJ16xhf6+2fhUpupOLIY57/oPyAmu8cSGmN90ldoAHmbUA2MFwLV9dcLn8kfRJsVqjdCzr1T
 3Iix8VXI/EqrRwD/5MhAb+xwCTCsjyFFqJnmsj8NB0DJJoFoMuQ==
X-Gm-Gg: ASbGncsaCQwA0mEsCKNdozraRhjBV12SzYEAk0eAm3DbEPvZ9b3cBsFlKOMlK8X7JPa
 cQeyUMqF3Naq07qxHc8p8TobuhaZ0+9/5ReAaJ67J56dmtRfnXo1A5HVpLqQYVSNstP6wequRtJ
 EadomPhx0ulDhxvOLhiRIlmB1OteKm7Opz3HDORO5Nxs2dMFynImTmdeq/YpytWXxrzG0PZsGxs
 XHgi1ZF2C+BFZy+JmBzOPSEfs1dqGochJr/DU7KmCmxbEmkE3S5NlvlHJqMs482FH9sxq1ErO9B
 zrRihxcDEKsn5WFaGC48Gw==
X-Received: by 2002:a05:6000:78d:b0:386:1cd3:89fa with SMTP id
 ffacd0b85a97d-3862b37da8emr10855301f8f.33.1733750488197; 
 Mon, 09 Dec 2024 05:21:28 -0800 (PST)
X-Received: by 2002:a05:6000:78d:b0:386:1cd3:89fa with SMTP id
 ffacd0b85a97d-3862b37da8emr10855275f8f.33.1733750487886; 
 Mon, 09 Dec 2024 05:21:27 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38621909644sm13377648f8f.76.2024.12.09.05.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 05:21:27 -0800 (PST)
Date: Mon, 9 Dec 2024 14:21:25 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 <linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v6 08/16] acpi/ghes: don't check if physical_address is
 not zero
Message-ID: <20241209142125.74aa8be4@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241209113640.000055ab@huawei.com>
References: <cover.1733561462.git.mchehab+huawei@kernel.org>
 <95c0fa3fc2969daf3b6bc1f007733f11b715a465.1733561462.git.mchehab+huawei@kernel.org>
 <20241209113640.000055ab@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W-j-FyrDfjIZ2qUr_vzHsOyNMSLhhW6Ojf9lovsR6ng_1733750488
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.489,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: e5dPdlfKVDu+

On Mon, 9 Dec 2024 11:36:40 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Sat,  7 Dec 2024 09:54:14 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > The 'physical_address' value is a faulty page. As such, 0 is
> > as valid as any other value.  
> Still not sure on what faulty pages are :)

s/page/address/ probably would make it a bit more clear

> 
> Given I tagged previous (after you'd sent this)
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> > 
> > Suggested-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  hw/acpi/ghes.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > index edc74c38bf8a..a3dffd78b012 100644
> > --- a/hw/acpi/ghes.c
> > +++ b/hw/acpi/ghes.c
> > @@ -400,10 +400,6 @@ int acpi_ghes_record_errors(uint16_t source_id, uint64_t physical_address)
> >  
> >      start_addr = le64_to_cpu(ags->ghes_addr_le);
> >  
> > -    if (!physical_address) {
> > -        return -1;
> > -    }
> > -
> >      start_addr += source_id * sizeof(uint64_t);
> >  
> >      cpu_physical_memory_read(start_addr, &error_block_addr,  
> 

