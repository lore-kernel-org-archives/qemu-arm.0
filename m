Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp207164eje;
        Tue, 13 Feb 2024 07:37:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXtjhKkdBfJOkmPXH1Lk69H5oqzzlDrn0iQnJGsZbvlMVuiWHyzMfIrKt3GdqCIGVAL7sqwl1kq3E8YZxQ9uxwiWm9L4APC
X-Google-Smtp-Source: AGHT+IEP7zgEPkx+M2sFzqdz8Y0qnmHxve+iG3y5apjTYgU6Obh9I0r42pDs4m4PmjF2Ig+uzWcs
X-Received: by 2002:a05:6214:224d:b0:68c:c920:b263 with SMTP id c13-20020a056214224d00b0068cc920b263mr16255549qvc.1.1707838641622;
        Tue, 13 Feb 2024 07:37:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707838641; cv=none;
        d=google.com; s=arc-20160816;
        b=KikYdFG0Y5lO430mZMk7xANs7HRZHCcKwH2GDF+fLTrz0u04ty5NgXt0X9eqAQfbgw
         FV3lqka4NviMOBwia+krgJHOw9RIKaHyzYqXhEomVGUzIEnXDRIiw2b0bRZsf/gQxvI4
         ID9WZNKshKEueGqcRmA5/EMYgqNaqYBxeWiRAbzRBAV/lpSM46DI3Tbcz0vbPBQTydww
         kkz6b8tVjQXQzt0kdb1TpYIDtOEhk//MNUIEkI12Ik9adWSh6aNYfx+EOwJP89ncaJlz
         BqDY7QRm1o4XSdqRVdVDpLkoy90kdKiZ6FFEtWr4IPvcweSF51AVXlKvhbmoW4JUqpWq
         V9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nUWmpwH/S6RGkePwrN5rWR3F0YowSCEcNgLh4WXbEww=;
        fh=PJS4IC9HdehwnIGxWhKSPSuRpk2Xo83QuqSLKm+wSo4=;
        b=NpKek+c24w/EaGYh04YBo3GNd6o8Frh/btLl4bC4tIH+q90O/heIvyBDEfmIEeI8pc
         MEdieo7RTa0Qx8kDrsEGYLzwfnvnAnoSmCtmY26UFhN6JwrIokNGBaLBA7dS2TyjMHxQ
         DPmKxRJ1OzQV2cJH5bsAGezwO1Z/raHIa8kow0pN5tcLgfVScDBY6x5RBpl7UgE24K5z
         20Ep3EQvdfAK8ouvb2NKZy9v0JKGHWeQWeisgjEJkjrooezLOP1vOHjcRceuevjPfrov
         7oJe9M/vTaE5tXVgJTu3NiNF1YUcEH6Yog+S7BpApU7ILg+hoyqOZ/IAFZVhvEB2ehBa
         stqw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DVPwi21K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCX/j1WZ4YIkeqeZOk3E+p98szeOth0KVXbaDlo2laJTNRosIsbnFfnzBKW2tcogYCOgO80Bno7YqV8tuU39KyJBFTKN4aeZ
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ed2-20020ad44ea2000000b0068ccafa97dcsi3110253qvb.245.2024.02.13.07.37.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 07:37:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DVPwi21K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZuqF-0002uW-0s; Tue, 13 Feb 2024 10:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZuqC-0002tu-IP
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 10:37:00 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZuq8-0002tT-55
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 10:36:58 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a34c5ca2537so574547466b.0
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 07:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707838614; x=1708443414; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nUWmpwH/S6RGkePwrN5rWR3F0YowSCEcNgLh4WXbEww=;
 b=DVPwi21KvIqDQNCYlCc0TPAqYVn1AMr1yZmL9Q+/Dy+2nmzBzy7mjXA6ItvdwkkKk0
 BWaRBGSYgdOhhwG5jNrwQWOK+XPe6f4nsBdYJ3emqYw1E3pBeC1g5IvW/Cg/focqc0Gp
 xkFydlfnM6BHsL1iNJ1ya3QWuXu0VQH2yCc5a3AZUf2q1SzUE2ljosAk6zpgL3hX2c4q
 xcCXQgyaBKd4/Qnev5RKQitWIn5DyGpOo8OASQd2qo4FuKeF/IB5G/oF9kB39Qa70xLF
 77ji5PKEfAGWXZKg8CUzRAIo8Z27KdAIOPYN0XURS1I88MdEdsNaQAAgzSbX2cMJszD2
 FxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707838614; x=1708443414;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nUWmpwH/S6RGkePwrN5rWR3F0YowSCEcNgLh4WXbEww=;
 b=kIKnc8jphOhdAqJH2rDbBEdy1tVTKD/kEQef3BepFeP9ydd6Tur54FAmEVJ7nsTpn8
 ORacP2aKO+R58jNA0XKxThKQWv7DrgiwSYm1aZUGGZBQYQIc5g3wH2+ZbRs0+qjyCZfy
 ogzecbYjKx4xX/8kj9i3wKFB9sYOb70Iqi0J3nfZ7jxKelezF973tC0gpONSE5LxBk34
 Pg4fPve6nTMRDe7vKoBHt6QxzesVumXmbi5arMCJeqzOnu4uvaqEkOAdImV2eAtvf4xU
 YHf8A5keNXkVkKpxP1xzELYZ2yjiMu3XWeuRvN/ZAoLveuFsNsz6FQXG1xZfbNRROSaq
 Ss5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGWlkGjhLuEf/FJl8EZDbXWfLlrk+iAys065tHWdg+1gkKApfkeDXFFnMk2fw95z54kDLruN9jJn5m6k0uIgfBnqnq
