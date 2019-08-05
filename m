Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4435951wrv;
        Mon, 5 Aug 2019 14:26:17 -0700 (PDT)
X-Received: by 2002:a17:902:8d92:: with SMTP id v18mr148446001plo.211.1565040377643;
        Mon, 05 Aug 2019 14:26:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565040377; cv=none;
        d=google.com; s=arc-20160816;
        b=CrNj0nMpeibfnujiI0b1Dy3YhxlrLwqb/jv5bEqKvzwYLlxAbOzEmZDr3T7hIiRfzx
         qHCOYI/zPbG3rNJELvydXkDCjodmB+moHfquuMDu9lCz+5Ud10iQw2PtVCOqxciep1O7
         R/GYBVFQkAp40W5gBfcYlD9/bEcFSZcnkPWPrzWGIPHYPgdVzDN7CEOzAOng7JT+K7Qc
         qNwfqyZds+OoGC9lB+8pQtnBbL5qe9W7BzaXYPTH/neHAZgz5RfKmNfLRcOPBOiA0wg1
         wFTaQL3lXbjecy3XppYDKPFJ21KZ/NwEyae8ERMc5lriR92m7JUW0G9wBVAzzdsEe8I2
         GiXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=BydVPCjD1vjZ2yCfy4ARVcwydaEZbDk/OpmIhvLBID4=;
        b=uUzFo18xxzAOTeAndLdniCavH26ANqQ+jQ2QBvN3BfsLUO2EAgEZsiyy/hwh4+xlPW
         4w17huNxa8vB/cnxerxZx2d3JVAfdUeD8c1/Hq03A8jGZat0LNx4dKWZfOgCkeXah4HA
         MZezQ1iwnbnXCVoTfkDI+FtlfWZWif9xbB5fe7ZMgFfF4d6dXJ/6EHq5AeH17uEER3ll
         eemjNqG3Ve+FPqLxvIx43bngih3j5OaSje8F02qMV/l6l1DgPzKRM4xIlMUG97M/QPk2
         RYKY2O5PwrKdiifIgfcL2JKslEcNW4/kvHSg+W7N9cLtz8ngNnutzq1cJFfVHBV2CrqE
         rw3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhVVt6NH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l10sor59599102pgm.23.2019.08.05.14.26.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2019 14:26:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhVVt6NH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BydVPCjD1vjZ2yCfy4ARVcwydaEZbDk/OpmIhvLBID4=;
        b=YhVVt6NH4qI9WqnI90LpkV433+15Q2Eenv0hFUMEY9Smm+8ldvJo3gLTtfc9GuiwZy
         WOhBS5sGi21CWHdd91GsHmZsuhVPTmUTmq9ZKCdnxjUZw+qvGYWY6emtyytXRC+s6Dd1
         pGiNA4RpUg074/kMoHCAEAr3zETZPzTG+x2pBsOotAkzZxY7E8cgBD/cD99igpvTnf9d
         BQbkmT1xFvCpjiMB79wQ4IgukBX81G/7KgiygWte5ycFNRYxd2G0EqJ5RrBEEV22R42B
         bLTwT3CKmHriwKskaWpc105ymxZcCpJlpfz7Hb9DeYTnMYuvrl5AhMK0dx5YmPK3PZz/
         WgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BydVPCjD1vjZ2yCfy4ARVcwydaEZbDk/OpmIhvLBID4=;
        b=E5lPaJdxhWO0wtPq56xIZ5QYdFNVwbVIeaw13pT0TlMFBF7wY07K5SHrrT1lBBShme
         B/l+gmRZYxeDtoREYeTQ7aht6hBRMOF8NQuDVyyidEAita/CNxgbriqhm/DnUe6aqsuy
         aSLWWdyQriKGEzcWex/73+YFmg98Ijnnv0sRc4faEZYFkmM8mBFeBnBS5SPOlFsuGNf0
         Nla4F9SABL7jPrWCOebVbRCdSF2cXolMbUXZMoaBO0dhkLUH0tYIdlRX56vX6uNO1+Us
         GaBz3J9INF0xufPCVa1m9ku9+S6yu4FpoeI+STGwim7YRIIUyaJ+OQVp61i+AhfXCWGL
         NmzA==
X-Gm-Message-State: APjAAAVu+1gIShzfjgkKNfVokfU49okO3FibGHzntUJ1nAN3GDxHiLz/
	cNHtSvfz2xcVFau6cz6SEGTMBQ2bq1k+lw==
X-Google-Smtp-Source: APXvYqzW+XjEhSCDkGlKqV0c2eoAw4OJ43mLpwmq9+Q+4zEIfR1jZ9PcbzuOypZs/4zxDsPrjb0Slg==
X-Received: by 2002:a63:ea50:: with SMTP id l16mr140696808pgk.160.1565040376641;
        Mon, 05 Aug 2019 14:26:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q19sm90045666pfc.62.2019.08.05.14.26.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 14:26:15 -0700 (PDT)
Subject: Re: [PATCH 00/67] target/arm: Convert aa32 base isa to decodetree
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <CAFEAcA_JDfN+Njo8J0EhbtECWEW5_LcCVehbxmpY6AX3BLbOsA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d2b6ae73-6f48-1808-fb95-631bc12834f0@linaro.org>
Date: Mon, 5 Aug 2019 14:26:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_JDfN+Njo8J0EhbtECWEW5_LcCVehbxmpY6AX3BLbOsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 7+llu++0zesW

On 8/5/19 8:44 AM, Peter Maydell wrote:
> On Fri, 26 Jul 2019 at 18:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This unifies the implementation of the actual instructions
>> for a32, t32, and t16.  In order to make this happen, we
>> need several preliminary cleanups.  Most importantly to how
>> we handle the architectural representation of PC.
> 
> I'd be happy to take the preliminary-cleanups part (subject
> to the various review comments) without waiting for the
> rest of the series to get respun.

I had an outstanding question re patch 4:
Message-ID: <c7a3ef78-d541-aa0a-21a5-8b4f48db1fd7@linaro.org>
https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg06520.html

and another re patch 6:
Message-ID: <09b930e2-0a92-25a3-4e26-8bea1f437039@linaro.org>
https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg06508.html


r~
