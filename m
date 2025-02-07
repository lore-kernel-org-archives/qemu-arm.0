Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp366939njb;
        Fri, 7 Feb 2025 09:48:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqmtfHI0bUAMJ8J0QUXVS27G0JVnc4X29Ll3pHKgM89OMfBZJK8DiDD6+LU7Bg2KgwLiL3nq0yXPFJTA==@linaro.org
X-Google-Smtp-Source: AGHT+IEYdJMoxB8XxmAGGPw1yyWRJPSjMG5xSmmBKCfN3XfHNLteYq0Y8S/d3zCNryrFwp7j4a/E
X-Received: by 2002:a05:6102:4414:b0:4af:e61d:e22f with SMTP id ada2fe7eead31-4ba85f90424mr4364024137.24.1738950512513;
        Fri, 07 Feb 2025 09:48:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738950512; cv=none;
        d=google.com; s=arc-20240605;
        b=Boh52gRc3W6ftUy7dgZt+3C6E5WtjHjZY2zqE+uC/PQglDxbBKdg1DapCT/bRSIjjg
         6RgekKr+958m0sujy7eZ6Cak50qKfYuaMvPbXVlMS6OPfArvnauU+EeWnHV7DTmQD91q
         o4nHBqDLDCNWEocK3g3kkW7PD8LsAyNGFf6O7qzuKqL+QP71tODgHG9wMdmcSw70EHIc
         ZKfIf/968s0GO8IBct7I4Qa0x+yez3hDT4KfmIgg9tal0Ias1XDB74LY6nJk8CFO32t4
         fO+RBuJESR+YKJjdsE5FRaAl3/7vucOFPoSxq+yLwcjqiJwdh7I4LFJRtcw+iYDMuqlj
         SRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=cxfsx6u5R8uKJa8bY5IZuJYQ2qLA5Q3iOTNlVtOC1+0=;
        fh=lhqgT9dn15ggNEeUVzi3SDkLUNX6P2FLugqxGqtPGpA=;
        b=gTGgn+t7iiobATv0qf/tajV+NxWCESkQoC8/j3bNCL9fQygTf/T+Fc3auIgsTsJxxE
         DEVSLL/MPeGSyEEb6TfnwQC95S5yQyW7IZoP8nJPmrxMs7EyiZARkuYh2vHG+yren6Cq
         KcWae8IrMai3dqKhX15Z6k7nJB5C3qcbZh5oUTlmhj3tAxr63Uq19hBEDP9rG7gfDVne
         gT4w4oriHQrCkho1lhNBS7NRkHDR7UVTX7n6IWTsVQq+iSi+p2NGHUg8SFypyUqQImsW
         27douFOYbCmhPifMtqz4rcxhjnkygYca2DUAKhj2ePLcw6hKrB4noxCACqGGgN1sWMLh
         B6hQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="e3PMS/eI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ba77935951si897828137.663.2025.02.07.09.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 09:48:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="e3PMS/eI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgSSU-0000re-Vt; Fri, 07 Feb 2025 12:48:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1tgSST-0000rO-88
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 12:48:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1tgSSR-0001q2-9d
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 12:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738950481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cxfsx6u5R8uKJa8bY5IZuJYQ2qLA5Q3iOTNlVtOC1+0=;
 b=e3PMS/eIKftY174SJbJpv5ogGuQYCt1c4zwUD5en60s6NRxiNIl7hBr8DH4KFqxuU5zvom
 eU3XfyGHmM/iP9Mt4cSS2y30Wgy6s/6ca7dmMqPrea75ukJ3YcK/JCbZjnrAWZZ4/9jmGl
 Yk8OWHjzl0d8EusrceCU3IyjrJ40EQc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-HH9bbC-0Mcu7avznkOId8Q-1; Fri, 07 Feb 2025 12:47:59 -0500
X-MC-Unique: HH9bbC-0Mcu7avznkOId8Q-1
X-Mimecast-MFC-AGG-ID: HH9bbC-0Mcu7avznkOId8Q
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b6e852eeabso357767785a.0
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 09:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738950479; x=1739555279;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cxfsx6u5R8uKJa8bY5IZuJYQ2qLA5Q3iOTNlVtOC1+0=;
 b=jsyG1Clcy8Roi7ei3D5xMVZiJ+ECkvC3eeVTAz6dDtUcovT2XTjxJYPBovFdGmFXhX
 ikauS/KPMk8FxjhR+UUsunSJ8q+GJ90mTQiEmSeNkVF+MRCnjz00dFV8hBeZGZ8E4nHJ
 7QUkJKhb59z/YZ0DoXnif6+RotD9S+02XspKlfC28r0MYHFv21GAnXUmycGEfqc4ME8k
 rhp4wFgPxGBBavMZv9pzqGrI0zUIoAwP/BFFUzwscxQ7ckBfUzDS60/olPuK7QxvpyKF
 4fk8Aj2hXdoMjqCg47v7kyJCCG+RXGgri49Jl9xFb9WOwqW6LAjHtUHk3oPfA/gzG2XS
 XYEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA25uIE3S5bjlnnHHFF2kQjm70B1JGc55pQENJeerDkO9emAWkOLJhMArD3Oydbtu0HT9i9JDvlg==@nongnu.org
