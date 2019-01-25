Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp856651wrt;
        Fri, 25 Jan 2019 15:35:12 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7wo9UpLNccN6nILpxSVWpcfx73wpeX7cq8Dt2ZbbifbC0PwOd/jWtjSTJTlzvkfyxi6uHb
X-Received: by 2002:adf:c846:: with SMTP id e6mr12814354wrh.243.1548459311982;
        Fri, 25 Jan 2019 15:35:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548459311; cv=none;
        d=google.com; s=arc-20160816;
        b=PtqGB+NkYxfNdcsULNqebOPGZsU2d1KYk6Q+8cA+E3SHZ8/SiR5RA13gyWxMmhp+DM
         c2EAKIH1Fsqym3asf1OfXRWH6lKZ3Ihpoj13iUCPLea0EhMAB6fanggrKGlffaBaCZaG
         zjAb9ZhmRCBt7rDKrIEYp6FlHu3g5j8VuhIm8WwedyaQ5/WXQLwrqqVmcQ3MyEKsZ/6q
         Z+4AVhTiecCnX7ZJ8A+bbiK54DSCM47Z0FkQxl9nfUoFtHiCoYjShZ9Jxtdv0u1sCvo4
         GJ8HL7x+S//d15M1uCN5h78J9FW74Y1ChS149z3Cy+epqtnh7l3l4XyQuurfpGtAI4FC
         ixiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=nnuFSL7Da0gxIBUaplvEUvWEun7pw+/FjyP2+WTbKpk=;
        b=bi1+UfzJNl7TGSCRszluU3vNCjs9Xbhe3V0WSWh8nURmJUiQ7bZ1VytcMLQx7Sbna3
         +NYqJyWoCHSftSfLaq1EY8UrHa0wFLgV3SJV8Sm98ESuvX65+UvVJabyShB58lqT01Wj
         Y66F5NcqPSJlFsbvlcWlJaRpyTqkYB2vX654u4BktNJ9nMzV297pR5ahgRrcjMljHukO
         J9rYmqsgSPSK40icJXdPlcY9PwW+DIPt6DsP5Payzy5s6eX4ShM1NYTAqa1DnRUHLvzZ
         mFZr3KWMGWIek3VJTusrj1v33j1vEUFbWsP70dbPI6ktkkmFhXc6e9Pn2Bw3luSQQ9a5
         YJEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JnLMJtNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n184si41643141wmf.91.2019.01.25.15.35.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Jan 2019 15:35:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JnLMJtNr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:52419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gnB0B-0005St-3u
	for alex.bennee@linaro.org; Fri, 25 Jan 2019 18:35:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnB01-0005QO-UD
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:35:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gnAzv-0006TO-UJ
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:34:57 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:43415)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gnAzv-0006Rp-Ia
	for qemu-arm@nongnu.org; Fri, 25 Jan 2019 18:34:55 -0500
Received: by mail-pf1-x444.google.com with SMTP id w73so5415645pfk.10
	for <qemu-arm@nongnu.org>; Fri, 25 Jan 2019 15:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=nnuFSL7Da0gxIBUaplvEUvWEun7pw+/FjyP2+WTbKpk=;
	b=JnLMJtNrzlgrSzrUaP5CvVvjd0tYd4LMZ/bRmuGqQiTPvQgx2dj1rXT3R96AQlrF70
	wVpbB45iKVuOKZpIlR5jfEv7GMNkxvtNMowaWo1jPOSY/X+p87R1cpBKXzc27TpP7eho
	syNLIIC7Cb2MJuDpd0jCbGBfq+Osva3CQ9cY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nnuFSL7Da0gxIBUaplvEUvWEun7pw+/FjyP2+WTbKpk=;
	b=gjjYviekYV0tjxkSvxR74EOuOAwopLkfnMg8oCmzNKxwSFJMMariaKJ9VcRsvRnnnA
	4LFNiFGG90BwuJHQPaOMi4H6u+4HAmqIAMCGfwmtsKQJJpHokV4xyEh/DRNcHmes+/CC
	w83/oc5yXnEVemk4Dfrg7EOk49IahvfcvgJo5az47P7KKhgDvsbyH0glcUUNuEcDL70U
	5SujQT6nzuDQU2d08zqFhsJJnatHZJRiD5GrryHSlwys+t0H6L4Hjk+a3nHzmDV7RaSK
	PIYhn11jZQkFYnnR5INxmVvZI2p4tKR/BZjHBYTlx33mdYY3sC/NW999HlJmV2HWqCjx
	dpHw==
X-Gm-Message-State: AJcUukeIj+khBJmDUQHGBD4EhAp8WO6LJm81qs9lyx8tY6KFivfms6Kz
	j8TstJGYC1TBRuSr84+AhfCuOA==
X-Received: by 2002:a62:61c3:: with SMTP id v186mr13057022pfb.55.1548459294362;
	Fri, 25 Jan 2019 15:34:54 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	d129sm52884925pfc.31.2019.01.25.15.34.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jan 2019 15:34:53 -0800 (PST)
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <1648289.tQCHxfjYn9@basile.remlab.net>
	<20190125214926.3204-2-remi@remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5a4b45fe-0ed1-ba58-c2ff-a8d3ad78e4a8@linaro.org>
Date: Fri, 25 Jan 2019 15:34:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190125214926.3204-2-remi@remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] target/arm: actually enable
 PAuth in user mode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hXxIAhR0jYjh

On 1/25/19 1:49 PM, Rémi Denis-Courmont wrote:
> From: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
> 
> This always enables IA, IB, DA and DB keys in user mode on the maximum
> CPU, in a manner that is consistent with the other CPUs. That is to say
> redefining the reset value of SCTLR_ELx registers.
> 
> Without this patch, the PAC* and AUT* instructions have no effects
> (except PACGA of course).
> 
> Signed-off-by: Remi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index e9bc461c36..148c103ca4 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -413,8 +413,8 @@ static void aarch64_max_initfn(Object *obj)
>                                  (void *)&apdb_bit, &error_fatal);
>  
>              /* Enable all PAC keys by default.  */
> -            cpu->env.cp15.sctlr_el[1] |= SCTLR_EnIA | SCTLR_EnIB;
> -            cpu->env.cp15.sctlr_el[1] |= SCTLR_EnDA | SCTLR_EnDB;
> +            cpu->reset_sctlr |= SCTLR_EnIA | SCTLR_EnIB;
> +            cpu->reset_sctlr |= SCTLR_EnDA | SCTLR_EnDB;

I just sent another patch for this:
http://lists.nongnu.org/archive/html/qemu-devel/2019-01/msg06737.html

This way is valid as well, but would also need to adjust the property callbacks
to modify reset_sctlr as well.

Peter, do you have a preference?


r~
