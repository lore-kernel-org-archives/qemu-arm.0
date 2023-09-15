Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1204546ejb;
        Fri, 15 Sep 2023 05:50:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:1007:b0:154:9196:16c0 with SMTP id gs7-20020a056a20100700b00154919616c0mr1367280pzc.61.1694782234981;
        Fri, 15 Sep 2023 05:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694782234; cv=none;
        d=google.com; s=arc-20160816;
        b=w7pWlxo3cg/fOyjmCCSE+XpRvFJVuwIGp5Gwn3r+17MS9MTZ65Dc4OLQYSB8GeJKiu
         UlUd6VHh9vux47q6PRpzV6ioB74bXDAmYExUrEUpPsz9rp2xHx/cgMbQwTg0HrDqG71v
         UG3DCFWtTiJiH0a6psmt+OqxFNVqdqrKBAqNvZjj+RweJkn+/FVghwjlPafj8dxWUMPj
         zTGdGKHs3GJMtMP1VQl+Vre+D5rNXjFEv4TLmdagIvVuFdQ8XRWzv6RRAHbJVXtmsyxr
         dx0h1lxB6xSwdPI5mO0wcASKsW3TmqK5HEyKN98KAZJMGrc6609Q4igwt2gex2WJN8/h
         lGhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xuvzmAXdYolPe+5g4w18hDVqLwDr3K6FEZPBwiW3JfA=;
        fh=ByEKTo1dmum2LbScobfYCcvvfZhHJNEjeG1QbUbQTGc=;
        b=Ye8GIq08hdcaWouKUqm2Yn7lIbwwbfCjkm3CSC+Yvs/pH/NOyyPDv7udtLqHIpb06a
         ew1rS6h8nSyxhizIPqC369F0aw2zFgzDqXnidbU6qEpMNRhw7QFDwzm932/VE+4+tMYW
         zE0BQejN/xo1p5QUOHNHjTQfyfUd9sPZj0Gp9jd13EtDIySjTgzcxrZHktpgeQEz85kE
         0BwPP+qZ7lTzXSEhwTAz3OuXcGhEek0LZAOLDOUgxv8yO4gwJOPQFFS4aDSDMHwaHEMh
         Eq6GProJgGVF6LZ3t0hDayiXA9IPZzUdSAl0Ip2uF+Sa5XxsSydxaQsNjSpDQCVydFGN
         vFAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P8TakRhd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i11-20020a170902e48b00b001bee72f142fsor1935341ple.9.2023.09.15.05.50.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Sep 2023 05:50:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P8TakRhd;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694782234; x=1695387034; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xuvzmAXdYolPe+5g4w18hDVqLwDr3K6FEZPBwiW3JfA=;
        b=P8TakRhdB8ajrcg8NzWl4vHyJ2yruIYR9FT4EVXsQa8EKzqVjy35tr95xU3l049eBv
         IesxESRTmlHmXlqTDzPenx9Ke/PgEVEE9fWOd6cgLV1Gg6Y4l3j30If4AqcxzxBQwzKN
         rPHrTnnXU/UNM4ebY7v+cy4HHBrtJmHMjBALHPMQjFJgG6bASZV7v0wxNmweIyjrswid
         vcXm9RTX8MtFE7oa1feBpAnzL+eXKdppNLYm63eo2o0IfdQ3maYY+aw2TUvWfq5DP6aK
         39pBTmOU0KQbLc0KLqTMXXCkRrKqGd4is3Gmp26WKyklCIZ5QmS3yj5X0UMAsriFuu2I
         FIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694782234; x=1695387034;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xuvzmAXdYolPe+5g4w18hDVqLwDr3K6FEZPBwiW3JfA=;
        b=n4TpmIPNyO28NGnyfAewI4VljiVsWBToVKWlpySWnc3XLMb2Jm0haVCKULOIHYh1rp
         BPh+q3L9r1Qwtc3bxfRgELk57KQMBVOS8+Ll0dxyxHDs5Oap1r9lcWIHVQbESS97+5bZ
         D5AtmyAfIPqPX5NwOkUKmvmVX86GxX//lIAfzPntUE8wfjAW6lmZUUlTpk0htz8b6LKd
         K8FWhBtnDK7hZWeO9fzug0t9E6Za8K77L6O6ghNxMc0vxd2hyea7UjIU0jHC2wGxNK3Z
         XxswrAkukFPKuzUptjWyQwqfHPQD9QRyXBKqt6zvyddSiPDesg5NeX614w4pQ5rRlpoQ
         jevw==
X-Gm-Message-State: AOJu0Yyf0iN2Ft8L0/bCUtDdwALLVq4dGgcFp6//VinQ5Pyu1iIh+DAx
	Ai/z7E0niTRz+XRwwaZG/wOIkqYN
X-Google-Smtp-Source: AGHT+IELpO9EN50AJYjxQLJEdqYNyZ4H+8/0qYDWCPFjvY/20R8+fMfSdGUOmHaIsVS1cWJIUn7Skw==
X-Received: by 2002:a17:902:ce82:b0:1c3:6163:210a with SMTP id f2-20020a170902ce8200b001c36163210amr1463735plg.60.1694782234388;
        Fri, 15 Sep 2023 05:50:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.131.115])
        by smtp.gmail.com with ESMTPSA id jg13-20020a17090326cd00b001c0aa301703sm3415230plb.63.2023.09.15.05.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 05:50:33 -0700 (PDT)
Message-ID: <1e7ac58f-907b-826f-5a06-5caf8fb3b963@linaro.org>
Date: Fri, 15 Sep 2023 05:50:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/1] tests/avocado: update firmware to enable
 sbsa-ref/neoverse-v1
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230915113519.269290-1-marcin.juszkiewicz@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230915113519.269290-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: xWHwI0527zow

On 9/15/23 04:35, Marcin Juszkiewicz wrote:
>       def test_sbsaref_alpine_linux_neoverse_n1(self):
>           """
> -        :avocado: tags=cpu:max
> +        :avocado: tags=cpu:neoverse-n1
>           """
>           self.boot_alpine_linux("neoverse-n1")
>   
> +    def test_sbsaref_alpine_linux_neoverse_v1(self):
> +        """
> +        :avocado: tags=cpu:neoverse-v1
> +        """
> +        self.boot_alpine_linux("neoverse-v1,pauth-impdef=on")
> +

Second function shadows the first?


r~
