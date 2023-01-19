Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp275029ejc;
        Thu, 19 Jan 2023 04:06:58 -0800 (PST)
X-Received: by 2002:adf:f346:0:b0:242:88af:d88b with SMTP id e6-20020adff346000000b0024288afd88bmr9620157wrp.43.1674130018687;
        Thu, 19 Jan 2023 04:06:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674130018; cv=none;
        d=google.com; s=arc-20160816;
        b=0O/ZWb6HoylWHdVWodMy9j+cS0kLmPT4WQSjfIV0cyl9icEvsny/5xZM5BgD5jGkcW
         +wcAd0DwcYXgziCNeKBJhW20JrBn7VWe1cIwO9x0VAr4tyWGapSC82FrsErQye7SZ3LO
         vDh9/s1TZRsl3Q7xFtQbOuJCEIpRdgszNMHPfNwclOwgl5vNplBoIUmeRB3ik6LI50Cv
         TE/dlFQTYN27Ai0KKxsWWNbmwogeQhRq8aJr7S1SQYqnRbCHEo2BElnyV5wqu2VUVnmt
         bojKMJB1RUIckrSrnIf5vYlxKigUpvPsVnjsMcmiKR7feszq2nCcX+ywxEG9cFtpex8t
         lw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2EMLVEZUotdAqpymC9FKRz9SAN5Mar29BncPdvbMT0I=;
        b=im7LGw2b5sU1zDOjuphz9NhN/n1CM+BIql6wwN8FiSVTCKrykbyUSDXY7S3186p6SE
         Ox9RWN0ybPsyebJczO4Bdn37LKsWOoOG7Qlq2TSe0nj+NGagI0c4QKfy5TsIZ+bIlPgl
         EpW9AGpfDoY6AsKxYnw3S3eDI6KwT5eDBcJM6qfuKde7IILsECeeP7Ckg5DnMnmxGf5E
         fM1NZWvHCZH49GfRX3aqvcQ0NhfTZbMSSMoA2nhvYQ4/AqOUF8cv4xLHE1WTG2kbBFS7
         pQb7+G++BWSohI7hFIWjUK+dfwP10qj1cvANPpwuMTlUs4CbBJtvUJXm5R+lzn9BJq44
         7Dqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J5P5vwKd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b2-20020adfd1c2000000b002bdfb9702ddsor5384279wrd.12.2023.01.19.04.06.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 04:06:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J5P5vwKd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2EMLVEZUotdAqpymC9FKRz9SAN5Mar29BncPdvbMT0I=;
        b=J5P5vwKdrMLRH7wpCKSUBaxB5QdfYEesDmdh9iNh46ykk4m/uY6a3ZG3yYxRk8E3L3
         JfUXpSwpNOIFHMXPs0ViNM0DYv3+jeBHZebd/ULPBI1vNWpEIFzI5CoZ6JOLRK1qMi6y
         HqCi2Ep52JZyZLZHk0cmXKfR14/cQ0s3npjHoB/b+LphJ0rj+KRnGf1EDthpe8NCXWu9
         f7EeU5ziO1NNgQmG1X88BQWGUMXqBDObc6Q67jdIecDQ9JANxUGG6sjoXpJG72Baw67G
         GGzFlp5/mMRW00XorowKhlC9olNI1uFrINl/BjK0OyxQpzDxbh2fMWJn6gyo6SlPD91L
         INwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EMLVEZUotdAqpymC9FKRz9SAN5Mar29BncPdvbMT0I=;
        b=0gOwlDNkr/ZInHTm9x5hggpPu37SgSAczxxz+mW7AMMvQz2Lb/fvVASKc++N8pEsJo
         7BeN1XtOGRwHNv+eFYyIg20rKjYsgv8OpNfndQpMurd5MXQcd9wXM3HD4ieZcvZSSoba
         Mic7Ncqwh+e0SMTAev9oxmhVgUBOTKXHUmAEsAGKrVYD8/UCk8k6ZpR/W/q3Xu8ySkb4
         Gfc0dGBLwHdiZiQKwRtGutyQD53WY4ZOp58Yqz+hNZRtjwBRkNw2lCAMe5KFYvMLIlj+
         ZbfucyuZpVGDJvgrFTi/FY+MMBDRgxRfDuFBtXuVhcg55ooZdeSkCvOn4B0NES2ZkY3r
         TywA==
X-Gm-Message-State: AFqh2kr3tsGZYinANKaO50WUdMiauMRHJRBNmFQYuZdqCkoaE77Ap0VD
	zFe4NxRw72SzwAvosexlSyyuMlTJ
X-Google-Smtp-Source: AMrXdXuBBeSm3gl6o10933sG9UHE5vv824RLyyxhCDTGx/JOnLVEZDV0d41bpfp8u4MvdIbHfl+hCA==
X-Received: by 2002:a05:6000:1706:b0:2b5:47ab:6fa0 with SMTP id n6-20020a056000170600b002b547ab6fa0mr9817768wrc.38.1674130018431;
        Thu, 19 Jan 2023 04:06:58 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id by12-20020a056000098c00b002bdd8f12effsm18238717wrb.30.2023.01.19.04.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 04:06:58 -0800 (PST)
Message-ID: <6b7d3a6e-a3f1-e90e-7e04-1d5196a087d1@linaro.org>
Date: Thu, 19 Jan 2023 13:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>
References: <20230118193518.26433-1-farosas@suse.de>
 <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
In-Reply-To: <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OZvqys+Kgwfa

On 19/1/23 08:41, Philippe Mathieu-Daudé wrote:
> On 18/1/23 20:34, Fabiano Rosas wrote:
>> These are the already reviewed patches from the first half of my
>> previous series:
>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>
>> This unbreaks the --disable-tcg build, but there are issues in runtime
>> that are still being hashed out in the other series.

> Testing on Darwin:

> 19/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/vnc-display-test
> qemu-system-aarch64: No machine specified, and there is no default

This one is fixed by:
https://lore.kernel.org/qemu-devel/20230119120514.28778-3-philmd@linaro.org/
