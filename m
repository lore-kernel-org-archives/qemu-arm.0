Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE54DD74970
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Dec 2025 09:38:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWWwJ-0003RG-ME; Fri, 19 Dec 2025 04:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vWWwH-0003Qz-9F
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 04:38:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vWWwF-0002Uy-Fq
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 04:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766137098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Avink2tMPjpbdCDWU1EbkTNExSGwx7k9UAdsPnFW6Zs=;
 b=amr+COIRIGl4s4BZ9Lc32xUNF8tAuyLztwPC2N+YzVw62JjVHXYzfT9lRAZUcez7GN9bl8
 aFro2pU/iA2w/gQGcDbv4tlMqOC7lOf4a4l1dshDtoRra3oF63kL6tNyTvdovnKx90Ej2o
 2i7qZ73hRcMuGZvPNAIwJtdkY2bkK8k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-i0CiDeHINKyQwZadnBS3Pg-1; Fri, 19 Dec 2025 04:38:16 -0500
X-MC-Unique: i0CiDeHINKyQwZadnBS3Pg-1
X-Mimecast-MFC-AGG-ID: i0CiDeHINKyQwZadnBS3Pg_1766137096
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-430f433419aso1092183f8f.0
 for <qemu-arm@nongnu.org>; Fri, 19 Dec 2025 01:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766137095; x=1766741895;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Avink2tMPjpbdCDWU1EbkTNExSGwx7k9UAdsPnFW6Zs=;
 b=HTovrZOOFo3Rd6y4qZFfrN9VfJ9p8H7PVaVL+/vvtdQ+2BGzdhEYIIyekWc/pyQWVL
 jwWf+qSslptLdaB0ajP3oO27HtYIKPrCp6Z7Amq3iqNQcgYj98DQglGjBPrPJ/sRjKI2
 Tys1VbGfCQIOzTVRzDtzM1SpvbHU+f+9ckQhtMr6iELoIhhIzgEPOQ7VtiCB+9PbZNtX
 +GuhUCotTSAztZQd7kwAttk4gdzIQR3jd+ZBFi55Ue5TH+sYOePMswlm6UB/52cAIUpR
 yWY+VpRhnQb350YZjf6Abl6T6w8lJ6hfMZuFzq+jK9ZFk4w39Um/gp2OGYJGiUihnqUM
 P9Wg==
X-Gm-Message-State: AOJu0Yw3xrK1/J37XuIX3b5sQOlO/ArrIXAOWtRAYsdyX8fS9GkCGvzZ
 7Ufg3Oi+W9EVL3iaOEkJF7nOhTlasS8S7gZegIjVUAAxqcxHG3YN0uIc0OBiYn+MgvtEZ7G0A57
 eyxfVvT/P5vovyV1sqiFXZgYz3r8JhxOAin4P30ZEgLL7XkbmODU3dQ==
X-Gm-Gg: AY/fxX58QA4T5w2bm2D/8O1700seSuvBA334rwhn8FAeTNMduxeZYD1WQApTH6zRTGm
 zrN7twuxq2xVV1MzWMYLfQnhu5nFfvlvI8sIHCZRwJf8DJ1NIIQIEjnpowO1f1XsIsvKTpz7Vkl
 G8yULk2VSyuVxfe5bdgZVzsVhaPizQerzs9Xn3nDE+w5+ESaTb6wHqySzqlCqzZSXDnEUlLci5F
 buEQXZdRzFjBqSOK3hDbCqUkwUwUPAC9mNAFt9RIoLeUyeF6XepVBGmcTbnjFI4SOzTOo2PJR2x
 k8l4M0mZuKZMoZy4UJbBZOYSHa2//t2IMH/Quxr+YCuCubR4JjseFr4gymD0P0gZrGVyLhdDiuB
 dqdTL8O8=
X-Received: by 2002:a05:6000:1a8e:b0:430:fdfc:7dd3 with SMTP id
 ffacd0b85a97d-4324e50d781mr2435646f8f.50.1766137095651; 
 Fri, 19 Dec 2025 01:38:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlP0Bp5D32dZdvlwWP74n6vsF4dpQ6mCV6U3jc5oy4mUDNuFggCNJ3OtTv4vq4DDeCvAHhcQ==
X-Received: by 2002:a05:6000:1a8e:b0:430:fdfc:7dd3 with SMTP id
 ffacd0b85a97d-4324e50d781mr2435622f8f.50.1766137095267; 
 Fri, 19 Dec 2025 01:38:15 -0800 (PST)
Received: from [192.168.0.5] ([47.64.112.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1b36fsm3915867f8f.5.2025.12.19.01.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 01:38:14 -0800 (PST)
Message-ID: <0da41936-484d-4ea0-ae69-a0d98c66c16a@redhat.com>
Date: Fri, 19 Dec 2025 10:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: Re-enable the MAX78000FTHR machine in
 qemu-system-arm/aarch64
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jackson Donaldson <jcksn@duck.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20251218214306.63667-1-philmd@linaro.org>
 <a8a2eec0-f458-40e6-bfcc-d51be9333799@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <a8a2eec0-f458-40e6-bfcc-d51be9333799@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DpZd_VcZIiNqY-9O-XBrCbelHwnPexidccEeqaxap9E_1766137096
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 19/12/2025 10.02, Philippe Mathieu-Daudé wrote:
> On 18/12/25 22:43, Philippe Mathieu-Daudé wrote:
>> Unfortunately while rebasing the series registering the
>> ARM/Aarch64 machine interfaces and getting it merged as
>> commit 38c5ab40031 ("hw/arm: Filter machine types for
>> qemu-system-arm/aarch64 binaries") we missed the recent
>> addition of the MAX78000FTHR machine in commit 51eb283dd0e.
>> Correct that.
>>
>> Reported-by: Thomas Huth <thuth@redhat.com>
>> Tested-by: Thomas Huth <thuth@redhat.com>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3248
> 
> We have a functional test for this machine
> (tests/functional/arm/test_max78000fthr.py)
> so I don't understand how we missed this.

The functional tests are skipped if a machine is not available in the 
binary, otherwise the test would fail if you'd configure your QEMU with less 
machines.

  Thomas


