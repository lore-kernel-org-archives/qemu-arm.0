Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1337267ejb;
        Mon, 23 Oct 2023 05:51:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkHVJYOROTy6sM1XYyfYmUzpUSKkzO8ZiVSm3nK0UwkDbeqnRc3zpL7xdWwaS7hYhYZM8D
X-Received: by 2002:a05:6214:242e:b0:66d:a90f:c06 with SMTP id gy14-20020a056214242e00b0066da90f0c06mr6755278qvb.14.1698065497748;
        Mon, 23 Oct 2023 05:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698065497; cv=none;
        d=google.com; s=arc-20160816;
        b=GY1rg8a2y+vjiMX3NHzBcUxSRKS0ZwJ3jEKi77w9EZREiugXMAnoUF07mBMMcn2Val
         ePOScH6XpiGE+nnQCeJHyd9zBUpfQTPZTnwjlccTHwliXvau49XNac3qCt7Hgc7DeGGw
         QVnKk75Sn8rCjxaCg8Nxl2EEGF/6e/rK2j5q6OpynRNhBwXxPV2JLIzEjo4ysaS2EQcN
         la7oHbR2TvDxTMwaIaVkcGUYdYS3rfOIkp00wgB6tZKuK4SLjEqGQ6QAqwdlAaKE9uIo
         A0Z1USRsvHbj25ui+LXTHzNtsBzANKrCoU0rpyp/bx9pMikARbnGTaUYsjeJjY48ir4N
         Z/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=d/GZw909RfOunItm2KggrrXC9aZXw2AvjFnQ9ajvocM=;
        fh=Golw2Ah+zEhVCJQSdsZol3fNc1i7gYTinsck+6ubahE=;
        b=sVf/soH7qWUs0nYoeHh4Xj47sz+bpe8e98F2apGAaUp4G4L7wa3xbhF4WFHobGbIZe
         msxz4fpKnj7xOs8HhHFc+tcc41WgCeKjZ5Bse1wBhZzbSVLbXxHqc8uvANkPJicSCBzx
         krUx0/V6r61F02Npm5a2h/xg72Gz82FojsG9CsBQhWHVEQIFAwI7BH/L2IplHdk9TdSD
         JNC88LjIZbg0ewfwnJx6qfMi+xF6fy98zrd7n3RZ9lv116VSnJCJUsXCm9Bb0BL52rqu
         Bq0aN/LcvFOEcmzStVteleVg9w+Jt+UHhjsHj8TKq9Vvf3ZMC872W7Zses4kB6xHDCIB
         fcvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=MD3nCnbk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay18-20020a05620a179200b0077772d4821esi5680161qkb.291.2023.10.23.05.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 05:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=MD3nCnbk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quuP6-0007Xe-C6; Mon, 23 Oct 2023 08:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuP4-0007QK-QE
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 08:51:30 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuP3-00058M-0g
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 08:51:30 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-538e8eca9c1so4747803a12.3
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698065486; x=1698670286; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d/GZw909RfOunItm2KggrrXC9aZXw2AvjFnQ9ajvocM=;
 b=MD3nCnbk/EodSkQuGaDENRSvoSJKf6SlsdTm3gUjRa5miYZ7DZn/Ac7AAA/oLJkoe6
 aLzrBk/ELuZlASM1omwDYn2YKNLMBFTLgCUg26qM+tHcFBgJKRDCKKjeTEpsk8xPOGsf
 9RZExAAde7Eo1QsXN9g4Ujq0eYUfISfWX+ror6KGZfhUDOicZga1zzubmGCi+hISr7rW
 zT66bdWDX2CNEfEDSSXAAUjoXJJ1E9j8FCWSngNV+o0Rsx9EsoN7w3k/aVSMHIajxUtd
 e3JH+SsxUJWT4T2NSNi2fUs4pij+9he0HWxwkrvXYiyzjOE1jQP07z9PZY9nITxi5yS6
 KGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698065486; x=1698670286;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/GZw909RfOunItm2KggrrXC9aZXw2AvjFnQ9ajvocM=;
 b=Vqjbu7LTFOG2ZTcLDb/BCFyZRsFJQj2bzZQXEbs9p0fsikIbuTw7+n/Vj5Ci2ur5I7
 PwZXrK+9LQ+kdtscpHDpl1HAHjBtkeJPrZOFt+m3hYBMJb/qRhh4eh9sx8Kdu3NASZ/+
 AcYB5+5JUiFOUK94IizVrLmgWvqXOqaFZK1wlSdmuApRrCvGrD2Di8G2oAYxivJqQPAJ
 iWoaQXG8yTWRww9lZV589ldXHvgmSmnyeuBBS6t7Rw50caU5KZQyPVljHHsY2VjH6Heh
 KHjD9YVAe6D3mG2sNuH46dESOFonyk/YOat2d70/Jf3ylCC7dIlmgaXgcl8KjR9A5F4o
 Si+w==
X-Gm-Message-State: AOJu0YxLN1XDvHqRvYtTVYbu7Wk+/7wNiE68gV2tVVJ7FfWoLjP3QueX
 eUFbYAlrYFFolf21js27m7dqjg==
X-Received: by 2002:a17:907:2ce1:b0:9c1:9bc5:c25c with SMTP id
 hz1-20020a1709072ce100b009c19bc5c25cmr7471111ejc.22.1698065486485; 
 Mon, 23 Oct 2023 05:51:26 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a170906261900b00992e14af9c3sm6647585ejc.143.2023.10.23.05.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 05:51:26 -0700 (PDT)
Date: Mon, 23 Oct 2023 14:51:25 +0200
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
Subject: Re: [PATCH v3 07/12] hw/riscv/virt-acpi-build.c: Add CMO information
 in RHCT
Message-ID: <20231023-bef871e5fa4e26f66db68961@orel>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-8-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132648.23703-8-sunilvl@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x535.google.com
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
X-TUID: JYm2H7dcPFYa

On Thu, Oct 19, 2023 at 06:56:43PM +0530, Sunil V L wrote:
> When CMO related extensions like Zicboz, Zicbom and Zicbop are enabled, the
> block size for those extensions need to be communicated via CMO node in
> RHCT. Add CMO node in RHCT if any of those CMO extensions are detected.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 64 +++++++++++++++++++++++++++++++++-----
>  1 file changed, 56 insertions(+), 8 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
