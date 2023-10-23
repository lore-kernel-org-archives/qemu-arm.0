Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1332118ejb;
        Mon, 23 Oct 2023 05:42:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnVhTn+8pS9v1euDDWbmGltdzAXYdezuGuZNP0+N5WxBpeiJZreyV8uF/DnMs6IGuyVW+N
X-Received: by 2002:a05:6214:21e8:b0:66d:237d:8f75 with SMTP id p8-20020a05621421e800b0066d237d8f75mr10785572qvj.35.1698064953596;
        Mon, 23 Oct 2023 05:42:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698064953; cv=none;
        d=google.com; s=arc-20160816;
        b=QhxW2TAOUtXv81+gUo5R058IBnJ9jdn1LTMb4cKXlRVNLbFYPHRpAGInKoPYYcDXNK
         /kbu091Dh6XS4IrnL7RvceiPLBgKjuAZl0G+tvotETXidQKAuu82geiI8tgHCDO5gFyV
         mN8P9BC7XNz4AjeWoe87qQtapDz1c3r1DW2U6CquFF2ThmcTJalv9r8lgO25QHBcS3iJ
         Va7tmMSX1MAEEbImyLj69bkXDVwJ7beDy4G5aX1mnYXqB8djGKyupRuG9cleqZoCPHWz
         I3SGi7YBJovcxVhmItHXVVUpR92STrlb9QrEyj63khRnWXKJGWrB4vl5k/ftu0C4H65g
         DI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=sL86v2mc3VZ99aedO1TusOCiA+FWuj8pby0T4XoGr0Y=;
        fh=Golw2Ah+zEhVCJQSdsZol3fNc1i7gYTinsck+6ubahE=;
        b=oRhv36hFsZDtEiEXv5SxabNa/nMgPMmL8crFljpAtN2Ll+jtssha4Tpiii//z/BRfd
         olutyvq26lzmi8ujj1m0j0QkRb44+p7loJ4IjOiJriOpeii+9t/YHWQhvb8Ffb5+Wgaw
         eEyjGiGnQuYU+KeoMWFGBv3fnY7WbOCAUhDtuVpEyKJeR/60prDzLooQoltaxpQEh7JZ
         3oe4cxxYD9oeesYoCBhe3fpOiK5Lu0eHDJm+l6AcOfYWFm7FWo2YGSMy8KZJ79oImfvi
         t7/7johMyLOenUssgQTLP/I8L2B0i7yUhoUfNknn5TUTfHVrpEIbaUj2sdnbES/mvQac
         f34g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jq9WC2gM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id nh19-20020a056214391300b0066d20f29e50si5463020qvb.46.2023.10.23.05.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 05:42:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jq9WC2gM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quuGC-0004lQ-K7; Mon, 23 Oct 2023 08:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuGA-0004kR-PA
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 08:42:18 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuG7-00029Z-RS
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 08:42:18 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9be7e3fa1daso481807466b.3
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698064934; x=1698669734; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sL86v2mc3VZ99aedO1TusOCiA+FWuj8pby0T4XoGr0Y=;
 b=jq9WC2gMgVzCQp/Zz9XOZpEN9B3KvMWJQ9SLKbeoHJB+hexk5vta47BzgdZsWDo03w
 EloCUslrtC+kTZxtVobLvtqb9Zi+jVQhGUhgONuK6pEu3e7MpOOveaOakYjvIpWUa29B
 muvhogCkV8LkyKh3yd24E2k7bdct3XBMV/xk1C2QytOW5BOVAocv5EdIr5xwfXEbJjKH
 C9KhItWjBvKSxdqsdL2R+nyxMqcmerF4IVY4emJhMN2TRsKsTmrxQ5H5U5G5FjQEw4Cq
 eU4dgSWTzAe+8Gf5V5t0uz5KWNpVXAEnzsXuinE+Ca6m8V6ZflH6w1+amNJRKVQzxRcB
 6xDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698064934; x=1698669734;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sL86v2mc3VZ99aedO1TusOCiA+FWuj8pby0T4XoGr0Y=;
 b=TDAFdRfHd6OnQ7G0cvrv4KRYwu8AGmHZpTAmPvitL6aUVR20tMvOQ2xvOnJJ+BOJx1
 akOuyEQZj5I26QRtYJCcXk9hhzBgaMCgv07nzKSYyr45J31RsDedhlxMr6BbzNJ+nR26
 jZDYTgaKe94qDCjj1ECi+WiV1LwerfbxweprnefSA7hv6r7quhjOvO9niWmTcR7z8nnl
 LS7ttNQ3JroYy8ZGAXXebN91sCi44y9teI6iqDJJtMqdyHhBq14+DMWk5nrcp+s/4Ucn
 naE6Hj4eXrmROPePxdV3r5JN1Y5aWKDjoZNg6KxFNXqCKfg/0BVLQnpKmTIXc+IeWXMc
 Xrqg==
X-Gm-Message-State: AOJu0YwQ1BmWx1kfPUwoXpCN6ZVKhEJI1rHD/ctnPP/FoKbZJp4UpwOb
 7C7E6JEJ3FXaurx5W+7J3QYIAw==
X-Received: by 2002:a17:907:720f:b0:9be:fc60:32d9 with SMTP id
 dr15-20020a170907720f00b009befc6032d9mr6260145ejc.47.1698064934248; 
 Mon, 23 Oct 2023 05:42:14 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 x13-20020a170906710d00b009ad87fd4e65sm6580095ejj.108.2023.10.23.05.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 05:42:13 -0700 (PDT)
Date: Mon, 23 Oct 2023 14:42:13 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Anup Patel <apatel@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Haibo Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH v3 05/12] hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
Message-ID: <20231023-3326c09cb09cc345378a4420@orel>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-6-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132648.23703-6-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: XiZhwdRkZppE

On Thu, Oct 19, 2023 at 06:56:41PM +0530, Sunil V L wrote:
> Add IMSIC structure in MADT when IMSIC is configured.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
