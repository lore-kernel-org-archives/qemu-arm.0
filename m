Received: by 10.25.159.19 with SMTP id i19csp1051874lfe;
        Fri, 29 Jan 2016 08:50:38 -0800 (PST)
X-Received: by 10.112.130.133 with SMTP id oe5mr3012996lbb.94.1454086238595;
        Fri, 29 Jan 2016 08:50:38 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com. [2a00:1450:4010:c07::244])
        by mx.google.com with ESMTPS id p125si8531348lfp.117.2016.01.29.08.50.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Jan 2016 08:50:38 -0800 (PST)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::244 as permitted sender) client-ip=2a00:1450:4010:c07::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::244 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x244.google.com with SMTP id t141so4086984lfd.3;
        Fri, 29 Jan 2016 08:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=oElxSCBR+muFT4Z8Xwsy67hYTxUsNVqTCs0n8Va9/Fk=;
        b=sWsSfh5ZCRjZeInTqBtzOoe/MWCA+f40WMJdMeZQRIPxoxeZlb3kCLLsgujEuDEfl/
         s1cidY1qzULzcFKS5I7jxE0O42FQ9FnSNfsNbUqfkVd4C9N70HR4N+uzgStiFfaC9Jw5
         csYa9AUf2aRznhMsjWLQjkhMvkA8MqzjLND3R34ZH3DYBewjGN4sgJi7ASFSyL+tjERT
         TK3wAHJBGipBxSccco590lKhFMZOt3MmEdXlMgBtnFZbSTJTKRZ7EADvlbAyP21H5rEi
         0c31wDN0j1ryRLYsXvnBppjZEtVbR4vAlDdp3UGVGmqt/098fkkQ8Heir3c6UyGQlCSb
         6Ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=oElxSCBR+muFT4Z8Xwsy67hYTxUsNVqTCs0n8Va9/Fk=;
        b=JOXvhca2uOGJpL3yB9QB018lqA3xyez8DBioUs7VPoL289xEsLrLM8vJsARBE+kXKF
         u+zUh+WlHZwTVUtzDLgAe59J+Mr0SgzoypPUU0hccELjiaNg8NlGJX6DsaJbxxwM+vlJ
         sdGRWngBquV0Dp0V+F6m3VVDUhC+pGVguoXKXJcogY4CsCLtIuXcI9PrtOiljNAANnxS
         BB8ZYKN7i48By9t/asBb5nctIUxNveZ+Z3h1YMJ0RFa17h/6lj0LfcBqk6hoEbVofQgs
         k1EKRNQPOi9tF5EXWGNiV4OdMDIVve1rOya7mPe/GaNCTUsIladxFPBbU1cz94utSitH
         dKAA==
X-Gm-Message-State: AG10YOR78y4tI9pBjlqzL95ca9c/Kzlht83MAYkPSILMbvSdON9KgmK/LyvlAqsbxoWeAQ==
X-Received: by 10.25.148.142 with SMTP id w136mr3068366lfd.31.1454086238336;
        Fri, 29 Jan 2016 08:50:38 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from [10.30.10.50] ([213.243.91.10])
        by smtp.googlemail.com with ESMTPSA id mp1sm2235380lbb.22.2016.01.29.08.50.37
        (version=TLSv1/SSLv3 cipher=OTHER);
        Fri, 29 Jan 2016 08:50:37 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH 1/8] target-arm: Properly support EL2 and EL3
 in arm_el_is_aa64()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
 <1452796451-2946-2-git-send-email-peter.maydell@linaro.org>
 <56AB972A.5010007@gmail.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, patches@linaro.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56AB985C.2080605@gmail.com>
Date: Fri, 29 Jan 2016 19:50:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56AB972A.5010007@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: J/vPiYkrEgol

On 29.01.2016 19:45, Sergey Fedorov wrote:
> On 14.01.2016 21:34, Peter Maydell wrote:
>> > Support EL2 and EL3 in arm_el_is_aa64() by implementing the
>> > logic for checking the SCR_EL3 and HCR_EL2 register-width bits
>> > as appropriate to determine the register width of lower exception
>> > levels.
> Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

Oops... I should put this below the following "Signed-off-by" statement :)

>
>> >
>> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
