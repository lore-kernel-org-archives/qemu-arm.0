Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2279711ejc;
        Wed, 24 Aug 2022 10:56:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6EO4ZTq6EIjTTgUX0qFHfDjtPf9/rZAXUuiz7ANJf7Sw6E/oLrr97AntCPJ5rDGXYDfGdx
X-Received: by 2002:a05:6214:d89:b0:479:6726:7f42 with SMTP id e9-20020a0562140d8900b0047967267f42mr315697qve.20.1661363808229;
        Wed, 24 Aug 2022 10:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661363808; cv=none;
        d=google.com; s=arc-20160816;
        b=z6MZh8soSz+rr2dAOEHFNNcP5MocpU/kcXYMJ6f2o0myfZfCec7kKJ0FVBbSnyXGE2
         mVgqrqlB29hV9Xho8QiHzsqRLTR4Lcc0JJvyyk+0o8ineAGqpDFBiM82uwpZbDHqEhqA
         3gRGjvqSJhkH/Q9mrIF9z0Dald70kLRA3dR5GdftbBmNrA3Fb0sx6jpSnwjV6WLbDB9r
         G1e6HWURAiLhO+5sQdCMyvjbHBRbmKlJzhaSY7CPdars8Gdi3UqYqHtUlzOmq0eUDL5F
         Uay27lPWkqoGqrk2SbEtYkCF2Bfc/EsRjq5YxB3m9IT7vMBRUdP2CI5piyA9836F++EN
         oUuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=DNvZd/rMJdOVPrnRj5aNl1GXHEJA5mBeaClJleVZcxo=;
        b=hxYzk2ufwiJtTwhhj1jhLfScZXY0PAeX8Je/RYIp7fTaaAecG/2EO/hPEJfaULwMe3
         NW1jcVLDZ02t7+Pw3QSxAIG7dsfE/KoLBt8U8tbnQiPRH1dTHD/W+J/JcHUgluoC7ywZ
         qsx9NntdjlgTYHX1es6eA5FPis+RIPV6EfRDhYrVR0fLe+6EwLe8aqUp77Mm+dasNR+8
         ZogDIVmaGLUtTRtc5EfCOsca3eGRp0MMYI1hPV2MWyDXe2tcFBO9JLpH/wzEqGlgVGkm
         UxcD5mhqc4EdawLSyO4Dr2ppPu7o5gXrKBx+evCUzdkcHOWyVPY9LorN6lHzs9AuBDi0
         KAmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gswCbsvv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67-20020a370346000000b006bae719a6edsi7568029qkd.324.2022.08.24.10.56.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 10:56:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gswCbsvv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQucR-0006jH-Im
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 13:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQuXg-00062l-MB
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 13:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oQuXc-0006q3-KV
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 13:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661363508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DNvZd/rMJdOVPrnRj5aNl1GXHEJA5mBeaClJleVZcxo=;
 b=gswCbsvvlauNuwWQ7bSiIZOYg751lly1pPpW9sDTmULL3cpEVcvHJIb72wuifEOuE7hz8u
 6r8kS1lVyml5GY5So8M3vvIkM9LlKOelxkD1rLkv2wyOAVn5R4eQest4aB/Ud00+TeBgsU
 A11Ovoy2OIWPn+nM6ZMggsCIjZvNu2E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-tNPSC5u8OIKo2F4BzHeUiQ-1; Wed, 24 Aug 2022 13:51:46 -0400
X-MC-Unique: tNPSC5u8OIKo2F4BzHeUiQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c66-20020a1c3545000000b003a5f6dd6a25so1138987wma.1
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 10:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=DNvZd/rMJdOVPrnRj5aNl1GXHEJA5mBeaClJleVZcxo=;
 b=bQTIoY0cfKoHm8rYWYyyXlGv81wW4NimgsPdWpxu1YujQFOx/GN+V+3chETBS0CgRQ
 bWU22IAjrUZEEOcDPmz/Ue68G8bCxUy0UJKc1Rx1NR14SLjb8+f+LL4qW95Z4lv3oCNI
 jVfvV4Ubj9UmglhJlb179qik61PYdYunkX8nY8skRlTReWFkylI9fzhtumNNsiMsp6hK
 APSOPuz+ZdrQW+7FxgWn8jvf9viZiOnjZp2zaPolG7Ub0YwctWMKpbGscRvnmhDNq6uv
 Bdbq8Dbt2IfWfL8aT862iXn4V7Fk1sB6i+V8U8vS4sYs7uE3+P9x5jQHuTCgdGCroRVV
 IMdw==
