Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp721597lfk;
        Wed, 9 Feb 2022 02:33:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvRAZqqpVO7dVuZ/2UIbMG6d5x/cM73jhT547Cs56S+7aAxxcOj+PU7sS8pXLPe/HfCFF9
X-Received: by 2002:ac8:5b8a:: with SMTP id a10mr797149qta.469.1644402797737;
        Wed, 09 Feb 2022 02:33:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644402797; cv=none;
        d=google.com; s=arc-20160816;
        b=h1hJSLAl6nk8fx4iieX0Sjz8iebIewYSbOdgQFru8fYdhNZX8ML+XMjJXEujcjlpyX
         92/InIEOmCbcv8TS8hGZtbW1P2+9co71b0XvjCkJ0oQ/CBEUWAn+4YzOIpU4D23+8O9s
         SkQ1ZfXY6ETY343dHjEZ0wxpf2pEsxtEOdxt67FHiDOuuSweDaD3KmX3CAsI3oAzM5pI
         RJGNbdQ7UG4H+miy8vTNRbAzPE7LMnIhU7eTHF10HpTPSUnzsditu4C5wnEvLxM/oWMr
         W0RxeX5yKXmgtw629M3an3HVzqeMJNq6tB2hNqFrkkfpihNXSuqRQkCBKG7ZISrBFL8N
         rQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=nAvwtPb3s9sVeSO+W3MxfAcX9bWNXjvDWeMiIpP3PjI=;
        b=UYBm1XKot8uMeKVehIrSfDRvQpuSHmaS01LoAj+QQ7WyHTsHqt+bStoWJezGfvoOuz
         4w7IOAtbf6Dlfn07L6CPQnYfjXBH1znJ0+zDS490iNSeVEB4r8H+i0OskBJHTUW6vUIu
         +o+/TBVbHiC8QBmb4J9fY0DBiZqUBRA7ETGXJqEg5IiMmtyFM6a5JHT+ph5DPz6j0qK3
         XOozUTRF63tP38aIcbqOg4QdeJEYOvRmhr9pufVqEj3DT6b0ixT1BXkM3NRazCVR3//6
         TnbYLnt8VmuyH3wPQyUX7DgLoUPr74AARTXFdEY88BND45wZyywOQ11R/m4q6HCQbdYZ
         638w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OnN5WLn+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14si3900146qki.254.2022.02.09.02.33.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Feb 2022 02:33:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OnN5WLn+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nHkHl-0001Ch-6r
	for alex.bennee@linaro.org; Wed, 09 Feb 2022 05:33:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nHkFB-00070T-9U
 for qemu-arm@nongnu.org; Wed, 09 Feb 2022 05:30:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nHkF9-0002oS-2B
 for qemu-arm@nongnu.org; Wed, 09 Feb 2022 05:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644402631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nAvwtPb3s9sVeSO+W3MxfAcX9bWNXjvDWeMiIpP3PjI=;
 b=OnN5WLn+7qaZhf4nYow+s0rG8s5qJbYL7QStgjQ49FAdp7798KjQbuRRskwZuVgBlyqeM6
 KHS6DVkhzqBdK6bXUlM2mawdBGvlW1RvZ2mSHnLob52cQuufrIg0sGI81T5TblzF9vgtO6
 PRCgWW2UbXlcRGXd+yq41QOK5YdgcOM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-K4TRNHI8MP-bvFQNWHGOOQ-1; Wed, 09 Feb 2022 05:30:30 -0500
X-MC-Unique: K4TRNHI8MP-bvFQNWHGOOQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 ka12-20020a170907990c00b006c41c582397so977167ejc.11
 for <qemu-arm@nongnu.org>; Wed, 09 Feb 2022 02:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nAvwtPb3s9sVeSO+W3MxfAcX9bWNXjvDWeMiIpP3PjI=;
 b=hJf/R9zMLMkytBpoma2r3cVrb5KN6g6XsclcnsxirC8V4ackWea+U5obrSYoELMvki
 NRqes+RdE/ESEdOJ+eBkcy6sveYhovf776zxEXCL0ZccjAuLAjXCGS/dKccLTLlLTejn
 5IswWz76EPT1cEn4Wron98NMNuMrLlL7WQvNYulWbpsN5wZD24Ip9laCDMhvAsdyjBjl
 kRFXWGJS/uuJ+XDcxVnR9JAqq5isaHNynj9bRy6IAXulMqxJsjluSDUiv9zU3Lsz8wO1
 uwzeohkxbeWsUB7g/qwCbzGRaewVnQAlhQBv6WVPMR4t2mwm1z/JKgxZQilK+JcI48RM
 3uTQ==
X-Gm-Message-State: AOAM530rz46FUlUJSxC9eDt4y2U0vPiek2wAMIsJhMk+U66RDlTqXrch
 l0gRE03g/iKfvrEwMDL3L82iQR8KdDUrRMwpu/pqGAz4ABfaF58X9YVy34Iu4T3HIZkLMgGUX5S
 K0F0W+GwBcfeq
X-Received: by 2002:a17:907:72d0:: with SMTP id
 du16mr1298259ejc.506.1644402628912; 
 Wed, 09 Feb 2022 02:30:28 -0800 (PST)
X-Received: by 2002:a17:907:72d0:: with SMTP id
 du16mr1298243ejc.506.1644402628676; 
 Wed, 09 Feb 2022 02:30:28 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id qf6sm1918676ejc.113.2022.02.09.02.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 02:30:28 -0800 (PST)
Date: Wed, 9 Feb 2022 11:30:26 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/6] target/arm: -cpu host/max KVM and HVF fixes
Message-ID: <20220209103026.sf2tcko2w5govafq@gator>
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220204165506.2846058-1-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vo1qqaKz+wK6

On Fri, Feb 04, 2022 at 04:55:00PM +0000, Peter Maydell wrote:
> This patchset fixes various minor bugs in KVM and HVF
> -cpu host and -cpu max:
> 
> (1) KVM -cpu max was incorrectly adding a 'sve-max-vq' property
> that wouldn't work and which doesn't exist in KVM -cpu host
> 
> (2) HVF -cpu max was using all the TCG ID fields and thus
> promising the guest more than the host CPU can actually do
> 
> (3) HVF -cpu host wasn't setting up the PAuth properties, so
> it defaulted to not telling the guest about PAuth support
> 
> This series fixes (1) by moving the '-cpu host' code to
> cpu64.c since it's aarch64-specific anyway, which lets us
> reuse it from the '-cpu max' init function. It fixes
> (2) and (3) mostly by making HVF use the same bits of code
> that KVM does for -cpu max and PAuth.
> 
> thanks
> -- PMM
> 
> Peter Maydell (6):
>   target/arm: Move '-cpu host' code to cpu64.c
>   target/arm: Use aarch64_cpu_register() for 'host' CPU type
>   target/arm: Make KVM -cpu max exactly like -cpu host
>   target/arm: Unindent unnecessary else-clause
>   target/arm: Fix '-cpu max' for HVF
>   target/arm: Support PAuth extension for hvf
> 
>  target/arm/cpu.c   |  30 -----
>  target/arm/cpu64.c | 330 +++++++++++++++++++++++++--------------------
>  2 files changed, 181 insertions(+), 179 deletions(-)
> 
> -- 
> 2.25.1
>

For the series
 
Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew

