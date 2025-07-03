Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp589351dyc;
        Thu, 3 Jul 2025 07:50:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzPXZC2Yx4ZbaaWxJjBw9XYKgqhtypW6IYzLKVchBzq+Ljn/9aNoMHNCN/99xaC/DsHASLcRJyU+kUJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEPJVHh5HjIQv8G4aBk7a6vS0x4DhfRe8jsEV1xg/X5Bo+ubpP0N6fy0U/nT4sK9lkMOdMZ
X-Received: by 2002:a05:6000:4a08:b0:3a4:f7dc:8a62 with SMTP id ffacd0b85a97d-3b32919aaeemr2795718f8f.0.1751554216647;
        Thu, 03 Jul 2025 07:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751554216; cv=none;
        d=google.com; s=arc-20240605;
        b=Ubuie4UL/A2lCowJVclkdtq1i0q81lwn9+aLyFy4NOfVqk7mfYJ9L8hNSkb2pU0T7S
         gUWyRgcde59amFwDeegPemkUaT4RURNPmjE0VEwFDI7QqmAXN2k7jJziUqO9MI+GcbFf
         +BiJl7PIZSFwKtp4Go95NlkpoRUyYmg4ptSplbNzD4RzoH+QAGBDVanjUts28s2pXT+w
         wpdXfrTrkVjQOhLMaohFFUQ23mVuMgYV9f0pSL8yGn7cNi6hA7MCcFxRkA3VNS6qsQn6
         pA+FHVjY/7fc48pQddPimfXQJh+AtrL/yidODpGf7IXdQ6IVMs4ov/LuEAfEv0IH9xJJ
         Yw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=+K5tb6WxZBToGY8Yp7mjmQA0nqGWa4dB6EG+iaVyhrk=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=A5U+E8oEYxFexW2IE83L2iRc+eHmmWxA27AkxSi61Ho7HPgqHSt2g4PYZRx76LfJj9
         hpiaeXNFNJk5B7f1blp4lIso9WWiSnV98chupj/BG3aB82Jo1aON2kWIYqv0UvoPkZsz
         FkZI/VMYXf7ADDWalhBNlGwLZggBaABVhPgPa/3DLdkUa8jtQxzn4HWHuTy+A77S/hwp
         tsgAGhRZSpUjZmfkyJcDnK5FDq4s1HnlVBloIkFK5k0DXbhqXfHvifkJN8hLI/Io9ctV
         TdZCGVx4SgS7CeS79kmQ/OZADuSKxJ/bgu2a5roSY3sudS+9rPXdtr3e9jjQKv8Njhf7
         q73g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a0821ed6si11439025f8f.848.2025.07.03.07.50.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 07:50:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bY05p1mZGz6M4PN;
	Thu,  3 Jul 2025 22:49:18 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 76220140426;
	Thu,  3 Jul 2025 22:50:15 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 3 Jul
 2025 16:50:14 +0200
Date: Thu, 3 Jul 2025 15:50:13 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v5 17/36] qtest/bios-tables-test: Prepare for fixing the
 aarch64 viot test
Message-ID: <20250703155013.00002a86@huawei.com>
In-Reply-To: <20250703123728.414386-18-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
	<20250703123728.414386-18-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: dU548M99g3DO

On Thu,  3 Jul 2025 14:35:17 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> The test misses a variant and this puts the mess on subsequent
> rebuild-expected-aml.sh where a first DSDT reference blob is
> overriden by another one.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
For completeness..
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
