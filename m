Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3422373njk;
        Tue, 28 Jan 2025 14:46:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUJXma8U8lGY8ZvH85N//eCNYyf5fS91DqTsFKBwpBRJquoYbsa88z0QSddRdQON1aXf0FjCguyPjG5JQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFPGqgZNttLMGuPzjboFefUbNlnCJfQTMewEqq97K5yM7RHMHbEIjipxr9UsDIpKppmMJ7V
X-Received: by 2002:a05:6214:4803:b0:6d4:586:6291 with SMTP id 6a1803df08f44-6e243c380d8mr20453156d6.25.1738104398981;
        Tue, 28 Jan 2025 14:46:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738104398; cv=none;
        d=google.com; s=arc-20240605;
        b=MXH3znziNbmagY5kPiC5j8yjil7BsWDPQLoNifSRy87hRekGQlZzgoBGBwIAn/W22x
         UC5MnUmiKSFRUlaS91lGiUqE/TceFVduaqtcr0JgCgve73w28UxI0e9os8jlP9zK4GrC
         7R6hnjkHBhlmBsqpuySs0yj1DqLfinPoEancun8tAlOm5wjn1KGKTVzji7uSG+VwidHA
         APFlJwWqhNSS1yR/5hEsU3yO77+iz7FHO98p7Tvr7Gipo6tY4ZJM684AwMZe60uxtU8P
         SfWi/xM/A8ZgdxB8vKnJ3JFV3VeUxVO4cq4SxmtPgkSJElB0wfKokQ8tbM4p4xI4M9w4
         sLow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=DLSFNHO5nqNsd94i48i3pvbNb2kY6QUhBJ51gKx0hMk=;
        fh=aKtKQyTscUp0W5iH8eOz9NKRyjFG6UZbBRGWsNfr+dU=;
        b=dPMvaLefX2YRhGaBhxkSxRQPXBs9mgzV52JMlrbKhi9X4q8Hjj236m2A+OH1ZZzFIp
         lx7uOYX8qjEAV25Nqv2KnMAYqdulqajokMJj518en7hPaAKOr+G/wUDwJbyzxK6fQqjP
         1/Ox75F4z0ZSed2w+AXP6BCNieq22v2lqb3PnqsYIKMgx1DREjBesn7mIYkGcr0+esmc
         gE8LnPvlylxx++B3iCIwEU4W3AzRfAVcn2Wz92IfSsJg5tYoboCqL6yNdXnSLsX41Kea
         2g9oObAQHZZYcKwN9+L6hvQ8KnBLXBKaCdOTLBEFIB6nD+T0xXl9p2H9UJyXXzK7slh3
         bJFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IsoLP80x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e206022a89si132601386d6.413.2025.01.28.14.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 14:46:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IsoLP80x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcuLK-0001SJ-B2; Tue, 28 Jan 2025 17:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tcuLH-0001RQ-Cp; Tue, 28 Jan 2025 17:45:59 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tcuLF-0001j6-Ti; Tue, 28 Jan 2025 17:45:59 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso540025366b.1; 
 Tue, 28 Jan 2025 14:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738104355; x=1738709155; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DLSFNHO5nqNsd94i48i3pvbNb2kY6QUhBJ51gKx0hMk=;
 b=IsoLP80xSZ7QvgrY/bEB18uag096b9B3rfurA+Vl9Uqz/T1UdshLj9kB5cmaULYw5k
 du43AHOb8NyGhPC1X/SEe15sNPuwZTsmfyECHQau8oIKChW8jCyNN18540oGivdMFt0n
 up8OnhVXkP+o+7cvhAizEVpVVm5I5zQYmVaFe1stBjsp7u5K1wXjfwYFmeJlgb2ty/jM
 q99YdnaLLwgj8hCnXNtHVbFezLcc+2gOj+g173urrqw0zUcnZGPTKdOMfCZPj1pQh8LX
 wI8r63AzC85lyouiKE2bvfdeifOT0HUFuM47rzLbxeIUcQ4q5B4Ewli1Ttn7tBN0IzqX
 ke2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738104355; x=1738709155;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DLSFNHO5nqNsd94i48i3pvbNb2kY6QUhBJ51gKx0hMk=;
 b=so8u6t1/QJI+IlYnt7Sw6YADuM86fFUFD0INhJaoG/GPd9YwALRSDDfl0f0sRoSqiZ
 psft3bK8k4fhv85UMjmgpeqrBY/2jTBqt9TDaTcCF/O5cEpYEfOdSG0jTGbVa3Jpn/5J
 RnGMoWFCi4FmhDvMor/6HUkThgVq3jfSGH+ZodkKPLewaGHhS2ZlV+uavlToOhTrTpTI
 cq0dFtiIjoGb8BX7kQ2kLIZ1W+zN6EKkDiI/lMsRv9af+C0mndjYLKREvMqjqysaDjna
 nXCNhH73vf0X/DeR9HLpJ++WbWj10HgJOM/Tn64/B5rJVAl+w5+dXFlYKvtE90hnF4nw
 mBMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdc2ASIfMwny4ycBk2IEOLefQ3GoN03/mw3urDUQB8hSKK1AacOwSJHgCiqevhfklgj84+9Q8i95GciA==@nongnu.org,
 AJvYcCX1aWHR6tmdmyVqij/rYNfFVCekOiuzWMWeXyLOj9AinHDn7XyIidFg10XiBq4SaN/UD0vvf+BwwQ==@nongnu.org
