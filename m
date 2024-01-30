Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp789496ejk;
        Tue, 30 Jan 2024 04:41:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGg8tGsw0mxQWwixIg4yPWdSeC5q7NplLTgBXIuVb3MOwB56EdtutIz7H4OxaAmaSUhRhxN
X-Received: by 2002:ae9:e014:0:b0:783:cdd0:2183 with SMTP id m20-20020ae9e014000000b00783cdd02183mr7398177qkk.4.1706618468666;
        Tue, 30 Jan 2024 04:41:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706618468; cv=none;
        d=google.com; s=arc-20160816;
        b=ksbPNTM/wd+pva/6Xltw/Wtl9umDqo/lat0s/QH2J1TmFDp1B9NrcgU5QlNjhBz4q4
         Ih/IrP+CGH8xRHq8HVuIVTvO2cHger9kkYUX2K6esRxmSQDo1rf7J5tv188cOFUn0VCG
         OVBIZNDJ4/fqaQNrA2u3c6KrXGaSwIkiLtx6YNqVBYDh3qs7fSUEFUO5VEL/wlMPcjRB
         XfNjNcayBT+qr5C+y5PorDGRwdwbzlv3Hpo++PBKfaEd+zeHWm0O20U4IenxibHtgVfW
         eDJhuXRYocvpcM7eM9fVxcUZDadmirss1MTf7EhndoWn9F0HnN80hZ6caB2sIVwuZEdo
         GXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=3xiuxMFz3OfQObhMihP2i/a0ELom1I9/fTE2cX0G9Pg=;
        fh=pqEb6ZwejTh36GlsxqTgiG9G+WtvOGZIA1hI9IKLymQ=;
        b=hkaItEaVsFvo4qX9EGRMNAb65+Wfws3dqWHn1zyB30sl7vJjl23xoUEVFcGGLdE3yY
         BMfzMcpGQXbXH+bP/bA4oqB9z2E2VtdjmgsLKKZnDrDFDsTIz2frc9BwevuxR9XssKNA
         eXE85T5FbbnQAB82+SZS4V62KgwCRSVoQ4sjz4n2hWEOZbIRTPXp5U47XSpy5KqlBL5b
         27dvF+6wY7SSH8fHlKDjuAv6kMjtxiqfoZ9KUP6xwYWqgF3bw9/MYDUaXWufOCdVN0AH
         S1VC5XGzQwXKkPdx+sORmtXTi53zik3dLH/sac3c3y1JC1pYynj3JltdIPkhmJzrfB7g
         4ckg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=m1QtG3qN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10-20020ae9e60a000000b00783922782b5si9866204qkf.571.2024.01.30.04.41.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jan 2024 04:41:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=m1QtG3qN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUnQ8-0007J3-UA; Tue, 30 Jan 2024 07:40:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rUnQ6-0007Hp-KG
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 07:40:54 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rUnQ1-0003OE-99
 for qemu-arm@nongnu.org; Tue, 30 Jan 2024 07:40:53 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a35d0764076so240382566b.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jan 2024 04:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1706618447; x=1707223247; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3xiuxMFz3OfQObhMihP2i/a0ELom1I9/fTE2cX0G9Pg=;
 b=m1QtG3qNdFPhQOBhSddb9ASJ7YjoGuzntECDZLSA+BUaNs38yir1Suh9gbTL+x6LW7
 pgqs9C0wtXoea/SbX2qRJwAljWH8qk+wSnY5ocspPDoYaZFTFg6GzccZ2lgjf3rAVJ0h
 IMUF7BNA5QZ2ChqcFpXLL5ng4m0jKq/TbHHp+D4PyqSzyj+h0WBUcvbN9wreDYBdC97d
 Ld0Syzs/wKBr0yVxIemr5O8Jf12biRJ7pWrEIHjA0odQiez7lgWFKgYf635gIKku2s+v
 9A4Q2sXe5kWPRmiOXUmCQeTJPLfY02TTZsjNF8feob8MogBneCgOaZc7brSB9Que2NnT
 LBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706618447; x=1707223247;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3xiuxMFz3OfQObhMihP2i/a0ELom1I9/fTE2cX0G9Pg=;
 b=GaSNmnIs2xWoQvwUK2GVaTXjPxpucyvGXsGa5luZlIfKe73/JF9XLKQ7MIRjAfpx3q
 WM7am8TNELsaoL1mhFrRIAYqnfYEL4TGew1IWR95X7H6xuiBlUHxgAsJTANJqIdbqFis
 TidMEoKljelEeYDV9ZB2sslAr7fbl2K/8h8gBF1Be7OgY7we+pOUvzHddO7sGz9KoCuF
 xsmqeT6otMdCHpd3XyrLkuXnwVS1UneL14UVvrDPJfCQMSMdM+YKWDaKCrqX9FbP1wdY
 Ge3VpdgOXbz6vEwnikuDEpqHKoNGQY2d8QDTGE84CpkgVvgbi5/e7V+vT23dufSP3WAu
 Lv7g==