X-Gm-Message-State: ACgBeo1+4CdW4rOwt+GRPf2g1Sglk2F74Yp6EQhFueasOZsSRFVBvA30
 2tBkC5mVuLzenCekrXM3qqniWc5OP4PCNuesYpHgR/x5WzgWYfh0mEVfq6OjYeGZ6FijLKL2TBR
 hAWZ6qHn+rmJM
X-Received: by 2002:a05:6000:82:b0:225:21ff:a389 with SMTP id
 m2-20020a056000008200b0022521ffa389mr198816wrx.22.1661363505650; 
 Wed, 24 Aug 2022 10:51:45 -0700 (PDT)
X-Received: by 2002:a05:6000:82:b0:225:21ff:a389 with SMTP id
 m2-20020a056000008200b0022521ffa389mr198777wrx.22.1661363505204; 
 Wed, 24 Aug 2022 10:51:45 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c19cb00b003a5c7a942edsm2638648wmq.28.2022.08.24.10.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 10:51:44 -0700 (PDT)
Date: Wed, 24 Aug 2022 18:51:42 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>,
 Bandan Das <bsd@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Darren Kenny <darren.kenny@oracle.com>, Fam Zheng <fam@euphon.net>,
 Joel Stanley <joel@jms.id.au>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH 07/51] tests: Avoid using hardcoded /tmp in test cases
Message-ID: <YwZlLsE9ehbNL+Y9@work-vm>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-8-bmeng.cn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220824094029.1634519-8-bmeng.cn@gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: B4TGv4vLwwj+

