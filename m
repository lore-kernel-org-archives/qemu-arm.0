Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp53105eja;
        Wed, 21 Feb 2024 22:04:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWN7M5Ia85Es9ZmfxI6ivaQ/f85/H4thN6Bio5O9DmETOu4TwOO3bCv0stmTciTRQfrZIvDfuYhKRHJXHoPUwiCcRXC/yFP
X-Google-Smtp-Source: AGHT+IE1FOL820QhCp4wMmqf4h9YoM1l+FOBc48FYVY9fawpMNTv/YNBDYG6eW1Uzv1PQ7+gONd/
X-Received: by 2002:ac8:59ce:0:b0:42d:c63d:dde7 with SMTP id f14-20020ac859ce000000b0042dc63ddde7mr25225711qtf.17.1708581883956;
        Wed, 21 Feb 2024 22:04:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708581883; cv=none;
        d=google.com; s=arc-20160816;
        b=LZ+qZLqZprp1s9ZE7QAcs6K14LDJr66mhdNU3yOqDNzMK7hTbFNUrICeEqD0ooJcfb
         akrYn7Ds53g7DDf9niXKzs9+HDE4KjRWOUA7muotKMPjMgtSCwfyTjNVlft5IjY9u1ym
         EvvFx3b+O322SBPHeAks8hsleXXPK5GEmwIat2REbajNSMt/ZA9mUCaDknIGNPpGyfFT
         E1fJt9KbWqKYyT+wCUVlE9mxkH1NDmpjf5DsBZtAXtlOxftqD5M6fwfr2fV+fONa44Lv
         l6+/ynvPoYdftuFjughI2w971xHpSk9E8wFWw1PGj3mJ1iRkeGLXeMuornEqMJDFco+0
         O6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id;
        bh=1Z3fQwZce6c4EAJ3cRok9d+8xp2LyAhnrMu+6DB3U/A=;
        fh=XC2TqlEyHcZYTUoNUcigPBdXwDuE4SlR/HZOPwUjYic=;
        b=XQW2roahrFlt8P4nfWr0kVGcBICzI0h7wEqX0ptPg6iv0Lm0chRglTqdlOibuYXyMa
         lTmKYtTvhFBftNCjCYdPQL32CKRo7PdW8Z1oz0xEZBhURYGbS5Q+mw6WZov53q3sG8SZ
         k5JbpHe3oRA1mZOvgcSPyrhIDNY2DN5bM76u3GQJ36bDLsjwG/zyiYT7K0vvoGvnEh+J
         7ZiPsWB+0WaNGDBUtaK/j0/Mid9jhNxnUx8eMNPddna8vOQApMTWxB87yJrY40bsyC1h
         Gt8um2cXXLAZYEaJ5owchRrcKW1+FpN2iejyxLAxWZlAtp6+lZ0XrUUyxq8ApVqvbMfV
         ShHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s24-20020ac87598000000b0042e50c47cafsi210805qtq.47.2024.02.21.22.04.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 22:04:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rd2Bw-0000YL-Ar; Thu, 22 Feb 2024 01:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rd2Bt-0000Rr-Qy; Thu, 22 Feb 2024 01:04:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rd2Bs-0000Hl-8m; Thu, 22 Feb 2024 01:04:17 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 341554FA15;
 Thu, 22 Feb 2024 09:04:37 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1F42786C80;
 Thu, 22 Feb 2024 09:04:14 +0300 (MSK)
