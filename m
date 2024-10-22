Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3135127njb;
        Tue, 22 Oct 2024 07:43:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLdI130AV5hIL9aChcc3zNXokCQMz2vMBYF6QcnGldLffT1k1GwgXKiQdqy+OooaqweFk8vYnGcvcy9g==@linaro.org
X-Google-Smtp-Source: AGHT+IEvDsVqxpyC4OzovYttqGSo4JesDu9b3ovqDbmyW3Cb5p2tcxiWrfJU+3W9DxyCG1cBSlF4
X-Received: by 2002:a05:6902:709:b0:e28:68e8:ccb7 with SMTP id 3f1490d57ef6-e2e2459b66amr3361750276.12.1729608238830;
        Tue, 22 Oct 2024 07:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729608238; cv=none;
        d=google.com; s=arc-20240605;
        b=XVpJkTDhPukiZSOkWyBpslz/vX1SjPhaABlfq8JcYll5AnVpfeSOhCbppTHnJEVeLg
         QvLu+PaNOjV8katVNo7jnVUfgBsSjOTQq6HpvbsS/PWnuc5QwOi3E4bRDuJzlB3RZjgF
         MPjwgcb4nC/BX3wr1BkX3/VwT1khTRjo3QdE2JaMH0wmVp0dz3jioF7GjXZdcb9Uwsy4
         IC1OpQWOaa7sWU/wZqJwTurNJSI4eqabk9GWnSMlj7slCLjFFS12wxfSdY43yg524DWk
         uXxSBojIHmDuGJ/MZdiQBSUP4+pDoRtCWWUiS9G6hZWrIrLj4LijHfqqHUp8myRZliIp
         gVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=jmkm7bnXRwuQmIu3sWWFHMLfsruuFOdUG8mdmT2LaTA=;
        fh=f8PQoj5k0nkL1XHbOpHpY0tDf+Gu7U93HspXETo9OP4=;
        b=XOCcquKzh/XpWniZsWBas2WJbefrVslKfsoXCpKosqnPdQRae8HGFx/orFWK1zU8mt
         ZwAjQdnGoN7OLt6lzPb5lTmqd8wIVxXEes16ljg7I0ZDzKv61N6EzLlQCs4rvbfyTT1K
         iewCiJnL2mnrFh2un/P49xSSFH+zhohC9H63rsAISxGV7clTzQuSHzohHhei8Ad2W8B3
         L+TqWPwOM80P6OGNGROrvb5LlHsbSFa93MQipFXaxYO/mYtyoOm1SPfVr1ZTPm8q750R
         iJItYUeU7Z0FDVI7SzaKt6L3sQLhNUj7C+Bi/ENHUGOlKrW7j5usCjQqF2GoeGVYcQ4x
         p3kQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e2bdcb2aa71si3843815276.558.2024.10.22.07.43.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2024 07:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XXvzl2XJ9z6JB90;
	Tue, 22 Oct 2024 22:42:59 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B9FC714039E;
	Tue, 22 Oct 2024 22:43:54 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 22 Oct
 2024 16:43:53 +0200
Date: Tue, 22 Oct 2024 15:43:52 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P . =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=
 =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang
	<wangyanan55@huawei.com>, "Michael S.Tsirkin " <mst@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Eric Blake <eblake@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>, Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, <qemu-devel@nongnu.org>,
	<kvm@vger.kernel.org>, <qemu-riscv@nongnu.org>, <qemu-arm@nongnu.org>,
	"Zhenyu Wang" <zhenyu.z.wang@intel.com>, Dapeng Mi
	<dapeng1.mi@linux.intel.com>
Subject: Re: [PATCH v4 1/9] i386/cpu: Don't enumerate the "invalid" CPU
 topology level
Message-ID: <20241022154352.00001a4e@Huawei.com>
In-Reply-To: <20241022135151.2052198-2-zhao1.liu@intel.com>
References: <20241022135151.2052198-1-zhao1.liu@intel.com>
 <20241022135151.2052198-2-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: /S4324Uxjyg6

Resend. Claws-mail is still chewing up the to list for unknown reasons
and I forgot to fix it by hand.

On Tue, 22 Oct 2024 21:51:43 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> In the follow-up change, the CPU topology enumeration will be moved to
> QAPI. And considerring "invalid" should not be exposed to QAPI as an
> unsettable item, so, as a preparation for future changes, remove
> "invalid" level from the current CPU topology enumeration structure
> and define it by a macro instead.
> 
> Due to the removal of the enumeration of "invalid", bit 0 of
> CPUX86State.avail_cpu_topo bitmap will no longer correspond to "invalid"
> level, but will start at the SMT level. Therefore, to honor this change,
> update the encoding rule for CPUID[0x1F].
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

The drop of the invalid level == 0 seems reasonable to me
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
