Received: by 10.28.4.212 with SMTP id 203csp728171wme;
        Wed, 2 May 2018 06:31:40 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpebch2donkNCOQiip+cJ6pXzxW0ETlELq1RsqzClCnqWf8P8q6PRT/0Iy264AYUsePhAnr
X-Received: by 2002:adf:ca12:: with SMTP id o18-v6mr10599828wrh.272.1525267900897;
        Wed, 02 May 2018 06:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525267900; cv=none;
        d=google.com; s=arc-20160816;
        b=Fl9U5IV5CeCNVO5o3oLFQnRenyJiOdk89ynj8kXAomP42U13SCRjWwHKJ2W2HfGb5X
         WnsM2/ITZR5asvSFKrLFXCCuvWyd8bDzI1nZ4Xt2T1hAu/TcjJcM30xc7JXR6Fq5u4PF
         lxbVy6NN1kYDPbEjPC546jIv+3lOP27dKjBgYdAr1FgkZhM7F94Ctkd8K1Nj0Lriu/Cc
         QDsdAaPgKv9Lq8UOgW/L3mSqX9FMrG3Ik63ERzqniIY2/lZCpAyG4r4vBqOo6+CwRuYD
         PNjy84YzMIUvSvmTMXh5KYn36lY4/fIVzm8SGm1FeVaJEnOz7ZXsH708aRUxxC6wJ3DE
         tFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :arc-authentication-results;
        bh=Y0cX6GTHVd+b7rPV8oQ69II+9ulct1DT3ImwUgX7DIY=;
        b=kex50aQeBKVeaS5nS6e+ZTUiWND5DywS2381luiasrTiSoG4JbqEMHFu5NvXElhnvp
         yz4K5bNOeSmMKbtgH+vS1JJPdsxBm30wKQrLQoi3/Gh51nFyy9IEEwB5agaMlMvL5+JR
         /1M8TvmmdYleOX1SmnZ+ePtBEcvQs0+64WKChRLfZQI4VZ5SSbG9OZplnmg6Y5vOojqW
         huUn3mh/FeskanL6iStoLBPb8CRl6mVZk7SlHjhKKL7H7Z8gMfWmn9wtg/kYHsyvKLAv
         nBSLPuVvIIjBAVJWarS1tenR+N8kTjzHFneNohEgIViWpvjNblx5ynXOsjh/Z81/8i12
         OesQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Return-Path: <abdallah.bouassida@lauterbach.com>
Received: from smtp1.lauterbach.com (smtp1.lauterbach.com. [62.154.241.196])
        by mx.google.com with ESMTPS id n143si8680859wmd.70.2018.05.02.06.31.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 May 2018 06:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) client-ip=62.154.241.196;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of abdallah.bouassida@lauterbach.com designates 62.154.241.196 as permitted sender) smtp.mailfrom=abdallah.bouassida@lauterbach.com
Received: (qmail 25145 invoked by uid 484); 2 May 2018 13:31:39 -0000
X-Qmail-Scanner-Diagnostics: from 41.224.44.126 by smtp1.lauterbach.com (envelope-from <abdallah.bouassida@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(41.224.44.126):. 
 Processed in 0.178891 secs); 02 May 2018 13:31:39 -0000
Received: from unknown (HELO [192.168.187.23]) (Authenticated_SSL:abouassida@[41.224.44.126])
          (envelope-sender <abdallah.bouassida@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <khaled.jmal@lauterbach.com>; 2 May 2018 13:31:39 -0000
Subject: ping Re: [PATCH v6 0/3] target/arm: Add a dynamic XML-description of
 the cp-registers to GDB
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, alex.bennee@linaro.org
Cc: qemu-arm@nongnu.org, khaled.jmal@lauterbach.com
References: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
From: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Message-ID: <6e78d680-a659-c00e-2dd2-81966ecc99fb@lauterbach.com>
Date: Wed, 2 May 2018 14:31:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: Pl1Hqaxx9JJm

ping

Le 4/19/2018 à 4:56 PM, Abdallah Bouassida a écrit :
> The previous version:
> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=33714
>
> Abdallah Bouassida (3):
>   target/arm: Add "ARM_CP_NO_GDB" as a new bit field for ARMCPRegInfo
>     type
>   target/arm: Add "_S" suffix to the secure version of a sysreg
>   target/arm: Add the XML dynamic generation
>
>  gdbstub.c            | 10 +++++++
>  include/qom/cpu.h    |  5 +++-
>  target/arm/cpu.c     |  1 +
>  target/arm/cpu.h     | 29 +++++++++++++++++++-
>  target/arm/gdbstub.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/helper.c  | 57 ++++++++++++++++++++++++++++++---------
>  6 files changed, 164 insertions(+), 14 deletions(-)
>
