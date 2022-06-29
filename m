Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp658305lft;
        Wed, 29 Jun 2022 11:10:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0pAhwJzp8jr0DCCUIBfbVR/P1N6d4h2PdN5jNKs46/75eHvv7Abg8rraHwYgDgwPZuRav
X-Received: by 2002:ac8:5c4d:0:b0:31b:f483:b037 with SMTP id j13-20020ac85c4d000000b0031bf483b037mr3687278qtj.369.1656526224224;
        Wed, 29 Jun 2022 11:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656526224; cv=none;
        d=google.com; s=arc-20160816;
        b=ZfhKtLD66/rivOI2EoYT8O041VhaldNypm0TT+SaWv/8xoJNvrfiV6+dfO821mVyzP
         qQ8s6rEPD16acFM+T6MTxsrepExxSju/NBcUonplF0WdPZRA1tXp/V8uYSAoGORy8Cw2
         xRBuj/yczt7pUB0uimfHOgRzt6WUzWifziHsqogqQnRZ/KaciNsu8/guojty2OgPrSYD
         ZRa004WpEIODDk0lYV7f9LAW7iMSIjYT7VHfUXwUeZmzvw1yU1iUey45QhHy7hmIitqO
         7EkXM6Ck0H+18IKj3uKPnm/t3t1ltlLsdCMFFg+MPsGSRMcyeq0XaeU/kZyI8nQX82tA
         6gWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VqL2SSISmLC6MSNmGMutDx/c4KpgiuLq7OyqEtX96FU=;
        b=f843atQ8HDnsZ0AkCkOXFL+EzNg9Yo3fFBoF62PRaf71Y51H96wWjtA9A4Gg1kxgvZ
         VXUo9CAEZ9SVHy++yNMMgxSiN/1Co9liF8NN3viO/zOJIXRwqOPHyFIFHiUmbem3Dlm5
         vkEDZU36pf9Jsrkz/LIO8WFaTNBCI+Qv8HpgDnJ2VJq0Q3bt9Munk88pMwBkCEzbyOta
         iXtRl4HKvGoT1RqzpFjsVbr5m/ynfGq0ssKGibUuJ4kskvG5AcwY8eyEqF9cjQdzKhs5
         aym4opEqPhAznrj7gnOp+OTMKoi/3PNXqZOXEJfWEexRs0iTEu7Fw6/8KhO2LSwwOxzK
         DhUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PCmvRWDJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r15-20020a0562140c8f00b004727d025d2esi943377qvr.229.2022.06.29.11.10.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 11:10:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=PCmvRWDJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6c8t-00078O-Gh
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 14:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6c4R-0004Rk-Tn
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 14:05:48 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1o6c4Q-00045f-CB
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 14:05:47 -0400
Received: by mail-ed1-x535.google.com with SMTP id c65so23318494edf.4
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 11:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VqL2SSISmLC6MSNmGMutDx/c4KpgiuLq7OyqEtX96FU=;
 b=PCmvRWDJ3PGJ6zT0U6eNuL4YWT0IhL23357vI1arPpi74WlzhpqF+/aw+2LEUDlVsC
 QV3H4bYAZNaJeK1MDaoa/eURqgOzD3qUiAROsWvVRSXoCHk+/qHyC34JuNt98I18ikwB
 TipUjx7Q6i09U9lDhLNvMJk50u7hcROR1DRqUFpelBuc0BqiQEHBKQS1mAU4viqZisbH
 6CA5UIh1oGbHh3NTAtQIeSMgS/intVA+XBtZtLmaJc9czOx2nKROwEV7+yCCVQVqn8Sx
 B5fbhAwhqQKrx7+rVFOxrECr1qgbLf/yoAL4sxpOEYrOs3WriEWRt3CFYNziovnUw11h
 J3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VqL2SSISmLC6MSNmGMutDx/c4KpgiuLq7OyqEtX96FU=;
 b=wTsmy69GHRXNFflZKcYrU2YxDYXZP/g/VOHjlOCWLDWImYCl44Af4Ae3XqkXAVRoDw
 Npi0cnjNKLuJbOfZi74lAD7Z9Bv8IuKYv4BrOHFiE3XVZO+ZaB9PtojTFJB86KuOLaU9
 cS1Rj+zq2MRaFRoCHKNlMlmBTj9fzlpjDgTdj+TcTK9YKbRnuAd4Sh1+3L/YtsQHAFt6
 L1I34UyziC6Cm5kffvI07n24PONsXyxm3LB+mPHuWKxczhbjltemRJJN2/5VCzBQtJwe
 7lMpAsOC+5B3i83zhIZ86DnBeGg9CcEJY89q3CrllnUZR+B8OQwirLjLwbxuIOxAFQQk
 cSjA==
X-Gm-Message-State: AJIora+uNweX5MVPpz8tfD7NRaIpW3enJ3RdoWa74oGoSKH7ZQZ1FPpy
 zf0htTvOFSQ9pbM8BCAZCBlOqWN2s50vfft1vL3hVA==
X-Received: by 2002:a05:6402:c48:b0:437:d938:9691 with SMTP id
 cs8-20020a0564020c4800b00437d9389691mr5037647edb.254.1656525944899; Wed, 29
 Jun 2022 11:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-9-pdel@fb.com>
In-Reply-To: <20220629033634.3850922-9-pdel@fb.com>
From: Titus Rwantare <titusr@google.com>
Date: Wed, 29 Jun 2022 11:05:08 -0700
Message-ID: <CAMvPwGqWr2yj6nZAnFn_pXnH+dNRHtJ_qTsaJQv_OqR5sgf3yA@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] hw/i2c/pmbus: Reset out buf after switching pages
To: Peter Delevoryas <peterdelevoryas@gmail.com>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 cminyard@mvista.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 zhdaniel@fb.com, pdel@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=titusr@google.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xWisSs2r4jq3

On Tue, 28 Jun 2022 at 20:36, Peter Delevoryas
<peterdelevoryas@gmail.com> wrote:
>
> When a pmbus device switches pages, it should clears its output buffer so
> that the next transaction doesn't emit data from the previous page.
>
> Fixes: 3746d5c15e70570b ("hw/i2c: add support for PMBus=E2=80=9D)
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  hw/i2c/pmbus_device.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
> index 62885fa6a1..efddc36fd9 100644
> --- a/hw/i2c/pmbus_device.c
> +++ b/hw/i2c/pmbus_device.c
> @@ -1088,6 +1088,7 @@ static int pmbus_write_data(SMBusDevice *smd, uint8=
_t *buf, uint8_t len)
>
>      if (pmdev->code =3D=3D PMBUS_PAGE) {
>          pmdev->page =3D pmbus_receive8(pmdev);
> +        pmdev->out_buf_len =3D 0;
>          return 0;
>      }
>

I suspect you were running into this because ic_device_id was putting
too much data in the output buffer. Still, I wouldn't want the buffer
cleared if the page hasn't changed. Some drivers write the same page
before every read.

Titus
