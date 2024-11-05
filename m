Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2964281njc;
        Tue, 5 Nov 2024 08:57:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX8yJEaixvz0h8aq1l1uqcFnOj+G37pwcOQLcHji+BSn7N+0UEchTyQcCzVUB7calRCDgfOq8luQYH1hw==@linaro.org
X-Google-Smtp-Source: AGHT+IHy5LxfS0iLLobUC2yz6Vk6Vrs2rI+bbhR0WTrSrXXoSIF/hEZ96i0fk4+elnoGWPfhGWH+
X-Received: by 2002:a05:620a:1a08:b0:7ac:a0a5:9bf4 with SMTP id af79cd13be357-7b193f3e02dmr5266250985a.40.1730825863445;
        Tue, 05 Nov 2024 08:57:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730825863; cv=none;
        d=google.com; s=arc-20240605;
        b=cx0sPJScpqUtS72V3Z0t/nocFASds8dm5YwET29fp3cVsmlvc+vUU1eMfslibM8bDN
         ohoVyXP5T2Oukq4SFRDoHVki3kfB+uukYr6tHZDvQT4esgvxut5kcQ32MUeWdXLXzIuS
         F2HUM0HcrzSepGQCIn4TP+dcCwmFeAlkgO7ePzQFt4lqbpxvZDKWrEiYqPqBWGtxDG7o
         Ux2z8TBcTK6jo0TnihTkzv4qrujb5aJBSaxivqvvmIjw96zcpLaGh8ROJKtP69TIcTso
         OY8Ot7j7Jz7U8tOmyg/38X9xo3RLin3z2QMJGL/crxj3cQvQmaOqAi3gbmyx+YmjsTcD
         5v8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:date:dkim-signature;
        bh=2Or6mVQUag9RKBTXaoInMsIH3fxHtaw2o9kq593LvyI=;
        fh=vDt2tAnSauL46jd9IHShjTjOSYwG1bOsam4bHq/qpFQ=;
        b=Vsky+a5tYBYtntTdkEGyUYVblqMvA2tc8wW40rHb6HsICcOocxv95pvtIjdAOopGnP
         l2x0caB1DrMskhRfPQWgq4Ir48DKxDmK3xnwetgzzvs0TxqHTdr8rf6mK5rxkrYibwEP
         /Xc/HWqomBf+CEmjADFJUQSv9TwrWjIwK7rvQtIdL7dTVxjGdeqWxi/FlMdi6BwxqmS6
         AmFKubdWZJ86wlJZBfAxhbKsgjexfg4H/9LSK0oiYRlXKhbl4aXzKDZ6Yr3RBo2IzLqF
         X8ArtVzP2C+Uu+iz2l6wa0Kbb/6n+5b5/nf40XKOXj/mGgXLAtzNSPVPsX7eZZvFzMQS
         Er5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=VTDYqOlj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f39f328csi1399104885a.124.2024.11.05.08.57.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 08:57:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@rev.ng header.s=dkim header.b=VTDYqOlj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t8Mrt-0005uz-Kz; Tue, 05 Nov 2024 11:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8Mrr-0005tz-NV; Tue, 05 Nov 2024 11:57:23 -0500
Received: from rev.ng ([94.130.142.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>)
 id 1t8Mrq-0005N9-7g; Tue, 05 Nov 2024 11:57:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
 List-Help; bh=2Or6mVQUag9RKBTXaoInMsIH3fxHtaw2o9kq593LvyI=; b=VTDYqOljhtT+zUb
 mZ7gjhml3y8vrfjpzwUCgVoPSZKnUAgYBU9Be0UnMmjOtvTOpISUH4NH7jfhC539QWPXxz/s1DIzD
 9aDhxqvblR+9qnobDWQSSpvPy2yIu8jxdKR5XQo1pWyrQvFbHVSFwQZbzVLYIKZbt5/OWoutFi75f
 t4=;
Date: Tue, 5 Nov 2024 18:00:04 +0100
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 11/19] hw/timer/xilinx_timer: Allow down to 8-bit memory
 access
Message-ID: <i27nrzceydgkzobfv3godvxfovjptmkqxq7zxucwe5adwvgegq@bii3lat4bt5d>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-12-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105130431.22564-12-philmd@linaro.org>
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
X-TUID: 3v3/3HC9c4HP

On 05/11/24, Philippe Mathieu-Daudé wrote:
> Allow down to 8-bit access, per the datasheet (reference added
> in previous commit):
> 
>  "Timer Counter registers are accessed as one of the following types:
>   • Byte (8 bits)
>   • Half word (2 bytes)
>   • Word (4 bytes)"
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/timer/xilinx_timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>
