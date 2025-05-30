Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1034805njh;
        Fri, 30 May 2025 03:19:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNdrQd7YwdVC1FZZB2pc7enMMYU9IuFUC56RzD0P6l723VdXCHLryDpd0UVBK2fR1WTJcLn/wzqqR82Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGyqFZGjIq3zP1OXw7HUa4l17PJtIlna7AWWMPBdT3bu4dR7mwBs309895kwMmR1vkKrVtH
X-Received: by 2002:a05:6000:1447:b0:3a4:f744:e01b with SMTP id ffacd0b85a97d-3a4f7a9b5abmr2112578f8f.39.1748600369437;
        Fri, 30 May 2025 03:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748600369; cv=none;
        d=google.com; s=arc-20240605;
        b=WICHrSv9WUwEUQ6ycNeVfXun37tKxyghvLJbpa7YgdtNvis7H+YDS1eToZ0HzK7aox
         7fLqZG52h4a6NQj8vIvllg8gVDroF8bZ55L7biqd2VyxsjCtHNzoJPYDAXLWIUkHIt2V
         bY7uZqMi8sXflnRz7cgjJLsjOU0K3x7iUSqzAsnoTO/ZFRAiOz/UMf95Sp20FUbKb/+C
         Yrx+uKknfX1dLiV0rwFoF2kSLNiQ5PiUGMDP1P/Qx/6z6egjdFxMrrPES0Qn6VY3f1kO
         fuUccjLVazwoVLtBfuwqV6uIGAHtB91piymZzkwCMOfnNoYANp4uWAFqFMFgmoZVLplr
         3q6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=OVKT/3X2rtMXt8MkqFUwoAdb7DUy68JG1TTKE7IENtg=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=d/3jLLsUcX3TFKcS9En9ju2/C7hVqbXtm/WPgOgHK+din7vPRmhON05J7/xESaHFu4
         yD7Zc0cJACcDOEMRy9a0jHm4nndgHQyheswlFBdMdCpsY8m4ANSkWBX9gNafGfz4Tvtl
         /XAythxPipmihlpquDHQv5T7fSMuEAq957fvnJjPBpcxcomq+h6d1InZWqK55vC4ojWM
         04sgVfSsHqSnq7UaHb1Zh/A4gPjSVdRbXyJQgqR9mllumrO/bIk1pMXyejopxWwbqi9X
         deZlJW4z4OTC4SiyrzYpM5L0muoIsImhIBQwHNUyQYhD2QzhrR1iYPt3THzlYlfRqWNx
         9R9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-450d63921f6si13190395e9.40.2025.05.30.03.19.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 May 2025 03:19:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7zk32ZpLz6GFJW;
	Fri, 30 May 2025 18:19:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C421214027A;
	Fri, 30 May 2025 18:19:28 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 May
 2025 12:19:28 +0200
Date: Fri, 30 May 2025 11:19:26 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v2 13/25] hw/i386/acpi-build: Move
 build_append_notification_callback to pcihp
Message-ID: <20250530111926.000026ad@huawei.com>
In-Reply-To: <20250527074224.1197793-14-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-14-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: ZaezVPAibp7h

On Tue, 27 May 2025 09:40:15 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> We plan to reuse build_append_notification_callback() on ARM
> so let's move it to pcihp.c.
> 
> No functional change intended.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
FWIW given it's just a move.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
