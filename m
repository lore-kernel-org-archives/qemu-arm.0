Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3123EC049D
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 10:16:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxMno-0004Ct-DM; Tue, 03 Mar 2026 05:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxMnc-00045r-2w
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:16:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vxMna-0006Kt-Fi
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 05:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772532977;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LhfgwhKIlrFIwqZgBTO3bYXe4UGT0duzo5QG+oB9JVE=;
 b=YEhevpasbWmegYXdUYonUiqJzd1oFPCpiffElDXQVoZwEZ14eCSXrxv30q1fA/EWcOCQWA
 7BR/omx2cCvPhjKOQLvsW3jd2IaseZL/TMzKWVRmYCGIZlc31Hun/3JZPwegGG/iur+GLi
 XkthYgjlFf2/cTY9S98exUQKwkHhRtI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-JQ1x-zYoOHWdkukPBolbdQ-1; Tue, 03 Mar 2026 05:16:16 -0500
X-MC-Unique: JQ1x-zYoOHWdkukPBolbdQ-1
X-Mimecast-MFC-AGG-ID: JQ1x-zYoOHWdkukPBolbdQ_1772532975
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-439ae2cba40so1984156f8f.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 02:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772532975; x=1773137775;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LhfgwhKIlrFIwqZgBTO3bYXe4UGT0duzo5QG+oB9JVE=;
 b=Zp8tPDVKQOf4LmI911071z/fgWI+yBVLApG6Z363+HBx/s7xy/W5HeB87b1yj3djVL
 N9NTmklRSOB6q5m7yKBrug9bhc2Zo3B9UOaV0Vr+XMaXsyNgAjR/LqViuZf+9pNxhsU5
 8phAYZEROjmmPY5gSpIq7njd6keOijuqC/kJnxVjgOYDX0pGIadjNLdtEkp8iq9vgoRN
 gMMHzbo59EY2rwXHYPc9WbLiPcZhK5VgVW+8Qs8jkiyyheWd2a0gGwPdEhVzwrhy0Z8t
 g7B6a19Vp2U/UC/H3wzpKIY0Pkr9WRnYi8VvgWBIjBpDYlQTYtkGBc/EPIzVEFdMc72R
 2aow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR6xgG5Cd+wM6Kb4UGbWtMptCU9NWLIRE+UMAJrjkQ+J2Hhn4/mNRtQoY1IDywjf/TIKDWmq6pTQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy9SGkjm9jy7SkTYJuzodcTpC+8dE+U7qvsRPoJZkOZOtSJDnX2
 JR8+aK16QUZTpmqRkQAbegU1e/vktjQoxnI9qaPTWUhO7THPpO0zzKLpQJ7oGbEBktsGXvyuwMA
 Sd63ZkHe06aLdDpmrB+BvYWdufH6a+VfFG8Ji231RMSmPuTOvWvJ59A==
X-Gm-Gg: ATEYQzx0bol3XjPCNikpIvZHAPkGdA1OQ7AVje3O47sXlfkokIqWQnTyjxM3hxM9Veo
 6kdEPwwh2AmKH3Zrh4zAeViN5w0cP4kGs21U53+j1aFBdj9EogxiO0T59F5NiWPXKuauJHQ4cTr
 +oPoM9gvPISbA+SO8o77EOYJmMoCf+ebLubbCw+4F9Ey8F1PQxIDQJ217PyEwwXzn7mS6s+7Yv3
 VsuOZsi70AYAH74w9nLjoAo2O4f9NqRIqIQIJ98mgn3NYQWFtmUjVBkILsF6iZwapx4LskBAsmT
 jm+T0CougXZvIzDQqd1Y0KZNMDpU2z9VBOXOg5U1hop3o9LG7F6t/EpeQM7Efe7zAwQALdsSQQH
 P1o2Wamla3T743LsgcEqOyIZfiQTs+Ns7qNWT+2boSc+sJonvhrj3ZSBVbg5aSwErAHvVCQ==
