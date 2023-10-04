Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2521123ejb;
        Wed, 4 Oct 2023 02:23:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV3FDKyr+55x6il1tU7Zf7rMdy2V3tU5mfJXOcMe6wlHhoBeBUwDgD/jovX1arQK4hGZEm
X-Received: by 2002:a05:622a:355:b0:413:825:8f36 with SMTP id r21-20020a05622a035500b0041308258f36mr1839184qtw.26.1696411395824;
        Wed, 04 Oct 2023 02:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696411395; cv=none;
        d=google.com; s=arc-20160816;
        b=CW4fV3gym2TPygmVcv0NM17hll19NwE1kVsBdQ38fUOgD+zTpYdkvrakwfsInn01Mk
         3VLsoFC2K20Hpmx4KzLy+jrDYnzTQoYSnd0OxIicUdT3qjpj+jCm65zDEVEKGZddbxHl
         rFykz5GBauug8XG/YVK4wmZMCAL9cALUa3TgdFJBB2y/rn61xzdK5sUiFTPxd8Lagpk2
         6OYQrIlZ7dPQsBj1+TY6S6KUzbNuHV2ueUmzlGMZehpYHbQHKCfjITLMPFohhNTCsNIa
         AgqIxUwTZExqczu4Rsj/rTwW97ShyDMAJqONjcqVjyCR/cUKfJuXub3xe/iN+6QTg021
         jI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature
         :ironport-hdrordr:ironport-data;
        bh=BV+C949xhkFKZqvVI3hGe8/xW89n4x3Df+hRb88uucQ=;
        fh=1SRfaIo4+Sht3Exs2W7OoL/LYvBlcRRizJnNd7fSss8=;
        b=CchUZQQ9Ha6TjHtkUE1kBiNxvO05/JafTE+0dsWedyMxqzFXj4oLGX/LPTh81AH1vy
         pCNwJi20ctD48s1hsZChZOi95KZydcQ4ffgONpN9pwR+d3StWZ05B4/kEo6vz1Rc9VsG
         XMT7z5UcoaKJCeyPRIRk0f3fZNyq5OP82ylmavwI40DkOWONQigtsrI9fIHg92u7Vomq
         UKIS3xc1KmZsRdYUyEFxxKQleb1GLt74/LH5h7/pbEpVvj07rS/Wwk5dcbbQLo83hVqm
         fgdOVtpM5qIoQD1oM7cnUZBiHI/NebxBBBLwwtUDC4udIzPV7p7wxtiSakjcvkKCKAaS
         r7cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=LjnRecA4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22-20020ac85b96000000b00417badc9998si1314671qta.453.2023.10.04.02.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 02:23:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bu.edu header.s=s1gsbu header.b=LjnRecA4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=bu.edu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qny5t-0007By-BQ; Wed, 04 Oct 2023 05:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1qny5s-0007Bk-HZ
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 05:23:00 -0400
Received: from esa2.hc2706-39.iphmx.com ([216.71.152.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1qny5q-0005aT-Sf
 for qemu-arm@nongnu.org; Wed, 04 Oct 2023 05:23:00 -0400
X-CSE-ConnectionGUID: BFQzJCIjTxCdAetxcy/2mw==
X-CSE-MsgGUID: A8iGChWKQjq2wyV4scTB4g==
X-IronPort-RemoteIP: 209.85.166.199
X-IronPort-MID: 309622938
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:d2gtiqPcEzxD4xjvrR0ZlcFynXyQoLVcMsEvi/4bfWQNrUpw0mYPn
 2BLW2GHa6mCamr9L9xza47nphlSv56Bx9c3HAZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0rrav656yAkiclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEAHjg2Uc3l48sfrZ80o35Kiq4lv0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE6dtXHmMdHI8k6s17KGxS5
 fcJb2oIcUXW7w626OrTpuhEg80iKIzqONpatCgxnHfWCvEpRZ2FSKLPjTNa9G1o14YeQLCHO
 ZRfMGs+BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJsuzmNllYgi+iF3Nz9U4yLau5VoWWhp
 Huc4HXHXgoRCPbDxm/Qmp6rrqqV9c/hY6oLGbils/dwhXWVwWocDgBQUkG0ycRVkWa7UtNbb
 k0Qo28g9PljskOsSdb5Uluzp3vsUgMgZue82tYSsGmlopc4KS7AboTYZlatsOAbifI=
IronPort-HdrOrdr: A9a23:8QMccKnuylZn+12oSJibi+yrE0bpDfI73DAbv31ZSRFFG/Fw5P
 re/sjztCWftN9/Yh0dcLy7Scy9qDbnhPpICOoqUotKPjOKhILAFugLhrcKgQeQeBEWndQ96U
 4PSchD4ZHLY2RHsQ==
X-Talos-CUID: 9a23:tVpmgmHawnrxzRlpqmJN2ncGOOsEcEHN53v5LlOoAncuEriKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3Ap4QxgQ7lG9R0noGs1I9fwWmRxoxBs6WBI0Aysqw?=
 =?us-ascii?q?EopObJBIsIDyhpmi4F9o=3D?=
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2023 05:22:55 -0400
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3515a803434so11390645ab.1
 for <qemu-arm@nongnu.org>; Wed, 04 Oct 2023 02:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1696411374; x=1697016174; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BV+C949xhkFKZqvVI3hGe8/xW89n4x3Df+hRb88uucQ=;
 b=LjnRecA4j0J2V9fEEMiEIjkKftfu/jDXrnTwYVUprrntfy0UyW8tLkgcUlajIUtq4C
 i5S7ytYYOXQ+so2YyFOISyrad2n2g5Ir65C/uitvR6jaJDh5lQUv4ckQGcU8bXXLQuZs
 Eps64bkCvzpddtEWoR62VC/WDK6U6dfqFgx+5gVlhheSjtdHgWHcHB60xqvw2h+rAxzT
 +SJciZ8hFS/Z+2qD6imJXBgwSKZYzpHhY1XPt4U2EqG2svW4IUu8uEaYTjN15LKKLc2r
 O3nB92X6TPVY4UySjoGTAuEjOlfm/taLOWdUmwHAjJ1OxSetHEkp6RokvuET8p/t/l8H
 6iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696411374; x=1697016174;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BV+C949xhkFKZqvVI3hGe8/xW89n4x3Df+hRb88uucQ=;
 b=E40RfJGgUF/Zhk11j9IBhNDqJvb2IvjkvU6etQX2J4Ks/WndTojvWZ9ejTXS3Ty+eo
 QinUsm3+fIvf5e1VP8zkPLtI/97sdpRjHaNGWNHW7ijloQNPQpQT3+54Qrpx8vhUam87
 /8TLYD5+872Ou1ZBVqfTfCVVYRQhX9EtdXEelP89ImxpEw0nYU51yTrlRCFp8O8mZdE5
 ix9EPHTHuWrj4xUEzXTBsjTQrNT/oTXmiNOlj6A8KlRBUVxuBP4r16HO5Ui2keF50rLz
 j1/9tW0ByNr96w9pb4LtaHglD9qYgsgtgOY1+uozQKaZ9mn3VVbk1LywgVMq9DLIi//+
 sb8A==
X-Gm-Message-State: AOJu0YyiN1uw+bs0XebzssSeL2vfgwuX2lQSVhD1R/0JKB9jjMVtYdi1
 4q3gYtUJJNnWWuUH3X2v0uxXjyMGfPTkPRD9OurQQc2geOaFYrxmSSIXbiEO4ZqxFWI+eSuE/Qz
 Xnt6Asd1ICVZZZ9u8vSfXTW3U84k=
X-Received: by 2002:a05:6e02:13d0:b0:351:526a:4ac with SMTP id
 v16-20020a056e0213d000b00351526a04acmr1696811ilj.2.1696411374762; 
 Wed, 04 Oct 2023 02:22:54 -0700 (PDT)
X-Received: by 2002:a05:6e02:13d0:b0:351:526a:4ac with SMTP id
 v16-20020a056e0213d000b00351526a04acmr1696803ilj.2.1696411374492; 
 Wed, 04 Oct 2023 02:22:54 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a92cbca000000b003514e467230sm874100ilq.19.2023.10.04.02.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 02:22:54 -0700 (PDT)
Date: Wed, 4 Oct 2023 05:22:48 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 04/13] fuzz: Correct invalid mentions of 'softmmu' by
 'system'
Message-ID: <20231004092238.twpzrp4iwvhx7mp4@mozz.bu.edu>
References: <20231004090629.37473-1-philmd@linaro.org>
 <20231004090629.37473-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231004090629.37473-5-philmd@linaro.org>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.152.49; envelope-from=alxndr@bu.edu;
 helo=esa2.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 1t1b7/FLG1Y7

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Thank you

On 231004 1106, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  tests/qtest/fuzz/fuzz.h | 4 ++--
>  softmmu/memory.c        | 2 +-
>  tests/qtest/fuzz/fuzz.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/fuzz.h b/tests/qtest/fuzz/fuzz.h
> index 21d1362d65..7da0bc3d7e 100644
> --- a/tests/qtest/fuzz/fuzz.h
> +++ b/tests/qtest/fuzz/fuzz.h
> @@ -49,13 +49,13 @@ typedef struct FuzzTarget {
>  
>  
>      /*
> -     * Returns the arguments that are passed to qemu/softmmu init(). Freed by
> +     * Returns the arguments that are passed to qemu/system init(). Freed by
>       * the caller.
>       */
>      GString *(*get_init_cmdline)(struct FuzzTarget *);
>  
>      /*
> -     * will run once, prior to running qemu/softmmu init.
> +     * will run once, prior to running qemu/system init.
>       * eg: set up shared-memory for communication with the child-process
>       * Can be NULL
>       */
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 234bd7b116..fa1c99f9ba 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -3638,7 +3638,7 @@ void memory_region_init_rom_device(MemoryRegion *mr,
>  }
>  
>  /*
> - * Support softmmu builds with CONFIG_FUZZ using a weak symbol and a stub for
> + * Support system builds with CONFIG_FUZZ using a weak symbol and a stub for
>   * the fuzz_dma_read_cb callback
>   */
>  #ifdef CONFIG_FUZZ
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index 3bedb81b32..9b9c9f9c36 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -207,7 +207,7 @@ int LLVMFuzzerInitialize(int *argc, char ***argv, char ***envp)
>          fuzz_target->pre_vm_init();
>      }
>  
> -    /* Run QEMU's softmmu main with the fuzz-target dependent arguments */
> +    /* Run QEMU's system main with the fuzz-target dependent arguments */
>      cmd_line = fuzz_target->get_init_cmdline(fuzz_target);
>      g_string_append_printf(cmd_line, " %s -qtest /dev/null ",
>                             getenv("QTEST_LOG") ? "" : "-qtest-log none");
> -- 
> 2.41.0
> 
