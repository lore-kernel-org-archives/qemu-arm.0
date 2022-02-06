Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp3553445lfk;
        Sat, 5 Feb 2022 16:18:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxLmwuNVQmuay4a5J1Zf9irSVX83yM8yxa7BbD4AbityIJ5tmtSNpejBQZ71/MwwcC52m6
X-Received: by 2002:a25:4253:: with SMTP id p80mr3726582yba.570.1644106708035;
        Sat, 05 Feb 2022 16:18:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644106708; cv=none;
        d=google.com; s=arc-20160816;
        b=VnerqpNseOgeX/lkP2msuoU0ndKvAsa8r5HBZqR17wPoX96Pfwj7Xjyf3AVz4ihRUJ
         itkapttGS9DxoJbud7NU+ZO8L9XU6bIVcmMjlrGsAfBxe7kjlttANRstozI6J3irhfLQ
         ecDuTE8g9N055KdCnudOI0Y645ShGUf04AXkCKPs7HCCiJHZghWWok4WkQAS+sGJU5YD
         OhU0eZCkFDF/Hgxj9+DwOHRRFZYrIFsKM6h8qu2l93B/UHXPLtcgpboL0gjc3nfEeK38
         tOm5HZIsxKibBMhMdi+czPV+Bd9H7ham6weiag+Gcq90JypSGwcNGU9mK15n9MVu7D9c
         5CaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Z295obw+LzxsoeNc1dW0B/GLITMAdbM34Ga3ZYTmamg=;
        b=Bq52qyNje1XySGIO9o3HyhASkD/51vNcWNz3pnIZF/ASzddBvTb13MAVq143/BU72k
         AkXyqQMAiH2wFeYNluhVQY3bHALqezTqh5BCfgHg4Ujs8IA1FrwLNuG0kqnxKHXPOmUn
         9que3FW7E3Wey54fslF+pAt5RYlNfOkLYlD3o3P58YGMG3y6Oi6/Mkap+y8LZdkFdudH
         kDWs48LoKhR6N5i3qPYTBss86wDumJ7rVthyjn48JzL8mn1l4DD7Xh2BG+rr92Gv83ET
         9GVurmCx/aFwwdoJXMtZg3rzrkw7RCKl7jJiYrSwYtKYO85dIWQxjgJKc6PcjKNSjIAd
         6+Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6LvcfAC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e144si687234ywa.36.2022.02.05.16.18.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Feb 2022 16:18:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a6LvcfAC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nGVG5-0003Ld-Tr
	for alex.bennee@linaro.org; Sat, 05 Feb 2022 19:18:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVEo-0002vj-2o
 for qemu-arm@nongnu.org; Sat, 05 Feb 2022 19:17:09 -0500
Received: from [2607:f8b0:4864:20::52e] (port=36797
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVEm-00018P-Fk
 for qemu-arm@nongnu.org; Sat, 05 Feb 2022 19:17:05 -0500
Received: by mail-pg1-x52e.google.com with SMTP id h125so8351787pgc.3
 for <qemu-arm@nongnu.org>; Sat, 05 Feb 2022 16:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z295obw+LzxsoeNc1dW0B/GLITMAdbM34Ga3ZYTmamg=;
 b=a6LvcfACBRVb4l+fWyVYBFn9sSBkYcr5RHIJztTaftAm71VnAoN01EOu5gM4nWnKfd
 eVYBYujYSQ7f13I9x1fRR/f00bJwe3Tjt3C3NmQd2QLgqKEqxw1NItAFI0dFzPjvywYi
 GAeSkuLGP4C6Mup0vNtMP/Uz1VMzyw6VJRxbtIcZeROjemsTupH3qMhqrpBIcCzKQK5n
 fqcUSYUUo1ekFCZfbEus5dI2g5GvFfdpYArTPMbcLI35xljyPia/OLdqIBsNh6XXJThZ
 J08yiFu3Pxu1eW7lbrmpPL0ky5KwXYFV+fMO3HnIbk+CiNFx3ld9CJgglJRzsfSV2sE5
 59qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z295obw+LzxsoeNc1dW0B/GLITMAdbM34Ga3ZYTmamg=;
 b=aQQ9QHu+h/pTbUpeQH2dDP5XjinK07edkT6zbOhg/XdoR7sOgm9hdfSmeJEt7x006Y
 4inzBvnn76f2AJNrXaT4KjQWtNwKvWg5mtrkO2ygMMdKaqV9xTIId3XigiZnJ3bdV/U6
 aPGKPsn/+gyxAxqH05iF4ACBxDBIS58b/2jmlMHKI18JVfH5Rqb5HuijNGfompYKZ2YY
 NUP2XiWx9VXXAC0T34b+IDlT6vFrejjt5ti2rW7r+xv+RMYJ55M+I7zU4vTX7MTswesc
 FQ4lLiuaA7uG/DoKk9TgZik63yucL7uknm4UgVG6WF7T0spw9CdTh7qFlMJGm4fQi2Jr
 q6fw==
X-Gm-Message-State: AOAM533Nm7AXdCuYgbTgaduoK/AuWTpUqabcQ0tNSp5qrNQKLMUsadQF
 Q8ga3kdLTVGBf7wRuoRBwmrLZQ==
X-Received: by 2002:aa7:9a45:: with SMTP id x5mr9732259pfj.57.1644106622800;
 Sat, 05 Feb 2022 16:17:02 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id z17sm4472486pgf.91.2022.02.05.16.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 16:17:02 -0800 (PST)
Message-ID: <8cb48f72-6509-23fd-2ac5-ae92d80317ae@linaro.org>
Date: Sun, 6 Feb 2022 11:16:57 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/6] target/arm: Make KVM -cpu max exactly like -cpu host
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
 <20220204165506.2846058-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220204165506.2846058-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4UlpCCwx6+Yg

On 2/5/22 03:55, Peter Maydell wrote:
> Currently for KVM the intention is that '-cpu max' and '-cpu host'
> are the same thing, but because we did this with two separate
> pieces of code they have got a little bit out of sync. Specifically,
> 'max' has a 'sve-max-vq' property, and 'host' does not.
> 
> Bring the two together by having the initfn for 'max' actually
> call the initfn for 'host'. This will result in 'max' no longer
> exposing the 'sve-max-vq' property when using KVM.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu64.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
