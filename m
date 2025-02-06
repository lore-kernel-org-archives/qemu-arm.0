Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1526971njb;
        Thu, 6 Feb 2025 05:16:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV/++GCS+9vIRO6okr44kgeMDXR2BiAzAuMCLU+GPBAJr2wnBHxb5z3ZXo4H7CsuB5bc4qwQyCX2/KJUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGs7b77luBRrSNP+2bv8eOVcZKSGcBj7C/HIyamgUim2B4Gnu8IA8kQtbPbzu2MtDVzNkZq
X-Received: by 2002:a05:6214:da7:b0:6e2:117d:e67 with SMTP id 6a1803df08f44-6e42fb3cdf5mr99544576d6.14.1738847795775;
        Thu, 06 Feb 2025 05:16:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738847795; cv=none;
        d=google.com; s=arc-20240605;
        b=AbuPbnDtx5BW/GY+C2T3O4a2EAhYVGFygqdi5q/svRA8cTY/wusraJfwgkLDDK+KLf
         8lH+1QMotIpeuio4J3hjhhDk7rmpmNuasMXyTGaw5PY5Y93VVB3Iq+CeAxKSISxy0IcN
         lY2i6a/CVGTcJG09pLxJJf5LJRardUZy6NdY3QHpJ9t89QZikd5MIKwa/p2QwGSlfJl2
         SucUH2zwLmlMiGM5trEoQiEioHIyPhVb9euUf75wYs7cQpICbR99gUNv/zFmeAGDaTAQ
         MXbgtMHl4BEOmdV5c3eOT5AzIGzNnEL3FQ0tSvsW4unCkd60Nb5QsIk1gPUQEB9u+YOH
         OpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iBsfRTBbili60dM4p145yHA5F02QK7y1Ngn8bKt0Bvk=;
        fh=P+ShAxXA8X6D5C8Db7ya/GfujgkUUdvffPmlo2X8UTg=;
        b=ZgM57Gn8upkjpCJiYcfpapQpXx/l2ey1xxnxaPp8wUUmQRuACYCe2qZKpxdumvGY/d
         0Cp3omXOSTJuyVBg0Qwbmozjf9bG7tNDnpSPJfWhMgPEEcPX7gKKK7IvT4kze6/kCpnr
         r3L9tBmoHO+c0fExcG3W1q5cuz1L1O889zMeDjYNGkuLzbBCnkMn+GQeer5V5H5CmG6w
         Ox6kqt896X4Z0qsxfmjGMlDXymHTyFn9lvOHLQK7B2EidzQpOFYiDhW9d7vobpDnDHil
         EjPA/PWe6KNz0Xu3ZwleVVWV/fWdg8pGvPGPSCIHz6FLN46QnQZWSd1JTcS06aWafagp
         fdWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KcHX/sFY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43ed44405si6347616d6.116.2025.02.06.05.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:16:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KcHX/sFY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg1j1-0007lc-Qz; Thu, 06 Feb 2025 08:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1if-00079W-76
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:15:03 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tg1ic-0000Cg-FF
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 08:15:00 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38daf14018eso640585f8f.1
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 05:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738847697; x=1739452497; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iBsfRTBbili60dM4p145yHA5F02QK7y1Ngn8bKt0Bvk=;
 b=KcHX/sFY9dL8Njj3VA0kYthm/kI2hB0PI/ttIfwOFmygzPfT1gFVBdPRRvjYuplCRu
 JFTdeD2Yl0n7MYJG5MozlGvdGbXmmuySQ3zv5OdQwM93FtwSW3PRJkZgH9jCKTJl49lc
 mbN3MJ0DTwI2r8fcoB6E8FrOkZkEmooMYHvGdHStaSzyLNvLcinUCZAQVzZY5kCBH7Nt
 1n6Nu18y18aLGL0+G7KfTBWhu6DPsvfaYkEjYfuODoWp3ZT7Kco1zMOI0pPVlJ9pyIwj
 q2cUN787MCsVfKe3ZZ88IZ4PoVJ81iBYg/O4jiPvgekMKlUZx1hXCpljnxu3mBaV9ZpY
 tyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738847697; x=1739452497;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iBsfRTBbili60dM4p145yHA5F02QK7y1Ngn8bKt0Bvk=;
 b=vgJYD8lVxo0WXyKeXILtm8QwseQ6M9etsK5WlWyWzf1ubRXJx1FWoR6rZAEcbpJ6l1
 aYCQjznAWWqKG/kXZR2dP87X4Kksoaa9OXi1UmeWLZENrbmMjHaJDCTohgnPsv7r0Jy2
 DuUAv/inS3W77vyFr+NOLCbxDjFObVUxqG3eGoOfvwfk9n3rnDQA0DoleQWuhwonffks
 qWDYb+Vv3lnST9mldP10ypQMICa3FeJW3jzj/P/qPf3AEJkFglPx143ssFeXQom8Cvrg
 PA7er/D11gx5ouBPb9MIJgIN5DB2bqQv+Ih1Exrzmdu404Z9o/wbTiwo81yuz3FjGClo
 pUhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2KOSxQX9eE3qyxG0B9oimgbp6jjtCQ0P7hz+trIFCDXuXbqpPQOokbzkoxnmUWBMV8fs+30pnhQ==@nongnu.org
