Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp5610287lfv;
        Sun, 7 Nov 2021 23:59:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqGd1/vPJJDg/oUwzKjVME9Dh02VkRVFSr/FSyGZqlwcAp1MEhZ3RmEscBuDDoq2M2hHeM
X-Received: by 2002:a92:c565:: with SMTP id b5mr35349412ilj.14.1636358383377;
        Sun, 07 Nov 2021 23:59:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636358383; cv=none;
        d=google.com; s=arc-20160816;
        b=s2+1eIkkypjVo29MU/4nrsOhZjraxeGNfKqePbmUpZVji57N5GVRRtzXoIyczSYCzW
         r9lamntcjpDOlSNEmAb2vCF8S1rS/alw+BcI6UCnISdnG/lT5bVxNQE+qZWA4KP8Lnlb
         O9wIcGRyspMpdAYBNldbrL6XcrOXT7d9GydEYF088u/azXsuJCP26cWOJp0wPuHQZDOt
         +9W2ItacWVVYHTs0bP01izzeQLgHXM5OqVeRcKwr2YXslHA32zvnQXivoxR685cPOItn
         M9UrPHWlbpwlruv3YjCCRWveuxL/tTCxpIPkwVLvV27NR6W9C/ihEqzNj1FNCQzPd8cz
         M3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=nuWmdinz0tIzaD99NqIdLj9ATqm00lk4XzsqYjlALpc=;
        b=JWJwDrCcfU8NNUO8a2gKtxnzHDLJ9O68UXXtHZuzpipWCrq0G1nf3qwVAqa481R9dK
         RgFTfQpZqOQ7bxv9djsX9Y3ZzxFZIHzismEeuAHpPzzRnOmZqaLnpuU0imCSslS10AEo
         /0yONqaSnvVJV8PwY4LY5sYg9tJF08VzI+vHPFEyudeArBJ47A0MrHUzd0cXn4Hxf6Ab
         L9FzbucUOlUJK+eyfdJsddshRklOrL6CMuYGwRyDIFEm5q+lpgmzTsLPenwVqHzHJiCv
         kpJ3oDQCvzdHk6aG8j3jYi9aoXBDv2uMcqp/WlF6whJceJuH/0mPy6CGdOp9u8QfdsFv
         Zjjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gH5Oo7b7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si29504631jam.125.2021.11.07.23.59.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Nov 2021 23:59:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gH5Oo7b7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mjzZ8-0007nJ-Qj
	for alex.bennee@linaro.org; Mon, 08 Nov 2021 02:59:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjzZ0-0007mW-LP
 for qemu-arm@nongnu.org; Mon, 08 Nov 2021 02:59:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjzYz-0000Uj-5n
 for qemu-arm@nongnu.org; Mon, 08 Nov 2021 02:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636358372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuWmdinz0tIzaD99NqIdLj9ATqm00lk4XzsqYjlALpc=;
 b=gH5Oo7b7NXU++qMEcnYfz5AogtEXyQOrKJt3vphd9IbAdWkiqopbIBMaGYvfzTrbdZn5Xn
 gwd861PSTWA93pBqJK9t8nV6v9FbKC/G63s7k9/2AuzWQW0m9avSuWXa57czMJxYOwvyZk
 v1iMOKy/Bf6tH7G+W9OUvOXQOrdufno=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-cpn2hq22O-ybxj8DD9RYMg-1; Mon, 08 Nov 2021 02:59:22 -0500
X-MC-Unique: cpn2hq22O-ybxj8DD9RYMg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso3771692wrc.2
 for <qemu-arm@nongnu.org>; Sun, 07 Nov 2021 23:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nuWmdinz0tIzaD99NqIdLj9ATqm00lk4XzsqYjlALpc=;
 b=Jc4HZuBhxYO+pRNkgGcGBaf2ysHECIlFVokk9u72jm+sTMDVx0q7VWZINYBHHEiBaN
 8UJdFDPSxeuMNCFchngbwaaNmcYxqTSqOMlSoFw28b4A8s5ZVYx3EwsV7LKIWi3F0eLE
 Eh+L3aybdEYuF2M1wv862pmbMkYW7OHpbcZW9kn8XoXrP8WHY1Sg0e0uI7cg3UynidHW
 j5erElZg1QxihJFmIBXuLVIbwKQW/EytZq5xGJmGiq1UHlSHKcqh3+FXxIK62ZyL8T0j
 tlO1/QYFMu62CLpsX6o5DGnlxP3+21C1mA7XvDHFGPAlGdKM9cpt+oiTZhwQQizh9zzT
 zKLA==
X-Gm-Message-State: AOAM532O/qXi3IXmQmCtjJJgcRmhypBzulfsOgiWsoHf69aXZzPTknnk
 BF5tcgs7u2T4lZ/D/FrZ5vZ43isi6bNyyRamvhwWO5fjh8HUpVbWzAI2QdJoCbI/3Pus/RD3ydu
 /B7R2hOFNwJSa
X-Received: by 2002:a5d:4143:: with SMTP id c3mr79474597wrq.254.1636358361404; 
 Sun, 07 Nov 2021 23:59:21 -0800 (PST)
X-Received: by 2002:a5d:4143:: with SMTP id c3mr79474569wrq.254.1636358361263; 
 Sun, 07 Nov 2021 23:59:21 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t189sm15284995wma.8.2021.11.07.23.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Nov 2021 23:59:20 -0800 (PST)
Message-ID: <17c45808-5c04-146b-393b-74d5bd472726@redhat.com>
Date: Mon, 8 Nov 2021 08:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/2] tests/acceptance: rename tests acceptance to tests
 avocado
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20211105155354.154864-1-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211105155354.154864-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 John Snow <jsnow@redhat.com>, Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hr/NvdxnU2O1

On 11/5/21 16:53, Willian Rampazzo wrote:
> In the discussion about renaming the `tests/acceptance` [1], the
> conclusion was that the folders inside `tests` are related to the
> framework running the tests and not directly related to the type of
> the tests.
> 
> This changes the folder to `tests/avocado` and adjusts the MAKEFILE, the
> CI related files and the documentation.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg06553.html
> 
> GitLab pipeline with new naming: https://gitlab.com/willianrampazzo/qemu/-/pipelines/403056475
> 
> Changes from v1:
>  - Split changes on Makefile leaving `check-acceptance` available and
>    adding a deprecate warning message when it is used.
>    (Suggested-by: Philippe Mathieu-Daudé)
>  - Remove unrelated changes.
> 
> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> 
> Willian Rampazzo (2):
>   tests/acceptance: introduce new check-avocado tartget
>   tests/acceptance: rename tests acceptance to tests avocado

Thanks, series queued.

