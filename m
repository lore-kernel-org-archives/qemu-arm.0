Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp784601njb;
        Fri, 28 Feb 2025 01:17:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0hFLCdJ7EW/cwFsvm/BvQQq3n8uPvFPk2frHH83H+HQQW5nLG4ReNcGbcwEoZY/XqqseGeLT9zwxzvg==@linaro.org
X-Google-Smtp-Source: AGHT+IFihBHlcxH3R+Kn91PtOzSpZSG2nbu6dViAORZ3julTn7K2QTC1KoXVjWuLDvUitkKNT0Z6
X-Received: by 2002:a05:620a:2907:b0:7c0:a70e:b91f with SMTP id af79cd13be357-7c39c4a3ffamr446385585a.8.1740734249598;
        Fri, 28 Feb 2025 01:17:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740734249; cv=none;
        d=google.com; s=arc-20240605;
        b=XVSqrJiHNSC/CPZUwoVACOdBpOrOzfrhn5sAUujlI9gwa27uk0Hk1AmwTVLvC6My+U
         d0KU4GRuczYyMYphNFO1b8z+sMFcYTR/lBFbNqXPCTytyNeCxSJL0CSqdjPoti1vooJm
         iZzGFKhTLesCXu7Gf/HfBKgmjbXGe6zlJlfjtWMbsK6Nm04LKORCq5ukNu+9y1gFUPG+
         rZcKcvRN0vkZx6mlNsgjl0IjPzt5oq5NaK1SkSaNEclpSKGkGhRYz9rC/p5/0VCXJ0Bb
         R4Pfr2aUpQDWbI3KDNSsIT743z7Ra2KEb5ELc0Tf7z+BmfZ+Zl8F206vMfHZVlPU/gKT
         pVIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=EHxhOkuZjgX65mNVQYttlRklUO5iDqMdg79NReWJTD8=;
        fh=t/xybFWV2B884dK2bO1HGz5LnOWlFKzKgenI2zgFzYc=;
        b=QNGzbW+2BC1ZXYUKwW2xcNFwdUgX/mYah43/YTfUGRRfNsQwHqv4Gfbgm/fOLxM51s
         /hp1MvVxX3mXTdJ5Eiry77pl9prLTAmuZM5MLs8NOuE70UIgNdOefV3mOQwAB80RcT5j
         CqJcvEgLdGvwqpQb1AGpc22lqbpU/yY3yORja6zJJKKo1kZ3Fy3woVxNTxGaPNldOEly
         kPEyzOXwmAWEgwgbLqct2uNvdgXeNFpKCuXMPopOfF8XxNJmvu5AD7TPar9x18tRbkqu
         eZcRwiazFqTCxVUiipxZsIl5EZdtl1SqSXJHeKshG0eGft5/R6vVTzr29iVvHE8VIhfJ
         BJ2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c36ff6a019si288025985a.273.2025.02.28.01.17.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 01:17:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnwUl-0000nU-Be; Fri, 28 Feb 2025 04:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwUj-0000mO-0o; Fri, 28 Feb 2025 04:17:21 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwUh-0008Cv-AU; Fri, 28 Feb 2025 04:17:20 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z42c25s4mz6K9MM;
 Fri, 28 Feb 2025 17:15:14 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id AFB991400D9;
 Fri, 28 Feb 2025 17:17:15 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 28 Feb
 2025 10:17:13 +0100
Date: Fri, 28 Feb 2025 17:17:08 +0800
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 02/19] tests/qtest/bios-tables-test: extend to also
 check HEST table
Message-ID: <20250228171708.00006ef4@huawei.com>
In-Reply-To: <b7d89527bb3efc48fa1035beca28ee7f414d95ac.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
 <b7d89527bb3efc48fa1035beca28ee7f414d95ac.1740671863.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.96.237.92]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +VcoWk0R5Lu6

On Thu, 27 Feb 2025 17:00:40 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Currently, aarch64 can generate a HEST table when loaded with
> -machine ras=on. Add support for it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Good to have and should always have been there...

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  tests/qtest/bios-tables-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 0a333ec43536..8d41601cc9e9 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2122,7 +2122,7 @@ static void test_acpi_aarch64_virt_tcg(void)
>  
>      data.smbios_cpu_max_speed = 2900;
>      data.smbios_cpu_curr_speed = 2700;
> -    test_acpi_one("-cpu cortex-a57 "
> +    test_acpi_one("-cpu cortex-a57 -machine ras=on "
>                    "-smbios type=4,max-speed=2900,current-speed=2700", &data);
>      free_test_data(&data);
>  }