* Bin Meng (bmeng.cn@gmail.com) wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Use g_get_tmp_dir() to get the directory to use for temporary files.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  tests/qtest/fuzz/generic_fuzz_configs.h |  6 ++++--
>  tests/qtest/ahci-test.c                 | 15 +++++++++++----
>  tests/qtest/aspeed_smc-test.c           |  4 +++-
>  tests/qtest/boot-serial-test.c          |  8 ++++++--
>  tests/qtest/cxl-test.c                  |  9 ++++++---
>  tests/qtest/fdc-test.c                  |  4 +++-
>  tests/qtest/fuzz/virtio_blk_fuzz.c      |  2 +-
>  tests/qtest/hd-geo-test.c               |  8 ++++----
>  tests/qtest/ide-test.c                  |  8 ++++++--
>  tests/qtest/libqtest.c                  | 10 +++++++---
>  tests/qtest/migration-test.c            |  4 +++-
>  tests/qtest/pflash-cfi02-test.c         |  7 +++++--
>  tests/qtest/qmp-test.c                  |  4 +++-
>  tests/qtest/vhost-user-blk-test.c       |  3 ++-
>  tests/qtest/vhost-user-test.c           |  3 ++-
>  tests/qtest/virtio-blk-test.c           |  2 +-
>  tests/qtest/virtio-scsi-test.c          |  3 ++-
>  tests/unit/test-image-locking.c         |  6 ++++--
>  tests/unit/test-qga.c                   |  2 +-
>  tests/vhost-user-bridge.c               |  3 ++-
>  20 files changed, 76 insertions(+), 35 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> index 0775e6702b..d0f9961187 100644
> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> @@ -20,13 +20,15 @@ typedef struct generic_fuzz_config {
>  } generic_fuzz_config;
>  
>  static inline gchar *generic_fuzzer_virtio_9p_args(void){
> -    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
> +    char *tmpdir = g_strdup_printf("%s/qemu-fuzz.XXXXXX", g_get_tmp_dir());

You might find it easier to use g_autofree in a lot of these, and then
you don't need to bother with the g_free at the end.

Dave

>      g_assert_nonnull(g_mkdtemp(tmpdir));
>  
> -    return g_strdup_printf("-machine q35 -nodefaults "
> +    gchar *args = g_strdup_printf("-machine q35 -nodefaults "
>      "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
>      "-fsdev local,id=hshare,path=%s,security_model=mapped-xattr,"
>      "writeout=immediate,fmode=0600,dmode=0700", tmpdir);
> +    g_free(tmpdir);
> +    return args;
>  }
>  
>  const generic_fuzz_config predefined_configs[] = {
> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> index f1e510b0ac..f26cd6f86f 100644
> --- a/tests/qtest/ahci-test.c
> +++ b/tests/qtest/ahci-test.c
> @@ -44,9 +44,9 @@
>  #define TEST_IMAGE_SIZE_MB_SMALL 64
>  
>  /*** Globals ***/
> -static char tmp_path[] = "/tmp/qtest.XXXXXX";
> -static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
> -static char mig_socket[] = "/tmp/qtest-migration.XXXXXX";
> +static char *tmp_path;
> +static char *debug_path;
> +static char *mig_socket;
>  static bool ahci_pedantic;
>  static const char *imgfmt;
>  static unsigned test_image_size_mb;
> @@ -1437,7 +1437,7 @@ static void test_ncq_simple(void)
>  
>  static int prepare_iso(size_t size, unsigned char **buf, char **name)
>  {
> -    char cdrom_path[] = "/tmp/qtest.iso.XXXXXX";
> +    char *cdrom_path = g_strdup_printf("%s/qtest.iso.XXXXXX", g_get_tmp_dir());
>      unsigned char *patt;
>      ssize_t ret;
>      int fd = mkstemp(cdrom_path);
> @@ -1454,6 +1454,7 @@ static int prepare_iso(size_t size, unsigned char **buf, char **name)
>  
>      *name = g_strdup(cdrom_path);
>      *buf = patt;
> +    g_free(cdrom_path);
>      return fd;
>  }
>  
> @@ -1872,6 +1873,7 @@ int main(int argc, char **argv)
>      }
>  
>      /* Create a temporary image */
> +    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>      fd = mkstemp(tmp_path);
>      g_assert(fd >= 0);
>      if (have_qemu_img()) {
> @@ -1889,11 +1891,13 @@ int main(int argc, char **argv)
>      close(fd);
>  
>      /* Create temporary blkdebug instructions */
> +    debug_path = g_strdup_printf("%s/qtest-blkdebug.XXXXXX", g_get_tmp_dir());
>      fd = mkstemp(debug_path);
>      g_assert(fd >= 0);
>      close(fd);
>  
>      /* Reserve a hollow file to use as a socket for migration tests */
> +    mig_socket = g_strdup_printf("%s/qtest-migration.XXXXXX", g_get_tmp_dir());
>      fd = mkstemp(mig_socket);
>      g_assert(fd >= 0);
>      close(fd);
> @@ -1947,8 +1951,11 @@ int main(int argc, char **argv)
>  
>      /* Cleanup */
>      unlink(tmp_path);
> +    g_free(tmp_path);
>      unlink(debug_path);
> +    g_free(debug_path);
>      unlink(mig_socket);
> +    g_free(mig_socket);
>  
>      return ret;
>  }
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index 05ce941566..cab769459c 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -608,7 +608,7 @@ static void test_write_block_protect_bottom_bit(void)
>      flash_reset();
>  }
>  
> -static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
> +static char *tmp_path;
>  
>  int main(int argc, char **argv)
>  {
> @@ -617,6 +617,7 @@ int main(int argc, char **argv)
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    tmp_path = g_strdup_printf("%s/qtest.m25p80.XXXXXX", g_get_tmp_dir());
>      fd = mkstemp(tmp_path);
>      g_assert(fd >= 0);
>      ret = ftruncate(fd, FLASH_SIZE);
> @@ -646,5 +647,6 @@ int main(int argc, char **argv)
>  
>      qtest_quit(global_qtest);
>      unlink(tmp_path);
> +    g_free(tmp_path);
>      return ret;
>  }
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 2f99d71cab..404adcfa20 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -224,8 +224,10 @@ static bool check_guest_output(QTestState *qts, const testdef_t *test, int fd)
>  static void test_machine(const void *data)
>  {
>      const testdef_t *test = data;
> -    char serialtmp[] = "/tmp/qtest-boot-serial-sXXXXXX";
> -    char codetmp[] = "/tmp/qtest-boot-serial-cXXXXXX";
> +    char *serialtmp = g_strdup_printf("%s/qtest-boot-serial-sXXXXXX",
> +                                      g_get_tmp_dir());
> +    char *codetmp = g_strdup_printf("%s/qtest-boot-serial-cXXXXXX",
> +                                    g_get_tmp_dir());
>      const char *codeparam = "";
>      const uint8_t *code = NULL;
>      QTestState *qts;
> @@ -264,6 +266,7 @@ static void test_machine(const void *data)
>                        serialtmp, test->extra);
>      if (code) {
>          unlink(codetmp);
> +        g_free(codetmp);
>      }
>  
>      if (!check_guest_output(qts, test, ser_fd)) {
> @@ -271,6 +274,7 @@ static void test_machine(const void *data)
>                  serialtmp);
>      }
>      unlink(serialtmp);
> +    g_free(serialtmp);
>  
>      qtest_quit(qts);
>  
> diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> index 4e6d285061..b3733cdb5f 100644
> --- a/tests/qtest/cxl-test.c
> +++ b/tests/qtest/cxl-test.c
> @@ -92,12 +92,13 @@ static void cxl_2root_port(void)
>  static void cxl_t3d(void)
>  {
>      g_autoptr(GString) cmdline = g_string_new(NULL);
> -    char template[] = "/tmp/cxl-test-XXXXXX";
> +    char *template = g_strdup_printf("%s/cxl-test-XXXXXX", g_get_tmp_dir());
>      const char *tmpfs;
>  
>      tmpfs = g_mkdtemp(template);
>  
>      g_string_printf(cmdline, QEMU_PXB_CMD QEMU_RP QEMU_T3D, tmpfs, tmpfs);
> +    g_free(template);
>  
>      qtest_start(cmdline->str);
>      qtest_end();
> @@ -106,13 +107,14 @@ static void cxl_t3d(void)
>  static void cxl_1pxb_2rp_2t3d(void)
>  {
>      g_autoptr(GString) cmdline = g_string_new(NULL);
> -    char template[] = "/tmp/cxl-test-XXXXXX";
> +    char *template = g_strdup_printf("%s/cxl-test-XXXXXX", g_get_tmp_dir());
>      const char *tmpfs;
>  
>      tmpfs = g_mkdtemp(template);
>  
>      g_string_printf(cmdline, QEMU_PXB_CMD QEMU_2RP QEMU_2T3D,
>                      tmpfs, tmpfs, tmpfs, tmpfs);
> +    g_free(template);
>  
>      qtest_start(cmdline->str);
>      qtest_end();
> @@ -121,7 +123,7 @@ static void cxl_1pxb_2rp_2t3d(void)
>  static void cxl_2pxb_4rp_4t3d(void)
>  {
>      g_autoptr(GString) cmdline = g_string_new(NULL);
> -    char template[] = "/tmp/cxl-test-XXXXXX";
> +    char *template = g_strdup_printf("%s/cxl-test-XXXXXX", g_get_tmp_dir());
>      const char *tmpfs;
>  
>      tmpfs = g_mkdtemp(template);
> @@ -129,6 +131,7 @@ static void cxl_2pxb_4rp_4t3d(void)
>      g_string_printf(cmdline, QEMU_2PXB_CMD QEMU_4RP QEMU_4T3D,
>                      tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
>                      tmpfs, tmpfs);
> +    g_free(template);
>  
>      qtest_start(cmdline->str);
>      qtest_end();
> diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
> index 52ade90a7d..8651100b05 100644
> --- a/tests/qtest/fdc-test.c
> +++ b/tests/qtest/fdc-test.c
> @@ -68,7 +68,7 @@ enum {
>      DSKCHG  = 0x80,
>  };
>  
> -static char test_image[] = "/tmp/qtest.XXXXXX";
> +static char *test_image;
>  
>  #define assert_bit_set(data, mask) g_assert_cmphex((data) & (mask), ==, (mask))
>  #define assert_bit_clear(data, mask) g_assert_cmphex((data) & (mask), ==, 0)
> @@ -608,6 +608,7 @@ int main(int argc, char **argv)
>      int ret;
>  
>      /* Create a temporary raw image */
> +    test_image = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>      fd = mkstemp(test_image);
>      g_assert(fd >= 0);
>      ret = ftruncate(fd, TEST_IMAGE_SIZE);
> @@ -640,6 +641,7 @@ int main(int argc, char **argv)
>      /* Cleanup */
>      qtest_end();
>      unlink(test_image);
> +    g_free(test_image);
>  
>      return ret;
>  }
> diff --git a/tests/qtest/fuzz/virtio_blk_fuzz.c b/tests/qtest/fuzz/virtio_blk_fuzz.c
> index 236d078cc8..3e9541a38a 100644
> --- a/tests/qtest/fuzz/virtio_blk_fuzz.c
> +++ b/tests/qtest/fuzz/virtio_blk_fuzz.c
> @@ -181,7 +181,7 @@ static void drive_destroy(void *path)
>  static char *drive_create(void)
>  {
>      int fd, ret;
> -    char *t_path = g_strdup("/tmp/qtest.XXXXXX");
> +    char *t_path = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>  
>      /* Create a temporary raw image */
>      fd = mkstemp(t_path);
> diff --git a/tests/qtest/hd-geo-test.c b/tests/qtest/hd-geo-test.c
> index 413cf964c0..dc5d8422ea 100644
> --- a/tests/qtest/hd-geo-test.c
> +++ b/tests/qtest/hd-geo-test.c
> @@ -27,7 +27,7 @@
>  
>  static char *create_test_img(int secs)
>  {
> -    char *template = strdup("/tmp/qtest.XXXXXX");
> +    char *template = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>      int fd, ret;
>  
>      fd = mkstemp(template);
> @@ -36,7 +36,7 @@ static char *create_test_img(int secs)
>      close(fd);
>  
>      if (ret) {
> -        free(template);
> +        g_free(template);
>          template = NULL;
>      }
>  
> @@ -422,7 +422,7 @@ static MBRpartitions empty_mbr = { {false, 0, 0, 0, 0, 0, 0, 0, 0},
>  
>  static char *create_qcow2_with_mbr(MBRpartitions mbr, uint64_t sectors)
>  {
> -    const char *template = "/tmp/qtest.XXXXXX";
> +    const char *template = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>      char *raw_path = strdup(template);
>      char *qcow2_path = strdup(template);
>      char cmd[100 + 2 * PATH_MAX];
> @@ -987,7 +987,7 @@ test_add_done:
>      for (i = 0; i < backend_last; i++) {
>          if (img_file_name[i]) {
>              unlink(img_file_name[i]);
> -            free(img_file_name[i]);
> +            g_free(img_file_name[i]);
>          }
>      }
>  
> diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
> index 5bcb75a7e5..ebbf8e0126 100644
> --- a/tests/qtest/ide-test.c
> +++ b/tests/qtest/ide-test.c
> @@ -121,8 +121,8 @@ enum {
>  static QPCIBus *pcibus = NULL;
>  static QGuestAllocator guest_malloc;
>  
> -static char tmp_path[] = "/tmp/qtest.XXXXXX";
> -static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
> +static char *tmp_path;
> +static char *debug_path;
>  
>  static QTestState *ide_test_start(const char *cmdline_fmt, ...)
>  {
> @@ -1015,11 +1015,13 @@ int main(int argc, char **argv)
>      int ret;
>  
>      /* Create temporary blkdebug instructions */
> +    debug_path = g_strdup_printf("%s/qtest-blkdebug.XXXXXX", g_get_tmp_dir());
>      fd = mkstemp(debug_path);
>      g_assert(fd >= 0);
>      close(fd);
>  
>      /* Create a temporary raw image */
> +    tmp_path = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>      fd = mkstemp(tmp_path);
>      g_assert(fd >= 0);
>      ret = ftruncate(fd, TEST_IMAGE_SIZE);
> @@ -1049,7 +1051,9 @@ int main(int argc, char **argv)
>  
>      /* Cleanup */
>      unlink(tmp_path);
> +    g_free(tmp_path);
>      unlink(debug_path);
> +    g_free(debug_path);
>  
>      return ret;
>  }
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 7c9fc07de4..34744ace7c 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -265,8 +265,10 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
>  
>      s = g_new(QTestState, 1);
>  
> -    socket_path = g_strdup_printf("/tmp/qtest-%d.sock", getpid());
> -    qmp_socket_path = g_strdup_printf("/tmp/qtest-%d.qmp", getpid());
> +    socket_path = g_strdup_printf("%s/qtest-%d.sock",
> +                                  g_get_tmp_dir(), getpid());
> +    qmp_socket_path = g_strdup_printf("%s/qtest-%d.qmp",
> +                                      g_get_tmp_dir(), getpid());
>  
>      /* It's possible that if an earlier test run crashed it might
>       * have left a stale unix socket lying around. Delete any
> @@ -390,9 +392,10 @@ QTestState *qtest_initf(const char *fmt, ...)
>  QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
>  {
>      int sock_fd_init;
> -    char *sock_path, sock_dir[] = "/tmp/qtest-serial-XXXXXX";
> +    char *sock_path, *sock_dir;
>      QTestState *qts;
>  
> +    sock_dir = g_strdup_printf("%s/qtest-serial-XXXXXX", g_get_tmp_dir());
>      g_assert_true(g_mkdtemp(sock_dir) != NULL);
>      sock_path = g_strdup_printf("%s/sock", sock_dir);
>  
> @@ -406,6 +409,7 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
>      unlink(sock_path);
>      g_free(sock_path);
>      rmdir(sock_dir);
> +    g_free(sock_dir);
>  
>      g_assert_true(*sock_fd >= 0);
>  
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 52988b86eb..5fa4ffeff0 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2422,7 +2422,8 @@ static bool kvm_dirty_ring_supported(void)
>  
>  int main(int argc, char **argv)
>  {
> -    char template[] = "/tmp/migration-test-XXXXXX";
> +    char *template = g_strdup_printf("%s/migration-test-XXXXXX",
> +                                     g_get_tmp_dir());
>      const bool has_kvm = qtest_has_accel("kvm");
>      const bool has_uffd = ufd_version_check();
>      const char *arch = qtest_get_arch();
> @@ -2576,6 +2577,7 @@ int main(int argc, char **argv)
>          g_test_message("unable to rmdir: path (%s): %s",
>                         tmpfs, strerror(errno));
>      }
> +    g_free(template);
>  
>      return ret;
>  }
> diff --git a/tests/qtest/pflash-cfi02-test.c b/tests/qtest/pflash-cfi02-test.c
> index 7fce614b64..6de83717dd 100644
> --- a/tests/qtest/pflash-cfi02-test.c
> +++ b/tests/qtest/pflash-cfi02-test.c
> @@ -56,7 +56,7 @@ typedef struct {
>      QTestState *qtest;
>  } FlashConfig;
>  
> -static char image_path[] = "/tmp/qtest.XXXXXX";
> +static char *image_path;
>  
>  /*
>   * The pflash implementation allows some parameters to be unspecified. We want
> @@ -608,6 +608,7 @@ static void test_cfi_in_autoselect(const void *opaque)
>  static void cleanup(void *opaque)
>  {
>      unlink(image_path);
> +    g_free(image_path);
>  }
>  
>  /*
> @@ -635,16 +636,18 @@ static const FlashConfig configuration[] = {
>  
>  int main(int argc, char **argv)
>  {
> +    image_path = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>      int fd = mkstemp(image_path);
>      if (fd == -1) {
>          g_printerr("Failed to create temporary file %s: %s\n", image_path,
>                     strerror(errno));
> +        g_free(image_path);
>          exit(EXIT_FAILURE);
>      }
>      if (ftruncate(fd, UNIFORM_FLASH_SIZE) < 0) {
>          int error_code = errno;
>          close(fd);
> -        unlink(image_path);
> +        cleanup(NULL);
>          g_printerr("Failed to truncate file %s to %u MB: %s\n", image_path,
>                     UNIFORM_FLASH_SIZE, strerror(error_code));
>          exit(EXIT_FAILURE);
> diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
> index bf7304c7dc..b950dbafaf 100644
> --- a/tests/qtest/qmp-test.c
> +++ b/tests/qtest/qmp-test.c
> @@ -161,11 +161,12 @@ static void test_qmp_protocol(void)
>  
>  /* Out-of-band tests */
>  
> -char tmpdir[] = "/tmp/qmp-test-XXXXXX";
> +char *tmpdir;
>  char *fifo_name;
>  
>  static void setup_blocking_cmd(void)
>  {
> +    tmpdir = g_strdup_printf("%s/qmp-test-XXXXXX", g_get_tmp_dir());
>      if (!g_mkdtemp(tmpdir)) {
>          g_error("g_mkdtemp: %s", strerror(errno));
>      }
> @@ -179,6 +180,7 @@ static void cleanup_blocking_cmd(void)
>  {
>      unlink(fifo_name);
>      rmdir(tmpdir);
> +    g_free(tmpdir);
>  }
>  
>  static void send_cmd_that_blocks(QTestState *s, const char *id)
> diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
> index a81c2a2715..07a4c2d500 100644
> --- a/tests/qtest/vhost-user-blk-test.c
> +++ b/tests/qtest/vhost-user-blk-test.c
> @@ -841,7 +841,8 @@ static char *create_listen_socket(int *fd)
>      char *path;
>  
>      /* No race because our pid makes the path unique */
> -    path = g_strdup_printf("/tmp/qtest-%d-sock.XXXXXX", getpid());
> +    path = g_strdup_printf("%s/qtest-%d-sock.XXXXXX",
> +                           g_get_tmp_dir(), getpid());
>      tmp_fd = mkstemp(path);
>      g_assert_cmpint(tmp_fd, >=, 0);
>      close(tmp_fd);
> diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
> index d7d6cfc9bd..a41168de25 100644
> --- a/tests/qtest/vhost-user-test.c
> +++ b/tests/qtest/vhost-user-test.c
> @@ -482,7 +482,7 @@ static TestServer *test_server_new(const gchar *name,
>          struct vhost_user_ops *ops)
>  {
>      TestServer *server = g_new0(TestServer, 1);
> -    char template[] = "/tmp/vhost-test-XXXXXX";
> +    char *template = g_strdup_printf("%s/vhost-test-XXXXXX", g_get_tmp_dir());
>      const char *tmpfs;
>  
>      server->context = g_main_context_new();
> @@ -501,6 +501,7 @@ static TestServer *test_server_new(const gchar *name,
>      server->socket_path = g_strdup_printf("%s/%s.sock", tmpfs, name);
>      server->mig_path = g_strdup_printf("%s/%s.mig", tmpfs, name);
>      server->chr_name = g_strdup_printf("chr-%s", name);
> +    g_free(template);
>  
>      g_mutex_init(&server->data_mutex);
>      g_cond_init(&server->data_cond);
> diff --git a/tests/qtest/virtio-blk-test.c b/tests/qtest/virtio-blk-test.c
> index dc5eed31c8..8920ce7c46 100644
> --- a/tests/qtest/virtio-blk-test.c
> +++ b/tests/qtest/virtio-blk-test.c
> @@ -49,7 +49,7 @@ static void drive_destroy(void *path)
>  static char *drive_create(void)
>  {
>      int fd, ret;
> -    char *t_path = g_strdup("/tmp/qtest.XXXXXX");
> +    char *t_path = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>  
>      /* Create a temporary raw image */
>      fd = mkstemp(t_path);
> diff --git a/tests/qtest/virtio-scsi-test.c b/tests/qtest/virtio-scsi-test.c
> index 8ceb12aacd..33ab6ec685 100644
> --- a/tests/qtest/virtio-scsi-test.c
> +++ b/tests/qtest/virtio-scsi-test.c
> @@ -268,7 +268,7 @@ static void test_iothread_attach_node(void *obj, void *data,
>      QVirtioSCSIPCI *scsi_pci = obj;
>      QVirtioSCSI *scsi = &scsi_pci->scsi;
>      QVirtioSCSIQueues *vs;
> -    char tmp_path[] = "/tmp/qtest.XXXXXX";
> +    char *tmp_path = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>      int fd;
>      int ret;
>  
> @@ -309,6 +309,7 @@ static void test_iothread_attach_node(void *obj, void *data,
>  fail:
>      qvirtio_scsi_pci_free(vs);
>      unlink(tmp_path);
> +    g_free(tmp_path);
>  }
>  
>  static void *virtio_scsi_hotplug_setup(GString *cmd_line, void *arg)
> diff --git a/tests/unit/test-image-locking.c b/tests/unit/test-image-locking.c
> index ba057bd66c..795c602ff6 100644
> --- a/tests/unit/test-image-locking.c
> +++ b/tests/unit/test-image-locking.c
> @@ -76,7 +76,7 @@ static void check_locked_bytes(int fd, uint64_t perm_locks,
>  static void test_image_locking_basic(void)
>  {
>      BlockBackend *blk1, *blk2, *blk3;
> -    char img_path[] = "/tmp/qtest.XXXXXX";
> +    char *img_path = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>      uint64_t perm, shared_perm;
>  
>      int fd = mkstemp(img_path);
> @@ -112,12 +112,13 @@ static void test_image_locking_basic(void)
>      blk_unref(blk3);
>      close(fd);
>      unlink(img_path);
> +    g_free(img_path);
>  }
>  
>  static void test_set_perm_abort(void)
>  {
>      BlockBackend *blk1, *blk2;
> -    char img_path[] = "/tmp/qtest.XXXXXX";
> +    char *img_path = g_strdup_printf("%s/qtest.XXXXXX", g_get_tmp_dir());
>      uint64_t perm, shared_perm;
>      int r;
>      int fd = mkstemp(img_path);
> @@ -140,6 +141,7 @@ static void test_set_perm_abort(void)
>      check_locked_bytes(fd, perm, ~shared_perm);
>      blk_unref(blk1);
>      blk_unref(blk2);
> +    g_free(img_path);
>  }
>  
>  int main(int argc, char **argv)
> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
> index a05a4628ed..b73d231cd5 100644
> --- a/tests/unit/test-qga.c
> +++ b/tests/unit/test-qga.c
> @@ -59,7 +59,7 @@ fixture_setup(TestFixture *fixture, gconstpointer data, gchar **envp)
>  
>      fixture->loop = g_main_loop_new(NULL, FALSE);
>  
> -    fixture->test_dir = g_strdup("/tmp/qgatest.XXXXXX");
> +    fixture->test_dir = g_strdup_printf("%s/qgatest.XXXXXX", g_get_tmp_dir());
>      g_assert_nonnull(g_mkdtemp(fixture->test_dir));
>  
>      path = g_build_filename(fixture->test_dir, "sock", NULL);
> diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
> index 9b1dab2f28..0da6a6157f 100644
> --- a/tests/vhost-user-bridge.c
> +++ b/tests/vhost-user-bridge.c
> @@ -631,7 +631,7 @@ static void *notifier_thread(void *arg)
>  static void
>  vubr_host_notifier_setup(VubrDev *dev)
>  {
> -    char template[] = "/tmp/vubr-XXXXXX";
> +    char *template = g_strdup_printf("%s/vubr-XXXXXX", g_get_tmp_dir());
>      pthread_t thread;
>      size_t length;
>      void *addr;
> @@ -640,6 +640,7 @@ vubr_host_notifier_setup(VubrDev *dev)
>      length = qemu_real_host_page_size() * VHOST_USER_BRIDGE_MAX_QUEUES;
>  
>      fd = mkstemp(template);
> +    g_free(template);
>      if (fd < 0) {
>          vubr_die("mkstemp()");
>      }
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

