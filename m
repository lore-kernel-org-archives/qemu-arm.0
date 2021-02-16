Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6038774lfc;
        Mon, 15 Feb 2021 16:20:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgqci7csUOhsgxlw3lCbM36z6IB1jvTLriaXbzIykLYZRg1iVZfJlp+UZ8DHxNiMZ4dJ+W
X-Received: by 2002:a25:b0b:: with SMTP id 11mr11266309ybl.116.1613434831894;
        Mon, 15 Feb 2021 16:20:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613434831; cv=none;
        d=google.com; s=arc-20160816;
        b=iTkY1cfClUmYQsSHPdEetec4abSikfyrCslZZqrqf5uoJd4vu06Gb7YXmD6V+LcU0N
         n3Eom2TFkcfvz3ueNddsbd1ILq1+KKzl+MUqC3LilIlwOC+b+DxhW5YuytAHjVnPgE6+
         4TYXmGOQH/DFtPWc3olJhP9f2sU0LRn/INyLwX2obw644wJavSM+JvE/EpKkGyciytIN
         GA3/AHMCaLr9RUR1oCg+DFQe2WaRJnwi9ZC8N2P0mvCS0KoYfAuKhoNWv5aNa77kCtVa
         Ey76/2oKG7F3rF9it24UIEVWDGHRfwnacgBi9HXP6m4OfJkU6pTkF73AXOf+m9d7MIz8
         Ueiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=au4KXkWmTNcUG4smJDDKwoa2mn0SPZKPdMt9CXVy9Y8=;
        b=y2rYBy79VKmwO+FBJJSo88Yokw8j6Zyaa9+pYorWTHieDtDHDkkMJBzN8tpi4VIRW5
         cKMMuNydxsdeXJTp72IRyRFtlHG8SgY+ouHsrYS/O5M3yGF4Xt9GDRht7+yWbS3aE2yN
         Sl0Vb1rcgSmHIDnL5g7MH2RijSNV8qesFcfZ4kZoBT5fkAWAv31ZuVyXipId9bROOpi+
         oO5oYUzXWzJT/qJd3hfJqLHiDKlQolmJ1g0PzVz1KkAkfnTdUWY6uH8GXFxTpgdVbK+i
         /cV+uVBEihOS2Pp/aFEQbttAYpgi4AAveHnfituJQ7InZVV16HGuG6qX5bqckYBVsGn+
         EzTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G95hNFIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b64si18767262ybh.32.2021.02.15.16.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 16:20:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G95hNFIw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBo6R-0007jy-9y
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 19:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBo6H-0007hr-9R
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 19:20:21 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBo6F-0000IR-Rk
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 19:20:21 -0500
Received: by mail-pg1-x531.google.com with SMTP id z21so5167704pgj.4
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 16:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=au4KXkWmTNcUG4smJDDKwoa2mn0SPZKPdMt9CXVy9Y8=;
 b=G95hNFIwfN7I9bkIH0F34P6q/7Roq14d6wx8swvYuc35HWyEgj7awj6xqzuHpQckjW
 fWcbna12MYt5WCFMnpXX3//qUwaogF2cjlP6QPK1bz10UX+D3tw7cJMTdlYDGY5JOzVZ
 mURLO5zq3cpKVua3ZKQQZJ+7ZhJO2GUhXkDky9gJ6D06k4Kx/lnpRkmtBlSMHNwcszi3
 bvSMMV1U0EiJgH494HcDWjhUwSYUAwb5dJLjqn43pMtvF66XHj2QHB1iz4dA1obkPJbi
 Ga1xwhaepHDoSr1iRb6aOWG6fhFNznqQvMFZLeV9cOejNDmKTR7WTLG89iXTfqhEH+OE
 A0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=au4KXkWmTNcUG4smJDDKwoa2mn0SPZKPdMt9CXVy9Y8=;
 b=iW4BJE93Jq9NMVn0qec1fmeL3A8Jw3ky2kWjsIV0gdM3ItPc3Aq0XF9N2CAEjTlrbe
 83EfoBacwqTughEhYnTGJx17Bw1feMikW7TqSywZno9sTZI4fM3Zo6ZOEi9/p/GN9NL4
 OsANSirq7ADPNYyZL3thasWNUTckXVn8yuzwVrT1mLqRqVTqyMpa9xS0G2S3K6UwMzSD
 janFp4N5kk7IxBkWW+CNnBL8iMqh8xoFjV2OueweEo9CxZ7kCj1DzzhsOAeE8SNoW+bP
 jgv07zZ2a/Xsx41PcD5Xi+cvkY9F1idM/mvmdGpl439n5dkfVGhCTBby2qTudPpM/AVy
 C3LQ==
X-Gm-Message-State: AOAM532fGbq4DSPHUQOEUW9XNlYwxGfwMvybiw+cKh7+b6QFo44xzuwC
 P8h0oi6gN1QzXgFN/HPl8aTF8A==
X-Received: by 2002:a63:606:: with SMTP id 6mr16566230pgg.331.1613434818565;
 Mon, 15 Feb 2021 16:20:18 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id u17sm20784234pgh.72.2021.02.15.16.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 16:20:18 -0800 (PST)
Subject: Re: [PATCH 2/3] target/arm: Enable FEAT_SSBS for "max" AARCH64 CPU
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210215215819.1142-1-rebecca@nuviainc.com>
 <20210215215819.1142-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d7aa2e3f-f2b0-eaf7-d1c7-48c211462c45@linaro.org>
Date: Mon, 15 Feb 2021 16:20:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215215819.1142-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yKp6/JuLWFvI

On 2/15/21 1:58 PM, Rebecca Cran wrote:
> Set ID_AA64PFR1_EL1.SSBS to 2 and ID_PFR2.SSBS to 1.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/cpu64.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
