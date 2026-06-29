Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFA7C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 14:49:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weDIG-0002Gk-87; Mon, 29 Jun 2026 10:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1weDIE-0002GF-I9
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:49:02 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1weDIC-0005Vb-Ul
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:49:02 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-664c4a04081so788897d50.2
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 07:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782744539; cv=none;
 d=google.com; s=arc-20260327;
 b=aq1KyJlWeGFs/ltkpkou3MRUlUzRwgX4mKD+OlGTvfhDOhMTv2ZMu8w+rWAujS9ETo
 LUJ9q27euE2TPtWi7MGqwwTXAs+4TRJXQR+9gNRAK4Ph2MY7TnpdMUEWnG6R5ztl5YZx
 rSdwUKHrruksVWUpvsY3rLsPzn1SfVG0Eq88fhcw4iGhB31dNc4iMf2450+TL05uXPKL
 PQK36VyZuA0VlyaIuzFirWMKEvoedtByBdSZCzeFYcbeMKKr5vcO3L701Q6shz4OAwfa
 4LBqiPnZsnHjDrgR6b49Czs058sj/gpsj13ND1SyhdWeJ/iFtk/WHimvh5ynWTALyay4
 urzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=P4gHZRLMYoVfRXE0W8917mGTZhjFwVe6JasfCV503g8=;
 fh=OmNsHOgwoLZ0Nx43LFdjoFh9LJnAphDzJGmLkLUErfw=;
 b=LHEDPN9vGlZZdVOYaXsEOHlGsyhkW1egoSswWNKHZwuj7A7L7YCViIgW024OlQ52l5
 e8q4e+PWRsdLTht5u+Vmote0tO8KXveT0+PiyVYfyB4SvrqaSpuUVdqgIRoYcr5ff7BL
 WMYFBVwoQ2cdLeVDzLMOdk2G/vIAgr1bnCpOfOWG64L2PIeDwesgG8yJKGkXtAwIwncv
 kbK7Z2tvdMF6kNqQeHxLeLYK4XA5L3FkgZVWJU6K6FJ80IOsPsdgjKCf6sXVvW3MrpT6
 qv+5L76N3Z31YcJ71W8QCsYzcuxUjWIWWMiZwM2rVD5rv/8odIornRJVWzvjxVMdqxpR
 caDA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782744539; x=1783349339; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P4gHZRLMYoVfRXE0W8917mGTZhjFwVe6JasfCV503g8=;
 b=RE1Hz53zOEO8sikV138fjo6dghlU0X7AL+g66XnS/lsHHaIupHN7FknUkxPLOLEK/1
 p3q+D12LSpF5pNp1FB2MQUpMWDYryPlbHK4qHQ+pO9TOL6eqm5FuvT5/LJUCW4AQELzR
 b+WU1APu/a+t8huFK+X+5M6aDM8e0loIgsy/HxH5kpLMKkpZB1URv63CH7V6VlEP2QYI
 ZrdCFiuoI9R8Q/l8EuHHp7xYZVSJYJgQor9//Tze/GzSf0PoUuFKjnPvS5N7w/hXiQLs
 gtOhyQdlL+6nX4TAHufLE9/iwpz8km5sZluuqEjjT/UHtsI1AN+Z5rnQinhPcrU3bORP
 NXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782744539; x=1783349339;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P4gHZRLMYoVfRXE0W8917mGTZhjFwVe6JasfCV503g8=;
 b=Tth1gtAjDKZBbMPz7NGyw7RwkZlMtkPySiRkk5iWhgSH8zzQ28O8vMkfu7rEDgpq7k
 tONboiKIG+JslhgpeIrQzslyg1ZgT/L74uWeHKlJR6mNsSx4YCG/M0OKz4xVO0JBdpiA
 DhTac5wHsN8YnjJh1lWHxGBUPmHbJtPjtpqrx47COPxwmN0PRaNu6tjnLklwOGKs84i+
 pI1gLRUq285LOJMOs/7i9b88ZWTIFPbbH3dxuOb4S9R62mhKbxRJlpCtrDHIlx0svaHW
 Rj+cILzgXN49ADfJbjZTXNJP42FEGkw40vyAEql6XXYCku/Ea7jtflsaxH2i5UsELsLy
 7dnw==
X-Forwarded-Encrypted: i=1;
 AHgh+RraVpnWPdh2Bh2fC0zBpYRG9hCOXFb6JyRF5QmbNYgrD5b5GVvqR0juoS3fQePrtbvfDTiKu9DTyQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw7aLXocr+Lb/NUscyd2eZlQe6ZLuSIZvBoyc7cMelSzUJpGSd8
 NsCg94p7FJRuxi4/gQyxwz9rG144zh4UY54GPYBFDfzpyl9nd20f8MYKtMf0MJWdN40NpzKMmDd
 oobtQ+/zm/mfmEymhSqUTOThAYU/0mjjqoOvCAzVQ6A==
X-Gm-Gg: AfdE7cnLDpgqv5Vpq91x7cKfTAsZyPGXEql/0aB8PEktyKke1RX+wnuwEEgj9jrbYDd
 2odlZgKljPUundBkoWt6QofnSeTu1Rur+AgvFYPRtDGOFE6Ynl7VrzpYQRF7pQJMGway28vicFD
 gpMRWxSn9R6DxTQNs6vM8hZ5OK/n4RyCX7DsEMA7FwaRgzrrH9s8B+Vrv5S/YTa6sNQjBiiDJ03
 xa745uYRy3CbULKans7QFEMzNT7u+06XPmPUKNUBcN4SkwNqtomf2k+0KuTFGA7hg3Xqe/kQtjx
 VTApqfIZoSy9nZmAYAxdqkUlSapPK50UO4ITAkj1Nz9eXtl0dxj9IEo5
X-Received: by 2002:a05:690e:12c2:b0:664:c9f5:37de with SMTP id
 956f58d0204a3-664c9f54c85mr4394801d50.43.1782744539434; Mon, 29 Jun 2026
 07:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260624102830.1355552-1-imammedo@redhat.com>
 <20260624102830.1355552-18-imammedo@redhat.com>
In-Reply-To: <20260624102830.1355552-18-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jun 2026 15:48:48 +0100
X-Gm-Features: AVVi8CeViQkOQyshL8nhzqOJNbXoEA3KY_zPfw092Hdo0gljkwUqhHhoNps0oP0
Message-ID: <CAFEAcA8DzTCP_z9mkHK7QHwMvk8bVb1z7mtN80MsYOZ49ZPx3w@mail.gmail.com>
Subject: Re: [PATCH v3 17/17] sbsa-gwdt: limit compare_value to INT64_MAX
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, eauger@redhat.com, 
 shannon.zhaosl@gmail.com, rad@semihalf.com, leif.lindholm@oss.qualcomm.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Wed, 24 Jun 2026 at 11:29, Igor Mammedov <imammedo@redhat.com> wrote:
>
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
> immediately =E2=80=94 triggering WS0 =3D> WS1 =3D> reboot before the fina=
l
> WCVU write lands.
>
> Clamp WCV to INT64_MAX to avoid timer API overflow.

This bug doesn't exist as described in the current upstream
version of this device, because we don't use WCVU/WCVL in
calculating the timeout (only WORU/WORL, which are forced to
48 bits wide on write). This suggests that either you have
introduced it in this series, in which case it would be better
to not do that, or else that it exists in a different form
in current upstream, in which case it would be better to
fix it first in the patchset, so it can be cc:stable for
backports.

thanks
-- PMM

