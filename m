Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73946C54F54
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 11:23:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wplKh-0002fv-DB; Fri, 31 Jul 2026 07:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wplKf-0002fc-Jj
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 07:23:17 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wplKd-0003XE-Pk
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 07:23:17 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-697bd21fdc2so1485123a12.1
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 04:23:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785496994; cv=none;
 d=google.com; s=arc-20260327;
 b=dI7uclJAHkN6SPGzV5DLauQ07g4V1KN3M3WOKkNETEJPK1/XA6x+8jyp+pwWQa/A57
 1ONUeuf0McYZ2Nm2/VscveBBIfnQIzbvsohzKxuSlBT5SumnERVlH0guzadN8sPb1Lgp
 c/IHtTNBBGiKl72EemEVez8BD7ZLIE/Co2a1Eu2HjJlTqv0rN4vWE54V9wa1m9OQIwLe
 US5aTSL1A7ejCopmalQSAaOouB75EPWXwIo6/TyoyCOmNvi43IyhsNW1ZLcVvu6aYbPY
 yGBXWBNgAmH+4jmon7Hc7QgHe1yIODlXjC8YNbzXDt5uhSdKxLtv139buJ8mgaC6/fr9
 9BsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=InK3sWlMEUJtrTZNEBYtXG69eUj4xBvtz1Lt8ToMqhs=;
 fh=nKbV48WFMbUcpAcFtFjrMnqMUQszkk4nofIjTidJpfw=;
 b=nFvOG50HKVXDL4SwYiqCrppJPYMIVIelVBsBZVu0LFeFfuYLJZOmvqxc9g4ZMY8ywM
 Y3mBp1RZd3s0Lonw0JTveB5wi1qRruxQUcejKpOZnjhXZuV3YgIIq3P4112iga+bhHrJ
 kBgnYqQt5G+ha1Sa3dqwF0MMZz2vVGXgtOiCtoPxxMdLA790ktW6iKDzD2G7mUAxifiy
 cf4TUr4180QjCJ7bC8bplMHYS7KfKYWouWcEu33+PyArxv0NI7I8dGZLTVTp0Zkf6PEJ
 gomgunpbexq1M0uFmsRUTewLNBYHC5qf3hoqmIR5DbRvpmTkw6FqXNUlEVM9gCYTsXP5
 dvkQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785496994; x=1786101794; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=InK3sWlMEUJtrTZNEBYtXG69eUj4xBvtz1Lt8ToMqhs=;
 b=m8BIJrFiT0RziNupkMAlbxfi5R8DIaYQkUe0vcLlIs/YtPhWLvxfiff1RoiH9sjfp/
 eI8+Bx9B/RYUX5/7T4y7+1MV92kcpuV23DeLq+3IWUo73AO/Ntzo4FpKw/dQGRYzqYWE
 6qXwjXpGFc0yCBQ9L+uw1avXF2XRl3Od1+wQJUciMLC6KFyFBtfhJ64H5H8Bbsai92yS
 BaqanrV644mv31742/g6dwSzuA5kgqrg4Y7tFxLRqJz0moJ3ljMo+pOQGaeS/mGBs9YN
 1FsUyHkc5FJedl4eFAaPiBSazbRWGijd6heOJPqe65bU/N/577AuTXSFw+gXn1mNE9Dd
 dImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785496994; x=1786101794;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=InK3sWlMEUJtrTZNEBYtXG69eUj4xBvtz1Lt8ToMqhs=;
 b=WjC4zPZdtR1C9JRQ4dOogjGLRvJzw3tbPlJxAnJAdPCv2zcOptvPejK30izCBH1bMG
 hyi2NLcRpWNyA3K1JBaIPV2q8oVAjcviYp9Pa1nASgYMDFEtDFOsS2ccnv4u7p7hV4xw
 fbwcKz4WsZPlB843ToISWtPlbqJms0tEQLlmfwM4qEfVzZAJ4bzP0qbTqXb+wAD0adZ3
 Xif0E1S67dqSL3cwhyFLFpKQu9RY08Wh/UCVP2KxGq6qfc83hhfAgcoEjK/DtUre+a4M
 rQ3RtL+tuLRmaTCdabsQe1Ka7apIVDbU05NDBWFzlZ3Dw4JoaeP+gbfV9RAfE927nhvW
 NRaA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoM3PN5uzzXwvqAe4DvUZalugW1nvNv779RcHZB4jILEWOcZ0DoAdjketiHuRy2T584QdSfSGl0XQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx+s1yDwLRfDcd1jvN9vZsdURuVQCJb7Pa8Eyvv9JsxxBfOvpyz
 3leYOwjtGgW8mMr3cn5FdViHnqpwdjckTX5uqVIIpXzSpDPe35fngHxL6tr/Hq3BaYSsgoEaeA9
 GyD33HlrykBSrrcRuyKfI5bXLcfjS14uepWfVlya0OA==
