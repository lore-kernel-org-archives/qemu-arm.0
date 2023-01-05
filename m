Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp252196ejb;
        Thu, 5 Jan 2023 04:04:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuyr2E7jFO4Mp0QEBTAnQtkQxcz0DD7CEeAfnghef0rvgF+pyZISL91QwqKPe972tKKvKdS
X-Received: by 2002:ac8:4f06:0:b0:3a9:8610:f9af with SMTP id b6-20020ac84f06000000b003a98610f9afmr74184129qte.14.1672920290743;
        Thu, 05 Jan 2023 04:04:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672920290; cv=none;
        d=google.com; s=arc-20160816;
        b=0tLpkJpO1TsRzvIC7hW4hxERRW9m3LVuFJxKHvlZ2+Th583J3vVqHKZBLT9x7fIGec
         Ne9/u+d5L21mJiEGbb4gun0If9Qkum7ACyvy8sZEgBRaOIXGyw461gEPDXthYNmHWMgo
         x/s5nCwIf/LNW1koCJ+LacLYMhUyLVE4zw7LhJBIba4qH60XE+1OvlW2AU/98F7k1J6R
         9cwtgQVtVrHTblnfQ12PUJO+ZL0knbUGA6mM/fe11bJoK62vnvCEv8WR4y47OGP06LH2
         63j021JH2amC/wSd0J9kxl0+uU+CUobxpEFJTpVTeFlmdx748xo0sY6TriQSuTJ/ozol
         0lPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=T3hM20P+TGbaxG1KgvwEB+gTq2CyOhmMSVQK6ueAj+A=;
        b=veIUMzRsW4fhij0mvL1xMRxOJ+no6bfw/ZkmW9hL0WmAc6wd7wKHr5dE4Us2SrQx8Z
         eQwtjcN3B1lx8YtXEN9vCb9KVOrO11n88n84CJkYH3Ii/W0CVN92/wwJxjfzCn28l/MC
         GLVlT2mp/YgSB6XqxHKN2+67gb9bw8q7Jpy4yVw7dX6ZuXyJugDj6ZTgqWMxJ8cXcv+3
         sOkM+mt7JDwmCA/Za2Hp/ju6VGwo4laMdP6pknKD5cIMbhSdwufqarA03PSWr0E2gZ+M
         DeM4kT8vOfgh8qbRpIDYBGYNCjkQHIJpeIAi7V44WlsjQgCweoS8Zup6KuvT9Wa4gwyo
         YTiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MuPjNZr+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f25-20020ac84999000000b003a4fb8ef767si18646404qtq.502.2023.01.05.04.04.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 04:04:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MuPjNZr+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDOyl-00028X-M6; Thu, 05 Jan 2023 07:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOyJ-00025n-G5
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:03:48 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOyH-0000mp-L2
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 07:03:46 -0500
Received: by mail-pl1-x630.google.com with SMTP id 17so39188150pll.0
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 04:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T3hM20P+TGbaxG1KgvwEB+gTq2CyOhmMSVQK6ueAj+A=;
 b=MuPjNZr+JGgzgajYWR8KZxcnWDJDw1ygzKPjUk9ynMseIavFj6atZb+u5BFvnxslX7
 U/OKLj408AEvXgb7skHQl4TOTu8E6vDvtypRIyH7owiJOZT3ZE7o1CIGq4i2S7RR6wbP
 J1ztWYKk7RQU8uxyifTBqlFgm4bl0nGtYMdMyjcjrKKQNG1cMzf63vrijL6KqYL+z1Vf
 mKrgDu1J7F0tOL2kTr2trJ9yf79MbOMf1MI0wi4S7Yh6r814rM2yRPbwylMny4BlV31q
 v0FnYqwERjk+A4JeZ3qDDmkzKq2mGOs7duiAUgiwzPu8vbGrRJOOBPRv0hETuE5pyyRe
 AcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T3hM20P+TGbaxG1KgvwEB+gTq2CyOhmMSVQK6ueAj+A=;
 b=mclRI1YrEDuY1yXoOLV1wU1AElcviuWoJZixBC89mX4lyoXI8/5b+/dpdM7vthB8nx
 Z7N17dnhiyW3neXCl1XjdjXbTSPbWCaY1bsxJV6e5tQb9s1XQUBsZ5sZpXP4h53jgP1w
 2c3kixRl2kiFZCeGwfxkdT7u84d/vvnWygCYaPKzRyd9gtbgg4R+UK0NwiaJAg/rHCJc
 PNhvyBxHZIbd7N4ZdwkXA6iH/1NtVxjEGyA+TjutM/Rb2Bien/oq6Hc+P5ynoBLFnu4g
 SnCeUqGzxl+mllOQH0rLYyGCdHNfT42CwRJjqi+/L+GyvkwScc6N7+fM0UnPgPeVMyCn
 DMjg==
X-Gm-Message-State: AFqh2kpOQwZDMVeER5w4s3J/FpPFHJHozXU9WGvjAhENVmRA3s4zIDAe
 NcIbgjHlflLeC/Zc/M5C6XitgU4YMxUGCEbf0UJ1GAm6CgNbjQ==
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr441064plb.19.1672920224149; Thu, 05
 Jan 2023 04:03:44 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-4@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-4@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:03:33 +0000
Message-ID: <CAFEAcA9w-q7JWObNCkkw_asm5-iU1-5JAqDCmw=CkENv4Us1mQ@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 4/8] hw/timer/imx_epit: update interrupt state
 on CR write access
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: yR/coqQatnF7

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> The interrupt state can change due to:
> - reset clears both SR.OCIF and CR.OCIE
> - write to CR.EN or CR.OCIE
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
