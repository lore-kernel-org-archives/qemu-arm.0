Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp75182ejh;
        Thu, 25 Aug 2022 01:42:20 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6DVjKMrFx2Zq8R0ptZ4J4OaHeH8SgeY5MDYwb/Ky5qydWiZbifGu8LEjAXxbMdqNrfe+6t
X-Received: by 2002:ad4:5bcd:0:b0:496:e924:5351 with SMTP id t13-20020ad45bcd000000b00496e9245351mr2617814qvt.37.1661416940060;
        Thu, 25 Aug 2022 01:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661416940; cv=none;
        d=google.com; s=arc-20160816;
        b=dxB5mFqvKrKUdztJEzwOesyRxOsG+VkzxKRaq7dc/oJzwArWrGUpNekEOmkWkCJCpj
         D1oJGD/PPdtzpetC3m8GUmaF+i8687+/RiD3P/o5iiecFxS1gJCrjxd0uqU3cKopxXXN
         yUCarzkioZ7HdCvZD23IsoR1030NCg+xU9forEmsvcC3xcjQ1deeDjSi31EsHbJ87ZgN
         74dcbHxxJ7WjtlQz7/+Ys7eaD3pCTPNWMeIm/f4M035RidRcMjoExdvn5uVzgyiLdB5C
         9isLwxmo0MdUIUBEjFNmjP5D9aEYxv3sr6GYBUQeew3ufvf1hYnCvBgQvCRhDbNaMPpX
         OdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:from:references:cc:to
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=07NuFVTlPFiEw+vr4pL0hZa8ugwtJTg9hxjGo3WP8K4=;
        b=JIYR5KvtVCkO0xpAz7lzavsloYkKLNOVqeBoGncjld+HKoHD00adRoBaxObl2Dd10U
         441UdvYX2T4q5dVCggkxTmd7NwGHnBhIf+pWUz+faXDDUbUxSUlNqTYFDakG/P4NxeFM
         i8FPzDnHN/HcfcuJD/dl8MIYpvTBGzXy0L0rBs6G3k0bwVFJFfO1sWX7lv2IEOUJWh7h
         sNoRMC4VbH4cfKAx79fgAPmNG3dfen6sDP/mPgRfztxcqENCbjlh3tOvGSbS5T3sSdBL
         Ma59tA28hVFDM5jySzw+Ec8eL6kU5vDnSG4SjZ/3sSRg5JTcKGHbyMLeH/FBiGJgX3R6
         ND0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=edMFDROX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv5-20020a05620a1b8500b006bc374c5afbsi4876731qkb.134.2022.08.25.01.42.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Aug 2022 01:42:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=edMFDROX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oR8RP-00011W-J4
	for alex.bennee@linaro.org; Thu, 25 Aug 2022 04:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oR8Qr-0000sZ-Ci
 for qemu-arm@nongnu.org; Thu, 25 Aug 2022 04:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oR8Qn-00011e-7I
 for qemu-arm@nongnu.org; Thu, 25 Aug 2022 04:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661416898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07NuFVTlPFiEw+vr4pL0hZa8ugwtJTg9hxjGo3WP8K4=;
 b=edMFDROXJruXSirawM03zwPgEB3T7HzR0SGUFRoCKp1aixbZ+MoVd3pC5szb6tGgqU+A7m
 ZhU19RsAjVA+RUphlmnbnHqmvg6RitkgZwyjsAVgHvgLUjpGi9Lj15w0uFuFsxq/TNnqL6
 PCk7+X8zn+zRYR3gKR8LY5ctwVEUMJE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-1qWCW-TTM3qXNAVVrc5yqw-1; Thu, 25 Aug 2022 04:41:37 -0400
