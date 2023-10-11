Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp173359ejc;
        Wed, 11 Oct 2023 08:35:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3jALQHakQQdZFMR3FP03KJ8gx5VuEgLptZBhpVjV20GYn0FRNkxwIwuwkoy8GTSTXXZlY
X-Received: by 2002:ac8:5905:0:b0:412:24e6:a492 with SMTP id 5-20020ac85905000000b0041224e6a492mr26070311qty.60.1697038530937;
        Wed, 11 Oct 2023 08:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697038530; cv=none;
        d=google.com; s=arc-20160816;
        b=et9LC6fKKsvqLDuUVp7MP262q3zjCYAUr8ElEHZttjlZwbaeRF0SRf2V8u+Gk1Ed3x
         rFdO89yqe1tDt7aic/zXXSY9jUzTc+Ksq9YOTTvMv6Ae740CBvq41b5+7LKfQIijfOuT
         qvpXzgOMRxqgwB1Ls1GohOShmtf5uLvLB/FtIMgxXE6b2NRoulBx98ataNvii0UBxerq
         VHc4NWDIxD10iAMz8RxjTvPxD1swjIAE3bHjgVZq1f+yEcbkGmt0lHBx31qS05II0ru9
         8JQEcPIb7Hvp4/EF4bnk9PZAcWYDI4hRAD81brgXwjVbEFRi1uZ3DBSkgUHkR88vETp4
         aQcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=8R6Sv9z8EkL6vXSzdDypuQTHXpmVHkNktIfQRgcdrWM=;
        fh=1opim4qnXd3deOKNV23k9vPdq8vvnpjhy2kadx1x/6c=;
        b=iY7xODcOpUNurVioXHsTn0hh0Vs4poxiBaKqtNRXRuPM8Y4SiPCxRLgBIJkp47BGk5
         0wHOSeOzEsW190m5JhAxTOlnucz0vMoGjyxABZJFLJ8gw6wP/vXrZgT7mPbwDQxZ3OaK
         SpH9tIRyu2JX9F9PHKEOPR9lSd7JveNQB4lVaK8qsAfpJubOzmLz5wxWgOkxqUGKnBh7
         OfsyWbSfuJ5+IX6V0EJDlm0r+WT2WcxpdjHgv9qeVAjWb8Xf9npzY94OI278KOapcXj+
         XV7ikG/VFfzmtGynv6Ys/42n6JOAWvFlkp/dkg6zY6SWuEdIcSr960t9ug7HvOn8EF05
         9IJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hNhdafiY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u42-20020a05622a19aa00b00418051c6609si9157268qtc.702.2023.10.11.08.35.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 08:35:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hNhdafiY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqbF7-0004g7-5j; Wed, 11 Oct 2023 11:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qqbF0-0004SO-Pp
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 11:35:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qqbEy-00013W-Hp
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 11:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697038514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8R6Sv9z8EkL6vXSzdDypuQTHXpmVHkNktIfQRgcdrWM=;
 b=hNhdafiYTgJco+ab8+4CiHuJLpaoPYBMEUvnpb75e0dmudgWEfqmPAdaTjDQMC8BBTHfW2
 mvExo69bpFmqQA2OhcCNDItxcfUPfiCPjyuZzktEL7JxX8DLZKhQweL9w+Whg/Dk3rQENO
 XM7vAwQFda/q5g3Qfcy+Ut9C+zeudhA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-IJIXfX2kO8em7eOTkpthkQ-1; Wed, 11 Oct 2023 11:35:13 -0400
X-MC-Unique: IJIXfX2kO8em7eOTkpthkQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6561b118866so85878576d6.0
 for <qemu-arm@nongnu.org>; Wed, 11 Oct 2023 08:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697038513; x=1697643313;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8R6Sv9z8EkL6vXSzdDypuQTHXpmVHkNktIfQRgcdrWM=;
 b=GgwtBPnV49mO1hg32pFoDjwosI32c2AOWEG7/f1owmIPodoF3fp5A1LpUEijxouync
 B1ZIUBlw9MYRGDmMz9bw+NoKhl7IEOFp1XM39OxsmcRXz/Dp7WmX0jCKhKH/yzTPllFQ
 73TAgYikuDutCuNk6a1Kh8i/Q+EMNWCHrxngmqVc0OP1o7NWAQkCwh8HanTutezKsi9K
 NWHYiyBsOl6S2JeeAi6ko2677q2Likj/Vl9S14GYEtMdv5kQao3QNdjW/lD17Fgh+F32
 uxqWMN2ghfi3/kdKpACYn1v6eofNDNtFDYfZLSm17v1AOEhqCAjHyZeWqYAdTHMDRRr1
 kuIg==
