Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2963490njc;
        Tue, 5 Nov 2024 08:56:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUmkDc9LJMvRU7XooyONLveVJi/sXqQ9HbqJ62m0hXtPaD3DxxbQ9onknneyWUsTNRXjs8cVsLtON+gZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEUYIjf0DdDrwS/SQwJ6Iqh3YOcACVLU8Vs+BhUGaLBif3mPitOB7BbXDCm4Ob+eogFAJqc
X-Received: by 2002:a05:620a:4623:b0:7af:c856:820 with SMTP id af79cd13be357-7b193f3e0b8mr5220209985a.46.1730825772755;
        Tue, 05 Nov 2024 08:56:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730825772; cv=none;
        d=google.com; s=arc-20240605;
        b=gPj7l2SXFTMq+Zea8LJ+cWAyGFsITvVwL9NVk8mxvbym3lkmXl+v1iZA3iK5SzkRcj
         yb9y/xHjfqvy/vlP3JWZ5hZE0zWNFsdWWUNXGwfCZNvoZ7bx7LEEEkDOPueVeE+RPxQ6
         1eWNRveFBFIPpL7oyJn3iiizWdhwkF4y8IKRTjU6L60Jd9Q4H6h1w62NxyNr+o/aQOL0
         HakW3rheYPohdz3Wr92f2tIzRPUi4un4BpK2r6giBDcj37v9QumRnPnr2PmHgsj0FjOx
         Ev+dUEeh3Nj+0wWoBNspgSW4TmN6gZSqFlthZhFJro9QQBggWJcQ1Wv6F2GgnnhSd5QW
         rhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:date:dkim-signature;
        bh=7CKjqAyN4II26sBBzl0STl1rV2DP/sxxmN7LCkahJfY=;
        fh=vDt2tAnSauL46jd9IHShjTjOSYwG1bOsam4bHq/qpFQ=;
        b=hICru6LKeAOs3n47kPsN1OwDqbJtTYqNBgjsVfl39WThC8gkhkv92BfexWw86g/msu
         YHNnPJwvqK3n8oaGgDK3cH0atu0ltLg/584rZevKV0M6ktCYXn3VBb7a+NXufCmBHDfc
         EwzJdLNXQa8zczPvTptXqwfDF2M0I9RZgzNIr06gJ945jh+6qqFk6WOfHEBvL154Vu7W
         bMOY+Su3masXIfYq5136u3DoXj6Zdm2qlz50fl2tkA0yinMkt/UY1kFfWbfr+DI/P/2L
         LV+j8qJaupjbJBjLWaS1EyNuGrIytsCYw3Y/L4hpZwzC3bAefU4ygTX38mkugUWvWrvG
         /Ozw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=FZY5gwTw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a81158si1574511385a.288.2024.11.05.08.56.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 08:56:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=FZY5gwTw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t8Mqf-00040S-1U; Tue, 05 Nov 2024 11:56:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8MqV-0003sE-Pf; Tue, 05 Nov 2024 11:56:00 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8MqU-0005Hm-6o; Tue, 05 Nov 2024 11:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=7CKjqAyN4II26sBBzl0STl1rV2DP/sxxmN7LCkahJfY=; b=FZY5gwTwy3aeyqJ
 7BdapXVubL4unqbwWnj9r39Os5fGAiw54+I7fN7bioOyCw5/g6WJU/o/mICXE2eY7vejS8irfG7tn
 kmSsm5ZU+N2Ew2X/dmRk1SD3M/rcIi+diVBns+egIc87sacrHs0BQ9sbqLLP3RP7RTeZad6Bl/vDP
 Gg=;
Date: Tue, 5 Nov 2024 17:58:42 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 10/19] hw/timer/xilinx_timer: Only expect big-endian
 accesses
Message-ID: <3o2ikzpqgx6m3tdpyx6pz46dddzq3xw75ptpickzrmo6qbnwgv@m6mcmtg457tg>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-11-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105130431.22564-11-philmd@linaro.org>
Received-SPF: pass client-ip=94.130.142.21; envelope-from=anjo@rev.ng;
 helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8qwcudy6pl/1

On 05/11/24, Philippe Mathieu-Daudé wrote:
> Per the datasheet (reference added in file header, p.10):
> 'Register Data Types and Organization':
> 
>   "The XPS Timer/Counter registers are organized as big-endian data."
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/timer/xilinx_timer.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>
