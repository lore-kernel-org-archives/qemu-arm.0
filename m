Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3608539ejb;
        Tue, 6 Jun 2023 09:33:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:a425:b0:10f:7abd:fe5e with SMTP id z37-20020a056a20a42500b0010f7abdfe5emr114873pzk.40.1686069235442;
        Tue, 06 Jun 2023 09:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686069235; cv=none;
        d=google.com; s=arc-20160816;
        b=ZDBpVpKhzVkBLx2/YUzbxOVTbG/GtzTRUEeFnn4HTZQvL8+e2mr1Jn4XzCVbC/tlP4
         Bv3E4dmwt4HmCAt/Uuq8tPJK7+c2alw5sWblvegWHdWLMsCzFYEguxUsVem76G0HHRAb
         xGJaWSXpHNNNvmUoEKMfRnfkqqIHExElMUMSfPwknWoNzQmJ5XGVFVPiy3H7QiL/Txyi
         9kxNgc+9QgiQI7vqeNl9beEEI3owpwF5kS2rh9lEuwP22r8NfF7Bp9yLHiDnKbBXwOFZ
         PuyFRSHc5q0R1S2I+7yViKcu8Pv8zc2C2ESC64yuaK/PGLmPfx7JEIs3mJPQMqp1s8gN
         yvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=uwzNbHVid0QdBW+VK8OUgztWX+dCkqeks8RvSC54Phs=;
        b=b1yuXEYqEZ6SAAL9Dk94WwdmjZZiTLGDxqubE7f8m/bci5QWch2lATZ7kiDgKbsRSZ
         VYLEiSTpf2ZqpdHLhr1RAxIx94NDaBcwRt7UuaaGP1zl5qHy2jGdJCAan4oYXTNigx1a
         DcHXD3lzO/vuoStp/8kOPz9KMZCRGaC5qxueZdZFYAFAbRKXDWzGPiSQQgwdC86llotG
         PM3dfS30Mw/CoQj3aWZaZQbO9q4zqsdV20n4b/aehmV6wM1+4rbQVelBkvdiZYipd/Gr
         TS6A/4pI0J7tezlSRPouP81iZYq5yOhwf70E4pQAjw6VH/fRuO850b9RvqTc8UpJWWgd
         6CNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=opjBV8I2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o11-20020a170903008b00b001aaf92130a8sor2158283pld.9.2023.06.06.09.33.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Jun 2023 09:33:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=opjBV8I2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686069235; x=1688661235;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwzNbHVid0QdBW+VK8OUgztWX+dCkqeks8RvSC54Phs=;
        b=opjBV8I2kc9ljiFWkeFChGAtl2dPcNPdFuwda9NzDxZ1GsT37G3ZQxAxa//aMmF34r
         2AcVRVlhLHvMkYiT/t7Th81vD60udHg+fk5ehi7qvLEuTwCe+6VXzVUmZ7o7Ruz3BSQL
         sx/BZW1h8KL/4v1y/OaI62dqZB5AbTL8OqVS4jjX1/HIsjhdlxYoChQHKdqGoIBYw5Gs
         G7MiKApS/NrDQRdjStRiV/iQ6LIYXHigSa5AIKjcCDSdxKdDFcEDuaFis00HZDgOGmSE
         mv9tpcvxd5Xwr6cvEOdbWGc5hhuREodgwgnzv781rWqdsDibd8kKIM3EmalhOj9GkAid
         91SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686069235; x=1688661235;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwzNbHVid0QdBW+VK8OUgztWX+dCkqeks8RvSC54Phs=;
        b=HvH3zm8oAWTIAfRVCDc/jZ5wNeUL8lta7oqg3UciAxMgiMD1Kxi0oJMny1SVRlwkqp
         kuJfjMMhHFS7hUGpvnLIlD4HSpzafpiabv0hSrsoiOxWEb160spxNGI5VGAn3T1UzfGF
         93Z+EXSDOOGMQVl2t5CsbqnO609DcGjHSTH3KWJjItkbnHJiBklhiv+CXnPSak5Co2gw
         QhyB3P+AR/f8kdBxWvRbtT2Dmhz6pTuJO/ZZKlHEcnlG3HB379kskRa62Z9vAi8CzG1H
         /SPAHlOfJk6nkyyORUfpdZjlpuiqAMli4QlM7TNecL97o2GIobpK5IgY+Q+CGXtwYrgo
         Y5TA==
X-Gm-Message-State: AC+VfDw63CTPsmic8utudJdBOLC1qaKXMJ4tfAdS5N9pRLx/QdxyBmkb
	D5YQSWdoTqZlVIbVUb0LwmQYGpZc
X-Google-Smtp-Source: ACHHUZ6iUA2d2lId+3IRVF/DpcwfPylAOh3KP04zB3XGM+EnFzCXblR65wLOj+J6CRTJddDQ4JBQAQ==
X-Received: by 2002:a17:902:d716:b0:1b1:9d43:ad4a with SMTP id w22-20020a170902d71600b001b19d43ad4amr1129770ply.44.1686069234985;
        Tue, 06 Jun 2023 09:33:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a? ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
        by smtp.gmail.com with ESMTPSA id y20-20020a170902ed5400b001b034faf49csm8712730plb.285.2023.06.06.09.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 09:33:54 -0700 (PDT)
Message-ID: <6fc611eb-59f0-4943-08f8-f6653a13d4f4@linaro.org>
Date: Tue, 6 Jun 2023 09:33:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/8] linux-user: Expose do_guest_openat() and
 do_guest_readlink()
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20230606132743.1386003-1-iii@linux.ibm.com>
 <20230606132743.1386003-2-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230606132743.1386003-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: NsYSwnf64IeT

On 6/6/23 06:27, Ilya Leoshkevich wrote:
> These functions will be required by the GDB stub in order to provide
> the guest view of /proc to GDB.
> 
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   linux-user/qemu.h    |  3 +++
>   linux-user/syscall.c | 54 ++++++++++++++++++++++++++++----------------
>   2 files changed, 38 insertions(+), 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
