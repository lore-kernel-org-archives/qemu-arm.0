Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1326378ejb;
        Mon, 23 Oct 2023 05:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgpgtpj6D+EYtoUTlMOyO+NbvNmg1+9KSm7FgUxd18d1N4/U0zlRruslb/swRSsrOqOwg3
X-Received: by 2002:a05:6358:1804:b0:168:ea0e:e7e2 with SMTP id u4-20020a056358180400b00168ea0ee7e2mr520225rwm.4.1698064361258;
        Mon, 23 Oct 2023 05:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698064361; cv=none;
        d=google.com; s=arc-20160816;
        b=L/psZpkIhvFAnLtbcDnzsoC0c1GdLGVSw07eA9csX9+gHsz1lOYiNUseUjZK80pvfQ
         OFl5IqBeTLmnSlEmL4/INWT0SoL412TP07fTm/MtaEV/Pvgd3/vTnud7GD0VY9dN+Zx+
         /ps5zGI4BWkjfGD5EV7lSsQGvyBhTDBd0ODrzupSz1y1C2BhcVs/rw5uWryl7mdMlY6u
         7TMBJhSFM+gw2UVFQ2JTpU9V5H3qGG8aR78E4CMGlVQlfxTTuTTxxoccg2DRM0ZWEbnz
         /LY2/wQIb0e0CGzkgnFiiB2lGAsuqIMPjaeztpUHrWmjj0Z3HOspE0vKLP5PzH1JZnhJ
         bZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=KF7fL36npFJhBZTQEN1kO2xrKduT7F+8SzUe4B1Jc/M=;
        fh=Golw2Ah+zEhVCJQSdsZol3fNc1i7gYTinsck+6ubahE=;
        b=txgcg1PUyZn+cgdVdbe23pIZDH8bdclq4Xgucr77ehui2iIdOidGqd6l1lu7iiI/aj
         LhGfPbPuxl9zFDBxblBNE7oh1M4VtPzx234D43WB3+OYD29nI93abWiQaLYI68VozDal
         hMPegR6Z+QLzn0ljOUjlu6l5rFGGgXn7n/COVNQHa8Dg2y0d/dcgjjc24MvjMhMx2MvX
         sPdXRn6SJ4HLzRsMQvMHyhqM6wGoT/PffMFEsIoTT3b6JrXp8JqcMMjATXD5sxQspLYZ
         XgFK2jDa19oeefW6nXROOze1RZoCzg5k8C3UuhI1ckc/ugxqD7PNLCetRDNEM23za+OY
         eJRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jZCFgcCF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5-20020ad44ba5000000b0065b0fd973bcsi5200613qvw.271.2023.10.23.05.32.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 05:32:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=jZCFgcCF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quu68-0006xb-Tt; Mon, 23 Oct 2023 08:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quu65-0006ws-TQ
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 08:31:55 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quu61-00087C-PB
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 08:31:52 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9c603e235d1so491492666b.3
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 05:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698064307; x=1698669107; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KF7fL36npFJhBZTQEN1kO2xrKduT7F+8SzUe4B1Jc/M=;
 b=jZCFgcCFGbByAdXm4RE70OsgpC+BOG3kFwtHP6rAAtZrG3//iL3gnE0+azfRF0P+6R
 BSaCpfv6bdDwnlSXZt9KBeYU7P1BAFw8kXv0/mkCr3NNNg32NE+/S2bREWAKsBrFmoqY
 YbycmyYk8En123Rp7CqGCc+Ti/5AloOJyjnMSaIwo6wTfquh4i4KCii0+eTitVSnSnuG
 sX0AR5PiW0AN/yInG0MVUjdOZUudLqcy3xE5hBRjomLlLFJ8WCMQxJlkfEHYTHRMBW95
 w40CRm0x59SPlnE4exZJZpvzMscDFFZ9vwyDMp1nxdNGTjKAzQyZMsFAwTNSRBlNeTgE
 9oBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698064307; x=1698669107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KF7fL36npFJhBZTQEN1kO2xrKduT7F+8SzUe4B1Jc/M=;
 b=Z5QZCsi701gihNSim39uYEUOY/V0juWhVsAXwXuY0sxpU3ci4I9+nS/RQWTkiTEX3R
 G5GalNCOlX9cRl0QAs1QjxWGsXqwfc/8DqmdUw4cLSE2DraHgcyMjCHnij4IFkQFUW50
 O6cxnayE2pNV15KyzSH8Us5ZKvAXXdEvwkJLhxGzv3o8Bg8PQm7FOqUY5E6wwzpK/xcQ
 LEnjSQ0XihNd8+RezhWMbvHbouIXsjnolrx21ebtkVW6yRm63fJ6Q0LyyufJelxqbbe6
 Evow/RT8qC4k/ABSaRkzJASnQi2zSXI9ztANvHYWlvH+EDcnXuX8NO3oXK4VhwUJP0VZ
 zbQA==
X-Gm-Message-State: AOJu0YwTVsAMz9CBPpEKt8Uue0V/WLn+D0pB3yGtPY897cDlL6xmOGL4
 pzAl252JlJxd+RLNtkvx/QGLYg==
X-Received: by 2002:a17:906:6a22:b0:9be:d15e:8ca2 with SMTP id
 qw34-20020a1709066a2200b009bed15e8ca2mr5289295ejc.39.1698064307406; 
 Mon, 23 Oct 2023 05:31:47 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a50d515000000b0053dbb214d96sm6390502edi.13.2023.10.23.05.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 05:31:47 -0700 (PDT)
Date: Mon, 23 Oct 2023 14:31:46 +0200
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
Subject: Re: [PATCH v3 03/12] hw/riscv: virt: Make few IMSIC macros and
 functions public
Message-ID: <20231023-676f1ddf57f2af985da7c382@orel>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132648.23703-4-sunilvl@ventanamicro.com>
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
X-TUID: yuMygMm5raW0

On Thu, Oct 19, 2023 at 06:56:39PM +0530, Sunil V L wrote:
> Some macros and static function related to IMSIC are defined in virt.c.
> They are required in virt-acpi-build.c. So, make them public.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c         | 25 +------------------------
>  include/hw/riscv/virt.h | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 24 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
