Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp285472njc;
        Thu, 5 Jun 2025 07:24:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXaLI0UYs64aTLgZX81YNAt94J/bI94vLIRlzmCH3BCZCtFIMbw1FxsTt9Bm8Usc+Gtk8Xbh1Myq8CnCA==@linaro.org
X-Google-Smtp-Source: AGHT+IES6rPtIgdxF8qHKwSq5GJ6T0Uqtg5TeGUBDGXPRk+D/p9xo1/B3UXk4Q+3sqYMuhVsnhiX
X-Received: by 2002:a05:620a:4409:b0:7c5:57b1:1fd1 with SMTP id af79cd13be357-7d219909b28mr1346714385a.47.1749133486629;
        Thu, 05 Jun 2025 07:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749133486; cv=none;
        d=google.com; s=arc-20240605;
        b=TMMRg9O4+EMrC3ScpLIP9Qmim5A4ozNr9vNlffpbuQ+2Hx39QE+SMYaCdZliYWr0qV
         oNr1EG/ZRK0T9+SqrZYSS7u6HYLod9+tWAq+YTRiLUAJ7G6RmB54IjDw+tYuuKrfXjH1
         VuaOZ7yaE2R0umw6H8UEv33iKZPU/5aOR05ECM3qBS2dPS9zwxvgixgFM4k2f+DelbJf
         2ofe/zqdYIO8pHDrwP+wEoHROfSYr5+5eVw42Eu+zflFtngj8WVbO7QCEVBmPyfKb1Oo
         cTWiIAbLyI7t7uJbCJo70kXTAPjvfmnCy4unQUdLghCnVYt0abd75FS2bVJGhzxGefOr
         Rwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=f855TIziVmCXvNE138r+Ybnl0nkQZNKWUJYDAoHnybs=;
        fh=eDqwk9IZwo1H4BTBs/dD9uB3Hr51SEmK03UWuti1p7g=;
        b=M2tSXW3w3l1tC0Oty9UOddAgjN/irYN8W8dA4Oih0pUfuF3JnL0EHCz7k38pOaF2U/
         j9XvfEUcEBK8rzqy8HPvLxLFI749wB4fSTOHpj4O+C/nZep3XhI3z1iyrg9ua1XkqGuP
         DwsoNAaWEFCTxpFgA80qvhVIUdzMcEr6teJ6QbQSyoZYc1P8832gYF5TsZTUsTKNpIXU
         BY3qd3cU0FreIlT8h/rEQN3nmKy9B3SQtJkQwpuic77dfKHk921DhnaPGkJWEMCMfyJu
         N3Jk3qpsZ3bP0i4pOEKG2b0Krj56VZ1c77Y89XD2aezOP/clmDhMEnCB8t6ZEa6mWeMF
         xgdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c4xxrA6f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d0a52b7c3esi1523674485a.192.2025.06.05.07.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 07:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c4xxrA6f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNBW8-00005d-A7; Thu, 05 Jun 2025 10:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uNBW2-0008VL-4X
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 10:24:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uNBVz-0001sl-0t
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 10:24:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749133456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f855TIziVmCXvNE138r+Ybnl0nkQZNKWUJYDAoHnybs=;
 b=c4xxrA6fp4M9LURaPCZMcNslfR5L1L7caqqq8JQgBoB3Em54w4pCFlLlZI8Ptk1LfFcxw8
 GbhyTrHRh3XYvufff8BZhoPySx+zDvL6bXvbi91ytB+ruaZVx8ZVdHX0U3dXhgjkLYP1Uv
 WmapMtIBs3KsEmQVF5Qp9q9pXXHUiwQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-Iw8MkvikNlmqtLWRpwFqZQ-1; Thu, 05 Jun 2025 10:24:15 -0400
X-MC-Unique: Iw8MkvikNlmqtLWRpwFqZQ-1
X-Mimecast-MFC-AGG-ID: Iw8MkvikNlmqtLWRpwFqZQ_1749133454
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-450787c8626so5834545e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 07:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749133454; x=1749738254;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f855TIziVmCXvNE138r+Ybnl0nkQZNKWUJYDAoHnybs=;
 b=f8KOtdUIARHLdAEHri13Lrgp/bgaBoOTlhYRuXz6s3IqOXBOx30CyrIH28baSmItLZ
 ze/jk8cueHzZBI5aVneip3zoHR9VUF4UBt8wPWkLI/stPmDNvjFriReK6jBAYsPHlLXI
 hr6e7PFX7GtYT52NXe3DqgJvKvitwblez+SNDtv/cHtRLBPpAvzwQBkX9JiX94KSPiYQ
 1OhIb89pIcNOYbH/mErfE9qO/mFM0oWufMdgVoc85fAB/50BqDSxEJZXjYxCt5kWkCUg
 kg55ekv5liXd5cU2crg4Zo/aESXoXBniDrcjXeKDTfikxa4nEQLUtZ7B7x6qTsoFW7om
 2C/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWihk9JOitSmP1fJPJWB6zgxubHoB2QOBSyz7b+CpbAq2tq/SeRjY0DtBdB9pSnIxXvzCH+hgl0Ew==@nongnu.org
