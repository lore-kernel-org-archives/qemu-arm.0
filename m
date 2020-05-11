Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp148461lfb;
        Mon, 11 May 2020 05:19:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypK1in7BpEhCyKEeiT9QrFcgyQ/XHDY90vvCOMe9KGDsSyQOeIZ2gDDgAgMVFBpo4aPoVFuu
X-Received: by 2002:ad4:44ab:: with SMTP id n11mr15715685qvt.235.1589199599168;
        Mon, 11 May 2020 05:19:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589199599; cv=none;
        d=google.com; s=arc-20160816;
        b=ionInu9tfaCM0rTCYx0Ry9YPWRv+8m9wnMJbIclWughe0Qb/hXmb8VjwHGTWpXIIJm
         AiZlIL2DTkediNlJskFIWS41cVhuVsjyLpdE/SynQf6Ru/wWkgoYZIvAXR5viWoBQ00V
         NbbKTKpR+aaZTwi5QWUoZD9OZCFyPuNau5HYDvh6VetIV+ILJUt9oVStzV2iMAm2ZDd3
         F/0Wczs512pF83P/YKy4JtE8ZM9EpZOmKlU2oVbgxnahrBiuMXpKK9E7f1LwPEAFVoWi
         GhlXuVWWrhKdwqhMgNg3lxkm/QnUUTHC/fFVSHZii2tXtu2SoJSr2FUUvpnbsa6+16Qm
         trvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=PLyMEMUtWWHmGTQnNne8rTCXzLtrmwfee1Jte6/N6K4=;
        b=pIr1W3RcKJKB5dQwfAOjhUlnMb8kvjN3MNed7SjmGYZwPIliwmF1/Y4NtK8/p44gcY
         G2C2JXt1IT+t8UufiolMAghAvnT7JAk6pje8CtiDIxVih/dsTnBVXC46Vb5/aA2OZAS5
         CmUXixfdNv3swVMxNeU8mKdXqZGhOmpG/O4SN+nJDuSAISVA+ZtUWdyRjrjgjJaDAVab
         xb1qE0rWMx/3UXuTMjv0YQZmVlgXhU1qN9gRrl3b74Vzb9kf8v4gVJmYMF/5qeDkJ2th
         AcijV7n+NJ+UiRzs5W1abJensafzFvkULj1s8v9N+TwhcEaXNF2GdSKSazY49udT5MsK
         icIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZGlRATDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si3202433qkm.92.2020.05.11.05.19.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 05:19:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZGlRATDO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY7Pa-0005ow-JM
	for alex.bennee@linaro.org; Mon, 11 May 2020 08:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY7PS-0005ns-7b
 for qemu-arm@nongnu.org; Mon, 11 May 2020 08:19:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25097
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY7PR-0001re-Ev
 for qemu-arm@nongnu.org; Mon, 11 May 2020 08:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589199588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLyMEMUtWWHmGTQnNne8rTCXzLtrmwfee1Jte6/N6K4=;
 b=ZGlRATDOCnkCxUz7M9qdkIDqfhJmqlB3OowXwBGzMK2XnT1P+F7RwLt3hfYkTyPbXputiF
 7hgmC5m5eUvY/It+5b3kkI+UbNQ7wHLjiDojHh+MZaGpwYHiVx6wlh0Q0deMB51KbndXQ0
 uHh1jkZiLMlGRs+SLcQSUo7uPCxr1V0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-G5Cvj8_aNeCg3s4CaWag8g-1; Mon, 11 May 2020 08:19:45 -0400
X-MC-Unique: G5Cvj8_aNeCg3s4CaWag8g-1
Received: by mail-wr1-f71.google.com with SMTP id d16so5139202wrv.18
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 05:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PLyMEMUtWWHmGTQnNne8rTCXzLtrmwfee1Jte6/N6K4=;
 b=BNwP4GWGTYhKpiZpp+CJzLoqlp8R5YKl1T/6MWWwhr+X+XsxarfahnmPxFQBTATH+O
 GND70us2lBBTtyqupKW64csJww7ipDB/urdhDMm8uSdfwPl6W7PI3sG57mi7ZtElATuP
 Y+8KjmBG+61VsCkfZte45OPF3vvyCZTjnojUa7Ncn9sWGGKxwphrmevnPlqU476WnvZY
 zc+TIU6B7MV83hGWH3cwJ5/C6m8YGseCfcK2LAqRw5HlHNcWEsYWGIt6IXz6aNx1uiaf
 8effZZ6tn+XNdtFuOJWzTgQQ0m7yeByZ7ZCug8G024wHUvwzOUA6zhVtDsT++wv18qU6
 Zr6g==
X-Gm-Message-State: AGi0PuZ0DQG0C+l1TdPOAMfUbBJWMDVNcfp8mtVHrpbUk65PcrTT1nIg
 XWpVJpsq4JviMJwNgrCHA4WP5leaBlY1/4hjOV+qXiRYkkZL4BHCRo2VYVa5BYTZtz/UQEkMXKT
 sA1mn6ZmqnjsC
X-Received: by 2002:a5d:534e:: with SMTP id t14mr18431977wrv.15.1589199584136; 
 Mon, 11 May 2020 05:19:44 -0700 (PDT)
X-Received: by 2002:a5d:534e:: with SMTP id t14mr18431959wrv.15.1589199583962; 
 Mon, 11 May 2020 05:19:43 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id a12sm16995644wro.68.2020.05.11.05.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 05:19:43 -0700 (PDT)
Subject: Re: [PATCH v3 0/5] target/arm: Restrict TCG cpus to TCG accel
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200504172448.9402-1-philmd@redhat.com>
 <CAFEAcA_kV8HzHv3xuPRPMKC4JwH8BDfskWqwtDJ=tHMVt0i_Gg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bacd7700-9890-5685-3022-370e4490a5ce@redhat.com>
Date: Mon, 11 May 2020 14:19:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_kV8HzHv3xuPRPMKC4JwH8BDfskWqwtDJ=tHMVt0i_Gg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 02:55:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LL2SWPYXeylC

On 5/11/20 12:48 PM, Peter Maydell wrote:
> On Mon, 4 May 2020 at 18:24, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> These are the uncontroversial patches from "Support disabling
>> TCG on ARM (part 2)"
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html
>>
>> The other patches are blocked by the "accel: Allow targets to
>> use Kconfig" series:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg689024.html
>>
>> Patch #4 is new "Restrict v8M IDAU interface to Aarch32 CPUs".
>>
>> Since v2:
>> - Fixed set_feature() clash trying to KISS
>>    https://www.mail-archive.com/qemu-devel@nongnu.org/msg697523.html
>> - Fixed aarch64-linux-user build failure reported by Peter:
>>    https://www.mail-archive.com/qemu-devel@nongnu.org/msg699319.html
>>
>> Since v1:
>> - Dropped 'Make set_feature() available for other files' patch
>>    which fails to build with KVM only, see:
>> https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg03843.html
>>
>> Many thanks to Richard Henderson for his patience (again...)!
> 
> 
> 
> Applied to target-arm.next, thanks.

Thanks :)

> 
> -- PMM
> 

