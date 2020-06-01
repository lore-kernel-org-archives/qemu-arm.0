Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3547326lfc;
        Mon, 1 Jun 2020 16:39:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk83bvEQccYzdRyPBix498B7x+QkpE4rLAxhRUWmzRzTvH2qwjLbA5+0Fith25Iwtxqbdm
X-Received: by 2002:a25:ca0d:: with SMTP id a13mr14115623ybg.422.1591054757883;
        Mon, 01 Jun 2020 16:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591054757; cv=none;
        d=google.com; s=arc-20160816;
        b=fsSeaUZxAf/s6kv+Hzts5x1RnhQOhoYmRwzd5X8X+F2AHuTk2Xesm7cSsyundTKZ6N
         kHtJun7pklYcNL0/iZcTULAMU7sXeYRhAqh3cNpE57pIDwfHlkUBOykHTl+TCTA3qZcl
         LsCY+nYffdo2mEV48Y71panMaWS6oZ8NVmBkj0tjnm4UiYklMMYZCGsfXf7FNbAD+pnl
         JzUPAExQsb+KKA0JHieObqdPXh69GkKuSHErzOPJXdHaoXAWNA/PMOrTxjFZI8bGvVGH
         utEpRsnvInsT8zpcJKqfCbiraeX/pFZF/2C+7fTiNDZe7dOVxOLXPptBqCmhL5V3pKHU
         T+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tdEZ0FE2fCkDdeCvjfAB13a3HzQjvtrN7+bWKrDiVJY=;
        b=ncCDyQe2YnBg7+R6QSkK0SFJ8xx2IRE9qK00V1zkbYoHTGZ+QhfxzAPAb4R1bMuzcS
         7RlDvdCSUpvDaAEId7eGZ7LViX20I/L0klkGPohJ5A2kk1ua9mryV9yF9chMQNQSpLqp
         kSIt2igj3LlTyI0BdLGfc4xRnkdR987109c6NKo0zjU+QqiG6tNUbNgvVHOA2cDd6C6Y
         ZEiyER8jInjGY3A+hRwY1bIpq+7EOupSSsvV/kOt1kbAnx552qJWVq/SHh/1FYv5WLuK
         fqMWyYAuvB2UkKYbj4fmccgrsKsSMQOhPoZTHeI9U0Xle82wG2MArQ0I5QEpz2+bcEzy
         ZUaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="QSSR3Tj/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f63si654237ybf.175.2020.06.01.16.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 16:39:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="QSSR3Tj/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfu1V-0004Wc-7d
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 19:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftyo-0001af-1u
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 19:36:30 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:40896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jftym-0005WT-Si
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 19:36:29 -0400
Received: by mail-pj1-x1042.google.com with SMTP id s88so530132pjb.5
 for <qemu-devel@nongnu.org>; Mon, 01 Jun 2020 16:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tdEZ0FE2fCkDdeCvjfAB13a3HzQjvtrN7+bWKrDiVJY=;
 b=QSSR3Tj/yGlftLB9YcpZ1IPdp82Oq7+Xb1W/zB0ce8Lpd6c/K8euxhHRJQzAI4a1E3
 1KobbVvQyaCC1uCzRelaNzPSRDXazQXp0S4Dfysw3vyuEUTUMWHoEu2qjV8hhDAf2wNG
 fLvrpPn9nnwZP40nJV7l3OJj4NDHzApNYsv2Vm5kR4q7rI38ry719XhneDioE1H/su0b
 2YaVgNOMMBWxj1xn2kqrtmX2tU6r78lX7kW/dTQXAkKrfIJIWxAotPPZHRf9HLeUL1SX
 nzuSL6fROjjw1xXXE03lAqSXRjuxHPqkPTZlPC7ytxiuFFZzwk7+dOkN2fAa6qxcObH5
 sKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tdEZ0FE2fCkDdeCvjfAB13a3HzQjvtrN7+bWKrDiVJY=;
 b=UcMN84jGFhMMcx/4QgEqBmLM6dgcA9smZndUy1jDAoYFYywFS1dep+zK27XuLEupds
 16jHNgAAdyjeym1cgnGJQxg5sVnUWJK9X1DeW3OHiPPFA07iCE7/O5aGiMTS8MIo4+g2
 0FvnN7pd5OM4gxTnc9BDgCqLrH3uj2ITvt8OTUE5uFVgY+fKl/FVBtLmxId3Sv3pfwiK
 koZnyledjV2pjPKqiknZX1gsp6zGnPWWwmzW2djRdM3mM6qBgaIxJ3p+7ZwEeCdBz+oQ
 GyPzVvqiJw6ZbvBMCJDr+5SandHZQXR5w9UmC7FGTz4vmZnW5LEw07/t/ZCSFNhKoThf
 yWOg==
X-Gm-Message-State: AOAM531N4Km7/SMwRbigGHJIZZ4B1e1/cyFKZ7GphI9sJtcyteXqqzW9
 OjaEiKmyoqYx5aYsc30qhnayjQ==
X-Received: by 2002:a17:90a:a08d:: with SMTP id
 r13mr1978033pjp.96.1591054585155; 
 Mon, 01 Jun 2020 16:36:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x77sm454355pfc.4.2020.06.01.16.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:36:24 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] hw/pci/pci_bridge: Use the IEC binary prefix
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <761761ff-13ef-acf7-094d-b0406a4f9a02@linaro.org>
Date: Mon, 1 Jun 2020 16:36:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aEwPJpB0cOg3

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pci/pci_bridge.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

