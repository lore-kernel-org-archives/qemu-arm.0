Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2446383dye;
        Mon, 30 Jun 2025 05:50:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDid0V8c4xHierLZfYPjSc42BlgbsgUIFR0rJPoIGQl7DzkElSoKu5Ec0BeB/TNivg9+A+iB4fJUWycQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHr21cFBdYF9BGbYm0GFydKJNs8Ofla8pEDSvEbSv+PJt/+WsCiUQJ4RbZADjkPgVMUC08s
X-Received: by 2002:a05:6000:460d:b0:3a4:eee4:f73a with SMTP id ffacd0b85a97d-3a98c0d1a93mr9311298f8f.22.1751287858686;
        Mon, 30 Jun 2025 05:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751287858; cv=none;
        d=google.com; s=arc-20240605;
        b=YGu6K1y1XLp8qY5XgPHfk6rPOJJhjAqEXEhSS7OEtLP/CUlWVLqgFFG5EqcUOEPddg
         cF+mosaxyKISI6CvohpAOVac79SPTkZaqgO4dzeveDKtVUv45RXE74xdnX9hsib6QrCd
         Nq+WEOf8LPEZDgY5U/iHUptPzKR6wYVkQdT2rMJSWjU6iRY1Wg8ewWD27fLqXVjGUIjP
         UqiNgSldF1nN932yB5tnh+JoFkWIos49UcbRKURLd2V4Cl5mnaq+rBKw8wa18o+d1G+P
         /nWNCppw8T8WMA7yRXr1dr8siw3b2BMnf1PvmQ0lG29mmonVCaF9LO3JkjphotP6sKsx
         JumA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=LZc0j682z1VHGJ8Oph88sE1J17brKxXcB9wRXB88tiY=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=d4dAmvUb9IPauZUmSoNah3LacsKSejuAAQswMO0K5gbspJepmcYH7/2/QOzDupRVIX
         abamyVybS/Ly3vwCkyiqtG5GOxurd37/TzqdpNJhl0dJ/D6WyUZP4172jusMicVkc7rf
         p4HH0B0h3+H2gZxRvG2YpGa1IBp5EBtNgo5UMfiX15rpDp4OtlguPlzPz9e5y2R6/HU0
         0STiftpM/13W+O7K4rNf6Z7VYs1DZyuJsmxEXVdleku+AwaidwDpN5mcZaxmRv2RAvUa
         8zJmcMGRq5utBsoOG8dGfkTNbOnT8Pwg8+wUi+kKlevRQn4F40UrPkuA8zUG65oObd9e
         kN3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a892e41ac1si5808620f8f.61.2025.06.30.05.50.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:50:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW5bd2Fl8z6M56B;
	Mon, 30 Jun 2025 20:50:05 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E82841402EC;
	Mon, 30 Jun 2025 20:50:57 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 14:50:57 +0200
Date: Mon, 30 Jun 2025 13:50:55 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 26/32] hw/acpi/ged: Support migration of
 AcpiPciHpState
Message-ID: <20250630135055.00000a4e@huawei.com>
In-Reply-To: <20250627095620.3300028-27-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-27-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: qDPkgYIbfbTd

On Fri, 27 Jun 2025 11:55:15 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add a subsection to migrate the AcpiPciHpState state.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