X-Gm-Gg: AR+sD100argCLSofJPIOrSzSoUFeOiCEBvrAujCe9CjLu4z3aWvyoWFm9NTRbJb+HvU
 s5rfFbyMRVzNWeHggZnBEyrOrJfhlnBctZA2eVlZ7pQHv9YFTlUO2CEluRkMYuPup5KzEb7wLOP
 ud6gIBmClo1W5kRChQ6F2r4KwirmukeJ70Mx6Va9WId9VZmG2uCVNxAT87lpLruaC22y2Sg4eNG
 SvFWbukzfL7gz5kQcK1TzRkXu42fc5fbSUPynSBKJDBMjmkBccS1OHmxVoXSpODBtJjAOBoI61L
 fXVUaRF+WhP99AlqqGDlEEfd16ZGvDhQF9BQs4tJrR/5w3O9+EV2jE9yYIl0i46RZ5fgPR50Pop
 NKi1h4D44FaYEytWWx5oVcXZUQwYd
X-Received: by 2002:a17:907:60cb:b0:c04:fc6:d6bc with SMTP id
 a640c23a62f3a-c1fd2534c68mr91287666b.36.1785496994250; Fri, 31 Jul 2026
 04:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260723233605.805-1-simonxhy0404@gmail.com>
 <20260723233605.805-4-simonxhy0404@gmail.com>
In-Reply-To: <20260723233605.805-4-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Jul 2026 12:23:01 +0100
X-Gm-Features: AUfX_mwBkZ9KC78z7Lj9vK0K5G9IER25jvT6ElX3PJjTZ2DYcKRhFir9ey051pA
Message-ID: <CAFEAcA9d2SgtXvgRfBZiaZ8GgivLVJowKFccShLvjE6Qrb9rtw@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/misc/iotkit-sysinfo: make sys_config2 configurable
 for SSE-310
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 24 Jul 2026 at 00:36, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Add sys_config2 as QEMU property like sys_config.
> - Modify the sys_config2 register on the SSE-310 for the NPU configurations.
> - Currently sys_config2 is configured to report Ethos-U55 as the NPU type.

Ah, here's sys_config2. For v2, if you say in the previous
patch "this implements all the sysinfo changes for SSE-310
except for ..." then you clue reviewers in to the fact
that they should expect that to be added later in the series.

>
> Reviewed-by: Owen Giles <owen.giles@hpe.com>
> Reviewed-by: Robert Elliott <elliott@hpe.com>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> ---
>  hw/arm/armsse.c                  | 21 +++++++++++++++++++++
>  hw/misc/iotkit-sysinfo.c         | 11 +++++++++++
>  include/hw/misc/iotkit-sysinfo.h |  2 ++
>  3 files changed, 34 insertions(+)
>
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index 1847c73322..cf8f6c25d1 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -806,6 +806,22 @@ static uint32_t armsse_sys_config_value(ARMSSE *s, const ARMSSEInfo *info)
>      return sys_config;
>  }
>
> +static uint32_t armsse_sys_config2_value(ARMSSE *s, const ARMSSEInfo *info)
> +{
> +    /* Return the SYS_CONFIG2 value for this SSE */
> +    uint32_t sys_config2;
> +
> +    switch (info->sse_version) {
> +    case ARMSSE_SSE310:
> +        sys_config2 = 0;
> +        sys_config2 = deposit32(sys_config2, 0, 3, 1); /* NPU0 = Ethos-U55 */

We don't implement the NPU0, though, so we should not advertise
that it is present.

Putting in all the machinery for the property as this patch does is
fine, but since we always want to report 0 I'm also OK with
hardcoding 0 in the sysinfo device the way we do for SYS_CONFIG1.

> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    return sys_config2;
> +}
> +
>  /* Clock frequency in HZ of the 32KHz "slow clock" */
>  #define S32KCLK (32 * 1000)
>
> @@ -1496,6 +1512,11 @@ static void armsse_realize(DeviceState *dev, Error **errp)
>                                      info->sse_version, &error_abort);
>              object_property_set_int(OBJECT(&s->sysinfo), "IIDR",
>                                      info->iidr, &error_abort);
> +            if (info->sse_version == ARMSSE_SSE310) {
> +                object_property_set_int(OBJECT(&s->sysinfo), "SYS_CONFIG2",
> +                                        armsse_sys_config2_value(s, info),
> +                                        &error_abort);
> +            }

