Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp821813ejc;
        Thu, 10 Aug 2023 10:09:02 -0700 (PDT)
X-Received: by 2002:a17:902:b187:b0:1bb:a8f7:a4bb with SMTP id s7-20020a170902b18700b001bba8f7a4bbmr2674667plr.5.1691687342300;
        Thu, 10 Aug 2023 10:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691687342; cv=none;
        d=google.com; s=arc-20160816;
        b=iMEQld0Ht7r0JyqjTPrGf5rtxvqfTrr7LN0q3z1k7rr/vSZ24DY52eriDpSIp3qEOI
         PdF6KDxp9hlsr9HO4yYOTuyfNC63n/c32Z9D+FLuIFmmeJNj3E/PhvmUi66NY54oEanY
         3j4fovN4Chdrm3ks5F4xq0RmNzLQgdEhknZUv/2s74Keq4ooLh3JJqBom1KEZCin5NjQ
         v57d7LrcI6bTQIo7E+2oqjag99hoE28VoceG3pXH3qoaXEMTiSdcUaed0qqyXB6Zx0uM
         bb1zVQf8AI9z+PiThloLsrzaKX72Ep5cgwqUa7Zq32xC5LBPigBpIvUrUbIQmWP4qWCr
         aVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=w0uPLphW8LC/jvwJiZeCt7jQpI3ur+tbnXpH6rkpk2Y=;
        fh=ihiwTNv69pUMQ2yLjv7oagE4C9JLaoKJ/y7zQfEq0ec=;
        b=eSIBAj7vSiVI1+wSWICu/1fbzc14lFTl1/FxfxnDJc5PmHqdA62XXBre1QgVr8PPr1
         hyYp9VxJou4MRtpdzt5G7tLHkm5paqIMfYO6VPmJiwluqEVodR/LvPQ5wesoJypLXufA
         8gworUwerGfAqrS3nKqHtZM2CXbGa0VjkpgZcBefGkskpDLZL5JykYtDhql6WjKgfSnk
         3usyM/0KbLW6i0F1SQna2cq63580lMv8MTXvXz200dB3mlMsXSitlqelhjm+mzXK07df
         LZFQTDqAUJRitaDRLbkAnx4uZA1eyvs2Uhu4M8RQYdiG5d5xc6h2RV2WDEHv+Ylc+BPG
         KdvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z/ENrknF";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ij8-20020a170902ab4800b001b8c99b9b82sor1067940plb.6.2023.08.10.10.09.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 10:09:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z/ENrknF";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691687342; x=1692292142;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0uPLphW8LC/jvwJiZeCt7jQpI3ur+tbnXpH6rkpk2Y=;
        b=Z/ENrknFJocR0dvbDvKWkcziIg1JB6x4e7av5lIq/X2tWuOmI3WcAD2JS/vOmIMkEb
         oT4Rrs/nphVo9EJ4AOrh0yY0N2lEqAuZ3euGp7enRqh9SoJrYHFbzxYy3cYE5qosC+fy
         BRXZu95VS/tklPaq8D2BadbhmAqzrK+gB4mh+1iELmBbNRFNgnUKRzX9nkUglQc4zAWz
         hd+5yzNIiNmVm2FOsX+Lc0ZvVL8REI8iqqaBaRJnrG4hY0NrNN6OXrkMvLahzfBLOCgP
         rtNUUBABy1TPSZjUKYGdZqlC+NhsgrmEjfcz1KgYhKHzrLiBccDsoXT4qzb4+ZK3vE/s
         3bYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691687342; x=1692292142;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w0uPLphW8LC/jvwJiZeCt7jQpI3ur+tbnXpH6rkpk2Y=;
        b=bMlrd8mQEXClBH/pSxHpYyfjYp8v598m0t4GjcCQEeO1+mULAQTA09SwrCPNXXGtdb
         13V8q8riXJ9/MYRu0fP89+8PYcDBuoxQuc1HFQPmKccXC8ZM9KwNQrmdEPO8f29n1gWh
         TI+AG5H1CqiMhpLYtWWTFEFQ/Ix0ccfzKOJeYfLu4Ur3rcbBCsLi6lDhsyMJAyHv8AzP
         x/S5U064E+UpimkZKtgq6KqgkeUZMdb2z8mOrJh1SVhRHT1dXCp3OgVlqdLlLzqWOVua
         UmfF8RXd/BraR6AbRYRmNoyDSRcCJK2t7n65HQabxEwm1WSU6qmQdmFej2M9qbpZ/qmM
         UyHw==
X-Gm-Message-State: AOJu0YxSZJBOhFLjG4orZVl1DM8qhHHINmIRO10Xt+2/1w8Q6SCLtWGe
	aZCwE2WARfmLQ2QuMc+WIsRqhtq4m7ZbFzpDH5VN7A==
X-Google-Smtp-Source: AGHT+IHRf/FfJnHOqqu9i/EMEAMRJTwwTS6SMvefJlZwP/N6o2W/7Kfx9ONIFhA+pZ49wZW4DPo2Kg==
X-Received: by 2002:a17:903:44c:b0:1bc:6e8c:eef9 with SMTP id iw12-20020a170903044c00b001bc6e8ceef9mr2001201plb.51.1691687341756;
        Thu, 10 Aug 2023 10:09:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d483:7301:9e4d:b830:d4fd:9164? ([2602:47:d483:7301:9e4d:b830:d4fd:9164])
        by smtp.gmail.com with ESMTPSA id i4-20020a1709026ac400b001b8062c1db3sm2021363plt.82.2023.08.10.10.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 10:09:01 -0700 (PDT)
Message-ID: <ae63cc47-9a7e-1b89-f412-4b3d470b79d2@linaro.org>
Date: Thu, 10 Aug 2023 10:08:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/8] tests/tcg: clean-up gdb confirm/pagination settings
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Yonggang Luo
 <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230810153640.1879717-1-alex.bennee@linaro.org>
 <20230810153640.1879717-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230810153640.1879717-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8mybHhgTgBNA

On 8/10/23 08:36, Alex Bennée wrote:
> We can do this all in the run-test.py script so remove the extraneous
> bits from the individual tests which got copied from the original
> non-CI gdb tests.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/guest-debug/run-test.py                         | 2 ++
>   tests/tcg/aarch64/gdbstub/test-sve-ioctl.py           | 3 ---
>   tests/tcg/aarch64/gdbstub/test-sve.py                 | 3 ---
>   tests/tcg/multiarch/gdbstub/memory.py                 | 3 ---
>   tests/tcg/multiarch/gdbstub/sha1.py                   | 4 ----
>   tests/tcg/multiarch/gdbstub/test-proc-mappings.py     | 4 ----
>   tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py   | 4 ----
>   tests/tcg/multiarch/gdbstub/test-thread-breakpoint.py | 4 ----
>   tests/tcg/s390x/gdbstub/test-signals-s390x.py         | 4 ----
>   tests/tcg/s390x/gdbstub/test-svc.py                   | 4 ----
>   10 files changed, 2 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
