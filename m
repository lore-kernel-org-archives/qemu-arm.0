Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp171181wme;
        Fri, 18 May 2018 03:36:21 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpXaG6EjLEPkReqgpStBMR8oy+YyGHMBxb26WRkzDdtUbJ4PXeVOwAFv6yeioCOzZtyhgsI
X-Received: by 2002:a1c:4406:: with SMTP id r6-v6mr3856169wma.99.1526639781465;
        Fri, 18 May 2018 03:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526639781; cv=none;
        d=google.com; s=arc-20160816;
        b=GbWpXUOczuljwO0UBKaNbiC/Pj8Zcg9ZhSZpEX/aKKtaskGI2xtMq9i6IqXUSRSHpE
         2xgymJM8CCPYH0RoEIRqGESS2d/89/sShWGSOJBADafUvZ/ewHwFELIiyokr1AxzKD71
         ftTs5660tnGStB6bE59wxdo+c5fDUQdpW+p2rY7UxEWjRDUXlXxqwIhHWF/Wo99xLyUr
         cxJfbAYLLm4oSf24Xr5iM0S2GJbAD57AUlYWnAwmYYyIOylUgE9enWaggPSGAgi5ldte
         cHdolYVfMAWw+kg057bieQHCU55xck7HCeTXnBBOy0zgH0iIXGlpOqx/lP6trKLWYupE
         6oKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :arc-authentication-results;
        bh=guyU2Ul7LaP/lMfUvp5vuqrTHOBp3jKsOdptUsIbVVk=;
        b=h0D/LP/vuuWL+4S0+POU/S0zIFpIMUJAOL7GPM3+EBJyDxU3Q1/usg2t4hA40DuXkc
         WApMyyZWRlCgxmXijDV9oqIEQZDm/enj7hHC/1VZ/yVgepXkudASCsZFzkBJ2c4sMhbQ
         XY6oAmW1AD4dJ2nQRO0pq55MiUWjsuwG8NYQMtlc4ePZu6iwoSMhZxIvoJedE6fQPUZ/
         BBs6HmT8VJAqUEnuvaS8JudqUP0OfITtmhXWtnkAe2YYZh2IXnkKhQEGyrwxckN21IVm
         kSGqa87ZlJ/GHI7z+dnnA8LT1vJLgF5kHkYanj7RnSW5ZqAKx40KCXjrzoS//oGwfMST
         mIHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Return-Path: <abdallah.bouassida@lauterbach.com>
Received: from smtp1.lauterbach.com (smtp1.lauterbach.com. [62.154.241.196])
        by mx.google.com with ESMTPS id b132-v6si5101588wme.56.2018.05.18.03.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 May 2018 03:36:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) client-ip=62.154.241.196;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Received: (qmail 9560 invoked by uid 484); 18 May 2018 10:35:01 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com (envelope-from <abdallah.bouassida@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(41.224.44.126):. 
 Processed in 0.0528 secs); 18 May 2018 10:35:01 -0000
Received: from unknown (HELO [192.168.187.23]) (Authenticated_SSL:abouassida@[41.224.44.126])
          (envelope-sender <abdallah.bouassida@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <khaled.jmal@lauterbach.com>; 18 May 2018 10:35:00 -0000
Subject: Re: [PATCH v6 0/3] target/arm: Add a dynamic XML-description of the
 cp-registers to GDB
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Khaled Jmal <khaled.jmal@lauterbach.com>
References: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
 <87lgcrvemu.fsf@linaro.org>
 <CAFEAcA_3Rg-qhLRmg=TtakVtzOffKrdOKU8z=-=cGts4TTC2+A@mail.gmail.com>
 <87y3gkdlab.fsf@linaro.org>
 <CAFEAcA8tcspnmGBOOF8zYX22dPRrD_HZ2z+Ot2CSqUo2RdKp1Q@mail.gmail.com>
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Message-ID: <2fb67f0e-b8a1-ff74-531f-6f5a668cf166@lauterbach.com>
Date: Fri, 18 May 2018 11:35:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8tcspnmGBOOF8zYX22dPRrD_HZ2z+Ot2CSqUo2RdKp1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: AG4mv4cIiUIE


>> So finally:
>>
>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Thanks for the testing.
>
> Abdallah: I've added this series to my target-arm.next queue,
> so it should reach QEMU master some time next week. Thanks for
> your efforts in working through QEMU's review process, and
> sorry this took us so long to deal with.
>
> -- PMM
Happy to collaborate with you guys!
Thank you both for your reviews and your advises :)

Best regards,
Abdallah
