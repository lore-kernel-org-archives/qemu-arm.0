Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp219476lfm;
        Wed, 1 Jul 2020 00:50:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgUl7OYKI9+DK3Eq/COmYuPqKZNsaeXt1D+PooxpJvLWxHv4gRgiqMEIcFcOEF0Ky+cSKn
X-Received: by 2002:a25:5094:: with SMTP id e142mr39202824ybb.30.1593589843127;
        Wed, 01 Jul 2020 00:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593589843; cv=none;
        d=google.com; s=arc-20160816;
        b=L+QEu3QD6ydzS90MgLb2M0j4Xh+rxVEknOdAqV5W4wqmJVxUCr9eDNnrpG2BwEChQl
         KyIhMStnr5JpBPGWwzu4tGhM2heAzaZwwBVOYmR1ZeT0IFTVS3gJLfPGT2Lonf+gkJdq
         Wqbi1qCTFwOBRR5pE7z4N1eJgnvWE6BdVFfsYJA3grx50/Q9CtvhU1QXFN8jghd/IJZK
         rqg3RM+T8+Uv8LInqdL41pnDbTEa7DBrstaV37KJJmCxPhMhU9xNEmETsQVB3BDjWU3C
         Lfxiz/pte0PoVDfanoLYYf8/ngTx8ktgDFJg/BWOhA9ZJMLBSzJBzYfQnLKf72ruyIU6
         IEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=b6Q7ymScFlE5LfeO6Iz2BuxjLMnGY1Z/5ga0UysDrUA=;
        b=j4YtOmpUgQ2hkCMtBYV054ds1cU562V6INYOR2T48PdUBLSNYKL5WHaUZmqVuOLpWV
         UuLGoSEala+rUbxJr7ggn1j6gnH/KKTmMeZAgydz1cHcLvVVwzDB1KZkmkezQ7Pk86A3
         D2gwVQcgyNdqOkwde/bGUBZhthpzhI6km3f8JQmfxjQyXSyH/IHYBieNmoWPDVUx4iiJ
         4rLfXni7NJcPk2b+k3XAzrQkq7t8lmXPQBSMuAcQanm742+nqTqaWQQ7aB8WodBM846K
         w+PZTCHwh79uu8vkAPVDKP9MDzOuQ4bz4bK8OEgWpofRO/5UOfJBippaNyOAVrk3phPK
         SqOw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si5280987ybn.417.2020.07.01.00.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jul 2020 00:50:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqXVy-0002Nw-He
	for alex.bennee@linaro.org; Wed, 01 Jul 2020 03:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jqXVr-0002LO-Qt; Wed, 01 Jul 2020 03:50:35 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3716 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jqXVp-0005j7-OW; Wed, 01 Jul 2020 03:50:35 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D67D87E94BD4F4535196;
 Wed,  1 Jul 2020 15:50:20 +0800 (CST)
Received: from [10.174.187.22] (10.174.187.22) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Wed, 1 Jul 2020 15:50:11 +0800
Subject: Re: [PATCH] migration: Assign current_migration as NULL after
 migration
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20200628064923.13192-1-zhukeqian1@huawei.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <6db15144-ad79-0e25-deb1-7566fcbbf2e8@huawei.com>
Date: Wed, 1 Jul 2020 15:50:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200628064923.13192-1-zhukeqian1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.22]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/01 03:50:22
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: wanghaibin.wang@huawei.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t1UMBkdu2B/8

Please ignore this patch :-)

If we shutdown VM during migration, the migration thread may still
ref current_migration at this point.

On 2020/6/28 14:49, Keqian Zhu wrote:
> In migration_shutdown, global var current_migration is freed but not
> assigned to NULL, which may cause heap-use-after-free problem if the
> following code logic is abnormal.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  migration/migration.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 481a590f72..effffd7332 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -189,6 +189,7 @@ void migration_shutdown(void)
>       */
>      migrate_fd_cancel(current_migration);
>      object_unref(OBJECT(current_migration));
> +    current_migration = NULL;
>  }
>  
>  /* For outgoing */
> 