X-Received: by 2002:a05:6000:2c0b:b0:439:b1d8:6091 with SMTP id
 ffacd0b85a97d-439b1d86191mr15957013f8f.1.1772532975044; 
 Tue, 03 Mar 2026 02:16:15 -0800 (PST)
X-Received: by 2002:a05:6000:2c0b:b0:439:b1d8:6091 with SMTP id
 ffacd0b85a97d-439b1d86191mr15956964f8f.1.1772532974547; 
 Tue, 03 Mar 2026 02:16:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b130abfasm18575905f8f.34.2026.03.03.02.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 02:16:13 -0800 (PST)
Message-ID: <3c4cf0be-3064-4308-aa5b-e2f49c2728ed@redhat.com>
Date: Tue, 3 Mar 2026 11:16:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 18/31] hw/arm/smmuv3: Make evtq producer use SEC_SID
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mostafa Saleh <smostafa@google.com>, Chao Liu <chao.liu.zevorn@gmail.com>
References: <20260221100250.2976287-1-tangtao1634@phytium.com.cn>
 <20260221101723.2994751-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260221101723.2994751-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q1bSAmTMVLgZ0whWKA9_L8z-ovFfuCLoCWCc2Wk_Pqw_1772532975
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.968, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.495,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 2/21/26 11:17 AM, Tao Tang wrote:
> The event queue producer path wrote entries through address_space_memory
> with MEMTXATTRS_UNSPECIFIED, so produced entries did not use the
> sec_sid-selected DMA context.
>
> Pass AddressSpace and MemTxAttrs to queue_write() from sec_sid, and
> assert that the selected AddressSpace exists before producing entries.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index b2559e80f24..fa09099a09a 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -128,7 +128,8 @@ static inline MemTxResult queue_read(SMMUQueue *q, Cmd *cmd,
>      return ret;
>  }
>  
> -static MemTxResult queue_write(SMMUQueue *q, Evt *evt_in)
> +static MemTxResult queue_write(SMMUQueue *q, Evt *evt_in,
> +                               AddressSpace *as, MemTxAttrs attrs)
>  {
>      dma_addr_t addr = Q_PROD_ENTRY(q);
>      MemTxResult ret;
> @@ -138,8 +139,7 @@ static MemTxResult queue_write(SMMUQueue *q, Evt *evt_in)
>      for (i = 0; i < ARRAY_SIZE(evt.word); i++) {
>          cpu_to_le32s(&evt.word[i]);
>      }
> -    ret = dma_memory_write(&address_space_memory, addr, &evt, sizeof(Evt),
> -                           MEMTXATTRS_UNSPECIFIED);
> +    ret = dma_memory_write(as, addr, &evt, sizeof(Evt), attrs);
>      if (ret != MEMTX_OK) {
>          return ret;
>      }
> @@ -154,6 +154,11 @@ static MemTxResult smmuv3_write_eventq(SMMUv3State *s, SMMUSecSID sec_sid,
>      SMMUv3RegBank *bank = smmuv3_bank(s, sec_sid);
>      SMMUQueue *q = &bank->eventq;
>      MemTxResult r;
> +    SMMUState *bs = ARM_SMMU(s);
> +    MemTxAttrs txattrs = smmu_get_txattrs(sec_sid);
> +    AddressSpace *as = smmu_get_address_space(bs, sec_sid);
> +    /* Secure AddressSpace must be available, assert if not. */
> +    g_assert(as);
same, would get rid of that check and move it at lower level.
>  
>      if (!smmuv3_eventq_enabled(s, sec_sid)) {
>          return MEMTX_ERROR;
> @@ -163,7 +168,7 @@ static MemTxResult smmuv3_write_eventq(SMMUv3State *s, SMMUSecSID sec_sid,
>          return MEMTX_ERROR;
>      }
>  
> -    r = queue_write(q, evt);
> +    r = queue_write(q, evt, as, txattrs);
>      if (r != MEMTX_OK) {
>          return r;
>      }

Besides,
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Eric