X-Gm-Message-State: AOJu0Yxfbi9fO5Z3M2wqgjvSg3iO67zEvzf1SH7RH/MhoEW90xFuQ5Sg
 tgk3DCNW6NpWUvX3JNZ9tTF484UEBROR5O76hgaxkUiWBLkG622Qj2+miYi9SEI=
X-Received: by 2002:a17:906:d146:b0:a23:493a:d355 with SMTP id
 br6-20020a170906d14600b00a23493ad355mr6629044ejb.27.1706618447457; 
 Tue, 30 Jan 2024 04:40:47 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 vu3-20020a170907a64300b00a360ba43173sm947594ejc.99.2024.01.30.04.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 04:40:47 -0800 (PST)
Date: Tue, 30 Jan 2024 13:40:46 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Cc: Sunil V L <sunilvl@ventanamicro.com>, 
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, 
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "anisinha@redhat.com" <anisinha@redhat.com>, 
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>, 
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>, 
 "bin.meng@windriver.com" <bin.meng@windriver.com>,
 "liwei1518@gmail.com" <liwei1518@gmail.com>, 
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "zhiwei_liu@linux.alibaba.com" <zhiwei_liu@linux.alibaba.com>
Subject: Re: RE: [RESEND v2 1/2] hw/arm/virt-acpi-build.c: Migrate SPCR
 creation to common location
Message-ID: <20240130-e230d950bf57b58d52188b64@orel>
References: <20240129021440.17640-1-jeeheng.sia@starfivetech.com>
 <20240129021440.17640-2-jeeheng.sia@starfivetech.com>
 <Zbczy87+E0gJEzgw@sunil-laptop>
 <BJSPR01MB0561C2196A51F2AE79DA67C29C7DA@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BJSPR01MB0561C2196A51F2AE79DA67C29C7DA@BJSPR01MB0561.CHNPR01.prod.partner.outlook.cn>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x633.google.com
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
X-TUID: NRC2s2ulz4HZ

On Tue, Jan 30, 2024 at 03:16:34AM +0000, JeeHeng Sia wrote:
...
> > I think either there should be a comment that this supports only v2 of
> > SPCR spec or it should be able to create SPCR of any version. IMO, I
> > think it is better to add support till v4 (latest). Since consumers like
> > Linux probably doesn't support v4 yet, ARM/RISC-V can continue to create
> > v2 itself for the time being but the generic build_spcr() should be able
> > to create v4 also if the arch requires it.
> A v4 table depends on the updated acpica. I am not aware if there is a
> request from ARM to update to v4. Anyway, RISC-V BRS Spec did mentioned
> on poll-based sbi console. I can check with acpica community if updating
> table to v4 is the go otherwise I would suggest we cont stick to v2 because
> there is no compatible ACPI guest to test the code.
> > 

Generally we want to produce the oldest version which meets the
requirements in order to support the widest set of consumers.

Thanks,
drew
