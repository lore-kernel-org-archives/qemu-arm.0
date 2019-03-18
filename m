Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp2309599wrt;
        Mon, 18 Mar 2019 05:34:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVdzBXCn4/DixBGrw9icr/b745BxYC/YabvgrKpp7MyF8GUEgx9PsqmbKkA7uAqOG5fYZi
X-Received: by 2002:aca:dbc4:: with SMTP id s187mr9351948oig.124.1552912499807;
        Mon, 18 Mar 2019 05:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552912499; cv=none;
        d=google.com; s=arc-20160816;
        b=zAIZ4ppg9MlooIRkGERciGmRzpubqiLjQInjYJHPcfNoxKehyL+sGTvrh1CnY34KXB
         8jIKcFYCJ/OEdTYbPCScE4sQ1SpmUK1gHPNPrhEFTykGhR0nuLUo5CahfoR9ObGDZw+q
         WsfaDkHHueuVUGZmh0Oov6trft1ojYidCGxfPljb2fevvawBlEGgvl1TnDLb95ibeGt9
         iHah0AP18NEFn/+FRrDZqXpMpQwzkwEuf1LXdvjIwdxL1JDSgEur0GB95zR/QC2SB2uk
         3TlrbSdNYHwFyaRh5Bn3VioAB7qust5d4QDAreACn8RJFFyTzggT9pDHfpJnkZP1SH+W
         1Bnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=z9hc55hqbgigdeymXJOkmrV7G6lRU+TZMVMDC7fSe10=;
        b=pq5hk+x8zSw5vYU6i2b6mpQmUoMjmuJvah4xwBaJsIaDPo2CqzM9ox1JX1UrjTR2P3
         emZs0GdMY1zn+8dpCCv87a8/pdt4WstzVjRGoXJRVNvlwtsso2Y89iWJFDEkr+D8HLd1
         Tw0Tr4kQjQBbB/sYq+lBtOYexFEkj4Ql+uhZJhRU11UDxqHvOKeumvLz5sEnJxY309K0
         Lx7Y0NFVWb3iu4OvmyEfic+MAjrAJypl8YTxMHrVr2qVE1/eJlIgQ9nrb8AscrYZMDZj
         qXo8vVUdOafmgYrGradCC7AbFhnfJ4omIQuPfhRaVhesDzxKBsChtJtXeeefs2n0T5yr
         sByA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.32 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Return-Path: <gengdongjiu@huawei.com>
Received: from huawei.com (szxga06-in.huawei.com. [45.249.212.32])
        by mx.google.com with ESMTPS id w6si4373481otq.305.2019.03.18.05.34.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Mar 2019 05:34:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.32 as permitted sender) client-ip=45.249.212.32;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of gengdongjiu@huawei.com designates 45.249.212.32 as permitted sender) smtp.mailfrom=gengdongjiu@huawei.com
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id CB112BBF450E1C843A7E;
	Mon, 18 Mar 2019 20:34:53 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.408.0; Mon, 18 Mar 2019
 20:34:51 +0800
Subject: Re: [Qemu-devel] [PATCH for-4.0?] arm: Allow system registers for KVM
 guests to be changed by QEMU code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Peter Maydell
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: Eric Auger <eric.auger@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>, <patches@linaro.org>
References: <20190315143057.20165-1-peter.maydell@linaro.org>
 <c04c5c7a-f704-1c12-1a09-02f4a3db8506@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <a2a1eb85-afd4-53d6-e907-368100357b0b@huawei.com>
Date: Mon, 18 Mar 2019 20:34:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <c04c5c7a-f704-1c12-1a09-02f4a3db8506@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-TUID: nMKBQpldsdEI



On 2019/3/16 4:11, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> Should we try to put this in for rc1? Not sure... Testing
>> definitely appreciated.
> You might include it for rc1 and we still have rc2/rc3 to revert it.

why we still have rc2/rc3 to revert it?
If we can find the root cause about the regression and fix it, we can apply it.
so we may need to debug this issue.

> 
>> ---
>>  target/arm/cpu.h     |  9 ++++++++-
