Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422560nji;
        Thu, 12 Sep 2024 00:39:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXskXw6kSRnLoPYvuCUwUTCnoKVdO83f+JjpqTlC3E5Qr74XOoa77pYbaRAnw1y/e3CwajUt038+navUQ==@linaro.org
X-Received: by 2002:a05:6a00:228a:b0:717:8e01:c593 with SMTP id d2e1a72fcca58-71926063591mr3256800b3a.3.1726126793250;
        Thu, 12 Sep 2024 00:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126793; cv=none;
        d=google.com; s=arc-20160816;
        b=mki/NtYOXIxx66XGYMjj5qVy8mV6QQWDkYGgLYXFT4lAgc8/qozjA5Rb1hXPXOioRY
         zyLg5ezndYOEviQ5fpCrfTy5hwzRX0Ua76wjRD2NUL02LoqK6+JApv9QULbmOhjtFbn7
         CdsPNXjNWHfBvDEvfIDuGPMCRi1909jaJgYMjFLJYfKyGS7CBmN/u7sK8sksytJrJMQk
         riadFpoOUzUC9/atyuQsxDLY6pHdV2xpqQLzlG8RRgSgs9fkh444JUTOJGbepBL3iaKI
         snC2Jr/dQpbsHjHEvRkoBD8G6e+F+YRQl0TEkL6FdFewoTbMSimJbwCp69PY381kFf6e
         TXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1LH7RZDNr8Bem+cpDiAWWDNCRvN8aqG8ZgQstwfOCIs=;
        fh=p3UeHY8JtyDfScRtEBp8ejLPeYkYd04FaELPvW+kNNE=;
        b=uuLZVHRTOCsDODqVwCzcbjnRzymidJEcM58HzhhTDrJ5iK8c5RnpICTA81tsvnC0VB
         Q21v0n79WGluUbwv9PpbPrP8fY6NH4w1MuB7jnA938qynzb5VBKlNBbge0mIEMjBgvXz
         PmwWbVF/fywmN8Kjaj+eq5tR7mdQeVRkYBQPmk/Kx7VqwdfJ2hoGpinF1qIeZTzn8nii
         34NrFHK+XDtHEUTTEgVNtdxAS0ACR4DqPZg3EGBBmKGKVEzTOGPoo2mfuohX/4TDYXjQ
         52nenCez+qyGvDzcvhqdr7VvJz0qsGAlQHmdi9BvpX7wKBQAQaubeLZ+6ASC2umvpBur
         6Auw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wBT/TBVU";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58db6b7sor7530023b3a.6.2024.09.12.00.39.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wBT/TBVU";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126793; x=1726731593; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LH7RZDNr8Bem+cpDiAWWDNCRvN8aqG8ZgQstwfOCIs=;
        b=wBT/TBVUa1TDzpFZlgtkPIKvLfcm6PohHSqvsMZ9UwUl0o9aLGPnevFj2cV/4St5js
         jP9igCEzLQ4g9iR/UCAS2KTLSiSumLsR0yV1kLkRu10HkLplZh0Ub6u+xdiS0F4NC5g6
         KM8OiwxoX3iabTOyOTeVZRr+0LFtHYnDQl1WFJcPdieomEy9kEWxor37LKXUyGauWoe+
         hIvhsUkINsHj1MDgGTlVX3KvXE1j5s2Okr+Fnqp4RZsaLHOVf45O0iamI0VLLUZYUOMP
         9c/gDbeGKJpSB/mdQAglOreiFCJym64MYl9gKpwbzvgcKN97O9j1gH0fSeSMA1jjrawu
         eX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126793; x=1726731593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LH7RZDNr8Bem+cpDiAWWDNCRvN8aqG8ZgQstwfOCIs=;
        b=IsTegito9GphPQJV/Svju2SmLZEutGCGZ2YO6d1dxJ0kXewHmhhkY1xIPEq4Q7F+I+
         Sus7TaYtkNkmM0YLSMYYZTnkmZCLzxBJEALqtYhLFB64nCDo3T/pOE6KrU9qfVLCNxns
         uffkp0jeIr13xTRCxF9yarbKAaRGx/MaFmZ5HOYwegzlFRiNzRIVgNG8HLGtucfqvsTb
         yH2jzLv1wfr0s0FL4QtkBHL0DDRGt/m28DrNNWPpEB8dHKHavScFqo7ZRVKXpYdUWxwp
         2tilFEpEONQgYsjKy/yRiQhuC3LXhMguVVX1mkNYLWLnPC8kqIBBme3H7t+jb3EJ5Rw4
         emaw==
X-Forwarded-Encrypted: i=1; AJvYcCWSr+BWlwBDeNWqNbZITE9qVab6b0pCWXVoSA5Lb50yoWrvu5+/XSmG25c05x17ES5UjF7V3mt7Fptk3g==@linaro.org
X-Gm-Message-State: AOJu0YyzccYDzHBbNWc1PEWneqOk72eRtX3aIhYaMdRrqMD4zJ/xJS+h
	riBjU/n1txmyDEi01xKlT+Q/GkviEgU54ETpIaHABTZIVR6lZn4rfc8HqsOADKTQmg==
X-Google-Smtp-Source: AGHT+IHO/OYYyb0vxtmPEDD5VDcNxDdhzKA5t0NP0cSnDTfGGp5wourxXyyoQSgKxB6gKjLR2x0CeA==
X-Received: by 2002:a05:6a00:ac2:b0:717:8cef:4053 with SMTP id d2e1a72fcca58-7192608fd96mr3206049b3a.14.1726126792521;
        Thu, 12 Sep 2024 00:39:52 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:39:51 -0700 (PDT)
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
Subject: [PATCH v2 10/48] system: replace assert(0) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:43 -0700
Message-Id: <20240912073921.453203-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MEQYsNJ1r4MZ

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 system/rtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/rtc.c b/system/rtc.c
index dc44576686e..216d2aee3ae 100644
--- a/system/rtc.c
+++ b/system/rtc.c
@@ -62,7 +62,7 @@ static time_t qemu_ref_timedate(QEMUClockType clock)
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
     return value;
 }
-- 
2.39.2
