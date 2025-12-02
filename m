Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025D4D1170E
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Dec 2025 16:36:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQTMV-0006pw-Qp; Tue, 02 Dec 2025 11:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vQTMU-0006ow-3w
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 11:36:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vQTMR-0007VW-AD
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 11:36:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764693378;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iWFCPVK34q9qvoDCrpvi/7OctcBRYtz25HrbFC+7+j8=;
 b=BQmaJcGYP4IgU0Q0s6FyNmBXd8T2IIpF8q+2jPNlcA6mnXIX55S/2elvwEzmENU2jXlIfs
 wstBGZx/Sat7yZUesq1ylj5BH5YJsFAUiKzoH0vdzWkmG7CuIvaI4eObIjC0vLh+/Xk0sM
 NyLPhdwwMy+4ay8fPs8QzksNESna8Vc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-27ryPqVJMzmoWkUlBrpb1A-1; Tue, 02 Dec 2025 11:36:17 -0500
X-MC-Unique: 27ryPqVJMzmoWkUlBrpb1A-1
X-Mimecast-MFC-AGG-ID: 27ryPqVJMzmoWkUlBrpb1A_1764693376
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88238449415so186260236d6.2
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 08:36:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764693376; x=1765298176;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iWFCPVK34q9qvoDCrpvi/7OctcBRYtz25HrbFC+7+j8=;
 b=NepqnikeEkf5vo2R7DvrTqGq9EGDfGO+xiHihBh8oQHhXNwn9JQddwpSu3NE9kmYMq
 OXM4ifdXjDFey+yHyPdlFw99JN+yenZ92Q82130oAYpXzxaG1w8JU2Aaqz61S+xPeKs3
 D84Tpy3XO/aRHpY1uRqRwXH5QfLppREvvDlPGrxgCZ5cGrJWm/V87G/AvPsK73vvqSVG
 aQn/qpODLrc6AXhlb/ie4tq4Hr+Y9XR1xF8qFxv6mFn0fsF93YLX7Q0G7mi+PjKQfKGy
 gyTmuYPVKf4oGImYkAyK/T7R++z4HtNyJdotBV4esjIQki/4er//x5upTqyVu6Fflugo
 9hrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9YhFFuenHC1yZdBzqb+h1Rrl9/AW7C3lNSbZNVsiJe8v5k6Q9sKOM3hHZlh2FPu3BQQ5ovC6gmw==@nongnu.org
X-Gm-Message-State: AOJu0YzAfsiHJPoVIOT+sXXVqvt+Y9p/gShmewjCMoj1Zo42wNtQ1nyF
 CoEm1m9ni/pW9//jFRVQvnU3ruJRUZH3Nb0Gry8uKwmGc5Y1SzbNWzKQ4vNC8CyVff/oSC1+CWC
 QWObAAWkPNZRwLGur7rGdsaL51HpeNeXwQ2rmleeXj2y2SBUbf2Cztg==
X-Gm-Gg: ASbGncuCzf4dPJL/bzk5GdaIupUTkUmZx6iYRpdLS6LozbbWoakdbutXehpBDM+szez
 B2/mAHII7Zc5PDxjuvGbd2l5octDBxqDYeps9KJal6dGwCO+EXxibbOAM7BsxcB3ZEjVsGo6NYC
 jQiFLMPhDuISUPAplXvgc+nDB5stThvKbH8IlXSmeRsne7Q/6fPa6jTHnoi9aNvkGcQwGE0Ukg5
 ciQbdV+kUrUj/ndd0y28bffv/71Zbu4bT2sHws1Eoo/8JcDswx3M7/IKGZ01q9A1FP9Hy7OkKsw
 L6ahu3r3cBcobC733zHjE/br4jJPiaeQXpytN12qJeZQBgO15Rrs1bzsPd9sAb5C/tmzQ6q8mxI
 sqPnIo9gs5KI3BvHy78NpafX8DuWY/ZlqWinucvEWLfgOM/9OqNWzAc04rw==
X-Received: by 2002:a05:6214:e6c:b0:880:4c2f:5075 with SMTP id
 6a1803df08f44-8847c5365e7mr686073336d6.56.1764693375327; 
 Tue, 02 Dec 2025 08:36:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE//GRtdwiqihoAZ0nOj6FQDYAgxNEU0uDbno4BsJ1nxfqYyCQV/nmuYLrnlEnLCKAvJyz1wg==
X-Received: by 2002:a05:6214:e6c:b0:880:4c2f:5075 with SMTP id
 6a1803df08f44-8847c5365e7mr686072926d6.56.1764693374985; 
 Tue, 02 Dec 2025 08:36:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:fa3:e4b0:95dc:ab11:92db:6f9e?
 ([2a01:e0a:fa3:e4b0:95dc:ab11:92db:6f9e])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88652b493f3sm106872176d6.31.2025.12.02.08.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Dec 2025 08:36:14 -0800 (PST)
Message-ID: <a63b3689-ef46-48b1-ae28-34976ab34d0b@redhat.com>
Date: Tue, 2 Dec 2025 17:36:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 20/21] hw/arm/smmuv3: Initialize the secure register bank
To: Tao Tang <tangtao1634@phytium.com.cn>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
References: <20251012150701.4127034-1-tangtao1634@phytium.com.cn>
 <20251012151542.4131398-1-tangtao1634@phytium.com.cn>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251012151542.4131398-1-tangtao1634@phytium.com.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XGzJYEVM6970gLceDHiBYdH7EXWTlIBZRKP6VKijwKQ_1764693376
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Tao,

On 10/12/25 5:15 PM, Tao Tang wrote:
> Initialize the secure register bank (SMMU_SEC_SID_S) with sane default
> values during the SMMU's reset sequence.
>
> This change ensures that key fields, such as the secure ID registers,
> GBPA reset value, and queue entry sizes, are set to a known-good state.
> The SECURE_IMPL attribute of the S_IDR1 register will be introduced
> later via device properties.
>
> This is a necessary step to prevent undefined behavior when secure SMMU
> features are subsequently enabled and used by software.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> ---
>  hw/arm/smmuv3.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index b44859540f..0b366895ec 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -331,6 +331,15 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      bk->gerrorn = 0;
>      s->statusr = 0;
>      bk->gbpa = SMMU_GBPA_RESET_VAL;
> +
> +    /* Initialize Secure bank */
> +    SMMUv3RegBank *sbk = &s->bank[SMMU_SEC_SID_S];
> +
> +    memset(sbk->idr, 0, sizeof(sbk->idr));
> +    sbk->idr[1] = FIELD_DP32(sbk->idr[1], S_IDR1, S_SIDSIZE, SMMU_IDR1_SIDSIZE);
> +    sbk->gbpa = SMMU_GBPA_RESET_VAL;
> +    sbk->cmdq.entry_size = sizeof(struct Cmd);
> +    sbk->eventq.entry_size = sizeof(struct Evt);
what about prod, cons, base? Don't they need to initialized as for NS.

Also I am surprised only one IDR field is set. No need for some others?

Eric
>  }
>  
>  static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,


