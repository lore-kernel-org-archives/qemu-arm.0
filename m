Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1560528wrg;
        Sat, 8 Jun 2019 12:59:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqya0ROaxLg2NIJdXZVworwY2S/jx1pWPXAbjT0HSrwv0rucBkvdd9PMJTFbSeRfmqfaYjLe
X-Received: by 2002:ac8:17c8:: with SMTP id r8mr52822759qtk.319.1560023942413;
        Sat, 08 Jun 2019 12:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560023942; cv=none;
        d=google.com; s=arc-20160816;
        b=SbqefiAetqqa+SNg5UKfBV6nsZgksSyyaDi3wfyGrNyrykaqTYZE1R27smWCbGdKmR
         dP4nM3uqlInhOJUWsi4cFekTJ7yLi+V2Tm9CK94NgRbjWBD3Tf0FA8mLBkoDB8cHJ+Rl
         VnF9pL2V6t133aHGsY8QU4ty2y68DbajDIpqVoZCK2spdabn6g8nRwzQS3MuaUZdxGD6
         p9NHQNn+C1MRPGG8Gp+DuS/hqI7cZCKC75w3e5blkj0cpOnhhdfoe7Vm+oRY85P5TEsk
         TgCpfUlJPHhItIUnqGBr3XzWVNOhpUT6Fgs79m7bklcX55AR7vLzBlC4OKE7fcZ44OPh
         3Uyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Pfln7wd5mhIs+icRTimn2TRlsXeg5mNcQAH6+4eQP/Q=;
        b=0itLwdE7yf32VLXC04+NI9qkVopb1O5HP6d/HSZ14EIDVpkAmPtgzqESuWf2t3YIMD
         DJDJWyfvPoin2DcOvpg2RKKvQkFOzU5Yd+D51Dpbd57Rv2Zm4Lv7wOgB/o9hz7RCNrUA
         ipnySZlW/Fq18zZ/hdQwO2RI/tN90Kw/NsXZAGc8ncERW1ytSoyzTOrYMBZIskLlo7j9
         IB+Np+ERp8YuIwkj47CTJ2W83iNPLP9LNSDTw8XobrXCLsUyzKlZCtT/qL9lzO77eRrb
         dJvXp0uD5lNnlTQBFurarmDUb+R26Je7nk372o/bH3YY1HnfOUbISJNLRWy6aoHl2oJB
         SoyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q7y+PY4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p189si337841qkd.34.2019.06.08.12.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:59:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=q7y+PY4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZhUU-000723-1C
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38954)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3r-00015V-1x
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:31:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3Y-0000lc-GJ
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:31:25 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43293)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh3Y-0000jq-6y
 for qemu-arm@nongnu.org; Sat, 08 Jun 2019 15:31:12 -0400
Received: by mail-ot1-x342.google.com with SMTP id i8so4900524oth.10
 for <qemu-arm@nongnu.org>; Sat, 08 Jun 2019 12:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pfln7wd5mhIs+icRTimn2TRlsXeg5mNcQAH6+4eQP/Q=;
 b=q7y+PY4H8e/1SJK7cCYXg4Y/+Y5AYV22DupmkiCmpcywaXx1gsIQ7sTtsE9AHmznWJ
 uE1cjIH8abDDY1YcOVgrPUC4mzcHEX0VSALuiY9j7pDjn4l+wus7Vdmdze9MzlvBQ4DN
 BHotCW33FdkFJTEvUCjASLt+chRm/NtpXfFiag73zhfNFj8aBRd7+PFNFY1HaOSt2sij
 X/Mpl4zHxxnqKs2irKUo+cplDIDsoRAlaWGYkUQ7h+TdQ4VdVCWk4Popq39nPPXGpTdJ
 Ft+CYz+qT6Xu42OxvbfSZfisUkjqekQel7wxiK3k0w6BmJjqqhxV//J9Pqj7YN6Md5ny
 dVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pfln7wd5mhIs+icRTimn2TRlsXeg5mNcQAH6+4eQP/Q=;
 b=IfOnTFbVcUIC+UAKjm7vCDodtRUQr74uuEcLXmy1TTRei7qW01APfd+9TUw5PVdyaK
 qS4oAmw4csMnrqiC/DixLJ0T0ZFBX1gjwWRH8m4+z4hsva4pG/qQ/e0Gb9FTiRKuBvc0
 eoHCxlQDE45qnnfAKxKX00w02rlFZQyYKDuVFgMiBkmWajWZFmjUAe/rLVfZBaPdtpcM
 HKAk7v1wdhN/qjgCxKFcC8ts8ocWBY7E10Zik+OkA5GfcIcINutEh1gvAUZFUOu9GhPF
 me6Ka68uulSFXJknRn+XEfD6frzWoIzpHwweSePt7FiJkP6JwC4PtJbyIasl4KGUheCu
 jPiw==
X-Gm-Message-State: APjAAAWu9KZKbeNtWGfvq6aygTSRVXl1j1+jEJOE//q0khv71XDguMbm
 VIU7B9W4Uhp+8p9frVR+TQRibZJyfNXKEQ==
X-Received: by 2002:a9d:62cd:: with SMTP id z13mr13554027otk.251.1560022271172; 
 Sat, 08 Jun 2019 12:31:11 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id r200sm2062656oie.54.2019.06.08.12.31.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:31:10 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-42-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3ef5efd3-e4f9-44f0-704a-b6ef7bfea9ee@linaro.org>
Date: Sat, 8 Jun 2019 14:24:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-42-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH 41/42] target/arm: Convert float-to-integer
 VCVT insns to decodetree
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QiJL53ZJXb6K

On 6/6/19 12:46 PM, Peter Maydell wrote:
> Convert the float-to-integer VCVT instructions to decodetree.
> Since these are the last unconverted instructions, we can
> delete the old decoder structure entirely now.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c |  72 ++++++++++
>  target/arm/translate.c         | 241 +--------------------------------
>  target/arm/vfp.decode          |   6 +
>  3 files changed, 80 insertions(+), 239 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
