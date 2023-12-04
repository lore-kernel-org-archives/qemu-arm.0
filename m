Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2470246ejb;
        Sun, 3 Dec 2023 20:54:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrnt10h4oy9aSTYqo6skNdSuKKrOBsVlsRNIeiRahndtoTwsoDjJgDSTRNLSv0s+fJpYaV
X-Received: by 2002:a05:6214:29c3:b0:67a:8e2d:6092 with SMTP id gh3-20020a05621429c300b0067a8e2d6092mr3935033qvb.4.1701665647394;
        Sun, 03 Dec 2023 20:54:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701665647; cv=none;
        d=google.com; s=arc-20160816;
        b=l6MYH3WMvfOE40HZ/XXrvrBgKv5eulKN3OeDjmwiXXTvZ0BKk3Kb2WVpe8DP1mJcTz
         BNewGEMjf9o6Uvmpd/I1wpMV/6Zu+eHbbMP/IniTaJTDUjtQHYoIZbv4Z5rBtWKb8Vsc
         gbuND/YuF1Gb6eybBEWyLiJGQxku1No1gsdLnHhH4W0FT8ryj+mEJ/S4OTGlxICXuCnR
         NfaXkWs56J3yHDJHzPSX0T65l4z39wtQD9H/YOB37PDLjm9m0ooufydhxM6EAqUXIUoR
         /5Nrh0SyTDL/sHI9GcGOoNEsac4AT5+gtd6vjPL1/3MhmPeOuj7vJaJJoGswEyhvmkrB
         V54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gbEawc7USmtnp14plmlC0rvvHbMjnG4ZLzYRjmxUA7k=;
        fh=7ioxn6LWsCzgGR12WMVU/wASROmAygH/3PvRDFKIzPw=;
        b=SLDE3r1jd3yMVVQrWVJ9lXtL6u36JSAyMQ2zKhV1yTOJfheq8SXagEKbQWrO7B/ShE
         PG9S1U9tDx/tAL3BZu6cBMZCyWt21mYQ2gp2izTnDZrqp99fAc+Nh3hmNJ0BN7VYu5Ui
         FG/HlyxRNQ/lYEv+/pLHxMr36fYMWZaO+GBfiM6GyLl1xj2Ep8HU8RXtnBtrxhXHK0+3
         w5+kQ/vOJFCZgNE9+yGF0/jFLDdwYa/Sce5ApDiAvHfh0od8teNjE6Hht8zbS7fSdswR
         vMvqk9odvNXlds/g+Sg7L339llX1UyrEP1LY62/eM6tGgvy84GtNgTP+gHalnWpVbfvn
         avig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fREqeviQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z29-20020a05620a261d00b0077d95f62af3si9046759qko.544.2023.12.03.20.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 20:54:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fREqeviQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rA0y0-00047s-1K; Sun, 03 Dec 2023 23:54:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0xy-00047I-I3
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:53:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0xx-0004qN-57
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701665636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbEawc7USmtnp14plmlC0rvvHbMjnG4ZLzYRjmxUA7k=;
 b=fREqeviQgFdeIl3jFLO51W9OzKhrJINbv6KUPuxkiFCOvIYDabDuyufx0/+abKZDDG0JYG
 webpA+02pqMaU0pXdHGOv5JR58YrFeItwW4un7+ekNfCMxjPEo2fJwmVe0P2RzQ+j69FGY
 NM7ffquKPzE6SgUID2rS/g1pUErq1Gw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-YveUvcR1O_Wi_9sy8iylMQ-1; Sun, 03 Dec 2023 23:53:55 -0500
X-MC-Unique: YveUvcR1O_Wi_9sy8iylMQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1d0737b7262so4208555ad.1
 for <qemu-arm@nongnu.org>; Sun, 03 Dec 2023 20:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701665634; x=1702270434;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gbEawc7USmtnp14plmlC0rvvHbMjnG4ZLzYRjmxUA7k=;
 b=LySr2xWtloKAuwBh5vheduEoS7FWv6gAKcTmufLqKbiPSpelQvXpv7ijTbaUWJLjUS
 kUsN3ht0/TddA5WEal/C1yaJoEXicRUHhZdMoVeTp7og7cMSetjzyyVrpPCJfI7dZVzR
 Kqa4tIa60LXKYeSkLlDsNccE9iURfQcwbRXgefjKjLFxh4D5U+eq4ieNvgJ1nS5YeTMp
 bfWIZS/rIdDFNvEJ7dqlnoLBTmbTQmAksAEGfXpqqBOPGUTc8UdXbbHqAf1TOYZ30oG+
 YdoXn0Bbrm4VU0kjq40/AGnwVv5Xx8XGTW5eCmVjX69/NurJQxzZPxrEuaCtBTq3WsjF
 wXog==
X-Gm-Message-State: AOJu0YwtKafjBOFdwaV4El4JCLn2HrVMwVwwbI3XCj47/uaHM75vhEzM
 upteULkIz794Ea5ZEXL46RQKf4Mg/jy3nyvf0kBhmx78/zscP55uLl9wPNfjYFsDfR0fxLrb53y
 rOILP9B24Teag
X-Received: by 2002:a17:903:124f:b0:1d0:8613:3cea with SMTP id
 u15-20020a170903124f00b001d086133ceamr926493plh.0.1701665634228; 
 Sun, 03 Dec 2023 20:53:54 -0800 (PST)
X-Received: by 2002:a17:903:124f:b0:1d0:8613:3cea with SMTP id
 u15-20020a170903124f00b001d086133ceamr926488plh.0.1701665633977; 
 Sun, 03 Dec 2023 20:53:53 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.20.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 20:53:53 -0800 (PST)
Message-ID: <5c89221e-b320-4842-9e20-ddd27fe13645@redhat.com>
Date: Mon, 4 Dec 2023 14:53:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 12/25] memory: Have
 memory_region_init_ram_from_file() handler return a boolean
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
 <20231120213301.24349-13-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-13-philmd@linaro.org>
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
X-TUID: F05rdNyKmnU9

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

s/cpu_exec_realizefn()/memory_region_init_ram_from_file()

Reviewed-by: Gavin Shan <gshan@redhat.com>

