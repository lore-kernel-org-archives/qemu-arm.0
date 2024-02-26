Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1912727ejf;
        Mon, 26 Feb 2024 00:10:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWGGY5M3XL41peYfsfwrBTe2a1bDhBZ42rEmZZCVaom4HGOLMAdem66nqmxALzS+/M/JOKnKAsWE8xynLqxE6DvFEGdcg3a
X-Google-Smtp-Source: AGHT+IFEOBom/395Xw/toaboDL7GPz8FTJAxsxWM6YQDR3GiYxHDcZdl8adkaYPshbclua0brCvd
X-Received: by 2002:a25:838e:0:b0:dcd:59e4:620c with SMTP id t14-20020a25838e000000b00dcd59e4620cmr4404117ybk.49.1708935011349;
        Mon, 26 Feb 2024 00:10:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708935011; cv=none;
        d=google.com; s=arc-20160816;
        b=VdlqnXN7k8W8RaGWF6rZRRUYEizYG8lJInYioXKmg7jdJP2LTBk4cOmvB9RUhOq/fe
         lfze1IRJEq+XRxQvEcTRF3CD5aPCPQkFWUi/FBmM4qD87zpJudAVRypQkzTjn8PemIoG
         wdpRdWIlV4MQbZHcgM/2mRKBk3/eLJ+g7E4Djfv0p2GgBglyXUKGGH/1u3xc/tIMN7rn
         DN9GVlg7DiQtYFweaaWDhhMBJzarkrFJrckANvJ5O6xjX4kGPRfZejKUNtBSDXmCjnoo
         MKZdTBeSmzUDEFeSheR51gIgGhy76HihK5ayu5oX/u1nt7IBscVyOqPhQ7YaHfzBAfuV
         kZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6KTu94ApO0yIdxKXWWYSfCBDITcDdBmGOkZCWUjAx+I=;
        fh=v7pQ9qapABEW8NrS19F7BWo3CW5Y2GKSJYgxr3PsyWc=;
        b=O1H9lDhS4Rc59cHADKkJiaXkDx6zxt4SarOHXc799kQEAjLHBZOplOJC74NXroXC/N
         PJOX1ntTLODMgJsHU3lMAQ5El/kGyaQLrvYkOqA6omr/tDb+AvqkXjP9I9mygkyC6g1c
         cHaApph3W+b0QAeW84i/1mIGOfyDtC8NFKCOAo/myMJriiEavAIkKMvTeRLJO49mH0MU
         pBJs2mtscb4Abr9XPSVNrtF0XmyUwDX+aS1icF9OxLU6UOhVQHmAyLUPeHh560015Adi
         2CBrETTq60MMA3qa54p/phWTrvrx5s0ZKAWujocuoAH/XOvJTcdzImk/iWcl/fkgOEWg
         OS6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UgZep0yg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j23-20020ac874d7000000b0042e7dca1c1asi2646052qtr.463.2024.02.26.00.10.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 00:10:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UgZep0yg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reW3p-0000L1-Ar; Mon, 26 Feb 2024 03:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reW3m-0000F8-9R
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 03:10:02 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reW3k-0002Hv-CZ
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 03:10:02 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a3e8c1e4aa7so249860566b.2
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 00:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708934998; x=1709539798; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6KTu94ApO0yIdxKXWWYSfCBDITcDdBmGOkZCWUjAx+I=;
 b=UgZep0yg8Bj7qEqEie6C5PebADbJZmxBsFyjYc50s0NfTamzm21YU6qej1W7/2DKsr
 YjumGzJsB955dF+tDcbmDcVztQnw3PAM6upT7u4ZgV9f5Sreod6AH9uSeKc+W19zerp4
 yWmtI1sS7BJtmp+zNA8hCbwi8oHqm9a/Z9y0B/wvKjAFQpXzZIO2NB2bDZpE6UNbNBqH
 BKqIVWqZ56wsXI1elnR6nulSe7M6Ll58iGRnjvjq1dY8L3mGhd2TO7kNHhs+Dr5NXHsP
 UGn2aepPiipI2B8rocxtLJICqUw6cOTQG3qyCqcEmLwzRR1A059w0S/WXYZC696XRW14
 tyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708934998; x=1709539798;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6KTu94ApO0yIdxKXWWYSfCBDITcDdBmGOkZCWUjAx+I=;
 b=lqOgfnfxRDs1d/nolpwosb67xWg70BoknN3QguEBERvrCpnn8kAIaFqzuYeuyQ9acE
 h8YtpehYNyT8mLadzYEvD4q5qM0TpjK0Yw8NzHt/ingeQ/gtXNhgtVsRjYfJOgeNRZF4
 hzr2RJRemVVi98pGnx+cumnv7RhoaoJ7b4ZLdRCIQuuhKgNNRuKgjApIBOorjN6HU4wX
 QSdAOqAJfaUQqzoOkaO6s0GgA/NvKCEv7VTDNWbiMqJldFcd2QWhDWQvjM09d+ikoQ4M
 BjLnFNnmHTr4UYmccraWNWiMLf0YzA6uBfwyVdbecb3QiRUX+EIQWWGOh29efuBThw2p
 lxGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+9Lj5y5OvcoIYQzM7ImOxsvfOlvENPL21VOtbzwdJlGHSXkTO54flnitGOobJ6wa48K7xsYMYRUVui6t/teioptAh
