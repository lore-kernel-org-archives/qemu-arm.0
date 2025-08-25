Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48E4CA0EFA
	for <qemu-arm@archiver.kernel.org>; Mon, 25 Aug 2025 10:34:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uqUWv-0001Tm-Vh; Mon, 25 Aug 2025 06:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uqUWt-0001TL-TI
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 06:34:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uqUWq-0006cR-Il
 for qemu-arm@nongnu.org; Mon, 25 Aug 2025 06:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756118055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/wk04dinmIPpQ4cVK96z+fxLoh2FCqJ98KQMCTEN+ns=;
 b=PaPAheLNJcNyhEw913TuGmWTzSj2DDWJ9M5LclRTNySmKdLJ+uSWK5ty06W3XFdRRXhZca
 1jk3rp1Cq+f1EiF70XvGp+lcB2+WntSBydAvmdr3sOgy4elGMoMay2/605usAlYdWbWnXR
 e33/bMPCbnDQcGOmBYeTWe5UubRxShI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-Ro43TbcYMba6RLGGNN852A-1; Mon, 25 Aug 2025 06:34:14 -0400
X-MC-Unique: Ro43TbcYMba6RLGGNN852A-1
X-Mimecast-MFC-AGG-ID: Ro43TbcYMba6RLGGNN852A_1756118053
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3c5ae800421so1910308f8f.1
 for <qemu-arm@nongnu.org>; Mon, 25 Aug 2025 03:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756118053; x=1756722853;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/wk04dinmIPpQ4cVK96z+fxLoh2FCqJ98KQMCTEN+ns=;
 b=vmABUFrThs6i+HSPV+/4XeBW3O6z2prMtsWqgDQbQtxcE6qpD2O3HYrPFqiz5msacU
 Y+KOGUSsnNvPTssOeFUop/pFj70Y3MiNYyQm0YXQDE4iwKx3StolNz5FWoNBuXC7V4BL
 O4KIofKThUTiYKaNlmfvxcdwUgoFrMCTQuGbQaZFjj3pqQ2P4wwr/BWtMJV7CmLpmlvV
 IbSejg//wQ63HjH+DbMEtHYjfF6SS1l4NSZfZsoS3FRTk9o3oFY/xhc7SMtavr/tkI3T
 avf+KBMD7rF4fFYIvGf5SMx3ATQRcSbyqt+7MYZScd5/DHC8bWmDecAyotOYb4n6xLd2
 1AQw==
X-Gm-Message-State: AOJu0YwjQTppKlDiMIA7ByswwB4ZQkOS0WOkDPTIxqmfindZZycdjYDa
 5+bs0nlxL7d/5ycvegCrnS8C9nk/Sy4fGShPOXOju0umxG3Os773VeWzroypd9Hg0FTOD6wR24i
 RI8T1XMS1hXAzbTgTnXyzVGitbLFvdHkcED+s2/gmdz96G5s5tN8csQ==
X-Gm-Gg: ASbGncuwdg1jwBhOS0DQYIFvo5xZmhISgxNBgLPCQYnau6Xzm7l/dQYZyNRbLVDkGE7
 YAIvDjjeHR5jtFM0NU3969Kyun599bCftnWvFbZgIwyUnvK5ge+OTuRYyZmxOrcHgmmj1l7tQul
 eH00BphcWaxsAqW3XzIigsEBEzREnEasIMs70sYPkjLYM4ePD+S3G3o308eNSFvtDib6vYqEI3p
 KYqoNBl3u1FaLncDumfsc26swqsAEP5Dsy+H6GNMPGgB7BQgKG/UcgXgAoXBAGwTk/t+/WTwOeR
 Ov7J7vZQ4nvJ8i//g85fCYJTMz1oJmfBHfk1VLaJLcffp2VjX0YHYsxNGtUxZDMD0EUP8zjIYbe
 cAl0=
