Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422904nji;
        Thu, 12 Sep 2024 00:41:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWH/Azq+6X+xSy9PNz3f6elhX/SaBrDYcqEM2ftc42uO7x/gCiXN8kE5Wu/Pt5HA4GfaoXm62t650U0Zw==@linaro.org
X-Received: by 2002:a05:6808:1983:b0:3da:b35d:52e0 with SMTP id 5614622812f47-3e071af8776mr1100520b6e.43.1726126866894;
        Thu, 12 Sep 2024 00:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126866; cv=none;
        d=google.com; s=arc-20160816;
        b=nP1C/ph8NvShh4E6mWYkfnM6S7Wc4+NhYxKlDNkh+qxAMgzCDF/oqyYx7CttydiFVI
         N4kR3zrdPIa1pzRgzundeXCCwSwW4hJxXDngD6GP4QIcXbO3kl4nepXU3f0I51DXZzG5
         xkO/PREj6utm+EdjSZuJAf/ZbNK4bmWDhIGWzadRSmqXelhOFW5alNl9uEfADfZ6Lidi
         hCcPPyeyLO4z2VN9dkT7mRVnSF/kKWWlNaPwV+RbaXRfK802qW2mRW7Au27r33YjG9f4
         PRoz/PzJWHc3CLZJ35jr0sbmu7S7j+es+6O9IV0eteXfvmDVDNHz8lfWCMbqWbS53J+7
         cUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=e2xm8XElPGDNfZprtVH37Ayr0VHkHPtJKuU1ivlIVl4=;
        fh=chxb3g18gFlrHlAU5Xfbux7YsEljsnbV2I4INORhGNc=;
        b=InLJnTxmSJw2TnyaxycUmREsGB8wwEi7FEg8dDrfXt9N5sRO5VzVWErPEEyDJF4Dlu
         q2LqDaa4w1yhU4SJhhW5UXcdjkbeeT+P3jcf5G9i7Rgce9eI8OnZr6j5q8mpdnOK/f3R
         21BLC3xMyjriwRLT47+Kv1mQL+q56qvvAb0dOx82QsvUB79QG3kTvp5bklLixbKqarLw
         TwkKHgSP+nXg4x35HCCJbivySRBgrS0iy+dON9VCFJ3dofNjDKBcv4W0m4wAyYXjqxNb
         OsEGJ5EslkmRWB2307t+XdrG150GOZ4vQkA4y7uGHnQYzhWslxP+gtCdqb3xMvDuTf9o
         t5DQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PIUu9Lp3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-710f14654b6sor2388771a34.7.2024.09.12.00.41.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PIUu9Lp3;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126866; x=1726731666; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2xm8XElPGDNfZprtVH37Ayr0VHkHPtJKuU1ivlIVl4=;
        b=PIUu9Lp36IBMYlmQS2JsSGjczyd+SUjpoFtRMRwVxFBXwle8SOCoCwceOeTW7oN1on
         Adejf6KXs8EX9dbCxCcI2NDR0k0hvOllXVE4Kcws3jmQ+7LuBwviD0kP5T48xedDvEHd
         25vN6HBIsOiovX4BHBbA02MKQ3Y5Qen486+PIDDg1MI05JYMNzOV7bYUDsKkzak/0Wft
         0JOBiLQ4TeGsGHeH0a7eWhj/We9IMDNCBMq93av69MmWRh5zU97xGGxDtMAAHdhp4HU8
         NuNiAvuAoS8Gqu1PrAuGM9YpbkdCRoAaINFVG+fg3ZGKtkWTauoWVbTtk1KjbySG75zA
         USaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126866; x=1726731666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2xm8XElPGDNfZprtVH37Ayr0VHkHPtJKuU1ivlIVl4=;
        b=IWTAcxqzirRIhtpF/nKA9rtv5Acwz1xD/IGcaZ/j85K1lfl1IDOSvsKRxNXqYZsLrJ
         y0WfgccFRyxpO8PpoMOMdEGxwv/7If1Qs3Wdb9LgRARsTykin0/lbEtf91461Q3OX0sr
         a+lBV9vHW2z/oRsvD0T5lXsmWoo0pA4UUD6Wbxt82/Ixlk9h9DmBDlSudUjoxAIZadq7
         EU/qlgWTWZ8tAOSK5UvvFIA2GhlgRazxBlbMkmHtKS58Mwrsv9WuqUTbU9XBjWSAArGC
         Iv6pgb7DSUgeK/Fy1HftevVIWS/1ZjTURwcLXhutyg1iZYlJWyqQOpCaLu9T1Evb31tH
         MU6A==
X-Forwarded-Encrypted: i=1; AJvYcCVHASnF9Qv5t0dmN+Z/6kz5Bi9UEGE2hkrMpb31aKn9OM/UMxefPC+rmTJRi7hx/FY4EMflkc0MsvnQMw==@linaro.org
X-Gm-Message-State: AOJu0YzgBiaJP/ilhBMUr4hTtky6mm4Y2gY0drJ/1Hdp+YTLjNf/T6F/
	AjqavUfzieDQJl0nxSZ2zY9kkhJE6VS2zW9xmv9zBrgq4g9EoQKkJnk8x+uGFK8Png==
X-Google-Smtp-Source: AGHT+IG2bps8N5RHQbEXbK5LIaAzGTJ/B29Jpl6a6SJzD8g0CGD/dFT1EoXlmzuLP4NSZ0I+DvMqHw==
X-Received: by 2002:a05:6830:6e89:b0:710:f926:708a with SMTP id 46e09a7af769-711094be6dcmr1645437a34.31.1726126866494;
        Thu, 12 Sep 2024 00:41:06 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:41:05 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	WANG Xuerui <git@xen0n.name>,
	Halil Pasic <pasic@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Corey Minyard <minyard@acm.org>,
	Keith Busch <kbusch@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jesper Devantier <foss@defmacro.it>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-riscv@nongnu.org,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	kvm@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Peter Xu <peterx@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eric Farman <farman@linux.ibm.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Fam Zheng <fam@euphon.net>,
	Weiwei Li <liwei1518@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 38/48] tcg/loongarch64: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:11 -0700
Message-Id: <20240912073921.453203-39-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LFnDX335hvan

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 5b7ed5c176b..973601aec36 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -650,7 +650,6 @@ static int tcg_out_setcond_int(TCGContext *s, TCGCond cond, TCGReg ret,
 
     default:
         g_assert_not_reached();
-        break;
     }
 
     return ret | flags;
-- 
2.39.2