Message-ID: <34f501b4-94d3-4cb1-96b8-1d2a77013817@tls.msk.ru>
Date: Thu, 22 Feb 2024 09:04:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] [PATCH 0/6] Fix missing ERRP_GUARD() when dereference
 @errp
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
References: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Autocrypt: addr=mjt@tls.msk.ru; keydata=
 xsBLBETIiwkBCADh3cFB56BQYPjtMZCfK6PSLR8lw8EB20rsrPeJtd91IoNZlnCjSoxd9Th1
 bLUR8YlpRJ2rjc6O1Bc04VghqUOHgS/tYt8vLjcGWixzdhSLJgPDK3QQZPAvBjMbCt1B6euC
 WuD87Pv5Udlpnzf4aMwxkgfTusx+ynae/o+T5r7tXD+isccbC3SiGhmAPxFyY3zGcFk4+Rxc
 0tP8YY2FWE/baHu+lBDTUN79efWAkHhex1XzVZsV7ZD16rzDbXFK5m6ApvGJWlr5YDEEydTF
 WwmvwBfr4OINVxzEG/ujNiG4fpMf2NsnFGyB9aSbFjXZevB4qWkduYYW+xpK1EryszHtAAYp
 zSBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1PsLAlgQTAQoAQAIbAwYLCQgHAwIE
 FQIIAwQWAgMBAh4BAheAAhkBFiEEbuGV0Yhuj/uBDUMkRXzgoIBEZcUFAmBbcjwFCS5e6jMA
 CgkQRXzgoIBEZcUTIQgA1hPsOF82pXxbcJXBMc4zB9OQu4AlnZvERoGyw7I2222QzaN3RFuj
 Fia//mapXzpIQNF08l/AA6cx+CKPeGnXwyZfF9fLa4RfifmdNKME8C00XlqnoJDZBGzq8yMy
 LAKDxl9OQWFcDwDxV+irg5U3fbtNVhvV0kLbS2TyQ0aU5w60ERS2NcyDWplOo7AOzZWChcA4
 UFf78oVdZdCW8YDtU0uQFhA9moNnrePy1HSFqduxnlFHEI+fDj/TiOm2ci48b8SBBJOIJFjl
 SBgH8+SfT9ZqkzhN9vh3YJ49831NwASVm0x1rDHcIwWD32VFZViZ3NjehogRNH9br0PSUYOC
 3s7ATQRX2BjLAQgAnak3m0imYOkv2tO/olULFa686tlwuvl5kL0NWCdGQeXv2uMxy36szcrh
 K1uYhpiQv4r2qNd8BJtYlnYIK16N8GBdkplaDIHcBMbU4t+6bQzEIJIaWoq1hzakmHHngE2a
 pNMnUf/01GFvCRPlv3imkujE/5ILbagjtdyJaHF0wGOSlTnNT4W8j+zPJ/XK0I5EVQwtbmoc
 GY62LKxxz2pID6sPZV4zQVY4JdUQaFvOz1emnBxakkt0cq3Qnnqso1tjiy7vyH9CAwPR/48W
 fpK6dew4Fk+STYtBeixOTfSUS8qRS/wfpUeNa5RnEdTtFQ9IcjpQ/nPrvJJsu9FqwlpjMwAR
 AQABwsBlBBgBCAAPBQJX2BjLAhsMBQkSzAMAAAoJEEV84KCARGXFUKcH/jqKETECkbyPktdP
 cWVqw2ZIsmGxMkIdnZTbPwhORseGXMHadQODayhU9GWfCDdSPkWDWzMamD+qStfl9MhlVT60
 HTbo6wu1W/ogUS70qQPTY9IfsvAj6f8TlSlK0eLMa3s2UxL2oe5FkNs2CnVeRlr4Yqvp/ZQV
 6LXtew4GPRrmplUT/Cre9QIUqR4pxYCQaMoOXQQw3Y0csBwoDYUQujn3slbDJRIweHoppBzT
 rM6ZG5ldWQN3n3d71pVuv80guylX8+TSB8Mvkqwb5I36/NAFKl0CbGbTuQli7SmNiTAKilXc
 Y5Uh9PIrmixt0JrmGVRzke6+11mTjVlio/J5dCM=
In-Reply-To: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yfQoJJpVZTVr

21.02.2024 12:43, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Hi all,
> 
> Thanks to Markus's explanation about ERRP_GUARD() on my previsou
> patch [1],
> 
> I realize that perhaps more @errp dereference cases need to be
> double-checked to ensure that ERRP_GUARD() is being used correctly.
> 
> Therefore, there're the patches to add more missing ERRP_GUARD().
> 
> [1]: https://lore.kernel.org/qemu-devel/875xz0ojg7.fsf@pond.sub.org/

Hi!

Since you're going to respin (it looks like), please include the initial
patch (hw/intc one) into the series as well, so it's all in one go.

I'm not sure this should come via trivial-patches tree though.  Looks
trivial enough :)

/mjt
