Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2474836ejb;
        Sun, 3 Dec 2023 21:06:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHk+ALbbOBCSuna9V1P7owW9vaCdHc6X6g18VwUwij0T9VUVnGt8SNlyXXrV4tPNyfAOFjf
X-Received: by 2002:ac8:6603:0:b0:423:b498:b1a1 with SMTP id c3-20020ac86603000000b00423b498b1a1mr4598026qtp.6.1701666418856;
        Sun, 03 Dec 2023 21:06:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701666418; cv=none;
        d=google.com; s=arc-20160816;
        b=qz87aMqriNPRXPtsvIn5/yL5AcgmMI8WLlSqnyRHoRjsk1Z1Kc4ymIr1qqYDPGOByb
         J/kDGR9JPVmEi8HMzWYb7hArm3yYoLFn3cPcb41oE9zd4vEV5UQqwPJzsGz0OyfBd5KC
         0PjKumYxeG59rsj4bvKCDwqk5o0dOCctczIq/Z2NrgzCoPThImG+LHdTCbJZIW/RJERM
         MtNx9Voc51SsCWpdrnfnE+OHtVep6Aur62cxvaYEcDuBsu5J097J2EAPGneUO7HD73n0
         xoKYFBxIY2s+v0Oo3cKPU8yaLyZRQgUPPPnLNNMSHC8/9AMxib4Op5yuHQ1FDJ/XbuVH
         d8cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UZq2v+FtG3wM+wjlS7ZD9iX9qkh+sFO3YmNweXM0DXE=;
        fh=wFkJj0K7dcTyf89Q0UaT72ax368MUrudOH4eHZ73huE=;
        b=juAY7QjkYU1jD/A77tpdS2qipMT1amY+AIRquTE+DevfgnI9ukmRP5ZXmH4ObFUYQ1
         WciVW0o7tEEw4gvrY1BiWR+FYgl7svdsT8qJtjh0aIlS45+ct1Ghgsuaq4jIDtF/MbZl
         w1FmDMtRy/MWLcUnYkflKWoBIbx6se6WmVEYouk5gHOXy5Zjqv17hrGVb2G6iuuxoryh
         OyAEVhG4GD36ZIHrMKAHZHjoo1doiYtvkfHhVFnTmMCyfKUoCg4JwSrpePZIXwH8KxDC
         jWm349CSLGFSYkB25svm8AlJEE11QrlxhBywbW188rb198Euv8ySdnwCocyQtFdfdvWT
         UajQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HxYQ4hTW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2-20020ac84b42000000b004237834be18si8225553qts.716.2023.12.03.21.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 21:06:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HxYQ4hTW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rA1AA-0005pn-Px; Mon, 04 Dec 2023 00:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA17O-0004H2-Bi
 for qemu-devel@nongnu.org; Mon, 04 Dec 2023 00:03:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA17L-0001og-K8
 for qemu-devel@nongnu.org; Mon, 04 Dec 2023 00:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701666219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UZq2v+FtG3wM+wjlS7ZD9iX9qkh+sFO3YmNweXM0DXE=;
 b=HxYQ4hTWBe3k1cV1FAQr1uiuI7cdRrY5+5FdMObgT3qPuiYZCqYw2ir7bWyTlXyTB4duWB
 GsGO9cJg68/HUvhcHCDO8OEvvas1v7dxYJadp7DHnNl17VT5LEPmWtfrJSAa6ke4d6HOC2
 Ffg/jdo6h7HfRJ/CBYDHh3tK/B9L7ko=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-seNfaLdyOyygdODv9CGfTQ-1; Mon, 04 Dec 2023 00:03:37 -0500
X-MC-Unique: seNfaLdyOyygdODv9CGfTQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1d09caea9e3so2690315ad.1
 for <qemu-devel@nongnu.org>; Sun, 03 Dec 2023 21:03:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701666216; x=1702271016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UZq2v+FtG3wM+wjlS7ZD9iX9qkh+sFO3YmNweXM0DXE=;
 b=wBeB9lsw4Ux3J4cqmetp0URZ2uKU7OFX4gC0zsG/Up24J/DOGanqqmO7Ndkf4f4c1O
 B9/CShwxukbexxvHZFGmUdOwuyRBO/1K03XxeAVlDFeEqvFT4XmEdaOjifgooHNWeE1v
 xd0UaxhlkVuKgHXusgn9aZ/G4Rin4kgfbctSpwQ6zNcmKec9ywGgQ2YfNSmxsT+iwxfe
 htfD8QQVl0LH3t2N3hj1vtgAcI6FkY35LBdO3ID2/tIqxrn2tDxICi0Mfwgh+GQLfP5V
 DUpGjjXLyTRxhS3af27IkI+KeQNPGqRORumUdbavJYdo4bq5oDwPCP2xY+0xnmQ57fna
 lJZg==
X-Gm-Message-State: AOJu0YwC1LEWd76rVKpi912MbwavU3L8NcrpAGvkIVIYNAwWsExIB6ET
 wmIB/MCVauwar++fDtECkOPraCw2LeCK+TdHfIRpWGDKUgt8lBHkUuFUvWYuqjYeqnbElc6grPE
 qzg5vOo5LyYfZLnvOdgFhR/s=
X-Received: by 2002:a17:902:db04:b0:1d0:7adc:1af0 with SMTP id
 m4-20020a170902db0400b001d07adc1af0mr707957plx.35.1701666216426; 
 Sun, 03 Dec 2023 21:03:36 -0800 (PST)
X-Received: by 2002:a17:902:db04:b0:1d0:7adc:1af0 with SMTP id
 m4-20020a170902db0400b001d07adc1af0mr707951plx.35.1701666216120; 
 Sun, 03 Dec 2023 21:03:36 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.21.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 21:03:35 -0800 (PST)
Message-ID: <22c0650d-40a8-464a-9739-8f31815c2027@redhat.com>
Date: Mon, 4 Dec 2023 15:03:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 25/25] hw/pci-host/raven: Propagate error in
 raven_realize()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-26-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-26-philmd@linaro.org>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 67OJVggco8xc

On 11/21/23 07:32, Philippe Mathieu-Daudé wrote:
> When an Error** reference is available, it is better to
> propagate local errors, rather then using generic ones,
> which might terminate the whole QEMU process.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pci-host/raven.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

