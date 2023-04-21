Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1429030ejm;
        Fri, 21 Apr 2023 14:46:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZTKfQe1wHuXwF2Gbrcj4B2f03c+eLCSrWgVLLxuXoKIFHHU9gP4AiEFoB2b4+lsP5WcnxR
X-Received: by 2002:a05:6214:5019:b0:5ef:422c:be7f with SMTP id jo25-20020a056214501900b005ef422cbe7fmr10814900qvb.12.1682113569098;
        Fri, 21 Apr 2023 14:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682113569; cv=none;
        d=google.com; s=arc-20160816;
        b=xJThkXRYwL1ZmlAG7XiJQievbFtQOeY3d+IFqtWqSvhkV57gUpH/FGgjDrSlprRGBV
         bdzC8tHvMVwijxj0HaOBodLWXz6h+eITY7rOyibgijHzYue19QgUWybT4hRszXp+0f/W
         iUTaeeBSER36L/jvpXSX5Ahf/m9YZ2jqc0WRZHmGmUJOM4lhU4u08+BvUFnOQym+yNBw
         AVY7UdaeH9HLIIWk3sFf6rwdyMkewXSDWsI2S7FX1QkgLaxuvnvqA47CtCRPzqdNOCzb
         zOI9UCKbA6Kdn7b0AFNmIfHxvzI9PzKtRlM23W/6g7cFXVdejF//393mY90JOjr/1PxW
         g7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RrLWy4735jhG6/XvphhkUdvpeMfBIv1YjmYFdIeImDM=;
        b=d24ablS3UfsfZAog8Q9N4jAvy5GcsBSFpAedJrR6yvcpHEt7SYUkodt/fRqmdCf4/b
         XuRrejjrTeD4uensm9AlGhdBo4xB9wm95g+njPzngj4Sq7tyiEgE0jacVPXcbr9rgRtY
         F9T6Gg01xj//aRFR7F7qa13cWUMWRmMu+iG4Mfe8efwognR09F5cACkFbT0UpfGuQO/R
         G9DA2OlEBCDi+nmLMOe7yEkJGR52ka1tl0lkhHuPZCzFoCkjoOy7gSV5FPcD9aBgPLmX
         uvNTIq9vzHHu/Dj9qIj8m/V+QMAk2NEPgdVHmQyfzBlc7mosj9sFjfmmgv2ESMeOahhi
         y5CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zW2u3ovC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i62-20020a37b841000000b0074d860d5611si3363327qkf.129.2023.04.21.14.46.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 14:46:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zW2u3ovC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppyZj-0000Xo-F3; Fri, 21 Apr 2023 17:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyZh-0000X4-Gg
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 17:45:49 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyZf-0004L9-V8
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 17:45:49 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f193ca05a9so10703215e9.3
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 14:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682113546; x=1684705546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RrLWy4735jhG6/XvphhkUdvpeMfBIv1YjmYFdIeImDM=;
 b=zW2u3ovCBn9+jKQXv3LnlwpZsXxc7ffzKqGypr1ffvkeIVzvzV3C0sDEpE2Lc9l1ez
 GH4J7/TxqpEz50hYtmli7BObRPVuI2x+2njOyIiwDVYq5Fw+Q7HOmzmuLH/iD7jAnG+9
 bwst6RlJsYgflgmMPMVOaXZfF+pgQYx59IZdvbHe7iqh5U3+TTHfZ0Xbg0+pVQ7Ik3ZQ
 bs+dEjPgT38o0Sfu0iDx4GtOo5Sb7TOwrxPnyb348kswBl+Apdg2ND1KM157gnFRm3/6
 UT4D029MegxS/+zwOG9gjqEmmXhHxS+sWABGeov/PW5EdWI2m+nLXZvhM3c13GyNzhxN
 i26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682113546; x=1684705546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RrLWy4735jhG6/XvphhkUdvpeMfBIv1YjmYFdIeImDM=;
 b=HMHIYliXkCiPmElzsk7tTlJU2gCjsJWkdy+LEEWUB0gBIRdfMA8TBSa+RR5nkm5DNM
 USAA1UXgG5oApCCsZvskRvX7jRu4f6fTgvr6o4sMrgVwLMy5qc0tNIzyWMyFzJqvWqNr
 wkZVomdl1jtF+y3Qxs+ghSp7Ryo11ihdpegUY+aINYXUWQdgZwXa1vX/jbdygDt88OgY
 glQ46z/XmATQpUssoU4+4e84pwxnUH2xqK1jswztHp4/uK3dFkhWLEwtTzq7v42kGD4E
 TzLZfsSkWONri7M09nExzrX/VQL+2yJqyPgWlVsLopFrq/MaJAvheL/mVxQeKts7BylJ
 eysw==
X-Gm-Message-State: AAQBX9ek52PqYsv1mh0Lzfd1JZ68ylQIwLo8Li8s6g660kBCJKFs2Isd
 HwaRY3vdsZ4CdqjoG5ZXZ+Ac8qDSpb5Qa+hIJW5VcQ==
X-Received: by 2002:a05:600c:213:b0:3f1:73ca:7807 with SMTP id
 19-20020a05600c021300b003f173ca7807mr2762252wmi.37.1682113546141; 
 Fri, 21 Apr 2023 14:45:46 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c000900b003f0aa490336sm9135051wmc.26.2023.04.21.14.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 14:45:45 -0700 (PDT)
Message-ID: <9e0eede0-4168-f13d-8234-1612f2654cb5@linaro.org>
Date: Fri, 21 Apr 2023 23:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 03/42] tcg: Split out tcg_out_ext8s
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
X-TUID: 5K02qzoz+k8a

On 8/4/23 04:42, Richard Henderson wrote:
> We will need a backend interface for performing 8-bit sign-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        | 21 ++++++++++++++++-----
>   tcg/aarch64/tcg-target.c.inc     | 11 +++++++----
>   tcg/arm/tcg-target.c.inc         | 10 ++++------
>   tcg/i386/tcg-target.c.inc        | 10 +++++-----
>   tcg/loongarch64/tcg-target.c.inc | 11 ++++-------
>   tcg/mips/tcg-target.c.inc        | 12 ++++++++----
>   tcg/ppc/tcg-target.c.inc         | 10 ++++------
>   tcg/riscv/tcg-target.c.inc       |  9 +++------
>   tcg/s390x/tcg-target.c.inc       | 10 +++-------
>   tcg/sparc64/tcg-target.c.inc     |  7 +++++++
>   tcg/tci/tcg-target.c.inc         | 21 ++++++++++++++++++++-
>   11 files changed, 81 insertions(+), 51 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

