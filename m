Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1208360ejx;
        Wed, 30 Nov 2022 05:23:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf61iKxNpHvCIRIsiCpz1YJ7pr+XKekfYN8A1kC99amcgBLNjFiKkcLbDdmiVMB1fl4iTErh
X-Received: by 2002:ac8:4e16:0:b0:39c:c4eb:bb4d with SMTP id c22-20020ac84e16000000b0039cc4ebbb4dmr38354594qtw.551.1669814594863;
        Wed, 30 Nov 2022 05:23:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669814594; cv=none;
        d=google.com; s=arc-20160816;
        b=qOlw+JmEFknQduGkw4pwmoE7WbWuQNX2xSX0YIOQWDido9BeVJ/WscHBzVzoutfs6n
         gvdC5WU8gK+q74W5MzLn1XTDrmVZgGJjY4UgJ9UCP8BDDgIfDOzAUAxFaFPpKkikh1ft
         fpXaZjhIyvRQfgJYxC4rRgM64GLq8qf3tGY9INHPy6hUMCFNVgUro8m7P2TAHHqMNBZa
         vSBaHKitUQmJLJ9snmZ42ATQHtgqpg51JskXrPtRtGQJiNJFnbpDlq2QSY1bQSmWhSca
         XP4vVeJsYXdAbdIx3lHo26WjpEKZVyN3HoW81qpUFFADh02vUA+bMqmz5NuZcT35OUrI
         tmbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YyBsJlXPKgbwdXOi8hpcQmECv0wE69HEoUaeiwtJ5NY=;
        b=jVWnE915DZFxGYx6kxQUugpdoazTRQkRfDQiGf+jJaylCTunrxGnFJikAQIHBR6gG5
         uRMePKDLKdd6XW7NyavlUIi/lzXN6nKq2WHh4l6JLuKrZ0stVlVhMEX6O7yq1vaDp3SL
         BP4wv8pSqRvZIsqxCUB4gcgmLnWEqgd9pMTHOAV2nyzGbKhGZwJK/p+BF1atkly5MTmF
         cJXmWPGZYoxbjgw8+wInjMKmYvvegC+Xqtg7J06Riu1BDJKICVs58Hljaggme3Rvs/0B
         xkn1aLMIuzbsHN+UgreL/lRd7E0JgKZhsOqINTZCCleSOiM7hmx5GveHQhYAWujYxPZo
         SXBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lAhJiehs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey2-20020a0562140b6200b004b18caf88bbsi800267qvb.360.2022.11.30.05.23.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 05:23:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lAhJiehs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0N3D-0000Yo-1r; Wed, 30 Nov 2022 08:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N3B-0000Wa-RV
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 08:22:57 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0N39-00053k-HD
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 08:22:57 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 i81-20020a1c3b54000000b003d070274a61so950396wma.3
 for <qemu-arm@nongnu.org>; Wed, 30 Nov 2022 05:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YyBsJlXPKgbwdXOi8hpcQmECv0wE69HEoUaeiwtJ5NY=;
 b=lAhJiehstAOGlwj8dqO33Q0ZSEcnDudbvdqvNEPbBL89VCash7u/pDwvMyZHdmKkEk
 9DtFBDjio2WjiZkcPK1cBq2E4DROWBDAyNMqniaolggRDjwaDTaYBWLRRI8wdK1x/7S3
 xJ+xQ/TL/BmuzuDbSbV68btmjrMTuSbDMqCWTevZow9gSn0e6MyuOU9nkNweHwutmKEy
 nx4jM/10l86fQTWEJa34qd+EVc8jxYSlee3Oc4Ohx6LGs9trgozI3b6E8oZav9TI8R7Z
 VPjkHf53CfaRyN+sngICcXNZkcnfUcJ+Ydh5s4aOhtu/mxJYZIGG3LI8bI7bQe2i03bq
 g+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YyBsJlXPKgbwdXOi8hpcQmECv0wE69HEoUaeiwtJ5NY=;
 b=B5MrEK/UUykJUEfxxJUcrTd9wWLmK60ssX58/ryR6/J9oE2FslOd9/gTcEX9TIbUbR
 ZPoQj3rXvnHbqSAks8JgLSGmknqZXVQHhFZTNtYoU/Pg77pIZM+HsloJvtgKPv3MMEke
 oGBz6DXrYTO7Uc6flsgHjzOdNBGZL6IzF6aWwceUEl+Wa40Nic0KrsP+cUUovbY6M7i0
 yCsByF6uL35/PKNAsXOqXLY3jWjCBQSsCY/b4cCbdaIXapM5ZtNsBIvaA1v3t1Cmwz19
 gc4xBZhSuriBrC90GVnw6zG57GPJ5IeXEJtv6MKFA3YN93zH/y3DIPUdnlA50aMrCvPC
 36ZA==
X-Gm-Message-State: ANoB5plKCEeuE3IJtG7b0DkYnxsUzM8pvKoxuQoAwNzHxoAHPa8x6psn
 e+zSCnvdgBEwtsPfGczMe9ph8A==
X-Received: by 2002:a05:600c:4e50:b0:3d0:bda:f2c with SMTP id
 e16-20020a05600c4e5000b003d00bda0f2cmr32092450wmq.117.1669814573017; 
 Wed, 30 Nov 2022 05:22:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y2-20020adfdf02000000b0023657e1b980sm1547187wrl.53.2022.11.30.05.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 05:22:52 -0800 (PST)
Message-ID: <1778e96c-a3fb-2b1f-fe37-bec3e3913f29@linaro.org>
Date: Wed, 30 Nov 2022 14:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 00/19] Convert most CPU classes to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <51024464-6fd6-4181-633d-1e261c19917a@linaro.org>
 <0f9b0728-d6b5-a37b-2dcb-7b7fbee876a3@linaro.org>
 <CAFEAcA98mDNWMhT+-2rsevpXAaAUzF-PF74LJ4871yxJcAKFNA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA98mDNWMhT+-2rsevpXAaAUzF-PF74LJ4871yxJcAKFNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MypY9g69lKlC

On 30/11/22 13:38, Peter Maydell wrote:
> On Wed, 30 Nov 2022 at 10:51, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 24/11/22 14:46, Philippe Mathieu-Daudé wrote:
>>> On 24/11/22 12:50, Peter Maydell wrote:
>>>> This patchset converts the TYPE_CPU base class and most subclasses
>>>> to use 3-phase reset. (The exception is s390, which is doing
>>>> something a bit odd with its reset, so the conversion there isn't
>>>> going to be simple like these others. So I'll do that one
>>>> separately.)
>> Note, we can then remove scripts/coccinelle/cpu-reset.cocci.
> 
> What's our usual practice for out-of-date conversion coccinelle
> scripts? That particular script was "we'll never need this again"
> pretty much from the moment it was checked in, because we did
> the conversion of all the targets in one go. But it's still
> useful in some sense as a "this is an example of how to do
> this kind of change with a coccinelle script"...

The pattern I observed last years is:

  (a) If one-shot transformation, log the script in the commit
      description,

  (b) If the script can be used again in the future, commit it
      in scripts/coccinelle/,

  (c) Complex scripts are committed in scripts/coccinelle/ as
      example/reference.

I am fine keeping scripts/coccinelle/cpu-reset.cocci as an
example (c).

Regards,

Phil.
