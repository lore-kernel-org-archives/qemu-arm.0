Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B13CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 07:51:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEMQR-00007O-7T; Wed, 07 Oct 2026 03:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEGCj-0001QK-J2
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:12:48 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEGCZ-0003kl-0y
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:12:15 -0400
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-5bc18f54abbso2838115e87.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 18:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791335323; x=1791940123; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8BXjIZy8oqNcUmbJ1VvNeAwbWNSakYWSUw60nLCGzDc=;
 b=EP1tWEwzJ4x6wsyvqubT6DVoMHSVK7m8fOpiL1o0m6ZhKZ0w1T52vKSN5DGc39Fkbj
 B/Rpy+DV7lStfe6Dd+Nq8dCK4OGwtnVR1N1qt7adtcalGfPARMupsDJ8PkxrL3nxlJ9R
 IKID7JWW1DTbnOC4V7dSJDZIIYNsb2/eTIDzIDxB7WCIzruFScB0FCuWj/Xj7bDLKvmb
 Gfs0mf8G/4l4UQsoi6HfN2V0rSJw1FAmAQkRpXSHwtXoL1V6BafJrlEDOuuVLzb6r21p
 KOOeqJsUELL2Lg6FSfaErWxoG2LrXXPbSGxkDiJNNNUCZ0G2lM3NfSm6PAVZzUip+R2e
 z5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791335323; x=1791940123;
 h=content-transfer-encoding:content-type:mime-version:message-id
 :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8BXjIZy8oqNcUmbJ1VvNeAwbWNSakYWSUw60nLCGzDc=;
 b=TnNBCPJoRDxgVPv9AlKjWsurbfaPHyAsqv6nXefLd9Goy/+xEPKGqS0Pi/aeZyFH6I
 +cbNpKNo4tX7wEXFualOTHBjh/9nxEHrXPsEy4Ubip3fRAFYEAyoJGNrMeYVAFs6dX4h
 w3BWIMvYqVk/cKywrmeW0dTeANysmcQarxIOIdJBbj/Ny7CcE5v+bIZpKzmVgcwCKpc5
 d7RYQJDQ9LgSU5zR/hINomPNx9MZ3jJ1zKG2AU/G3DXWuZvFY7AaoK7CJ2R0vK9FClCW
 m4qBdCruP2bgnvrS2Y7QljjXak094NOM1KXrJvTPlejKIT6kKo6DV6TQ9t0OvPKGLn5S
 1xbA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwQz33mMXLF4VZuEx1QDrYa7+w4iphyqFzu++vMN6sH/G2VTBKm2thyab4X6VhPizkGFyELP1DUsQ==@nongnu.org
X-Gm-Message-State: AFq9FYKaP/CeRD85S0sBy0uf0dHJZflRYjXPrARjnSXDug5+R/leds5a
 T2M7O5rUVEqKNBIemJt5tdC1Y/PFkdUmh1UTHYV65+Y7q2qBd3QImFGvBE2R1w==
X-Gm-Gg: AYBFou2NSssAzNHrMKXi3btrWPA2qxi80s6K3iXuHXB9ttAf1OVP2z/TJihGpxmGKW6
 n2TF2gxUcZZaz/8GF/nJKitBoSMxJcr2+RVV+rFEU+l93mUphnJpZ4fMGdDUWVn0JIuVmhp1b1U
 pam+fJubOocFlWDin6QapNyqN4aSTIH+Mnv/zF/n4qMCZVzkHZnHNRBbj3/yyNblfwju0gaGCHB
 Z8Tq8PJldGULBd8RNS2LQYQc34yisX65TpWw3RdNyFQbqeISmdbB6SnsuZ3MwoqhfqFiU116Vcd
 ftjk9+RoRyjjhoaWEW+jc7yh/KhsKKCWgwaqq6Qw8Rtd8nGDiRBYYnCZnnos9LYgUeSFOTJ7dIL
 iji2EitrMtiKzTHfEwqMvad8Wa7wd5muPoh+rvRW8+7/vbdSn/J1oqJtKKrWrbkJnHly9Nr55yg
 0/wo2JM9GS/buMPi0Me759uisUQzVvXtpkkZTR9qt09/Yf9tgu5LZcPJvudUWXg6e6rs/T70RK4
 zf3cf+lYvPn2jyhmpGGXhleFvPNP0SEOhmMpZEQItg0lSVvOj7CkyCN9QKYXYZu2914eQ==
