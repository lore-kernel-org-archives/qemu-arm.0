Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5517725lfc;
        Mon, 15 Feb 2021 03:00:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmpt8IPymbpYDAubYFZfZUcbooQLOFt3jY+vGGyYMmTT/t8RhjlOLsDct8b7lGmLCgdEa5
X-Received: by 2002:a25:b8c7:: with SMTP id g7mr22105892ybm.432.1613386856034;
        Mon, 15 Feb 2021 03:00:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613386856; cv=none;
        d=google.com; s=arc-20160816;
        b=cMoWjS1yuBnDJ0jk4BIfvBnpuJKvOC7+DkoyJdMQSDQuc2OAsR7uEbg35frRTIaIxx
         ni4ejg97NkKhfV0z/vqxTQlwny9OLCBIPhlmK07r5lOoRXpy3PPC3hwV0LmALtVUKWqG
         CKfPl2g+lsJ1AjwooJERuRqD3e24q+QoZc9mK1qbib5Rl0LFcxXMnu4O1RC647kGT8PN
         JWrxOy+6PjbMjfSvHQi44+uDkF4hf55CmrQtKI1SfXwRa5Z7TauH61FYBNUG0+slt5LC
         ZZgXUomebvVuq2zoDO4sQUKO4L/7sxyfxaMGNjlKT+0wjnj4siC3AfZ04KkbrMk/8xuR
         pBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GA199u8ouu9KvEujb4Ifm5GQvpxnwEgf4SKOTueVtD0=;
        b=dpE2i4VNNgqZ7eYadO691xWwYKpBsNwF9HOpOSlD3hD/9Til1ZEhjDDTPx1tcIEfqa
         y7HMzFqKoy+8FsQUzoQ5a76m2QSZYLKjgK77oYkNissktJgrzepsM0VQtEbnfkIlmrC4
         hGFK8lbmkRRSMYbwYqjda8yEg5bSkuub8Urh09xawczYzvHE7rMMznm+MSTQnE9pamEO
         WrcAljnpeJCLUeVcAU/cr4Oj4QxkcwDHnUHwwgfjNhbHsy2/CjqoD8+Mj0x0/ydaFzLB
         ReccFnX0NpxSSFxNGcWyndpQaykTHdXc9IIYsealN/LotDE17GRzx90tK3td1+t+E/O8
         LmFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YUjz8AyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10si20264386ybe.5.2021.02.15.03.00.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 03:00:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YUjz8AyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBbcd-0003yV-5i
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 06:00:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBbbs-0003ur-4D; Mon, 15 Feb 2021 06:00:08 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBbbm-00051o-Vg; Mon, 15 Feb 2021 06:00:07 -0500
Received: by mail-wm1-x32a.google.com with SMTP id h67so4085040wmh.1;
 Mon, 15 Feb 2021 03:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GA199u8ouu9KvEujb4Ifm5GQvpxnwEgf4SKOTueVtD0=;
 b=YUjz8AyQK6ivAmKXlH2zp2vMwJ9oDzOwhzzAfjAYXXUp7FJ97EMIDw/JxE00APXZ3W
 oS87YxezsxOq0E9PZ5ScnE+rXJFduGYLreLAsqM/NSJJigpd1NI89m4S+h04uM9voJm4
 Zg2slFC6RNm1v54bJEVSFJfR+C9tmkWVtR+wHmtUoJdocANL8HugvVjtScYs6NoYDj/N
 +DnK3r+mpRXqfjmumO4nQESCPwiylpJkHiHug2XgmbuhkRMJN/jg6CmYZjVKmY5D5zJX
 SEyRVNfphsq3SNeCklcIaK79j+Ic/S+EOgYPhlUXHnNAO1cLmFbpsSIgSNMW6mBjJK5L
 ohMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GA199u8ouu9KvEujb4Ifm5GQvpxnwEgf4SKOTueVtD0=;
 b=lrPooL3uSKAZq3i7xzL0k/wnCTQMOSsbHXbAnhQPP9U5FIVhfRPVH8Njra2HQl6rpL
 KXqJ5ZlA3mFYSdGj/ZAqHqPcygFPgKbRdnxvGWt0fPjU1sPmCMT/U/zR9fRL17Cds+Yv
 VtriOyHGEVcfjo50C0RqJ4Y+tg73mTuyyRrV1kmYIuqyP0PKa29+MvtVS73gVCIfjyaW
 DG7+NUVZY8U3ygJIsWB+SY2K3GnKmWvYGx99eVAIyty3zsTW1I7NDYqithcJnTEfd9nJ
 Eyb/bn8nUGg5bRA9Y1Ft1VXalE1vZFTM3ViZHFMfIENZM061HbDiISXCG06i00cL9fth
 EJlg==
X-Gm-Message-State: AOAM533vnZG+Rb0gxzpfmbf2TN4FSsF4j/8E3vZxw8I9969+2KxlF7Hf
 9bQzEb+pFgmPD2qyqHU66A4=
X-Received: by 2002:a1c:113:: with SMTP id 19mr13860397wmb.7.1613386801097;
 Mon, 15 Feb 2021 03:00:01 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u142sm24911239wmu.3.2021.02.15.03.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 03:00:00 -0800 (PST)
Subject: Re: [PATCH 9/9] hw/display/omap_lcdc: Delete unnecessary macro
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215103215.4944-1-peter.maydell@linaro.org>
 <20210215103215.4944-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ff8a632e-7434-9c09-1757-62d28f52d500@amsat.org>
Date: Mon, 15 Feb 2021 11:59:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215103215.4944-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ikeb4MivN6Uq

On 2/15/21 11:32 AM, Peter Maydell wrote:
> The macro draw_line_func is used only once; just expand it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/omap_lcdc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

