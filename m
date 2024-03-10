Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp796389ejc;
        Sun, 10 Mar 2024 11:21:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVe6z3uEW4eJfabH7cNhidtEFGu1RbpKYINUfzKK3jQF+IoNEzbFN7041lr3Mcko9hk+HN6+GE0hszkx97G13nsh3iusD9k
X-Google-Smtp-Source: AGHT+IFZCK/OivwnmVMf55NLyzDV95oY4BArs5vF6+cxKJpmUoG9kncqtN+8jX8UN6gU+BL4Pkmu
X-Received: by 2002:a05:620a:400a:b0:788:6114:7c63 with SMTP id h10-20020a05620a400a00b0078861147c63mr5485694qko.43.1710094868242;
        Sun, 10 Mar 2024 11:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710094868; cv=none;
        d=google.com; s=arc-20160816;
        b=k2kN1Wqg23tEw6WjrOqNFUbBONoBbZQEsnioUK9IaoG5BjKaLHNIfqSrA85ufWgK1F
         34gt9R6CpsgPsEBP6Cnb0HnxN/h9kzh9L1DkdQlLDSFrMN1e3OSsDwdQDbNOo7yBuG0x
         w66e17Y/Q92eZdISvbeSa/GQeKiXeqX2G6KkVb/R2WVFdAy3ShAjPv+j8PDLt7nBTbaF
         9QTG8OHAaYbBV8dyp+FWKQaEXD+f4NTWYZkiiq2uSoR9ZhZ2i6/R2AXB7bRaGcetyG3/
         PwX/kMwGB/eFJmzI1umDBfZnER9/d8Ajnm4vnXWZCWAkV8xstaK+3VNfohKVeagrFAld
         xlXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id;
        bh=tz73EFsM+CBB5iRm3pk4d1AsbJRa10N5WfTfimNSB9Q=;
        fh=BI9Pe6Z9Mv/w/YnpyeiS1KSHJEuys+gj/NtrFzpHJfM=;
        b=05ULlhuIXZ2cYeT1pYv+mEWoqOb6hC+bWFRnHxhZI/4Ij5kZrRQ5TOrtAPpTvrvwXT
         /dhHm4hFMfeZncSgQWdlYJI6thd5AuJReQqxLMUOh4D63AaKIpKwDIw8mENcnX/lj7Fj
         0S2aHxlihlmmsmR5yFxiwCZwkeLbhlH5c3vxnNblPG0z6xEESRcNns64wyckI7Z6is2R
         J4jH6fODmbqRdMY6SnJhwxF9Kmuc46bpezkLV+c0S5QJ7GEgEBbt4KupSYlfTfMc9Wrl
         mGgBlvZiNTojju3+H7ZaBn/bDyMlqZ/dAHbJI2SXzMARuRyzYfN9tmoy68Jd25zS86vG
         00hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a37c24b000000b0078826f6d98fsi3679018qkm.584.2024.03.10.11.21.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Mar 2024 11:21:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rjNms-0003IB-JQ; Sun, 10 Mar 2024 14:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rjNmr-0003HW-3H; Sun, 10 Mar 2024 14:20:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rjNmo-00012I-Hw; Sun, 10 Mar 2024 14:20:40 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6E45254848;
 Sun, 10 Mar 2024 21:21:27 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 8814B95151;
 Sun, 10 Mar 2024 21:20:28 +0300 (MSK)
Message-ID: <e3c219c9-ff73-4569-bada-b676de6fd438@tls.msk.ru>
Date: Sun, 10 Mar 2024 21:20:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] target/arm: Fix 32-bit SMOPA
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Zhuojia Shen <chaosdefinition@hotmail.com>
References: <20240305163931.242795-1-richard.henderson@linaro.org>
 <ffe7207d-c88f-444f-804f-a3597976ee3e@tls.msk.ru>
 <1f5e8229-18d5-46e5-afba-3fecf2c5504b@linaro.org>
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
In-Reply-To: <1f5e8229-18d5-46e5-afba-3fecf2c5504b@linaro.org>
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
X-TUID: jOyi+wx+iMiH

10.03.2024 21:13, Richard Henderson :
...
> If it all applies without drama, all is well.

This very fix applies and works just fine on top of 7.2, it is only
the tests part (the Makefile.target fragment) which isn't, so it's
kinda problematic to apply it without a test.  And while figuring out
what to do with the tests, I found other changes which also should go
there.

It isn't just about lack of drama.  It applies cleanly and works fine
so far (unfortunately I don't have lots'a arm* guests to test it) and
the CI works fine too.

That's why I mentioned it in the first place, - the situation is kinda
fun :)

(and to let everyone know the changes which are being picked up too,
ofcourse).

Thanks,

/mjt
