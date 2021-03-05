Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp270693lfg;
        Fri, 5 Mar 2021 03:54:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUHIVNZ5Rt9aJ9kSdhpmpGkiuB9igoeUbb0WRVahkMOy3kG7awIF8xPSeMCsJZKuGVMwT9
X-Received: by 2002:a05:6808:18e:: with SMTP id w14mr6801899oic.124.1614945256372;
        Fri, 05 Mar 2021 03:54:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614945256; cv=none;
        d=google.com; s=arc-20160816;
        b=dZpEA4vRYZ94EXQBZBm5jwLnDbo3i9ENSTf30lYuEAq3iNoSIZqlfBmPwRDjrtcP7i
         8fK0tBhGEVT9tsXvaeZ8W/nyFJjexpc/trAAtLXsotl4fQRSJ5FC5Qr6TrUx4J8HCPbI
         VpmLoe9VT5DFA/i8XxGOEKqQPBKjb1CS2z9XeUMInUaCWaGe8nBDUB4g4vDHTgHaQp/9
         H4vSTYtBkK1XpqgrwOWSd67YO4x1s81gvmMsdxgEtbp/FQwbMNbEGJwSLi4KI/FTPkP8
         MtrHhHupxAOEUIZm4vugf/ZEFIrBxr7rnA6DpFxZg40AESzBmDgedtvk2g9CV01o8uO0
         qG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fK+Z1wl+vRpf1r/gJh57E0mJ0GFzaGFjZ+0/PhXri4o=;
        b=HfbUifmLChZRRM3gRXhsTJHNT86r1g11YxJaoR8oXMZbii+FV3rVP7ehAAdXBeuuO9
         akDfL50LO1U15KxSTUDpBYty9eD+HBJGMG98j30gfWZR+vyVP5WHDcUC9FsJCC0sX0zO
         UbE9sQKyLe0YWK5L/ssyr3AsYC+nbM07A3J69xArTYD3wB1T3CUyfyoJRwlUZT339K1+
         iyjt3CC8zwua+/ZUHwv7obxVCJ1jTL1+j9LRNjE1sCRfcj//Rhmlh55zSGQSFwZXKU9N
         BAALZKFRww1LCiDKjYCEY9SyGNBbTb/O+ynbdxwgIBf/U8mPZM/1gSsWpqR37CAPTaNp
         vSIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CwhHKLlz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si2082671otk.304.2021.03.05.03.54.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 03:54:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CwhHKLlz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lI927-0003KM-Lp
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 06:54:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI91C-00038k-Bb; Fri, 05 Mar 2021 06:53:18 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lI91A-00025E-Uq; Fri, 05 Mar 2021 06:53:18 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j2so1760600wrx.9;
 Fri, 05 Mar 2021 03:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fK+Z1wl+vRpf1r/gJh57E0mJ0GFzaGFjZ+0/PhXri4o=;
 b=CwhHKLlzZM7SnNF/xO3iNGjvGJIYvKtYZgL2tnMDB+zsWpGWcKT3R/S7ahy9mMr3AY
 86KaSnFjbk4/egFjwEyXZilZ88Bhhy0JteHjMKdo9UEMvJRs2iCURKDqyl4M2RNADVHU
 MofMtQxJuaSwoBIui9m6azXriPAO8Dk9mPBbSHjjwpjhuxHzO0hsmJynGUgS/bZdCk+Y
 d8mWWjt8/ELm7MKVcAubOcKQS9oiQhBs97phsQBy/YuWpTaz5LennRL7vIh6V5xbyS0C
 OsOSz7cwnxZW3pIPO8P7uiDkW5NNi3NhL2hQHkv05C7nDaHOqgLUBe4KyLs7FxW8ke4O
 ytPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fK+Z1wl+vRpf1r/gJh57E0mJ0GFzaGFjZ+0/PhXri4o=;
 b=LMEMicp1pfdQf37QFylP0D5p4YXNQpEP+Kq/JFmyYKhZb//+QZsK9vaYWKgtqmexGW
 fiJVtEtQ+QkN/FrnA/w6IzoJvES7ltecyu3fjbVlxlBBJ9BhUy1qRc7W4eQUGJfy4SuX
 1BTOqevqRBoK62NohglMEsBnUTyy/nRcpyG/q0Uu7LMrOJwGJ/wVbL8MdaXWnBpg4ksJ
 aVtEYqkNJ/Ej4v31q0L56EpQlAIKO2nGchrfL7mk3DGggoA2gGqrkBsNLpfqdDIjVpda
 XjvrwuyUaxuDHH/YtMeHfvb3i9a1sWW++gkcUOfMe8CgBEkbtVBMNKl8OzsVKaxWGK8B
 u09w==
X-Gm-Message-State: AOAM531ssDZrsonONdJgPYWpFwvgOgul8oeWMGwi67LsQ4BCMOFijQL7
 wPa6clKT3Jh3besir4ZsExGwwbfhCa0=
X-Received: by 2002:adf:e809:: with SMTP id o9mr9201963wrm.110.1614945195100; 
 Fri, 05 Mar 2021 03:53:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p18sm4742502wro.18.2021.03.05.03.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 03:53:14 -0800 (PST)
Subject: Re: [PATCH v2 14/24] hw/arm/mps2-tz: Size the uart-irq-orgate based
 on the number of UARTs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-15-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6af2117a-e0de-5761-03a7-9bd3a8fe8cd4@amsat.org>
Date: Fri, 5 Mar 2021 12:53:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +wqCl2cWHK+6

On 2/15/21 12:51 PM, Peter Maydell wrote:
> We create an OR gate to wire together the overflow IRQs for all the
> UARTs on the board; this has to have twice the number of inputs as
> there are UARTs, since each UART feeds it a TX overflow and an RX
> overflow interrupt line.  Replace the hardcoded '10' with a
> calculation based on the size of the uart[] array in the
> MPS2TZMachineState.  (We rely on OR gate inputs that are never wired
> up or asserted being treated as always-zero.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

