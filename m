Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3917186ejc;
        Wed, 11 Jan 2023 03:38:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvzR4c5CH0ZQJ6Kf9OfQvbR0zDj4kw5yerfaVddmIJK/ASf9CDU28XMUh/cMf0QDimh5NKF
X-Received: by 2002:a0c:d812:0:b0:4c7:602d:7e2d with SMTP id h18-20020a0cd812000000b004c7602d7e2dmr93610475qvj.45.1673437102366;
        Wed, 11 Jan 2023 03:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673437102; cv=none;
        d=google.com; s=arc-20160816;
        b=tfwYLIx0kYWH3ZrIAzBOv3zfiBEvzoonSbjiAYiFWPn793a682towkTkNGcTU3U+Ro
         UNEHgziaCn+gzZZUFZD+DAJ33S4aqcNj557UhlEtd+rwo0i9cCCEIRm/P0+RT88wLofI
         coa2l88jOHbLAOssKEhrDfBTIZO9ev27eMfBFRAaVwgqR51fjbCdleSzRhwA4UeDM1Dh
         +s4zuC5MkM1obL7Bnvd09pYjPVJ3wi8TACOHd+6j6+vmRVqMlHOzB4IOTQVp5GJ5zYeW
         t1Nmxbn5M2i5Q1XDe/YBHVoUQIuoba0fClLg+foX4/f+ozx956ZvjXQctTICn5e1O2/Q
         1MPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UsZIA4qOEEIR12nEva/g3EWyOB93VOs7vlFpxNN2OxA=;
        b=SeUnoP6JDXyK+G0A0PbLNaaWRRVh5JOb+dum+l6vgWrP4Pe/vl5GIdVdCIFxUwVzuw
         sYuOdzEok3aOR7InayRIh+J7IRqP5NU7As4chXcMHPBh9wN65NqeG7/4thPTlAAkBdsq
         Q8vKG3jrlvLN1vZb3NfPuHLjG427RVMDfJpeKT7wYvVjbD6730UM+XBI+BjhLTc+2uKD
         AL175ONXCUtD5AQdwzQyPeu2tOIzBS7DBZ66DDA28fkb5MZYenB7asQx0OXFMasBzK6b
         d4jXBpEU7Io+HTzRfBMFsfapJ/C+mjPFsw/klmK9HszkoPd3lBUe7lw00pVeQTCD+IUN
         XuxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=su7N+DjL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020a0cb2c7000000b00520e4e227a6si7263716qvf.54.2023.01.11.03.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jan 2023 03:38:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=su7N+DjL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFZQc-0007YY-Fd; Wed, 11 Jan 2023 06:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFZQY-0007Xo-RP
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 06:37:54 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFZQW-00085t-Bd
 for qemu-arm@nongnu.org; Wed, 11 Jan 2023 06:37:54 -0500
Received: by mail-wr1-x436.google.com with SMTP id h16so14718865wrz.12
 for <qemu-arm@nongnu.org>; Wed, 11 Jan 2023 03:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UsZIA4qOEEIR12nEva/g3EWyOB93VOs7vlFpxNN2OxA=;
 b=su7N+DjL+hI+0ss7KDZTp4Ht0xOGW0DCFAZpZriljkNOs91SRoxY9/ZSn6+3wZoc9X
 I1BW8aytMmY21NmKvxBc0mv563vV0yIy3v2uKHNsymuHRz5+0RUixHcZWsn/wq89/99J
 HRz/cy9JKEWo/7/P9mO6fzVJS11qNn4uaAGuEPyE5NQR0sJICma97GNCqVfhHIQb5hCE
 ZjYFmOeJ5ohgk6zEMj1dWatQ17Y0n8Qx4fKACHKuqh6qgfO76aLXzFsM1UEvvQBwMSlh
 9xHuTppYWUhY3k+v2zNAOsD6oSgJCBKwYahkGsnzYsXUDUyfzGTCsedCjpiQDgB9Nm+J
 6rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UsZIA4qOEEIR12nEva/g3EWyOB93VOs7vlFpxNN2OxA=;
 b=IwHObhLDEoY3tpUwp/DxyyJyN876xBsl9+grLDSj2W0ILirWvGXap4D3PBESTwhvFq
 BeafASIUaYHoaHSqsyD+2eYfVlETr3ENZtVwNfeCqqyXFGY4qD8fyuri9v5WoT4l/d3/
 lLh6vsiUg5hrK1HdOrIMr9XQzSRBaMFa+GKicAe0DKqO/1AjOHAS4QR93TxPCUYxqk2w
 nF9q2+yTxiT2CEpEeRB8M6isYtVQ7ffNkuJTJeY6IzWod5PPgEHv0u4z/tn3LSvc+6JD
 JIeke+CR1UKI+fJgBSHk0pTttgLRjmRFIcGBesQ5sA0+e0otUxEIiKMUka9wTPCmhNBu
 47uA==
X-Gm-Message-State: AFqh2kq47EIu9xcS7f+EehrnrP9/77NY/ibC4M6qN3DUMzOIQBGa1E2X
 ou7E49Rbrf/VL/xivWUGEv4fEg==
X-Received: by 2002:a05:6000:4088:b0:2bb:e896:5a09 with SMTP id
 da8-20020a056000408800b002bbe8965a09mr9559762wrb.66.1673437070139; 
 Wed, 11 Jan 2023 03:37:50 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u5-20020adfdb85000000b002ba2646fd30sm15983289wri.36.2023.01.11.03.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 03:37:49 -0800 (PST)
Message-ID: <466be876-011f-40b3-8d2b-7ddd64fecded@linaro.org>
Date: Wed, 11 Jan 2023 12:37:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 10/36] tcg/tci: Fix big-endian return register ordering
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230108023719.2466341-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 697Jkk/kiIwP

On 8/1/23 03:36, Richard Henderson wrote:
> We expect the backend to require register pairs in
> host-endian ordering, thus for big-endian the first
> register of a pair contains the high part.
> We were forcing R0 to contain the low part for calls.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tci.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