X-Gm-Message-State: AOJu0YzGN5H/BPr1iDplbcbamNhjGn8mUT2+O0O8VpGF6NBemn9UODYl
 ukriXpx6KPlPtlwGXHOkSAExLEty11KkDKmEPTc32eVzhJlHF1OAjhfjYYFGhMNJL9D/gf9ZzMv
 IyLY=
X-Gm-Gg: ASbGncsW+vGK5mRWxCP3Sejvah3EHqvp5kQyjopBr38sP35fy1t2xs2UiX6zYFOtNMk
 bB5P152BmWGqvgQ+K9TMhZSn+BUbGc50YfHAPh4ktpJvHO5QQVsZlVVTxyFb38fpM7t72vUqGrf
 jVf3p6WBYEcx06CP3R/XGT3sWzp2h0XlWoTGzxzR0pezx1fFbWjIumtHz11oi/t9Fk5jajniOS6
 Y+V0f1fcio0RB1CCPGMt8lw+NEBKOzXui5HFaT4MsHQNlOA8hFxtKoJZ4SADndKFwd1X8YcG30+
 6Eu83cgOmhSPRqrxNs83FaXCjLgvO/Ckheua0TWKpb96awW6/LxTnYKn9/M=
X-Received: by 2002:a5d:47a9:0:b0:38d:bd82:2f9 with SMTP id
 ffacd0b85a97d-38dbd820401mr1701240f8f.43.1738847696738; 
 Thu, 06 Feb 2025 05:14:56 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde1dcc7sm1686667f8f.88.2025.02.06.05.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 05:14:56 -0800 (PST)
Message-ID: <7b3a7826-f24b-4e72-acbc-297f25d0d4dd@linaro.org>
Date: Thu, 6 Feb 2025 14:14:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] hw/boards: Remove all invalid uses of
 auto_create_sdcard=true
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P=2EBerrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-5-philmd@linaro.org> <87a5b07u1d.fsf@pond.sub.org>
 <34235ce5-9f6c-4968-a8c1-ab868389e9cf@linaro.org>
 <65a115a0-a2be-1c5f-f11a-e8b5f89c3ce4@eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <65a115a0-a2be-1c5f-f11a-e8b5f89c3ce4@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: xKeaylpjtNAT

On 6/2/25 13:56, BALATON Zoltan wrote:
> On Thu, 6 Feb 2025, Philippe Mathieu-Daudé wrote:
>> On 5/2/25 08:03, Markus Armbruster wrote:
>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>
>>>> MachineClass::auto_create_sdcard is only useful to automatically
>>>> create a SD card, attach a IF_SD block drive to it and plug the
>>>> card onto a SD bus. Only the ARM and RISCV targets use such
>>>> feature:
>>>>
>>>>   $ git grep -wl IF_SD hw | cut -d/ -f-2 | sort -u
>>>>   hw/arm
>>>>   hw/riscv
>>>>   $
>>>>
>>>> Remove all other uses.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>> Impact?
>>>
>>> As far as I can tell, this stops creation of the if=sd default drive
>>> these machines don't actually use.  Correct?
>>>
>>
>> Yes, since these machines don't expose a SD-bus, the drive can
>> not be attached and always triggers the same error:
>>
>> $ qemu-system-hppa -sd /bin/sh
>> qemu-system-hppa: -sd /bin/sh: machine type does not support 
>> if=sd,bus=0,unit=0
> 
> And how is this error improved after this series? This seems to be a 
> meaningful error already.
> 
> In any case, if you plan to merge this, could you please cut down on 
> adding nonsense defaults to every machine that are then removed again? 
> Maybe only confine it to hw/arm where most of the machines are, for the 
> rest you can point to an earlier version of the series in the cover 
> letter to show how did you end up with the list of the machines to help 
> review but the final version merged in master maybe does not have to 
> have all the temporary changes to avoid excessive churn. Or was that the 
> plan already?

No, I plan to merge v4 as is. If you disagree, feel free to post a v5;
I won't object to it, I simply spent a huge amount of time to remove
this dumb field, and there are still 6 other fields to do:

     unsigned int no_serial:1,
         no_parallel:1,
         no_floppy:1,
         no_cdrom:1,
         no_sdcard:1,
         pci_allow_0_address:1,
         legacy_fw_cfg_order:1;

Regards,

Phil.
