Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1066884wrm;
        Thu, 17 Oct 2019 08:00:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNSCy8kK4/de9869wkaKORmvzQesiq+CCV24HrA+rTz3FuxJjyPOlUfdkMN6f0OAzpTMyQ
X-Received: by 2002:ac8:53cb:: with SMTP id c11mr854832qtq.162.1571324453517;
        Thu, 17 Oct 2019 08:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571324453; cv=none;
        d=google.com; s=arc-20160816;
        b=FHDTm5aurNRuQiahVTT84r2bTpJdrUILLRaqu+yCIPh1x80LcAIgMyQvN7h99dWkU4
         hKyIU5ukI5Q1zZyigYRDd3nqjxW8aYBX7wsN+aAN/GeK9sahqM/8OBPlwMqMbnlVUv1r
         sSiiQRFQrKnmE5yzht9sVSq3eOIJf2qSdE1hZFNyQeAZ/jS8PtLdANbey6n1Yz4Jc36V
         D5WVOp1JNzJ1qyWsve8LZAvRSHdK1HTB2Qr2nbjAhuYg02NTs9fJCyCdxonovoTmYVFD
         V39tJt2P6shZgp289p4DN53uwjieJuLw5ZsS3Xe1HunlqXd+xgOK2uxjfQAOp/+7qo7A
         YnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=9yQ/BR5AE5KRDQdD7zvq4OVNk5mn+Sha2hM/Ld11IEQ=;
        b=dtRWAdoRrk5WCsoePafiI0Zkf4mVMz3p3GLm+6WqdC7knjT2furC4H6E3FoTmM/tU7
         qif3V5VkzHyCyeAaTEd4jmPgFbK8wxs1dNXPXDLTOMH0ffuhgIX/BSKGwDjDxaiH5nQN
         2ati+/+g8rRteKUiXyf8syHHrpz0Q6/a10PPfb9mKDWpAG+M2yDj4fjUWGvG/7+mmzA+
         ZbLCoXudjqwyd0f1kfeq+QW2sNHx/JNwJ7E2G3wB5bg5Rsb8M+gOzcKbUyH7DO3Vy91W
         jaxGR2xvg3m9LTJj5RbilCuKBLabLNL7oreQHeNZ62HPzWG13TK6InKzQCLnae4JxCUG
         800g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jeITxR16;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t51si2561626qvt.186.2019.10.17.08.00.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 08:00:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jeITxR16;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL7Gm-0000PE-Jy
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 11:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iL6au-0005SI-R5
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:17:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iL6at-0003ns-SJ
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:17:36 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39859)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iL6at-0003nI-NR
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:17:35 -0400
Received: by mail-pf1-x443.google.com with SMTP id v4so1754260pff.6
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9yQ/BR5AE5KRDQdD7zvq4OVNk5mn+Sha2hM/Ld11IEQ=;
 b=jeITxR165kEiv1EC13+7t2DXybNHzq/I18N2PH3vo18ewiNr0tI4+tKOqHa0/0K2n/
 WtvLCHAb1ZjwwgdtQKH1F5FUWq2xplUQqW9/E8BRK7BxwacBb72Pps83rpbpM0jfHJlE
 B9koNwI/s/cvqi/+1JqTMw75P+B6HaH7EflXybkVvPDHiS6ezmL6s4NE+yQCdntJZ/j4
 hAKQpC8kCNq7p2PHtSiG97DQacbAOFy+55+ZUWugOJGYrctqmGU5x4+9V4p5USgHrzFw
 VdUYGerPpjlVqhJl59XXkKjZ4q/vbKRlQ3SCra18UpVTw8XjWKgSGhZ9n5DJU6WvLrwu
 kVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9yQ/BR5AE5KRDQdD7zvq4OVNk5mn+Sha2hM/Ld11IEQ=;
 b=iNf+bZzQ+gkqXUbSuMuvO80GEGm2jNdu3qDENpOXS5f0Rw7vhSteNnlTwo5VlI/o5x
 /Ir6+Ti2qDnLv3wTG8PYXEZVEcjrBsQyelAtC1NpNvkWk76hdDwXPH90KAAyclPze4EC
 q80PqQMp45OJbmzHLoPRIBYAJ/j1iCan9o3lUE5ogqvKLosMhV8f7k+5LJh0ZA6kp8X9
 Ju76Iph5TXRPVNeafONk6kuV7G2soVYKAG5CK9spSN9G1ogpYOWAw5p+bnPapvluxLjw
 BX2IL4te3yxxy9LbEnVDRnLQHECbRGixZjubrraosb7HCdBX7dqcjxQJerk1NEq/8cAI
 5W9A==
X-Gm-Message-State: APjAAAXUu8TjxHtBWHn2LqHigOxQB8XGAZlXY5eIXY5i4Lj7GxdYBQR4
 Aojzh0DWlktT8H61dylzVfyGrHYF7/8=
X-Received: by 2002:a17:90a:bf09:: with SMTP id c9mr4765148pjs.9.1571321854439; 
 Thu, 17 Oct 2019 07:17:34 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id s191sm2543454pgc.94.2019.10.17.07.17.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Oct 2019 07:17:33 -0700 (PDT)
Subject: Re: [PATCH] hw/timer/arm_mptimer.c: Undo accidental rename of
 arm_mptimer_init()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191017133331.5901-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6491b350-7fa3-4877-c8e3-d0e633d1bf2f@linaro.org>
Date: Thu, 17 Oct 2019 07:17:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191017133331.5901-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KpLL28BBSpKU

On 10/17/19 6:33 AM, Peter Maydell wrote:
> In commit b01422622b we did an automated rename of the ptimer_init()
> function to ptimer_init_with_bh().  Unfortunately this caught the
> unrelated arm_mptimer_init() function.  Undo that accidental
> renaming.
> 
> Fixes: b01422622b7c7293196fdaf1dbb4f495af44ecf9
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/arm_mptimer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
