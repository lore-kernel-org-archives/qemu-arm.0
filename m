Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7548205lff;
        Wed, 15 Jan 2020 14:43:52 -0800 (PST)
X-Received: by 2002:a17:90a:8042:: with SMTP id e2mr2794585pjw.16.1579128232124;
        Wed, 15 Jan 2020 14:43:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579128232; cv=none;
        d=google.com; s=arc-20160816;
        b=JckjVBzhArinnU0i7tw7PbNRNbBB1bTUUGrTLypr4u84wb/NixaZk2UM4yoFy/UJIG
         KJD/ULBXe/vEipubEc9FQJYNcNp6khioe/2RzJ1NFqjJTxOHO2Vg9YnK+H/NkSbKEa/j
         RBxtQLmKbAZ9C7rQH7luit042Irrq2wvtCslJWvzcJqDTXM6vWJR8eN8mK4NvKh33+3K
         SkjAZe8bwNgizxyByJSEcDnaeA0JvEarkqa19Nd2yAMeDy/BCvly6+vB2+DffzHvia/k
         dS+zBXyI+Ae0ZAAAAE/qtXauj3KMkoUo73Z6g7XQeKAHyUENg15lspBvkgWdJhw/4YFB
         wIzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=un57dcIx5HObytcanXfgeTfwBeEsPp+Rk2OinvRYvgg=;
        b=ITp4JYSXWKCigvypfpPm4XlLJwLw1a7h15aBWqN3ERXQMRjH1p0cg6F8qM3WIitVnr
         HnB2bvWno3Twq/9vfebn9pX6yRgdeg7uHBauw0AhWymw+FB7aN4khGDhbztf4lUwr1o6
         wIrzpXiOVH7vHn/BCHcyprlpx0pZtjP4/w4yxin4DZzOTI61EzAivC7KPPtgKpif5uiF
         ytfSbGduzowj3h650QzbZUEiM9+q1UKZTGnSqlcYcGp3UpllXt4i4Dghj4B1RTVXjMPZ
         jprUVjIgvtnWYMnZedDLSfHl/zTlu4KGYvy9DTHOIf5d2toLGsypSNu01ojczKfdcEVe
         puSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z8tDhmcR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o99sor1556345pjo.20.2020.01.15.14.43.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 15 Jan 2020 14:43:52 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z8tDhmcR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=un57dcIx5HObytcanXfgeTfwBeEsPp+Rk2OinvRYvgg=;
        b=z8tDhmcRvojP3laN7mukL6HMH24VYVGC55BpUC4xRunLgenll7Z8ReukFQuTfWSwBf
         MM2qw3uH+tFGNaOz95KQV0ZclbdQcpWD3x98ECg9r8V8NP570r+S3SJOQ54jGGaPYnZu
         TRmOgvkwTUnC0jiwJPrzonMC/DP1mVlw3SGznBsvW46TCQMf9xbUCrhaD97IwvQtdMsU
         o5y8Y5XcKYAYBCEkcFfkFmM6lUzOUzp4pTx9XXZM5EvSKLlkGb0IkyUUFk0MKUDYYEf8
         hqtIj9uX8lJOr+1HOt+x5MvaG9w4/4tEiavHbdPt4ha9VIB6PsBfC9RV8hnzCzEYNy4Z
         a2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=un57dcIx5HObytcanXfgeTfwBeEsPp+Rk2OinvRYvgg=;
        b=F9786Rxw5f+XKsMexXB6AZf9tca5N8MT20yzdI0SeGGlmc1X0kEk2xLyT1uIV0TRLj
         hO7KH2F0BQhCDpc+RzEsGytGRmh3bD/kGorOpNhk3FGnvKVamAXmmhWw4A2UDuO/aTRl
         mlZJdSQ/+ZBLmQliZeC1qdLXx7JrRsSXyAl4BUslXby0WE7wzHaraqUn9UjZ+upXKJ6z
         N6QyR0oGHFA5a93eqlzcgqGu+BszruumS+TO/fjgXZ6k0YruoUQ0ChoZXF4HcQUuH/NE
         AusaTB8OJCxzriJBogCmDDzxnjjYb87+XDN0oJstvnYu8sPModDF+BsahgZL0/3XYXoc
         Nuxw==
X-Gm-Message-State: APjAAAUETjBzKLDkJY+61CU9876cUFjCyQCBmIaGcseKwBsJqIl23JDh
	RBFXBO/4MhDPR5kH2s4OWz8x5WMo9epO7A==
X-Google-Smtp-Source: APXvYqxkRAgcWXlkpbuNCz0tCzMIrTdeh9aZJfHtXK0NY/wf/N9lK9zNsfxvkUNQDol/2CneFJCgeg==
X-Received: by 2002:a17:90a:98d:: with SMTP id 13mr2793552pjo.102.1579128231675;
        Wed, 15 Jan 2020 14:43:51 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.3.43] (rrcs-66-91-136-155.west.biz.rr.com. [66.91.136.155])
        by smtp.gmail.com with ESMTPSA id r7sm23563614pfg.34.2020.01.15.14.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2020 14:43:50 -0800 (PST)
Subject: Re: [PATCH v5 17/22] tests/guest-debug: add a simple test runner
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20200114150953.27659-1-alex.bennee@linaro.org>
 <20200114150953.27659-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8d576d7-4d4f-fc29-3898-872848ef1aa7@linaro.org>
Date: Wed, 15 Jan 2020 12:43:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200114150953.27659-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: DEsepuvPbtL6

On 1/14/20 5:09 AM, Alex Bennée wrote:
> +    if "system" in args.qemu:
> +        cmd = "%s %s %s -s -S" % (args.qemu, args.qargs, args.binary)
> +    else:
> +        cmd = "%s %s -g 1234 %s" % (args.qemu, args.qargs, args.binary)

Oh, hard-coding of the port is going to cause failures.  Multiple users on the
system both running qemu tests.  Parallel make.  Anything.

I think we should really consider adding support for debugging over unix
sockets or named pipes, both of which work well with the file system to avoid
conflict.


r~
