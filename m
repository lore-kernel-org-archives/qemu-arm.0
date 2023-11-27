Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp753883ejt;
        Sun, 26 Nov 2023 20:31:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFn1O12jptKUQ0vxYXorlKh0bVMl0sSpZWA3H28XrdElYkIxCmQNCiwexIM4Vo2L2Y1kiLi
X-Received: by 2002:aa7:930e:0:b0:6be:1f19:e604 with SMTP id cz14-20020aa7930e000000b006be1f19e604mr12908854pfb.21.1701059514235;
        Sun, 26 Nov 2023 20:31:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701059514; cv=none;
        d=google.com; s=arc-20160816;
        b=rxL75O0MYW15NBHt0z+U0jrHev5fYB1UsIkUByp2pBnuHSMZIY+JqpmZTWgSxczjGY
         smErjPrhnyEIZgC1Gi0WB3ZBj+ST1BD3nJ3UiWOTLnrA/DkNF8Zv2rF34c+BWBN3baNF
         3ld9b6yIybMO/UjIAXynMKQsmeJ3dsfSCjANSj7QbBo+XrhAvF4G8O6cYctAFcZWMQiU
         HcVCg1ps2GpZITinMcABdtdOspstzuFDduhogP4gc1Eyq2sb/gn8OeuXdZ92GQBH2HDx
         NAnsxG4uAlKx4HxwOzJ1FbBzvDs9UL47blzLHn5YgJMNCAy8iW2pd9ZuzUusSzqfr3y+
         jLhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=sZZnkvSfitGisLGL04wWrdlz4T2wKJDLQwGw8KJBvFg=;
        fh=YIs6fi4xux502Hus2tOT+Pch2Mum+BNamOXX0MbPDX4=;
        b=lFScoJFkqpej3znt20S159d8muVamQU9BMa5Ae0EB3Z9b6RFI0ysOfHcy8YOE2wpoT
         iXunf1Mqy/e4lvmxvOlY3+Nz8tG70GWsSjqtE0ZcpP4Y1ysmWSECE7XHNGb113it3oIY
         XyAwpt3Dm2t8pZ4JlwLgwJ/teo+0e3hNjaUPrNph49vdgaLN26ItWH/67RYoJ8KbS/z0
         xM5KsV6+nOdaJQbDjBdMph+3QKnThanZvmqkht51vc2ZuJLq1src0R8V5hiZeDwIvftw
         3yqez+kdyY1TWntPN7tPFNbw7//XSGE5Qo6YCMRgafJ6NvnGjJdWPDfdAgAt31RzeERV
         hPlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=InifMiSs;
       spf=pass (google.com: domain of kvm+bounces-2480-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2480-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-2480-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id a23-20020a656417000000b005bcfc60520asi8769163pgv.586.2023.11.26.20.31.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 20:31:54 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2480-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=InifMiSs;
       spf=pass (google.com: domain of kvm+bounces-2480-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2480-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11BA8B20A5B
	for <alex.bennee@linaro.org>; Mon, 27 Nov 2023 04:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60823D286;
	Mon, 27 Nov 2023 04:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="InifMiSs"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F38B012F
	for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701059503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sZZnkvSfitGisLGL04wWrdlz4T2wKJDLQwGw8KJBvFg=;
	b=InifMiSsi+kUPtxt3NcqsRI7HIJI+yVnXsQ3QEvVZiMAWzyyVU/5+ZrfeQlVxubPB4MgYa
	2FzTnCSzEZEmX6UPU+OwuIEM1yxrQrMPC/g+vN3zuCJ1E7uaxx9SHEHsFmnyiNVlTNtve6
	x7CRbIOHTHlGMenJPgvbCWYvgG13luM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-KQsjzquuNMaVjaybqgWHqQ-1; Sun, 26 Nov 2023 23:31:42 -0500
X-MC-Unique: KQsjzquuNMaVjaybqgWHqQ-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6cc08c794d6so2770717b3a.1
        for <kvm@vger.kernel.org>; Sun, 26 Nov 2023 20:31:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701059501; x=1701664301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZZnkvSfitGisLGL04wWrdlz4T2wKJDLQwGw8KJBvFg=;
        b=BbF8gKEtIQBP3hMTVBDqC28vA2eAe32b5/l7NIYGMspE5OxPmIfkVi3dJEdHLtkfJY
         ijX+ri4KVQ8EvlBpqGrr1q8qS3uU6NK9zVujcnSOxdqj5YfZJtqxXby0PLuB1y1Vyy5A
         qcK51n5rizyme190SKJeDZp3Xwscu7pyeNNAl/byhYk/EfaFr/TL4x8d0IvHDxc1onXC
         lM5nXZx91Yv4sYb8m042n01xc/NbQ8l1ANXjVMRN76+JztRNiJEeZvjdRjLoJROo1KO+
         yeBvYHz25LRvDe3ZM1dUI/w4JsJ0k0+5SFcy6TzZSSdGQQx9tkOk950xDyvfEZ5tTSHU
         Qxrw==
X-Gm-Message-State: AOJu0YyNOWPdG/+CwmDTWte8/hFho6aUYz46qiCRNCcNCpaFH6A25Wp+
	qzgendRf7puDr77IFTaT/T21DiXvgPa6qcdRpQei9ZFYXEcGrWHxKoxEqHFFbjPzmHdhgj59VDg
	dWbPgLBN+mmzv
X-Received: by 2002:aa7:9d09:0:b0:6cd:879d:4c8d with SMTP id k9-20020aa79d09000000b006cd879d4c8dmr3649473pfp.7.1701059501066;
        Sun, 26 Nov 2023 20:31:41 -0800 (PST)
X-Received: by 2002:aa7:9d09:0:b0:6cd:879d:4c8d with SMTP id k9-20020aa79d09000000b006cd879d4c8dmr3649467pfp.7.1701059500805;
        Sun, 26 Nov 2023 20:31:40 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
        by smtp.gmail.com with ESMTPSA id s13-20020a62e70d000000b006cb8e394574sm6373833pfh.21.2023.11.26.20.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 20:31:40 -0800 (PST)
Message-ID: <97eadec9-7d10-4bd3-a8fc-cf160f733681@redhat.com>
Date: Mon, 27 Nov 2023 15:31:36 +1100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 13/16] target/arm/kvm: Have
 kvm_arm_verify_ext_dabt_pending take a ARMCPU arg
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
 <20231123183518.64569-14-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123183518.64569-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: aFF0KWlRefxW

On 11/24/23 05:35, Philippe Mathieu-Daudé wrote:
> Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
> take a ARMCPU* argument. Use the CPU() QOM cast macro When
> calling the generic vCPU API from "sysemu/kvm.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/kvm.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