X-MC-Unique: 1qWCW-TTM3qXNAVVrc5yqw-1
Received: by mail-wm1-f72.google.com with SMTP id
 203-20020a1c02d4000000b003a5f5bce876so2175672wmc.2
 for <qemu-arm@nongnu.org>; Thu, 25 Aug 2022 01:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=07NuFVTlPFiEw+vr4pL0hZa8ugwtJTg9hxjGo3WP8K4=;
 b=XssOQRSePRSIXYRcf5ba1CrK8i9KsuMzKaZ/cb9f8cbkO71+zq4xsqiSNIBj90JZH2
 SLD7VMxaOja4WoZlXDd5KjMNhLYUc7GE6CJ3MM98/6mRo2lXI72Hyxa0ySz9YUsVjA1x
 +T54Y40XPZbXsg2VwV7BKo8tZnk7UDKLH1PD3f98U+wHwMKzkR3+gL9CoT95f2jYCJlH
 OXVNGQ9bpP3W6k2Oj3JIVbBJAvZwITBvewgtHm04AfTRCB9+YrqwtRTnBFMyuMCxHwuv
 hUMoWZcTswLVE3D404+1KkwVNqvj2/mJz4tV3nXvx8/8YzfHQFPCKnaHq6vBCmadPYms
 Et8Q==
X-Gm-Message-State: ACgBeo3A4nAWmnsaVHmWHBDQM9novVjE/Irz6RzGEIwbaN2VssUc8z2I
 UIGkjMicAHP11nXrKBzQwdaXKd75fjZkN4eGT2M4OQ/x5mo+48A4ncaDknZazeXbRq1GhQ19vVM
 u6jNpFHMPR9lm
X-Received: by 2002:a05:600c:4c06:b0:3a5:4eec:eb4b with SMTP id
 d6-20020a05600c4c0600b003a54eeceb4bmr1639567wmp.151.1661416896834; 
 Thu, 25 Aug 2022 01:41:36 -0700 (PDT)
X-Received: by 2002:a05:600c:4c06:b0:3a5:4eec:eb4b with SMTP id
 d6-20020a05600c4c0600b003a54eeceb4bmr1639534wmp.151.1661416896565; 
 Thu, 25 Aug 2022 01:41:36 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 d12-20020adff2cc000000b002238ea5750csm23611445wrp.72.2022.08.25.01.41.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 01:41:36 -0700 (PDT)
Message-ID: <6157f96b-7553-db89-d9ed-4c4464fb3792@redhat.com>
Date: Thu, 25 Aug 2022 10:41:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>, Bandan Das <bsd@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Darren Kenny <darren.kenny@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Fam Zheng <fam@euphon.net>,
 Joel Stanley <joel@jms.id.au>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Konstantin Kostiuk
 <kkostiuk@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-8-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 07/51] tests: Avoid using hardcoded /tmp in test cases
In-Reply-To: <20220824094029.1634519-8-bmeng.cn@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Pd8xDlM00Ey

