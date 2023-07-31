Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2190890ejb;
        Mon, 31 Jul 2023 06:56:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF79rhNi2fAe1x/gOUF2JvJG4sO7gUPRhpsSiivuobR6wPWS1W4MDYPEAIBULoli6a0hxRg
X-Received: by 2002:a37:2c04:0:b0:76c:8998:1866 with SMTP id s4-20020a372c04000000b0076c89981866mr8315560qkh.40.1690811771602;
        Mon, 31 Jul 2023 06:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690811771; cv=none;
        d=google.com; s=arc-20160816;
        b=eJXDgJtjK9TGH+E3aU4GAaDHQsftmmIgDQJzZjXtdONvtrTEJzUy/YHOI7P3om697C
         gb+E2L9Eo1doAFBLJnsH3s/WHfNzuGgiTgKDGCBWu3Vny2YosL5XBkWNs4wpWfQiT5/J
         jyw8ihV4ildBw8esKgrCKNnojsK9Sf286tv8wv5i18ibGLg7DWSb8fO91geN+b9dgbLP
         76Un6hoBeXsriItlDF1GCVrX7Wxx38kfhjyNcHEAwUFZSvQXYnqW6PaybiSNc8ypoLY+
         kkAB50bxHTLPMxI1BI/dxmkAnRrowa6TNGinWRjDB8EPZ84G/D9x/9mmzMjJWu2UGofQ
         nVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EtTFHe3TA4DmpqeL5bVv/5r0ddm4uFKQO3uoUzN2ypA=;
        fh=CYaJyQcms2MHgTcSxg73OCJr0qgQUjQ2eybOL+pWvtw=;
        b=yMxpr5B6K3orK0kpJ9WHULH5q+Q/yDq17AZgPb2aod4UMIcdGwnvVRLDitP8POhcDD
         YjbdWIbczB1INUn0PpgbmRb7yTcPZXgSPP8Sdmd3qCjePr7ZGb0WmFJl1h6KdKymNha/
         iUUyFuVEz+W5b2JzjGZAgb8h5jvkbP4TDagaFJin7PgCaOkJCagoUKymcPEzNTR+tUVq
         FSRZf4X6rI8aMm0itu3DKD1TAu7xGJzrr3LczWV09EqiYzDDe7r1BUttqdtvvrSYmUuI
         sCvWVoAeU/a5A4REHspQ8Sswn6mzPtqYhJBQLwVGdFptbSB/+7QP4XOJPa3qi3xbc7ES
         7UJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYtQP+ok;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dw11-20020a05620a600b00b0076ca6595ec6si2509539qkb.714.2023.07.31.06.56.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 06:56:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYtQP+ok;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qQTNM-0006bc-V7; Mon, 31 Jul 2023 09:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQTNK-0006ar-Rn
 for qemu-devel@nongnu.org; Mon, 31 Jul 2023 09:55:54 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQTNJ-0003kE-DN
 for qemu-devel@nongnu.org; Mon, 31 Jul 2023 09:55:54 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fe078dcc3aso27378645e9.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jul 2023 06:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690811752; x=1691416552;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EtTFHe3TA4DmpqeL5bVv/5r0ddm4uFKQO3uoUzN2ypA=;
 b=NYtQP+okfbCxNWareRqdNBNzf0k8nVfVUs4j1aEVOUGdapI6GMIJWYFNUBNdsTbqN3
 v5F5Acg60EGmBW8Nads+paMWbvJaj/Ryau+R89vn2Rqym/KMOOpF2DlsNkXdhYtOgYj9
 gIQ4hqbVqNuqLQUnr/zRXwS9LrzCE3R7VfGmuJT5/gSIBCmACFKtSa4NPjwTglu0VNo2
 wU2y7r55/yRBJxqLokNEWDmnCBLKb5LNu85GQ3u21KrGj75YZm7FS+5fgzGwIFUhh/P0
 TgpJspmjQ1XNJXIeR+TY/TxsWF9Q17tDJcTBQKbAI0N5v6wdnlXXGI1OhqVpF7MVx2Mm
 EVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690811752; x=1691416552;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EtTFHe3TA4DmpqeL5bVv/5r0ddm4uFKQO3uoUzN2ypA=;
 b=BuHZDrjgTBfUM9XEEk/EOQVV/qqvwjjTnLzQdWJIyFpHq2V3AFJxe4tyNfj/PDqen/
 bg1VT30UJ7AyJbkjic7i2HyQDW9fFPJYXrhqcx8Gb98LNYMkJxoVbO1VGDf3PJg9oJ1q
 fyxNNZWPSTLERMVHKkO/Mj+7rebNg3zOy92u/WFYSWpWcHH6cpKblKtj7mMXQGiee92C
 a5Jg+B7RS/EGUuAUES4a59bnkvgt8raDFrheLQgVYc12JDQpNR5u8psuNm2ozRgtBouu
 utEg6oBb2G1X9mt1Lh2tmPoweUUGyRdEL4tAcB+ZcU1YIKLZ2vvIfsycO08H+HAXrAdS
 jx3A==
X-Gm-Message-State: ABy/qLbSr2AO+0fBoyejkTHOIb6cTkpV4SloFQsUV8w9BzVg86ouJzIV
 6yG8L1l+Qaw+RM3/3iM38x3aoI54lGnphfKFRKQ=
X-Received: by 2002:a5d:49d1:0:b0:314:49e4:b0c4 with SMTP id
 t17-20020a5d49d1000000b0031449e4b0c4mr7642695wrs.70.1690811751772; 
 Mon, 31 Jul 2023 06:55:51 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.198.42])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a5d6184000000b003142c85fbcdsm13166173wru.11.2023.07.31.06.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 06:55:51 -0700 (PDT)
Message-ID: <53cb9a48-af54-3fce-eb53-ebbc6d12fe62@linaro.org>
Date: Mon, 31 Jul 2023 15:55:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2] kvm: Fix crash due to access uninitialized kvm_state
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 david@redhat.com, shan.gavin@gmail.com
References: <20230731125946.2038742-1-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731125946.2038742-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.101,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Tqu0vTE6q+iq

On 31/7/23 14:59, Gavin Shan wrote:
> Runs into core dump on arm64 and the backtrace extracted from the
> core dump is shown as below. It's caused by accessing uninitialized
> @kvm_state in kvm_flush_coalesced_mmio_buffer() due to commit 176d073029
> ("hw/arm/virt: Use machine_memory_devices_init()"), where the machine's
> memory region is added earlier than before.
> 
>      main
>      qemu_init
>      configure_accelerators
>      qemu_opts_foreach
>      do_configure_accelerator
>      accel_init_machine
>      kvm_init
>      virt_kvm_type
>      virt_set_memmap
>      machine_memory_devices_init
>      memory_region_add_subregion
>      memory_region_add_subregion_common
>      memory_region_update_container_subregions
>      memory_region_transaction_begin
>      qemu_flush_coalesced_mmio_buffer
>      kvm_flush_coalesced_mmio_buffer
> 
> Fix it by bailing early in kvm_flush_coalesced_mmio_buffer() on the
> uninitialized @kvm_state. With this applied, no crash is observed on
> arm64.
> 
> Fixes: 176d073029 ("hw/arm/virt: Use machine_memory_devices_init()")
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v2: Bail early in kvm_flush_coalesced_mmio_buffer() on the uninitialized
>      @kvm_state and improved changelog        (David/Peter)
> ---
>   accel/kvm/kvm-all.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

