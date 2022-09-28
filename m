Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp403895ocs;
        Wed, 28 Sep 2022 09:15:06 -0700 (PDT)
X-Received: by 2002:a17:902:da83:b0:177:f919:9260 with SMTP id j3-20020a170902da8300b00177f9199260mr546786plx.105.1664381706418;
        Wed, 28 Sep 2022 09:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664381706; cv=none;
        d=google.com; s=arc-20160816;
        b=EbDwfacNErM8btvn5E15+zqfSfj1ZRezZVafviqnxEwyTuTK4uQfl8Q2gruIIcjKA4
         y26yGbq3AY931dK4VsN8Yq2AFip4hoGZRW7p5aiTy+TsztqJoh+qQAVZ7FAUakA/DNUl
         Emp0pGeNCRtRq+TlUX3yEv0VE4m7Ycbjq9pVyOpuGw6XqGLtUfs3QvSZvujyDXO1mWJH
         Su2G5V7+qOFLoPd0ZXQq/FVq4EcNJnJcIvlvAM+S2cTI/ZfuRFlXCZQZAOrEXA5qAvzP
         tKKKxNE+cSaCTWz9lMNOWgrxHqEqdlHHmV7XTilSWmLV2m1NFb5DiPCD2A+GKAZMzSr9
         IPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4Ll5nOkXugfpmndktJ2XIZzXTzpB5b8+X9bdfzJh6DM=;
        b=prcibCyWwFkpvyqIuhra12Inns5v3AE/r6i+aBjoD0eqTPsFZmcg/0gPw7+by8xura
         ffBPFzsXZlxn3EnJHIczJkLChGrXNyqVT622ip5sNHi8/vBJ5PnS6BvB9FvvrQkwyTwv
         ELGCL7nUNi04iSVSrvb2ODBbrb2Vo88SnJZLMOJ311XjIMqiUevJf6l5JLwMYQ4jZgKv
         efEXa268iM06eK83p6Dn7+IPj5dxZx9HFXZ+J962fGK+SIwV4HF27hYumWBCon2zFqHN
         15iWkAFiJTcxuuFqsJ17sLHzMngDJgVKfPtl+W93A/apRGK+plW7Ap6EdfC+dmk5A83L
         5/Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wbIgwkZx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y68-20020a636447000000b00434e1292895sor2431464pgb.84.2022.09.28.09.15.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Sep 2022 09:15:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wbIgwkZx;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=4Ll5nOkXugfpmndktJ2XIZzXTzpB5b8+X9bdfzJh6DM=;
        b=wbIgwkZxuc0ChLnZ/g75qz57VRxQHGh7cIgIxkDT4I4/Ha4zZImU8PxgiFUXUZMl6D
         YMgY/yCrwX4R3Gpi50QgGYpJNlHc7XN8+uy6+omx0V4dafm3DeTJOyTKqMVFW2raUap3
         JrNL5lg3rGQ4jdTLD5tzTPELCaWIqCc7cSjDP2QC2KpNTkZBksyJAmr889VyqtQC8Dsb
         RyCTbXrgV8N7FOBsC6079ls+9CChdrxO5Y4qNtb8iMCXPMZCw8KYjSGs0c5INTeP6qjF
         95Tbovh+/61j9zGcA+wHe6Ks/1wF1zCsyU7ajF1C9lbu0xJVvC02iv5dUEfWTQGugIQA
         oFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4Ll5nOkXugfpmndktJ2XIZzXTzpB5b8+X9bdfzJh6DM=;
        b=DSgWmUGBEaEni1X+fr8PpOommWUWzzId2yeBAO+qqAML+ou3/8GsWe/JbWJjd9m/aS
         QP0T7I9tCRiJS/SFEmOnemfNW/3PSq586b4ccKDisx4T3Oj7p0Qd9QWdl8+qM3bTKrLn
         9hXnj4VBoj9kq+gQarqVmzZP9+EBSZnNOUHcc1T7iRwXoWmeIZ458CHXJcWa6PIv/Rro
         e9mUqLz+htT3LHrSN6OHbApOa2SEKvxza1GXOoj95UIh40Ld4V14YaLOEH1Gipa7C46T
         rSaWXm7LV/2JEvr9IpCmNWkLLjd9JOyLTLKN2JTVmbYGqeZ56hzlt3VUqN38FTqNF4Xq
         3YrA==
X-Gm-Message-State: ACrzQf0W6G17g/M9ghAsdMcCUnGEZG9RhjhVG04yoI2XuJvmy+DjfkfH
	j6TwT8tjy1biB4DW5buI63bUd2qs
X-Google-Smtp-Source: AMsMyM4PzxbiMctB7g9d8NH2PuCNJ0M+tzOlpIZkLlG8M2/qYpo3ZyHm9Wg90nft3Lo6AJ72KyCz9Q==
X-Received: by 2002:a65:6a05:0:b0:42c:87a0:ea77 with SMTP id m5-20020a656a05000000b0042c87a0ea77mr30089751pgu.75.1664381705989;
        Wed, 28 Sep 2022 09:15:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057? ([2602:47:d49d:ec01:986f:cb56:6709:4057])
        by smtp.gmail.com with ESMTPSA id f15-20020a170902ff0f00b001782aee4881sm2635641plj.153.2022.09.28.09.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 09:15:05 -0700 (PDT)
Message-ID: <292273b6-2a62-92d9-c3fd-d2a8a790de5c@linaro.org>
Date: Wed, 28 Sep 2022 09:15:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] tests/avocado/machine_aspeed.py: Fix typos on
 buildroot
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220923084803.498337-1-clg@kaod.org>
 <20220923084803.498337-2-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923084803.498337-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: naOwG+jZ3VB0

On 9/23/22 01:47, Cédric Le Goater wrote:
> Replace 'buidroot' and 'builroot' by 'buildroot'.
> 
> Fixes: f7bc7da0724f ("test/avocado/machine_aspeed.py: Add tests using buildroot images")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
