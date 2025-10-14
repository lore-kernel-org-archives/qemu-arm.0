Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F75CCD190
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 18:22:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8jey-0002qb-6r; Tue, 14 Oct 2025 14:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v8jew-0002q1-55
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 14:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v8jeu-000093-3y
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 14:22:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760466118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+1dKwRBjDlYULLOrwDEsAyAmaDoYlzjkVheLqNBOEjg=;
 b=ZFxVOToXsjVzpDsiXqpoiSdKeaomPvpu9lMs25lp8l+SkYTM1zEDmfYWEJIS8PIkUjzxvf
 nw59WOzoZM526lDBUZCFgjOaBKpewVgjpa+E/16p6wpA4D6hYt/OsH76tYUwisfyTqjkvF
 Wwoh1AfZCEyZdVQ4GsFX+UCSafsdMvE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-3t04XTTQNw2TDUPG7t6dKA-1; Tue, 14 Oct 2025 14:21:53 -0400
X-MC-Unique: 3t04XTTQNw2TDUPG7t6dKA-1
X-Mimecast-MFC-AGG-ID: 3t04XTTQNw2TDUPG7t6dKA_1760466111
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-46e38bd6680so30873645e9.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 11:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760466111; x=1761070911;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+1dKwRBjDlYULLOrwDEsAyAmaDoYlzjkVheLqNBOEjg=;
 b=GZCiYY2bi52HlczVxewMsskSr1zxUuUaL8ivlwNEQfKzu3NB3TmuVEhw0qR2ZeOYFR
 seD2i6x5KMvsMQ2rUk6IhXRtV3AyUYvgxsuQeyhNXa52baL+MnBorM7pEe0ZXxZkyc0N
 nkDRK4WeVb3TtsoutJnsxM1MdpzHFnF7G/NyPiEzwkJgX2fGjxD3T2U6VLZXQWJKs5nI
 /mPCn2F3B9J1QR2MeST3xkyh0Y40FA3lR3B6DnpjiaAU0uc9SYvG/2bWEiEJNlgpFkib
 2zNi8n1plaMbezFYDyz2gwgo7HKPtAp+EwSasemp1Y8LcTP5rf2ooQDr6ahwn5S2hT+F
 9wNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVecGZ3OqiwZrCXs5vxZxWkb7Ej+UD8/q9YiEjoqeHffCoOv5S7FY6g2C45Q+DsSn9GV27qERWCpA==@nongnu.org
X-Gm-Message-State: AOJu0Ywmm91rNPtVUZ7kVKHYIg9cL+N9+wvP9oIyLaWqHzOwTn++IHCN
 WVYLSb1GM1kMpxk373Q2c7z0N/cmGoP13Xe5h35LnxuYN1CLciB8F5NTxdKN/98I4Nz/9B37zIg
 5xfASGMdkXdPiUc44hdzSOU7vG9Q3RivmfTo9lk/O6ZO5sx9yStmAeg==
X-Gm-Gg: ASbGncvpRq9Onl82G/VRsNgbThMuiCfdtoXpm5IyLSPKc8ptYA6JQmb3vOL8nU+iHaA
 +sTJdSUMS+uGYKvuyS1RYD3NGPBZnskidpqJBz4BIQ6Fg7RrxVMQmg+YmlTlG2g59FkZBj+gFej
 k5dqoI6SN2imLxvLnvAH5LoFECS5nZ1/ql547qM0pocIvRS9saLu3ovdOxeGQHxNyA69VEjtkeG
 qnBz/Kpyem9IMa29SQFoN6mtHoo20XWTph7+xQJqwH2JgDaH9l6r9goVHkzE+u/ctAKc4d/xf1F
 oRBg7Hrsa0j6XHW7w9fAbzxEipMo3rYng3Mi/uZA/fztQ3SP8EN2ZJHETKOu+wluDDJal5/ZaDd
 /VnUmPw==
X-Received: by 2002:adf:e18a:0:b0:426:d81f:a86 with SMTP id
 ffacd0b85a97d-426d81f0b0amr9669128f8f.58.1760466110997; 
 Tue, 14 Oct 2025 11:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbecB1C0bZflckKYFG4INZlZ916sUGPaRrx27aJMyNsQOc1QLfLVk0ygQGqNFlGxaTNdrjfA==
X-Received: by 2002:adf:e18a:0:b0:426:d81f:a86 with SMTP id
 ffacd0b85a97d-426d81f0b0amr9669113f8f.58.1760466110576; 
 Tue, 14 Oct 2025 11:21:50 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-112-136.pools.arcor-ip.net.
 [47.64.112.136]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce582b39sm24583054f8f.15.2025.10.14.11.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 11:21:50 -0700 (PDT)
Message-ID: <a0d4ba3d-f799-4ec3-8d3b-efdc33527242@redhat.com>
Date: Tue, 14 Oct 2025 20:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] python: Install pygdbmi in meson's venv
To: John Snow <jsnow@redhat.com>, Gustavo Romero <gustavo.romero@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, berrange@redhat.com,
 qemu-arm@nongnu.org
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
 <20251002020432.54443-3-gustavo.romero@linaro.org>
 <CAFn=p-bscu00jtyfm+SmeYqB7gt6eA+F8uuYb8ng6rTe_a=HTA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CAFn=p-bscu00jtyfm+SmeYqB7gt6eA+F8uuYb8ng6rTe_a=HTA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ipcP7z7OGkFuMSI1mJJnZWb2nWjnn9YqnlEHTuacSsE_1760466111
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 14/10/2025 19.39, John Snow wrote:
> On Wed, Oct 1, 2025 at 10:09 PM Gustavo Romero
> <gustavo.romero@linaro.org> wrote:
>>
>> The upcoming changes in the reverse_debugging functional test to remove
>> Avocado as a dependency will require pygdbmi for interacting with GDB,
>> so install it in meson's venv (located in the build dir's pyvenv/).
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>   pythondeps.toml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/pythondeps.toml b/pythondeps.toml
>> index 16fb2a989c..98e99e7900 100644
>> --- a/pythondeps.toml
>> +++ b/pythondeps.toml
>> @@ -33,3 +33,4 @@ sphinx_rtd_theme = { accepted = ">=0.5", installed = "1.2.2" }
>>
>>   [testdeps]
>>   qemu.qmp = { accepted = ">=0.0.3", installed = "0.0.3" }
>> +pygdbmi = { accepted = ">=0.11.0.0", installed = "0.11.0.0" }
>> --
>> 2.34.1
>>
> 
> Do we need to vendor pygdbmi? Currently, mkvenv does not consult
> online sources and so if this package is missing, pulling in testdeps
> will fail.

This is handled by the "check-venv" target which is called now when you do a 
"make check-functional". See:

  https://gitlab.com/qemu-project/qemu/-/commit/75b1786996c422878d09bd12f166004a7d32e459

Works fine for me, did you hit any issues here?

  Thomas


