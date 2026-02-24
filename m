Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA5AE9B249
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 10:27:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vupdA-0008My-GT; Tue, 24 Feb 2026 05:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vupd8-0008M8-Ty
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 05:27:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vupd6-0007xi-7F
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 05:27:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771928819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nD9SwYkjwny6uzn/M7JYh9ZwjmTttKkIuPhKQ1H1lNw=;
 b=TrgppnBLizYHNW7jmPkyebmk49kWa4ueNza4a+FJX8/Dxw6ZOlveE4g0E3WFUzJzNjhzjY
 Du2X44OekPBHX6qBgxHcymbpVA8H07lCm3EgLq+hZwNK0jo7r/u83CMx7RuGqlgq+Ab+Y1
 sxFkwFF8WuvPbg7atjlrYqLkBzhL2p0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-UC9sN864PDKi19Kul_l7Lg-1; Tue, 24 Feb 2026 05:26:57 -0500
X-MC-Unique: UC9sN864PDKi19Kul_l7Lg-1
X-Mimecast-MFC-AGG-ID: UC9sN864PDKi19Kul_l7Lg_1771928816
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4836ff58111so64650685e9.1
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 02:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771928816; x=1772533616;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nD9SwYkjwny6uzn/M7JYh9ZwjmTttKkIuPhKQ1H1lNw=;
 b=YXmIwVpvQzb4bdx5lgGrNZwAh8Ebma4Ub22HYpt4Ki1RKWxg0qVosS8Yf/V5zpvTSH
 sXLCF8r4efBXDNmvndfu0klvzTribXRizyZvCLRH21d4IFB4+1qBQEqSMZJ4gChtjjVD
 mDzS0KHePTyawvo3prRYua9SA6zwI1hN23zU2xmLwDiKtmYdwt87pIXYRHbWvi1xaGO2
 mJlil53vMT24LSFSP/sFbcsk5KmPE1/pnSs+XZ4y0XDe5Fb2Z5si+h3LYuIsUnLych2i
 lWZt/bnsS+jMz+wJ9YgLutce323KjQZ0qU1PhxK1p7Z+LNJJNZ0an5e4Z/vlR61/orBi
 um8w==
X-Gm-Message-State: AOJu0Yw0OcVJQGtCMErgkTWgCih71Or0Fa0q8pEtnIePlMitgszbwRoe
 L+tbt1gwsPh+gF1oug/UAfrBlQYVXgmhD92OfyoqbNRKndi9AekQ/AtnKwJi9s+i42Uh2mY5FP/
 2+5JVJh4JXtfwvYpEZYGaNd5Eexu+HHQ05a3837FuelKHXXhrQi8rsw==
X-Gm-Gg: AZuq6aJRqYh/qQkG7/q0kz4ZRPblnfC8/s2q3QZ9P/X2mfIgP2OeIVPkFjWmLcnFs1h
 2Kw+jsMOuk6CUSqnzyMWnaTI8SgqhyDKtXTEteYb/gSiBlUiA9ArGix0GnDSCkOrky44k/3nm1H
 Z394VLtPGRWuPSvWF3DZIaZB3RiCHF92NOwjRjRVH29po//mBSuwaFolrHtTPz6iR+ZX5B+OOp8
 o6KYpEknxTc/q8mSP2yY1WSgOVXJMR6wEUrXzzSyIgGVnv4TSK6cOHYenAz+NOyn/HbeqZuDQFo
 6y4PPFsDFsVVIoC8APDJUYM7axqV6gH/byRjR6/wuxKDLBIoBDjr8hNeEdniDgrLxx17msfF9vg
 Qg1+Th9ofp/k7/BApYAVkuz3MnWT5WLQJL9+sgJ51R2YsA5AoiSaKQPYSJj9AfYU4xVuffMo/9E
 xKlqW6M7B7IzKvL8Q33TPqDYQefh0=
X-Received: by 2002:a05:600d:8444:20b0:483:afbb:a086 with SMTP id
 5b1f17b1804b1-483afbba1e8mr90115995e9.29.1771928815943; 
 Tue, 24 Feb 2026 02:26:55 -0800 (PST)
X-Received: by 2002:a05:600d:8444:20b0:483:afbb:a086 with SMTP id
 5b1f17b1804b1-483afbba1e8mr90115555e9.29.1771928815420; 
 Tue, 24 Feb 2026 02:26:55 -0800 (PST)
Received: from [192.168.10.81] ([151.95.144.138])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-483b87db57fsm27475165e9.3.2026.02.24.02.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 02:26:54 -0800 (PST)
Message-ID: <64858ac9-9c25-405c-983b-98c1514d795b@redhat.com>
Date: Tue, 24 Feb 2026 11:26:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] docs: Add Nitro Enclaves documentation
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org, philmd@linaro.org,
 berrange@redhat.com, marcandre.lureau@redhat.com,
 Cornelia Huck <cohuck@redhat.com>, mst@redhat.com,
 Dorjoy Chowdhury <dorjoychy111@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Tyler Fanelli <tfanelli@redhat.com>, mknaust@amazon.com,
 nh-open-source@amazon.com
References: <20260218015151.4052-1-graf@amazon.com>
 <20260218015151.4052-11-graf@amazon.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20260218015151.4052-11-graf@amazon.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lZxHCvuPUZTeg9TlAxvJ_u5-A1NezlV8nMYxrx4EKcU_1771928816
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=1.179, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.717,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 2/18/26 02:51, Alexander Graf wrote:
> +Machine
> +-------
> +
> +The ``nitro`` machine (``-M nitro``) is a minimal, architecture-independent
> +machine that provides only what a Nitro Enclave needs:
> +
> +* RAM (huge page backed via memfd)
> +* vCPUs (defaults to ``host`` CPU type)
> +* A heartbeat device (vsock server on port 9000)
> +* A serial console bridge (vsock client, debug mode only)
> +
> +Communication to the Nitro Enclave is limited to virtio-vsock. The Enclave
> +is allocated a CID at launch at which it is reachable. The CID is available
> +as QOM property in the accelerator and as a trace event.

Maybe add a sample qom-get invocation to retrieve it?

Paolo


