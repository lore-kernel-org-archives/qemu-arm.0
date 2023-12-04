Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2467588ejb;
        Sun, 3 Dec 2023 20:44:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvJsUZGTdjChRlh0CuduNlPfNQda6D3gIa1XxeqVaihS5kaq6leSL26HCMzHc+lW+RtVYu
X-Received: by 2002:ac8:5f83:0:b0:423:75a2:331b with SMTP id j3-20020ac85f83000000b0042375a2331bmr6077335qta.59.1701665059262;
        Sun, 03 Dec 2023 20:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701665059; cv=none;
        d=google.com; s=arc-20160816;
        b=ln0ZWMhCJgQlSfAOwjjBx+H/YDaeeWQ9EZw7fjQuyESbtxZgnbfKLWkQLNyfKFDv8t
         WmFXLUsd9QylkRcKU4K7cvVQ3HhyiDmqcbv5bw9IRCkkfVfWbD0ybf1f40RvLKChxwhp
         0Qf/1Da5zV837i+k60LSKrJPsRvIKFhKBOLufMo2MUy8Ve+Mi79HyS96ecX3t9DPC43h
         fQjQTKDooTMXMYxjvsvZNHtexhOsX2gW2REZ7TFSXduK1U31KojbCxhLf/9E/nAi2BTm
         Ij5UZjN7qYdjlIwYS4FDoZFonMJqPjh1I7pgJ/K+TOnlM5e8wBeQRiVOtuOmPQUVNVwa
         0zIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kPMY8kUBOqsmrcelUNCga90ds67VGvp1W/qFKpR9kQs=;
        fh=7ioxn6LWsCzgGR12WMVU/wASROmAygH/3PvRDFKIzPw=;
        b=KU15eZ3F/uImWL5wyDyss/zdLhLtVccGtt5p8c5TH0mBgT4ZgcE7j5MgAAD5f98Y5e
         kQZUo3aoucrumF+BdIwqzraSucBQnb14zDj8AHCkwHBNLDUJqflZcPJdcNSdqvh15pXl
         oU+MQveAivJPOBH0aUo8TeDvooXlqlM97yIQn+dOot3Nc+99Apl8BSjzv7Y1YbSMNgh7
         OuAiueWMEmxwYC/eKYwYEMv7UMFl8uLQxoY2gAl7Wzab59n8jghkvpQDPza05cJTMLKh
         4wDhcmOJJLATXb2Ml9U9UQHd+oZpylD5NB5kFK7oUkgXEgN0UbBNiYbrcIXloazOcMeW
         +lTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WNA4qvXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020ac8068e000000b00423eedcfeddsi8659066qth.474.2023.12.03.20.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 20:44:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WNA4qvXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rA0oZ-0004aB-6K; Sun, 03 Dec 2023 23:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0oX-0004Z7-BS
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:44:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0oV-000851-1G
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:44:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701665050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPMY8kUBOqsmrcelUNCga90ds67VGvp1W/qFKpR9kQs=;
 b=WNA4qvXzl3x55vvqYjLAgVO7o5Lbee3LrItm+q/obvh0UXRgeurlzVOgrYVhGA7Gf8sukc
 p2RaUVBQEwmEmqdzRsVaYzMO0n/gtEyMv18iWcHucpXkh+75+CeHFCYOIG4/ulXp3ofpHa
 p48MTMZ0hImN0Y36MteoQflcqOlbh6A=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-7tbzCQ8fOSyqQMugWCk3tg-1; Sun, 03 Dec 2023 23:44:09 -0500
X-MC-Unique: 7tbzCQ8fOSyqQMugWCk3tg-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1d053953954so13535755ad.2
 for <qemu-arm@nongnu.org>; Sun, 03 Dec 2023 20:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701665047; x=1702269847;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kPMY8kUBOqsmrcelUNCga90ds67VGvp1W/qFKpR9kQs=;
 b=hxT7UBdtJRXBYWsOp8bYQt8BcyRTcofY7RybWIEhxBmc3ZAtY6hAvAaSKm645A9kp8
 +mqRGgBuqZgx2DP46E/o/5YVECkeoF6MO1kDFdtQH1GsnuWvsbFHqeEanwVvcpIODFdH
 EMD5IknLCF4wEhM+DNjmmWexl+Eo5KjcRKQm5+H+Sh0v/bGqhSQv+h795JqIIR2mwnG5
 R9faVnHAcsa0x4A0+Dl+ymsYTsdNPT4q0qlkc+v8V/pRUfr1x5LwP8WVJ0wOb4x8LzpY
 Bjl8fRWIH38tYWgGOPs2t8KxNe8FXOp6oN43F8ekbLqHa6fP4aQxny6qdqJMTgNF2eWz
 kH0Q==
X-Gm-Message-State: AOJu0YxQdh2b49NwAWCnDTWoqojfFVp/RepTvdK+dOvvD/gRzUs8Zv+Y
 /ldaJaQCCVaYHUh9WT0SAxHSjGHg54NpVAnhRafaoTzlO683VOXn3SZRX76nRRZ/UsaeMQ2uAHJ
 2IuXgPNnHNk2y
X-Received: by 2002:a17:902:d5cb:b0:1cc:5a1c:3d94 with SMTP id
 g11-20020a170902d5cb00b001cc5a1c3d94mr1266898plh.18.1701665046946; 
 Sun, 03 Dec 2023 20:44:06 -0800 (PST)
X-Received: by 2002:a17:902:d5cb:b0:1cc:5a1c:3d94 with SMTP id
 g11-20020a170902d5cb00b001cc5a1c3d94mr1266884plh.18.1701665046682; 
 Sun, 03 Dec 2023 20:44:06 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.20.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 20:44:06 -0800 (PST)
Message-ID: <ee2c30ff-0220-4204-821f-73e77520bc46@redhat.com>
Date: Mon, 4 Dec 2023 14:44:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 02/25] memory: Have
 memory_region_init_ram_nomigrate() handler return a boolean
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
 <20231120213301.24349-3-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: 9owK7IHQeO6d

On 11/21/23 07:32, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have cpu_exec_realizefn()
> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/memory.h | 4 +++-
>   system/memory.c       | 5 +++--
>   2 files changed, 6 insertions(+), 3 deletions(-)
>

s/cpu_exec_realizefn()/memory_region_init_ram_nomigrate() for the commit
message, as mentioned by Peter Xu.

Reviewed-by: Gavin Shan <gshan@redhat.com>

