Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C19CD4F50
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 16:47:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wP17u-0005yM-QW; Mon, 18 May 2026 12:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wP17C-0005lX-CO
 for qemu-arm@nongnu.org; Mon, 18 May 2026 12:46:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wP17A-0007Sn-No
 for qemu-arm@nongnu.org; Mon, 18 May 2026 12:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779122807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yUROuqmfqDJ1TjIlpPHC8LVoh6TGZtVCmx8V474eWHs=;
 b=huz/CfH0VfVypqyOZSLqh/xNmY/b8giucj+0ce0X4IJjVc5fxyhzYmx6u2hpvdmjhBdOi/
 0LGFwoxN5TAXSqeNVGockuVZy3FlJBpOVLK29QWhlZ7L65OeAOTbdV75hQvgSBFhzU4zhi
 5ZV+j2fQnJ1pI4lJYC9aowUVf+rodkE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-ZqYhSVoPOL-YgJGtb3oN3Q-1; Mon, 18 May 2026 12:46:45 -0400
X-MC-Unique: ZqYhSVoPOL-YgJGtb3oN3Q-1
X-Mimecast-MFC-AGG-ID: ZqYhSVoPOL-YgJGtb3oN3Q_1779122805
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-44f56d5523eso2711136f8f.1
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 09:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779122805; x=1779727605;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yUROuqmfqDJ1TjIlpPHC8LVoh6TGZtVCmx8V474eWHs=;
 b=hr9DORywxWIbtT4zUfiJ+sAKu/8yTq60CaCT5EjSnhZ3yiae6tRTe4XHCiFMgSVcQ2
 AKSKvLpsx1GaY4OP9Q3A0JUaqYGoqchsNGydAI35iCuEBRLcvPSdbZR+07l2efweU0DW
 Gn8cOSLhmvt1dBPYNuyvTwh0l/+OiogugxjPmlRFFpIqaVTIK/wiCSiB1W0zbXNtBs2w
 f3y6g6JhGSDNOIOFw013arunPqBlpYWXDugYLrMK2eJpcKtJKYSelE76sVjHsXsFJ4Re
 4c4aASYlR3Djp+NVnPHhOXFPQgK35inbbxuKGrseyElQ8QOFR4DjxHN60heSBe/RLOBx
 w2DQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+zAQFR0FOh5L42bNlz/DfUxz/q9u9oamA56pygr69y1kG6/Ux4KAi+99/RIJaH0d6L8Ds68EV/2g==@nongnu.org
X-Gm-Message-State: AOJu0YzaNkv6LpafCuHTcY6HiCCBuyJjjxQwLVlSseMvXTOLWQWLQF8k
 3/llm3DhYiFyN7QleVRhS7eT8vpQ1ocvpu0Z54gvcbzdq4xNAVDnhRkItnGiGpKYMncrm+IOxMd
 75CMCeMUODOss8U2ODlk4ltZ81aRsd9z5HDVAmhSo3ckV1zIleegJTQ==
X-Gm-Gg: Acq92OF2HkkJbzgP9Jcx+MSZyP3je0cLUSFIE1Yj6KVBoIAvcOvQZWogRkdiavDECAH
 TUbC7La7F2vXsQUmvBaOFCo79DaMdx3DEUVfzB0E9eQ+F5U7kplAchW+Okc4gtTCl62l8FyIi2N
 Bysg1Ma9VWklymLP0HsQvPFwrs7wf0Fjd2k3Hd6ohrsbt7SZcLNHJPtbN+3bR5SG4eLPwai86r9
 lytCyiMPHBZjujdNNv5mKnphkfT4+ZIUCFMa3yLYHX+4xOIicCrL5wpFCV7olrU8ZKhEG+xn+St
 0+2KK5CjDCzkQtURMlgN4zYfxZ8RdbYimBo599TCgI+kax++g+uA8LYgi2twtqww1mWFu+r8mzM
 iQPvv+ape11MDlbJRsw==
X-Received: by 2002:a05:6000:230d:b0:45d:b14b:2412 with SMTP id
 ffacd0b85a97d-45e5c362c56mr25416250f8f.6.1779122804707; 
 Mon, 18 May 2026 09:46:44 -0700 (PDT)
X-Received: by 2002:a05:6000:230d:b0:45d:b14b:2412 with SMTP id
 ffacd0b85a97d-45e5c362c56mr25416211f8f.6.1779122804332; 
 Mon, 18 May 2026 09:46:44 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.114.83]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45e7c22d8b7sm9558470f8f.6.2026.05.18.09.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 09:46:43 -0700 (PDT)
Message-ID: <0d152a0a-a387-445f-b359-19d23504083f@redhat.com>
Date: Mon, 18 May 2026 18:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/aarch64: Bump up timeout on vbsa
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20260518160440.1037245-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260518160440.1037245-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: APtHtx56B-bQTiHII-Is_JftJ9uPdeJUqGiHKbxFqkY_1779122805
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 18/05/2026 18.04, Peter Maydell wrote:
> On a debug build, the virt_vbsa functional test takes about 2 minutes to
> run on my machine, so it tends to time out. Bump the timeout to 4 mins.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/functional/aarch64/meson.build | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/functional/aarch64/meson.build b/tests/functional/aarch64/meson.build
> index 9803f66299..e81afd6c39 100644
> --- a/tests/functional/aarch64/meson.build
> +++ b/tests/functional/aarch64/meson.build
> @@ -17,6 +17,7 @@ test_aarch64_timeouts = {
>     'tuxrun' : 240,
>     'virt' : 360,
>     'virt_gpu' : 480,
> +  'virt_vbsa' : 240,
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


