Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3181056wrq;
        Sun, 24 Jun 2018 15:53:05 -0700 (PDT)
X-Received: by 2002:a65:5c03:: with SMTP id u3-v6mr8199422pgr.402.1529880785109;
        Sun, 24 Jun 2018 15:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529880785; cv=none;
        d=google.com; s=arc-20160816;
        b=XfwPz4yBmGva+2kDW0eXLCGrXi3D9LS25QJpBan8f9DhEw4SZP/wu9BdGe10l5Y1w8
         TPAp0+2mmKAG6CtKI/gla4kbefap9TNMxPemeFX5SbAcd0HXw1PEV9qVNTSqSk50eKTy
         5kLGudgyaHuZlZx5y20/wqaNoeA/h7YiujkCi14fk5n/SpXKUDsVRiBHUb9IaQa7XDaT
         cIb+/9IRgN69DlNEWZOHlp436yKz/rzHrCPw+NboSMESR0qIqnC8YPL1nLX2c+w+nKsb
         ErTisGFEtIJqSZZfea0sgncWb0S15HjIU2ENkjaRcFFV/QrmuzXsD4mmNjBCt9pxufxv
         P+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=0pKKTc05BfqehwpWH5KgyWNNVwJoUmw4d6/DM94kFMM=;
        b=OuaibtVE5M3zwUI2CzJ5gkfgIY3tz0thSfD3WxNFaCDaFTzecLCshonHm46a4lm+c0
         6qcZ9ThCK/w7jDzWe4bj7gLnFY+NwOo9cexTAgqZ1FnemMcD2FJZWP/u5XhM4RLkBWjh
         7KUh1Ed5kErOwiKo/HxAwBpd7lSfrTbcM965HGeJpsolemJi31QQlFmguyCqBA5IQIC5
         A7n7ftC0F07H8a2kyAhJYQu9QLVjNPUB9/x4ky9IpqoclyJ721B3DZZmSyIHQfTnxY+n
         /CS/LNIz6yl07w9xMeLoBLYtCWHWWsBVnJ4xvh3WaTE3C5Ja7UVRKF8AuCFOK8Uw3sCl
         7Z1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/h+vTpS";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o1-v6sor2522555pgp.240.2018.06.24.15.53.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 24 Jun 2018 15:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="e/h+vTpS";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0pKKTc05BfqehwpWH5KgyWNNVwJoUmw4d6/DM94kFMM=;
        b=e/h+vTpSiwRYZojEVT3RCBkRfaNLG1sFTrC2gpr6hs9z1WMPcwzEb7ZLmQ9Pcc0Wim
         59CrF2bHyKfDce8GuXk9tnU/W674AyLoey05cIvF0+BC/FkFQOjoGoVw+YVdEU6oVQHh
         6M4jCY3c5x9JMtJXyrt0jVLQPAG2T+wYU6OnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0pKKTc05BfqehwpWH5KgyWNNVwJoUmw4d6/DM94kFMM=;
        b=UaoThqDqeongLlEOLvaHQjcRbYj9ZHTdw5Enzaw/DrELHvIjfh8YhmCWbVSWqGn+Nw
         42UUXGdDVPFH8His0cD0XszMQelHRpCe0W7wey/hASPlZQaXacNmmgIO5ZDWe9imW4aW
         fV9mzOwFTTMau6O3Zqod5OkndujpDwA5kZJzJmiDGrf7161ea1Doww8/JgeIigLkwfb9
         a63NzWGFchxSljqt0t91eJdq3f45o3hC/5CsddtjDiF0wbL1RmNRJ7FXkTi7RWkFJdMd
         1FtAK5M2A2nxQ2KkFXnuw9Lc4oGsDhEF96aMoCrt1WprwOtHOHF8umK4WyffzeFq+IdI
         PtKA==
X-Gm-Message-State: APt69E2/IQTynEVmPlNm7hzVnsO85SfU3zF8Hg1YHB0S4aWQzXjXhFNc
	zIm+KccjeSTRyKM4sYmfwbQEebwK
X-Google-Smtp-Source: ADUXVKLKXfuOG2tcBVnihUBzQCIUtEVoxFU76gCQ/SKC7mMW/TaqzdPUybi8oGtKNdS9W/Ec6VoSlg==
X-Received: by 2002:a65:508c:: with SMTP id r12-v6mr4093294pgp.115.1529880784690;
        Sun, 24 Jun 2018 15:53:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net. [97.126.112.211])
        by smtp.gmail.com with ESMTPSA id g2-v6sm23018694pfc.4.2018.06.24.15.53.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Jun 2018 15:53:03 -0700 (PDT)
Subject: Re: [RISU PATCH v4 12/22] contrib/generate_all.sh: allow passing of
 arguments to risugen
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180622141205.16306-1-alex.bennee@linaro.org>
 <20180622141205.16306-13-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ff614298-44b0-840a-94dc-817895cb5712@linaro.org>
Date: Sun, 24 Jun 2018 15:53:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180622141205.16306-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /iLgtP+orqVZ

On 06/22/2018 07:11 AM, Alex Bennée wrote:
> This allows us to use any new risugen options when generating all our
> test patterns.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  contrib/generate_all.sh | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
