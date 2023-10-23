Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1334427ejb;
        Mon, 23 Oct 2023 05:46:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjYDcLVV0TBfjKkDfTvUFIfpaCzEvUHK3R9jv7i7OypWT+FDBIwY2S8Y73NRiF7e0UahQO
X-Received: by 2002:a05:620a:2991:b0:773:e1e7:bb2d with SMTP id r17-20020a05620a299100b00773e1e7bb2dmr11131397qkp.60.1698065193028;
        Mon, 23 Oct 2023 05:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698065193; cv=none;
        d=google.com; s=arc-20160816;
        b=fKl5wHvXxEi4Aww0g07Ms6+EhUX9uoWMBTkaIidZ+Jm8/vgrdWwEeC0tlVxnzUPlwg
         EbI/HnYjqpS9Juf/IwNHRoAg7hoYW69d16epP5Ny9jFhGRFk3fazHJVn1uZsYxI+yy4v
         brFdDzMp8sl3GJ8g82AhWaR5B+pWguKc137PCzasuRhRFDQPYM6stGFmDe2N9xXl6DEV
         E3VQ6hwix0mtp2mJObhANOnL1sOsTBGFnTFbVFFWBZ8CHRBXkjP8bXvAlppFy9nRQQ/f
         hWFLRrRndmmOnCp8RVtLvRfcCNa9cYPDxF496QBgRWSveTJ5KN3EhagpwYozhBo3PqVF
         4eSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=4Y8gRXqzBvG7en2Q5FTVRQQitTaWlXEyuhthyILtZpg=;
        fh=Golw2Ah+zEhVCJQSdsZol3fNc1i7gYTinsck+6ubahE=;
        b=O30SINlrmzO2K6kU/vXKU64yrccMs+VnICkv0B9P6ETDJY/iqG/YoQA43AbgIcphKy
         7UNDi5Gw9jZRDY2AXdTVSFp64YbcA3MDXAGI8mY0TrjiQCYGCPM4pjqz48TAXzzayvHC
         NanVr1wWySMMgsMHbte8YWOhanMIPsbvleQm0cXuagA178sPsnby3fxXVNgYRGX+QIFG
         d5x24dt9r/iHS48zLkeAXBri6u0Ubt3RHl0AMzfgiJznekovdn9Op8ozO5h4hCO2sFFz
         blRkYAuaMn5sszH3q+fr4NKiNFB69/HiINiOCKTGPb420+PDh8QMKQP2mO9uO0o52ojO
         s/Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=WcibctH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020a05620a148800b007742b030641si5230703qkj.753.2023.10.23.05.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 05:46:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=WcibctH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quuKC-0000gh-PP; Mon, 23 Oct 2023 08:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuK2-0000DW-4A
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 08:46:19 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1quuK0-0003Jo-BI
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 08:46:17 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9c2a0725825so479628366b.2
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 05:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698065173; x=1698669973; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4Y8gRXqzBvG7en2Q5FTVRQQitTaWlXEyuhthyILtZpg=;
 b=WcibctH1PFxSjc6uhY3aR2OuMb8QdU0fR2dx13dPuIzAT9YkBXg1sBuGEL+VzUqUVI
 ydr8bYcHhyjzpA0GuIQIT8zk1jM5ZITJHbcoXQ43PvYC32N1wp33rfrRqrsxKPudK838
 KNRgZxZtWY9sa2U6Y4kF4Oza+G2ntQR5welAJ3AUp9vgDQTUWnmhZ0UF0ycJoWiTkO7v
 m9aW8CLVb+GNfVTO2Y/C2Gt4cG6nFv9lF719VMxuI3sDCV9bYXq6IHmRxrTHGUO+GjI7
 /wohdTenibgEwvGwffT1bs7++MDG5c3PjS8XhjPTdDJoQmP7YnV8DSvvKFtbQQXuCMw1
 13EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698065173; x=1698669973;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Y8gRXqzBvG7en2Q5FTVRQQitTaWlXEyuhthyILtZpg=;
 b=A2i+QMOUq2Hzkhabw7MO+GeytsAbKvlhycIDGrMOev8CjEHoCuMI9uqqXYTRYymiKd
 fM2Df+YMPtS67Y2agk3Pe8PKEEwbKaf4u3PQvTI8n716O7orUgLKHrmmq3JgLx+pXlUa
 GK6yCQvSm0jRsdVBZFQE3XPL1nr+ZyKeADX0Nvhl3iL19txuzAN3rrdla2orzYD8yOnD
 y7G1hS7OJmwOA1RA9rcpeP2RgmsPa1vgmV/OsW2cGGeNOFE0kedDJ0HHQTmSERQo2XvL
 /RJw0+PnSIH1ZxkJ1l0OGWfwoAcK9771Lhigf0qPYz/M13TW11e9S+03ChRLuki6W+da
 MRBw==
X-Gm-Message-State: AOJu0Ywo9+CJwFORsG0DG9QxRSyN0MXnlQcb6CZ9XyI2do+Mb91C5Dqv
 JO3HtgbPmWAnt/p2wbGrs50yQA==
X-Received: by 2002:a17:907:7ea3:b0:9c7:59d1:b2c4 with SMTP id
 qb35-20020a1709077ea300b009c759d1b2c4mr7134103ejc.64.1698065173443; 
 Mon, 23 Oct 2023 05:46:13 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 lt13-20020a170906fa8d00b009c4cb1553edsm6615814ejb.95.2023.10.23.05.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 05:46:12 -0700 (PDT)
Date: Mon, 23 Oct 2023 14:46:12 +0200
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
Subject: Re: [PATCH v3 06/12] hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
Message-ID: <20231023-438ea22b474fbb561a1cf492@orel>
References: <20231019132648.23703-1-sunilvl@ventanamicro.com>
 <20231019132648.23703-7-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019132648.23703-7-sunilvl@ventanamicro.com>
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
X-TUID: URehszyzsyEt

On Thu, Oct 19, 2023 at 06:56:42PM +0530, Sunil V L wrote:
> Add APLIC structures for each socket in the MADT when system is configured
> with APLIC as the external wired interrupt controller.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  hw/riscv/virt-acpi-build.c | 36 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
