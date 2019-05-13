Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3047381wrg;
        Mon, 13 May 2019 09:59:03 -0700 (PDT)
X-Received: by 2002:a62:5e42:: with SMTP id s63mr33259462pfb.78.1557766743061;
        Mon, 13 May 2019 09:59:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557766743; cv=none;
        d=google.com; s=arc-20160816;
        b=aa0uNf3jnJGNoFFv5j5NYcqHCH7YKRLoBjESx53XNe5Urg9Pv4L3qxvCgPw6n1SWGR
         1vf/GylQjDGohMfUctoqnv7y/8YiQhzbBoSFjMQDb1VN+vOGqSK3RbP2QipfXiV89mEg
         KZusUo4igqduGS1TNTxfy9SPopDM60wxY4lkuHHwWm4dzjDf1N+stEcxyOdueYfxdfhW
         Apgg5B5f8wK/XI4p+FpdPoP4GVx32KvpjSp6WGxZqQkopLGdRvd6EjHzHiUX/Gp7ZuZZ
         /TIzJnHrIXN8K7gJc5OO4bGTDUxHWcMi661cXFIRxDxizpAfCsebpWYIwmhdlzN+qMNJ
         8NlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=fwJ2C32JschXyEWG3/I+al1N63kx8GG/SRmKe/43SQs=;
        b=o3yZOisV4dKF8fwPlKsPhrpfIGnkPzE4VLJjYnl8pAdF2Fnfo2mXi9JSkLfypHxhGq
         t0+zcY0OtX/ekjoVfzGk+dqCF6+1gBUbDq19dHelA59JY7yykDcfTHJTiWrmccgn7br8
         F2VStpBQRINqfwht2W9TERwNcFn4fe6A2Q0eIuTjU5iltIVyBNUqVs5c6YDg06o5EGXG
         2DsEOIHeaE3NvBKlDmU/WNcOJRzEASWT5pxFIkyhxxGpnkX035mb8PvyhvxLEjm4b+SA
         Jdl6Pub5+KxncOKsUTzWPyVnq1hwsRTr9Wrc7TB4VLRAsPCGKrDcL9vFlQVsVyKYrQLN
         My+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GmtpGy/2";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a20sor17178655pfh.35.2019.05.13.09.59.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 May 2019 09:59:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GmtpGy/2";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fwJ2C32JschXyEWG3/I+al1N63kx8GG/SRmKe/43SQs=;
        b=GmtpGy/2KtbMGngVbVBENYz+Cx6aqd+3HN1mgmRGlbRDkN3DoSymJkE6Ln7EMIEa+y
         b4DQAZH6rR9MJWdx6yG7QK9B6yfGUKXlMAFghWF3kmY0wIjKyRg4s+3gMuv+KT6pavoe
         6Q+JvrS5sC16UCechxrh07DIHrhKzNGCGkklp8PyDB0YTIdeQW6N6z1I+hUXYvJ6C89W
         oXwbJTp5WnSWmyevFSUW2bF1pQHHDy3rSEKx4mJxRqAg7rpMB26OEms4lAoPjCAQzjTT
         VgBSmyU28ducDcDTCHAIj909CouyNeeFOhnsQ/e0FZZ1VoZfjqw/oks8HlarRAz+tgWt
         Hvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fwJ2C32JschXyEWG3/I+al1N63kx8GG/SRmKe/43SQs=;
        b=AwxQKJyfNFWDMknciIiDK65k/Y0v6twWXEU1jVUe9U/coBiRaletY6D8HJ1+zolt/B
         DWtxq/YPrYzJfkoexFH/W2y5u9JAC4iS+BgPG5yLnRiXjYuhPJi3m6OSUCSviYnSaSYf
         Znq5IWDORD61nbP41sdSujGW3KanRmebYr+38jdRj2O3n0ct4jDAXwq8pKeBbHHRnRva
         VFcnoSavIR/doMdQIFz6xl76AEYOjBVjUcdH8hBxL/oiO4idUxf9TAJTl2EIGN0zQ6bq
         m+u26CtPdWaNyQ1jwDx7+j4kBoBlpD/jCS5LWrnByAImVz1G0IUoMr0rkEvym28pQRO0
         w+pQ==
X-Gm-Message-State: APjAAAXQx9AVo9U0DuU8Agg32NXErcYLp2omwbZuCiwPYvEczjyd5jsj
	UvCtrCSW3rcicwqg0555k2+DMhZS1SIoYQ==
X-Google-Smtp-Source: APXvYqzq4WH0pBu+B24p6c7VD6a7p+9rdSBosNVb9miIviDqWN/+t3szaWb8HFvn3V8TWD47aLZgTQ==
X-Received: by 2002:a62:2703:: with SMTP id n3mr34812141pfn.199.1557766741986;
        Mon, 13 May 2019 09:59:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
        by smtp.gmail.com with ESMTPSA id u38sm22934299pgn.73.2019.05.13.09.59.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 09:59:00 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 05/13] target/arm/kvm: Add
 kvm_arch_get/put_sve
To: Dave Martin <Dave.Martin@arm.com>, Andrew Jones <drjones@redhat.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-6-drjones@redhat.com>
 <20190513124356.GG28398@e103592.cambridge.arm.com>
 <20190513140726.vpmenrfw4uocmtnc@kamzik.brq.redhat.com>
 <20190513143929.GK28398@e103592.cambridge.arm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <956f9bc9-1024-b02a-e792-98b01d016ef4@linaro.org>
Date: Mon, 13 May 2019 09:58:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513143929.GK28398@e103592.cambridge.arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: dbzM/tVM0zmQ

On 5/13/19 7:39 AM, Dave Martin wrote:
> On that point, could TCG easily be made to expose a larger vector length
> to the kernel?  I'd be interested to see what happened.

It would be easy enough to extend the maximum vector length within TCG.

Increase ARM_MAX_VQ.  Alter the couple of places where we manipulate ZCR.LEN to
extend the current 4-bit mask.

How large do you need the max to be, for testing?


r~