X-Gm-Message-State: AOJu0YyTxhePc9Y8hp3ViUHXdG06Gt+XzwBDrMjgj3fvCcUAg+aHp5m2
 hn66d4Bi7n22ZY5K9Q3P9woCUC4DAyt/bQ0FO8ZjL6f1dJ7P5PJG
X-Gm-Gg: ASbGnct078o+Mgv5k1869pJ+3w9IJwF9eoTY/KZrD2m9ne+xMuNNPc58ySqgNLiCe+5
 UWrBmg/eOpVrum3FhNl0HO1DYebtvEGSce6vDL9KSYkewZG4jdb9gRxpQML/PONmucNFfBKmvDu
 EF6Tu6Vanc0ATJ1W1sM/0nss55PmKwH1/bfa/N318IXFYTXNOokHwhim5FMW3V49WwyaWvm7flY
 Zj6UXjq54/oDbJN02uAX65ju3OsVPq3lLuqqxI0qLsTJdZscZMtDuW0cTsgRA4IpaaD8te/StIx
 6+mEft2AZiaDmN2tEKjigh62JvOH+Ght3x2hfbwZ/hNNt8llpd+R5CQ+iZssu8Ep
X-Received: by 2002:a17:907:2ce4:b0:ab6:8fda:3bcf with SMTP id
 a640c23a62f3a-ab6cfe29ae4mr78758266b.56.1738104355362; 
 Tue, 28 Jan 2025 14:45:55 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-042-254.89.12.pool.telefonica.de.
 [89.12.42.254]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab69304d2dfsm620717866b.73.2025.01.28.14.45.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 14:45:54 -0800 (PST)
Date: Tue, 28 Jan 2025 22:45:54 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-block@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_06/13=5D_hw/sd/sd=3A_Remove?=
 =?US-ASCII?Q?_legacy_sd=5Fset=5Fcb=28=29_in_favor_of_GPIOs?=
In-Reply-To: <CAFEAcA-V1fuGeSRvEusMg-03rwBwLq4rKoVPcrW95ByzeQ3kZA@mail.gmail.com>
References: <20250111183711.2338-1-shentey@gmail.com>
 <20250111183711.2338-7-shentey@gmail.com>
 <CAFEAcA_m29rWYQPtz=xSBsS_FXb5_L6+DGBA2o_TrLcFy6YC3g@mail.gmail.com>
 <BB80F4B5-02D5-411A-95DF-9EEE91237EDB@gmail.com>
 <CAFEAcA-V1fuGeSRvEusMg-03rwBwLq4rKoVPcrW95ByzeQ3kZA@mail.gmail.com>
Message-ID: <4AEAB997-A8AD-4B91-8AEA-BF5C6BC6E9B7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: d5lMzqdOdvXz



Am 28=2E Januar 2025 10:34:23 UTC schrieb Peter Maydell <peter=2Emaydell@l=
inaro=2Eorg>:
>On Mon, 27 Jan 2025 at 23:11, Bernhard Beschow <shentey@gmail=2Ecom> wrot=
e:
>>
>>
>>
>> Am 27=2E Januar 2025 13:24:46 UTC schrieb Peter Maydell <peter=2Emaydel=
l@linaro=2Eorg>:
>> >On Sat, 11 Jan 2025 at 18:37, Bernhard Beschow <shentey@gmail=2Ecom> w=
rote:
>> >>
>> >> Commit ce5dd27534b0 "hw/sd: Remove omap2_mmc device" removed the las=
t user of
>> >> sd_set_cb()=2E Rework this functionality into GPIOs=2E
>> >>
>> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>> >> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> >
>> >What is this for? We have a non-legacy API for "the SD controller
>> >needs to know when the SD card is inserted or the readonly
>> >status changes", which is that the controller implements the
>> >SDBasClass set_inserted and set_readonly methods=2E (See the pl011
>> >for an example=2E)
>> >
>> >I would prefer it if we used that consistently, rather than having
>> >two mechanisms, one using GPIO lines and one using class methods=2E
>> >I think we should delete the sd_set_cb() API and handling code
>> >entirely=2E
>>
>> According to the Linux MMC controller DT schema, there are actually two=
 ways to implement cd and wp lines [1]=2E When implementing the imx8mp-evk =
board, I thought I would need to model the GPIO style [2], hence I implemen=
ted it plus the active low part on the SD card=2E Later I noticed that the =
card gets detected anyway without the GPIO wiring, so I'm fine if the code =
gets removed instead=2E
>
>Even if you did need to implement that GPIO wiring, I think the
>right way to do it is for the SD controller to implement a
>subclass of SDBusClass so it can have its own implementations
>of the set_inserted and set_readonly methods, and then it
>is the SD controller object that has the GPIO lines, not
>the SD card itself=2E

I agree=2E

>
>(I have a series almost ready to send out which QOMifies
>the omap_mmc device and then deletes the "legacy" SD API,
>including sd_set_cb()=2E)

Okay, let's just remove this legacy API=2E

Best regards,
Bernhard

>
>thanks
>-- PMM
