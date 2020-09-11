Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp375628lfq;
        Fri, 11 Sep 2020 16:35:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6pQ72/dTKxrBcEeLo9miBepLj7TNpvbwy89UlS+YeO70et6SkhbAhE3qz0SZ6D5VqIGmf
X-Received: by 2002:a37:6892:: with SMTP id d140mr3670578qkc.58.1599867351797;
        Fri, 11 Sep 2020 16:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599867351; cv=none;
        d=google.com; s=arc-20160816;
        b=suuot5D1NUwZ36N8xHyNujkqAlKxu9tG5noTHcv5Do/P8XEEctIsuu4fWPh8Pz+oSQ
         EaDtA0oeTQ+JHrHvTWEbVlpRLKjlo6uOyP7c8kykcI+J3HevwbHk3pLGbjMh5PSLyfP4
         IdsCSQ3DYHw9YdXpyBk70y2I8lmQuHWAhmz/C0MD8AiKM3WhDP6LAofl6BM+5EChssig
         DMW+PJzs8rshOH3rlivLM2zYoG78GyCU3PAvMXPphn4oATvc4Eq3WcqrXQjJs5HHjhf6
         6t9JEF0aKsQhF7EeBiG9t/7RFPIfK5g8Cv2MYCHA2Zqntf740ZlqMIC2X5OdNX8bNsNL
         r90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gy9ew762Kz8uAcIp89Zw7N6msNMi6asxKV4Mu1sd6/4=;
        b=gPUsXtWOkdPG1BhTQq8h2+avd4EYYlEMaoBECCRO7sqvdRQzS8neSMRDEVA2I0SV/z
         Pe/YlLxGTxwv5fIIegGBmkzk6TWbakcHKcjCY7wlASw0QaGh59Qp+y3+3Gf6GJSXdvwD
         zMCBGfhDG8FORASJUHaDJZ18s4+p1vmhSITdCsQmNvDsIo7hW0lyVI51HVtOLEHcJ3eh
         05asiOtjkJG6gFICkr/MzEiJilRe723alXTDEmdQUjbQFKJ7TcuOthYISaZCyUXHNsmQ
         ul+0mubggv+Um8WBJ/Y/620XbjoUCqyy9EcM5LyIU3yOzqHWqJviRnFA8Zv74YOAOw5S
         HBQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Nobw/yhL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x124si2303643qkd.290.2020.09.11.16.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 16:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Nobw/yhL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGsa7-0001h8-8t
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 19:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGsZn-0001Op-Ep
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 19:35:31 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:32881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGsZk-00065Y-SA
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 19:35:31 -0400
Received: by mail-pl1-x641.google.com with SMTP id d19so1607939pld.0
 for <qemu-arm@nongnu.org>; Fri, 11 Sep 2020 16:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gy9ew762Kz8uAcIp89Zw7N6msNMi6asxKV4Mu1sd6/4=;
 b=Nobw/yhLj2jWrtf+pxiOb5rRm/xgka26iOmvDiSC3KT5QRYuPXqZu7yqEAPq3gbw00
 0sRD9sYmKOOohpNu5/wlZeDkWfanHzRyHhVKmYt0xkili02zcukPx4qd6ZSPRwC58DLz
 lWdmUbdOFOwMpSpNxSncpozdbv8IY3SWW7XLLeJXQthwvXSsOQCA8dtYAuzRhIpDqKMG
 OkMRCiL+csjgBw/Nvd59ywjqKY+agDeVnprtpuDUSFAW/0W1Mhwx8P1SuwH3qiUN6poS
 GYbYV6TXcLsKeBtc5c4h5QTC493aJfrm/oBIjr/l6rvbGFlwAYShDHMvUwxaDV1OOX+C
 Upzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gy9ew762Kz8uAcIp89Zw7N6msNMi6asxKV4Mu1sd6/4=;
 b=JPZXJf9R9G6ZN/jy/ej8+tjU5y0ENMP/iJJrWWFp8F6EbVZhJzaIuBumpGtGgKCMwg
 1UX5pBnKPJGycexu1DPmPssLKfazc4ugvFeICMRbo310HT82WNU52C8gl3J+/IKwAa3N
 nxUlc1OSZgm9rf8NOs8a0jwbeB2hqPvvADHcmbIg/UYzbEEYFnhtQtvems3s2cDD4BW6
 Oz2JjShGkN1nBq1kPFS/30aB0JQ0WwRMeL59hDJNIGa0KkFKTgv4FlOG8LErjVt5fUsK
 0LzGSTEgEtpyLxSR0+6qlZgW3W2edpZ7KxK4znvXNY67mw2jwASCf8tjoNKf07TJIwq6
 kRgg==
X-Gm-Message-State: AOAM531dgK3hNecXq4cPYiJVarpDL6eozQjnM1Ow9QXx8bLCHG0/zmNI
 mk0zNRMIyZO/twBDeLNfewsqSQ==
X-Received: by 2002:a17:902:a40e:: with SMTP id
 p14mr4158367plq.4.1599867327150; 
 Fri, 11 Sep 2020 16:35:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 63sm3298449pfw.42.2020.09.11.16.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 16:35:26 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] hw: Replace some impossible checks by assertions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200910072325.439344-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7996e747-9163-649c-9477-3d437bfecf60@linaro.org>
Date: Fri, 11 Sep 2020 16:35:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910072325.439344-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V7ihlbe88JLO

On 9/10/20 12:23 AM, Philippe Mathieu-Daudé wrote:
> Trivial patches removing unreachable code.
> 
> Since v1:
> - dropped patches queued
> - replace dead code by assert (Peter)
> - use PCI_NUM_PINS definition (Cédric)
> 
> Philippe Mathieu-Daudé (2):
>   hw/gpio/max7310: Remove impossible check
>   hw/ppc/ppc4xx_pci: Replace magic value by the PCI_NUM_PINS definition
> 
>  hw/gpio/max7310.c   | 5 +----
>  hw/ppc/ppc4xx_pci.c | 2 +-
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

