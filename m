Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp433833ejb;
        Sun, 17 Mar 2024 22:25:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVAOMrOlkAh98LMoxAJFS9gfju79Km4b+P9fvQ72RW1EQzMFDFlwBSQ55hu78ffOyyqqTNV+DPDlPUWSY0rYrUmnidViYA1
X-Google-Smtp-Source: AGHT+IHWOCLhR9ar21g/DwubQB6IZDeSpWEGQl/MAFRZgxo67l40Z29CJQxdKfoQ6ca5cVplz4rJ
X-Received: by 2002:a05:620a:2915:b0:78a:3f1:3145 with SMTP id m21-20020a05620a291500b0078a03f13145mr1335159qkp.4.1710739521159;
        Sun, 17 Mar 2024 22:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710739521; cv=none;
        d=google.com; s=arc-20160816;
        b=h35j/6EtX2bVAhG5HmBYyXaDzId2qaaPE5gYlPxiHtzyXpLzhlqt8jo4AkCt4fE0Gt
         zdBa3zwQkTMqGyBeijRVSoU+upkEOS/Ervz6B6vMPt8/2yrh8Us48g2FZUDdyCKH/Lei
         UkXVZyfM2yqTBAXws3JUlh4GC9kFUGXsolGS+u0uMczDu+2gYir9or0YQh5Hk6hqXOZt
         VnduI7UYPMQTFXEObBSXdo+QIwtXOx74yHlR39/Wbl06I6IqtPelm7MR36TIRJQQgcZi
         W1z87zF+4zCbJabPjrxhmmIvWiN1CB/v9UCPa8iYSEifOixR7UMKCTTpgeQ4QIuT8bYP
         ZyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=gbmky9YQX20wzO2zy9DbboVLxpylBJOz7L0pS5TRiMo=;
        fh=2sBl/JL7jQ45Qz8AcT/fRItpYYiB4NUweZ5cD5ZxT0I=;
        b=cSPEyexthuWNlyYDUtt00ovRBB4m1icFNm+8lelrWUQiSy5pHeX/TdonyFXSyBGOV+
         M5hfvkx+60QXqLJ4GfH98PxcLzWoelZZot4cARuRp753n6VvmFrwaaMH0+0lZjeNesQK
         zcGUEneIDFzxGycy2A4htx7aXWQb3wxdeBvWFQKfCG8RWKWqpVYPpdbjzLPGJLZXzm5R
         96BfAe3ALy1kZbrkW0t8GHzIvyeMSG4MUXtHNcsLs082H66KrEOrOagjal9gQa5hMnwe
         TF4P/mT07m8LqiwBrMG7ffi67xcGqYvaUfRJNWLLT078GY5F5Gk93d1gMvaagCWrEe3L
         V1Ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=MoBs10Gc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de38-20020a05620a372600b00789c69aab5fsi9295069qkb.15.2024.03.17.22.25.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Mar 2024 22:25:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=MoBs10Gc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rm5UH-0002qq-Ku; Mon, 18 Mar 2024 01:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rm5UG-0002qa-Gt
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 01:24:40 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rm5UE-0002TY-P9
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 01:24:40 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6e6b22af648so3612604b3a.0
 for <qemu-arm@nongnu.org>; Sun, 17 Mar 2024 22:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710739476; x=1711344276; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gbmky9YQX20wzO2zy9DbboVLxpylBJOz7L0pS5TRiMo=;
 b=MoBs10Gc9cgbqIPAhz1O5+DNVFETYeG9Hqy3TCQH2Cp8xLbTAFDMWE5JH+M1hgRZFN
 cLFERKNXgfvVFCAiI43BXUjK/LumURT193muNpNhF3KTgIrnbtwe4VBBCivQq0jH1Pom
 YOBoHY724/aKHTS/BJkCIPQvjCFG2fvPwWpZkHFF9TmGoczz6Yb2iTMsXvQ6g19R31Y3
 gcZNPOKxFJc/8WYR71bEy7snMMplVcYDDY048wVrHL55i1BWtdP6X2aXwymmCvweNeqG
 eILEqGjZqXR74ELIvmvrnhjdmaroxZyZnOTgxpRO9BrFgCXVAnsbRd5bFzwO1jVMyMAN
 L0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710739476; x=1711344276;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gbmky9YQX20wzO2zy9DbboVLxpylBJOz7L0pS5TRiMo=;
 b=imXefBrWdSRnGrZhWsPdA6978VA26SvQJhSI63lrEh3PPV6BLR+BRLy1969XXTzS4N
 90+6jj69ziuW37xJ4NKXM8nskmvQUR7iOd65n4Iabz3MCNDJyiAMDygqatHkTnIPQ2qe
 Iej/Ps4BximCu3elc9Gfb8Z+CRHc2PU0+61unMM1hHRcwMMfnaSYWGKUT7XxptRYwUQw
 PFvHcudRl/mHCFE2n6R/Wh9Kr/eNBkR6xaTET4H+fT/Kr5+jKBFckRXGWrG8/gx0HsZz
 JaUSWd76FM2m+d0hb6GoHOy1SQ5TMYf2b3GzQMbQ3a3VYqgx7ZsJ9tb+pU5tGuXvoKyu
 o8Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQy37m+bScqFDcTnIH+sd9YTtHxz+/u5KcuXZdGjVZWbnes4qIjon4sfPZOHoAqmWx5qj7MZML0kDJSpm3t8SNRwZ8
X-Gm-Message-State: AOJu0YwRAVw2IL33xB4T+p5OBUXPiDIPaWBdXv4q8zsoIMeQp64zZiNw
 BOWpJrZL8RRmnyXIq0VpS7g1h/yxGrBdkbGO5zzRb3V8xIS32DdJTzdc3U2P3J8=
X-Received: by 2002:a05:6a20:9f08:b0:1a3:4e27:c8d1 with SMTP id
 mk8-20020a056a209f0800b001a34e27c8d1mr11646112pzb.25.1710739476552; 
 Sun, 17 Mar 2024 22:24:36 -0700 (PDT)
Received: from sunil-laptop ([106.51.185.90]) by smtp.gmail.com with ESMTPSA id
 p17-20020a635b11000000b005dcbb855530sm6250879pgb.76.2024.03.17.22.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 22:24:35 -0700 (PDT)
Date: Mon, 18 Mar 2024 10:54:28 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Haibo1 Xu <haibo1.xu@intel.com>
Subject: Re: [PATCH 01/12] roms/edk2-build.py: Add --module support
Message-ID: <ZffQDBsJ5Sou2Ixj@sunil-laptop>
References: <20240315130519.2378765-1-sunilvl@ventanamicro.com>
 <20240315130519.2378765-2-sunilvl@ventanamicro.com>
 <nvi45kbmhbzrlapysvpy7srgdzw62we5ijhxgrxpfp4m27ji67@6eftbkcku4fq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nvi45kbmhbzrlapysvpy7srgdzw62we5ijhxgrxpfp4m27ji67@6eftbkcku4fq>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x435.google.com
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
X-TUID: aA+U7V+Wcpwr

On Fri, Mar 15, 2024 at 03:13:44PM +0100, Gerd Hoffmann wrote:
> On Fri, Mar 15, 2024 at 06:35:08PM +0530, Sunil V L wrote:
> > UefiTestToolsPkg which should use edk2-build.py needs --module parameter
> > support. Add this optional parameter handling.
> 
> I don't think this is needed.  By default everything listed in
> [Components] should be built, which is just that one module we
> have ;)
> 
Ahh yes. Makes sense. Let me remove this in next revision of the series.

Thanks!
Sunil
