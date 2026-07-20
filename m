Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFB4C44515
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 12:12:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlmqr-0001VN-VJ; Mon, 20 Jul 2026 08:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wlmqq-0001Ue-8R
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 08:12:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wlmqn-0006Xp-UH
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 08:12:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1784549520;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xd9y3mATfQIKtcIXvAkA2ABfdkCApbp+cQtC4H0DoTY=;
 b=OdGtAFLscFhcIRwcVh7Q9SnMh0jD1M7jK3I+GTZI906TbbmrLJGkjIRmyiBJ4qafD4Hmo9
 5LOccPtxhl7m1zqw+JlDRwsfgDnEa6hVxgw1xhv7o230gn7HsWxpjeq2Uk011DeMOR+ELF
 +YLUweCmzFCzsrVLXXWSSrlo5LbxI+w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-ufgSl_IeMmu3U5pE9ipBkQ-1; Mon, 20 Jul 2026 08:11:57 -0400
X-MC-Unique: ufgSl_IeMmu3U5pE9ipBkQ-1
X-Mimecast-MFC-AGG-ID: ufgSl_IeMmu3U5pE9ipBkQ_1784549516
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-c15ff68c858so1155083166b.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 05:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784549516; x=1785154316;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xd9y3mATfQIKtcIXvAkA2ABfdkCApbp+cQtC4H0DoTY=;
 b=YSL/J5WwG51kn/Wq0Zy4En/wwLWdHL1N+5xhuCYh/2PKREuQUAujqZQIDMAYGX70uk
 d/wx/ZURpVG77ewIuT2evAH43PG9BFtcsEIfT0KvIu2QVMDbod5u7AOXcP89glhHtdnR
 bamZ2e7Ls+1A8KBjlvtieOA0+LYZyAJlRZCIZ6UnSlpedxhWIL5gs4hp/Xukv2acb916
 1q/cDXzGeiceLd+7rQ6ntV71aydQkCqjRaC8vdfPe5tA4lXiCYfDkylEVx9EbZE7Jrda
 fYcrVUa06OQoKAjjvXkfY6Mz5AnAPAJczKartwgByKAzNZB+WQdvx0bWGu7SmooyLQys
 S1Xg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoSUMe9ErMkCvJ6JzgVeJItytIU+oLBL3ZXSSvIQv1FSjLPe+xhj6fNajULq1FGYIWvdMn7aVOmgQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywaqhij6NXP2n1tetO4MtFW0stj+xwOU9rUolaYecNW3AdqzLL7
 gM+/TmRwChnOmqsSy8nKaWfWPOipIpfp1v9xwCiFdHALDedM3424k13tl6q8jg6mK8NQyCqjYV6
 riKEdAIVmoD3qzRCGIYcuWIY21BT698a+en5izpk4WgJPm3UszzyJNA==
X-Gm-Gg: AfdE7cmIZnc4edphaNZFq0ZrBuR+lcbfgi+0N6VFP+ulrjTbKqDkiorvn25JV7KUrIz
 Sl8F+3zoKkvnoRBUZ4gkALGQ5xEDTcXbDA1I7W5uEqmPk2J5VkPH9kZQsuYucn9piFWPiH/NnZB
 cNtiCTALaX4ioeK7T1KSQqhkRYXHCz2sW5fd+/o3O2d+8msXIEUq8ERR3A2AYWeSZAyaCVCPEhr
 n/R101HC/b2OAPxr9O1/5172xiwvDcuflOSFB++ozZbBR+mw+N5BRL1qB0M7GuztJ51lh/iVnrd
 oEFD3KBJpmPPVoNdagPfYCBnp0nafNalKyrrjPS3Qobi98XAazs1CLaUr0SFWPepKUCbOBNafeU
 X7nL3bh82ClqqNk6RgbeMdSbwuGYjkiyjFDlvn0EXcjgV7dS2
X-Received: by 2002:a17:907:9720:b0:bf0:2253:ad67 with SMTP id
 a640c23a62f3a-c16b482612amr577605666b.46.1784549516367; 
 Mon, 20 Jul 2026 05:11:56 -0700 (PDT)
X-Received: by 2002:a17:907:9720:b0:bf0:2253:ad67 with SMTP id
 a640c23a62f3a-c16b482612amr577602266b.46.1784549515869; 
 Mon, 20 Jul 2026 05:11:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c17009ae00asm447960566b.7.2026.07.20.05.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 05:11:55 -0700 (PDT)
Message-ID: <c09c55df-a79d-4ea9-a5b4-3eb4c489370f@redhat.com>
Date: Mon, 20 Jul 2026 14:11:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 01/19] target/arm/sysreg: regenerate
 cpu-sysregs.h.inc
To: Khushit Shah <khushit.shah@nutanix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
Cc: cohuck@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 gshan@redhat.com, skolothumtho@nvidia.com, sebott@redhat.com,
 armbru@redhat.com, philmd@linaro.org, yangjinqian1@huawei.com,
 shaju.abraham@nutanix.com, mark.caveayland@nutanix.com,
 prerna.saxena@nutanix.com
References: <20260716213858.609699-1-khushit.shah@nutanix.com>
 <20260716213858.609699-2-khushit.shah@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260716213858.609699-2-khushit.shah@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vcWS3VTAOlcTHXbe7f1UN0gPcCQeAfigyAH1BH6OKKs_1784549516
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=unavailable autolearn_force=no
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

Hi Khushit,

On 7/16/26 11:38 PM, Khushit Shah wrote:
> Signed-off-by: Khushit Shah <khushit.shah@nutanix.com>
> ---
>  target/arm/cpu-sysregs.h.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
> index 05f558610b..2188cd7be0 100644
> --- a/target/arm/cpu-sysregs.h.inc
> +++ b/target/arm/cpu-sysregs.h.inc
> @@ -19,6 +19,7 @@ DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)
>  DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
>  DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
>  DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
> +DEF(ID_AA64ISAR3_EL1, 3, 0, 0, 6, 3)
Please could you send a branch. It is difficult to understand on which
code base you applied thise series as
ID_AA64ISAR3_EL1 definition is already upstream

Thanks

Eric
>  DEF(ID_AA64MMFR0_EL1, 3, 0, 0, 7, 0)
>  DEF(ID_AA64MMFR1_EL1, 3, 0, 0, 7, 1)
>  DEF(ID_AA64MMFR2_EL1, 3, 0, 0, 7, 2)


