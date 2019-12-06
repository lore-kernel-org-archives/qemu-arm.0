Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1068200lff;
        Fri, 6 Dec 2019 09:52:15 -0800 (PST)
X-Received: by 2002:a17:902:24d:: with SMTP id 71mr15910783plc.102.1575654734824;
        Fri, 06 Dec 2019 09:52:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575654734; cv=none;
        d=google.com; s=arc-20160816;
        b=vkVE5Nd/2zI4UuhMR3ILh9zorqMxOTKeH8sK7Knxt7/7kAJYthcTPVs6ngLgSdT4KJ
         INbouGFuRtCHDmFFsS0QXTARyWpgZoXPieH2MX6iid9uwbz1SinJAAMyaILZ7w2mL11Q
         gnN3PmJ1n7hgC1sDYcJ8RczOTfffnD/tSgeIYW4tJgHuUuqglbYqTBTdC18zhb4vO21W
         giUf51su2ALRlIEVGKhbHU66vkd6xnmJcHcOBj+MCBp/63vKgKv83HxMpkpMPZ3ZjWuO
         u2Fgikb2sRlMRmSzZ6UyyquxYPRdHpMWcfGmaQHuHZCqEwZk8Cw/1Ygsfc+WY375lcXz
         ZPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=jZqGBmvPDmURBUSBxW8KFM0RMQPRjK96Q/0sLdCKuNw=;
        b=mQg5qJ68AASfxGrYKIqgi9afv3Td7J9O1gge12RPqBjdwhjl4+i+N3g+rXxLUwnrkj
         knZjY46HabkCcqwW2Y/S7Jrhd6cWe90gk3Ku3dExJpUWihEGTGN/b7IMmAHGmQ09KR3J
         +Y9XckG+Ad0FFYy4oanzy3+IT449UOgIYviGOWp0sNDbM7qBtcd04VdYA+9dtR06h4R5
         9WNW89ytNKxGLcN0CIvi7ErUdUAu5oUXixkhz3rD9EfpCRpfLuDEZSlMkQb3mUyx80cD
         FfyBdo+bn6+BsUQO2nck5bd5+6jYvVVQ5tnCONKE9LzpO1E+VyW2j0fejkTbvL/fr60g
         rvLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cdtwLTO4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b13sor13981425pgg.79.2019.12.06.09.52.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2019 09:52:14 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cdtwLTO4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jZqGBmvPDmURBUSBxW8KFM0RMQPRjK96Q/0sLdCKuNw=;
        b=cdtwLTO4PWD5Aho55YBdZ2hnmz3j0KLag4W7uhUQZliwIClFQH63hsdcqp1PGZBkR7
         CDnl/MZTVPSAnkE0IoYP+8G93HO9phXzXH8GL29frrbpdw4m/FJkhd7a94/zjMgB86Aw
         luEW3N5GigWhpq/NexujqSpmFNRwFQsipz+3iTxfQZWFmePZezXgXV3zPFptqFsI3xu9
         dkZR23VonXMur6INdrvDXtt+5T87/dEKGVpdM5jm0wbfey84ocpkMeUw0Dnvul8dwudA
         qCXazLQp32ohO2F7SxMXK8SHwsdWT8qsjFNru8D4UB44OXEmFDhFZBEsNmqrscYZlA8o
         hzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jZqGBmvPDmURBUSBxW8KFM0RMQPRjK96Q/0sLdCKuNw=;
        b=AAvYbpdX9d2SW+oCSCY993Y0v9/F+FGJXCOYUWmowlBHDmJtqLgwkyo/3REBx/lpez
         HUf9MdAkoVrTQiV0WGAKEws1S0ZuuyXLcZvLOhzmuK8cM99yWmOrx6k6LFuzz5DKb8ol
         MMpYse4xtZG7s74uoT2i5+z6NiorbLDglfVgbGmu6ob1CF8vw26BbqDuD7+Hzx3kjlSj
         th5Jo2eej573oTM9/p7ESC5p5xaBi6F78hUc6PL1BffEUksJ8td9bJdfO4RvBrx3GpOP
         4Mg3dO8CEhzdBiYee6ts7kzIlM6sfyQtX/fBWe1XeR6lrDde6YsV4ydZ2hUi++kgFsl8
         YzgA==
X-Gm-Message-State: APjAAAVqxFDAUJeH6IvLPw1OVYCHQIBcVPmMC3ZkAI2GC0drKlkwyJcO
	X7LWjc7EwH0nzyQYx2ZqPPL81H+BFBy0Rw==
X-Google-Smtp-Source: APXvYqyNM6042g6nSWXJSt6Wo5TURv6Mw2RK59jqXCHRckZOTTnv4a0gq+mU/7PrpWhZ63mQQdAPnQ==
X-Received: by 2002:a63:2fc4:: with SMTP id v187mr4724216pgv.55.1575654734273;
        Fri, 06 Dec 2019 09:52:14 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id w11sm15823707pgs.60.2019.12.06.09.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2019 09:52:13 -0800 (PST)
Subject: Re: [PATCH] target/arm: don't bother with id_aa64pfr0_read for
 USER_ONLY
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20191206122247.7507-1-alex.bennee@linaro.org>
 <CAFEAcA9S51DWqysHbO42CjOhZBMA4qwN2zT+isOmWFtH5G8N3Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0bbc14b3-ad57-5580-8707-b6c614fbcdc2@linaro.org>
Date: Fri, 6 Dec 2019 09:52:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9S51DWqysHbO42CjOhZBMA4qwN2zT+isOmWFtH5G8N3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jfemoVqID/3z

On 12/6/19 7:29 AM, Peter Maydell wrote:
> On Fri, 6 Dec 2019 at 12:22, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> For system emulation we need to check the state of the GIC before we
>> report the value. However this isn't relevant to exporting of the
>> value to linux-user and indeed breaks the exported value as set by
>> modify_arm_cp_regs.
>>
>> [AJB: the other option would be just to set reset value anyway and not
>> ifdef out the readfn as the register will become const anyway]
> 
> If you want it to be const it would be clearer to define it
> with ARM_CP_CONST... I'm not sure what an ARM_CP_NO_RAW without
> a readfn or a fieldoffset will do on reads.

Yep, and the accessfn should be ifdefed away as well.


r~
