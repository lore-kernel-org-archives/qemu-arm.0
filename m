Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2860625njc;
        Tue, 5 Nov 2024 06:31:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCaEc+U5yXOtIwo/StSUu9zHMZ2JL9TqkPFpPZ1FAeeIHTJb165exHLi7qdgGV9La6B8jVJPWk48VeyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGZ3Iezs9VRNswVc5i/nzpaafQatYwOK7hR28tjgRzvzbo1hHOltol5nZbzKLV1+bRY2XkO
X-Received: by 2002:a05:620a:199a:b0:7af:c818:bca with SMTP id af79cd13be357-7b2f253d42bmr2650113285a.46.1730817088186;
        Tue, 05 Nov 2024 06:31:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730817088; cv=none;
        d=google.com; s=arc-20240605;
        b=fsByN27VjlUkrz/jbnNdRghG7bdrAkkYg9h/4CYWMSTg2CEtEkzsYWVbd6ZyvVCkz5
         nOF9SLgw8G3sJus8mqiFxAQdOMwnFCsUPZ7D7du3iZCSVs7dBCZ9LwDKGAsNJzAFEnbT
         bmZDdekt+3Cdbp4I+us5oTLrSKUloViikjTfnIffVLHBpP8gVkq9JRvLKxs8C6mvGPFw
         q7GtfKm55TAaQCjQrGRMHM6hpgmBa2FCyhhYWeZrCDjlCTi4x/bp6Hp4Zt3uQhFa190e
         5s+P5Y+2VGuq+qESWzH+Cgy3i9mPD5ItbNrbn7ymqPw7q8WTvrUMCge35rLy+oPrth9c
         gpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:date:dkim-signature;
        bh=xUgkQN6Kjk8Oo7wjfKe06BbO8Ru7R8Y5nPOaafg6t0s=;
        fh=vDt2tAnSauL46jd9IHShjTjOSYwG1bOsam4bHq/qpFQ=;
        b=IwdCz6HYYNsp2McqJTyn2iW7v1jqobejsapCb0LsccYPviHA/NhX7lim4MICbnvQ32
         NiucVJhj2YtUGR8gArca5Ne/d6cHM9bZyc36JvcLbbWT9foRXtyArukkXyjEbNSxJnDx
         /kGka2+jpFAyqTgNI3o++2WeFVrT0BMxCk3qjDwX0eSkaGCEiM4HR5cNk0hDwWj4RW92
         V3wAg8NAr94m/8tcRDaNWbj48DxIU1qlUVIC38a+N4+c6kLNyKDHtuYVssx5Vtngm1EH
         +ruimGDtbASTFsH49nioD89Qsfa1sPqrfkE22xPmC/E076rD0pCuXAipghoVlosdMHuF
         doBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=xS+61Alc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad1f9d76si131005781cf.539.2024.11.05.06.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 06:31:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=xS+61Alc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8KaG-0004nG-G2; Tue, 05 Nov 2024 09:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8KZv-0004g5-JK; Tue, 05 Nov 2024 09:30:44 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8KZr-00064Q-U7; Tue, 05 Nov 2024 09:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=xUgkQN6Kjk8Oo7wjfKe06BbO8Ru7R8Y5nPOaafg6t0s=; b=xS+61AlcZCiGdZE
 FK7Byv6fDt7MhHhpZYKlacWnwAmaVeeLAy0KotPyMhKTkmwLZMwPKSEPs7UbDX5A66/32Zwz6QNWv
 pIVzvpLIhz9zBV/lyQveAAJGtJT8UZSEpaVBuT9QJFGGuVFSPcIXSZwnCUdDMYLysPJtFiW6RTUiR
 k8=;
Date: Tue, 5 Nov 2024 15:33:20 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 05/19] hw/microblaze/s3adsp1800: Declare machine type
 using DEFINE_TYPES macro
Message-ID: <mvi2c57x4sfdhz7sw36ilibtkobjqy2rgrvlgim4x3w5d4ru2j@3imoweft5qtd>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105130431.22564-6-philmd@linaro.org>
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nfezA7p0Q/mh

On 05/11/24, Philippe Mathieu-Daudé wrote:
> Replace DEFINE_MACHINE() by DEFINE_TYPES(), converting the
> class_init() handler.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>
