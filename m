Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp542677ejc;
        Thu, 19 Jan 2023 10:39:12 -0800 (PST)
X-Received: by 2002:a17:90a:fcd:b0:229:4372:908 with SMTP id 71-20020a17090a0fcd00b0022943720908mr12374577pjz.12.1674153552249;
        Thu, 19 Jan 2023 10:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674153552; cv=none;
        d=google.com; s=arc-20160816;
        b=zjpR2fmBx9JGvF4EjeHxt3e54uvzUdJfx6IqljiFgLN5zZqNJ4ZbtcSER7WSiXLeXM
         LU4B9cWRqKVnItAWrR7wtxs0tbHNDBqkeOSDveaPoylLh+7tcDzai2ElOY8WxlSIxi/s
         FWz7xkStsx8NIKcgB1gh26/CGQy+WhL8Vn8ggNbu4e12l2eGZ8jYjVgAdUsEE+TFXBVv
         qxlJn3oudCSZ2NGOGK0glIgu1NLeTFMhaqgnPSCI2pPWtHdry0SkkcXSYD1EBLg+f5yn
         kD6XAUW5TKArVu7ajbHGgTIP1FlMNp9yQt4fscWzv4so3lSp2CYR4Q5fySCMjIb5njfB
         BFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=aa3coja4AMjFyZCcxHTLfv06BvIUp4JaeTzXQxnFees=;
        b=k8tyMNCzl9U6U7kBM7wZNxLN8JkoENyMhwKuH9Zh1NEK4WgzPSdnkPE4eL1lyFgwJR
         u42rTxmIerNS43hK+dq5A4xSzY7xOcbSWunS6byHm+FNygyM71LCryt78PGzhVzSYgYZ
         BsE0NnG9uGX2lxlaphcG7/jbq22r+VzApD28BC2Vh2H4DX3Nj9tXpApqiQIu0187WzTw
         74kvVelvn4O4Xk3zRoYK0SELLunPZQNIb9Qkbr/KRpvCrppVX4l8GoL3Ck5m+3+71FpY
         TnNXzCdtp2bRm2wcngwBcP2fID7lOTSYYr8Bi4IZuIT+g9GPbxY5+sxN+IfeFy3WxSZQ
         T6Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wF6xJoZD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id mu2-20020a17090b388200b00227017e0325sor2600161pjb.39.2023.01.19.10.39.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 10:39:12 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wF6xJoZD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aa3coja4AMjFyZCcxHTLfv06BvIUp4JaeTzXQxnFees=;
        b=wF6xJoZDraOe7jgghqWHYU/Uke+NLyRFjAwuOlT1vJIJO6+hK7hu6ANxYYXq55G6S+
         gSjWTgPzKUqkZCpMR64R5n5tXMS3Fh/xDzk2nmrdN28nsUPt7tsuRy9pu5xAz8YmxYzY
         M30GaNFVDYrcZUKJLO4DVSGGbspNPe81uz6XBAtD/61hhsJOygorLjsHJxtgvx9zK4uf
         xKyySk2qUqaAG5h6y2WfynfGCbZfU+thYypve7PZZIDAM+JajizQT1M2Jhyyi6uLpgb2
         DibSTq1xWdjZspsJKb7AsHbacR7Pg/aMJYAxh2mFe5uR4++m4yrelfR7jekpjw1sqkrZ
         hORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aa3coja4AMjFyZCcxHTLfv06BvIUp4JaeTzXQxnFees=;
        b=OVaUHq48N4ht05HzLvIBoNscvU5qMosjusFybLgN9bMzqz6Ty1bJj/PbcGCsIEmqNG
         ECpqzbtxkptS3EndvYwN5hP9ROmKAS6B+wqwkLc4lJnFFkcVmkJwHPyytY4E2LfhhRij
         HjwpV31VQIeQpihQz7UOgPaI8SeakdnyIoeJKlWABfhHcu+5/ZJJ14DIHpQnD0Y7k2sn
         2TK5Pg+2oGvp0SJwQ0rhwpf9c0Z8KMWFw4TYNhl6OAjhxaTgqk1K5Dsb000y9Q6d0tMw
         eOGHm2+avUvlPZa7e3RB2s/DptjgfB6bYsgxF6+bKxV2yP3DGolKUAnT6EEYQHidyFxt
         2W/A==
X-Gm-Message-State: AFqh2koRAKGjDXdOHa+rbOVKNdrpmKXGkPg4mMJZW3C+ZVCJAH7cW9LZ
	Un4Y4d0Be/VvJaBmNWzxjck3Nvd4
X-Google-Smtp-Source: AMrXdXv2AnVGpWaMDTa3ADPubQPm+NVhL4Neyg/ICY3EmVMUMerQevmBPIx8Bu7pcEmLa1q5Wgmz1w==
X-Received: by 2002:a17:90a:5509:b0:228:d353:9614 with SMTP id b9-20020a17090a550900b00228d3539614mr12064292pji.10.1674153551795;
        Thu, 19 Jan 2023 10:39:11 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id m1-20020a17090a414100b002276ba8fb71sm3354610pjg.25.2023.01.19.10.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 10:39:11 -0800 (PST)
Message-ID: <a94c1ff0-9b27-6af7-0858-8fc0fac1bdd4@linaro.org>
Date: Thu, 19 Jan 2023 08:39:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 05/15] tests/qtest: Restrict
 tpm-tis-devices-{swtpm}-test to CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-6-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: pVPcEbBcxBK7

On 1/19/23 03:54, Fabiano Rosas wrote:
> These tests set -accel tcg, so restrict them to when TCG is present.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/qtest/meson.build | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~