You don't need to make this conditional on sse_version. The property
always exists on the sysinfo device. If you add cases for
ARMSSE_IOTKIT, ARMSSE_SSE200, ARM_SSE300 that return 0, then
we will set the property to 0 (and the sysinfo device won't use
the value anyway).

>              if (!sysbus_realize(sbd, errp)) {
>                  return;
>              }
> diff --git a/hw/misc/iotkit-sysinfo.c b/hw/misc/iotkit-sysinfo.c
> index 21e161bdc2..0905949ef7 100644
> --- a/hw/misc/iotkit-sysinfo.c
> +++ b/hw/misc/iotkit-sysinfo.c
> @@ -31,6 +31,7 @@
>  REG32(SYS_VERSION, 0x0)
>  REG32(SYS_CONFIG, 0x4)
>  REG32(SYS_CONFIG1, 0x8)
> +REG32(SYS_CONFIG2, 0xc)
>  REG32(IIDR, 0xfc8)
>  REG32(PID4, 0xfd0)
>  REG32(PID5, 0xfd4)
> @@ -87,6 +88,15 @@ static uint64_t iotkit_sysinfo_read(void *opaque, hwaddr offset,
>              goto bad_read;
>          }
>          break;
> +    case A_SYS_CONFIG2:
> +        switch (s->sse_version) {
> +        case ARMSSE_SSE310:
> +            return s->sys_config2;
> +            break;
> +        default:
> +            goto bad_read;
> +        }
> +        break;
>      case A_IIDR:
>          switch (s->sse_version) {
>          case ARMSSE_SSE300:
> @@ -144,6 +154,7 @@ static const MemoryRegionOps iotkit_sysinfo_ops = {
>  static const Property iotkit_sysinfo_props[] = {
>      DEFINE_PROP_UINT32("SYS_VERSION", IoTKitSysInfo, sys_version, 0),
>      DEFINE_PROP_UINT32("SYS_CONFIG", IoTKitSysInfo, sys_config, 0),
> +    DEFINE_PROP_UINT32("SYS_CONFIG2", IoTKitSysInfo, sys_config2, 0),
>      DEFINE_PROP_UINT32("sse-version", IoTKitSysInfo, sse_version, 0),
>      DEFINE_PROP_UINT32("IIDR", IoTKitSysInfo, iidr, 0),
>  };
> diff --git a/include/hw/misc/iotkit-sysinfo.h b/include/hw/misc/iotkit-sysinfo.h
> index 36dc702c53..1c1b2758d9 100644
> --- a/include/hw/misc/iotkit-sysinfo.h
> +++ b/include/hw/misc/iotkit-sysinfo.h
> @@ -16,6 +16,7 @@
>   * QEMU interface:
>   *  + QOM property "SYS_VERSION": value to use for SYS_VERSION register
>   *  + QOM property "SYS_CONFIG": value to use for SYS_CONFIG register
> + *  + QOM property "SYS_CONFIG2": value to use for SYS_CONFIG2 register
>   *  + sysbus MMIO region 0: the system information register bank
>   */
>
> @@ -38,6 +39,7 @@ struct IoTKitSysInfo {
>      /* Properties */
>      uint32_t sys_version;
>      uint32_t sys_config;
> +    uint32_t sys_config2;
>      uint32_t sse_version;
>      uint32_t iidr;
>  };

thanks
-- PMM

