Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp794020ejk;
        Tue, 30 Jan 2024 04:51:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYqdoL0ERxSIwAxKvF2JCFTjDs5PnqbeFuKN6lM54dvH0ef7e1L0ce1mYpznBnCLtzGJ/G
X-Received: by 2002:a05:6214:1c09:b0:685:8ac0:c027 with SMTP id u9-20020a0562141c0900b006858ac0c027mr10613890qvc.23.1706619063846;
        Tue, 30 Jan 2024 04:51:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706619063; cv=none;
        d=google.com; s=arc-20160816;
        b=S7D8oCZSIyJ6Go3/g9IINDZTe9xDIVj+7NxfA2PfDtIWQHJzYnxhXXAD1J/F/AQUt1
         P0tgFApVM6p5Vbkn0SOOdBFM/dz4Pq3WeenCIlBXfACmKcbx7d2bFFtQcL/YYXFHNOYe
         QuiZrjv7qHJ7fMqDsPyUAGXQnhcIQ1CI1KwzDPzseNvIzC8DlvI7gkt8u4Zmg+66Mhhs
         wSwvR3muxoP71HAsGamvwxvfkPBBbzbl1y1waWnY4rMcWNXdYQHekFKHO3FC12AHOQEv
         YbIdp0vnAlIb6LI8YMBessZT35AAGvCY0qrV3Z7LgQhk0jztdT+emw7An+ZVLu++HnGB
         EzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=FErAMGRMo5n3bVgxQ4ZhDOcJETw4leepzAnCBEurNTU=;
        fh=XdrxNhSwE97/SCE/b4FZQxkKeHz4BBF3FpjsyNpCvSo=;
        b=OfEsvRLXkmTMgoab8QI7RQHoWPQU0PrxAgtbYa8M7NxCCQPsIYbzDsXg6naIuX4Pm9
         zCfy2EVhfLRVpVC+7zq2lOJgWymO3Wv7luWDWYcLvEFliJqzeBr/U0Qifg5wl6ipE4WK
         w06zXJE0eJHtS0Az+L8wGlY2R4Mc583snaZBi7/M2WvvqB48x+i4a1hxwosEjdzjGa4C
         pWKxnaxMl6ta0WPz+YCO5SEsY/DwNaxmqaX+Cb5+FWRbJQJ+bvrSLRAcWcjEg/IREKLw
         Q0+RDRsbncS5HBSFWzKU+QRI2NhEAkcezKkiB3U7DBpixe5UMYgtUYiFTDRH/LPDMbX+
         0kXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=gH7Lt52H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz9-20020a0562140e6900b0068464b15882si10066687qvb.324.2024.01.30.04.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 04:51:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=gH7Lt52H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUnZa-0004xV-Sl; Tue, 30 Jan 2024 07:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rUnZZ-0004xA-G1
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 07:50:41 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rUnZX-0005Ly-EX
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 07:50:41 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a354fc17f24so333207566b.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 04:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1706619037; x=1707223837; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FErAMGRMo5n3bVgxQ4ZhDOcJETw4leepzAnCBEurNTU=;
 b=gH7Lt52H6Ryl1gKj5m/52nhBG/L3miSW0bHQvM//FEDH3nUCyRQfQAD+kjZOOI7BoJ
 1egP+RclC9bf0gssMB9eoYfTTigpyuDuOIL2LcpECPO4KRovLFEmtpBG3lXZLx08Tyc8
 y+2/vgj0nNK9kS5p+2SI/ZprwNeCHkuTOiEXXkXbh4nROTa8RIs4mH4CCFbWHOOZVATh
 Ge7rXGTSDJB4boALOUInENKEL7HzYsMyK1RHPqJfbNOlm76HBsrdpqmv/Cj21Xr4Co+9
 jda69Nx3SPPeeY0MB5oYuBwIOOnwElCEi+YNd5o096Jch0Pe11BtwdgKj9IE8SRYS+EE
 s25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706619037; x=1707223837;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FErAMGRMo5n3bVgxQ4ZhDOcJETw4leepzAnCBEurNTU=;
 b=foXuhGdRBal5HCgCQYtXEo7XHd/qqt2M33195AG4SMGipWFpzTkGKEsbCaJ9zG+yNn
 Fy3/XrdoA0Xt1mI2OBvaGDUejpXQrSLFQIkLj+/3mHJRGbNvdahuSK18eGRFdJ8OhXEA
 Upy0lcBhd5cu4yk9KGjy2mZrOMTqrlr5JNIEQmbWJCx90LYHGFXD+/O4xiDW6aavYy0z
 IikScX90bfn++zMg+ss9LPEr5fIZpkkWonDqMAGfKX9I9xXcUvSthgXY4wlrdAu9geS0
 LRUWI+mYa8OJBAzfAHYUxhH2dK+0orf0Xtc0Txw08ecQ3o/ncHLeK9NsLzt16j5qPifi
 SgKQ==
