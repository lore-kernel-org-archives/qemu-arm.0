Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1764110lfm;
        Mon, 15 Jun 2020 07:57:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7zybt0YXL3wp55DskLGHZ24O4tI/DUq5Psrq2EtYAGuoZCqnxwQJ0etPgSTxVV4bhofWU
X-Received: by 2002:a25:2f4b:: with SMTP id v72mr45534130ybv.232.1592233060544;
        Mon, 15 Jun 2020 07:57:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592233060; cv=none;
        d=google.com; s=arc-20160816;
        b=CeraPHZNiIgRiIY5nTLnZi0L10zY5Vnyhf3BLtPgLUM56qqJsktfcRu1qMGnjdbR/L
         bFuiaRVvtYccII+H3LLiY53yfMxRSYadbgN2kVHPwWXvRtS3hOi0BGILeeEKnJoqbGMD
         1upa3LdnVprS3f/jOlc++w34aKd9KJsxTNB++fHilej59LwmOR+px8UGbKgC+wrHqIe0
         Pxz3gFYMevHBgeVMqOf3gboSKcHiSioifB1WBU9QoLyMY+ZjNL4BgEkdHMDZl/YJpNiz
         bSEPeJ1ySoeaxunFLYA6F1j+qznWG+FcWP98VJ0OuCjTTQUHHzfmnF0Y0UpRGgyzOBTt
         PFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=lfae3rppXNAdE7IF0YTrwr+MIE/ADa70w2imZpUvVLA=;
        b=wzdvhfzA40IPvvvmrHpo1sszQ9FWb8hyN+MQfzIL35826Ujm0bb9Fl5TK+e8BcwXJZ
         cz4RBcE/L9DrT3SLWBs5Fgmx09297zhLulejVzRSXdogN2gX8dYongCBOXoCYMrMy6cQ
         6J09EY59cz90mtr34gAhf5jSeOtwKVLLEGcJdPLeuIh6HCLO8PcsptgOdAfRUvsaYHRD
         6S/ypOxl9Usop75a50Ztjm6KVCOU5pzle1oFAyQ3GbTj0ptEbblg9cGbRe65h1df9iXk
         Mz+CH/fxXyTuLSM+9af6OmsdeVJ6k0FA8rymU5BNl1X4C8xtwfsntDJ3iICYUQIigOz6
         8Ubw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/S5FJcT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si13826930yba.308.2020.06.15.07.57.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 07:57:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/S5FJcT";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkqYN-0001mS-TC
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 10:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jkqY7-0001UK-LT
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 10:57:23 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37387
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jkqY5-0003WM-QH
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 10:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592233041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=lfae3rppXNAdE7IF0YTrwr+MIE/ADa70w2imZpUvVLA=;
 b=g/S5FJcTqdlafrU0U6a6oJkEd50lcS3WD7qx8WF5IhfJShNJ/gM09sYg6/qYoKkf4O9RE9
 LIEdBtIKF7sFyqo1gOWCrke4YEghczvPkamnvK6dmAnJDrXLo82tdAERY6DhmWt0XrLEqs
 mcEoDGw25ULN54peFVC9LGkI9jLT9bQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-sk1SW4TyPciBKyhtddJ-WA-1; Mon, 15 Jun 2020 10:57:16 -0400
X-MC-Unique: sk1SW4TyPciBKyhtddJ-WA-1
Received: by mail-ed1-f71.google.com with SMTP id c1so4997855edd.21
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2020 07:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lfae3rppXNAdE7IF0YTrwr+MIE/ADa70w2imZpUvVLA=;
 b=b9Gc5d4DZYSo0D57ID3KI7GO6dRjBNrN/EH261zceQEF4usRB7+EJWtRbhttggB0kB
 mUv963JptZegk5pISOVD3ZABzqfr/O9xE6mg3vznQNUW+7ZnTbPf0pYe+0L2FgvycuQo
 neDE+YGjkcIcAtYFYN7guilqp9JrG3bxCVMW5nY/ygQnuPpggsYT+mFoejRXOyMb4tbB
 lgKc4abSV60vEBG9JC0DuaHFKABoOQW9D4zm/Uahm9v2wdz3krW+q0vjdBanY2THlrk1
 7KnGDn4lr4rL/H0tR2AooHA+g1EcPBRjtbQYWLBiUgXDeyr4bojL2i1GpHb2H3QZeQpG
 UgOQ==
X-Gm-Message-State: AOAM5321fkANWwv0HjFdc9APZbvr8Ni1l2lJ1WIEHxPPRPkNPx8+WH2K
 g3zZ4a8QS8LXZeKyX6CgtZHv1u3zscIZHU4hJ8LqENh09kBjAqW6E0hGPxESFEfTek9HIQUh4pW
 YIsXWPyQLqhMP
X-Received: by 2002:a05:6402:b79:: with SMTP id
 cb25mr24597436edb.334.1592233034806; 
 Mon, 15 Jun 2020 07:57:14 -0700 (PDT)
X-Received: by 2002:a05:6402:b79:: with SMTP id
 cb25mr24597403edb.334.1592233034484; 
 Mon, 15 Jun 2020 07:57:14 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id jt16sm1488149ejb.57.2020.06.15.07.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 07:57:13 -0700 (PDT)
Subject: Re: [PATCH] bios-tables-test: Fix "-tpmdev: invalid option"
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 stefanb@linux.ibm.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, mst@redhat.com, imammedo@redhat.com
References: <20200615135051.2213-1-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <aa595991-7f3a-fd83-026b-1b35aaf9c49e@redhat.com>
Date: Mon, 15 Jun 2020 16:57:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200615135051.2213-1-eric.auger@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 01:12:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: thuth@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5ZB+RJzyS+DI

On 6/15/20 3:50 PM, Eric Auger wrote:
> When configure is run with "--disable-tpm", the bios-tables-test
> q35/tis test fails with "-tpmdev: invalid option".
> 
> Skip the test if CONFIG_TPM is unset.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 53f104a9c5..b482f76c03 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -882,6 +882,7 @@ uint64_t tpm_tis_base_addr;
>  static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>                                uint64_t base)
>  {
> +#ifdef CONFIG_TPM
>      gchar *tmp_dir_name = g_strdup_printf("qemu-test_acpi_%s_tcg_%s.XXXXXX",
>                                            machine, tpm_if);
>      char *tmp_path = g_dir_make_tmp(tmp_dir_name, NULL);
> @@ -924,6 +925,9 @@ static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>      g_free(tmp_path);
>      g_free(tmp_dir_name);
>      free_test_data(&data);
> +#else
> +    g_test_skip("TPM disabled");
> +#endif
>  }
>  
>  static void test_acpi_q35_tcg_tpm_tis(void)
> 

This is simpler than Thomas' version.

Fixes: 5da7c35e25 ("bios-tables-test: Add Q35/TPM-TIS test")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

