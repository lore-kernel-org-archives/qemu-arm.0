Received: by 10.25.159.19 with SMTP id i19csp8311lfe;
        Fri, 5 Feb 2016 07:55:31 -0800 (PST)
X-Received: by 10.31.172.135 with SMTP id v129mr9367724vke.154.1454687731127;
        Fri, 05 Feb 2016 07:55:31 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com. [2607:f8b0:400c:c05::229])
        by mx.google.com with ESMTPS id o194si14989583vkd.133.2016.02.05.07.55.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2016 07:55:31 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) client-ip=2607:f8b0:400c:c05::229;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x229.google.com with SMTP id e6so58859533vkh.2
        for <alex.bennee@linaro.org>; Fri, 05 Feb 2016 07:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=8CuFDL4soxbXykOA/DWoHnPbGyOE5DzCk6agjCUfQcM=;
        b=UltpkeOmVmza4UN9q4Z+Sjn6FJo2EF4HerZx05bsnM95ifsNKbB3xYtLUSkM5oYXfZ
         qkbXrWSRtSZJg6VSRdFybKZ2sElJXj1L6QFeHqhK3ApffzA2td86o+SiI8DRaSWn+Pi3
         ubZBW5Jq1yL3JOiWrbR9jk73kvf70sHuKHjUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type:content-transfer-encoding;
        bh=8CuFDL4soxbXykOA/DWoHnPbGyOE5DzCk6agjCUfQcM=;
        b=Xz+6DvC7Rxo+GYaArzmdYrV5TRTm5IhswTG37lbtGb9J+FWDrYHGtH8frkhueYktYu
         rVnRnYaZKS6tgwYNe0lgYAkWm4eVb17+CJorWTxQak3+9niiOXYy12+eR15nrrhzadk2
         Fncq1GzIN3hZnkyEmqQ1W7E1saEVtZPvG5nwR46qtGWulg3HRxx+czPcIpRFeGjEv5cn
         z1jREiA33HhDPdse8q7QAfPsXErN/JMsPuBRg2ON+bjFKeVAy3LT1Bs1F4xetrEpd9aG
         QJTAuadrgcsDmfirC2A1ru3fU3YU5ZELgQrbrSK44uhuwxDbOVqTmAMrQHanhqeCN+q6
         kEOg==
X-Gm-Message-State: AG10YOT3HdJgshE9iDyJQJ6JllmKcy+Z+i4oY39hBJcsl+SSPXHhDF9XxKWjbNC9T/MAQSMYPy0KzCekDikfri2eCx0=
X-Received: by 10.31.194.130 with SMTP id s124mr9950025vkf.92.1454687730667;
 Fri, 05 Feb 2016 07:55:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 5 Feb 2016 07:55:11 -0800 (PST)
In-Reply-To: <87k2mjnta8.fsf@linaro.org>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
 <1454506721-11843-5-git-send-email-peter.maydell@linaro.org> <87k2mjnta8.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2016 15:55:11 +0000
Message-ID: <CAFEAcA_-t8C_6QUmPe2xPraFEu6sNBqQa-fHda9mA0inXbMvtw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 4/7] target-arm: Update arm_generate_debug_exceptions()
 to handle EL2/EL3
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Patch Tracking <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 4Pyx9qt1ijUo

On 5 February 2016 at 14:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>> @@ -1767,6 +1765,14 @@ static inline int arm_debug_target_el(CPUARMState=
 *env)
>>
>>  static inline bool aa64_generate_debug_exceptions(CPUARMState *env)
>>  {
>> +    if (arm_is_secure(env)) {
>> +        /* MDCR_EL3.SDD disables debug events from Secure state */
>
> Is it worth commenting that BRK still works?

This is true for all the checks made by this family of functions
so if we were going to say anything about BRK then this would not
be the right spot for it.

thanks
-- PMM