X-Gm-Message-State: AOJu0YwhRb/5nhAPlLFwWT4gvh4+XvBv0B9wokFFMAgocZp47G9vLF4i
 +b0R4bUyxpVGWpi6igIJX09oHN1J7XReHC5PdGe5lHPvOMJmUDdv5AekvXSunG0=
X-Received: by 2002:a17:906:ce30:b0:a3f:bd94:4d80 with SMTP id
 sd16-20020a170906ce3000b00a3fbd944d80mr3974881ejb.76.1708934998279; 
 Mon, 26 Feb 2024 00:09:58 -0800 (PST)
Received: from [192.168.69.100] ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 tb24-20020a1709078b9800b00a42fa329ebfsm1948745ejc.54.2024.02.26.00.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:09:57 -0800 (PST)
Message-ID: <fded510c-88d9-4bbb-8a80-08898c5850b2@linaro.org>
Date: Mon, 26 Feb 2024 09:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hw/ide: Include 'ide_internal.h' from current path
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20240225171637.4709-1-philmd@linaro.org>
 <20240225171637.4709-4-philmd@linaro.org>
 <feffd329-59e0-0291-0dd6-76a625da190b@eik.bme.hu>
 <878r37lll6.fsf@pond.sub.org>
 <fd0fba89-cd93-4113-9f3d-2ee20f2217d9@linaro.org>
In-Reply-To: <fd0fba89-cd93-4113-9f3d-2ee20f2217d9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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
X-TUID: wqOryyZxhe2+

On 26/2/24 09:00, Philippe Mathieu-Daudé wrote:
> On 26/2/24 08:40, Markus Armbruster wrote:
>> BALATON Zoltan <balaton@eik.bme.hu> writes:
>>
>>> On Sun, 25 Feb 2024, Philippe Mathieu-Daudé wrote:
>>>> Rename "internal.h" as "ide_internal.h", and include
>>>
>>> Is there a convention about using underscore or dash in file names? 
>>> The headers Thomas added are using - as well as ahci-allwinner.c, 
>>> only ahci_internal.h has _ (but there are others elsewhere such as 
>>> pci_device.h). Maybe we should be consistent at least within IDE and 
>>> this series is now a good opportunity for renaming these headers to 
>>> match. But it's just a small nit, thanks for picking this up.
>>
>> This is one of the many unnecessary inconsistencies we're inflicting on
>> ourselves.
>>
>> We have more than 3600 file names containing '-', and more almost 2700
>> containing '_'.  Bizarrely, 68 of them contain both.
>>
>> I strongly prefer '_' myself.
>>
>> Zoltan is making a local consistency argument for '-'.
>>
>> Let's use '-' here.

BTW by "here" I understood "in this patch". After v3 only a single
file use '_': "ahci_internal.h", but Zoltan said he is uninterested
and doesn't care about it so I'm not renaming it.
(https://lore.kernel.org/qemu-devel/3e576d33-1973-3f44-afd1-9224609f89a6@eik.bme.hu/)

> 
> Fine, patch updated.
> 

