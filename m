Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1987612ejb;
        Tue, 24 Oct 2023 04:50:23 -0700 (PDT)
X-Received: by 2002:a17:907:360a:b0:9b9:faee:4228 with SMTP id bk10-20020a170907360a00b009b9faee4228mr8939784ejc.56.1698148223740;
        Tue, 24 Oct 2023 04:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698148223; cv=none;
        d=google.com; s=arc-20160816;
        b=GSog8/m3J1eguwJ8yox/TvmUlED0P8NuzMQ9SA8SGk1/K1e592aJsj6d3HsqvRzJ66
         twG6wwGEomXlhP2/OlJHiCuQ0M0dPPD8sHka+o7i+QQXezwbpRZC96cIlD6IZqjlCv+3
         54Ceg6hKGtFolI7rCDGc4GmVy1GKeLYSwoG72BrtVLThcU+8anj/ZqR7Epeb8D7QuaKO
         K3U4Lu7+sqqxexOdNfeRygiLzKdFiaJaZi55Pp0lF3muCBYZBYedML+fU+H0AfNaiWXX
         Ie27PB+9gcD+0yBnJtpg2/L8jGgZEUw8EJEj4ee9/0tkR6i4MbSyiesA9tRcqqTV3T/+
         FrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tFNkksxJIeSv3+7doL2YjUOz2Bf6puKbX7Oo6QSRG2I=;
        fh=YTc/AN8qFiKc1d4F7AaCUK6jkXNDPYZjLVkVxSSdJ+g=;
        b=04/qsz1aqHsCl/z04ChIAWjjxdKCE0pj9xVIZMA3IxsZMY/RY8chuuIw5YtDy5d6YL
         g/Ly9ev3D9l8BVdYYdlSRFfaaJmUm9ShZhSW3ILCVg8GTDpOUABe/H3N4nlYnZGmO8TA
         jHdADkLlAOkXwiMRR786K/k6+T4K88/TvfTM3bmdr5XtbWNosJYgXF5OAr7MtLhQx803
         zGpCv44Pt7H7VOystH/GiLNdzVqBQBudDuL9YMyRbcAMWRiOYEmrpUxy8wAmSVm0VEd5
         GZOlxp+FavQPXYD9dvIq6FAIhB9K+7tACbSYlct8NRrz8aSPanEK0ps3bripIV3T2Iye
         u9ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rFdnUE2O;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x23-20020a170906149700b009c3c4b15e88sor2593795ejc.16.2023.10.24.04.50.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 24 Oct 2023 04:50:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rFdnUE2O;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698148223; x=1698753023; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tFNkksxJIeSv3+7doL2YjUOz2Bf6puKbX7Oo6QSRG2I=;
        b=rFdnUE2Ov4eP7wr57Cc9/ZvKHUn/rCjgSPErJGKqhym4aKFIrjtAG3h/8Q+T8hXyls
         nYV3hju6S02S+l8Hiau/MXTLpMvqacgJItVrMHKct7Vo+rtHSC7LvfRT70w7ZuAe10JE
         o82XDT/vaMvuhCNVIArxi0G546oUNSCrOKxF8yiTYtHFemppApIxqvd1z3jFp6IT7tMA
         P3cEFJzwveasabKkxL/2fYOTo+Wflc1JTkyXu2RpZHrmGfofuWlSkXhe6/RSBuThyQ0l
         nNqs+9hvDlfQ5Kl80rnfwrxYDf3b54/kq+5kC8xFc9wYHvZ0UvKI6+8u+pw/xmw+xuVO
         b9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698148223; x=1698753023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tFNkksxJIeSv3+7doL2YjUOz2Bf6puKbX7Oo6QSRG2I=;
        b=jUkakohsl95kl5EqWFKhTN9/OFPjgOn2FQO9hwHIFmmkT1XeZliF4MaN4Rhl2XmUKR
         dJqad81aKoH86ycWi3ckl/BJQDFhAAAiI/5g/5ozKdgOhpqSNQDTui7i4tqmRuTc/P8K
         ea/Bvxk75urVZwCG9n5hd3aN2Irr0envzveL0Gvy1xIQK7id/bVYXbIm1/4jaLWyRr3W
         Wt6E8GTKg298hyTq4HfSo7ro7o8OzjXQYQFB5dLLkRjDpBweAQHTJdvtPQNsZcXsfG2T
         8B1gjPmkF5qoDnuZ5x2DHNeSJSFAE7ybkobNIVwY0mqhjzvqyEmFRcYOJDQmZMDSFivK
         Lfkg==
X-Gm-Message-State: AOJu0YzchW2Fhsdu6jSCGj3RDMs2Q6AsPTCOjtS3rfsZA274nTxgUKiR
	jkjgct9tHpYkLdh4PsrZKr2btEXSkDy5M1du7IvrDQ==
X-Google-Smtp-Source: AGHT+IE8+GJzhB/+IeuU/XMieiqGpVYgjT3uKYrPexPExMx3tqZVNcwzWh5ToHzG1MrXuDrnlViF6Q==
X-Received: by 2002:a17:907:749:b0:9b9:325f:9be7 with SMTP id xc9-20020a170907074900b009b9325f9be7mr9643028ejb.42.1698148223054;
        Tue, 24 Oct 2023 04:50:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (sem44-h01-176-172-55-165.dsl.sta.abo.bbox.fr. [176.172.55.165])
        by smtp.gmail.com with ESMTPSA id 25-20020a170906005900b009c65e13c33dsm8081879ejg.122.2023.10.24.04.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 04:50:22 -0700 (PDT)
Message-ID: <c87866ad-568b-1917-7617-c63b137a196a@linaro.org>
Date: Tue, 24 Oct 2023 13:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/8] PMBus fixes and new functions
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Titus Rwantare <titusr@google.com>
Cc: qemu-arm@nongnu.org, minyard@acm.org, qemu-devel@nongnu.org
References: <20231023180837.91785-1-titusr@google.com>
 <874jih40a3.fsf@linaro.org>
 <CAMvPwGpXZxyoX1WNypgNCW+Uj+bcVPn99vF71Myx7jn_c2Fjdg@mail.gmail.com>
 <87zg082twp.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87zg082twp.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +fJvt26rjlBz

On 24/10/23 12:06, Alex Bennée wrote:

> A pull request is really just a GPG signed tag that you push to a repo.
> You can use the existing git tooling to create the cover letter for it.
> 
> I've included my exact steps at the end of the email but really it comes
> down to:
> 
>    git tag --sign your-pr-tag
>    git push your-pr-tag
>    git format-patch <series details>
>    git request-pull origin/master your_repo_details your-pr-tag
> 
> and finally
> 
>    git send-email
> 
> My personal exact steps are integrated with my editor but are:


> 8 Preparing a QEMU Pull Request
> ═══════════════════════════════

> 9 And send the pull request
> ═══════════════════════════

For these steps I just do:

$ git publish -b origin/master \
     --pull-request --sign-pull --keyid=0xMYKEY

which uses .gitpublish from commit 08bb160e02,
calling get_maintainer.pl for each patch.

Using GSuite, I also have in ~/.gitconfig:

[sendemail]
     smtpServer = smtp.gmail.com
     smtpBatchSize = 1
     smtpReloginDelay = 3
