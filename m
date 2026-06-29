Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7219EC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 14:11:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weCh4-0008KG-5Q; Mon, 29 Jun 2026 10:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weCh2-0008Jw-Ix
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:10:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weCgu-0004Zt-EZ
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782742226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hxr0qwFhyr0guedTxOpnX9RnfhjYWP5gUpLhCe45JHk=;
 b=ApLaOEMLKqRnZD7PC2+teVFLB6qbZhh0p3Sy9zVpTnz48z0rKdYwvzejlrPpig7ytc93Ml
 3vg/ybqR/5GjJ2RvZ6kh92nbtUCS/2BOZgHeMXiQurCSPeRWVjh4lpEgYVTCKoSMSfUcVA
 VPN0MvbopJ5SEoxv8pOa9dqJkimPmGU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-qaxaq8bwO-unKw6dsOZgrw-1; Mon, 29 Jun 2026 10:10:25 -0400
X-MC-Unique: qaxaq8bwO-unKw6dsOZgrw-1
X-Mimecast-MFC-AGG-ID: qaxaq8bwO-unKw6dsOZgrw_1782742224
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-493a6135742so17393965e9.1
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 07:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782742224; x=1783347024;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hxr0qwFhyr0guedTxOpnX9RnfhjYWP5gUpLhCe45JHk=;
 b=GTtn5GoS+lbRdkhgSBtCRtD0vSkaMuPuu1s9Aw6R5oLBDeL1xII3C/TtxbUYAczKcX
 vBZTV2GqYR+hVcHvCXkrhm43obCRAM1DXhhXakAG1aaKPdijxUJL+1KqEuhAf/9nS6m9
 4hZbiJD8m7GfPuDLzBRmNnMtzHWTox/D9lC3Yrlf3NywbjGM9JLEVdiN9B+ny6Ypoxmx
 X1I9WXKTaDudAKfuZNYEKEqgXDksQc1RFw3RsUsIjHtf1QqG66xCx2NmiYo/p87Ny8Gg
 F0ZfDv4LN3AY+wcgIb2BX61vjbekIXNLnCKaMP77apo/MuKkiiEN1DWlYbMGMT9ZcNFY
 2ivQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/HgKBTlSm/8VmC7svFE5CflLxsR8U1iK29UdEoSfdSFNs/79ygH6RmOrn8isQP7eaqnUSde33wyw==@nongnu.org
X-Gm-Message-State: AOJu0Yy+MnV+FCouCnXZ4XfIFiI6G0sfFejpFqsho13McIzppsP97xd0
 8+7CpyN4i7W1fpgsgf44x808uO9gucK6JlIJyMDcAGNL3XLlZd4ySTWr7gxwjeMcFVvAgmlVNAW
 wZQ4czZBPV+qQOioSbvDKetLLMu3l0afk8kvY2pyAwKehjfYE5FYXuw==
X-Gm-Gg: AfdE7cm/PCQRBkcF07leYjyDQVUqPpsK0SpqvPp++4BzoRBzreqGzK8PdnIu/RnRGxt
 TE9tBSNKJxlIDtrgE3fK8c9K7UQ2aCODxU2hfceDUVUvTLH0HK+zh56IsyYxcNmQMzZX3ON837d
 oV1IVoX7tXtrDvJIe+pjqaAFS0FqLgg3yW2CKCQXtS0bZjFiLZKY4jYpcrVQj0xMqH0sQuDwmWu
 YFuEFBlddlHyILtCEO8relzEl0Ry5p8mB2z//ieApkZ74zRsIWMjag7+ROrMjHcdkBkh6jAlDMd
 hr+LADQQGRrjm/96dUNYz3N+onmH99pzr32b98GULqUl8a8TxaVrkF+fG4pPCxyn+qJ6+AhTNgi
 PP08VSjCcbFXLkqUVxTsVtCO37WIMNciNiTugMPp2R14BlORoykuNRw==
X-Received: by 2002:a05:600c:8b83:b0:493:b499:3ef2 with SMTP id
 5b1f17b1804b1-493b499407emr39319825e9.37.1782742224164; 
 Mon, 29 Jun 2026 07:10:24 -0700 (PDT)