X-Gm-Message-State: AOJu0Yw1B6zDeh1rj874GqRW6+kpscGU1G78uVCJL4tLnPlNzagfqhcP
 9fwzGSYz92umJBKl02t1bi7XErWWSzQtr/nU3RCYiAoUMoon2x2HUOO4WuQSv0s=
X-Received: by 2002:a17:906:e093:b0:a3d:6f4:b5f7 with SMTP id
 gh19-20020a170906e09300b00a3d06f4b5f7mr1291214ejb.49.1707838613805; 
 Tue, 13 Feb 2024 07:36:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWquRUW6WuT4zpjpLyOmsoZ2VANDZqDgjEhkDl7fMH7XUGDYx7Au4jk0xEVEJreMBsspeaJ6CJhCw+lTEByjXfy3Nj9XOw0eo2kDgWBC9GlEdjeJ7VIHITD0iJdIrvv48Afg7S8E0SyD+9To8q1jeX1xnUX/Gx0bOlKegFeXD1C+TTwfhOKtw9rTUclChPdnT2ENkaPJ1IFVYO79ElgNXo=
Received: from [192.168.69.100] ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 un6-20020a170907cb8600b00a3cfb02c12bsm824995ejc.79.2024.02.13.07.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 07:36:53 -0800 (PST)
Message-ID: <7e7646e7-85d1-40a4-8e5e-bca2fcaa6ba5@linaro.org>
Date: Tue, 13 Feb 2024 16:36:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] hw/arm/stellaris: Add missing QOM 'SoC' parent
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
References: <20240130190317.25692-1-philmd@linaro.org>
 <20240130190317.25692-5-philmd@linaro.org>
 <CAFEAcA9V7wQr=LEvv2DYT5SabPe2H3+V2RMQPHRVZ8avrse9ww@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9V7wQr=LEvv2DYT5SabPe2H3+V2RMQPHRVZ8avrse9ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: T1sK2Z5QH+mG

On 1/2/24 17:46, Peter Maydell wrote:
> On Tue, 30 Jan 2024 at 19:03, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> QDev objects created with qdev_new() need to manually add
>> their parent relationship with object_property_add_child().
>>
>> Since we don't model the SoC, just use a QOM container.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> 
> Ah, this is where the other qdev_new() calls are sorted.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> I wonder if we should add a variant on qdev_new() that
> you can pass in the parent object to?

Yes, this is what we discussed with Markus. In order to
stop using the "/unattached" container from pre-QOM,
qdev_new() must take a QOM parent. I tried to do it but hit
some problem with some odd use in PPC or S390 (discussed
with Cédric so likely PPC, I need to go back to it).
