Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3769070wrx;
        Mon, 25 Mar 2019 05:03:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxN0zFP2kNx2wIebh+VN6K92RRD5RTMx012N84LiGp9MgXDgASi4lgG8IM5DB4sz4OfA+tl
X-Received: by 2002:aca:fccd:: with SMTP id a196mr10955456oii.132.1553515424884;
        Mon, 25 Mar 2019 05:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553515424; cv=none;
        d=google.com; s=arc-20160816;
        b=IWDI2uaapcVcUb7nuEi69MR+Ryb3ABUFMbfGceHYTIWaac2PSSzvdnDHSXg+RY8p8l
         yrbkyoT1G8+u1JvSIa2ATv/Y1oMGggOW+92odyygiSwk4VVnFOK/LYfQ1R/icjyqiu+z
         RaGzhJq8VOSJHVl1iUbEwVL0fbNRc02+5t9q3fgZlmixIUyeyHSuBpy0JLyk00ryNLPG
         Ek3qmhAgdFc4VBYwuYRydW2fhnpAYiLw0Wjd/bPgWahXkAgcJn3/0m5i7Upx7VnOgpSz
         G1ldjsfxK897rWqAnY5vt+YhUKZWkogRhrVFZ0C3zcx/VUYvxqWIm17hcYQ4g9JLe2sX
         BQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=hykwlTBSFQdE5OXpulCN++mDRcR51EaxJnvXp/QLpQo=;
        b=bxmJ+TUPGnq46NxSRiXTm3dxx7ZuJJyqUOI3ecGFbdi/gAIt4lDi7gtkN3V9AX8+SI
         QZBiaAFmaQrovJlDdJHdkb0LQm1Ln0eLapXAXQq5iR7N94V1FGqTJz7Jv0fzHKD0z0Jj
         /zaVFkYEEQ0jb6S4sM01bZrYHoFGIIWV40XVKdPCksEVPD3wsEG5oBvVChbgC5/oQvwN
         2bpvwd6lZNpaMafheCtG+9q2qP/T7VNhuer7xcpRTakB5pfm285ucctTprW2VDA4t1J/
         TXfOZjLjHczx0JtWUcAubOaDC5vcv8ksXjwyS7r18xcr2vbISZROFcAhU+d8v1LI9mKn
         Wiwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.35 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Return-Path: <gengdongjiu@huawei.com>
Received: from huawei.com (szxga07-in.huawei.com. [45.249.212.35])
        by mx.google.com with ESMTPS id s127si6227170oif.179.2019.03.25.05.03.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Mar 2019 05:03:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.35 as permitted sender) client-ip=45.249.212.35;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.35 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 62671B8796350A249181;
	Mon, 25 Mar 2019 20:03:29 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.408.0; Mon, 25 Mar 2019
 20:03:28 +0800
Subject: Re: [PATCH for-4.0?] arm: Allow system registers for KVM guests to be
 changed by QEMU code
To: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>
CC: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>, Eric Auger <eric.auger@redhat.com>
References: <20190315143057.20165-1-peter.maydell@linaro.org>
 <87sgvkw4vp.fsf@zen.linaroharston>
 <CAFEAcA_n2MvRfCdydianR9EgDxdP093+Fi-Co2WRa0ncAF=Pgg@mail.gmail.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <800c0f81-9e91-321e-f18b-3cffd2870ee9@huawei.com>
Date: Mon, 25 Mar 2019 20:03:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_n2MvRfCdydianR9EgDxdP093+Fi-Co2WRa0ncAF=Pgg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-TUID: sZfSaUpFvWp+



On 2019/3/25 18:25, Peter Maydell wrote:
> Further testing from Alex suggests this is some unrelated
> bug or regression (ie not caused by this patch), but:
> since the only in-tree use for this patch is to get nested
> debugging working and it would be broken for this other
> reason even with this patch, I'm going to postpone applying
> this patch until the start of the 4.1 cycle.
OK, thanks Peter's following.