X-Received: by 2002:a05:6000:3105:b0:3b8:d672:3cf8 with SMTP id
 ffacd0b85a97d-3c5dcb10b6amr9369384f8f.43.1756118053001; 
 Mon, 25 Aug 2025 03:34:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9jFjqHivEN9ZDtt6uqJw4epGS8I3riUF1Ys533XnSs5/ygn1HXKWbw/Y/YP5CxF8KO5Ym2Q==
X-Received: by 2002:a05:6000:3105:b0:3b8:d672:3cf8 with SMTP id
 ffacd0b85a97d-3c5dcb10b6amr9369368f8f.43.1756118052523; 
 Mon, 25 Aug 2025 03:34:12 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-112-084.pools.arcor-ip.net.
 [47.64.112.84]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711bb1d3esm11012918f8f.55.2025.08.25.03.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 03:34:12 -0700 (PDT)
Message-ID: <2ef8923b-18f5-47c6-b688-c9fa5b4fb0e4@redhat.com>
Date: Mon, 25 Aug 2025 12:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] tests/functional: Adapt reverse_debugging to run w/o
 Avocado
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org
Cc: qemu-arm@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
References: <20250819143916.4138035-1-gustavo.romero@linaro.org>
 <20250819143916.4138035-5-gustavo.romero@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250819143916.4138035-5-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: czYVCccm4SnBB3cYQ9tUktCdHwEhbMWAlORJTXNC3Gw_1756118053
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 19/08/2025 16.39, Gustavo Romero wrote:
> This commit removes Avocado as a dependency for running the
> reverse_debugging test.
> 
> The main benefit, beyond eliminating an extra dependency, is that there
> is no longer any need to handle GDB packets manually. This removes the
> need for ad-hoc functions dealing with endianness and arch-specific
> register numbers, making the test easier to read. The timeout variable
> is also removed, since Meson now manages timeouts automatically.
> 
> The reverse_debugging test is now executed through a runner, because it
> requires GDB in addition to QMP. The runner is responsible for invoking
> GDB with the appropriate arguments and for passing the test script to
> GDB.
> 
> Since the test now runs inside GDB, its output, particularly from
> 'stepi' commands, which cannot be disabled, interleaves with the TAP
> output from unittest. To avoid this conflict, the test no longer uses
> Meson’s 'tap' protocol and instead relies on the simpler 'exitcode'
> protocol.
> 
> reverse_debugging is kept "skipped" for aarch64, ppc64, and x86_64, so
> won't run unless QEMU_TEST_FLAKY_TESTS=1 is set in the test environment,
> before running 'make check-functional' or 'meson test [...]'.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
...
> diff --git a/tests/functional/test_aarch64_reverse_debug.py b/tests/functional/test_aarch64_reverse_debug.py
> index 58d4532835..8b6f82c227 100755
> --- a/tests/functional/test_aarch64_reverse_debug.py
> +++ b/tests/functional/test_aarch64_reverse_debug.py
...
> -    KERNEL_ASSET = Asset(
> +    ASSET_KERNEL = Asset(
>           ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
>            'releases/29/Everything/aarch64/os/images/pxeboot/vmlinuz'),
>           '7e1430b81c26bdd0da025eeb8fbd77b5dc961da4364af26e771bd39f379cbbf7')
> @@ -30,9 +29,9 @@ class ReverseDebugging_AArch64(ReverseDebugging):
>       def test_aarch64_virt(self):
>           self.set_machine('virt')
>           self.cpu = 'cortex-a53'
> -        kernel_path = self.KERNEL_ASSET.fetch()
> +        kernel_path = self.ASSET_KERNEL.fetch()
>           self.reverse_debugging(args=('-kernel', kernel_path))

Ouch, that "KERNEL_ASSET" is worth to be sent as a separate bugfix (without 
the proper "ASSET_" prefix, the asset won't be precached properly). Could 
you maybe send this as a separate patch, please?

  Thanks,
   Thomas


