Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1120548wrm;
        Wed, 9 Oct 2019 09:07:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxPotv2oHwcxmMzC73QjpsjM44T2vSuDMoW7RSzfI7fmb626z2HK/3NnPajkmMwwTeoSgou
X-Received: by 2002:ad4:4348:: with SMTP id q8mr4641077qvs.68.1570637253311;
        Wed, 09 Oct 2019 09:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570637253; cv=none;
        d=google.com; s=arc-20160816;
        b=y6nNXgGWWTHD0HMC6BS8D0pQ7balhP1kNwQ8x9E8KeVx0OjoJDph5IJaFt5cBPxc2P
         1yXWa4IlykqWL7wBKBdAKhrr5nD9rHVcTgtRG7K9GgNpH4fMG5Cjliy911euVnmfBf9A
         lNW/GpbG9Y/eIirJ7yuX6IOSS4RT51aY0gjw95wg4g8uiZuS0X1A1/c40JBQbT9IFOba
         +imUYISy8w4urCdYz7eD//Ft94Wr1abpIQLe8dN1cN5h3E0Ot3yNRALJNlW0EHHRael0
         kNN47molswNDGAIijLbFFAG8dgtefUV7r6gmU/5kqBBACjtYaJGgaqTR6VaCBkHKg8UN
         lgVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=AI0lxvpzeyqMF1mskEdwNMTJzL8izBhG4L+cQezg9dI=;
        b=ZePWTEa6DCShGzY7I44l/EAhjVSN8/gGzt80n3xrPgdFUtogc8kn7hVJnFIMcR5Akf
         l7mG1GBxpOZTwrnO7zRr5j/N/A9WiDbZmHoZh0RSDk3535KuXBtcEDpXNh97MaZHVtIQ
         0DZYBJ6CHTa1KkdGm5LJaLnKwlyW+I+E491bitbaz01x8731pMUhMGTMaSjtpJ5Jilpv
         y4qzYyiJjCHcfl98h4FTDa0HnfbbVw6XWbGRdIyymt31ExWisQzVU4tVeiCDy+qXqOAI
         b3xJQE0pcnwCAlGikuSBPneg5FGz2jxEr1SAu4G01YioCn0pwPCJzI7/Ce0IW/ia3a1a
         AizA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E0LyCXla;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k28si2450674qta.163.2019.10.09.09.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 09:07:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=E0LyCXla;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIEUu-0005p1-Me
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 12:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1ti-0001lf-Pt
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:40:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1B1-0000i5-CJ
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:54:08 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:36351)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1B1-0000hQ-6a
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:54:07 -0400
Received: by mail-yw1-xc42.google.com with SMTP id x64so238420ywg.3
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 18:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AI0lxvpzeyqMF1mskEdwNMTJzL8izBhG4L+cQezg9dI=;
 b=E0LyCXlaVp/9ErF5z41zmZJ3NtgBNT3nd8aH4RpdU2sdu/+cWTELLvPWzvH5c2cliQ
 AcciRjl2K0MoAipgfHZPmyBtfFuhpo7AMoDJ7e9VUT5hmN3wz6UVvTdbUOgHeKtEN7nY
 W2rU+rwnxDoySZpDskrC/y+nm7IF0lZQr6T6EXpwpC5z9DOh/6hIeMHn+sYoBuofHXrk
 1itBRapx06gWERJWrENxF1BK2HWPs2gtk8vQTQ94+47vHF7TE81TMc9tPdS0+OUl19R2
 MgeL3pdRIfboxY2kJVCk5v8R4MCSE/W3D/5YosXx/R+E2uhF2ACFJ9yz6Qkho91BKcky
 1qXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AI0lxvpzeyqMF1mskEdwNMTJzL8izBhG4L+cQezg9dI=;
 b=iGlz0LM79XIIBq48+7kO4o7KRDh2ps8gBBtDiiwDbicukfyCU70EuQAV7AJyVuvWVE
 AjH30wCIXfLYKvUp85Qyo43qqQuJUCCAQlxx2Y0zJYkiQh/VhZLDVwUjyjSeD9Esh8M7
 Im8e0v37PQDtNV+pCxEbgOh/H2CT4z9vT9jAm+rl6easbLhrsO/uuy420sGc5FiQfszQ
 kzUYSnGK/M/rqIqVSxXl4lQbzt8V4SlQcV9N32iRgildYIbTOGddVB+ZRoPXEcBt0fQM
 yG2HKlezwRcxCzfL4Xd/JCYYCstCpMNLYiVaDBTkzfl9QYy80phGEDLwaT/b/ZxOTCPA
 6IqQ==
X-Gm-Message-State: APjAAAUhH83pkNRfWdUd0BrtMbUaH4JMIbVYcR6M8XnMisQzkWIhFMzx
 PaEADDYFkq+TWBUeO1ruQLO0Jjm3jZ4=
X-Received: by 2002:a0d:d98e:: with SMTP id b136mr1064631ywe.78.1570586046513; 
 Tue, 08 Oct 2019 18:54:06 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id k6sm202373ywh.60.2019.10.08.18.54.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:54:05 -0700 (PDT)
Subject: Re: [PATCH v2 10/21] hw/timer/digic-timer.c: Switch to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <25488035-58a7-25d5-d021-f25f7e144b01@linaro.org>
Date: Tue, 8 Oct 2019 21:53:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QzRMTFodpcIX

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the digic-timer.c code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/digic-timer.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
