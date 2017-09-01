Received: by 10.223.188.70 with SMTP id a6csp1477567wrh;
        Fri, 1 Sep 2017 13:38:42 -0700 (PDT)
X-Received: by 10.84.209.161 with SMTP id y30mr3983781plh.246.1504298322357;
        Fri, 01 Sep 2017 13:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504298322; cv=none;
        d=google.com; s=arc-20160816;
        b=rH3obLwrgmd6+CdQeYenjeNJ+JPwg1T3xONybQaOBNEerVGVF6KQsVVIyvCZuXSjxk
         MRVUNtgUFP+ShJ6CG3eIpzGtSFujT7XmM+CrWiIthlDrdXQprJv4CZCSuXozuEy+GFu9
         ibb/tdnRe8TjlDUDWS9GTFDrRjUwnXv+wH3aM/0/jZwx5mFJs8LzZcTW4b5uPCsLf0sT
         V7Ltu1c7JXWfe//ujo7Jhv3km42opMzO2Y3YUHxaXx16YBivHSzDWdBkTF9zGz5uJBx9
         ygksWW2smPQTRi405vPNqemFxT/ugVFZvaHHBwj3M0ZMK937/5G5HPoeo2WBFddZkGvy
         0D8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=NfLbu9eQN1v/vwP9aK5uohj6LDyX3t1Wr5/tTbAEuBY=;
        b=nlhOkB0DNFTp0mHq5LTW7/Leq4/3xROjQc7VACg7nni29nJSpgOtiY3fF5jNihkSPo
         kJYQCs8HWiTypMsOIFi8HbG/wPVK4/c/U7cfG3dc+SNZMQfgPzoL35PGLR/tbeV/g5Ao
         6HrwSLDuQlWo3nuv98fdkbRc+VgWhr0k6GrWTpZbeb5C1Sm5HhK/QcN7BPrcHZ3+Wd/9
         E/EUoSXcL0dHrefKoRQJuKR0AY5xCWqiDrFJzbSlkIiLNx5tdWP/UZkciIflfFo9kPoo
         UBQ6olp3HQIBc7JI3FB68oJ1uuJwH6Ek+fVXW4/pLZTa4t8Q2p3IAqWEB3KaGsRb4hJJ
         v/XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EDiTw/4X;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n7sor671113pfk.38.2017.09.01.13.38.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 01 Sep 2017 13:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EDiTw/4X;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NfLbu9eQN1v/vwP9aK5uohj6LDyX3t1Wr5/tTbAEuBY=;
        b=EDiTw/4XIlCq4KiM3EN4BVvkkUlWVJyoUI1GgdymbmFEsOS5fZ+7o+Mw2OrvESJgGd
         UCgmIptb32FRRhxsS5Cwjus6Zw2mMPs1//SUbbBK6VxOSZ3yssoxypENEKsDHizEYpmZ
         /J575nqjusvrnkzef7QGB7CIEayNTSDa9fuuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NfLbu9eQN1v/vwP9aK5uohj6LDyX3t1Wr5/tTbAEuBY=;
        b=oah7vzb9VQmPPWLUGJbXV6lVTPAf4R35ISGS8VXjxLIQchth2i8DCkf0eHlBXBwE/5
         tc5Fy37wz9VhEeumV5YdT17U7WrL6qyPK/5uYZw8uLP98VOIV/u94XnPhc1pdyMkzie1
         fRzTLUiqu97k5xHVGA9bq5lTQe6TtpvD4MGPYQ0RJxC6heTvy+mxgQWJ4TG/vEGqAJ9x
         kvOyldV1aQqkMeNOQjTk8iA2e0nFz0euyW4GYqKovp1a6cEln2v3CpLIlHDVzvXXLSDH
         Z9ns8Hv3aOlnWmGDPWChWMcKWlhBHC3qzET3bW5LX3dW6HdclZzhWrkVmZvfxe9TBJCA
         0Dag==
X-Gm-Message-State: AHPjjUgsU+tKCpKmqJkWPh4hcuEWtGmH/2LG8SZtfCFCv37kuz4nVHJH
	veEGGXz8mVUaoyIwgnyEMBYf
X-Google-Smtp-Source: ADKCNb4WaSyv/Tev7reJAmbvXk8QiPSJ/nVt3fy3VmCjppzPw+T4uzfUs0zwiQDQPOzJUZO7d/XWfg==
X-Received: by 10.98.75.200 with SMTP id d69mr3592712pfj.271.1504298321325;
        Fri, 01 Sep 2017 13:38:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id g68sm1302225pfj.33.2017.09.01.13.38.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Sep 2017 13:38:40 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 1/8] tcg: Add generic vector infrastructure
 and ops for add/sub/logic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org
References: <20170817230114.3655-1-richard.henderson@linaro.org>
 <20170817230114.3655-2-richard.henderson@linaro.org>
 <c53d1c21-c913-a60d-cdfa-524431c2cf28@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d85197cf-d3c7-a42c-5a8b-98b5f486f191@linaro.org>
Date: Fri, 1 Sep 2017 13:38:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c53d1c21-c913-a60d-cdfa-524431c2cf28@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: rvoFIWQlyWNu

On 08/29/2017 06:31 PM, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> I can't find anything to say about this patch... Hardcore stuff.
> Some part could be more a bit more verbose but after a while focusing it makes
> sens.
> I wonder how long it took you to write this :) "roughly 2h"

Not quite that quickly.  ;-)
You're absolutely right that it needs lots more documentation.
I'll improve that when it comes to round 2.


r~
