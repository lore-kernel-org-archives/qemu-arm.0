Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp529011ejy;
        Tue, 21 Nov 2023 06:59:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWuvA9omitvDrGIW7rkIey8PBPmPSj3QprOWkKjYQ7pOiJcmk+Nut9PiONlbRP0yvDytxd
X-Received: by 2002:a05:6214:1d23:b0:671:b379:525e with SMTP id f3-20020a0562141d2300b00671b379525emr14710144qvd.32.1700578747111;
        Tue, 21 Nov 2023 06:59:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700578747; cv=none;
        d=google.com; s=arc-20160816;
        b=u0gIKyzKrUXm6SDxQZZ3NwpwVuB+5KF1PCbUxhZYfRy46c8VIF2qNkoYaQ+SFX6xOj
         EdtpZYdhR/ZAo6EbomzDZXuITstY5RJBU+QMdvzFzTgJZ/qjtiXpGYk12HhOM/NoAgHY
         FXi0y/rRtVYz1s/MvMWumBOntM3ItmeQUm4VNgUKEcaBMFXvM7utnGQwGCX3xSHPLHAs
         zF10eHdb+N7O9mMeTkTJq/JyLp/irCngRwFOm/QLBlF58Ss8eM+ihhuZ4nA6f38PlB+d
         keUxuwau4LQQ6mw+7x9yw+tobp5nsT2BzPMgiNvc+J87mVRoZa9457HSdWnJ4sJgisyV
         gcbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=RerJgdOrzorlW1VOI9VsWdsDBVd7zqQT2kYSzij5YCo=;
        fh=CsdiWNFHKpDi85bv+LYNHOHQERFxFhU1c1y9HbqB3eA=;
        b=OQTTVpzYvFSx+sluen+ozr5psb0t5wIyZSE83Ce4E/FXLZqe58x1Rcgk9VLX/4byZ9
         17eFLr3UXdbnl+QwpGNTS1eFjs7LpmGBNvAb3NiIjIlAIYlFfJrLZ3MfX8pjAxuDx9X6
         OPKHRrh9v7Qrby9/bFKzAAu97rMHJIPCqCUtXVxSLPcVG7XY44SdokJOLGvv3dW1t8m9
         sAY9YqhxjVF2srA//sTF3bDGDoDlUUCzos+RiQB5cHB/h1FM61RzJSq66fKHs7qu5HD5
         jEEqQ3VGBgRdPwfvOEgK2qHZ68Ui+5qH8Ms+TjzP1Eh3BNRHstOySF8SvMYz1Pe20L5t
         9X0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b1jIPQq6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a0cec11000000b0065d8846dd43si9255152qvo.192.2023.11.21.06.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 06:59:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=b1jIPQq6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5SDC-0005Ix-Jv; Tue, 21 Nov 2023 09:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SDB-0005IK-4V
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 09:58:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1r5SD9-0003uR-NE
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 09:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700578727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RerJgdOrzorlW1VOI9VsWdsDBVd7zqQT2kYSzij5YCo=;
 b=b1jIPQq6ZwhCCj2F0A6llTw/viuJ9UNbh9UMDhk7lDDu6fZtXV60P+LWIAyB28CBeUgfcP
 hnxIWIsayApu4ahqUiR6oQQ5D+3F9k90+u3bTDutHCptCyhR4EKi4hm7MeUPJGZDwff8wH
 2KlLnu2FEy+5o07RJtYJOOkyVzDcCL0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-2tgbY6FPMzKe7J2_O9xg5w-1; Tue, 21 Nov 2023 09:58:43 -0500
X-MC-Unique: 2tgbY6FPMzKe7J2_O9xg5w-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-677fb270eacso10367086d6.1
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 06:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700578723; x=1701183523;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RerJgdOrzorlW1VOI9VsWdsDBVd7zqQT2kYSzij5YCo=;
 b=DmlspSyuOhhvN6YZWD5var/TV4JsQxhBDpV00sYUr7sWVyWzvSX7W0iqyHRpF5pp/E
 HMEa9XPvRwhtjKLxcphkrIv5OtakanNoqIJFFu5hJ4NYai5nOV8i+hnTXhwfgnFXKpwu
 LGeAmpNalD+bf8bNMSk6YRjovJ0Ywlv/6DokjrdZJDWk9DOG9D+UY21hXFcwVoD+F8f/
 g0s5CWCPj3P1r14Eey8OtGvOG4F2iFhidSSuL4k2vZckMyMzQkOpSDDnDFDBZBmkFe6Y
 Rt2qisOASLYq04PPnnaOY71zQ8tFuKgZ3Bm6gmpIr0Il45a5rjhPHm5JnWYwTDNAdV/g
 UYRw==
X-Gm-Message-State: AOJu0YxKqxEm8fC/fVqgv7H8WMTNGCj34IVr0/SUnlRl+rgDFvurSQ9B
 KiOZJkZBZH6B9Ak22+oCJvBiy1nRvOODQy94ZUxXBJYxGe3L2Kmqech+fgAzm4ctaq005eEZs2j
 vrTn4GqXaAluH
X-Received: by 2002:a0c:e704:0:b0:679:da0f:538d with SMTP id
 d4-20020a0ce704000000b00679da0f538dmr6450195qvn.5.1700578723054; 
 Tue, 21 Nov 2023 06:58:43 -0800 (PST)
X-Received: by 2002:a0c:e704:0:b0:679:da0f:538d with SMTP id
 d4-20020a0ce704000000b00679da0f538dmr6450174qvn.5.1700578722837; 
 Tue, 21 Nov 2023 06:58:42 -0800 (PST)
Received: from x1n (cpe688f2e2cb7c3-cm688f2e2cb7c0.cpe.net.cable.rogers.com.
 [99.254.121.117]) by smtp.gmail.com with ESMTPSA id
 n8-20020a0cee68000000b0065afbb39b2dsm4036246qvs.47.2023.11.21.06.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 06:58:42 -0800 (PST)
Date: Tue, 21 Nov 2023 09:58:40 -0500
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH-for-9.0 06/25] memory: Have memory_region_init_ram()
 handler return a boolean
Message-ID: <ZVzFoFp8J6TJ1aeJ@x1n>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-7-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20231120213301.24349-7-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: SFJzhTkyoAib

On Mon, Nov 20, 2023 at 10:32:40PM +0100, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have cpu_exec_realizefn()

(same)

> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

