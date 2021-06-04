Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1496491lfa;
        Fri, 4 Jun 2021 14:11:08 -0700 (PDT)
X-Received: by 2002:a17:90a:ce0b:: with SMTP id f11mr17966663pju.185.1622841067905;
        Fri, 04 Jun 2021 14:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622841067; cv=none;
        d=google.com; s=arc-20160816;
        b=lgmbSu//cveYGglKj0+OIxZ2kpT8C4Vn4UErER9rFnrOGdyQfrq1nvfPfOaiTcq+I0
         Yc2GHAABStWqAzShBV0jmlFQ04/UH7SxDKh9lSzM6h82zj8Q4/guub8SESUb4pRTxm10
         asNe+QqVeMHizf8IligH5njw5WZF/VXr2ZR8/1JMD7DpprS7kfrpvE/J3/DHtPbqPdPu
         atXLWHCoy3Ox6+defmOL8zf9VLRSVWY9K28f1QAO2r4jzBwxfEkfi9g7mLAAWp0sjUxC
         1rY40dE16Z/VWsxHj/Jdwz58Tk8LKHK0KoJVHSu4izffkpKNCaiSMldqTwn4TuNa5kKs
         qd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=OyD2sjNyY1BjO4Be+Z5lea6RN8tHriObliOV2pRNFBM=;
        b=hjecJADjdw0SaxuF7jPnsnQroCQG5FvsJTCSgGOcrq8Q9NzlwZ7LYtXiP5Qvu/AKvM
         nwU1QfT35wME7DQEMexraFBozjeTAVJipuwptG5RJmHYgGcqnUwxyCtpEDMi5lM3hYaq
         LQXru64OUL1tbrzp79Ckg+GFAwNTuXHP9nAnxEGW8rH32f9BF8dO172cEuef/hBVyDi+
         a//m4eLYPHgV7OE5HxAp28kLTZf9rrdpmkOxT7pewhk6ffx+9lGQ0Z6hERgbV79gF8hf
         +HCRMTaNzmOHVDulU2HFPWxrsnawaDKmEPTzQxjAdmTBc85hMdDOg+lTyN5rHsphwRkq
         DsMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lRZXDanR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h32sor4143650pjd.31.2021.06.04.14.11.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 14:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lRZXDanR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OyD2sjNyY1BjO4Be+Z5lea6RN8tHriObliOV2pRNFBM=;
        b=lRZXDanRMs/CdVc4kV+uaO8fEZmfs3+Fb7NT7LPzsQrLbi/J0KQkjQ4qhqwIADO5iA
         bG8DdeFrNalluNa1PAAkDb5FNCzh0VS82zb4ecq21mhr++AL8Cs2vT6E89uffzBOqGhu
         3qGqOnMpd/XnlXatRt4pL+PRGN2qLPnaVXTdgXEWQ0OhXwee2UVtnX5yjxzp9RtXKqgL
         3hAAxSWIuMEti+3DI4Y0iE91zkzVrMMdB0Z9s9Cvpaejj1O3whEfQLg4gdLOL/Z+6eaf
         cQ+3P0DAUkcy61VPwRYiUJqe7W/4Z5pqFwmMQHdCWd6kWI8rI8MgbO9vH7aHPuhi9T1R
         /dMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OyD2sjNyY1BjO4Be+Z5lea6RN8tHriObliOV2pRNFBM=;
        b=ZiqgD9egSnBjuZEEIrSU/47ZLPTdhYDc7nq5Ir6YhjGsDoh4h/sE6hEnrmCRnwICo1
         BO0HiCUMuJTnZdu8VJLDPt1pXol449c88ju3KPqA6tRKnc5xTQeERcKvbAB1MIS520I0
         7WJ0HWTkY9Tn67gMCpEyeW4FCeChYzgjVdLFP4uqirEECxvpzHfh0gvlrvJ+uW+TIqhz
         64Upp03qnQxmEVu5Ewaj5R5Fh7YzQyWAYflqbQiUt+uSpAjfYTPX0GziyAOlbe3dZHAY
         +A84BJkpeXgm0rMRB6AOA4DGurjZlcSoX1s8yndYyscKJTDBgjwMq5A+8YWD+hiD5GBW
         +/Rg==
X-Gm-Message-State: AOAM533lyY6qzyXdDKrFZAGPwDkCK/UiLRwHXYKkVCc3QfhKq1XBCWcU
	u8L0joY4DaGAYMGWbBSZ0XvdzM2s
X-Google-Smtp-Source: ABdhPJwR/Va6Qq6yndizYOZzPaDjrBWMse84sI57fGlhbXlEdm1uppQfEAPPUGdVZqRMLYDZ40vnow==
X-Received: by 2002:a17:90a:b10a:: with SMTP id z10mr6972142pjq.226.1622841067326;
        Fri, 04 Jun 2021 14:11:07 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id v11sm2476220pfm.143.2021.06.04.14.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 14:11:07 -0700 (PDT)
Subject: Re: [PATCH v16 08/99] qtest/migration-test: Skip tests if KVM not
 builtin on s390x/ppc64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <115f0f77-96e9-7eb1-c22f-d7dd0114d8a8@linaro.org>
Date: Fri, 4 Jun 2021 14:11:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 6xlk/D1T3XMC

On 6/4/21 8:51 AM, Alex Bennée wrote:
>       if (g_str_equal(qtest_get_arch(), "ppc64") &&
>           (access("/sys/module/kvm_hv", F_OK) ||
> -         access("/dev/kvm", R_OK | W_OK))) {
> +         access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm"))) {
>           g_test_message("Skipping test: kvm_hv not available");
>           return g_test_run();
>       }
> @@ -1398,7 +1398,7 @@ int main(int argc, char **argv)
>        */
>       if (g_str_equal(qtest_get_arch(), "s390x")) {
>   #if defined(HOST_S390X)
> -        if (access("/dev/kvm", R_OK | W_OK)) {
> +        if (access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm")) {
>               g_test_message("Skipping test: kvm not available");

I would have sorted the kvm test first.

For s390x, we has the HOST test, but ppc doesn't.  So we're doing the access() 
on any host, e.g. x86_64, where kvm cannot true for this test.


r~
