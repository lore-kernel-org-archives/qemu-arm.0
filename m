Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp766635ejc;
        Wed, 10 Apr 2024 23:31:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJYSOJfKQgyxxx5MwhCZWRRB4TCaRVF2mDJhlN3gP2nCUZToaHpFB3cN0/0Rixc2E2xZfOUfGaN9TrEEtQbaXvMsGiP+TK
X-Google-Smtp-Source: AGHT+IHXO+oXbDCtEUZek9B0Rj8H268WKLZK8oDvD7bkw/rkYaUqb6DirPlUhRFnddO9B6vZG26x
X-Received: by 2002:a05:6820:98e:b0:5aa:4177:d378 with SMTP id cg14-20020a056820098e00b005aa4177d378mr4305454oob.4.1712817084075;
        Wed, 10 Apr 2024 23:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712817084; cv=none;
        d=google.com; s=arc-20160816;
        b=L5WtQ/UJE0jL/5vGdbTzBZLJmBrgOwfUPdawkeVPo2X/A7+2qRpfndyxculFjhe9e/
         rpApX9ZsmgsP3IVU11kwExoiPd8ekpGVbTqrpzb9gahEPsnLg2ldfVd9mgDxT9OHIOlE
         A4eKtZ6+rt+9LZzODQuwUvH2PFCJGvXj2fw/e7pWr7zAj0yXGCql7fjmTo3MlTyKQ0wc
         2STzs/M4Vv/mx+opQVkVTZUCqSo2J5MuKOhMDEw7tnLsbPttu+E1kLgGkCjEtvaEeG4x
         gl/IToM+A/s5hJJ9NgajTb5ISDVCNGdTvSHAGTAAbNEdbOL5AuLJis/BscFYuF2XQX7Q
         L7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=q9wP7RqptDYcyEGY/IwvOXaC/781qbPTDuNq7oEuTfk=;
        fh=EYa+IdaUQnrJnoGMNHo9AWNg6KrATpMxoExqKScd1lI=;
        b=X0pUsGLJ2Esdrdiz/oQGyJkY8s+CtqMQFXcHuuqu5lkaHpdCPTYqNURkXl/yJ0zk5a
         DdLDYEgXn0R8AeMWcGOTjUN2yRJXPEsOiD4wggcgfN1CvMLU4qrq9H4EiLTOI3AacVrL
         XPiolxLoF+qvykmaEFto3kAT+rdnjq17Dfu+6xw7KrPHcYZhZm+P81rmTVV6VM4F7hQ0
         k8tMAPK+YmvmVJRSgxvMrtntpJFHXjylNjXjpLB+IDbgdoddDHrfJdr23x3c6t3SoldN
         avw8WCXwzpt0PhhW9Q1CPY+eW4C56EGrrdD0a2AX6CLc8qvnZejnatbfAUooCYhjnzPK
         42UA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RysFqHeh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9-20020ac87549000000b00432c5133cebsi792308qtr.406.2024.04.10.23.31.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Apr 2024 23:31:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RysFqHeh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1runxX-0003Ls-PN; Thu, 11 Apr 2024 02:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1runxL-0003Kn-VD
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 02:30:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1runxG-0005aR-K5
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 02:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712817036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q9wP7RqptDYcyEGY/IwvOXaC/781qbPTDuNq7oEuTfk=;
 b=RysFqHeh1ntv4bZJyxlcjUtcORvf4QxB0MHmyIaI8rtJFASVJjPKBsca4vPDmaJxcBg904
 wICp36n8g/syVWyG1lzFdjFVEjqpcQKa/4jldkyMUXWnI4r+nYVMDro5wFTR+nQm4/uCBa
 eZdfOgDKHQ30FZ3WzAL8CA7o0VdnmaM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-vRyX50UgOWShNFVWPIj-kQ-1; Thu, 11 Apr 2024 02:30:31 -0400
X-MC-Unique: vRyX50UgOWShNFVWPIj-kQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6968a5b3557so79884326d6.0
 for <qemu-arm@nongnu.org>; Wed, 10 Apr 2024 23:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712817031; x=1713421831;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q9wP7RqptDYcyEGY/IwvOXaC/781qbPTDuNq7oEuTfk=;
 b=dqZc6c4rX7kNUje5W1tzeoRu++iUAr3ZP4Jp/Rvl5aV9H99Zg2pgCcvXSbl6XM9ZsR
 rT7bEM1jVK251jr/rggOqU4YRJSR4nxYQ/pnq6TacvyWEUdXVDyRO+QXqBj3vyONiXO3
 ezM7EH4Dli/op4aLVHu28HylkYj1t+cuaxxdKdPp+HNOvLs7Fql/Y7+pdZUIOlLxSV5b
 HTUu8o/GpMh5R2FWNB/xkck8dq9z1396sW0p7EYj2HuvQeMEeogGiUTSOvqWKhUr8Z9N
 YUcrjl235TU7lqzCjuBZnN8HCfNtWLiZ09uI/lzVolbEWh2evf0zDvzVfQyQaKj2OsWn
 w6qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQFjwluJxog4Hh39dykBPq3LZO+pO8Y5MKnF3Jblo9f8qJ+2/N3oPUShr7oVj7NGcoU6vNAJ9SYv48my5FndyZ/mkz
X-Gm-Message-State: AOJu0YxpP6SkCaxZI59dg4VRJ8EntmS7GZpzFXoQw3ALA5ndhpaJcRGD
 uExaehMwUOC8znnPP8wsP2je5v69YEJfwK68uozWdzSW2GoptRWMYq9UZhg1+aJk0klFCkeETgF
 N86SYDWTEVvSkWWfv92+LgWWRxpBHMl/OjIqY8glIdMboZsV5Tg==
X-Received: by 2002:ad4:5966:0:b0:691:46ee:6abc with SMTP id
 eq6-20020ad45966000000b0069146ee6abcmr4430656qvb.3.1712817031207; 
 Wed, 10 Apr 2024 23:30:31 -0700 (PDT)
X-Received: by 2002:ad4:5966:0:b0:691:46ee:6abc with SMTP id
 eq6-20020ad45966000000b0069146ee6abcmr4430641qvb.3.1712817030944; 
 Wed, 10 Apr 2024 23:30:30 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-142.web.vodafone.de.
 [109.43.179.142]) by smtp.gmail.com with ESMTPSA id
 g6-20020ad45106000000b0069b439190c8sm550747qvp.64.2024.04.10.23.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 23:30:30 -0700 (PDT)
Message-ID: <9199442f-f799-4f97-ac80-aa78eaf61958@redhat.com>
Date: Thu, 11 Apr 2024 08:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] system/qtest: Replace sprintf() by
 g_string_append_printf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20240410160614.90627-1-philmd@linaro.org>
 <20240410160614.90627-6-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240410160614.90627-6-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: wa8MD+znBduq

On 10/04/2024 18.06, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience.
> 
> Replace sprintf() by GString API uses in order to avoid:
> 
>    [120/169] Compiling C object libcommon.fa.p/system_qtest.c.o
>    system/qtest.c:623:13: warning: 'sprintf' is deprecated:
>      This function is provided for compatibility reasons only.
>      Due to security concerns inherent in the design of sprintf(3),
>      it is highly recommended that you use snprintf(3) instead.
>      [-Wdeprecated-declarations]
>              sprintf(&enc[i * 2], "%02x", data[i]);
>              ^
>    1 warning generated.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   system/qtest.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

