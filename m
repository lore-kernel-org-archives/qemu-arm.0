Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp633971lfg;
        Mon, 24 Feb 2020 10:23:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqzJKfWdSBodHMj6V4sEN97a0WhefxSeeTf5PYK/+xgbBvuMEzsO590asTQnlN5vkLIH39Zs
X-Received: by 2002:a05:6214:1103:: with SMTP id e3mr46583127qvs.159.1582568626870;
        Mon, 24 Feb 2020 10:23:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582568626; cv=none;
        d=google.com; s=arc-20160816;
        b=fkh3BrG8jjEr+D+8N+zBMzQF1t5hcU+MmkLir6Pqa8yfCURG3hK62r1FwsDjGeSen6
         U0LzB048FNxa+58J0vjqXQTLadPauuDkUKnMPipaMR7SnsUA1dTuznRsDApAceAOU6RA
         L21gk/VT3g9eTNIqomdancyTJxvPXkJtea/OBQAklejodw1Xwh7XmufunXee3kMAux7D
         fMZdomDfSMqH2P/duCAleLM2UsKrDPM4qd5tRI4uDCiKizLJYE/2VWm92So+QoPZBIUt
         RH5pmbycAg3eloZWbnB14CcwXDzqlhechNOHqDgT6fec1oAcMrImz6D2jNoE2rGCszdq
         Ygvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=i7+QysxbUWWA8SBQ8EwFKE9/Z0g3DLxmXdbhS0hXLxk=;
        b=kFyipFmoR80ncsKYYKbdXwOYp0wiTXM6W6/RQvcSPe5gtakFqK2ZSRc6HUPQqd2g1D
         0xVXVKq+96TreTUSD3VbYJpU/1XszSyFXv9MkckFE0ySrFhH947rR7jpyYdSj+ozA9eU
         mM05r41N0xwFt1DfVYHAUO8q/Rc3pf5IoK3iO8evOJ7nmv7eKSHgk8Wyb2afB2LGu3gL
         0bnnhAGCmlbw+5DR0wukXqA8uoxGeIsw9Vw03ZfA/9+ovW00C2N6kwrDeKP6yHJttIJp
         O5qHhhU0orjMDckR3eR0txqw1ADLKvuCueoWMn6KDm288Z/+rbtiH7pYHvK73xj0KVxX
         gOBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lW5AU5h3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si6380845qka.328.2020.02.24.10.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 10:23:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lW5AU5h3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6IOQ-0001ha-Ay
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 13:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6IOG-0001cy-L0
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 13:23:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6IOF-00039F-N9
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 13:23:36 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44470)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6IOF-00036L-IE
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 13:23:35 -0500
Received: by mail-pg1-x542.google.com with SMTP id a14so5176107pgb.11
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 10:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=i7+QysxbUWWA8SBQ8EwFKE9/Z0g3DLxmXdbhS0hXLxk=;
 b=lW5AU5h3L6B+g9L8dlfBZXrDT067s4+Bz3TNRYdqUYBCCAQQ1E5h8NYMkA3Fq/UB/r
 7/gPsQWFxN0i5muFv9k6mfaaZP4HM+Zeg1Q9T6Mm5a1l7aXQ/3Rt99vwcwV3aX53an2+
 oRtT0HAW9WJpYJT4RJo0qFOJ8k+2Nu+RVfGIPZsW+232Kx1sqd7JloxqCbCFqA+hlueP
 Dd4iuhliBUIk+w/lrfgNOmGtgS65sICWcdFXBKeSGskhl/bGTq2fDKI0pYUgPGDp15q3
 HOor/bERd5b5rCSEUDWGc978m/xBGrXf5CNZZZvFa6r+ggZfc4F+5SL8OlWkVpUqrykR
 XoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i7+QysxbUWWA8SBQ8EwFKE9/Z0g3DLxmXdbhS0hXLxk=;
 b=FmqrPX60Uv1BwuudWG9Fd3dUgkcrck+53RDraZN/ZytWYi/SHfF6eNeuhFoJrMGbmh
 evd88AGNJXOyysJtYaHgKpqxHR4F9riEgqHFRFfaYSDlPGOtQMLI/+rniyH5XJl4EsUE
 cDWh1UsUuqc46/hXwf0vERGSPDYddbHzZL/dmwoOmElXda/XQHAqNRUvERMsoIfrK+26
 IFrNuc+2Ja2jJg3iARNQrMI8EpI2noaLoAJQ7jwcpLCC3HZiBepPoMWgMHKT4WbnwGyv
 mwmYM0hwBTKufbkj5hOzPatL7wIsCRMs6ylCtW3trMez0U91lYYJwpEZM0wME9kSGjit
 2KZw==
X-Gm-Message-State: APjAAAV550r6zHMKgy0yXaavP7TcXS8j6/tO9WPT7EMyFAGLbQSAlwwW
 sEwCIXxHWw6lWx7ssXuQvzsvCg==
X-Received: by 2002:aa7:8695:: with SMTP id d21mr53740421pfo.199.1582568613405; 
 Mon, 24 Feb 2020 10:23:33 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 r8sm133168pjo.22.2020.02.24.10.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 10:23:32 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: Fix wrong use of FIELD_EX32 on ID_AA64DFR0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200224172846.13053-1-peter.maydell@linaro.org>
 <20200224172846.13053-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6c7e4128-f0a4-3885-ee75-031b7b6517e6@linaro.org>
Date: Mon, 24 Feb 2020 10:23:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224172846.13053-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ypcFxK9xO92O

On 2/24/20 9:28 AM, Peter Maydell wrote:
> We missed an instance of using FIELD_EX32 on a 64-bit ID
> register, in isar_feature_aa64_pmu_8_4(). Fix it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
