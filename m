Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp981433wrp;
        Wed, 4 Sep 2019 10:17:15 -0700 (PDT)
X-Received: by 2002:a62:1747:: with SMTP id 68mr22870012pfx.63.1567617435250;
        Wed, 04 Sep 2019 10:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567617435; cv=none;
        d=google.com; s=arc-20160816;
        b=AIyk1am/ISWUroMgicnVhRNHebASGt4+R8fgLUGBzc1DKx8eu/SEjDkKJzcsi5Wn+z
         us64EEX6UmMPfrlFOUeH7GC/A9vLssewk/+u4O1nuf5+CxLFyFW2nz97CY8rYFX24Mtn
         Lifiqpd2bfrTGcH21dsDl5yOtH2B+vKZ4+wo9fmnPvU4lMJhDNmO424Z3uOEkw9OAb16
         Xee9XHDiw02VbFaK3/c5H8h9DO3+JM4dEY4esjreRnJmY2wzdazwBRPK6appnEOpsxg1
         RpB9aUFRua6WV9ZM7nZmsMhFncAMyPeY/VmXsKnW5wmOOSLXueybOig7vRxehMGKkQQl
         9QsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=LqfvCooUecTcAvY3I97IQS0lczVLAEae8uSNHnFIF2o=;
        b=glbDdLdHAvA2RMyTBOXcala3UXp4JyJMdwTQVhzokjd4t5hvNK+Motj52yLg+u6/Sk
         4G2KtRU+YeOVI85kfO+ZhYThlrs8nkNrK2Ic0VV6+R8Riw58lBcPmR6NZwrS46GNxV3v
         bvBFVFVtAajuu3btKiFGC/0wk3Kspz5uh7c4w8v9w7DJ6sDJaAP2IbRznp4BCZpoQfPQ
         5skg2T1dX7+iby66MKql8wXnlH76t2vQd9EX+k/6lx8rpODuu1QqcOAcw7D9KpN1Eb4I
         0wfD/K5+oQlC33/0dKNCxqoI/JyH+8yZyGCbyG1Ylc3tEzuS5AL+2CatVSmcE78TGQUc
         ie2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eT+fF16H;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g31sor26949422plg.39.2019.09.04.10.17.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Sep 2019 10:17:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eT+fF16H;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LqfvCooUecTcAvY3I97IQS0lczVLAEae8uSNHnFIF2o=;
        b=eT+fF16Hu+H61ByhBofnafkbT0vrygmlfMN1mIumFvXJOsv/jHDGwo3LCSntLQNoEZ
         Sj73TG5pmrh8eo15buBubV/MmKvF6mDwb9PdutpJaKW3iY/UI6Tv2swyf+Ip3VFl9E54
         wzc9AFy6O88B6z+bTov8g/MG60Czs6c4aeqBUtC5d2DVfcTa3Vcl6XSf5IzoKr5TNWSi
         Y1P869O85P8xeLwgqbzMvuLH5hJQ0cLyQRNa7qum/UI6dMo8w+hIIhvxtqk8Bo7SAt0A
         nGWW0/yaVBmD0tg7tJ5pWsyJDf+VCZBPH7wXNSe5tcfYf5WPzzcJhG3kDKoRdfLjmSj2
         G7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LqfvCooUecTcAvY3I97IQS0lczVLAEae8uSNHnFIF2o=;
        b=gY43USkMe49vtMxVCJInxaRI+LrXxaR/NrD6RQNJNIKHJSNETsm5AfelyEw6ufPWvc
         rwcBrXEJJlkMVT/3c0X28a8XTG0e43NXcjckxV1jGnZmA74Tcym4z6MqEV7GvX/b4tED
         s25pEL5yi7waHF9CV7WKe3xeX3lF7segIbgt1UtSr5goka3A06UjHRksV47nDczvj8NK
         JYA433fnYVpu/dq3UUGN1tIPlaJs2Inhk4jKLacehRDXhA6iEyXzEipZMJYYaLFXdZgm
         L8lPQd7fVRmvEbTfnbOFB0ciDZhCFaSkXvA5RW3JDjfpw/bO71qaR7/GSMX2r1ePhBBw
         pPTQ==
X-Gm-Message-State: APjAAAUQtuu1w+CwZRdtjIWBg876GSKsTDLhgBDiIRF/oDjphZtGP3x/
	8PUqqrqParBuVwX5Cg5Z9ew2ps1+
X-Google-Smtp-Source: APXvYqw3ekoIyNs3yjKqa/ffWJLc8hXJev7ip5jdWCSqsTHnoxKIL+ItX1INdVC5wtcILCzBcVystQ==
X-Received: by 2002:a17:902:fe0f:: with SMTP id g15mr19168537plj.2.1567617434713;
        Wed, 04 Sep 2019 10:17:14 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id e192sm22825379pfh.83.2019.09.04.10.17.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 10:17:13 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH] HACK: Centralize sve property checks
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, armbru@redhat.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, imammedo@redhat.com,
 alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190810013112.28732-1-richard.henderson@linaro.org>
 <20190904083252.7pmmjvbynik7dk33@kamzik.brq.redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <63d5994b-3834-a011-3853-a76986f8e6c5@linaro.org>
Date: Wed, 4 Sep 2019 10:17:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904083252.7pmmjvbynik7dk33@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: T63mlIYOI44W

On 9/4/19 1:32 AM, Andrew Jones wrote:
> How would you suggest
> I apply credit for it? I can give you authorship for any patches that
> mainly contain your code. Or I can keep authorship and add mentions of
> your contributions in the commit messages. Just let me know your
> preference.

I don't mind either way.  The latter sounds easier.

r~
