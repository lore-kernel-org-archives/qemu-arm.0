Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2855562njc;
        Tue, 5 Nov 2024 06:23:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWYgmibg1aLTmI/WQV3np95XeVLMpOvwZyEP7xVso8DLZd1YKJNVXuuZBHwwCZ/iHShntx9UYyScQubkw==@linaro.org
X-Google-Smtp-Source: AGHT+IFTGY22vvbXpYRttZhdh3vehQ0YNOnadZO6jbdQ36EgwyfJRovmVETykQLIDQkTxLrXp02X
X-Received: by 2002:a05:6122:78f:b0:50c:e37a:97e3 with SMTP id 71dfb90a1353d-510153410b0mr32989072e0c.11.1730816620325;
        Tue, 05 Nov 2024 06:23:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730816620; cv=none;
        d=google.com; s=arc-20240605;
        b=R3+ByjargUH1Ed9tgdpE/fDObcCp3dTi4sbtIFpfL9uTWRDhGyhUI0aTImRqMXsd5d
         GK5Iv9MAQbIz/vRCvwB2//UvvuSIqu95rNTHiTe5+gMiCIqc+IaT0Ruy3LrkNXQ+jPYB
         ARdRwSsjmFUuAGqa9hQnwmLF4SmN/8wuO//Ws4DF4BOVf7pxs1CDRD6kwX29fsf1m6xG
         QEDbNe3mSSr4FO9EntaSHyrc8nZJgouuLpugUdneVLdxzAq8wyZW0L5dejsgAmzKVyn/
         GUHCXeWHTUnue5c92WbL39co0dV2AbE7uvs+/uOP3qqkyaw5/GR0t6mig7bit1PaIhuC
         u9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:date:dkim-signature;
        bh=RuxCfM+YlfDMbLpOpm+1mYOYqUNipOTEde6if+b2KZo=;
        fh=vDt2tAnSauL46jd9IHShjTjOSYwG1bOsam4bHq/qpFQ=;
        b=ePzzQu41C21H+s5VL5qvW2kgjRD/Hw2vZ8LsItklPe9ASmlOSAdbnIHHD5NeQfu82w
         D6J8Si9ErsJsa7bTmREk7IUJQz01/DpFJqMBUVTtsbK4adSg/0a1a1eFCYJecmaFkSsL
         11yMfj2rvRjxbU1X8XCEy+nUgnPlNf8Cm3j5Cvo9iLkuRu4/1VWuqVWTMnKkhcRBng0n
         /jjyssmId9IxJ3/2jg0cv0/TBkOfAawnVHQUU4dtG8xSIYwiVdhqaKwJssBblDbserae
         Z0n1lOloQhOY2Cugr86ZOAO8df+GRK19BK8F5gID7xsu//XoWEw4anI25T6TAvNifdxh
         bDpQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b="c+gim/Nr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a957466279si2563995137.117.2024.11.05.06.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 06:23:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b="c+gim/Nr";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t8KSy-0005a4-V9; Tue, 05 Nov 2024 09:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8KSv-0005LV-O4; Tue, 05 Nov 2024 09:23:29 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8KSt-0004uW-TX; Tue, 05 Nov 2024 09:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=RuxCfM+YlfDMbLpOpm+1mYOYqUNipOTEde6if+b2KZo=; b=c+gim/Nr74m2aZZ
 99NiFX/eT1/Hxj3y0C1Ca+pI8oK4euIWanIe9M9z7DCPFST8kmpJLx/M/SKyqHBPYfyAGhSQicbrm
 FUVxoJymBb9VYc+CLZjX39Ext7jzc7PeBNnwhXErESeNuWNeLm8ZaeEfy2+OHT4s1yhQj8h/Owpq7
 I4=;
Date: Tue, 5 Nov 2024 15:26:11 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 04/19] hw/microblaze/s3adsp1800: Rename unimplemented
 MMIO region as xps_gpio
Message-ID: <sr3pndcb74a774mkrsbwenk4qydv3eldh6gatoj3mawuk3gfsm@uflppgrjf77s>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105130431.22564-5-philmd@linaro.org>
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
X-TUID: fjpf2Va4qmci

On 05/11/24, Philippe Mathieu-Daudé wrote:
> The machine datasheet mentions the GPIO device as 'xps_gpio'.
> Rename it accordingly to easily find its documentation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/microblaze/petalogix_s3adsp1800_mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>
