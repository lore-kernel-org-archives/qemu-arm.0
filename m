Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp738686ejh;
        Wed, 3 Jan 2024 13:35:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFI5+lxPMYb23dyCuso9/gkMw6sENuLC1kEij/sF/RPwlqBR/HaIbBH+5yBhkXg45ZwEZ7w
X-Received: by 2002:a05:620a:1924:b0:780:2468:34a0 with SMTP id bj36-20020a05620a192400b00780246834a0mr27978467qkb.70.1704317700623;
        Wed, 03 Jan 2024 13:35:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704317700; cv=none;
        d=google.com; s=arc-20160816;
        b=mQWNAYlNrnZPSUZ+uw/8L/Q7n/JMlFZAp1LtWI75gDHSQnD4xNi9agn6hxHhxZYLDA
         gkZQpUZ2xwqxwIr/OP8GtxOf3feVWG8CtJ6qXJ5hfsbYwTTwwin0k0xnNsRAvDbdBX/R
         d8ylFgY/aJSpb7oRSsVrRWjIAUszCnrWDSjBinZO1iS+9qeAOomsTIMwDYPaQsRuy1hg
         GV1B42pOcoq1BAmTCP6mAn5k0Kyx64wJcy4Qts3dZ+BzZ6pB+QzGtyBIKcAn+FIxADmu
         ZTSRuwADaD++PZUi1VY5vmY5o2LR1G5F51JzW07WRxe4FrGfgele9WKgfyx+tOdSKXoo
         WZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:content-disposition
         :content-transfer-encoding:mime-version:in-reply-to:references:cc
         :user-agent:date:subject:to:from:dkim-signature;
        bh=hvXSgV1uqYS4CfjbDHEhbM1pDscEkwkkiA5jLy0Or6w=;
        fh=Xz3nDSPX2nUlS9cYXVPwZNd1rfa7EbiM/uT/WIeCz7Y=;
        b=xFM78/wudoKEkCpFASxSqN3YLcHohdklPKhBiJ6bzCaT4ljm+2g5ljS4Nn1SbZww27
         CNe3Ta6uQ0K0V5gkvb5uYgUD1XAVQ5oHTzTvb1zxQDCkfkHf5GrttUWnVGDctA4fIvA9
         LYb6FgKqUFOVsQnZCe3w7odL8H3OTpSNda5bi5AJgSZoXP3UCFOjs48CmaQ8W6q5fMvs
         sOzxhXRYjruNG6RfvrR8OSegTn8/ZOr0GgrSm3oIwpja/ejwZd1aXIef0rSs8MOO9cRa
         E8R5qQZZ//of9vz3hUMVb9bYGxpP+5KNPToN5cAlTsYXqw7MvF5ZRAItIZZE2dqc0XMJ
         Bb6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fel.cvut.cz header.s=felmail header.b=OnDzy7p6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=fel.cvut.cz
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a05620a400900b00781d3cda947si5856402qko.185.2024.01.03.13.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jan 2024 13:35:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fel.cvut.cz header.s=felmail header.b=OnDzy7p6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=fel.cvut.cz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rL8sY-00086E-VM; Wed, 03 Jan 2024 16:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pisa@fel.cvut.cz>)
 id 1rL8sT-00085J-Hr; Wed, 03 Jan 2024 16:34:17 -0500
Received: from smtpx.feld.cvut.cz ([147.32.210.153] helo=smtpx.fel.cvut.cz)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <pisa@fel.cvut.cz>)
 id 1rL8sP-0005v9-ER; Wed, 03 Jan 2024 16:34:17 -0500
Received: from localhost (styx2022 [192.168.200.17])
 by smtpx.fel.cvut.cz (Postfix) with ESMTP id 8E83228F4B;
 Wed,  3 Jan 2024 22:34:06 +0100 (CET)
X-Virus-Scanned: IMAP STYX AMAVIS
Received: from smtpx.fel.cvut.cz ([192.168.200.2])
 by localhost (styx2022.feld.cvut.cz [192.168.200.17]) (amavisd-new, port 10060)
 with ESMTP id pZhiWc51jnsS; Wed,  3 Jan 2024 22:34:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fel.cvut.cz;
 s=felmail; t=1704317644;
 bh=hvXSgV1uqYS4CfjbDHEhbM1pDscEkwkkiA5jLy0Or6w=;
 h=From:To:Subject:Date:Cc:References:In-Reply-To:From;
 b=OnDzy7p62i8qeV1fggnSGaGD9B1pjThdszeok2kDpQ4OndNKuXItFQ7qG7KjsMowU
 6a0pHsSn5A3KCvrBrCmzvpi9QEteTXYNpVwdmlNp2a5igXSuiKjAKE5cgRojGAyauk
 l3o+3NuDqIAKmwkBCW0Pgd3LlifZBiY7m3FqalBGOAjgd3360ooO4eCxgC0G5aVKLv
 A0XsRD946mviAifxEzhOMlkFXpuJM0exg/xjyW2EHgdtEKzjfJwcw9eHi2afiA5UQ9
 pbo0ClG5M4tFTrG02Ync7uro3+NPPaJAB9ihMT3STlmJdQXswXPnHQce55Rk35puDp
 19J5s6DR7djXQ==
Received: from baree.pikron.com (ip-78-102-109-231.bb.vodafone.cz
 [78.102.109.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pisa)
 by smtpx.fel.cvut.cz (Postfix) with ESMTPSA id 33E5B29030;
 Wed,  3 Jan 2024 22:34:04 +0100 (CET)
From: Pavel Pisa <pisa@fel.cvut.cz>
To: Samuel Tardieu <sam@rfc1149.net>
Subject: Re: [PATCH] docs: use "buses" rather than "busses"
Date: Wed, 3 Jan 2024 22:34:12 +0100
User-Agent: KMail/1.9.10
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Vikram Garhwal <fnu.vikram@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240103172817.2197737-1-sam@rfc1149.net>
In-Reply-To: <20240103172817.2197737-1-sam@rfc1149.net>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202401032234.12134.pisa@fel.cvut.cz>
Received-SPF: pass client-ip=147.32.210.153; envelope-from=pisa@fel.cvut.cz;
 helo=smtpx.fel.cvut.cz
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, NICE_REPLY_A=-1.771, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7xW6e/ms5fhw

On Wednesday 03 of January 2024 18:28:17 Samuel Tardieu wrote:
> If "busses" might be encountered as a plural of "bus" (5 instances),
> the correct spelling is "buses" (26 instances). Fixing those 5
> instances makes the doc more consistent.
>
> Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
Reviewed-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>

PS: there is waiting my previous CAN FIX from December 14
and I have received any feedback if it will be taken
by somebody with commit rights

  https://gitlab.com/qemu-project/qemu/-/issues/2028
  https://patchew.org/QEMU/20231214104623.31147-1-pisa@fel.cvut.cz/

Should I resend it?
