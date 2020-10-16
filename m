Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1719874lfa;
        Fri, 16 Oct 2020 10:20:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiV8HfSLo3fVnI5zAB20j0zS+SJ/H/REte2bwc52wHB7GdyY8SaEgAxfPpLQ2sF2jwj/ra
X-Received: by 2002:a25:bd0c:: with SMTP id f12mr6331830ybk.3.1602868818829;
        Fri, 16 Oct 2020 10:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602868818; cv=none;
        d=google.com; s=arc-20160816;
        b=iOEnVDTKAB1Rk3y483hH76qEALqIaHFNgWCy0F4qkCyXAVK7craI5ZUlGuEHwN4K5g
         l0gsQx5bmqTnTy+rjRSf+WT7DHWH69OSXBaQ6pj+KpcRiEHQkNexWupsWLAMd4oBSo4f
         11txNk8mJU3B2guzPy7hgDHa3c600d5+lUeJeHnPICUgVgtvx7bpLh/9qd+sS2bGHTUl
         umUC55/7AyhtsBiYJn38F6pP92+szQipiaBNNsgRAmiRWFawLq2LJjyUY4vXi0+ayPFm
         beMTljIUr1jRjzKXiyhdF1NsytZY7AzSDTBPBKEDOsAI4LMoJLutrnHpc5zJue6A0Z5X
         iuew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4wY+U5nMuX3uLuJeo5OAk4URYlw7/kn5+EjoyuhialU=;
        b=yN88ezagfFiZuJlhbm3X+eusfmnGdr57oX+IeTAj/mpEcp2YXhPivZOkt9ucAo5c9G
         PxgyOrBgSo8VUQTPv33v7KsJNa5Lwu09CosICt13F3DBmMt84Y8ZV6GggCbcvG3UCFma
         F+2ju7hFYw7cAJpBnN8BZnmaNW26HfBZczv8BqRssFh1bXmRRPbfAuqpIjYHmfuU8XGn
         MenlNXRnUZFfnFH8pndBSaSFlFsCATygrO5NfpcWaMTe6Hn5agAngEX4xDAQLFaTYhdh
         QXnGXqhR9Pt22JmvSF5Y6vuhYeOuxMyI1+0a06prehWUn5oHmjtinAv9SYf6THbunx/p
         Ukiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WBNSElgi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si3375659ybm.358.2020.10.16.10.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Oct 2020 10:20:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WBNSElgi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kTTOs-0002M2-33
	for alex.bennee@linaro.org; Fri, 16 Oct 2020 13:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTTHX-0004R6-Mb; Fri, 16 Oct 2020 13:12:44 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:36971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kTTHR-0007Vg-S9; Fri, 16 Oct 2020 13:12:39 -0400
Received: by mail-wr1-x444.google.com with SMTP id h7so3783985wre.4;
 Fri, 16 Oct 2020 10:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4wY+U5nMuX3uLuJeo5OAk4URYlw7/kn5+EjoyuhialU=;
 b=WBNSElgigoiRMzfoKnoGMVBsEuYpwb2YHxVKx+ggZKR1vnpg/f2FemEY40dzGhoRC9
 Ex+kyZgfUZeyb1f7t4zDvFjxU5/G9eKQ5W1r9pzpF26BX52ZgDtY63M/qqDjQqGJlR5u
 s1W00b6ermPOhFTYin2/GFLi8/6wOTMrUM9E20oZazgi5yHFkeXJ9X2brKsNtPLst8bE
 WGgAhdhpz/WXR8HdeRpnlzl4GXb4NYGGoRZHV0kbkYOUUGeYM3fWRPMgo/ZytADy6TiR
 H6fzsv0Zh4GxH28HDQahPfX6vxYRcXCxOKXrgpd1lDBg7VlvdLE7wVJLGtLD8EJwA2Xm
 OMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4wY+U5nMuX3uLuJeo5OAk4URYlw7/kn5+EjoyuhialU=;
 b=V9pZziyHiJmUt8qhDt5on+5r8C0XYtPhzj6nxuDHCTbsE6cYdQXPxZBVIvadd5zBvu
 WCevl9fQ30Mm2TemCxALEVBBM++REpuWOv+c7WpKGg/UMzMq8agq5EpaBVtAkOEoAE4O
 7NaAOjN+6+1nrgP+W98joFW0gfXhBi8OkWqy4hZPrj54ZjkhiJqJeqMpeGSzr0AktHtU
 OfO9JmTDtkrNKeNWq40dU0C5BNF+L7HqKifD/wVx3z0uK0Gr/yuyTupsY/0GhywU0LAO
 /4X3vmlNvCbaBGdPIFUuYhr8GRGxLKz5Mn2UmvAsmUPhutq3cx+cE8jeMedlmU/2ICAW
 22PA==
X-Gm-Message-State: AOAM533aSp8B/KRL5E67jw6NIF1t2awp1xMReUwf/9mtMcd4yQdRfvUD
 SXuwjOb21rDnFiU/9JhjZ6k=
X-Received: by 2002:adf:fcc3:: with SMTP id f3mr4989774wrs.336.1602868355124; 
 Fri, 16 Oct 2020 10:12:35 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id t124sm3524324wmg.31.2020.10.16.10.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 10:11:33 -0700 (PDT)
Subject: Re: [PATCH v3 00/15] raspi: add the bcm2835 cprman clock manager
To: Luc Michel <luc@lmichel.fr>, qemu-devel@nongnu.org
References: <20201010135759.437903-1-luc@lmichel.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a9a19895-8cfe-c40a-4b26-0ebdffe76d83@amsat.org>
Date: Fri, 16 Oct 2020 19:11:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201010135759.437903-1-luc@lmichel.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.253,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vNZzHy8FKB1e

On 10/10/20 3:57 PM, Luc Michel wrote:
[...]
> Hi,
> 
> This series add the BCM2835 CPRMAN clock manager peripheral to the
> Raspberry Pi machine.

Series:
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
