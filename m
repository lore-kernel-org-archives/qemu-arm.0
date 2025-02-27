Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp101309njb;
        Thu, 27 Feb 2025 01:30:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXq6AHZiQo8Dg0i5u18IHvVL1VaX5KeMvl1qg3NHbF9mG39RMShfXhU6Eg0CY9BszTXWj9XUL/4BjTGvw==@linaro.org
X-Google-Smtp-Source: AGHT+IHDR/DbH/Gwy8Nkf4FzUTuWRPuPikjalx3WAAM0/i5/gJImT8eecgvq1Kob4ydLX9ZN+wxe
X-Received: by 2002:a05:600c:1f88:b0:439:8634:9909 with SMTP id 5b1f17b1804b1-43afe1c653bmr20329115e9.14.1740648626297;
        Thu, 27 Feb 2025 01:30:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740648626; cv=none;
        d=google.com; s=arc-20240605;
        b=TdHubVsw6udHthpVpbLjrmTnYckkEQTvFDM1fa9RQk8cf3xwIHF/2wWstqjgXo257h
         n4lOKfyPztoIVkwXfQtbKh3WHrreMbi7cfZ1AdbHGTSXKOM7YZWOucsvq2xtW+Yo1C1r
         RwmPpyJCf6WISyteYcR5RJdVm3ji9Ao0P8a5se4PomfqPVy3GfH+o1qcNHMh6071SLnZ
         GqLW1NNHzdReSXrCfwYHiBxrqazorgyrtPNUXCBxWOY1SJ12Xp4QeWCD9K93Li8rYmyr
         4/R76lQeOCAYqN+7t5xen8cSOfheIR57N7628TlzItRBxROYPVs3Ro+PZUJlMTyWda2b
         KnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=raIYiEPuGiYqjD46w792wKkpGz1hDfYlOhQ4dTAAGL8=;
        fh=lssByKBods44ZjXvCKwYpe3YLr5aTcDhMCP8JZFpMnM=;
        b=ZRDRnTyIIlRJM0uXo3GaAB8X6iEjnKKWKkpntt2hDvUmR9EFdkGxgKtUKCglWsC0T6
         e7Q+HU1ojvQH8jCiO1JahvFvChR/22xf3Pp2CI6OmfrDT5n5AM9gPw2TB6cyyYi/Buuy
         oE/MMFSjgszQo/ODzwMXAlrjwxoDApBffoqcim80LA9mMeId2jA0HPC9avENhRyrwbdI
         e6+YW2mx1w6+zfXGf6Q+g8sE0Obm8BdUR1tXuMbmtD3wD9zzj7+7BL/Kyc5/TGQ5XncQ
         CN4WAiLiWiSsZqAE0hH0K0AIASQW7hji+nra0HUJexLvRpF/XECKQ6ufHfXlNBFvzQTg
         tfBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P6t+heqj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-390e483b4d9si713204f8f.620.2025.02.27.01.30.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 01:30:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P6t+heqj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tnaDZ-00074x-1z; Thu, 27 Feb 2025 04:30:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tnaDW-00073P-VJ
 for qemu-devel@nongnu.org; Thu, 27 Feb 2025 04:30:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tnaDV-00087o-9A
 for qemu-devel@nongnu.org; Thu, 27 Feb 2025 04:30:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740648604;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raIYiEPuGiYqjD46w792wKkpGz1hDfYlOhQ4dTAAGL8=;
 b=P6t+heqj4kQ4N4WooBTSviUJUwWVUt1HguUrQ5pLksIK0OYn2iHp7U8hq4CBRIdpp1/tTy
 +lM+EQB1koS8zASIfHUunEgaywSnUq/+FnxukSooChxYUXca6L8qnBPPBQ5ww4DSb7UvNW
 onFNWGo7IZKxgd57DVyd8UJQtGtkJFY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-CH_7ROilPieHOui9Hk_EvA-1; Thu, 27 Feb 2025 04:30:02 -0500