X-Gm-Message-State: AOJu0YzCaAvLdSITVrVbmgytxYb1YKjlCq+G4xl25AG/ueokaX3Y0hPH
 rbE+oJU+P2Svvo/31NrSbmMnwypKg/yODHTsNSBsmQZ+y9EKZXtf4gPnugO4Zi8ZtJiIS9X9Dpk
 3uUdoIaCMFIuR
X-Received: by 2002:a0c:e34a:0:b0:66d:9d2:8312 with SMTP id
 a10-20020a0ce34a000000b0066d09d28312mr1573272qvm.49.1697038512926; 
 Wed, 11 Oct 2023 08:35:12 -0700 (PDT)
X-Received: by 2002:a0c:e34a:0:b0:66d:9d2:8312 with SMTP id
 a10-20020a0ce34a000000b0066d09d28312mr1573259qvm.49.1697038512686; 
 Wed, 11 Oct 2023 08:35:12 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-176.web.vodafone.de.
 [109.43.176.176]) by smtp.gmail.com with ESMTPSA id
 z6-20020a0ce986000000b0065b29403540sm1658938qvn.127.2023.10.11.08.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 08:35:12 -0700 (PDT)
Message-ID: <cacc4a01-88e9-4631-a6d6-fbee2b483fd6@redhat.com>
Date: Wed, 11 Oct 2023 17:35:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] hw/fsi: Added qtest
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20231011151339.2782132-1-ninad@linux.ibm.com>
 <20231011151339.2782132-9-ninad@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231011151339.2782132-9-ninad@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: D13aZpfVQzX2

On 11/10/2023 17.13, Ninad Palsule wrote:
> Added basic qtests for FSI model.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> v3:
>   - Added new qtest as per Cedric's comment.
> V4:
>   - Remove MAINTAINER and documentation changes from this commit
> ---
>   tests/qtest/fsi-test.c  | 210 ++++++++++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build |   2 +
>   2 files changed, 212 insertions(+)
>   create mode 100644 tests/qtest/fsi-test.c
> 
> diff --git a/tests/qtest/fsi-test.c b/tests/qtest/fsi-test.c
> new file mode 100644
> index 0000000000..30bb7475c7
> --- /dev/null
> +++ b/tests/qtest/fsi-test.c
> @@ -0,0 +1,210 @@
...
> +int main(int argc, char **argv)
> +{
> +    int ret = -1;
> +    QTestState *s;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    s = qtest_init("-machine ast2600-evb ");
> +    if (s == NULL) {
> +        return -ENOMEM;

returning -ENOMEM here does not make too much sense ... and actually 
qtest_init() cannot return NULL. So please drop this if-statement.

> +    }
> +
> +    /* Tests for OPB/FSI0 */
> +    qtest_add_data_func("/fsi-test/test_fsi0_master_regs", s,
> +                        test_fsi0_master_regs);
> +
> +    qtest_add_data_func("/fsi-test/test_fsi0_getcfam_addr0", s,
> +                        test_fsi0_getcfam_addr0);
> +
> +    /* Tests for OPB/FSI1 */
> +    qtest_add_data_func("/fsi-test/test_fsi1_master_regs", s,
> +                        test_fsi1_master_regs);
> +
> +    qtest_add_data_func("/fsi-test/test_fsi1_getcfam_addr0", s,
> +                        test_fsi1_getcfam_addr0);
> +
> +    ret = g_test_run();
> +    qtest_quit(s);
> +
> +    return ret;
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index b071d400b3..5976081b44 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -207,6 +207,7 @@ qtests_arm = \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_VEXPRESS') ? ['test-arm-mptimer'] : []) + \
>     (config_all_devices.has_key('CONFIG_MICROBIT') ? ['microbit-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_FSI_APB2OPB_ASPEED') ? ['fsi-test'] : []) + \
>     ['arm-cpu-features',
>      'boot-serial-test']
>   
> @@ -318,6 +319,7 @@ qtests = {
>     'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>     'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
>     'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
> +  'fsi-test': files('fsi-test.c'),

I think this hunk here is not required - you only need to specify additional 
dependencies here, not the main file.

  Thomas

