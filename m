Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2469190ejb;
        Sun, 3 Dec 2023 20:50:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE32NQahR2bg5pIHaqW2XmEuUBVvd1HZXO7qHXOfH+b1GBLZs9LUwE5ktGlNwMebP35RXLy
X-Received: by 2002:a0c:f710:0:b0:67a:d303:2851 with SMTP id w16-20020a0cf710000000b0067ad3032851mr16492qvn.27.1701665418173;
        Sun, 03 Dec 2023 20:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701665418; cv=none;
        d=google.com; s=arc-20160816;
        b=WxtgRj8Za+5SIIv9BE+P9FVlJEOm6/sJmLRvObLrdHAH5z+bPo1Co8h4xNc0/5Wg+I
         f7mVQ5CR0uOxQVfFvo9HIMj0kWJua/SworEV8KoJxBN+mVrHtEDRdRctdGbHGfiL4dgT
         //xusdVv9s/d9clKFmpJEvgh5P3pJiYJFMPAxICfAu00mAJe9yerU1jMpg4ODJ/eI7Y2
         ILQbT6hCHCCnuatBnwMIymFlsrZJMY3TmUfcu012FvFJMT6H44wTW2rhUA7cyNXq3POM
         12ERUJQfKn9/NVtdiGw9my+gLam0dSDh+67qkAD9q8aRSubD48zSRYprGNVTlHzkPpM4
         F0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aHi8jS8/G9/E7Rhvlw38r/XKq7RFES+CoFQhzovYdiY=;
        fh=7ioxn6LWsCzgGR12WMVU/wASROmAygH/3PvRDFKIzPw=;
        b=dbfkSyiBbDYoKzvY8wvqKyWflvgtmCffpdjdJ0bveklpHGhxekaVFe+wkPgKJCyAuY
         9VcwZ3I/ce2UWA6KwxBt9a0RkxNSgQRLP98K0whzxGIRS8TB58LO7+vQttzAZpFRcsfc
         jtSmKYw+h6d5sl7XFedItChb6OT3go5+j1V30ycbLKFkWLOsZ4zFh8fF/SsLBwi7p6uF
         3cwi/no3WmFjCoIkp+KQQ1eX/o7bCtBFLL/9/bBe5bACwW9JtCPLKzmkgNFMgY0ESbaH
         1OgSNKDFhrbpPjsJdgOXIWrC+37b/tgfER6E89sg8sZSQ+i49MXIfqrcRhe0nQnTtXqw
         folA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PRCDNO39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9-20020a0cf749000000b0067a96a2b4dcsi7090565qvo.21.2023.12.03.20.50.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 20:50:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PRCDNO39;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rA0tw-0000oS-1l; Sun, 03 Dec 2023 23:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0tv-0000mP-3C
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0tt-00041z-QH
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:49:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701665385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aHi8jS8/G9/E7Rhvlw38r/XKq7RFES+CoFQhzovYdiY=;
 b=PRCDNO39KEhZfInqDct8t2rgIDUA4yqk7a9vBJnadT4C9HKbt0F37Vipey55H+HnSvDO5B
 0OCY0ca51YFhdLpXS8h1Iv9+vMlfpk+0nf3vZtJQ6mZ1z5JOrVqlJyhZAu/aT7UR9AqQ8f
 y3uZ/6mDdtRIii8/afWR/5ku7HxQfaA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-dTgDqbaqN9293nFX0ZT4ag-1; Sun, 03 Dec 2023 23:49:38 -0500
X-MC-Unique: dTgDqbaqN9293nFX0ZT4ag-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1d079538940so15115975ad.3
 for <qemu-arm@nongnu.org>; Sun, 03 Dec 2023 20:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701665378; x=1702270178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aHi8jS8/G9/E7Rhvlw38r/XKq7RFES+CoFQhzovYdiY=;
 b=GNb2KahjfIHdndwV5RG122ypTpcGaBgwGWSWHTjxblUvgKGzF94mwK2y1eGg+qDVzd
 IzfFSZbf8LGNfXQbFUfudnnkQbNMhfvd7B8KUmVt7mX7gPIBJK4p/PMvyWhLAgAK4LcN
 /4ac/obHqgg6cyU9qiHJXB4gJOUiLfkGzs1/VxKNKwJBIO8yN4AzwI7EZhCeq61wW4Ri
 cO5YYZHAGEk97mX+J3LDI1e3XziJ9ES2gE+04kJhawpMNHkFmAX2CegUVFS1Lr/2g9OK
 /36DsQYd0gILLG/+kZhanws3eLOn7bsSmbr0cjztAs5vA1mzt8DUTI7ElKq6szxC62Wu
 IT2A==
X-Gm-Message-State: AOJu0YwgX6OspMF5Zi+V6/DZt6e1STErmLL2Jc4wuLTmMsJ6IqgG2MVu
 kfIyvo5jdJj1zByZgN3T7Rj8V9nmkij0rUrVtsN4aayCBxXgoLpd+ATSMC9TxRZWTOEbDA0K34y
 aD4PfNYFHo2pW
X-Received: by 2002:a17:902:e74f:b0:1d0:b503:2edb with SMTP id
 p15-20020a170902e74f00b001d0b5032edbmr123572plf.69.1701665377839; 
 Sun, 03 Dec 2023 20:49:37 -0800 (PST)
X-Received: by 2002:a17:902:e74f:b0:1d0:b503:2edb with SMTP id
 p15-20020a170902e74f00b001d0b5032edbmr123561plf.69.1701665377557; 
 Sun, 03 Dec 2023 20:49:37 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.20.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 20:49:37 -0800 (PST)
Message-ID: <33402763-5c3c-4804-bffb-819a61e1e6f5@redhat.com>
Date: Mon, 4 Dec 2023 14:49:32 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 08/25] memory: Have
 memory_region_init_rom_device_nomigrate() return a boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-9-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-9-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: MQcqH8h+WHAC

On 11/21/23 07:32, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have cpu_exec_realizefn()
> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/memory.h | 4 +++-
>   system/memory.c       | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 

s/cpu_exec_realizefn()/memory_region_init_rom_device_nomigrate()

Reviewed-by: Gavin Shan <gshan@redhat.com>

