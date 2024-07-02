Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1816232njm;
        Tue, 2 Jul 2024 01:34:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuGBJ3vnXcuuTKsZoEOe+j5zklBA3Rf6N6X307dcHxo97hahxuq4EMjOclx4xm3HLonJ6N66vbO3dV71Vty6GWRvUK5nlN
X-Google-Smtp-Source: AGHT+IEAYKxbFn7ltBGowJp3OnS6ykQSXjc5QkTktXhJNyxqOrR5rXDq4y/A3dcnz/E8bjKhUn6/
X-Received: by 2002:a05:6214:ca5:b0:6b5:80f5:cae5 with SMTP id 6a1803df08f44-6b5b71caf29mr100042846d6.64.1719909242446;
        Tue, 02 Jul 2024 01:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719909242; cv=none;
        d=google.com; s=arc-20160816;
        b=UHgLpJ7LXUrNsOcm/jmYoy3KUtP/f9NeJ6joRAUF+2uth2v6vD5BT2YiJ2ziMknqrh
         yhjmQoq9TttMYDyPz8v39zmrmh3R4LSU+D0PznfONypOxH4u8iTBmmi2jyZNm/5GUQTd
         DJL4NYPoqyjmGdUne/EKM5GX/Lm1L8NIej5BUVHivEufQnVnZtCT8UJB9OTNNLAxh66U
         60lh1knPXwWbr9v18rpvomdkhq6kRGKD04aitAfDXiJz6rqTKFkmhmMa36SSX6GpOPZQ
         0uTKeDjOcR/CR45fC/MHZBw0MoZI8CtiyxOvRm/9qYvXLjDvTIcDTDde5HKIgfJSdHFJ
         wt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ASyEBjhs6aIZg6Pc8HSkZVb23wpDbzWBIrIdGg+Sm5E=;
        fh=HV5/dNuFCzeUNM6k2JtmJw7ZWJ3rqmRvnt/Cm7suHbM=;
        b=NsghepT56bAsG17cfg91QMFqf8TujMcW1aJKpbm4aV/RxDrL+xsI/YP9qykZGXNxp7
         qA/Pjf5PREN5XUmg5buGCQSyByqM752fCACkg1fPhs7fgcsQ68eRwTvtjxOJRqkVQRUZ
         pYnWT7SKs/6ObImMpVptsCSfEhEjNbY44UjS/Nkr30BR/NhyPOSrATJr37NICZe3KZzO
         8dQV6FyoxTZUht7kOZvZEjLaLgLQ6kzF5WsZMvzNezCu4LoB2E5I5lN2JPsNu4T5w1Zq
         h/dRx1q4vlZF17V1eYN/+723qlb2yqTMCW18h47DbcWMH7afl7ZowcFQj/HF0knd0uID
         AUgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=NB7WZUEk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e60b989si98027606d6.491.2024.07.02.01.34.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 01:34:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=NB7WZUEk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOYxZ-00041m-QR; Tue, 02 Jul 2024 04:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sOYxO-0003qf-1w
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 04:33:48 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sOYxM-0002kJ-7b
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 04:33:45 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5c4498dcc27so1146147eaf.1
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 01:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719909221; x=1720514021; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ASyEBjhs6aIZg6Pc8HSkZVb23wpDbzWBIrIdGg+Sm5E=;
 b=NB7WZUEkEsMLbLWjraeN87Ox4fuMIMWW9dMOyeWjI9CbqX2dWDWq5dfjRbKdqhUVsn
 Hcg5gygHmRV/3163z1fyFFk7KpQC3r67sQgDdAoM+aSta4owib7KP1B7e9TBqvEtL8Kf
 O8oXYwOr4p5xvewdBiabPWNsmwZ6meq/5Mhl0dAzNbnls6X5q6ZX+ga7aqUNXR1+lTLj
 PXI3D3bKfUendjo5J0wg9BtjgKd1KT/ukWpuJX3mf6rdmJs//Kq1swRMihGy3zdLfw64
 h5tk87RSWT41kRvXXszL7hIAipq78aBnGzKRuRK+id0i+Tjo8wjWGB8sx3p2XRpB5keg
 tqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719909221; x=1720514021;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ASyEBjhs6aIZg6Pc8HSkZVb23wpDbzWBIrIdGg+Sm5E=;
 b=FA7qJPCC/aYKqgKlKJDJaK+trBAHcdG1L57EtSJs6tsKmLnG3yncbkdtdFV1jJrQoj
 3aFioARYDiQRkr3bIM8o30/xfmU8MJcBKqOJVv9ZC6JSk0/f0gLbFdL5QzVhFUlZplZ5
 o2m1x1ErLXPGfmcgDhMXf1b9Co1zoKWHX5XtQaMwcXtwg/fPTDIyH/5Cje05uZYl7/w7
 osI+Q9OTpmCxr7kCyoTfHtdGxXiuiX6QlwqWqX5EvoGSinzH7mh+0UZTzrWGMeYgzz7H
 9Ew/AgP7k8wISLKCI07T1M6IjhGEDclYqC59ZzCVKpN1UD8cUVGj5MtbTsogWY1VzxPv
 TIlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJwsG3oJbFJ/GVUfRPAr4AeQPVPzvDRCKU0LCUHt6hwRvwsndK+jOwBdjO3iamR33vJdb1I9MLEK9LPs4/vPZoimOC
X-Gm-Message-State: AOJu0YxPmLHubJiiP8NC3LFBEOIjpM8vnI5c5Q8BnqVQ2f/9XQe/stwY
 7RCQYqkt3nyl1G5OskSX+TQVC/6wVcISP06uG+k4S9+TRtGDl0ewXvsWXzH878w=
X-Received: by 2002:a05:6870:23aa:b0:25b:3e23:e5ec with SMTP id
 586e51a60fabf-25db33ed8f4mr6410494fac.20.1719909221571; 
 Tue, 02 Jul 2024 01:33:41 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-25d8e37ee64sm2117889fac.47.2024.07.02.01.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 01:33:41 -0700 (PDT)
Date: Tue, 2 Jul 2024 14:03:29 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v4 06/16] tests/qtest/bios-tables-test.c: Add support for
 arch in path
Message-ID: <ZoO7Wb9OqPxIW04P@sunil-laptop>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
 <20240625150839.1358279-7-sunilvl@ventanamicro.com>
 <20240702103002.69a8678d@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702103002.69a8678d@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mN4QfAzZXS4q

On Tue, Jul 02, 2024 at 10:30:02AM +0200, Igor Mammedov wrote:
> On Tue, 25 Jun 2024 20:38:29 +0530
> Sunil V L <sunilvl@ventanamicro.com> wrote:
> 
> > Since machine name can be common for multiple architectures (ex: virt),
> > add "arch" in the path to search for expected AML files. Since the AML
> > files are still under old path, add support for searching with and
> > without arch in the path.
> 
> we probably should remove fallback path lookup after series is merged.
> it' fine to do it as a follow up patch.
> 
Agreed. Let me send a follow up patch.

Thanks,
Sunil