X-Received: by 2002:a05:600c:8b83:b0:493:b499:3ef2 with SMTP id
 5b1f17b1804b1-493b499407emr39319225e9.37.1782742223726; 
 Mon, 29 Jun 2026 07:10:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46fc2ff9aaesm27764057f8f.26.2026.06.29.07.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:10:23 -0700 (PDT)
Message-ID: <31c9c54c-0e27-4a68-91a6-d94ff4d8586a@redhat.com>
Date: Mon, 29 Jun 2026 16:10:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/17] sbsa-gwdt: limit compare_value to INT64_MAX
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 rad@semihalf.com, leif.lindholm@oss.qualcomm.com, qemu-arm@nongnu.org
References: <20260624102830.1355552-1-imammedo@redhat.com>
 <20260624102830.1355552-18-imammedo@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260624102830.1355552-18-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MM9xjXXmqPzPQsKtqHGlAna5w7VVmqNs7LmYsuROFbU_1782742224
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 6/24/26 12:28 PM, Igor Mammedov wrote:
> QEMU timer subsystem uses int64_t, so WCV values with bit 63 set
> overflow and cause the timer to fire immediately. The SBSA spec
> defines WCV as an unsigned 64-bit compare value, so such values
> are valid per spec and represent far-future deadlines (however
> unpractical).
> 
> Windows in GTDT mode writes WCV in two 32-bit halves while the
> watchdog is running:
> 
>  sbsa-gwdt_control_write [0x8]  <- 0xffffffff    # WOR (~4 sec)
>  sbsa-gwdt_control_write [0x0]  <- 0x1           # WCS enable
>  sbsa-gwdt_control_write [0x14] <- 0xffffffff    # WCVU (intermediate)
>  sbsa-gwdt_control_write [0x10] <- 0xa906ca28    # WCVL
>  sbsa-gwdt_control_write [0x14] <- 0xecb1        # WCVU (final)
> 
> The intermediate WCVU write (0xffffffff) creates a WCV above
> INT64_MAX, which overflows QEMU's signed timer and fires
> immediately — triggering WS0 => WS1 => reboot before the final
> WCVU write lands.
> 
> Clamp WCV to INT64_MAX to avoid timer API overflow.
> 
> Note: Windows' GTDT watchdog usage is also fragile under
> virtualization. It programs a short WOR (~4 sec), enables WCS,
> and relies on a subsequent WCV write to push the deadline far
> into the future — never using WRR for explicit refresh. On bare
> metal the WCS=>WCV gap is negligible, but in a VM the vCPU can
> be preempted between MMIO accesses while the clock keeps
> ticking, potentially expiring the short WOR timeout before the
> WCV override lands.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/watchdog/sbsa_gwdt.c        | 2 ++
>  tests/qtest/bios-tables-test.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/watchdog/sbsa_gwdt.c b/hw/watchdog/sbsa_gwdt.c
> index fb67db9672..ff7adbcb0f 100644
> --- a/hw/watchdog/sbsa_gwdt.c
> +++ b/hw/watchdog/sbsa_gwdt.c
> @@ -122,6 +122,8 @@ static void sbsa_gwdt_update_timer(SBSA_GWDTState *s, WdtRefreshType rtype)
>      }
>  
>      timeout = (uint64_t)s->wcvu << 32 | s->wcvl;
> +    /* clamp timeout to INT64_MAX to avoid timer overflow */
> +    timeout &= INT64_MAX;
>      timer_mod(s->timer, timeout);
>  }
>  
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 94fc95c8e1..370b0fd2e6 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2308,7 +2308,7 @@ static void test_acpi_aarch64_virt_tcg_gtdt_wd(void)
>          .scan_len = 128ULL * MiB,
>      };
>  
> -    test_acpi_one("-cpu cortex-a57 " "-device sbsa-gwdt", &data);
> +    test_acpi_one("-cpu cortex-a57 -device sbsa-gwdt", &data);
looks unrelated to this patch.

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Besides


>      free_test_data(&data);
>  }
>  


