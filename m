Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1965279lfg;
        Mon, 23 Aug 2021 08:21:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJG6FXjDGWDbu9JFycg/4BxDzWVKHRJril/qFUMVe/I0z/zkesQNuQQ6Vcw9X4nY3+5mY8
X-Received: by 2002:a05:6402:1add:: with SMTP id ba29mr37976010edb.145.1629732072597;
        Mon, 23 Aug 2021 08:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629732072; cv=none;
        d=google.com; s=arc-20160816;
        b=roOtM685if78HTXuVhPqhhyYhdYZjXiEPxjwhyvjFyJj94ZLOX07onbR6lHGJyrzOn
         gRyYMxemjkP5hnjL2roqJ3wd/la9eqDl1wSaHcjJcM8KP/zvvr2tRXZDHzyD2paka+5u
         Ex66VQ2OIDnq+TC7Mk54ubhGwF2n/Y0LfRzEV0/WkN7t5WLk2LBCNvElfduCOO0kWImX
         CK0ugBlHT9wNcdLKpD5vwTO4M9g+EPDcn1Lk+YFI8LxtdvGz4RMEs/2MCPh65H6relJd
         FATAAUg6CcWFeieQz4FCb6DywTx6mySpbbWwSom/0/gfK5pdDK0hDq1IARVg0/rrbcUC
         ZwEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=cpJihCXUzgpi+3OL+/LebXO+XMRlBWHGbhTpOkTFKxg=;
        b=EonytCoZM5v5JqbpQoZtNxCRrxxBzzUogOa63v/k1YJlDP1Dmuq6YAilvzqDyWi+GA
         vxxjTY7fntMijuc5jXLsFL5UHGu6ZFjWwK+cr7ZY9Ov8y9K4jv/DmmXmxGQhgc7pDjS6
         hRkP9s2apw/q3pU4NFX9ykyxfSNR38VS7tEe9fFT6TGaj2OW4+C4Uah47PEISp2OBENA
         lc5ZIzDMakJ3WJOUFg702xLrBv6XtXIy7LaKmoXvWcsQTsdDZcMgZ+HMKzKHiMN7vFnF
         SufHZQH1resq4cF9nVfv08KBZk6AzntgPpiH3PJpbCmS6OsxR2ytphACzCICyAvviUOI
         lNaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YduXYmiJ;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id m20si6150011edq.553.2021.08.23.08.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Aug 2021 08:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YduXYmiJ;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629732071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpJihCXUzgpi+3OL+/LebXO+XMRlBWHGbhTpOkTFKxg=;
	b=YduXYmiJ/iEMz2Hn7oo9fmvF6ioB8IR81JuXjshQh+fokfRAq2x9EHjGQHiLwMLB81015e
	j/9PAaBk+5xhGTy56gNEUg5DIATHd/ylWZdduUhxh1tZWT2GQhUMolCuf8neu8P+BZy+zu
	FiWwQs8+VqymS+zQRtfCoHd4R9nG8eY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-9shV5jJJOf-fy_wt3PCPOg-1; Mon, 23 Aug 2021 11:21:10 -0400
X-MC-Unique: 9shV5jJJOf-fy_wt3PCPOg-1
Received: by mail-wm1-f69.google.com with SMTP id o20-20020a05600c379400b002e755735eedso121976wmr.0
        for <alex.bennee@linaro.org>; Mon, 23 Aug 2021 08:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cpJihCXUzgpi+3OL+/LebXO+XMRlBWHGbhTpOkTFKxg=;
        b=ohsHOntjyM2cqVJn6tRVj9sWvBtTvJycKhruyKdUTAVXNPf6simkigidyIoRmMyHNA
         k0g+vErIGNcRo/xFcfxQSF0nyStqXxbnw+OPOqN68CZzNEI8r+87soAjLhR2m7QAaeS+
         mXzLACKur9SEiZEYe4u/kfMJktHUgaAFQhjRfblsKEBbH7lV+UHXkjMVc2CFItigrGDN
         Lzk32T+exoKac+j2aywS4QJS2kBMtPV5SvqYgmAez4uXDRuuI0ukzq3AyMjDRWZ2BKNZ
         gLtHqdV48jYgrbtGIBevdrcQdGRYvsE42nAkaPyycKVB22ozS5QuP+sa7tK9AwkioLtL
         7T5A==
X-Gm-Message-State: AOAM531f5Q2PUJ3jAEMWJnM1TD1Ziqu40ODHnCt9OLSLZCmgwidjn658
	YYtUNHS8wN9msxHmibm3/HYpA4dPbP5Keor4x29nbLaYjkkwNZ0uBGqPK2RceENpNrqJs1r9bZp
	vDwQStGr4yRoG1QFC
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr16828902wmc.41.1629732068713;
        Mon, 23 Aug 2021 08:21:08 -0700 (PDT)
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr16828884wmc.41.1629732068569;
        Mon, 23 Aug 2021 08:21:08 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id n15sm7575253wmq.7.2021.08.23.08.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 08:21:08 -0700 (PDT)
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: Changbin Du <changbin.du@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20210823142004.17935-1-changbin.du@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
Date: Mon, 23 Aug 2021 17:21:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823142004.17935-1-changbin.du@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: hvcFHc5SQH6u

On 8/23/21 4:20 PM, Changbin Du wrote:
> To resolve the issue to debug switchable targets, this serias introduces
> basic infrastructure for gdbstub and enable support for ARM and RISC-V
> targets.
> 
> For example, now there is no problem to debug an big-enadian aarch64 target
> on x86 host.
> 
>   $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...

I don't understand why you need all that.
Maybe you aren't using gdb-multiarch?

You can install it or start it via QEMU Debian Docker image:

$ docker run -it --rm -v /tmp:/tmp -u $UID --network=host \
  registry.gitlab.com/qemu-project/qemu/qemu/debian10 \
  gdb-multiarch -q \
    --ex 'set architecture aarch64' \
    --ex 'set endian big'
The target architecture is assumed to be aarch64
The target is assumed to be big endian
(gdb) target remote 172.17.0.1:1234
(gdb)
