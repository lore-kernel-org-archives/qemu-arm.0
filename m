Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656CAC624D4
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 13:24:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1OPd-00084h-43; Tue, 01 Sep 2026 09:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1OPa-0007o2-IH
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 09:20:26 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x1OPY-0007qJ-TR
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 09:20:26 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-8588583a7c3so10759457b3.2
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 06:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788268823; cv=none;
 d=google.com; s=arc-20260327;
 b=IiKfrzzZGUCvS+kEPwWPZroGZtfkxuebDcwj8y7BEF37jz1mRfuuhDFCtpouM59C/o
 Tj0bYYkb8ZhmNGqRP9iZ6hg0rfI/nHYQ/1CWTvTbDhZRoG2QtvkvO5ZxAQnfE1ZEZvNU
 uc+FiLKkOvzHg/EngqSy3FiA1RWgVo1ZiWG5jzxMJogW09bZdDIKlS2WlgxMAYx/EpHB
 7X99D5xQrWZo9uJIV9Gb9FwX1WFWWCO22l1SKEgBNdCmZEmI8JUN3zWDSgE22FLyRZQ9
 FbSBNMUF5XC92+sbrb97TmqAn7OMkau6JLnGzjyuImHg9s7caGucggbu3SjHVtdC6Zxp
 lzCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ct7+AnY8V0yf+2DAzDh9P0UCIPmmGup+l7IAwG1zyUA=;
 fh=OHM5KsqjlKPKBwEOD3pJVrLR4rj+D81n/dhYBOuTT5w=;
 b=ieSV5JIdwZMWnWHyuF/pQiOfzowKyZewq+Yc4TQ/lwrmTnPQlwOju3tHVsZwqysV8W
 ilbiLGq9Phb/LRrrl/QD2kp1spg9BtR7lXy4MoTWdxjhZEdhd7qcdc01kEsgCTaVC+vs
 cXIWhU9d5RuSsVjMdspxrJ/TrKO3IsA5hGxBTW+3iaH3bdwUdzEpYrr8ahhDvmRBpOt9
 vmo1FG2L8ObWuzk5Ag0RLwxKBOXH3NvpzroQQAqKDeaEoIwRfb90Ofj1uDy5cnag3tv1
 IgpEEap3VVdjc39Wz60Q4QkBvgBBn/+RKdLfQVaoiJu8WgsWCMmKnATA89dpsdOCaEi4
 UpTg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788268823; x=1788873623; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ct7+AnY8V0yf+2DAzDh9P0UCIPmmGup+l7IAwG1zyUA=;
 b=g8U03ifUn2IxhhuWOyDYvoeE2bIXlpfCM0ogvjM4k9zyRY7H6AmOjcmPvTzYW1VM9s
 EPjo0N17EsqFjzLgC2el+poJhKoYHsXyAWuvjAvguS8z5EuGdM65OrCipr9E7JS7RJvm
 qvkpFXHXUSxEmHdpsp2HVY0c1B5TIoZ6SJKwCX99iScZ0F24IJaieCgvi/F1XBzDjc05
 vd5QB72H3WCPnujxpypklgBF91lz/2VWbfgaG7LgV1UvG9cUHSDWHeCQVC3bW493U1lx
 WuC5f79a0viR6jDjgBX9BztGsVTAMtGsk1c1Gdh2t0c2VpQYGfMcrtgFRwsGwgMK85ps
 s6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788268823; x=1788873623;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ct7+AnY8V0yf+2DAzDh9P0UCIPmmGup+l7IAwG1zyUA=;
 b=B0NsAzUBssya6lxek4J7GIVuRFK3DbzOw5wqKp8aICfcp4TAVHR8ClVFxJPpYAi5P1
 uvsJ6kcSx7nqxOOQG5ZvIUEPVvHiCq/Fgtqv6kXEpBZxsIFRmpfSPFV+rgbhwTMd3yJ+
 F6o+b54E3fTVYo0K0GsPSv4O0P/YySEfY1f4rlYaTqJRteEeVFsMjbrWYcEzVWSfcy0k
 +fkbIsg9+X/2rIChGj1sUquK/sDZULJh+0+KxQdHXEwmsuW37iLNg+DwwHyDuq73H+31
 fi46/NI2K3IIc8YKMfgkqD/Ee34k82pB9aIaIVdX10uZuENNoEkmP3H/VHJOlvEOHBJ2
 4aVA==
