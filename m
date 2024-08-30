Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp269493njf;
        Fri, 30 Aug 2024 07:05:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqp0mnErWvk41i5rEBdMVSGy+idcZqL1Pi/OrkQ1pUFgFABNL3IjHM00MrF/Kb/Nrd7n4meFG2w2Y5oQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFr7I6p/HD9+YNM91OJO+gHNCmWJa8DmvCWMFKcVWeosVkM6Go/oAQ6F2OtN4pGU08lTt+U
X-Received: by 2002:a05:6512:3e06:b0:52c:dfa0:dca0 with SMTP id 2adb3069b0e04-53546ba0eabmr1468209e87.43.1725026726713;
        Fri, 30 Aug 2024 07:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725026726; cv=none;
        d=google.com; s=arc-20240605;
        b=TuTuf+15I0sg/0ymS1/q4r/94yRIq4Vi4ANMGK2ff24Xqw8XOESZ9hjAqZT5c3cg4H
         5itRnOfTUWpg3Ya4SHS7Uwp1dZzbhlysVpBxeeoVxLrPwZNXZIYaWyjO4cgZS/rmaM8b
         PBmkvtwU7BMSJgk4eK+nU3zMsjEMnWcrw+BZff/mw/i1bBwHciAU3v05tuglxpF/1jv5
         NsEbNi0aJl+Hd1bQonveE86IquncKbzwExZ8Zup0/3WbuRs9I/LaPn5yv7HSzmOPRnw1
         RJtcFmlIuQAYPzI/qWovdQrl5LG1M/N/70Hym38XBNBfKN0RsiJkgyHb/rUBZrk9CHuz
         e6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=xJrx9QWXg1ANvWnGO6gKRxZ3uy13OXLpCsnUzIBPTTE=;
        fh=bd6JYs+zsWylHr8uUdIOK32CzPUgRjMqojZbfvqbqVY=;
        b=Iza2nLLIVCX1ZOoFm/V+ae1WKNxV2x3zpVHw5vIQ+HiF7gQfzPqoV4abeHUJ5u2lhe
         WRmxFoqzgdTabcEfUisMZe/UPD3aXX86of9vnHFvq8oiduPHyz9WaLJ7aNd8aY7ENEuT
         vaKMizRW4uvx0tKSxdq5zFv1jEgZCjLSh43huLE7PM/PQ+4arsw4pSFuP4zEDCBMA4jM
         d12W2RCwPdafmIIXbpg48Moqc2xns974SUCds4QBN7i4QiTaS4Q4yjLdxQ0/73JkkGa5
         dCQiZ/8ied5TDJBZhxtQM24WQ0q/nrUdyoVPfW1AVthRq26kmc4CQgmLRuIYXDrF4bhD
         ZnLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=mEdNWMo4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2adb3069b0e04-53540829ed0si1413585e87.482.2024.08.30.07.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2024 07:05:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=mEdNWMo4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sk2FB-0002t1-6h; Fri, 30 Aug 2024 10:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sk2F9-0002kT-3c
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 10:04:51 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sk2F6-0007z6-LH
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 10:04:50 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7140ff4b1e9so1587742b3a.3
 for <qemu-arm@nongnu.org>; Fri, 30 Aug 2024 07:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1725026686; x=1725631486; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xJrx9QWXg1ANvWnGO6gKRxZ3uy13OXLpCsnUzIBPTTE=;
 b=mEdNWMo4nCW6jxo1iBHGO5bCwhyQCY/bDk4Xxvjr1qLwxsTq99gEe9gHSFGCOjooRE
 fFvVx+uJQzihMGN0aK2+VpXAZHHJ5TONfTnBe3X76ip4l/eQxcE13oZvzznbX83dfM0X
 J2QVGta/Q7hjzN1N3l0SirpTADCmVT+tMqttoaQpMBKwVImoNmdY0FQfjdgxT1OmOxMe
 0tQHdwodcE/wjau0qeAfNN9v85DT4AmWO26V0pkDQ7JuGBgTDgFswQkSL6wGwPpewl0m
 +7GZsSVEEcEPPaQd81nWhVTyzdqJV4XJEHffwwGxYivmV5VSBAzlyNk/WwWN+Ceq+fRO
 kf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725026686; x=1725631486;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJrx9QWXg1ANvWnGO6gKRxZ3uy13OXLpCsnUzIBPTTE=;
 b=wn2Uvtkad+y0CzLzEXROt/TB4dc9tLbBqJFFYQBwnH4OVb2E2j9e7qULDYIY/2kKEp
 wl8jc7vhPwCQpE77kGofTEhYZD0/DMDdjsMTA1URkBe3i2/XGdEWA9VRSZeF69IDOZmZ
 /3bEQPseKL777s+KptXSep2IXZjsSDdwJ9CsHUgWXIfCjN6+4AR7py4WpEh4tiGslzuT
 9x1C9m4qpCbzBWC/Z3CFe8UY93FqrbukLCDgpk7Sjko6RMBSW18JRTy0RTc8F5CEvWFk
 CLt7tAmo5XssCN6M35lxvs5Mh5NS7Fj8K7MWr79ATsh0Q+/B24VOofk2AZLhdhQFJ2LR
 hzng==
X-Gm-Message-State: AOJu0YymSYeBY/wbU9kKW2bMkIyAFhHSkv+Yn4cstm27Mgp4yBZ1oXfL
 X5vbeq/txNFzEndcmyV3gAVJewAzvZx8PkE5kiOUvXH6pvcL/S7LQAzWCVLCWx8=
X-Received: by 2002:a05:6a21:114d:b0:1c2:8d72:67ce with SMTP id
 adf61e73a8af0-1cce100eb8amr5749393637.15.1725026686336; 
 Fri, 30 Aug 2024 07:04:46 -0700 (PDT)
Received: from sunil-laptop ([106.51.198.16]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-715edc66743sm1770906b3a.152.2024.08.30.07.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 07:04:45 -0700 (PDT)
Date: Fri, 30 Aug 2024 19:34:37 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v5 3/3] tests/qtest/bios-tables-test: Update virt SPCR
 golden reference for RISC-V
Message-ID: <ZtHRdVVXDcHkvHBY@sunil-laptop>
References: <20240829015920.95778-1-jeeheng.sia@starfivetech.com>
 <20240829015920.95778-4-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829015920.95778-4-jeeheng.sia@starfivetech.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: VFznbr9mk4Un

On Wed, Aug 28, 2024 at 06:59:20PM -0700, Sia Jee Heng wrote:
> Update the virt SPCR golden reference file for RISC-V to accommodate the
> SPCR Table revision 4 [1], utilizing the iasl binary compiled from the
> latest ACPICA repository. The SPCR table has been modified to
> adhere to the revision 4 format [2].
> 
> [1]: https://learn.microsoft.com/en-us/windows-hardware/drivers/serports/serial-port-console-redirection-table
> [2]: https://github.com/acpica/acpica/pull/931
> 
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

Thanks!