X-Gm-Message-State: AOJu0YzHTGQ7biRjWdmYZfXKuZDwQFSRHWCLa+wIBHr56TUWmPIZJW1a
 t1e5swDvMEfWNy8LPrynpB3BACGyfyq6xGrnh2eyy2bfxNEa5uqIWsbgdrN3fxc=
X-Received: by 2002:a17:906:4c56:b0:a35:9414:f46f with SMTP id
 d22-20020a1709064c5600b00a359414f46fmr4731786ejw.13.1706619037398; 
 Tue, 30 Jan 2024 04:50:37 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a1709061b1200b00a2e7d1b6042sm5047658ejg.196.2024.01.30.04.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 04:50:36 -0800 (PST)
Date: Tue, 30 Jan 2024 13:50:36 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "mst@redhat.com" <mst@redhat.com>, "imammedo@redhat.com" <imammedo@redhat.com>,
 "anisinha@redhat.com" <anisinha@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, 
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "sunilvl@ventanamicro.com" <sunilvl@ventanamicro.com>, 
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>, 
 "bin.meng@windriver.com" <bin.meng@windriver.com>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>, 
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>
Subject: Re: RE: [RESEND v2 1/2] hw/arm/virt-acpi-build.c: Migrate SPCR
 creation to common location
Message-ID: <20240130-48cfb21fac247f0d535f87c9@orel>
References: <20240129021440.17640-1-jeeheng.sia@starfivetech.com>
 <20240129021440.17640-2-jeeheng.sia@starfivetech.com>
 <20240129-e51095f37656f4ba5262ec68@orel>
 <BJSPR01MB0561D2F722BBC446017856709C7DA@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BJSPR01MB0561D2F722BBC446017856709C7DA@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hXnLOIMrVeZX

On Tue, Jan 30, 2024 at 03:30:13AM +0000, JeeHeng Sia wrote:
...
> > Sharing code is good, but if we have to parametrize the entire table, then
> > we might as well keep Arm and RISCV separate. Building the table first
> > with this struct, just to have it built again with the build_append API,
> > doesn't make much sense to me. Do Arm and riscv really diverge on all
> > these parameters? If not, then just add the parameters which do diverge
> > build_scpr's arguments.
> It is kind of chicken and egg thing, I would suggest let the arch code to
> fill in the value. It doesn't make sense to change again in the future when
> both riscv and arm realized the parameters were different.
> Can arm confirm that these values wouldn't change in the future?
> > 

We can't be sure that arm nor riscv will change in the future, but we
(arm/riscv/etc. QEMU developers) control the code for both, so I don't see
a problem with only parametrizing what's necessary today and then
extending that, or completely separating, later if necessary. In any case,
I'd rather see the two completely separate from the start, than to see
the structure with all the parameters get added. There's no difference to
me when reading a list of 's->param_name = value' or a list of
build_append_int(table, value, size) /* param_name */. And, given we need
the later eventually anyway, then there's no reason for the former at all.

Thanks,
drew