On 24/08/2022 11.39, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Use g_get_tmp_dir() to get the directory to use for temporary files.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/fuzz/generic_fuzz_configs.h |  6 ++++--
>   tests/qtest/ahci-test.c                 | 15 +++++++++++----
>   tests/qtest/aspeed_smc-test.c           |  4 +++-
>   tests/qtest/boot-serial-test.c          |  8 ++++++--
>   tests/qtest/cxl-test.c                  |  9 ++++++---
>   tests/qtest/fdc-test.c                  |  4 +++-
>   tests/qtest/fuzz/virtio_blk_fuzz.c      |  2 +-
>   tests/qtest/hd-geo-test.c               |  8 ++++----
>   tests/qtest/ide-test.c                  |  8 ++++++--
>   tests/qtest/libqtest.c                  | 10 +++++++---
>   tests/qtest/migration-test.c            |  4 +++-
>   tests/qtest/pflash-cfi02-test.c         |  7 +++++--
>   tests/qtest/qmp-test.c                  |  4 +++-
>   tests/qtest/vhost-user-blk-test.c       |  3 ++-
>   tests/qtest/vhost-user-test.c           |  3 ++-
>   tests/qtest/virtio-blk-test.c           |  2 +-
>   tests/qtest/virtio-scsi-test.c          |  3 ++-
>   tests/unit/test-image-locking.c         |  6 ++++--
>   tests/unit/test-qga.c                   |  2 +-
>   tests/vhost-user-bridge.c               |  3 ++-
>   20 files changed, 76 insertions(+), 35 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 0775e6702b..d0f9961187 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -20,13 +20,15 @@ typedef struct generic_fuzz_config {
>   } generic_fuzz_config;
>   
>   static inline gchar *generic_fuzzer_virtio_9p_args(void){
> -    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
> +    char *tmpdir = g_strdup_printf("%s/qemu-fuzz.XXXXXX", g_get_tmp_dir());
>       g_assert_nonnull(g_mkdtemp(tmpdir));

Could you switch this to g_dir_make_tmp(), please ? (see 
https://docs.gtk.org/glib/type_func.Dir.make_tmp.html )

(and as David said, please use g_autofree to avoid the g_free() later)

> -    return g_strdup_printf("-machine q35 -nodefaults "
> +    gchar *args = g_strdup_printf("-machine q35 -nodefaults "
>       "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
>       "-fsdev local,id=hshare,path=%s,security_model=mapped-xattr,"
>       "writeout=immediate,fmode=0600,dmode=0700", tmpdir);
> +    g_free(tmpdir);
> +    return args;
>   }
>   
>   const generic_fuzz_config predefined_configs[] = {
> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> index f1e510b0ac..f26cd6f86f 100644
> --- a/tests/qtest/ahci-test.c
> +++ b/tests/qtest/ahci-test.c
> @@ -44,9 +44,9 @@
>   #define TEST_IMAGE_SIZE_MB_SMALL 64
>   
>   /*** Globals ***/
> -static char tmp_path[] = "/tmp/qtest.XXXXXX";
> -static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
> -static char mig_socket[] = "/tmp/qtest-migration.XXXXXX";
> +static char *tmp_path;
> +static char *debug_path;
> +static char *mig_socket;
>   static bool ahci_pedantic;
>   static const char *imgfmt;
>   static unsigned test_image_size_mb;
> @@ -1437,7 +1437,7 @@ static void test_ncq_simple(void)
>   
>   static int prepare_iso(size_t size, unsigned char **buf, char **name)
>   {
> -    char cdrom_path[] = "/tmp/qtest.iso.XXXXXX";
> +    char *cdrom_path = g_strdup_printf("%s/qtest.iso.XXXXXX", g_get_tmp_dir());
>       unsigned char *patt;
>       ssize_t ret;
>       int fd = mkstemp(cdrom_path);

Would it be better to use g_file_open_tmp() here?
(see https://docs.gtk.org/glib/func.file_open_tmp.html)

> @@ -1872,6 +1873,7 @@ int main(int argc, char **argv)
>       }
>   
>       /* Create a temporary image */
> +    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>       fd = mkstemp(tmp_path);
>       g_assert(fd >= 0);

g_file_open_tmp() ?

Also for the other temporary files in this test?

> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index 05ce941566..cab769459c 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -608,7 +608,7 @@ static void test_write_block_protect_bottom_bit(void)
>       flash_reset();
>   }
>   
> -static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
> +static char *tmp_path;
>   
>   int main(int argc, char **argv)
>   {
> @@ -617,6 +617,7 @@ int main(int argc, char **argv)
>   
>       g_test_init(&argc, &argv, NULL);
>   
> +    tmp_path = g_strdup_printf("%s/qtest.m25p80.XXXXXX", g_get_tmp_dir());
>       fd = mkstemp(tmp_path);

g_file_open_tmp() ?

> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 2f99d71cab..404adcfa20 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -224,8 +224,10 @@ static bool check_guest_output(QTestState *qts, const testdef_t *test, int fd)
>   static void test_machine(const void *data)
>   {
>       const testdef_t *test = data;
> -    char serialtmp[] = "/tmp/qtest-boot-serial-sXXXXXX";
> -    char codetmp[] = "/tmp/qtest-boot-serial-cXXXXXX";
> +    char *serialtmp = g_strdup_printf("%s/qtest-boot-serial-sXXXXXX",
> +                                      g_get_tmp_dir());
> +    char *codetmp = g_strdup_printf("%s/qtest-boot-serial-cXXXXXX",
> +                                    g_get_tmp_dir());

These look like good candidates for g_file_open_tmp(), too.

Please check also the other spots in this patch, I haven't looked through 
all of them now...

  Thomas