X-Received: by 2002:a05:6000:98f:b0:488:7097:3b45 with SMTP id
 ffacd0b85a97d-48c47c8ece9mr15588590f8f.7.1791275850370; 
 Tue, 06 Oct 2026 01:37:30 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (p200300faaf09ae0068a1128771ce262f.dip0.t-ipconnect.de.
 [2003:fa:af09:ae00:68a1:1287:71ce:262f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c63f6434esm8533619f8f.22.2026.10.06.01.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 01:37:29 -0700 (PDT)
Date: Tue, 06 Oct 2026 08:37:23 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
CC: qemu-devel@nongnu.org, Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@oss.qualcomm.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_04/31=5D_hw/watchdog/wd?=
 =?US-ASCII?Q?t=5Fimx2=3A_Remove_redundant_attributes?=
In-Reply-To: <CAEUhbmXuyb_2=JT0GDDPYaU=z0LycFo7GphY8AYD=hzZmEf82g@mail.gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
 <20261005101800.10821-5-shentey@gmail.com>
 <CAEUhbmXuyb_2=JT0GDDPYaU=z0LycFo7GphY8AYD=hzZmEf82g@mail.gmail.com>
Message-ID: <72FFE9B5-7E46-49D5-989D-39D0ED2425FB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.45; envelope-from=shentey@gmail.com;
 helo=mail-lf1-f45.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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



Am 5=2E Oktober 2026 15:01:37 UTC schrieb Bin Meng <bmeng=2Ecn@gmail=2Ecom=
>:
>Hi Bernhard,
>
>On Mon, Oct 5, 2026 at 6:21=E2=80=AFPM Bernhard Beschow <shentey@gmail=2E=
com> wrote:
>>
>> Since WDT and WDE are write one once bits, their values always
>> correspond with their respective locked attributes=2E Thus, the attribu=
tes
>> are redundant=2E Take advantage of this observation to simplify the cod=
e=2E
>>
>> Note that removing the attributes changes the vmstate structure which
>> constitutes a migration break=2E This is allowed since QEMU does not
>> guarantee migration compatibility for i=2EMX devices between feature
>> releases=2E
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>  include/hw/watchdog/wdt_imx2=2Eh |  2 --
>>  hw/watchdog/wdt_imx2=2Ec         | 21 ++++-----------------
>>  2 files changed, 4 insertions(+), 19 deletions(-)
>>
>> diff --git a/include/hw/watchdog/wdt_imx2=2Eh b/include/hw/watchdog/wdt=
_imx2=2Eh
>> index fc01fc46e7=2E=2E0bf2903959 100644
>> --- a/include/hw/watchdog/wdt_imx2=2Eh
>> +++ b/include/hw/watchdog/wdt_imx2=2Eh
>> @@ -84,8 +84,6 @@ struct IMX2WdtState {
>>      uint16_t wmcr;
>>
>>      bool wcr_locked;            /* affects WDZST, WDBG, and WDW */
>> -    bool wcr_wde_locked;        /* affects WDE */
>> -    bool wcr_wdt_locked;        /* affects WDT, cleared on POR */
>>  };
>>
>>  #endif /* WDT_IMX2_H */
>> diff --git a/hw/watchdog/wdt_imx2=2Ec b/hw/watchdog/wdt_imx2=2Ec
>> index a15f452d48=2E=2Ee9cb5819e4 100644
>> --- a/hw/watchdog/wdt_imx2=2Ec
>> +++ b/hw/watchdog/wdt_imx2=2Ec
>> @@ -59,8 +59,6 @@ static void imx2_wdt_reset(DeviceState *dev)
>>
>>      s->wicr_locked =3D false;
>>      s->wcr_locked =3D false;
>> -    s->wcr_wde_locked =3D false;
>> -    s->wcr_wdt_locked =3D false;
>>
>>      s->wcr =3D IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS;
>>      s->wsr =3D 0;
>> @@ -156,24 +154,14 @@ static void imx2_wdt_write(void *opaque, hwaddr a=
ddr,
>>      switch (addr) {
>>      case IMX2_WDT_WCR:
>>          if (s->wcr_locked) {
>> +            /* WDZST, WDBG, and WDW are write-once bits */
>>              value &=3D ~IMX2_WDT_WCR_LOCK_MASK;
>>              value |=3D (s->wcr & IMX2_WDT_WCR_LOCK_MASK);
>>          }
>>          s->wcr_locked =3D true;
>> -        if (s->wcr_wde_locked) {
>> -            value &=3D ~IMX2_WDT_WCR_WDE;
>> -            value |=3D (s->wcr & IMX2_WDT_WCR_WDE);
>> -        } else if (value & IMX2_WDT_WCR_WDE) {
>> -            s->wcr_wde_locked =3D true;
>> -        }
>> -        if (s->wcr_wdt_locked) {
>> -            value &=3D ~IMX2_WDT_WCR_WDT;
>> -            value |=3D (s->wcr & IMX2_WDT_WCR_WDT);
>> -        } else if (value & IMX2_WDT_WCR_WDT) {
>> -            s->wcr_wdt_locked =3D true;
>> -        }
>>
>> -        s->wcr =3D value;
>> +        /* WDT and WDE are write one once bits */
>> +        s->wcr =3D value | (s->wcr & (IMX2_WDT_WCR_WDT | IMX2_WDT_WCR_=
WDE));
>>          if (!(value & IMX2_WDT_WCR_SRS)) {
>>              s->wrsr =3D IMX2_WDT_WRSR_SFTW;
>>          }
>
>In the following codes:
>
>        if (!(value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS)) ||
>            (!(value & IMX2_WDT_WCR_WT) && (value & IMX2_WDT_WCR_WDE))) {
>            watchdog_perform_action();
>        }
>
>Since you removed the part:
>
>        value |=3D (s->wcr & IMX2_WDT_WCR_{WDE,WDT})
>
>now 'value' does not contain the preserved WDE/WDT bits (they are only
>preserved in s->wcr in this patch), the watchdog_perform_action()
>won't be called=2E

Fixed in v4 by preserving the value part=2E Thanks for catching this=2E

Best regards,
Bernhard

>
>> @@ -234,13 +222,12 @@ static const MemoryRegionOps imx2_wdt_ops =3D {
>>
>>  static const VMStateDescription vmstate_imx2_wdt =3D {
>>      =2Ename =3D "imx2=2Ewdt",
>> +    =2Eversion_id =3D 1,
>>      =2Efields =3D (const VMStateField[]) {
>>          VMSTATE_PTIMER(timer, IMX2WdtState),
>>          VMSTATE_PTIMER(itimer, IMX2WdtState),
>>          VMSTATE_BOOL(wicr_locked, IMX2WdtState),
>>          VMSTATE_BOOL(wcr_locked, IMX2WdtState),
>> -        VMSTATE_BOOL(wcr_wde_locked, IMX2WdtState),
>> -        VMSTATE_BOOL(wcr_wdt_locked, IMX2WdtState),
>>          VMSTATE_UINT16(wcr, IMX2WdtState),
>>          VMSTATE_UINT16(wsr, IMX2WdtState),
>>          VMSTATE_UINT16(wrsr, IMX2WdtState),
>
>Regards,
>Bin