X-Forwarded-Encrypted: i=1;
 AKwUvByHIN/enP9EZ9ZtS8/KJEN4HxkIfGhkKb/9DEP39ayMSxIyq3UT47xZML0IaoFIgL1esYdyn90e6g==@nongnu.org
X-Gm-Message-State: AFuF++kLSN5bjVVgR/nPpiPebDNRQaUtrblAYqK9YDlyk0ZN5Tr9fwqs
 0LEdVtph4eFNfCKCxroNRHIcxLydgX3JgS4q7+HerQcgzNdptVE6SfZM3HeBpvQOlk45C4Vw0Yu
 ueYADj5hQcG6CU3L8vaDjvG/gjNmxdBVe2JH8IoZH0g==
X-Gm-Gg: AYBFou08g3/IeZJTN8M6MGlM1at+CdSlwEeDACuqMHYp/5PCujxKmHAMXa98sX6tya3
 uHFsbhGo1cRXHLhOY72EWYgEwyLwbj2qa2x9iY/oLQFDpOVPnVyfoLYzar7JrS9MS2WFOJukM6O
 NCc3wCC5TZ9TDWSsytrY/dAGIEFz1izvjAVlIsCE0KH8qH778V5DTg59FzehsutrMCdgLoO6hpO
 qcE8acXzyfJiafEChthJDiqF6pn75VFBvvxK3l2gHcBwb3d1CEjSX8eEr2SOYuhQ3fSuKEnF+st
 MF50BsrQPInSZKFinBGtLiT6dc0OaNnecBWfYtQdlQloAv9Jixm8RylemioS91l6KXvFXcKq71F
 SeS4L6eIw0fO08CMPpBoWX5a9XndF
X-Received: by 2002:a05:690c:4f89:b0:80d:15a3:7b1c with SMTP id
 00721157ae682-85d68a8ebdamr105327067b3.4.1788268823229; Tue, 01 Sep 2026
 06:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260901082554.804169-1-kraxel@redhat.com>
In-Reply-To: <20260901082554.804169-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Sep 2026 14:20:11 +0100
X-Gm-Features: AcwNN1WIFltK8mA7V5QJnNGttCl8kCJEF3mi0T7-1Lb-yQkejh_hgoNIFvXtGIY
Message-ID: <CAFEAcA_Cc8DmDDw4Ea9EW_Ph_24=YghTXWkty9RmjShxek33xw@mail.gmail.com>
Subject: Re: [PULL 00/13] Firmware 20260901 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, 
 Ani Sinha <anisinha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Tue, 1 Sept 2026 at 09:26, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit d2e570cc0f97b936902a5b1b86b73c0f5998b475:
>
>   Merge tag 'pull-ppc-for-11.2-20260828' of https://gitlab.com/harshpb/qemu into staging (2026-08-28 15:17:04 -0700)
>
> are available in the Git repository at:
>
>   https://gitlab.com/kraxel/qemu.git tags/firmware-20260901-pull-request
>
> for you to fetch changes up to 5ce32f7fdb786014255d4cfff749de307cdfdbfa:
>
>   hw/misc/vmlaunchupdate: do not clear control bits upon fw-cfg select op (2026-09-01 09:25:53 +0200)
>
> ----------------------------------------------------------------
> - edk2: update to 2026-08 stable tag
> - edk2: remove 32-bit platforms (following upstream removal)
> - acpi: test updates for the new edk2 firmware
> - igvm/vmlaunchupdate: fix control bit handling
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.2
for any user-visible changes.

-- PMM

