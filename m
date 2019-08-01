Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7343510wrv;
        Thu, 1 Aug 2019 12:27:00 -0700 (PDT)
X-Received: by 2002:a17:902:2de4:: with SMTP id p91mr96838361plb.28.1564687619878;
        Thu, 01 Aug 2019 12:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564687619; cv=none;
        d=google.com; s=arc-20160816;
        b=IinwA2xJFicAYCluAigSSytxOLoFKkZPxrzRrIMhn/qXJvbd1Jca1LsasMBM8y3pIr
         N/4OCJ5wvcLqSQuZsyitkUBDZbh6VYOYLJ6nYJdiQFGo1/+qndqVVWOAnYRxnUnUBbC9
         oTh7Iy0FVofsmWSFrh59ZdTfhDz4pvwE4QAKG6yAl5wkcgMitqC7fHLiK3i/xZRx84ZF
         NynwjqhxJIBc4Te4GHpADT0fq2rv3c8kn9i9supjQsQH0uhjJ3Qmc4Y+LTqYnDE5pvF9
         W/wj2aSLZMl3gkSN7uaK/uuQYgXCp4cYS1ievUc8eVf8TScejr14lnLxnM3CrFTIfUnL
         SWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=51VxjLFlzEPbO73RJXyEKrKot3iKeOi5BPqCsFw8aGE=;
        b=w9AH8yd4whwRL5d67ig87j8tpyEC/PhiwcyLavwVaPwNip2slxBqV3O4zYsahZ/MeL
         dlyfEV0g/5Jvs118WfMMQ9JDj6iMM4WJ9tEy9IIR5XROidRG24OFXkyp5Y7JY4FT1hST
         w4mtGda3/pbsv1+1DgPLhtORtxrCaGjTDYObj5LbHyJNfDC0VvF/9sXyziUAQLlBvusM
         gUAybGy57nq13PHDs2Ll7N0Xk1chODjVXLGFAM8E1Vq8jNiIAopR8vx7d6EbEwCU8gC3
         eG7nPwdlais3yGF071U3miD0p+elmExtigURGzjUFKVg+YJ5QZi4/ij7o9hWvlgbRgOy
         mONw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kpjA7NrC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f10sor54655194pfq.72.2019.08.01.12.26.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 Aug 2019 12:26:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kpjA7NrC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=51VxjLFlzEPbO73RJXyEKrKot3iKeOi5BPqCsFw8aGE=;
        b=kpjA7NrC2NxXT9y2frPg6omNj9q+rm2MF02sU4+17e9+SDqd/EpldXttIC7vJIiZt4
         VPXzjMKuhhx7I/8vv1aopz4C9FseN4ygdiNFSmJt87v/BmSH0DUhIIF5C237zS3goj0S
         O+YiWTI5oq9c/ukf/lDhSTSKF0EOGIyTiL08wvyqXL4iTL6lfiK1eiTgjIUdUXHLFCPc
         K/ZS7iOLEMkcRzLe0KWJGnG8TR9Y3VIsy8MNOU519IaAm++Zsi7o8W5mvDSqMKZviQjJ
         HU0moPuB8OJ2hgdldpwnUtuC8a9W3v20M8t9+iofNRt2urLAhTOPajLH9P3NRWqTbFIg
         qgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=51VxjLFlzEPbO73RJXyEKrKot3iKeOi5BPqCsFw8aGE=;
        b=jHjiIQ3NBK/FZYHuZOITQUVQsc5k7ssGwxpVYuejcMZ3JXbSgTOZ8vasnPFHaMX8zQ
         c6mcp3bYTiidLtqqJUiTRdM09INe7tLelpVM5qHHGpI3cOKcjQyIINdnchFyw87e1PcS
         QkXlb8BBNdNCH81ngXp3SJ+wvn9uRZqaMVc7tRgcOwnRoKu9QtorfYqbtMVty49RFsIl
         +emf1s3LK7ulimhLRr+cpZjEdNQletifFazCN6DKhnttqhqrBYteMXcJpn2pwiZeGaSQ
         2t4gxvwBGJiIzrhFLhSXsmr0hm904ImT9v0DCcgCetr4Mq8NWwKErHFAeGjzujiuW403
         ljrQ==
X-Gm-Message-State: APjAAAVUiWS5WCtXNMopyaHmv4JlaWjVGaH9QFvh1bGo++ig6rt9fpYM
	X+FtrwkU5PKr6Cn1Lx6gCX1c+yFp
X-Google-Smtp-Source: APXvYqzDj1gejIcJJDOXQf4RlfIzh+mXRGvAdy1rHecYCH4310V9WJckhjxDpI3YQdQ035yL0rv81A==
X-Received: by 2002:a62:7890:: with SMTP id t138mr46255816pfc.238.1564687619426;
        Thu, 01 Aug 2019 12:26:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id v12sm65415339pgr.86.2019.08.01.12.26.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 12:26:58 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v4 31/54] target/arm: fetch code with
 translator_ld
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, aaron@os.amperecomputing.com,
 cota@braap.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 bobby.prani@gmail.com
References: <20190731160719.11396-1-alex.bennee@linaro.org>
 <20190731160719.11396-32-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <09e07904-b8d0-a779-e018-9700795a6e57@linaro.org>
Date: Thu, 1 Aug 2019 12:26:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731160719.11396-32-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ES0S9f22+WUj

On 7/31/19 9:06 AM, Alex Bennée wrote:
> From: "Emilio G. Cota" <cota@braap.org>
> 
> Now the arm_ld*_code functions are only used at translate time we can
> just pass down to translator_ld functions.
> 
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> [AJB: convert from plugin_insn_append to translator_ld]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v4
>   - use translator_ld like the rest of them
> ---
>  target/arm/arm_ldst.h | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