X-Gm-Message-State: AOJu0YySukEi+tb80326sfIqNonoFD/HAvVzygYYftAG8FfifuLEh7j1
 cZ2LZQsT99i8+UUT/ghp5WG6jY7Js5Xv+n2NlUICpxkOHVQlmLdOue3YFOKWSY1rnzwZJjIwfTS
 ipLGWimqBxXQfmWh1xvtmqhtbba9OxPz2K/MYclhRqO63SNgm5g==
X-Gm-Gg: ASbGncsRW64qe2j+kR8GdxpeW9AST/YShmFVcIi5RZ+QMUC2f5xv0RYyJDicDVplYHD
 f2jjP+Z4hJV0U/9wr4Nj2BcJ1QxvxKBxo8nF18hm8eZQtz/yiIETsP1oceNwnob2YEJpbtKQFOJ
 YSp7aL2TVX3fsNWOfMSyZeH8x3WTrKy+efav8YAzkCTYz8BnJfN44l0MRdWEhfS+67ap9SV8+me
 Lx4Tf/VbSWgqgi60zgmUCw9JdXn8r57x9E72K5/TPPphkxnhUWEKOotPDVDcM2X2jC6hfrzUine
 KR9hNrOIosUqL6sJPusoS86cwGg7Zb6xYtQDuWCy4WZ7m98l
X-Received: by 2002:a05:620a:454a:b0:7b6:66d0:5ac2 with SMTP id
 af79cd13be357-7c047c45d24mr756874185a.54.1738950479392; 
 Fri, 07 Feb 2025 09:47:59 -0800 (PST)
X-Received: by 2002:a05:620a:454a:b0:7b6:66d0:5ac2 with SMTP id
 af79cd13be357-7c047c45d24mr756869685a.54.1738950479060; 
 Fri, 07 Feb 2025 09:47:59 -0800 (PST)
Received: from x1.local (pool-99-254-114-190.cpe.net.cable.rogers.com.
 [99.254.114.190]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c041eb776fsm214743485a.91.2025.02.07.09.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 09:47:58 -0800 (PST)
Date: Fri, 7 Feb 2025 12:47:57 -0500
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 imammedo@redhat.com, alex.williamson@redhat.com, clg@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: Re: [PATCH 4/5] hw/arm/smmuv3: Move reset to exit phase
Message-ID: <Z6ZHTStx_S9ALdxt@x1.local>
References: <20250206142307.921070-1-eric.auger@redhat.com>
 <20250206142307.921070-5-eric.auger@redhat.com>
 <CAFEAcA_LgrBRbafVQ0vLGPd8xG=wsLjWnKTJ2JSEREYUqgRQBQ@mail.gmail.com>
 <7102d470-ac72-4c02-b8bc-20f1379a4843@redhat.com>
 <CAFEAcA-XK5GwT0b_Ff-8fYnWcDgzaE-0Ei-YqDoXv-aXFGNXUQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-XK5GwT0b_Ff-8fYnWcDgzaE-0Ei-YqDoXv-aXFGNXUQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xk2YjrG6L7m1kqDcBhkRPKf5wDjtaeZdHIqrQNvPpRY_1738950479
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 4VW1FV92/h3y

On Fri, Feb 07, 2025 at 04:58:39PM +0000, Peter Maydell wrote:
> (I wonder if we ought to suggest quiescing outstanding
> DMA in the enter phase? But it's probably easier to fix
> the iommus like this series does than try to get every
> dma-capable pci device to do something different.)

I wonder if we should provide some generic helper to register vIOMMU reset
callbacks, so that we'll be sure any vIOMMU model impl that will register
at exit() phase only, and do nothing during the initial two phases.  Then
we can put some rich comment on that helper on why.

Looks like it means the qemu reset model in the future can be a combination
of device tree (which resets depth-first) and the three phases model.  We
will start to use different approach to solve different problems.

Maybe after we settle our mind, we should update the reset document,
e.g. for device emulation developers, we need to be clear on where to
quiesce the DMAs, and it must not happen at exit().  Both all devices and
all iommu impls need to follow the rules to make it work like the plan.

Thanks,

-- 
Peter Xu

