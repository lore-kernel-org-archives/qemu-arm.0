Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1353470lff;
        Fri, 18 Jun 2021 01:56:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaHe+8DoBnIqX1B6iSxcnb9J7+o4ZMzpCcvSJX7DUhCGm8MdzW+OPGTBn2UFHsCfJByEDh
X-Received: by 2002:a02:a810:: with SMTP id f16mr2306115jaj.64.1624006609561;
        Fri, 18 Jun 2021 01:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624006609; cv=none;
        d=google.com; s=arc-20160816;
        b=qaArQHehyIxwolARbd0mECmLYEtQNyhdpCGQDwcbFzjX9RtWBwW/1WngHoc2T+h194
         mkUVWDYFmEu9hcvI2gaKlmS4KeQGv2sMO4g0BaGcXx2sbMFEoPxve3PpauFbgwD2TOMb
         Y1GE0GjDHGTWVyCn3ksMm1k4TjlcBz0dk0si0h4z08w/LLz8Lg9y7Lgb9UuQatEHLwqv
         U9pBUZ7e9xYRWHrQvRNYzU3S/4Gr+fjA+3F5FjrfMFNdqDUUrHuPfVNWVuN19eOA9Llz
         FYpFxW7xZ68DtomPUzHoWx3SXffNhJnsq7ihFOzvLiWn46HTdVsHaORRuH3PXWF1GbFQ
         HkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UHul0/vhPHafot993zQC1qDG7KnvfosLyiUNT9RTcO8=;
        b=JnFo1DezG887sXtUu5GhNv055Zsigl/UwCXnIA2tewxSjQ9YfZNNhBUb2xp78mJDHR
         nxsk/v70LgePGxt+QQQAEPHYKNZMhNXDY1GhcMVpVm1CVjaXR/0N58iRHIGH9EYLSFej
         xNag6WW8r31HnwBxdx63sDTTx21+PKjQ2nJJtCwHRqUKrqm8U66EY/+nxu2PPxh1RYHG
         f8s6K2e8nrT9v8bRUK1lfI7lih1b0oSZbi6DntuR49ZxnaeXFTshBe9qRv/8OUx6zO9A
         cQ41pWMPWwu3bGJeQcOen89mSV54HOdEKj5yth/dpb48VRAq/VuYzzorl55XwTFUTL2Y
         QKCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gk99wNsl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si1843813ilu.115.2021.06.18.01.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 01:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gk99wNsl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1luAIy-00077z-UD
	for alex.bennee@linaro.org; Fri, 18 Jun 2021 04:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luAH4-00054K-Qo; Fri, 18 Jun 2021 04:54:50 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luAH3-0005VT-ED; Fri, 18 Jun 2021 04:54:50 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i94so9865675wri.4;
 Fri, 18 Jun 2021 01:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UHul0/vhPHafot993zQC1qDG7KnvfosLyiUNT9RTcO8=;
 b=Gk99wNsl6HiasRTnDTj8bVGvfDEMqQyI52dog0vEelsB+kVRVV7FH0GXcfC5QvDZxe
 vFytZs8SMc7/EkapommjiNA0cXfILcFmg8Em4p1V5kPAm22Z2t37sF4AuMRoPcCSQ6Qv
 00C2YyIwKTdF4yuHd2AZPsRkD1BliT+lEuFQRjGmkNCZxnpeXk/zKF1BsPqOv0rRpUUl
 0pS8rK3HIPzvcWo3VegK4uvpkC8BtCn4Qq9iW6Ed3+j4cNn2Yrc5GfIPF0aR0e2vL9Kq
 iXOQqZFHdtYilkyynnV+QhEhaXo7L8y67Fz+fnDRfd0A/moVwwEofkNgX1wtlZAppW8w
 Bl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UHul0/vhPHafot993zQC1qDG7KnvfosLyiUNT9RTcO8=;
 b=NX9qPCVpL7ZeRRxae2L3Cn6rrpJ0cCS9Z7vE+lvc73uDjHW37N9f8br0L3PgTv+b3p
 J4U/1fGcZlxR1Z29H5idUYULntYtS+By/pqVF9gbbBkXJdN48tF/t6mITkPyVAkL6HS/
 HoghA0VDIB+Mo2YD05aU9ZTyawyP+73XGEOkHLVMf7TIIe8NRj73weIP1ulCut3KMDst
 K+CY97K8W9OucfBWhU1tJQrHZel4mlfDJxw9MT7ZcD05n3zFrblkGYSrj1QpX5ZcWcQD
 t8zobBG4urDxJTxYqlfNKRoNgvZVnuTAiWI4ZDkLyptkjbAeSJ9pO04B9G4rwqwXWUJ5
 uiLQ==
X-Gm-Message-State: AOAM533HZwOiHN1D56m8XRv4LxCX8z4n/kaqbFdzgSo5XjRd5fwmuOL+
 s5kz3dzLrgvk2vWNMu6aeF7BSH2lpfpgJQ==
X-Received: by 2002:a05:6000:154c:: with SMTP id
 12mr10997352wry.126.1624006487001; 
 Fri, 18 Jun 2021 01:54:47 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r1sm7370814wmh.32.2021.06.18.01.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 01:54:45 -0700 (PDT)
Subject: Re: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-7-f4bug@amsat.org>
 <20210616191637.GF11196@minyard.net>
 <59fb23da-ddad-0436-6935-89712fbddf0f@amsat.org>
 <7bf42f64-b6dd-1e1d-dec9-f710cc94cb2@eik.bme.hu>
 <416b4c36-b838-a5f4-6575-74685627b9c3@amsat.org>
 <675080b9-cb1-9ee4-c515-ebd0401b302b@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3b5f989e-ba68-d60f-aa10-e793bf572257@amsat.org>
Date: Fri, 18 Jun 2021 10:54:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <675080b9-cb1-9ee4-c515-ebd0401b302b@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.254,
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
Cc: cminyard@mvista.com,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GI9RpVcg6Nfo

On 6/18/21 1:49 AM, BALATON Zoltan wrote:
> On Wed, 16 Jun 2021, Philippe Mathieu-Daudé wrote:
>> On 6/16/21 10:01 PM, BALATON Zoltan wrote:

>>> Having a send_recv in one func
>>> allowed to avoid if-else in some places like these but if you think it's
>>> better without this function at all I can work with that too. I'll have
>>> to check if these changes could break anything. At first sight I'm not
>>> sure errors are handled as before if recv fails but it was years ago I
>>> did the sm501 and ati parts and I forgot how they work so I need to
>>> check again. I'll wait for the final version of the series then and test
>>> that.
>>
>> Thanks, that would be great!
> 
> I've tried AmigaOS and MorphOS on sam460ex and mac99 with sm501 and
> ati-vga and these still work so I think the patches are OK but I did not
> test other changes to other machines so I did not give a tested-by for
> the series just some reviewed-by to patches I've verified. (Found a
> regression with AROS but that's not related to these changes.)

Thank you Zoltan for your testing!

Phil.