X-MC-Unique: CH_7ROilPieHOui9Hk_EvA-1
X-Mimecast-MFC-AGG-ID: CH_7ROilPieHOui9Hk_EvA_1740648601
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38f628ff78eso377802f8f.1
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2025 01:30:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740648601; x=1741253401;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=raIYiEPuGiYqjD46w792wKkpGz1hDfYlOhQ4dTAAGL8=;
 b=NlvUS5FhcSoLP8nWo1VFMDNLcgYKS2o2Votp1QyLXzPUdEuWgbxTLBSL8YJByc7869
 RaPF6fDfuAQTnB4cE+yZrJ8UKpNBqpZAWpCjs2imNfFe8Y4LQOsuJ6il3lj5B3JT7WOf
 fHf2k2/H45zjaxRQXlwd/qeWsb3lFUI1ET9danM3PbOin2SPelyo89NMbXNUFeANj6eP
 HNArDcmRfCgZPS6IT4NEMlGg45ULOQDBzpJrKTQ4m8NKZJdtrlfCJELwoKydMsQGzry2
 jcRLDMtNDH5bHjy7NLXqVLuuNnVhuEsbspf4VniuS5ffFUdhc1ETzgwvMkmSzu+LLICp
 itIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVns9rlwKZbtbrkKsYlsYW51dW+CmkxjFOEvOCFt9WaFlTjSnInDfiOxiSZEzsV4iUMPKfO/orMNDGw@nongnu.org
X-Gm-Message-State: AOJu0YyihiolpZXbKI0UhJCxCxzkC2xKB0sSKg0E9rOEEfQ4J//VJMul
 jQt9ZLN1CQR6IGfnGRtsZEGHjheq5mK/fWsOsTCFYk03F+jC/X4buTPP/a2xQl0Eax3RvdfgYwQ
 lAtzRTKMKj4ybPgOdWOI9QU8gxvbTvyXRCszsicyZPTdfvjWRn/++
X-Gm-Gg: ASbGncviONE5IOKxZ01Ck4srmUUC+oiTebVuTEAfP5WX0XWc3ykkCimSCaAVe5Bufrc
 IinSB5HFrxmX5U32BU5oiUwQumvvXDC/Rm/U9vkoi/GPEXe3M+ZxOl7ZxnzhAdUPI/Cu4onovxN
 wvCkfYKjrKMbFmcAI49oF5PXJ2OB206/j7kpY8DJ0AFwh7t0KrO1mSPjoW4Bxkfmre+D3m70WyN
 cZajXKsnjbe5Kv9b6Kzrpef9IhVnjod0NW1EFkHE8ckm9CbOo3Dt/Wt5vf2JE85RbTklOiDtj+A
 KIdCDoryvrxUZWxnK9/QLe4taxyoYwsVkCifxdMZY7DAab1u+vqtOhCS38BVQck=
X-Received: by 2002:a05:6000:2cd:b0:386:374b:e8bc with SMTP id
 ffacd0b85a97d-390e169bd84mr1868110f8f.15.1740648601390; 
 Thu, 27 Feb 2025 01:30:01 -0800 (PST)
X-Received: by 2002:a05:6000:2cd:b0:386:374b:e8bc with SMTP id
 ffacd0b85a97d-390e169bd84mr1868088f8f.15.1740648601079; 
 Thu, 27 Feb 2025 01:30:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a7850sm1450325f8f.39.2025.02.27.01.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 01:30:00 -0800 (PST)
Message-ID: <9863d34f-3244-4d07-996f-c91db5a17ffc@redhat.com>
Date: Thu, 27 Feb 2025 10:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/smmu-common: Remove the repeated ttb field
Content-Language: en-US
To: JianChunfu <jansef.jian@hj-micro.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20250221031034.69822-1-jansef.jian@hj-micro.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250221031034.69822-1-jansef.jian@hj-micro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IIb6snvcTwrK

Hi,
On 2/21/25 4:10 AM, JianChunfu wrote:
> SMMUTransCfg->ttb is never used in QEMU, TT base address
> can be accessed by SMMUTransCfg->tt[i]->ttb.
>
> Signed-off-by: JianChunfu <jansef.jian@hj-micro.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric
> ---
>  include/hw/arm/smmu-common.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index d1a4a6455..e5ad55bba 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -110,7 +110,6 @@ typedef struct SMMUTransCfg {
>      /* Used by stage-1 only. */
>      bool aa64;                 /* arch64 or aarch32 translation table */
>      bool record_faults;        /* record fault events */
> -    uint64_t ttb;              /* TT base address */
>      uint8_t oas;               /* output address width */
>      uint8_t tbi;               /* Top Byte Ignore */
>      int asid;

