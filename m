Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4875239wrm;
        Mon, 21 Oct 2019 10:36:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxS4G/ILuqFy9a9EVKoiLFO1xu/SGKTsbo/AKx4HvMTeNmHTeSA4Twthc6qigPjewA1JC29
X-Received: by 2002:ac8:1ba5:: with SMTP id z34mr4956806qtj.162.1571679370308;
        Mon, 21 Oct 2019 10:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571679370; cv=none;
        d=google.com; s=arc-20160816;
        b=aN9IYIInKhb5DugzFXcDWXP2P5M2sHxpE25dxL8s/BXNvBS0Z/zdTGMgPVZEXv1q5m
         HeA5QMWEujqpCl/xMQgGUjaql1/SC3AYidL30JvsTWjy22caLfYwAl5g8CUjT/w0Ssgq
         RGLa5qtmqBSRYeBX9KAxqQdlMUNITV1iZ2HXHrh7xbFdAabJWEJCUw7JSdwz8nE+ePel
         1K/ujHMQNy3zx5D+LxUCTIG7qw84e5z/50fIIpOE1qMlqXbrOH+o6EAeRxmsmLkh30lg
         6+XLEn+qzyqlY2lJqhI2qRxG0yBMRybJPvKzAMIiKxJpusU9Ew7UOuQ7vtof6klBIa6t
         abzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=iWFNgivYLuuN+/YyhYyGxqv53+ldRK3tdcD/5ti+nwU=;
        b=NjfsOdYEJo/IGHybzXWAV7mS3mKV5xlD0J2mSSmtBtMx1OvCpt+4vZN8EM1vRQwa6z
         aZSKGTZ95oAjupNWLgudsDiAzs8VkK++FXZZKy57t745a7X72ICvFiIjt3CmrEJ0STW5
         ni81cSDOpJGwxKxw5reegECdcclQ4UEp+yyyKGhvaLdBhZ9mD3nyObISpGicFo/S64A9
         Gfytro6X8hTZecODfpBafAUsU5QL76qs9Xo9OJjCmsI7bPTfN7JOP2XbCV+m5+787Pzj
         aVZc4WKNmEvQLoT8AwL2dYi3eGl30JROoBD0Txx7J3nKy40CevTI/jO6quLifdZgKuHM
         qWtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v4HENVO6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u58si13527837qta.392.2019.10.21.10.36.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 10:36:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v4HENVO6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMbbF-0004Da-Ls
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 13:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46153)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbW8-0008VO-LA
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:30:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMbW5-0006Oj-Aw
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:30:52 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42550)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMbW5-0006O1-5J
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:30:49 -0400
Received: by mail-pg1-x544.google.com with SMTP id f14so8201120pgi.9
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 10:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iWFNgivYLuuN+/YyhYyGxqv53+ldRK3tdcD/5ti+nwU=;
 b=v4HENVO6DnPDLHvtOZdmOPDcllhmBzqj0Kgvw88k4J7251GWn5JKWpxAe7gL5sWUmn
 1CVL98J7x31Adk5MYM1cg9RuPDMnQ+0+HfC1E2zHvjRMkyDGw3yKMNdZGtfs5KBvAu2S
 DcV1OM6W6GMJPi9nfiMQl14YXv+v0iDFlKlYQ7Wfklu/boTHxlsBGNrQ5I7HNBm0cBg0
 jMlOregu5npBz8tEaPbY6wzyt1la2VZTPTiNLvDD2rKE6PAV3vs/PvW1GnIt37H4KB79
 Dv24EZDkuA2CH8Xk4gQCL9lg93OqtYebD0wlMToJIbCsSnEZkq7JVar6GsM5gb8d8Sa/
 fYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iWFNgivYLuuN+/YyhYyGxqv53+ldRK3tdcD/5ti+nwU=;
 b=n4OAo1ISsk0KmC+JODtrsFLNI73sb9solWtGUlNeOes1RWtOTrG6n5r/bz4XwVt5qO
 QxOQiMeN4GiJYSKVgUFcGbM09jFJTUTAuHYh/Fiy9u/1GNo6ax4NSPS28geW9V6fFmWY
 a7B5skMm8dVYuEZz0i73pUT+7Huz72uAIGUC0kla+35eK7/evCfBEaz8aC3kFVtaircZ
 vvLAHM5FsltgYSApW6k/Z+HPlZzFKm57IDrJJ5yqVEMmsSStGu0GFV/BnwUKo+g2keWE
 rmQzufdhdAy91Gs6f/By4dP6PTbxUH4YbnX34XnwBGNpOfQ/I9hQYpg9IkGyXXficpRk
 3wSA==
X-Gm-Message-State: APjAAAXmlDc46fmg62kMTY85UfVfQbqPFWvJxJfoOIqyuVZmHWrVzyjX
 7nW9d9PEMZCuhgvvC7uH7t/Giw==
X-Received: by 2002:a17:90a:8d13:: with SMTP id
 c19mr30200034pjo.136.1571679047734; 
 Mon, 21 Oct 2019 10:30:47 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id h6sm21836474pfg.123.2019.10.21.10.30.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:30:47 -0700 (PDT)
Subject: Re: [PATCH 16/21] hw/lm32: Let the machine be the owner of the system
 memory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-17-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <19f107f4-e450-24cf-ba40-2107ddb9bad3@linaro.org>
Date: Mon, 21 Oct 2019 10:30:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020225650.3671-17-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FZOGhw7OncDb

On 10/20/19 3:56 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/lm32/lm32_boards.c | 4 ++--
>  hw/lm32/milkymist.c   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
