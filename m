Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5060975lfr;
        Tue, 13 Apr 2021 10:08:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypm+Yk1DhpKBPw5Uk3qt20Glru5p8npBWkhfP5XzubmESK3z0W46Gq5EcOm+Con3JfEome
X-Received: by 2002:a92:cf50:: with SMTP id c16mr26684342ilr.2.1618333685340;
        Tue, 13 Apr 2021 10:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618333685; cv=none;
        d=google.com; s=arc-20160816;
        b=f8piNnYwPMa8YmOaJOL+vE7bqArle4plSlirPz7VTSuYR4gh2hyhX60aza6qe0jcqe
         NKnUpm3iANX+rKgdRygxCNGxG/J9RrVltfgplbnO6ZhwNTkppN1H79Y49B6OYU+1wdkk
         p2nC/RyeRKqHYGw/Ws7FfQ3zN682xHL6szIryRPBwQgErlDOTgtuYPKtmbpL2PYyaVwA
         uvr0nNBJi5SQIH04StrrZAKRPLLWIeISHex8SFa/OaqBLVkadOTNPc5I9PP4Sp4OTroC
         V/RvCgH3/+sbizIbEC7YSDHhMzpfOZgO7Sl9bJdMvlRb9I1CilJx+8+ET/vo1sBDP604
         zg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=1SiDznujmph2PhKe0GmO0eFLJOamtyyulZL/S6s0YWg=;
        b=cV1gbdipWrEAWpXq1kejtz2sRRJ57+07WJjWQw3OUN8/WTO3ygEUiJH2ZkGfMv24Aj
         /7Ke9zeGF4jIhRGs2ZWxlKf6LIag3F5i+UcZNXLMlxRV1awQTWFhkYf4DQvpxPP2j3MA
         NRtVUo4XVbVrdrCJSRelw183/F33rtFZ0MAD2a4K7Ynox3h+A/2FDV8hD3gcAvRvw9FO
         sxqrr5RF92+CYW0gSQyMX/KN36J7VJmIb8TYZCQ3b3kDKTHQEiYTTKTf+ckuZhABC1cL
         1/zjcoi42u4KxBYR+IvEutzoNnTkIqXpfBLSXy+uiQM1Et2nBctkuPYJ3fduKyyF8ybg
         sEtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h0GnWoja;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si16574886jap.7.2021.04.13.10.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 10:08:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h0GnWoja;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWMWC-0003dA-Hs
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 13:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMSX-0001gS-S0; Tue, 13 Apr 2021 13:04:17 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMSW-0007qN-B1; Tue, 13 Apr 2021 13:04:17 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 b136-20020a1c1b8e0000b029012c69da2040so1754618wmb.1; 
 Tue, 13 Apr 2021 10:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1SiDznujmph2PhKe0GmO0eFLJOamtyyulZL/S6s0YWg=;
 b=h0GnWojaCwyQAu+w0cMKVur22/8E25BgbQP8jNeOQ0Gt6Frx6ud1eXzShrg5Cnx84o
 qe9PodaaJtczYqdJ7FCgkR8+ergFPH9BeNh2AtHjIGtvwDbSdm9vDzedsDQh6B+N+6pk
 6krCCWOps7daXTx06njgjBOgmwPQRd0bQtM20Qx7omDKr/mo2H9LWtO4s8WPxIHhsxNc
 bE68MO8F6ZNf5uGyFf529cP10cb65+6E/fVbBjoGwa9JIaPsL3lV56/SNIyf6SQMOHh1
 6r75bYVxgmQLFQIRAKPcZLczcWrZ0sJobjlhSk2hjX9yFJeRPE2HHeWCShQwBc60pZZ5
 kNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1SiDznujmph2PhKe0GmO0eFLJOamtyyulZL/S6s0YWg=;
 b=Vw7x/XRiktxlHONVaasXIjiQa4OI2r+3F/VGaqknLA5SeJhmgOOrMP8jQ9s9sCwEbJ
 NHubYCWxnpFwEyzgi4XwvMR5ntU20Jt1c+oyrxC0lDEjyPkqZqAVUJn7gscRiRfHL+Bz
 1VbrBhaiv7Ds226JGZJy+gcH24rxJA/LfP06pp2bcDeevQ63YI2fBkB9QLE4ZKwa4eca
 IE+e7aWoCGdoKUTCMWrTOe8fRPPZcxg+gxaq164rDxXplYIDHHaa0HgEfvFzQU462zwL
 OSKfPGipwj5Rm90D4UcXbjafsBhwl2/RaIaYV8Qdv9veLB5ybFJA7ZikUD0oMSY5tF/l
 y82Q==
X-Gm-Message-State: AOAM533YXresrVLfyjWyIGoGLl5o8jkuioeFkKfv87BpCgB7+tTqcNwa
 nA68CFnQSSbM3hU53eOhRArJ0VVEq7g=
X-Received: by 2002:a05:600c:3546:: with SMTP id
 i6mr917313wmq.104.1618333448761; 
 Tue, 13 Apr 2021 10:04:08 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id r22sm3027164wmh.11.2021.04.13.10.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 10:04:08 -0700 (PDT)
Subject: Re: [PATCH 12/13] target/arm: Make functions used by translate-neon
 global
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-13-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e5b36da8-ff3a-5ef9-d169-5268ad34a449@amsat.org>
Date: Tue, 13 Apr 2021 19:04:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
X-TUID: +uls60x47fY7

On 4/13/21 6:07 PM, Peter Maydell wrote:
> Make the remaining functions needed by the translate-neon code
> global.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-a32.h |  8 ++++++++
>  target/arm/translate.c     | 10 ++--------
>  2 files changed, 10 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
