Received: by 2002:a05:6214:acc:0:0:0:0 with SMTP id g12csp1604735qvi;
        Thu, 22 Jul 2021 10:54:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMBUeJJ0YjN/hCVRV5w/nlED7rMVYC8N/T13FprwQIMNScvG7lpsSGttfvxL0HDiP+/bCy
X-Received: by 2002:a25:b701:: with SMTP id t1mr885130ybj.517.1626976495863;
        Thu, 22 Jul 2021 10:54:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626976495; cv=none;
        d=google.com; s=arc-20160816;
        b=Ry56oW8o6wVWmv7fce4S9RjPm0Fr5bLH2hQROQgmyA8aWaHsJEeThPS19CewtoJ0U1
         wJ9pVVp7UNzUKrZ1Q9btaSXUxnt9Cw96+q3gk5+9M/LCd3NosLXS6u4x/3L1kB3q2ix+
         /JIwMnJSt+LCyHDdHhNaJQUlSPy+HuPJsO6ucF0OTAgpidpNjEDydK0NyWfx+tcb4Hwp
         c4W9BJUjlKgQktCj1CxUKChNua0TfmCR2dKW24d75K4+g5hvzPHYlF9/9pSdNaQzndE8
         pt46ARxYvElqmg9LLy/0xkQj5BlBkqVvcoAXkkjl2sEEyrSpBZ+P4Xo1u0dBjYlsgtbI
         iuiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Z/hNEd3hK8Un1Ihme4Y6kXKzkzlfxGaDxGhD7QiKgWk=;
        b=X9kXmzmXEx9GBEX+Gn+r2dm/2qVpnymwnbHJxNcgewMrhdpH5TBh3Xt4jzre5w3hNW
         6lm4WrSluvHkAtOt2IoSQUs53rveekEWzykFXMRWMcQwPGL2hNzzXYgskJ00v4Ip3WCN
         yv7f/PkzN/tlzqTCp2YUyHevcSHD4h7O18t6ONq2kROuEPxEJRtgeOhJjetJrwX4xLvo
         GmkTRIefhkSfdj0kGOrxmoA0iEJA9XgzYXhvC0pDOO2K16llsFhNZR8M6qkU8/swzuN5
         XLYVOWCIAU6Xnu47kYnddFyRXPaWvCoYDjthaLfPzzCedPymVIx8qAb5lVupsNk/7YrG
         Qexw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QGCp1Qoi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12si4715552ybt.464.2021.07.22.10.54.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 10:54:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QGCp1Qoi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6cuN-0002JV-Bo
	for alex.bennee@linaro.org; Thu, 22 Jul 2021 13:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6csW-0005ZG-9J
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 13:53:00 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6csU-0002Gd-Ce
 for qemu-arm@nongnu.org; Thu, 22 Jul 2021 13:53:00 -0400
Received: by mail-pl1-x631.google.com with SMTP id e14so5403894plh.8
 for <qemu-arm@nongnu.org>; Thu, 22 Jul 2021 10:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Z/hNEd3hK8Un1Ihme4Y6kXKzkzlfxGaDxGhD7QiKgWk=;
 b=QGCp1Qoi8fvVdfrLtcBbNcZUHhn9k7t3ztOb/tdo+C+96+DPXTrWBl+OaEKrl7TMNF
 RytmUUtQ95+BFt5s+6HigJRqBk3RhrGlOYZpgdIo9XDHhw5DTZH5yXJj9wxF6MXr3KXV
 BeLxsU5UhKwp/Gjs9opl1pjs7ZzeTMIDApCC+YLf2zn87+YLItmHgMQm/snI2b6uJQcX
 4WXAjWCU7IhK18cVTAIylTmbNIRqCae/4Sczpwd/ouZ5LhBDBw1PQrMwCFuCehk8SsSu
 9Z4PHl0DD2UHG53xvHpQ8GzAE2JB59urc5BR+a4V61ds8lLVNoxp+JMUiD/Q2cy1sKKI
 n85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z/hNEd3hK8Un1Ihme4Y6kXKzkzlfxGaDxGhD7QiKgWk=;
 b=eUowNJqPBvWCHDNdeJuftkupLHzYS7Bmrb0jDGjwPhR7AelyHV5aawhmpZ5qUQhOlk
 elfF54DvSzCg7xiPc85/z0wkiaihfxkhMO2RKYK6/nIHmNqZY1/EK5k8Fh64p5r/j4qB
 +/SAq4tb3FQF3U6M0+x5VvCdCePdNI0IkT3eYis6c8g6Qp9ZIPwl45QPGZCjbp5R78ct
 AltUnGjQldu4usVyhGkejVfGEw1sxRFNkzD8Fvoh4p8I4nLr4UAry+6gXEqo0xmt6Ixk
 a7aoyKfxN00+57LsYJaI5cwzpxxau/h6dAvJKAXQudTYMsmXDotbqS9u/Fdobx6YSX57
 UjzQ==
X-Gm-Message-State: AOAM532x3iAaxiLWjEcbf/51orIW7tZt8KunsToVF3xU8zRt/vAd8Ea5
 +ruSJWsD30Zi06oZ3vp3zi6pHA==
X-Received: by 2002:a63:4b59:: with SMTP id k25mr1098732pgl.252.1626976376626; 
 Thu, 22 Jul 2021 10:52:56 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id y35sm23009914pfa.34.2021.07.22.10.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 10:52:56 -0700 (PDT)
Subject: Re: [PATCH for-6.2 34/34] target/arm: Implement MVE interleaving
 loads/stores
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-35-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6221fd83-b59f-72f1-e992-104d823dba7e@linaro.org>
Date: Thu, 22 Jul 2021 07:52:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-35-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gh6SsramN+T/

On 7/13/21 3:37 AM, Peter Maydell wrote:
> +        const int off[4] = { O1, O2, O3, O4 };                          \

static?  uint8_t?

Otherwise, with the help of your little print program, I can confirm that these offsets 
match what the pseudocode produces.  I hope this while beat execution thing really pays 
off in hw, because this description is nuts.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
