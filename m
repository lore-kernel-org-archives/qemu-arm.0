Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10982CCFA18
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 17:51:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIsWe-0002J6-Gt; Tue, 11 Nov 2025 12:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vIsVT-0001V2-7O
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:50:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vIsVQ-0001OI-WD
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 12:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762883411;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V5YdgpSepIM+Vu72ZmZR6JDazpPsxkKp2SzwOXtK9HQ=;
 b=hWeApdl6Raz+/kUtfVgtWcAsjtm7PP6DMAsqtsZGYmfyGng/ngNIvOxKQhRtuRCux4mUUA
 n3aW/YEFjHTZ55gaaZMUO6YLT5QZV1fNOWInhz1FNUrf8BNCPtxvPUqVWL+lvAPuV0L153
 cf+TPIBwelLhE7tYSU21GzkwJtGbis4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-hmUGxoOvMQGFpP5YDfGTJA-1; Tue, 11 Nov 2025 12:50:10 -0500
X-MC-Unique: hmUGxoOvMQGFpP5YDfGTJA-1
X-Mimecast-MFC-AGG-ID: hmUGxoOvMQGFpP5YDfGTJA_1762883410
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88238449415so137992556d6.2
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 09:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762883410; x=1763488210;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V5YdgpSepIM+Vu72ZmZR6JDazpPsxkKp2SzwOXtK9HQ=;
 b=W/zTdi6tXUsKwazISIRf20KTk4sQYvwa6AF3ASxSeBYU3ke+eHTHZMnF4EoorLegGT
 xuxCOpgnJft6NnQD4PGberSd2HCZM4/iUGLryfoQ1z8ZrKnzZA7Ch6+9rVwfKTikqTsf
 xDN1gc3NR4MKEDkfg3Am3i3Ybta7XXnbpPbXMrLGXie33i0/ouSqJdGeLMWOiZfRcEnS
 JX513XYKVnC9xkJ69tbz9NFb5RuWAoU/vwwPjZYlQPYZ6/ntDHEx9YwONQKn1u1hSwiq
 42C6cL0Jb6pQhNbz1NXm1YnL3fr9LNJkmUMYHCv/a3Rq06rv6W/FBAJfn815cJ/yirNJ
 g2wQ==
X-Gm-Message-State: AOJu0YwsEPgLlB1T19J0HrD7N6xMs/UmbOpfMWPIyZIIPDWhZ95+eoM2
 00YpFi1vVxjRVqy/dL4dbF1EV4rxUOzhsHFDsYPbI3QDfMfCUGzBaV1c62/Ytb3EnKRzMqzEgVm
 ow11PavLyf3u8dt7txcAfX/6cns+omieYVsW2UhwCYe0qjvvm1HifGw==
X-Gm-Gg: ASbGnctkXzVJ2vTG1TSU+a2em0lFSelPgclXJx63NF2P9KwpiaIRACzxiFNQnLaDoLJ
 O1LP//Ls1IQbci0j6X9yIMJsbJGnzAwqslW7ZZnvAX7+jtxBeJV3E35+xIX6PnUjM+d8glBYUzU
 gYY/ukdUUGJqXOTtWzyAImEv2X2K+EQeuON/yyJe6RU2pX8dxBt6lewsyPD4x6fGw+VlifWk6yx
 a62x17vqK6Cc+Ly0NFE+jIsZXpSS1T70WdZuHxvViWiefcEOL/7nLZD/GeF81pqUVBb14TOwKzX
 8fE89bubtSJsnveRfk42ajo5pHHPMw39vPwYx9DQBb44upibV5msqOTF3bqRFCEAPqBmp4DNX/d
 acc51/QV4O0kO10+aEvQOvYyUBbPqhxVqxOKbzGxpbP1/X/NE+RbvbLgv
X-Received: by 2002:a05:6214:1256:b0:882:3828:fa33 with SMTP id
 6a1803df08f44-8827195f622mr3497566d6.26.1762883410118; 
 Tue, 11 Nov 2025 09:50:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0Ci9tdkmBBhpaJb4rkRghX6NZbIVWm0/hZnIdsIzeoWFuTuvMXuGLGtwGnZRnSZ7XXAbryQ==
X-Received: by 2002:a05:6214:1256:b0:882:3828:fa33 with SMTP id
 6a1803df08f44-8827195f622mr3497326d6.26.1762883409798; 
 Tue, 11 Nov 2025 09:50:09 -0800 (PST)
Received: from [10.188.251.182] (cust-east-par-46-193-65-163.cust.wifirst.net.
 [46.193.65.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88238baa0aesm76833956d6.60.2025.11.11.09.50.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 09:50:09 -0800 (PST)
Message-ID: <ad87bec9-e36d-4c5d-adf8-ae92917451a2@redhat.com>
Date: Tue, 11 Nov 2025 18:50:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] target/arm/kvm: add constants for new PSCI versions
To: Sebastian Ott <sebott@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20251030165905.73295-1-sebott@redhat.com>
 <20251030165905.73295-2-sebott@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251030165905.73295-2-sebott@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pODLOyrLgGnMREmAkO96FU3i4JRTyNVsS28Q8nW8YCg_1762883410
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Sebstian,

On 10/30/25 5:59 PM, Sebastian Ott wrote:
> Add constants for PSCI version 1_2 and 1_3.
>
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  target/arm/kvm-consts.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
> index 54ae5da7ce..9fba3e886d 100644
> --- a/target/arm/kvm-consts.h
> +++ b/target/arm/kvm-consts.h
> @@ -97,6 +97,8 @@ MISMATCH_CHECK(QEMU_PSCI_1_0_FN_PSCI_FEATURES, PSCI_1_0_FN_PSCI_FEATURES);
>  #define QEMU_PSCI_VERSION_0_2                     0x00002
>  #define QEMU_PSCI_VERSION_1_0                     0x10000
>  #define QEMU_PSCI_VERSION_1_1                     0x10001
> +#define QEMU_PSCI_VERSION_1_2                     0x10002
> +#define QEMU_PSCI_VERSION_1_3                     0x10003
>  
>  MISMATCH_CHECK(QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED, PSCI_0_2_TOS_MP);
>  /* We don't bother to check every possible version value */