X-Gm-Message-State: AOJu0Yzxfx6sd2YRkhYlnXjn4acoVD2EUTyOCEcPaCEENoksavtWdk6w
 qJHi3Hw9wASBthF7CAChXgkom7n8VmCgNKoljKyjK8Jr/wkeu7euc1km17tq/HqY18Mw6WwzdxS
 dC7i9cWJR2IZx7rFLAEfIE4dCG39JEGNy+R1U3HvNFPQNQZ2G/fjEoA==
X-Gm-Gg: ASbGncu83FbevMPhEcqezqtVudbYxI2l0jDMdpPBIyPpCs4sKpasHejfhl4mw7OQW9I
 ypNhQDHSAXcN3L8E62evpDDXdW6G25ee1ZIln3vXwKDuY9efB6DdgTvwVdHiyV9jA7OoAovuOm0
 /kRp0nCwUozLeE3W85W27UfWVo+1JTEnn1OtE0+5mrphP78Yqe1XWtVTEEfUg5ffxN8jFrkFFTX
 NuaCbiCxagGCH3XtFX+2CvItX4sMlXCzrYCy+zQ0afhzYVRGVkJWRewzo+Si7v4OzTYYMv3qQ1v
 81WKWEFJt4ZFZmUIlpZp3yV9V5/Rg45FP0sSozWWsh0IVdTJg5wrRxBSKi6wYOqqHPM4ye6eR7u
 9oh0tYhGXpZy7iwkQrsH6zJwzHM9MRRoBWis=
X-Received: by 2002:a5d:5f46:0:b0:3a4:eef9:818a with SMTP id
 ffacd0b85a97d-3a51d966588mr6199882f8f.27.1749133453588; 
 Thu, 05 Jun 2025 07:24:13 -0700 (PDT)
X-Received: by 2002:a5d:5f46:0:b0:3a4:eef9:818a with SMTP id
 ffacd0b85a97d-3a51d966588mr6199855f8f.27.1749133453195; 
 Thu, 05 Jun 2025 07:24:13 -0700 (PDT)
Received: from ?IPV6:2a01:cb01:54:3894:a12c:7ed9:4ede:d4f5?
 (2a01cb0100543894a12c7ed94eded4f5.ipv6.abo.wanadoo.fr.
 [2a01:cb01:54:3894:a12c:7ed9:4ede:d4f5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5247363a9sm3566830f8f.24.2025.06.05.07.24.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 07:24:12 -0700 (PDT)
Message-ID: <2030db73-4f1e-46ed-98ea-c469e8b0ecea@redhat.com>
Date: Thu, 5 Jun 2025 16:24:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ramfb: Add property to control if load the romfile
To: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org,
 Eric Auger <eauger@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
References: <20250605030351.2056571-1-shahuang@redhat.com>
 <746b078e-bd06-4361-aec7-2301412abb18@linaro.org>
 <kep5frpl24d74evoyf367pqkyoj6xez2pirk7xlzcoompyzq4c@ouxab77sdm55>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <kep5frpl24d74evoyf367pqkyoj6xez2pirk7xlzcoompyzq4c@ouxab77sdm55>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TT-wTboiUCO-T-nUEtlJF7DWcKgxUzvIYmg247MvL7Y_1749133454
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 0qKlnbCUHHwv

On 6/5/25 14:21, Gerd Hoffmann wrote:
>    Hi,
> 
>>> Now the ramfb will load the vgabios-ramfb.bin unconditionally, but only
>>> the x86 need the vgabios-ramfb.bin, this can cause that when use the
>>> release package on arm64 it can't find the vgabios-ramfb.bin.
> 
>> Simpler to directly pass the ROM path instead of using a boolean,
>> so board (or CLI) could pass path to non-x86 rom.
> 
> The rom is loaded into a fw_cfg file which only seabios will look at.
> So this rom logic is x86-specific.
> 
> edk2 ships an EFI driver for ramfb, that is how ramfb is used on !x86
> platforms today, and I don't expect that to change.

Should we also set the vfio-pci::ramfb-romfile property to false in
a compat property for ARM machines then ? I don't know for RISC-V and
PPC.


C.
  
> IMHO a bool is perfectly fine here, I don't think we will ever need the
> flexibility to specify some other rom here.
> > take care,
>    Gerd
> 

